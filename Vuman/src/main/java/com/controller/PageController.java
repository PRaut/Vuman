package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CategoryDaoImpl;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;

@Controller
public class PageController {

	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	
	@RequestMapping(value = { "/" },method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("catList", categoryDaoImpl.getAllCategories());
		return mv;
	}
	
}
