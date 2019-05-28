package com.coffee.model.repository;

import java.util.List;

import com.coffee.model.domain.Product;

public interface ProductDAO {
	public int insert(Product product);
	public List selectAll();
	public Product select(int product_id);
	public List selectByCategory(int category_id);
	public List selectPtAll();
	public List selectPtByCategory(int category_id);
	public int update(Product product);
	public int delete(int product_id);
	public List search(Product product);
}