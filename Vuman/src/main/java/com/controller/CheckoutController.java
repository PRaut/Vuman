package com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DaoImpl.CartDaoImpl;
import com.DaoImpl.CategoryDaoImpl;
import com.DaoImpl.OrdersDaoImpl;
import com.DaoImpl.UserDaoImpl;
import com.model.Cart;
import com.model.Orders;
import com.model.User;

@Controller
@RequestMapping("/payment")
public class CheckoutController {

	@Autowired
	CategoryDaoImpl categoryDaoImpl;

	@Autowired
	CartDaoImpl cartDaoImpl;

	@Autowired
	UserDaoImpl userDaoImpl;

	@Autowired
	OrdersDaoImpl ordersDaoImpl;

	@RequestMapping(value = "/checkout", method = RequestMethod.GET)
	public ModelAndView checkOut() {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDaoImpl.getUserByEmail(email);

		ModelAndView mv = new ModelAndView("Checkout");
		mv.addObject("catList", categoryDaoImpl.getAllCategories());
		List<Cart> cartItems = cartDaoImpl.findCartById(user.getId());

		Float totalPrice = 0F;
		for (Cart items : cartItems) {
			totalPrice += items.gettotalPrice();
		}

		mv.addObject("totalPrice", totalPrice);
		mv.addObject("catList", categoryDaoImpl.getAllCategories());
		return mv;
	}

	@RequestMapping(value = "/dopayment", method = RequestMethod.POST)
	public String invoice(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		System.out.println("Card No : " + request.getParameter("cardNumber"));
		System.out.println("Total Payment: " + request.getParameter("paymentPrice"));

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDaoImpl.getUserByEmail(email);

		Orders order = new Orders();
		order.setPaymentMode("CARD PAYMENT");
		order.setTotalAmount(Double.parseDouble(request.getParameter("paymentPrice")));
		order.setUser(user);
		order.setOrderDate(new Date());

		ordersDaoImpl.insert(order);

		System.out.println("Order inserted with ordId: " + order.getOrderId());

		List<Cart> listCarts = cartDaoImpl.findCartById(user.getId());

		float finalCost = 0F;

		for (Cart cartItem : listCarts) {
			//System.out.println("In orders > Cart Deleted:  " + cartItem.getCartId());
			finalCost += cartItem.gettotalPrice();
			System.out.println("In Invoice: " + cartItem.getCartProductName());
			// cartDaoImpl.deleteCart(cartItem.getCartId());

		}

		mv.addObject("cartItems", listCarts);
		mv.addObject("finalCost", finalCost);
		//mv.addObject("order", order);
		mv.addObject("order", ordersDaoImpl.getOrderByUserId(user.getId()));
		mv.addObject("catList", categoryDaoImpl.getAllCategories());
		mv.addObject("thanksmsg", "Thank you for shopping with us");

		return "redirect:/payment/invoice";
	}

	@RequestMapping(value = "/invoice", method = RequestMethod.GET)
	public ModelAndView showInvoice() {
		System.out.println("In Show Invoice");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		User user = userDaoImpl.getUserByEmail(email);

		ModelAndView mv = new ModelAndView("invoice");
		List<Cart> listCarts = cartDaoImpl.findCartById(user.getId());

		float finalCost = 0F;

		for (Cart cartItem : listCarts) {
			//System.out.println("In orders > Cart Deleted:  " + cartItem.getCartId());
			finalCost += cartItem.gettotalPrice();
			System.out.println("Product in Invoice: " + cartItem.getCartProductName());
			cartDaoImpl.deleteCart(cartItem.getCartId());

		}

		mv.addObject("cartItems", listCarts);
		mv.addObject("finalCost", finalCost);
		mv.addObject("user",user);
		mv.addObject("order", ordersDaoImpl.getOrderByUserId(user.getId()));
		
		mv.addObject("catList", categoryDaoImpl.getAllCategories());
		
		mv.addObject("thanksmsg", "Thank you for shopping with us");
		//return "redirect:/payment/invoice";
		return mv;
	}

}
