package com.coffee.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coffee.model.domain.Coupon;
import com.coffee.model.domain.Member;
@Repository
public class MybatisCouponDAO implements CouponDAO{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insert(Coupon coupon) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("Coupon.insert", coupon);
	}

	@Override
	public int update(Coupon coupon) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("Coupon.updateEa", coupon);
	}

	@Override
	public int delete(int coupon_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("Coupon.delete", coupon_id);
	}

	@Override
	public Coupon select(Coupon coupon) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("Coupon.select", coupon);
	}

	@Override
	public List selectByMember(Member member) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("Coupon.selectByMember", member);
	}

	@Override
	public Coupon selectByPk(int coupon_id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("Coupon.selectByPk", coupon_id);
	}
	
}
