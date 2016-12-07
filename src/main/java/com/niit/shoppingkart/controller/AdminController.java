package com.niit.shoppingkart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingkart.DAO.UserDAO;

@Controller
public class AdminController {
	@Autowired 
	UserDAO userDAO;
	@RequestMapping(value ="Admin" )
	public ModelAndView SupplierPage() {
		ModelAndView mv= new ModelAndView("/Admin");
		mv.addObject("UserClickedadmin", "true");
		return mv;
	
}
}
