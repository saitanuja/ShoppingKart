package com.niit.shoppingkart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.niit.shoppingkart.DAO.CategoryDAO;
import com.niit.shoppingkart.DAO.ProductDAO;
import com.niit.shoppingkart.DAO.UserDAO;
import com.niit.shoppingkart.model.User;
@Controller
public class UserController {
@Autowired
CategoryDAO categoryDAO;
@Autowired
ProductDAO productDAO;
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value = "Login")
	public String DisplayLogin(Model mv) {
		mv.addAttribute("user", new User());
		mv.addAttribute("UserClickedLogin", "true");
		return "header";
	}
	
	@RequestMapping(value = "Registration")
	public String DisplayRegister(Model mv) {
		mv.addAttribute("user", new User());
		mv.addAttribute("categoryList", categoryDAO.list());
		mv.addAttribute("productList", productDAO.list());
		mv.addAttribute("UserClickedRegister", "true");
		return "header";
	}

	@RequestMapping(value = "adduser", method = RequestMethod.POST)
	public String UserRegister(@ModelAttribute("user") User user, ModelAndView mv) {
		user.setEnabled("TRUE");
		user.setRole("ROLE_USER");
		userDAO.saveOrUpdate(user);
		mv.addObject("message", "Registration Success");
		return "redirect:/";
	}

	/*@SuppressWarnings("unchecked")
	@RequestMapping(value = "/login_session_attributes")
	public String login_session_attributes(HttpSession session) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		User user = userDAO.get(username);
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("name", user.getName());
		session.setAttribute("LoggedIn", "true");

		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
		.getAuthentication().getAuthorities();
		String role="ROLE_USER";
		for (GrantedAuthority authority : authorities) 
		{
		  
		     if (authority.getAuthority().equals(role)) 
		     {
		    	 session.setAttribute("UserLoggedIn", "true");
		    	 return "redirect:/";
		     
		     }
		     else 
		     {
		    	 session.setAttribute("Administrator", "true");
			return "/Admin";
		     }
		}
		return "Home";
*/
}
	
	


