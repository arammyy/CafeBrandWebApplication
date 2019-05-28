package com.coffee.controller.admin;

import java.util.List;

import javax.security.auth.login.AccountNotFoundException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.coffee.common.exception.DeleteFailException;
import com.coffee.common.exception.EditFailException;
import com.coffee.common.exception.RegistFailException;
import com.coffee.model.domain.Grade;
import com.coffee.model.domain.Member;
import com.coffee.model.service.MemberService;



@Controller
@RequestMapping("/admin")
public class AdminMemberController {
   @Autowired
   private MemberService memberService;
   //로그인
   @RequestMapping(value="/login",method=RequestMethod.POST)
   public ModelAndView loginCheck(HttpServletRequest request,Member member) {
	   System.out.println("로그인 요청");
	   Member admin =null;
	  admin = memberService.logIn(member);
	   ModelAndView mav =null;
	   if(admin!=null) {
		   mav= new ModelAndView("redirect:/admin/member/list");
		   request.getSession().setAttribute("admin",admin);
	   }else {
		   mav=new ModelAndView("admin/login/error2");
	   }
	   return mav;
   }
   //목록 가져오기
   @RequestMapping(value="/member/test",method=RequestMethod.GET)
   public String test(HttpServletRequest request) {
	   System.out.println("목록보기 요청");
	   
	   return "/admin/login/test";
   }
   
   //목록 가져오기
   @RequestMapping(value="/member/list",method=RequestMethod.GET)
	public ModelAndView selectAll(HttpServletRequest request) {
	   System.out.println("목록보기 요청");
		List<Member> memberList = memberService.selectAll();
		ModelAndView mav = new ModelAndView("admin/member/list");
		mav.addObject("memberList", memberList);
		return mav;
	}
   
   //한건 가져오기
   @RequestMapping(value="/member/detail",method=RequestMethod.GET)
   public ModelAndView select(int member_id) {
	   System.out.println("상세보기 요청");
	      Member member=memberService.select(member_id);
	      ModelAndView mav=new ModelAndView("admin/member/detail");
	      mav.addObject("member",member);
	      
	      return mav;
   }
   
   //등록하기
   @RequestMapping(value="/member/regist",method=RequestMethod.POST)
   public ModelAndView insert(Member member, int grade_id) {
	      Grade grade = new Grade();
	      grade.setGrade_id(grade_id);
	      member.setGrade(grade);
	      memberService.insert(member);
	      ModelAndView mav=new ModelAndView("redirect:/admin/member/list");
      return mav;
   }
   
   //삭제하기
   @RequestMapping(value="/member/delete",method=RequestMethod.POST) //jsp파일에서 겟인지 포스튼지 확인
   public ModelAndView delete(int member_id) {
      System.out.println("삭제 요청");
      memberService.delete(member_id);
      ModelAndView mav=new ModelAndView("redirect:/admin/member/list");

      return mav;
      }

   //수정하기   
   @RequestMapping(value="/member/edit", method=RequestMethod.POST)
   public ModelAndView update(Member member, int grade_id) {
      Grade grade = new Grade();
      grade.setGrade_id(grade_id);
      member.setGrade(grade);
      memberService.update(member);
      ModelAndView mav=new ModelAndView("redirect:/admin/member/list");
      return mav;
   }
   

   @ExceptionHandler(AccountNotFoundException.class)
   public ModelAndView handleException(AccountNotFoundException e) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("admin/error/errorpage");
      mav.addObject("err", e);
      return mav;
   }
   @RequestMapping(value="/member/search")
   public ModelAndView search(Member member) {
	   List<Member> memberList = memberService.search(member);
	   ModelAndView mav = new ModelAndView("admin/member/list");
	   mav.addObject("memberList",memberList);
	   return mav;
   }
   
   @ExceptionHandler(RegistFailException.class)
   public String registException(RegistFailException e) {
      StringBuffer sb=new StringBuffer();
      sb.append("{");
      sb.append("\"result\":0");
      sb.append("}");
      return sb.toString();
   }
   @ExceptionHandler(EditFailException.class)
   public String editException(EditFailException e) {
	   return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
   }
   @ExceptionHandler(DeleteFailException.class)
   public String deleteException(DeleteFailException e) {
	   return "{\"resultCode\":0,\"msg\":\""+e.getMessage()+"\"}";
   }

}