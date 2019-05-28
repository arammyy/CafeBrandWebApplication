package com.coffee.model.service;

import java.util.List;

import com.coffee.model.domain.Member;

public interface MemberService {
	public void insert(Member member);
	public List selectAll();
	public Member select(int member_id);
	public void update(Member member);
	public void updatePoint(Member member);
	public void delete(int member_id);
	public Member logIn(Member member);
	public Member findId(Member member);
	public Member findPass(Member member);
	public Member checkInfo(Member member);
	public void changePass(Member member);
	public Member checkphone(Member member);
	public List search(Member member);
}
