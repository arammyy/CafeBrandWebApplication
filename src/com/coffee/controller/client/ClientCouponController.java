package com.coffee.controller.client;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.coffee.model.domain.Coupon;
import com.coffee.model.domain.Member;
import com.coffee.model.domain.Product;
import com.coffee.model.service.CouponService;
import com.coffee.model.service.MemberService;
import com.coffee.model.service.ProductService;

@RestController
public class ClientCouponController {
	@Autowired
	private CouponService couponService;
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/client/coupon/add", method=RequestMethod.POST)
	public String addNewCoupon(int product_id, int ea, HttpServletRequest request) {
		Product product = productService.select(product_id);
		Member member = (Member)request.getSession().getAttribute("client");
		Coupon coupon = new Coupon();
		coupon.setProduct(product);
		coupon.setEa(ea);		
		coupon.setMember(member);
		couponService.insert(coupon, member);
		
		member = memberService.select(member.getMember_id());
		
		return "{\"resultCode\":1, \"msg\":\"등록 성공\"}";
	}
	
	@RequestMapping(value="/client/product/{product_id}", method=RequestMethod.POST)
	public String isEnoughPt(@PathVariable("product_id") int product_id, int ea, HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("client");
		member=memberService.select(member.getMember_id());
		request.getSession().setAttribute("client", member);
		Product product = productService.select(product_id);
		int checkPt = product.getCost()*ea;
		String result =  "{\"resultCode\":0}";
		System.out.println(checkPt);
		if(member.getPoint()>=checkPt) {
			result="{\"resultCode\":1}";
		}
		return result;
	}
}