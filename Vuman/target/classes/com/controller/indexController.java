package com.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class indexController {

	@RequestMapping(value="/")
	public String indexController(){
		return "index";
	}
}
