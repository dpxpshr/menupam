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
import com.kh.toy.common.util.naver.NaverUtil;
import com.kh.toy.common.util.paging.Paging;
import com.kh.toy.member.model.repository.MemberRepository;
import com.kh.toy.member.model.vo.Member;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.shop.model.vo.Shop;


@Service
public class MemberServiceImpl implements MemberService {

	KakaoUtil kakaoUtil = new KakaoUtil();
	NaverUtil naverUtil = new NaverUtil();

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
	
	@Override
	public Member selectMemberEmail(String memberEmail) {
		System.out.println(memberEmail);
		
		return memberRepository.selectMemberEmail(memberEmail);
	
	}
	

	public void authenticateEmail(Member persistUser, String authPath) {

		MultiValueMap<String, Object> body = new LinkedMultiValueMap<String, Object>();
		body.add("memberId", persistUser.getMemberId());
		body.add("memberName", persistUser.getMemberName());
		body.add("memberType", persistUser.getMemberType());
		body.add("mail-template", "temp_join");
		body.add("authPath", authPath);

		RequestEntity<Map> request = RequestEntity.post(Code.DOMAIN + "/mail")
				.contentType(MediaType.APPLICATION_FORM_URLENCODED).body(body);

		ResponseEntity<String> response = http.exchange(request, String.class);

		mailSender.send(persistUser.getMemberEmail(), "회원 가입을 축하합니다.", response.getBody());
	}
	//회원가입
	@Override
	public int insertMember(Member member) {
		member.setMemberPw(passwordEncoder.encode(member.getMemberPw()));
		return memberRepository.insertMember(member);
	}
	//점주 회원가입
	@Override
	public int insertCeo(Member member) {
		member.setMemberPw(passwordEncoder.encode(member.getMemberPw()));
		return memberRepository.insertCeo(member);
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
	public int updateMember(Member member) {

		return memberRepository.updateMember(member);
	}

	

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
	public Member getMember(String memberId) {

		return memberRepository.memberView(memberId);
	}

	// 3
	@Override
	public void MemberInfoModify(Member member, String phone) {

		member.setMemberPhone(phone);
		memberRepository.updateMember(member);

	}
	@Override
	public int leaveMember(Member member) {
		
	return memberRepository.leaveMember(member);
	}


	@Override
	public int adminMemberModify(Member member) {
		
		return memberRepository.adminModify(member);
		
	}
	
	//X
	@Override
	public Member findId(String email) {
		
		System.out.println("서비스impl 이메일" +email);
		
		//이메일 정보 -> 멤버ID 조회 
		return memberRepository.findId(email);
	}
	
	@Override
	public Member findPw(String memberId) {
		
		System.out.println("서비스impl userId"  + memberId );
		
		
		return memberRepository.findPw(memberId);
	}
	
	
	
	@Override
	public int restoreMember(Member member) {
		
		
		return memberRepository.restoreMember(member);
	}


	
	@Override
	public Map<String, Object> selectshop(String memberId) {
		
		 
		
		
		Map<String,Object> commandMap = new HashMap<String,Object>();
		commandMap.put("shopst", memberRepository.selectShop(memberId));
		
		
		//List<Reservation> resList = memberRepository.selectReservation(memberId);
		//List<Shop> shopList = new ArrayList<Shop>();
		
		// 1. 가게이름 : 롯데리아 2. 가게이름 : 맥도날드 3. 버거
		// for (Reservation reservation : resList) {
		//	String shopIdx = reservation.getShopIdx();
		//	shopList.add(memberRepository.selectShop(shopIdx));
		//}
		
		//1. 게이름, 가게 전화번호, 예약 시간
		// resList, shopList 완성 -> 가게이름, 가게 전화번호, 예약 시간 ~~~~~
		
		
		return commandMap;
	}
	
	
	
	@Override
	public Map<String, Object> selectwaiting(String memberId) {
		
		Map<String,Object> commandMap = new HashMap<String,Object>();
		commandMap.put("waitingst", memberRepository.selectWaiting(memberId));
		
		return commandMap;
	}


	

	// ============================================소셜로그인============================================
	@Override
	public Map<String, Object> getKakaoMemberData(String code) {
		Map<String, String> tokenMap = kakaoUtil.getKakaoTokenMap(code);
		String accessToken = tokenMap.get("access_token");
		Map<String, Object> kakaoMemberData = kakaoUtil.getKakaoUser(accessToken);
		return kakaoMemberData;
	}

	@Override
	public Map<String, String> getNaverMemberData(String code, String state) {
		Map<String, String> tokenMap = naverUtil.getTokenMap(code, state);
		Map<String, String> profile = naverUtil.getProfileMap(tokenMap.get("token_type"), tokenMap.get("access_token"));
		return profile;
	}

	@Override
	public void updatePw(Member member,String memberPw) {
		
		member.setMemberPw(memberPw);
		memberRepository.updatePw(member);
		
		
	}

	@Override
	public void modifyPw(Member member, String Pw) {
		
		
		
		member.setMemberPw(Pw);
		 memberRepository.modifyPw(member);
	}
	
	

	




	

	


	

}
