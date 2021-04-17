package com.kh.toy.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
}
