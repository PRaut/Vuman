package com.controller;

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
	CategoryDaoImpl categoryDaoImpl ;
	
	/*@RequestMapping(value={"/login"})
	public ModelAndView signIn(@RequestParam(value="error", required= false)String error,
			@RequestParam(value="logout", required=false)String logout){
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}*/
	
	// For testing security
		@RequestMapping(value={"/login"}, method = RequestMethod.GET)
		public ModelAndView  goToHomePage(@RequestParam(value="error", required= false)String error,
				@RequestParam(value="logout", required=false)String logout, Model model){
			System.out.print("In goToHomePage()");
			
			if(error != null){
				model.addAttribute("error", "Invalid Email Or Password");
			}
			if(logout != null){
				model.addAttribute("logout", "You have logged out successfully");
			}
			ModelAndView mv = new ModelAndView("login");
			//mv.addObject("catList", categoryDaoImpl.getAllCategories());
			return mv;
		}
		
		//Access Denied Page
		@RequestMapping(value={"/fail"}, method=RequestMethod.POST)
		public ModelAndView fail(){
			ModelAndView mv = new ModelAndView("fail");
			mv.addObject("errorTitle", "403 - Access Denied");
			mv.addObject("errorDesc", "Not Authorised to View this Page");
			return mv;
		}
		
		@RequestMapping(value="/logout")
		public String logout(){
			return "login";
		}
	
}
