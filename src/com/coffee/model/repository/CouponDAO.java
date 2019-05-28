package com.coffee.model.repository;

import java.util.List;

import com.coffee.model.domain.Coupon;
import com.coffee.model.domain.Member;

public interface CouponDAO {
	public int insert(Coupon coupon);
	public int update(Coupon coupon);
	public Coupon select(Coupon coupon);
	public List selectByMember(Member member);
	public int delete(int coupon_id);
	public Coupon selectByPk(int coupon_id);
}
