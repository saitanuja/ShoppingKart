package com.niit.shoppingkart.DAO;

import java.util.List;

import com.niit.shoppingkart.model.Checkout;

public interface CheckoutDAO {
	public boolean saveOrUpdate(Checkout checkout);
	public boolean delete(Checkout checkout);
	public List<Checkout>list();
	public Checkout get(int id);
}
