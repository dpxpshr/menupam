package com.kh.toy.member.model.service;


import java.util.Map;

import com.kh.toy.member.model.vo.Member;

public interface MemberService {
	
	Member selectMemberById(String MemberId);
	void authenticateEmail(Member persistUser, String authPath);
	int insertMember(Member member);
	Member authenticateUser(Member member);
	
	
	
	Map<String,Object>selectMemberList(int page);
	

	
}
