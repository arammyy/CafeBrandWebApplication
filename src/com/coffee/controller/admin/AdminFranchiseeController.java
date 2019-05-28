package com.coffee.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.coffee.model.domain.Franchisee;
import com.coffee.model.domain.Member;
import com.coffee.model.service.FranchiseeService;
@Controller
public class AdminFranchiseeController {
	@Autowired
	private FranchiseeService franchiseeService;
	@RequestMapping(value="/admin/franchisee/list",method=RequestMethod.GET)
	public ModelAndView selectAll(HttpServletRequest request) {
		List franchiseeList=franchiseeService.selectAll();
		ModelAndView mav = new ModelAndView("admin/franchisee/list");
		mav.addObject("franchiseeList", franchiseeList);
		return mav;
	}
	
	@RequestMapping(value="/admin/franchisee/detail",method=RequestMethod.GET)
	public ModelAndView select(int franchisee_id) {
		System.out.println("디테일");
		Franchisee franchisee = franchiseeService.select(franchisee_id);
		ModelAndView mav = new ModelAndView("admin/franchisee/detail");
		mav.addObject("franchisee", franchisee);
		return mav;
	}

	@RequestMapping(value="/admin/franchisee/delete/{franchisee_id}", method=RequestMethod.GET)
	public ModelAndView delete(@PathVariable("franchisee_id") int franchisee_id) {
		System.out.println("삭제됨");
		franchiseeService.delete(franchisee_id);
		ModelAndView mav = new ModelAndView("redirect:/admin/franchise/list");
		return mav;
	}
	@RequestMapping(value="/admin/franchisee/update", method=RequestMethod.POST)
	public ModelAndView update(Franchisee franchisee, int member_id) {
		System.out.println("수정됨");
		Member member = new Member();
		member.setMember_id(member_id);
		franchisee.setMember(member); 
		franchiseeService.update(franchisee);
		ModelAndView mav = new ModelAndView("redirect:/admin/franchisee/list");
		return mav;
	}
	
	@RequestMapping(value="/admin/franchisee/search")
	public ModelAndView search(Franchisee franchisee) {
		List franchiseeList = franchiseeService.search(franchisee);
		System.out.println("사이즈 " + franchiseeList.size());
		ModelAndView mav = new ModelAndView("admin/franchisee/list");
		mav.addObject("franchiseeList",franchiseeList);
		return mav;
	}
}
