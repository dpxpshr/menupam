package com.kh.toy.member.controller;

import java.text.DateFormat;
import java.util.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.toy.common.code.Code;
import com.kh.toy.common.code.ErrorCode;
import com.kh.toy.common.exception.ToAlertException;
import com.kh.toy.common.util.naver.NaverUtil;
import com.kh.toy.member.model.service.MemberService;
import com.kh.toy.member.model.vo.Member;
import com.kh.toy.member.validator.MemberValidator;
import com.kh.toy.shop.model.service.ShopSerivce;
import com.kh.toy.shop.model.vo.Shop;

import oracle.jdbc.proxy.annotation.Post;

//1. 해당 클래스를 applicationContext에 빈으로 등록
//2. Controller와 관련된 annotation을 사용할 수 있게 해준다.
//	 @RequestMapping : 컨트롤러의 메서드와 매핑시킬 요청 url을 지정, http method 상관없음
//	 @GetMapping : 컨트롤러의 메서드와 매핑시킬 요청 url을 지정 get method만 매핑
//   @PostMapping : 컨트롤러의 메서드와 매핑시킬 요청 url을 지정 post method만 매핑
//	 @RequestParam : 요청 파라미터를 컨트롤러 메서드의 매개변수에 바인드
//				FormHttpMessageConverter가 동작, Content-type : form-url-encoded	
//				속성 >> name : 요청파라미터명, 컨트롤러메서드의 매개변수명과 요청파라미터명이 같으면 생략 가능
//						required : 필수 여부 default : true
//						defaultValue : 파라미터가 없거나, 빈값이 넘어왔을 때 세팅할 기본 값
//						value : name alias, ex) @RequestParam("userId")
//	 @RequestBody : json포멧으로 넘어온 요청바디를 읽어서 자바의 객체에 바인드
//				MappingJacksonHttpMessageConverter가 동작 Content-type : application/json
//	 @ModelAttribute : 요청 파라미터를 VO에 바인드, VO에 바인드함과 동시에 Model에 VO를 담는다.
//	 @RequestHeader : 요청해더를 컨트롤러의 매개변수에 바인드
//	 @SessionAttribute : 원하는 Session의 속성을 컨트롤러의 매개변수에 바인드
//	 @CookieValue : 원하는 Cookie의 값을 컨트롤러의 매개변수에 바인드
//	 @PathVariable : url 템플릿에 담긴 파라미터값을 컨트롤러의 매개변수에 바인드
//   @ResponseBody : 컨트롤러의 메서드 위에 작성, 메서드가 반환하는 값을 응답바디에 직접 넣어준다.

// *** Servlet 객체(HttpServletRequest, HttpServletResponse, HttpSession) 들을
//   컨트롤러 메서드의 매개변수로 전달받을 수 있다.
//   HttpEntity, RequestEntity, ResponseEntity

@Controller
@RequestMapping("member")
public class MemberController {

	// 로깅 객체 생성
	Logger logger = LoggerFactory.getLogger(this.getClass());

	private final MemberService memberService;
	MemberValidator memberValidator;

	public MemberController(MemberService memberService, MemberValidator memberValidator) {
		this.memberService = memberService;
		this.memberValidator = memberValidator;
	}

	// InitBinder : WebDataBinder를 초기화하는 메서드를 식별하는 주석
	// value : webDataBinder가 적용될 파라미터 명 또는 Model의 attribute 이름
	@InitBinder(value = "member")
	public void initBinder(WebDataBinder webDataBinder) {
		// WebDataBinder : 컨트로러 메서드의 파라미터에 데이터를 bind 해주는 역할 수행
		webDataBinder.addValidators(memberValidator);
	}

	
	//==========================================================================================================
	@GetMapping("join")
	public void member() {
	};

	
	//==========================================================================================================

	@GetMapping("ceojoin")
	public void ceomember(){
		
	};
	//==========================================================================================================

	@GetMapping("idcheck")
	@ResponseBody
	public String idcheck(String memberId) {
		if (memberService.selectMemberById(memberId) != null) {
			
			return "fail";
		}

		return "success";
	}

	//==========================================================================================================

	
	//==========================================================================================================

	@PostMapping("mailauth")
	public String authenticateEmail(@Valid Member persistInfo, Errors error // 반드시 @Valid 변수 바로 뒤에 작성
			, HttpSession session, Model model) {

		if (error.hasErrors()) {
			System.out.println("persi : " + persistInfo);
			System.out.println("===================================");
			System.out.println("validator error" + error);

			return "member/join";
		}
		
		System.out.println("persi : " + persistInfo);
		System.out.println("===================================");
		
		String authPath = UUID.randomUUID().toString();

		// session에 persistInfo 저장
		session.setAttribute("persistInfo", persistInfo);
		session.setAttribute("authPath", authPath);

		// memberService의 authenticateEmail 호출해서 회원가입 메일 발송
		memberService.authenticateEmail(persistInfo, authPath);

		// 메일발송 안내창 출력 후 index페이지로 페이지 이동
		model.addAttribute("msg", "이메일 발송이 완료되었습니다.");
		model.addAttribute("url", "/index");

		return "common/result";
	}

	//==========================================================================================================

	
	//==========================================================================================================

	@GetMapping("joinimpl/{authPath}")
	public String joinImpl(HttpSession session, @PathVariable String authPath,
			@SessionAttribute("authPath") String sessionPath, @SessionAttribute("persistInfo") Member persistInfo,
			Model model) {

		if (!authPath.equals(sessionPath)) {
			throw new ToAlertException(ErrorCode.AUTH02);
		}

		memberService.insertMember(persistInfo);
		model.addAttribute("msg", "회원가입이 완료되었습니다.");
		model.addAttribute("url", "/index");
		session.removeAttribute("persistInfo");
		return "common/result";
	}
	//==========================================================================================================
	@GetMapping("ceojoinimpl/{authPath}")
	public String ceojoinImpl(HttpSession session, @PathVariable String authPath,
			@SessionAttribute("authPath") String sessionPath, @SessionAttribute("persistInfo") Member persistInfo,
			Model model) {
		logger.info("authPath : " + authPath);
		
		if (!authPath.equals(sessionPath)) {
			throw new ToAlertException(ErrorCode.AUTH02);
		}

		memberService.insertCeo(persistInfo);
		model.addAttribute("msg", "회원가입이 완료되었습니다.");
		model.addAttribute("url", "/index");
		session.removeAttribute("persistInfo");
		return "common/result";
	}
	
	//==========================================================================================================

	@GetMapping("login")
	public void login(HttpSession session) {
		//Naver아이디로  로그인 사용
		String state = new NaverUtil().generateState();
		session.setAttribute("state", state);
		
	};
	//==========================================================================================================

	
	
	//==========================================================================================================

	@PostMapping("loginimpl")
	@ResponseBody
	public String loginImpl(@RequestBody Member member, HttpSession session) {
		System.out.println("로그인 정보" + member);
		
		
		Member userInfo = memberService.authenticateUser(member);
		if (userInfo == null) {
			return "fail";
		}
		

		session.setAttribute("userInfo", userInfo);
		
		return "success";
	}
	//==========================================================================================================

	
	
	//로그아웃====================================================
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		// redirect 사용해보기
		return "redirect:/index";
	}
//==========================================================================================================
	// 마이페이지
	//@GetMapping("mypage")
	@RequestMapping(value = "mypage", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage() {
		return "member/mypage/mypage";
	};

	// 대기
	@GetMapping("mypage/waiting")
	public void waiting(@SessionAttribute("userInfo") Member userInfo
			 ,HttpSession session,Model model) {
		
		Map<String, Object> memberInfo = memberService.selectwaiting(userInfo.getMemberId());
		 
		 session.setAttribute("memberInfo", memberInfo);
		 model.addAllAttributes(memberService.selectwaiting(userInfo.getMemberId()));
		 model.addAttribute("member", memberInfo);
		 
		 System.out.println("memberinfo : " +memberInfo);
		 System.out.println("user : " +userInfo);
		 System.out.println("model : " +model);
		 System.out.println("session : " +session);
	};

	// 예약확인
	@GetMapping("mypage/reservation")
	public void reservation(@SessionAttribute("userInfo") Member userInfo
			 ,HttpSession session,Model model) {
		 Map<String, Object> memberInfo = memberService.selectshop(userInfo.getMemberId());
			
		 session.setAttribute("memberInfo", memberInfo);
		 model.addAllAttributes(memberService.selectshop(userInfo.getMemberId()));
		 model.addAttribute("member", memberInfo);
		 
		 System.out.println("memberinfo : " +memberInfo);
		 System.out.println("user : " +userInfo);
		 System.out.println("model : " +model);
		 System.out.println("mssstion : " +session);
		//Map<String,Object> shop = memberService. select
		
		//model.addAttribute("shop", shop);
		 //return "mypage/reservation";
	};
	//==========================================================================================================

	//회원 목록==========================================================================================================
	
	@GetMapping("adminList")
	public String selectMemberList(@RequestParam(defaultValue = "1") int page, Model model) {

		model.addAllAttributes(memberService.selectMemberList(page));
		
		return "member/adminList";
	};
	//==========================================================================================================

	
	
	// Xㄴ==========================================================================================================

	@PostMapping("selectUserInfo")
	@ResponseBody
	public void selectUserInfo(String userMember, Model model) {

		logger.info("memberId가 나오나 : ?" + userMember);
		Member userList = memberService.selectUserInfo(userMember);
		logger.info("userList" + userList.getMemberPhone());
		model.addAttribute("userList는? :", userList);

	}

	//==========================================================================================================

	
	
	//==========================================================================================================

	// 회원 정보 상세 조회
	//@PostMapping("memberview")
	@RequestMapping(value="detail", method = {RequestMethod.GET,RequestMethod.POST})
	public String memberView(String memberId, Model model) {
		
		Member member = memberService.getMember(memberId);
		
		model.addAttribute("member", member);

		logger.info("model : " + model);
		
		logger.info("Id : " + memberId);
		
		logger.info("memberView" + member);
		return "member/memberview";
	}
	
	@GetMapping("detailview")
	public String detailView() {
		return "member/memberview";
	}
	//==========================================================================================================

	//마이페이지 -> 사용자 번호 수정==========================================================================================================
	
	// 2
	@PostMapping("modify")
	public String modify(String phone, @SessionAttribute("userInfo") Member userInfo, Model model) {

		memberService.MemberInfoModify(userInfo, phone);

		return "member/mypage/mypage";
	}
	//==========================================================================================================
	//관리자 회원상세 -> 정보 수정
	
	@PostMapping("adminmodify")
	public String adminModify(Member member,Model model) {
		logger.info("모델 : " + model);
		memberService.adminMemberModify(member);
		logger.info("멤버 : " + member);
		
		model.addAllAttributes(memberService.selectMemberList(1));
		return "member/adminList";
	}
	//==========================================================================================================
	// ID
	//@PostMapping("findid")
	@RequestMapping(value="findIdForm", method = {RequestMethod.GET,RequestMethod.POST})
	public String findIdForm() {
		return "member/findIdForm";
	}
	
	
	
	@RequestMapping(value = "findId", method = {RequestMethod.GET, RequestMethod.POST})
	public String findId(String email,Model model) {
		
		
		
		
			//화면에 보여주기위한 역할 model
			//프론트 백 -> 동명이인
		 
		System.out.println("컨트롤러 모델" + model);
		System.out.println("컨트롤러 이메일 : " + email);
		
		Member member = memberService.findId(email);
		System.out.println(member);
		model.addAttribute("memberId", memberService.findId(email));

		return "member/findId";
	}

	 //@PostMapping("memberLeave")
	 @RequestMapping(value = "memberLeave", method = { RequestMethod.GET, RequestMethod.POST })
	 public String leaveMember(Member member,Model model) {
		 System.out.println("memberLeave 실행 : " + member);
		
		 memberService.leaveMember(member);
		 model.addAllAttributes(memberService.selectMemberList(1));
		 
		 return "member/adminList";
		 
		
	 }
	 
	 @RequestMapping(value = "memberRestore", method = { RequestMethod.GET, RequestMethod.POST })
	 public String restoreMember(Member member,Model model) {
		 
		 System.out.println("memberRestore 실행 : " + member);
		 
		 memberService.restoreMember(member);
		 model.addAllAttributes(memberService.selectMemberList(1));
		 return "member/adminList";
	 }
	 
		/*
		 * @RequestMapping(value = "reservation", method = { RequestMethod.GET,
		 * RequestMethod.POST }) public void shopstatus(@SessionAttribute("userInfo")
		 * Member userInfo ,HttpSession session,Model model) {
		 * 
		 * Map<String, Object> memberInfo =
		 * memberService.selectshop(userInfo.getMemberId());
		 * 
		 * session.setAttribute("memberInfo", memberInfo);
		 * model.addAllAttributes(memberService.selectshop(userInfo.getMemberId()));
		 * model.addAttribute("member", memberInfo);
		 * 
		 * System.out.println("memberinfo : " +memberInfo); System.out.println("user : "
		 * +userInfo); System.out.println("model : " +model);
		 * System.out.println("mssstion : " +session);
		 * 
		 * 
		 * }
		 * 
		 * @RequestMapping(value = "waiting", method = { RequestMethod.GET,
		 * RequestMethod.POST }) public void watingstatus(@SessionAttribute("userInfo")
		 * Member userInfo ,HttpSession session,Model model) {
		 * 
		 * Map<String, Object> memberInfo =
		 * memberService.selectwaiting(userInfo.getMemberId());
		 * 
		 * session.setAttribute("memberInfo", memberInfo);
		 * model.addAllAttributes(memberService.selectwaiting(userInfo.getMemberId()));
		 * model.addAttribute("member", memberInfo);
		 * 
		 * System.out.println("memberinfo : " +memberInfo); System.out.println("user : "
		 * +userInfo); System.out.println("model : " +model);
		 * System.out.println("session : " +session);
		 * 
		 * 
		 * }
		 */
	 @RequestMapping(value="findPwForm", method = {RequestMethod.GET,RequestMethod.POST})
		public String findPwForm() {
			return "member/findPwForm";
		}
	 
	 @PostMapping("findPw")
	 public String findPw(String memberId,Model model) {
		 
		 System.out.println("컨트롤러 호출");
		 System.out.println( memberId +"유저 아이디");
		 Member member = memberService.findPw(memberId);
		 
		 System.out.println("member 에 ?" + member);
		 
		 model.addAttribute("mem" ,member);
		 
		 
		 return "member/findPw";
	 }
	 @RequestMapping(value="updatePw", method = {RequestMethod.GET,RequestMethod.POST})
	 //@PostMapping("updatePw")
	 public String updatePw(Member member, Model model,String memberPw,String memberId) {
		 
		 memberService.updatePw(member, memberPw);
		 
		 System.out.println(member);
		 System.out.println(memberPw);
			
		 return "member/login";
	 }
	 //mypage modify
	 @RequestMapping(value="modifyPw", method = {RequestMethod.GET,RequestMethod.POST})
	public String modifyPw(String Pw,@SessionAttribute("userInfo") Member userInfo, Model model) {
		 
		 
		 
		 System.out.println("pass" + Pw);
		 memberService.modifyPw(userInfo,Pw);
		 
		 System.out.println("userInfo" + userInfo);
		 return "member/mypage/mypage";
		
	 }
	 
	
}
