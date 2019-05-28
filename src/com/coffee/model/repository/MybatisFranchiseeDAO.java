package com.coffee.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coffee.model.domain.Franchisee;
@Repository
public class MybatisFranchiseeDAO implements FranchiseeDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List selectAll() {
		return sqlSessionTemplate.selectList("Franchisee.selectAll");
	}
	public Franchisee select(int franchisee_id) {
		return sqlSessionTemplate.selectOne("Franchisee.select",franchisee_id);
	}
	public int delete(int franchisee_id) {
		return sqlSessionTemplate.delete("Franchisee.delete",franchisee_id);	
	}
	public int update(Franchisee franchisee) {
		return sqlSessionTemplate.update("Franchisee.update", franchisee);
	}
	public int insert(Franchisee franchisee) {
		return sqlSessionTemplate.insert("Franchisee.insert", franchisee);
	}
	public List search(Franchisee franchisee) {
		return sqlSessionTemplate.selectList("Franchisee.search", franchisee);
	}
	public List searchAll() {
		return sqlSessionTemplate.selectList("Franchisee.searchAll");
	}
}
