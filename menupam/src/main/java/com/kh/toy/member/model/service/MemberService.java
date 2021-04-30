package com.kh.toy.member.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.toy.member.model.repository.MemberRepository;
import com.kh.toy.member.model.vo.Member;

import com.kh.toy.shop.model.vo.Shop;

public interface MemberService {

	Member selectMemberById(String MemberId);
	
	Member selectMemberEmail(String memberEmail);

	void authenticateEmail(Member persistUser, String authPath);

	int insertMember(Member member);
	
	int insertCeo(Member member);

	Member authenticateUser(Member member);

	Map<String, Object> selectMemberList(int page);

	List<Member> selectMemberAll(String memberId, String memberName);

	List<Member> memberAll(String memberId, String memberName);

	List<Member> findMember();


	int updateMember(Member member);

	Member getMember(String memberId);

	void MemberInfoModify(Member member, String phone);

	Member selectUserInfo(String userMember);

	Map<String, Object> getKakaoMemberData(String code);
	
	Map<String, String> getNaverMemberData(String code, String state);

	int adminMemberModify(Member member);
	
	Member findId(String email);
	
	int leaveMember(Member member);
	
	int restoreMember(Member member);
	
	
	
	
	Map<String,Object> selectshop(String memberId);
	Map<String,Object> selectwaiting(String memberId);

	Member findPw(String memberId);
	void updatePw(Member member,String memberPw);
	
	void modifyPw(Member member, String Pw);
	
}
