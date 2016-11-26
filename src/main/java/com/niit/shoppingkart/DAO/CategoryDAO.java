package com.niit.shoppingkart.DAO;

import java.util.List;

import com.niit.shoppingkart.model.Category;

public interface CategoryDAO {
	public boolean  saveOrUpdate(Category category);
	public boolean delete(int cid);
	public Category get(int cid);
	public List<Category> list();

}
