package com.coffee.controller.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.coffee.auth.SecurityBean;
import com.coffee.common.exception.EditFailException;
import com.coffee.common.exception.LoginFailException;
import com.coffee.model.domain.Grade;
import com.coffee.model.domain.Member;
import com.coffee.model.service.GradeService;
import com.coffee.model.service.MemberService;
@Controller
public class ClientMemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private GradeService gradeService;
	SecurityBean sb = new SecurityBean();
	
	@RequestMapping(value="/ctest/member/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/ctest/member/goRegist", method=RequestMethod.GET)
	public ModelAndView goRegist() {
		List<Grade> gradeList = gradeService.selectAll();
		ModelAndView mav = new ModelAndView("client/member/regist");
		mav.addObject("gradeList", gradeList);
		return mav;
	}
	
	@RequestMapping(value="/ctest/member/regist", method=RequestMethod.POST)
	public String regist(Member member, int grade_id) {
		member.setPass(sb.textToHash(member.getPass()));
		Grade grade = new Grade();
		grade.setGrade_id(grade_id);
		member.setGrade(grade);
		memberService.insert(member);
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/ctest/member/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request,Member member) {
		member.setPass(sb.textToHash(member.getPass()));
		Member m = memberService.logIn(member);
		System.out.println("member : " + m);
		if(m != null) {
			request.getSession().setAttribute("client", m);
			if(m.getGrade().getGrade_id()==3) {
				   request.getSession().setAttribute("admin",m);
			}
			return "redirect:/index.jsp";
		}else {
			return "client/login/loginerror";
		}
	}
	
	@RequestMapping(value="/ctest/member/findid", method=RequestMethod.POST)
	public ModelAndView findid(Member member) {
		Member m = memberService.findId(member);
		ModelAndView mav = new ModelAndView("client/member/findidresult");
		mav.addObject("id", m.getId());
		return mav;
	}
	
	@RequestMapping(value="/ctest/member/findpw", method=RequestMethod.POST)
	public ModelAndView findpw(Member member) {
		ModelAndView mav = new ModelAndView("client/member/findpwresult");
		mav.addObject("member", member);
		return mav;
	}
	
	@RequestMapping(value="/ctest/member/changepw", method=RequestMethod.POST)
	@ResponseBody
	public String changepw(Member member, String pass) {
		System.out.println("id´Â " + member.getId());
		String hashpass = sb.textToHash(pass);
		member.setPass(hashpass);
		memberService.changePass(member);
		JSONObject json = new JSONObject();
		json.put("result",1);
		return json.toString();
	}
	
	@RequestMapping(value="/client/member/checkphone",method=RequestMethod.GET)
	@ResponseBody
	public String checkPhone(Member member) {
		Member m = memberService.checkphone(member);
		JSONObject json = new JSONObject();
		if(m == null) {
			json.put("result",1);
		}else {
			json.put("result",0);
		}
		return json.toString();
	}
	@RequestMapping(value="/ctest/member/checkinfo", method=RequestMethod.GET)
	@ResponseBody
	public String checkinfo(Member member) {
		Member m = memberService.checkInfo(member);
		JSONObject json = new JSONObject();
		if(m == null) {
			json.put("result",1);
		}else {
			json.put("result",0);
		}
		return json.toString();
	}
	
	@ExceptionHandler(EditFailException.class)
	public String editFail(EditFailException e) {
		JSONObject json = new JSONObject();
		json.put("result",0);
		return json.toString();
	}
	
	@ExceptionHandler(LoginFailException.class)
	public String loginFail(LoginFailException e) {
		JSONObject json = new JSONObject();
		json.put("result",0);
		return json.toString();
	}
}
