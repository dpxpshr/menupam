package com.kh.toy.member.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.toy.common.code.Code;
import com.kh.toy.common.mail.MailSender;
import com.kh.toy.common.util.http.HttpUtil;
import com.kh.toy.common.util.kakao.KakaoUtil;
import com.kh.toy.common.util.paging.Paging;
import com.kh.toy.member.model.repository.MemberRepository;
import com.kh.toy.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	KakaoUtil kakaoUtil = new KakaoUtil();

	private final MemberRepository memberRepository;

	/*
	 * @Inject private MemberRepository memberRepository;
	 */

	@Autowired
	private RestTemplate http;
	@Autowired
	private MailSender mailSender;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public MemberServiceImpl(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	@Override
	public Member selectMemberById(String memberId) {
		return memberRepository.selectMemberById(memberId);
	}

	public void authenticateEmail(Member persistUser, String authPath) {

		MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
		body.add("memberId", persistUser.getMemberId());
		body.add("mail-template", "temp_join");
		body.add("authPath", authPath);

		RequestEntity<Map> request = RequestEntity.post(Code.DOMAIN + "/mail")
				.contentType(MediaType.APPLICATION_FORM_URLENCODED).body(body);

		ResponseEntity<String> response = http.exchange(request, String.class);

		mailSender.send(persistUser.getMemberEmail(), "회원 가입을 축하합니다.", response.getBody());
	}

	@Override
	public int insertMember(Member member) {
		member.setMemberPw(passwordEncoder.encode(member.getMemberPw()));
		return memberRepository.insertMember(member);
	}

	@Override
	public Member authenticateUser(Member member) {

		Member userInfo = memberRepository.selectMemberForAuth(member.getMemberId());
		// || -> && 변경
		if (userInfo == null && !passwordEncoder.matches(member.getMemberPw(), userInfo.getMemberPw())) {
			return null;
		}
		
		return userInfo;
	}

	@Override
	public Map<String, Object> selectMemberList(int page) {

		Paging paging = Paging.builder().cuurentPage(page).blockCnt(5).cntPerPage(10).type("member")
				.total(memberRepository.selectContentCnt()).sort("member_name").direction("desc").build();

		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("paging", paging);
		commandMap.put("selectMemberList", memberRepository.selectMemberList(paging));
		System.out.println("커맨드맵?" + commandMap);

		return commandMap;

	}

	@Override
	public List<Member> selectMemberAll(String memberId, String memberName) {

		return memberRepository.findAll(memberId, memberName);
	}

	@Override
	public List<Member> memberAll(String memberId, String memberName) {

		List<Member> memberlist = null;

		return memberlist;
	}

	@Override
	public Member updateMemberTell(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(Member member) {

		return memberRepository.updateMember(member);
	}

	/*
	 * @Override public void Memberinfo(Member member, String memberId) {
	 * member.setMemberId(memberId);
	 * 
	 * member.setMemberPhone(member.getMemberPhone());
	 * 
	 * memberRepository.updateMember(member);
	 * 
	 * 
	 * }
	 */

	@Override
	public List<Member> findMember() {

		List<Member> memberlist = memberRepository.selectMemberAll();
		return memberlist;
	}

	@Override
	public Member selectUserInfo(String userMember) {

		return memberRepository.selectUserInfo(userMember);
	}

	@Override
	public Member memberView(String memberId) {

		return memberRepository.memberView(memberId);
	}

	// 3
	@Override
	public void MemberInfoModify(Member member, String phone) {

		member.setMemberPhone(phone);
		memberRepository.updateMember(member);

	}

	// ============================================소셜로그인============================================
	@Override
	public Map<String, Object> getKakaoMemberData(String code) {

		Map<String, String> tokenMap = kakaoUtil.getKakaoTokenMap(code);
		String accessToken = tokenMap.get("access_token");
		Map<String, Object> kakaoMemberData = kakaoUtil.getKakaoUser(accessToken);
		return kakaoMemberData;
	}

	

}
