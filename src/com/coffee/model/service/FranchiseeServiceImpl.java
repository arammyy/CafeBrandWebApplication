package com.coffee.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coffee.common.exception.RegistFailException;
import com.coffee.model.domain.Franchisee;
import com.coffee.model.repository.FranchiseeDAO;

@Service
public class FranchiseeServiceImpl implements FranchiseeService {
	@Autowired
	private FranchiseeDAO franchiseeDAO;

	public List selectAll() {
		return franchiseeDAO.selectAll();
	}

	public Franchisee select(int franchisee_id) {
		return franchiseeDAO.select(franchisee_id);
	}

	public void delete(int franchisee_id) {
		franchiseeDAO.delete(franchisee_id);

	}

	public void update(Franchisee franchisee) {
		int result = franchiseeDAO.update(franchisee);
		System.out.println(result+" result");
		if (result == 0) {
			System.out.println("시발..");
		}
	}

	@Override
	public void insert(Franchisee franchisee) throws RegistFailException {
		int result = franchiseeDAO.insert(franchisee);
		if (result == 0) {
			throw new RegistFailException("등록 실패");
		}
	}

	@Override
	public List search(Franchisee franchisee) {
		return franchiseeDAO.search(franchisee);
	}

	public List searchAll() {
		return franchiseeDAO.searchAll();
	}
}
