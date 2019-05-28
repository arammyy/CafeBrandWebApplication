package com.coffee.model.service;

import java.util.List;

import com.coffee.model.domain.Coupon;
import com.coffee.model.domain.Member;

public interface CouponService {
	public void insert(Coupon coupon, Member member);
	public void delete(int coupon_id);
	public void update(Coupon coupon);
	public List selectByMember(Member member);
	public Coupon select(int coupon_id);
}
