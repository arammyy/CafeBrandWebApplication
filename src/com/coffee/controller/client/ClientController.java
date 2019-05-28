package com.coffee.controller.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.coffee.common.exception.EditFailException;
import com.coffee.model.domain.Coupon;
import com.coffee.model.domain.Member;
import com.coffee.model.service.CategoryService;
import com.coffee.model.service.CouponService;
import com.coffee.model.service.MemberService;
import com.coffee.model.service.ProductService;

@Controller
public class ClientController {
	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	CouponService couponService;
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/client/menu/getPage", method=RequestMethod.GET)
	public ModelAndView getMenuPage() {
		List menuList = productService.selectAll();
		List categoryList=categoryService.selectAll();
		ModelAndView mav = new ModelAndView("/client/coffeemenu");
		mav.addObject("menuList", menuList);
		mav.addObject("categoryList", categoryList);
		return mav;
	}
	@RequestMapping(value="/client/point/getPage", method=RequestMethod.GET)
	public ModelAndView getPointPage() {
		List ptMenuList=productService.selectPtAll();
		List categoryList=categoryService.selectAll();
		ModelAndView mav = new ModelAndView("/client/pointmall");
		mav.addObject("ptMenuList", ptMenuList);
		mav.addObject("categoryList", categoryList);
		return mav;
	}
	@RequestMapping(value="/client/item/getPage", method=RequestMethod.GET)
	public ModelAndView getItemPage(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("client");
		List couponList = couponService.selectByMember(member);
		System.out.println(couponList.size());
		ModelAndView mav = new ModelAndView("/client/member/inventory");
		mav.addObject("couponList", couponList);
		return mav;
	}
	
	@RequestMapping(value="/client/item/refund", method=RequestMethod.POST)
	public ModelAndView refundItem(Coupon coupon, HttpServletRequest request) {
		int refund_ea = Integer.parseInt(request.getParameter("refund_ea"));
		coupon = couponService.select(coupon.getCoupon_id());
		coupon.setEa(coupon.getEa()-refund_ea);
		couponService.update(coupon);
		Member member=(Member)request.getSession().getAttribute("client");
		member.setPoint(member.getPoint()+(coupon.getProduct().getCost()*refund_ea));
		System.out.println(member.getPoint());
		memberService.updatePoint(member);
		ModelAndView mav = new ModelAndView("redirect:/client/item/getPage");
		return mav;
	}
	@ExceptionHandler(EditFailException.class)
	public ModelAndView editExceptionHandler(EditFailException e) {
		return new ModelAndView("/client/error/EditFailError");
	}
}