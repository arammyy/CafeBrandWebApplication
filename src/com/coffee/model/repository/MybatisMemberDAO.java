package com.coffee.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coffee.model.domain.Member;

@Repository
public class MybatisMemberDAO implements MemberDAO {
   @Autowired
   private SqlSessionTemplate sessionTemplate;

   @Override
   public int insert(Member member) {
      return sessionTemplate.insert("Member.insert", member);
   }
      
   @Override
   public List selectAll() {
      return sessionTemplate.selectList("Member.selectAll");
   }

   @Override
   public Member select(int member_id) {
      return sessionTemplate.selectOne("Member.select", member_id);
   }

   @Override
   public int update(Member member) {
      return sessionTemplate.update("Member.update", member);
   }

   @Override
   public int updatePoint(Member member) {
      // TODO Auto-generated method stub
      return sessionTemplate.update("Member.updatePoint", member);
   }

   @Override
   public int delete(int member_id) {
      return sessionTemplate.delete("Member.delete", member_id);
   }

   @Override
   public Member logIn(Member member) {
	 
	   return sessionTemplate.selectOne("Member.login", member);
   }

   @Override
	public Member findId(Member member) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("Member.findId", member);
	}

	@Override
	public Member findPass(Member member) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("Member.findPass", member);
	}

	@Override
	public Member checkInfo(Member member) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("Member.checkinfo", member);
	}

	@Override
	public int changePass(Member member) {
		// TODO Auto-generated method stub
		System.out.println("dao±îÁö ¿È..");
		return sessionTemplate.update("Member.changepass", member);
	}

	@Override
	public Member checkPhone(Member member) {
		return sessionTemplate.selectOne("Member.checkphone", member);
	}

	@Override
	public List search(Member member) {
		return sessionTemplate.selectList("Member.search", member);
	}

}