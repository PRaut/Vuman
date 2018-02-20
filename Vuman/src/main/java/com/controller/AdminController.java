package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
import com.util.FileUploadUtil;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	CategoryDaoImpl categoryDaoImpl ;

	@Autowired
	SupplierDaoImpl supplierDaoImpl;

	@Autowired
	ProductDaoImpl productDaoImpl;
	
	private String ABS_PATH = "F:\\JAVA_WORKSPACE\\Vuman\\Vuman\\src\\main\\webapp\\assets\\images\\";

	@RequestMapping()
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
		
		ModelAndView mv = new ModelAndView("adminAdding");
		
		String filePath = req.getSession().getServletContext().getRealPath("/");
		System.out.println("REAL PATH: "+ filePath);
		
		String fileName = file.getOriginalFilename();
		System.out.println("FILE NAME: "+ fileName);
		
		product.setImageName(fileName);
				
		// File upload
		FileUploadUtil.uploadFile(file,ABS_PATH, filePath, fileName);
		
		// SET Category into Product
		System.out.println("SELECTED CATEGORY: "+ req.getParameter("category"));
		Category category = new Category();
		category.setCid(req.getParameter("category"));
		product.setCategory(category);
		
		
		//SET Supplier into Product
		System.out.println("SELECTED SUPPLIER: "+req.getParameter("supplier"));
		Supplier supplier = new Supplier();
		supplier.setSid(req.getParameter("supplier"));
		product.setSupplier(supplier);
		
		if(product.getPid() == 0){
			System.out.println(product.getPid() + " in insert product block");
			productDaoImpl.insertProduct(product);
			mv.addObject("msg", "Product Inserted Successfully");
			mv.addObject("product", new Product());
			System.out.println("Product Inserted Successfully");
			}else{
				product.setPid(Integer.parseInt(req.getParameter("pid")));
				System.out.println(product.getPid() + " in update product block "+ req.getParameter("pid"));
			productDaoImpl.updateProduct(product);
			mv.addObject("msg", "Product Updated Successfully");
			System.out.println("Product Updated Successfully");
		}
						
		
		return mv;
	}
	
	@RequestMapping(value={"/manageProducts"}, method= RequestMethod.GET)
	public ModelAndView manageProducts(){
		List<Product> productsList =  productDaoImpl.getAllProducts();
		ModelAndView mv = new ModelAndView("adminManageProducts");
		mv.addObject("productList", productsList);
		return mv;
	}
	
	// ######################### Product operation ###############
	
	@RequestMapping(value="/deleteProduct/{pid}")
	public ModelAndView deleteProduct(@PathVariable("pid") int pid ){
		ModelAndView mv = new ModelAndView("adminAdding");
		Product product = productDaoImpl.getProduct(pid);
		productDaoImpl.deleteProduct(product);
		
		//mv.addObject("msg","Product "+ pid + " Deleted Successfully");
		mv.addObject("productList", productDaoImpl.getAllProducts());
		System.out.println("In Delete Product");
		return mv;
	}
	
	@RequestMapping(value="editProduct/{pid}", method= RequestMethod.GET)
	public ModelAndView editProduct(@PathVariable("pid") int pid){
		ModelAndView mv = new ModelAndView("adminManageProducts");
		
		Product lProduct = productDaoImpl.getProduct(Integer.valueOf(pid));
		mv.addObject("product", lProduct);
		mv.addObject("productList", productDaoImpl.getAllProducts());
		
		//mv.addObject("msg", "Manage Product");
		
		return mv;
	}
	
	
	
	// ########################## BEANS required for Spring Form and Other ############## 
	
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
	
	
	//returning all categories to Product form
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
