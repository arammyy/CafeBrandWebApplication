package com.coffee.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coffee.model.repository.GradeDAO;

@Service
public class GradeServiceImpl implements GradeService{
	@Autowired
	private GradeDAO gradeDAO;
	
	public List selectAll() {
		return gradeDAO.selectAll();
	}

}
