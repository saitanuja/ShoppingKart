package com.niit.shoppingkart.controller;

import java.io.File;


import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.niit.shoppingkart.DAO.CategoryDAO;
import com.niit.shoppingkart.DAO.ProductDAO;
import com.niit.shoppingkart.DAO.SupplierDAO;
import com.niit.shoppingkart.model.Product;
@Controller
public class ProductController {
	@Autowired
	private ProductDAO productDAO;
	
	/*@Autowired
	Product product;*/
	
	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private SupplierDAO supplierDAO;

	private Path path;

	@RequestMapping(value = "/productgson")
	@ResponseBody
	public String ProductGson() {
		List<Product> list = productDAO.list();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		return data;
	}
	@RequestMapping(value="/Product")
	public ModelAndView getAllData(@ModelAttribute("product")Product product,BindingResult result,Model model)
	{
		ModelAndView mv = new ModelAndView("/Admin");
		mv.addObject("categoryList",categoryDAO.list());
		mv.addObject("supplierList",supplierDAO.list());
	mv.addObject("productList",productDAO.list());
	mv.addObject("UserClickedProducts","true");
		return mv;
	}
	@RequestMapping(value="updateproduct")
	public String updateproduct(@ModelAttribute("product") Product product,HttpServletRequest request,Model m){
		productDAO.saveOrUpdate(product);
		 MultipartFile file=product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "\\resources\\images\\"+product.getId()+".jpg");
        if (file != null && !file.isEmpty()) {
            try {
            	System.out.println("Image Saving Start");
            	file.transferTo(new File(path.toString()));
            	System.out.println("Image Saved");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error");
                throw new RuntimeException("item image saving failed.", e);
            }
        }
		return "redirect:/Product";
	}
	
	
	@RequestMapping(value="/addproduct",method = RequestMethod.POST)
   public String addItem(@ModelAttribute("product") Product product, RedirectAttributes attributes){
		productDAO.saveOrUpdate(product);
	attributes.addFlashAttribute("SuccessMessage", "product has been added/Updated Successfully");
		return "redirect:/Product";
		
	}
	@RequestMapping(value="/editById/{id}",method = RequestMethod.GET)
	public String editProduct(@PathVariable("id") int id, RedirectAttributes attributes) {
		System.out.println("editProduct");
		attributes.addFlashAttribute("product", this.productDAO.get(id));
		
		return "redirect:/Product";
	}	
	@RequestMapping(value="/deleteById/{id}",method = RequestMethod.GET)
	public String deleteItem(@PathVariable("id") int id, RedirectAttributes attributes) throws Exception
	{
		productDAO.delete(id);
		attributes.addFlashAttribute("DeleteMessage", "product has been deleted Successfully");
		
		return "redirect:/Product";
		
}}


