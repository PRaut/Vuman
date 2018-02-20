package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.UserDaoImpl;
import com.model.User;

@Controller
public class RegisterUserController {

	@Autowired
	UserDaoImpl userDaoImpl;
	
	@RequestMapping(value={"/register"}, method=RequestMethod.GET)
	public ModelAndView register(){
		ModelAndView mv = new ModelAndView("register");
		mv.addObject("user", new User());
		return mv;
	}
	
	@RequestMapping(value={"/enrolUser"}, method=RequestMethod.POST)
	public ModelAndView enrolUser(@ModelAttribute("user") User user){
		System.out.println("In enrolUser");
		ModelAndView mv = new ModelAndView("login");
		user.setRole("USER");
		user.setEnabled(Boolean.parseBoolean("TRUE"));
		
		userDaoImpl.insertUser(user);
		mv.addObject("msg", "You are successfully registered.");
		return mv;
	}
	
	
}
