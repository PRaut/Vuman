package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

	@RequestMapping(value={"/"}, method = RequestMethod.GET)
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	
	@RequestMapping(value={"/login"}, method=RequestMethod.GET)
	public ModelAndView signIn(){
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
	
	@RequestMapping(value={"/register"}, method=RequestMethod.GET)
	public ModelAndView register(){
		ModelAndView mv = new ModelAndView("register");
		return mv;
	}
}


