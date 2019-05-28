package com.coffee.model.service;

import java.util.List;

import com.coffee.model.domain.Product;

public interface ProductService {
	public int insert(Product product);
	public List selectAll();
	public Product select(int product_id);
	public List selectByCategory(int category_id);
	public List selectPtAll();
	public List selectPtByCategory(int category_id);
	public void update(Product product);
	public void delete(int product_id);
	public List search(Product product);

}
