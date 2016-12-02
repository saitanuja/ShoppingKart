package com.niit.shoppingkart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingkart.DAO.UserDAO;
import com.niit.shoppingkart.model.User;

@Controller
public class UserController {
	@Autowired
	UserDAO userDAO;
	
	 @RequestMapping(value="/Register")
		public ModelAndView getAllData(@ModelAttribute("user")User user,BindingResult result,Model model)
		{
			ModelAndView mv = new ModelAndView("/header");
		/*mv.addObject("categoryList",categoryDAO.list());*/
		mv.addObject("userClickedRegistration","true");
			return mv;
	
		}
	
	@RequestMapping(value = "adduser", method = RequestMethod.POST)
	public String UserRegister(@ModelAttribute("user") User user,RedirectAttributes attributes) {
		user.setEnabled("TRUE");
		user.setRole("ROLE_USER");
		userDAO.saveOrUpdate(user);
		attributes.addFlashAttribute("SuccessMessage","Registration Successfull");
		return "redirect:Register";
	}


}
