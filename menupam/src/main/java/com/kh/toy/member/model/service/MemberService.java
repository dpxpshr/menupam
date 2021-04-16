package com.kh.toy.member.model.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.toy.member.model.repository.MemberRepository;
import com.kh.toy.member.model.vo.Member;
import com.kh.toy.shop.model.vo.Shop;

public interface MemberService {
	
	
	Member selectMemberById(String MemberId);
	void authenticateEmail(Member persistUser, String authPath);
	int insertMember(Member member);
	Member authenticateUser(Member member);
	
	
	Map<String,Object>selectMemberList(int page);
	
	List<Member>selectMemberAll(String memberId,String memberName);
	
	List<Member>memberAll(String memberId,String memberName);
	
	List<Member>findMember();
	
	Member updateMemberTell(Member member);
	
	int updateMember(Member member);
	
	Member memberView(String memberId);
	
	void MemberInfoModify(Member member, String memberId);
	
	Member selectUserInfo(String userMember);
	
}
