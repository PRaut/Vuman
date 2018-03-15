package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CategoryDaoImpl;

@Controller
public class LoginController {

	@Autowired
	CategoryDaoImpl categoryDaoImpl;

	@Autowired
	private HttpSession session;

	/*
	 * @Autowired private UserDao userDao;
	 * 
	 * 
	 * 
	 * private UserModel userModel = null; private User user = null;
	 * 
	 * 
	 * @ModelAttribute("userModel") public UserModel getUserModel() {
	 * if(session.getAttribute("userModel")==null) { // get the authentication
	 * object Authentication authentication =
	 * SecurityContextHolder.getContext().getAuthentication();
	 * 
	 * 
	 * if(!authentication.getPrincipal().equals("anonymousUser")){ // get the
	 * user from the database user =
	 * userDao.getUserByEmail(authentication.getName());
	 * 
	 * if(user!=null) { // create a new model userModel = new UserModel();
	 * userModel.setName(user.getName()); userModel.setRole(user.getRole());
	 * 
	 * 
	 * session.setAttribute("userModel", userModel); return userModel; } } }
	 * 
	 * return (UserModel) session.getAttribute("userModel"); }
	 */

	/*
	 * @RequestMapping(value={"/login"}) public ModelAndView
	 * signIn(@RequestParam(value="error", required= false)String error,
	 * 
	 * @RequestParam(value="logout", required=false)String logout){ ModelAndView
	 * mv = new ModelAndView("login"); return mv; }
	 */

	// For testing security
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String goToHomePage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		System.out.print("In Login()");

		if (error != null) {
			model.addAttribute("error", "Invalid Email Or Password");
		}
		if (logout != null) {
			model.addAttribute("logout", "You have logged out successfully");
		}

		if (session.getAttribute("productId") != null) {
				ModelAndView mv=  new ModelAndView("singleProduct");
				return "forward:/product/productById/"+(int)session.getAttribute("productId");
		} else {
			ModelAndView mv = new ModelAndView("login");
			mv.addObject("catList", categoryDaoImpl.getAllCategories());
			return "login";
		}
	}

	// Access Denied Page
	@RequestMapping(value = { "/fail" })
	public ModelAndView fail() {
		System.out.println("in fail()");
		ModelAndView mv = new ModelAndView("fail");
		mv.addObject("errorTitle", "403 - Access Denied");
		mv.addObject("errorDesc", "Not Authorised to View this Page");
		return mv;
	}

	@RequestMapping(value = "/logout")
	public String logout() {
		return "login";
	}

}
