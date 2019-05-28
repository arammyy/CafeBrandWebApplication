package com.coffee.model.service;

import java.util.List;

import com.coffee.model.domain.Franchisee;

public interface FranchiseeService {
	public List selectAll();
	public Franchisee select(int franchisee_id);
	public void delete(int franchisee_id);
	public void update(Franchisee franchisee);
	public void insert(Franchisee franchisee);
	public List search(Franchisee franchisee);
	public List searchAll();
}
