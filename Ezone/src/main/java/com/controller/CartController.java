package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Dao.CartDAO;
import com.Dao.ProductDAO;
import com.Dao.UserDao;
import com.model.Cart;
import com.model.Category;
import com.model.Product;
import com.model.UserModel;

@Controller
public class CartController {

	@Autowired
	HttpSession session;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	ProductDAO productDAO;

	@RequestMapping(value = "/user/addToCart", method = RequestMethod.POST)
	public String addToCart(HttpServletRequest request, Model m) {
//		SecurityContextHolder.getContext().getAuthentication();
		UserModel userModel = (UserModel) session.getAttribute("userModel");
		String name = userModel.getName();

		String productName = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("pPrice"));
		int pid = Integer.parseInt(request.getParameter("pId"));
		int quantity = Integer.parseInt(request.getParameter("quant"));
		Cart cartexist = cartDAO.getCartItem(pid, name);

		// System.out.println(pid);
		// System.out.println(name);
		// System.out.println(productName);
		// System.out.println(price);
		// System.out.println(productId);
		// System.out.println(quantity);

		if (cartexist == null) {
			Cart cm = new Cart();
			cm.setName(name);
			cm.setPrice(price);
			cm.setProductId(pid);
			cm.setProductName(productName);
			cm.setQuantity(quantity);
			cartDAO.addCart(cm);

		} else if (cartexist != null) {
			Cart cm = new Cart();
			cm.setCartItemId(cartexist.getCartItemId());
			cm.setName(name);
			cm.setPrice(price);
			cm.setProductId(pid);
			cm.setProductName(productName);
			cm.setQuantity(quantity);
			cartDAO.updateCart(cm);
		}

		List<Product> listProduct = productDAO.retrieveProducts();
		m.addAttribute("productList", listProduct);

		m.addAttribute("prodmodel", new Product());

		return "ProductList";

	}

	@RequestMapping(value = "/user/cart", method = RequestMethod.GET)
	public String showCategory(Model m) {
//		SecurityContextHolder.getContext().getAuthentication();
		UserModel userModel = (UserModel) session.getAttribute("userModel");
		String name = userModel.getName();

		List<Cart> listCart = cartDAO.getCartItems(name);
		m.addAttribute("cartlist", listCart);

		return "Cart";
	}

	@RequestMapping(value = "/user/updateCart", method = RequestMethod.POST)
	public String updateCart(HttpServletRequest request, Model m) {

//		SecurityContextHolder.getContext().getAuthentication();
		UserModel userModel = (UserModel) session.getAttribute("userModel");
		String name = userModel.getName();

		int pid = Integer.parseInt(request.getParameter("pid"));
		int quantity = Integer.parseInt(request.getParameter("quant"));
		int price = Integer.parseInt(request.getParameter("pPrice"));
		String productName = request.getParameter("name");
		Cart cartexist = cartDAO.getCartItem(pid, name);

		Cart cm = new Cart();
		cm.setCartItemId(cartexist.getCartItemId());
		cm.setProductId(pid);
		cm.setName(name);
		cm.setQuantity(quantity);
		cm.setPrice(price);
		cm.setProductName(productName);
		cartDAO.updateCart(cm);

		List<Cart> listCart = cartDAO.getCartItems(name);
		m.addAttribute("cartlist", listCart);

		return "Cart";

	}

	@RequestMapping(value = "/user/deleteCart", method = RequestMethod.POST)
	public String deleteCart(HttpServletRequest request, Model m) {

//		SecurityContextHolder.getContext().getAuthentication();
		UserModel userModel = (UserModel) session.getAttribute("userModel");
		String name = userModel.getName();

		int pid = Integer.parseInt(request.getParameter("pid"));
		Cart cartexist = cartDAO.getCartItem(pid, name);

		Cart cm = new Cart();
		cm.setCartItemId(cartexist.getCartItemId());
		cartDAO.deleteCart(cm);

		List<Cart> listCart = cartDAO.getCartItems(name);
		m.addAttribute("cartlist", listCart);

		return "Cart";

	}

	@RequestMapping(value = "/user/checkout")
	public String checkout(HttpServletRequest request, Model m) {
		String gtot = request.getParameter("gtot");
		// System.out.println(gtot);
		m.addAttribute("gtot", gtot);
		return "Checkout";
	}

	@RequestMapping(value = "/user/invoice")
	public String invoice(HttpServletRequest request, Model m) {
		String gtot = request.getParameter("gtot");
		// System.out.println(gtot);
		m.addAttribute("gtot", gtot);
		return "Invoice";
	}

}
