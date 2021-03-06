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

		mailSender.send(persistUser.getMemberEmail(), "?????? ????????? ???????????????.", response.getBody());
	}
	//????????????
	@Override
	public int insertMember(Member member) {
		member.setMemberPw(passwordEncoder.encode(member.getMemberPw()));
		return memberRepository.insertMember(member);
	}
	//?????? ????????????
	@Override
	public int insertCeo(Member member) {
		member.setMemberPw(passwordEncoder.encode(member.getMemberPw()));
		return memberRepository.insertCeo(member);
	}

	@Override
	public Member authenticateUser(Member member) {

		Member userInfo = memberRepository.selectMemberForAuth(member.getMemberId());
		// || -> && ??????
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
		System.out.println("?????????????" + commandMap);
	
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

	// 3 ??????????????? ????????????
	@Override
	public void MemberInfoModify(Member member, String phone) {

		member.setMemberPhone(phone);
		memberRepository.updateMember(member);

	}
	//???????????? ?????????
	@Override
	public int leaveMember(Member member) {
		
	return memberRepository.leaveMember(member);
	}
	//?????? ?????? ???????????????
	@Override
	public int leaveUser(Member userInfo) {
		
	return memberRepository.leaveUser(userInfo);
	}
	
	//????????? ??????
	@Override
	public int adminMemberModify(Member member) {
		
		return memberRepository.adminModify(member);
		
	}
	
	//id??????
	@Override
	public Member findId(String memberEmail) {
		
		System.out.println("?????????impl ????????? : " +memberEmail);
		
		//????????? ?????? -> ??????ID ?????? 
		return memberRepository.findId(memberEmail);
	}
	//pw??????
	@Override
	public Member findPw(String memberId) {
		
		System.out.println("?????????impl memberId : "  + memberId );
		
		
		return memberRepository.findPw(memberId);
	}
	
	
	//?????? ??????
	@Override
	public int restoreMember(Member member) {
		
		
		return memberRepository.restoreMember(member);
	}


	//?????? ??????
	@Override
	public Map<String, Object> selectshop(String memberId) {
		
		 
		
		
		Map<String,Object> commandMap = new HashMap<String,Object>();
		commandMap.put("shopst", memberRepository.selectShop(memberId));
		
		
		//List<Reservation> resList = memberRepository.selectReservation(memberId);
		//List<Shop> shopList = new ArrayList<Shop>();
		
		// 1. ???????????? : ???????????? 2. ???????????? : ???????????? 3. ??????
		// for (Reservation reservation : resList) {
		//	String shopIdx = reservation.getShopIdx();
		//	shopList.add(memberRepository.selectShop(shopIdx));
		//}
		
		//1. ?????????, ?????? ????????????, ?????? ??????
		// resList, shopList ?????? -> ????????????, ?????? ????????????, ?????? ?????? ~~~~~
		
		
		return commandMap;
	}
	
	
	//?????? ??????
	@Override
	public Map<String, Object> selectwaiting(String memberId) {
		
		Map<String,Object> commandMap = new HashMap<String,Object>();
		commandMap.put("waitingst", memberRepository.selectWaiting(memberId));
		
		return commandMap;
	}


	

	// ============================================???????????????============================================
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
	
	
	//???????????? ??????
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
	//????????? ??????
	@Override
	public int selectMemberEmailcheck(String memberEmail) {
		
		return memberRepository.selectMemberEmailCheck(memberEmail);
	}
	
	//???
	@Override
	public int cancelReser(Member userInfo) {
		
		return memberRepository.cancelReser(userInfo);
	}
	//????????????====================================================================================================================================
	
	@Override
	public Reservation reserPass(String reserIdx) {
		
		// Reservation reservation??? ??????????????? ???????????? String reserIdx (O)
		 
		return memberRepository.selectReser(reserIdx);
		
	}
	
	
	@Override
	public int updateReser(Reservation reservation) {
		//System.out.println("reservation" + reservation);
		reservation.setReserState("????????????");
		
		return memberRepository.updateReser(reservation);
	}
	//????????????====================================================================================================================================
	@Override
	public Waiting selectWait(String waitIdx) {
		System.out.println("waiting" + waitIdx);
		
		
		return memberRepository.selectWait(waitIdx);
	}
	
	@Override
	public int updateWait(Waiting waiting) {
		
		//waiting DB??? ?????? ?????? ??????????????? ?????????
		waiting.setWaitState("????????????");
		return memberRepository.updateWait(waiting);
	}
	
	@Override
	public Member selectPw(String memberId) {
		System.out.println("memberId : " + memberId);
		
		
		
		return memberRepository.selectPw(memberId);
	}

	




	

	


	

}
