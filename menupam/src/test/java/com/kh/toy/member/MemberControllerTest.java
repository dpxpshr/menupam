package com.kh.toy.member;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

import com.kh.toy.member.model.vo.Member;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.*;

//媛��긽�쑝濡� 留뚮뱾�뼱吏��뒗 web.xml�쓣 �궗�슜�빐 �뀒�뒪�듃�솚寃쎌쓣 援ъ텞
@WebAppConfiguration
//Junit�쓽 �떎�뻾 諛⑸쾿�쓣 吏��젙
//�뀒�뒪�듃 �븣 �궗�슜�븷 媛��긽�쓽 applicationContext瑜� �깮�꽦�븯怨� 愿�由ы빐以��떎.
@RunWith(SpringJUnit4ClassRunner.class)
//媛��긽 applicationContext瑜� �깮�꽦�븷 �븣 �궗�슜�븷 Spring bean �꽕�젙�뙆�씪�쓽 �쐞移섎�� 吏��젙
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})

public class MemberControllerTest {
	
	 @Autowired
	 WebApplicationContext context;
	
	 private MockMvc mockMvc;
	 
	 //�뀒�뒪�듃瑜� �닔�뻾�븯湲� �쟾�뿉 �떎�뻾�븷 硫붿꽌�뱶
	 @Before
	 public void setup() {
		 this.mockMvc = webAppContextSetup(context).build();
	 }
	
	 @Test
	 public void joinTest() throws Exception {
		 mockMvc
		 .perform(get("/member/join"))
		 .andDo(print());
	 }
	
	@Test
	 public void idCheckTest() throws Exception {
		 mockMvc
		 .perform(get("/member/idcheck")
				 .param("memberId", "kim1"))
		 .andDo(print());
	 }
	
	@Test
	
	 public void authenticateEmailTest() throws Exception {
		
		Member member = new Member();
		member.setMemberEmail("ajxjfehtkd@nate.com");
		member.setMemberId("testUser");
		member.setMemberPw("1234");
		member.setMemberName("김승현");
		member.setMemberPhone("010-0112-0119");
		
		 mockMvc
		 .perform(post("/member/mailauth")
				 .param("memberId", "testUser")
				 .param("memberPw", "1234")
				 .param("memberEmail", "ajxjfehtkd@nate.com")
				 .param("memberName", "김승현")
				 .param("memberPhone","010-0112-0119")
				 )
		 .andDo(print());
		 
		 mockMvc.perform(
				 get("/member/joinimpl")
				 .sessionAttr("persistInfo", member)
				 )
		 .andDo(print());
		 
	 }
	
	
	
	
	
	
	
	
	
	
	
	
	
}
