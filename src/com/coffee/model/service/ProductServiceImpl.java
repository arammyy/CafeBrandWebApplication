package com.coffee.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.coffee.common.exception.DeleteFailException;
import com.coffee.common.exception.EditFailException;
import com.coffee.common.exception.RegistFailException;
import com.coffee.model.domain.Product;
import com.coffee.model.repository.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	//@Qualifier("mybatisProductDAO")
	private ProductDAO productDAO;

	@Override
	public int insert(Product product) {
		// TODO Auto-generated method stub
		return productDAO.insert(product);
	}

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return productDAO.selectAll();
	}

	@Override
	public Product select(int product_id) {
		// TODO Auto-generated method stub
		return productDAO.select(product_id);
	}
	
	@Override
	public List selectByCategory(int category_id) {
		// TODO Auto-generated method stub
		return productDAO.selectByCategory(category_id);
	}
	
	@Override
	public List selectPtAll() {
		// TODO Auto-generated method stub	
		return productDAO.selectPtAll();
	}
	
	@Override
	public List selectPtByCategory(int category_id) {
		// TODO Auto-generated method stub
		return productDAO.selectPtByCategory(category_id);
	}

	@Override
	public void update(Product product) {
		// TODO Auto-generated method stub
		 productDAO.update(product);
	}

	@Override
	public void delete(int product_id) {
		// TODO Auto-generated method stub
		 productDAO.delete(product_id);
	}

	@Override
	public List search(Product product) {
		return productDAO.search(product);
	}

}
