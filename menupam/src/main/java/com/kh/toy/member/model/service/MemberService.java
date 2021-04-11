package com.kh.toy.member.model.service;


import java.util.List;
import java.util.Map;

import com.kh.toy.member.model.repository.MemberRepository;
import com.kh.toy.member.model.vo.Member;

public interface MemberService {
	
	
	Member selectMemberById(String MemberId);
	void authenticateEmail(Member persistUser, String authPath);
	int insertMember(Member member);
	Member authenticateUser(Member member);
	
	
	Map<String,Object>selectMemberList(int page);
	
	List<Member>findAll(String memberId,String memberName);
	
	List<Member>memberAll(String memberId,String memberName);
	
	Member updateMemberTell(Member member);
	
	int updateMember(Member member);
	void Memberinfo(Member member, String memberId);
	
}
