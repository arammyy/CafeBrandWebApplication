package com.coffee.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coffee.model.domain.Product;

@Repository
public class MybatisProductDAO implements ProductDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public int insert(Product product) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("Product.insert", product);
	}

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("Product.selectAll");
	}

	@Override
	public Product select(int product_id) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("Product.select", product_id);
	}

	@Override
	public int update(Product product) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("Product.update", product);
	}

	@Override
	public int delete(int product_id) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("Product.delete", product_id);
	}

	@Override
	public List selectByCategory(int category_id) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("Product.selectByCategory", category_id);
	}

	@Override
	public List selectPtAll() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("Product.ptSelect");
	}

	@Override
	public List selectPtByCategory(int category_id) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("Product.ptSelectByCat", category_id);
	}

	@Override
	public List search(Product product) {
		return sessionTemplate.selectList("Product.search", product);
	}

}
