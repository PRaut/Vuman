package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CategoryDaoImpl;
import com.DaoImpl.ProductDaoImpl;

@Controller
@RequestMapping(value="/product")
public class ProductsByCategoryController {

	@Autowired
	ProductDaoImpl productDaoImpl;
	
	@Autowired
	CategoryDaoImpl categoryDaoImpl;

	@RequestMapping(value = "/{cid}", method = RequestMethod.GET)
	public ModelAndView showProductsByCategory(@PathVariable("cid") String cid) {
		ModelAndView mv = new ModelAndView("userProducts");
		
		if(cid != null){
			mv.addObject("productList", productDaoImpl.getProductsByCategotry(cid));
		}else{
			mv.addObject("productList", productDaoImpl.getAllProducts());
		}
		
		mv.addObject("catList", categoryDaoImpl.getAllCategories());
		return mv;
	}
	
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public ModelAndView showAllProducts() {
		ModelAndView mv = new ModelAndView("userProducts");
		mv.addObject("productList", productDaoImpl.getAllProducts());
		mv.addObject("catList", categoryDaoImpl.getAllCategories());
		return mv;
	}
	
	@RequestMapping(value = "/productById/{pid}", method= RequestMethod.GET)
	public ModelAndView showProduct(@PathVariable("pid") int pid){
		System.out.println("PID: "+pid);
		 ModelAndView mv = new ModelAndView("singleProduct");
		 mv.addObject("product", productDaoImpl.getProduct(pid));
		 mv.addObject("catList", categoryDaoImpl.getAllCategories());
		return mv;
		
	}
}
