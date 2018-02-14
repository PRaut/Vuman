package com.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CategoryDaoImpl;
import com.DaoImpl.ProductDaoImpl;
import com.DaoImpl.SupplierDaoImpl;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	CategoryDaoImpl categoryDaoImpl ;

	@Autowired
	SupplierDaoImpl supplierDaoImpl;

	@Autowired
	ProductDaoImpl productDaoImpl;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView adminPage() {
		System.out.println("in adminController constructor");
		ModelAndView mv = new ModelAndView("adminAdding");
		return mv;
	}

	@RequestMapping(value = "/saveCategory", method = RequestMethod.POST)
	public ModelAndView saveCategotyData(@RequestParam("cid") String cid, @RequestParam("cname") String cname) {
		ModelAndView mv = new ModelAndView();
		Category category = new Category();
		category.setCid(cid);
		category.setCname(cname);

		categoryDaoImpl.insertCategory(category);
		mv.addObject("msg", "Category \'"+ cid + " - " + cname+ "\' Added Successfully");
		System.out.println("Category "  + cname + " Added Successfully");
		mv.setViewName("adminAdding");
		return mv;
	}

	// save supplier
	@RequestMapping(value = "/saveSuppliper", method = RequestMethod.POST)
	public ModelAndView saveSupplierData(@RequestParam("sid") String sid,
			@RequestParam("supplierName") String supplierName) {
		System.out.println("in saving product");
		System.out.println("SID: "+sid);
		System.out.println("SNAME: "+ supplierName);
		ModelAndView mv = new ModelAndView();

		Supplier supplier = new Supplier();
		supplier.setSid(sid);
		supplier.setSupplierName(supplierName);
		//supplierDaoImpl = new SupplierDaoImpl(); // not a DI
		supplierDaoImpl.insertSupplier(supplier);
		System.out.println("Supplier Added Successfully.");
		mv.addObject("msg", "Supplier \'"+ sid + " - "+ supplierName  +"\' Added Successfully");
		mv.setViewName("adminAdding");
		return mv;
	}

	// save Product
	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	public ModelAndView saveProduct( @ModelAttribute("product") Product product, BindingResult result,
			@RequestParam("pimage") MultipartFile file,
			HttpServletRequest req) {

		System.out.println("IN save Product ()");
		
//		Product product = new Product();
//		product.setProductName(req.getParameter("pName"));
//		System.out.println("Product Name: "+req.getParameter("pName"));
//		
//		product.setProductDescription(req.getParameter("pDesc"));
//		System.out.println("Product Desc: "+req.getParameter("pDesc"));
//		
//		product.setPrice(Float.parseFloat(req.getParameter("pPrice")));
//		System.out.println("Product Price: "+req.getParameter("pPrice"));
//		
//		product.setStock(Integer.parseInt(req.getParameter("pStock")));
//		System.out.println("Product Stock: "+req.getParameter("pStock"));

		
		String filePath = req.getSession().getServletContext().getRealPath("/");
		System.out.println("REAL PATH: "+ filePath);
		
		String fileName = file.getOriginalFilename();
		System.out.println("FILE NAME: "+ fileName);
		
		product.setImageName(fileName);
				
		try {
			byte[] imageByte = file.getBytes();
			BufferedOutputStream fos = new BufferedOutputStream(
					new FileOutputStream(filePath + "\\assets\\images\\" + fileName));
			System.out.println("NEW PATH: "+ filePath + "\\asset\\images\\" + fileName);
			fos.write(imageByte);
			fos.close();
		} catch (Exception e) {
			System.out.println("Ex in SAVEPROD : "+e);
		}
		
		// SET Category into Product
		System.out.println("SELECTED CATEGORY: "+ req.getParameter("category"));
		Category category = new Category();
		category.setCid(req.getParameter("category"));
		product.setCategory(category);
		
		
		//SET Supplier into Product
		System.out.println(req.getParameter("supplier"));
		Supplier supplier = new Supplier();
		supplier.setSid("SELECTED SUPPLIER: "+req.getParameter("supplier"));
		product.setSupplier(supplier);
		
		productDaoImpl.insertProduct(product); 
		
		ModelAndView mv = new ModelAndView("adminAdding");
		mv.addObject("msg", "Product Added Successfully");
		System.out.println("Product Inserted Successful");
		return mv;
	}
	
	
	// return supplier model to admin page
	@ModelAttribute("supplier")
	public Supplier getSupplier(){
		return new Supplier();
	}
	
	//return product model to admin page
	@ModelAttribute("product")
	public Product getProduct(){
		return new Product();
	}
	
	//return category model to admin page
	@ModelAttribute("category")
	public Category getCategory(){
		return new Category();
	}
	
	
	//returing all categories to Product form
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return categoryDaoImpl.getAllCategories();
	}
	
	//returing all supplier to Product form
	@ModelAttribute("suppliers")
	public List<Supplier> getSuppliers(){
		return supplierDaoImpl.getAllSuppliers();
	}
}
