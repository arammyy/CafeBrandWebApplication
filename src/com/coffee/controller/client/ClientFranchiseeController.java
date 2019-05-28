package com.coffee.controller.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.coffee.common.exception.RegistFailException;
import com.coffee.model.domain.Franchisee;
import com.coffee.model.domain.Member;
import com.coffee.model.service.FranchiseeService;
import com.coffee.model.service.MemberService;

@Controller
public class ClientFranchiseeController {
	@Autowired
	private FranchiseeService franchiseeService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/client/franchisee/goRegist", method=RequestMethod.POST)
	public ModelAndView goRegist(HttpServletRequest request, int member_id) {
		Member member = memberService.select(member_id);
		ModelAndView mav = null;
		if(member.getGrade().getGrade_id() == 2) {
			mav = new ModelAndView("client/franchisee/franchiseeRegist");
		}else {
			mav = new ModelAndView("client/franchisee/error");
		}
		return mav;
	}
	
	@RequestMapping(value="/client/franchisee/regist", method=RequestMethod.POST)
	public ModelAndView insert(HttpServletRequest request, Franchisee franchisee, int member_id) {
		System.out.println(franchisee.getMessage());
		Member member = new Member();
		member.setMember_id(member_id);
		franchisee.setMember(member);
		franchiseeService.insert(franchisee);
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
	
	@RequestMapping(value="/client/franchisee/list", method=RequestMethod.GET)
	public ModelAndView selectAll() {
		List franchiseeList = franchiseeService.selectAll();
		ModelAndView mav = new ModelAndView("client/franchisee/franchiseeMap");
		mav.addObject("franchiseeList", franchiseeList);
		return mav;
	}
	
	@RequestMapping(value="/client/franchisee/mapList", method=RequestMethod.GET)
	public ModelAndView searchAll() {
		List franchiseeList = franchiseeService.searchAll();
		System.out.println(franchiseeList.size());
		ModelAndView mav = new ModelAndView("client/franchisee/franchiseeMap");
		mav.addObject("franchiseeList", franchiseeList);
		return mav;
	}
	@ExceptionHandler(RegistFailException.class)
	public ModelAndView registFail(RegistFailException e) {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("err", e);
		return mav;
	}
}
