package com.niit.shoppingkart.DAO;

import java.util.List;

import com.niit.shoppingkart.model.Product;

public interface ProductDAO {
	public boolean saveOrUpdate(Product product);
	//public boolean update(int id);
	public boolean delete(int id);
	public Product get(int id);
	public List<Product> list();
	public List<Product> getproduct(int id);
	
	
}
