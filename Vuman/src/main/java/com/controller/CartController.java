package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CartDaoImpl;
import com.DaoImpl.CategoryDaoImpl;
import com.DaoImpl.ProductDaoImpl;
import com.DaoImpl.UserDaoImpl;
import com.model.Cart;
import com.model.Product;
import com.model.User;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	ProductDaoImpl productDaoImpl;

	@Autowired
	CartDaoImpl cartDaoImpl;

	@Autowired
	UserDaoImpl userDaoImpl;

	@Autowired
	CategoryDaoImpl categoryDaoImpl;

	@Autowired
	private HttpSession session;

	/*
	 * @RequestMapping(value = { "/addToCart/{pid}" }, method =
	 * RequestMethod.GET) public ModelAndView addToCart(@PathVariable("pid") int
	 * pid) {
	 * 
	 * System.out.println("ADD TO CART PID " + String.valueOf(pid));
	 * 
	 * Authentication auth =
	 * SecurityContextHolder.getContext().getAuthentication(); String email =
	 * auth.getName(); System.out.println("User :" + email);
	 * 
	 * if (email.equals("anonymousUser")) {
	 * System.out.println("in if add TO cart"); ModelAndView mv = new
	 * ModelAndView("login"); // mv.addObject("msg", "You are not logged in ..
	 * Kindly Log in // first."); session.setAttribute("productId", pid); return
	 * mv; } else { System.out.println("in else add TO cart");
	 * 
	 * //System.out.println("User Quantity : "+ qty);
	 * 
	 * ModelAndView mv = new ModelAndView("cart");
	 * 
	 * // Get User User user = userDaoImpl.getUserByEmail(email);
	 * 
	 * // Get Product Product product = productDaoImpl.getProduct(pid);
	 * 
	 * Cart cart = new Cart(); cart.setCartProductId(product.getPid());
	 * cart.setCartProductName(product.getProductName());
	 * cart.setProductStock(product.getStock());
	 * cart.setCartPrice(product.getPrice()); cart.setCartQty(1);
	 * cart.setCartImage(product.getImageName()); cart.setUser(user);
	 * //cartDaoImpl.insert(cart);
	 * System.out.println("Product Inserted into cart Id: " + cart.getCartId());
	 * 
	 * List<Cart> cartItems = cartDaoImpl.findCartById(user.getId());
	 * 
	 * mv.addObject("catList", categoryDaoImpl.getAllCategories());
	 * mv.addObject("cartItems", cartItems);
	 * mv.addObject("forward:/cart/showCart"); return mv;
	 * 
	 * } }
	 */

	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)
	public String addToCart(@RequestParam("pid") int productId, @RequestParam("qty") int qty) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		System.out.println("User :" + email);

		if (email.equals("anonymousUser")) {
			System.out.println("in if add TO cart");
			ModelAndView mv = new ModelAndView("login");
			mv.addObject("msg", "You are not logged in .. Kindly Log in here");
			return "login";
		} else {
			System.out.println(productId + " *********** " + qty);
			ModelAndView mv = new ModelAndView(); 
			User user = userDaoImpl.getUserByEmail(email);
			Product product = productDaoImpl.getProduct(productId);

			Cart cart = new Cart();
			cart.setCartProductId(product.getPid());
			cart.setCartProductName(product.getProductName());
			cart.setCartProductDesc(product.getProductDescription());
			cart.setProductStock(product.getStock());
			cart.setCartPrice(product.getPrice());
			cart.setCartQty(qty);
			cart.setCartImage(product.getImageName());
			cart.setTotalPrice(qty*product.getPrice());
			cart.setUser(user);
			
			cartDaoImpl.insert(cart);
			System.out.println("Product Inserted into cart Id: " + cart.getCartId());
			
			mv.addObject("catList", categoryDaoImpl.getAllCategories());
			mv.addObject("cartItems", cartDaoImpl.findCartById(user.getId()));
			return "redirect:/cart/showCart";
		}
		
	}

	@RequestMapping(value = "/showCart", method = RequestMethod.GET)
	public ModelAndView showCart() {
		ModelAndView mv = new ModelAndView("cart");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDaoImpl.getUserByEmail(email);
		if (user == null) {
			mv.addObject("msg", "Kindly login first.");
			return mv;
		}
		List<Cart> cartList = cartDaoImpl.findCartById(user.getId());
		Float totalPrice = 0F;
		for(Cart cartItem: cartList){
			totalPrice+= cartItem.gettotalPrice();
		}
		System.out.println("Show Cart > Total Price: "+ totalPrice);
		
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("cartItems", cartList);
		mv.addObject("catList", categoryDaoImpl.getAllCategories());
		return mv;
	}

	@RequestMapping(value = "/removeitem/{pid}", method = RequestMethod.GET)
	public String deleteCartItem(@PathVariable("pid") int cartProductId) {
		System.out.println("in remove cart item :" + cartProductId);

		ModelAndView mv = new ModelAndView("cart");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDaoImpl.getUserByEmail(email);
		if (user == null) {
			mv.addObject("msg", "Kindly login first.");
			return "login";
		}else{
		

		Cart cart = cartDaoImpl.getCartByProductId(cartProductId);

		cartDaoImpl.deleteCart(cart.getCartId());
		
		Float totalPrice = 0F;
		List<Cart> cartList = cartDaoImpl.findCartById(user.getId());
		for(Cart cartItem: cartList){
			totalPrice+= cartItem.gettotalPrice();
		}
		System.out.println("Total Price: "+ totalPrice);
		
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("cartItems", cartList);
		mv.addObject("catList", categoryDaoImpl.getAllCategories());
		return "redirect:/cart/showCart";
		}
	}

}
