package com.niit.shoppingkart.DAOImpl;



import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.niit.shoppingkart.DAO.ProductDAO;
import com.niit.shoppingkart.model.Product;

public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SessionFactory sessionFactory;

    public ProductDAOImpl(SessionFactory  sessionFactory) {
    this.sessionFactory=sessionFactory;
}

	@Transactional
	public boolean saveOrUpdate(Product product) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(product);
			return true;
			
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	}

	
	@Transactional
	public boolean delete(int id) {
		Product ProductToDelete = new Product();
		ProductToDelete.setId(id);
		 sessionFactory.getCurrentSession().delete(ProductToDelete);
		 return true;
	}
		
		
		@Transactional
		public Product get(int id) {
			String hql = "from"+" Product"+" where id=" + id;
		
			@SuppressWarnings("rawtypes")
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			
			@SuppressWarnings({ "unchecked", "deprecation" })
			List<Product> listProduct = (List<Product>) query.list();
			
			if (listProduct != null && !listProduct.isEmpty()) {
				return listProduct.get(0);
			}
			
			return null;
		}

	
	@Transactional
	public List<Product> list() {
		@SuppressWarnings({ "unchecked", "deprecation" })
		List<Product> listProduct = (List<Product>) sessionFactory.getCurrentSession()
				.createCriteria(Product.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listProduct;
	}
	@Transactional
	@SuppressWarnings("unchecked")
	public List<Product> getproduct(int id) {
		String hql="from Product where id= "+id;
		@SuppressWarnings("rawtypes")
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		@SuppressWarnings("deprecation")
		List<Product> listProduct = (List<Product>) query.list();
		return listProduct;
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Transactional
	public List<Product> navproduct(int id) {
		String hql = "from Product where categoryid= "+id;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<Product> catproducts = (List<Product>) query.list();
		return catproducts;
	}
	
	}
