package com.niit.shoppingkart.handler;

import org.springframework.stereotype.Controller;

import com.niit.shoppingkart.model.Cart1;

@Controller
public class CheckoutHandler {
public String cardPayment(Cart1 cart)
	
	{
	/*String name = cart1.getCardnumber();
		String date=cart1.getDate();
		String cvv=cart1.getCvv();
		*/
		
		return "true";
		
		/*
		System.out.println(name);
		
		if(name.equals("1234567890")&&date.equals("01/2018")&&cvv.equals("111"))
		
		{
			
			return "true";
		}
		else{
			return "false";
		}*/
	}
	
	 public String paymentMethod(Cart1 cart)
	 
	 {
		System.out.println("method");
		//cart1.setMethod("card");
		String method=cart.getMethod();
		System.out.println(method);
		if(method.equals("cod"))
		
		{
			
			return "cod";
		}
		
		else 
		
		{
			
			return "card";
		}
	
	 }
	
	
}
