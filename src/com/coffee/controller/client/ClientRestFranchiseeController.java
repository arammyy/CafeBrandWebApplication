package com.coffee.controller.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.coffee.common.board.Pager;
import com.coffee.model.domain.Franchisee;
import com.coffee.model.service.FranchiseeService;
import com.coffee.model.service.MemberService;

@RestController
public class ClientRestFranchiseeController {
	@Autowired
	private FranchiseeService franchiseeService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/client/franchisee/search",method=RequestMethod.GET)
	public List search(Franchisee franchisee) {
		List franchiseeSearchList = franchiseeService.search(franchisee);
		return franchiseeSearchList;
	}
	
	@RequestMapping(value="/client/franchisee/searchAll")
	public List searchAll() {
		List franchiseeList = franchiseeService.searchAll();
		return franchiseeList;
	}
	
	@RequestMapping(value="/client/franchisee/searchPager")
	public Pager searchPager(HttpServletRequest request, Franchisee franchisee) {
		List franchiseeList = franchiseeService.search(franchisee);
		Pager pager = new Pager();
		pager.init(request, franchiseeList.size());
		return pager;
	}
	
}
