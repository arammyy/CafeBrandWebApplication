package com.coffee.model.repository;

import java.util.List;

import com.coffee.model.domain.Member;

public interface MemberDAO {
	public int insert(Member member);
	public List selectAll();
	public Member select(int member_id);
	public int update(Member member);
	public int updatePoint(Member member);
	public int delete(int member_id);
	public Member logIn(Member member);
	public Member findId(Member member);
	public Member findPass(Member member);
	public Member checkInfo(Member member);
	public int changePass(Member member);
	public Member checkPhone(Member member);
	public List search(Member member);
}
