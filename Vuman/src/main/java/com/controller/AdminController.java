package com.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		Product nProduct = new Product();
		mv.addObject("product", nProduct);
		return mv;
	}

	@RequestMapping(value = "/saveCategory/cid", method = RequestMethod.POST)
	public ModelAndView saveCategotyData(@RequestParam("cid") String cid, @RequestParam("cname") String cname) {
		ModelAndView mv = new ModelAndView();
		Category category = new Category();
		//category.setCid(cid);
		category.setCname(cname);

		categoryDaoImpl.insertCategory(category);

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
		//supplier.setSid(sid);
		supplier.setSupplierName(supplierName);
		//supplierDaoImpl = new SupplierDaoImpl(); // not supports DI
		supplierDaoImpl.insertSupplier(supplier);
		mv.setViewName("adminAdding");
		return mv;
	}

	// save Product
	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	public String saveProduct(HttpServletRequest req, @RequestParam("file") MultipartFile file) {

		Product product = new Product();
		product.setProductName(req.getParameter("pName"));
		product.setProductDescription(req.getParameter("pDesc"));
		product.setPrice(Float.parseFloat(req.getParameter("pPrice")));
		product.setStock(Integer.parseInt(req.getParameter("pStock")));

		String filePath = req.getSession().getServletContext().getRealPath("/");
		String fileName = file.getOriginalFilename();
		productDaoImpl.insertProduct(product); 

		try {
			byte[] imageByte = file.getBytes();
			BufferedOutputStream fos = new BufferedOutputStream(
					new FileOutputStream(filePath + "/resources/" + fileName));
			fos.write(imageByte);
			fos.close();
		} catch (Exception e) {
			System.out.println("SAVEPROD : "+e);
		}

		return "adminAdding";
	}
	
	//returing all categories to Product form
	@ModelAttribute("categories")
	public List<Category> getCategories(){
		return categoryDaoImpl.getAllCategories();
	}
	
	@ModelAttribute("suppliers")
	public List<Supplier> getSuppliers(){
		return supplierDaoImpl.getAllSuppliers();
	}
}
