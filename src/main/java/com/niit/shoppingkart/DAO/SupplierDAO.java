package com.niit.shoppingkart.DAO;

import java.util.List;

import com.niit.shoppingkart.model.Supplier;

public interface SupplierDAO {
	public boolean saveOrUpdate(Supplier supplier);
	public boolean delete(int  sid);
	public Supplier get(int  sid);
	public List<Supplier> list();


}
