package com.kh.toy.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.toy.member.model.service.MemberService;
import com.kh.toy.member.model.vo.Member;

@Controller
@RequestMapping("social")
public class SocialController {

	
	private final MemberService memberService;

	public SocialController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping("kakaoOauth")
	public String kakaoLogin(String code, HttpSession session, Model model) {

		Map<String, Object> kakaoMember = memberService.getKakaoMemberData(code);
		Member member = memberService.selectMemberById((String)kakaoMember.get("id"));
		
		if(member == null) {
			model.addAttribute("member", kakaoMember);
			return "member/socialJoin";
		}else {
			session.setAttribute("userInfo", member);
			return "index/index";
		}
	}
	
	@PostMapping("joinImpl")
	public String joinImpl(Member member) {
		
		member.setMemberPw(member.getMemberId());
		memberService.insertMember(member);
		
		return "index/index";
	}
	
	@GetMapping("naverOauth")
	public String naverLogin(String code, String state, HttpSession session) {

		//State비교 진행 -> CSRF? 공격 때문에
		if(state.equals((String)session.getAttribute("state"))) {
			Map<String, String> profile = memberService.getNaverMemberData(code,state);
			Member member = memberService.selectMemberById((String)profile.get("id"));
			if(member == null) {
				member = new Member();
				member.setMemberId(profile.get("id"));
				member.setMemberPw(member.getMemberId());
				member.setMemberEmail(profile.get("email"));
				member.setMemberPhone(profile.get("mobile"));
				member.setMemberName(profile.get("name"));
				memberService.insertMember(member);
			}else {
				session.setAttribute("userInfo", member);
				System.out.println("회원가입함");
			}
		}
		return "index/index";
	}
}
