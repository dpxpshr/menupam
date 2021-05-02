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
import com.kh.toy.waiting.model.vo.Waiting;


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

	// 3 마이페이지 번호수정
	@Override
	public void MemberInfoModify(Member member, String phone) {

		member.setMemberPhone(phone);
		memberRepository.updateMember(member);

	}
	//회원탈퇴 관리자
	@Override
	public int leaveMember(Member member) {
		
	return memberRepository.leaveMember(member);
	}
	//회원 탈퇴 마이페이지
	@Override
	public int leaveUser(Member userInfo) {
		
	return memberRepository.leaveUser(userInfo);
	}
	
	//관리자 수정
	@Override
	public int adminMemberModify(Member member) {
		
		return memberRepository.adminModify(member);
		
	}
	
	//id찾기
	@Override
	public Member findId(String memberEmail) {
		
		System.out.println("서비스impl 이메일 : " +memberEmail);
		
		//이메일 정보 -> 멤버ID 조회 
		return memberRepository.findId(memberEmail);
	}
	//pw찾기
	@Override
	public Member findPw(String memberId) {
		
		System.out.println("서비스impl memberId : "  + memberId );
		
		
		return memberRepository.findPw(memberId);
	}
	
	
	//회원 복구
	@Override
	public int restoreMember(Member member) {
		
		
		return memberRepository.restoreMember(member);
	}


	//예약 현황
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
	
	
	//대기 현황
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
	
	
	//패스워드 찾기
	@Override
	public int updatePw(Member member ,String Pw) {
		
		member.setMemberPw(Pw);
		return memberRepository.updatePw(member);
		
		
	}
	//X
	@Override
	public void modifyPw(Member member, String Pw) {
		
		
		
		member.setMemberPw(Pw);
		 memberRepository.modifyPw(member);
		 
	}
	//이메일 체크
	@Override
	public int selectMemberEmailcheck(String memberEmail) {
		
		return memberRepository.selectMemberEmailCheck(memberEmail);
	}
	
	//ㅊ
	@Override
	public int cancelReser(Member userInfo) {
		
		return memberRepository.cancelReser(userInfo);
	}
	//예약취소====================================================================================================================================
	
	@Override
	public Reservation reserPass(String reserIdx) {
		
		// Reservation reservation을 매개변수로 받았었다 String reserIdx (O)
		 
		return memberRepository.selectReser(reserIdx);
		
	}
	
	
	@Override
	public int updateReser(Reservation reservation) {
		//System.out.println("reservation" + reservation);
		reservation.setReserState("예약취소");
		
		return memberRepository.updateReser(reservation);
	}
	//대기취소====================================================================================================================================
	@Override
	public Waiting selectWait(String waitIdx) {
		System.out.println("waiting" + waitIdx);
		
		
		return memberRepository.selectWait(waitIdx);
	}
	
	@Override
	public int updateWait(Waiting waiting) {
		
		//waiting DB에 넣을 값을 대기취소로 넣어줌
		waiting.setWaitState("대기취소");
		return memberRepository.updateWait(waiting);
	}
	
	@Override
	public Member selectPw(String memberId) {
		System.out.println("memberId : " + memberId);
		
		
		
		return memberRepository.selectPw(memberId);
	}

	




	

	


	

}
