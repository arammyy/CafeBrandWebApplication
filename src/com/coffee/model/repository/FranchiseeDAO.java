package com.coffee.model.repository;

import java.util.List;

import com.coffee.model.domain.Franchisee;

public interface FranchiseeDAO {
	public List selectAll();
	public Franchisee select(int franchisee_id);
	public int delete(int franchisee_id);
	public int update(Franchisee franchisee);
	public int insert(Franchisee franchisee);
	public List search(Franchisee franchisee);
	public List searchAll();
}
