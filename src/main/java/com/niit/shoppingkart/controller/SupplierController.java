package com.niit.shoppingkart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.niit.shoppingkart.DAO.SupplierDAO;
import com.niit.shoppingkart.model.Supplier;
@Controller
public class SupplierController {
	@Autowired
	private SupplierDAO supplierDAO;
	@RequestMapping(value = "/suppliergson")
	@ResponseBody
	public String SupplierGson() {
		List<Supplier> list = supplierDAO.list();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		return data;
	}
	@RequestMapping(value="/Supplier")
	public ModelAndView getAllData(@ModelAttribute("supplier")Supplier supplier,BindingResult result,Model model)
	{
		ModelAndView mv = new ModelAndView("/Admin");
		mv.addObject("supplierList",supplierDAO.list());
		mv.addObject("UserClickedsuppliers","true");
			return mv;
		}
	@RequestMapping(value="/addsupplier",method = RequestMethod.POST)
	   public String addItem(@ModelAttribute("supplier") Supplier supplier,RedirectAttributes attributes) {
			supplierDAO.saveOrUpdate(supplier);
			attributes.addFlashAttribute("SuccessMessage", "Supplier has been added/Updated Successfully");
			return "redirect:/Supplier";
			}
	@RequestMapping(value="/editBySupplier/{sid}",method = RequestMethod.GET)
	public String editProduct(@PathVariable("sid") int sid, RedirectAttributes attributes) {
		System.out.println("editsupllier");
		attributes.addFlashAttribute("supplier", this.supplierDAO.get(sid));
		
		return "redirect:/Supplier";
	}
	@RequestMapping(value="/deleteBySupplier/{sid}",method = RequestMethod.GET)
	public String deleteItem(@PathVariable("sid") int sid,HttpServletRequest request,RedirectAttributes attributes) throws Exception
	{
		supplierDAO.delete(sid);
		attributes.addFlashAttribute("DeleteMessage", "Supplier has been deleted Successfully");
		return "redirect:/Supplier";
		
}
}

