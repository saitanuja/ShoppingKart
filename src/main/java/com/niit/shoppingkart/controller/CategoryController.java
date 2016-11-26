package com.niit.shoppingkart.controller;

import java.util.List;

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
import com.niit.shoppingkart.DAO.CategoryDAO;
import com.niit.shoppingkart.model.Category;
@Controller
public class CategoryController {
	@Autowired
	private CategoryDAO categoryDAO;
	@RequestMapping(value="/categorygson")
	@ResponseBody
	public String CategoryGson()
	{
		List<Category> list=categoryDAO.list();
		Gson gson=new Gson();
		String data=gson.toJson(list);
		return data;
	}
     @RequestMapping(value="/Category")
	public ModelAndView getAllData(@ModelAttribute("category")Category category,BindingResult result,Model model)
	{
		ModelAndView mv = new ModelAndView("/index");
	mv.addObject("categoryList",categoryDAO.list());
	mv.addObject("UserClickedCategorys","true");
		return mv;
	}
	@RequestMapping(value="/addcategory",method = RequestMethod.POST)
	   public String addItem(@ModelAttribute("category") Category category,RedirectAttributes attributes){
			categoryDAO.saveOrUpdate(category);
		attributes.addFlashAttribute("SuccessMessage", "Category has been added/Updated Successfully");
			return "redirect:/Category";
			}
	@RequestMapping(value="/editBycid/{cid}",method = RequestMethod.GET)
	public String editCategory(@PathVariable("cid") int cid, RedirectAttributes attributes) {
		System.out.println("editCategory");
		attributes.addFlashAttribute("category", this.categoryDAO.get(cid));
		
		return "redirect:/Category";
	}	
	@RequestMapping(value="/deleteBycid/{cid}",method = RequestMethod.GET)
	public String deleteItem(@PathVariable("cid") int cid,RedirectAttributes attributes) throws Exception
	{
		categoryDAO.delete(cid);
		attributes.addFlashAttribute("DeleteMessage", "Category has been deleted Successfully");
		return "redirect:/Category";
		
}

}
