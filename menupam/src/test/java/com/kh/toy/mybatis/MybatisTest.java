package com.kh.toy.mybatis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.toy.member.model.vo.Member;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class MybatisTest {
	
	@Autowired
	MybatisRepository mybatisRepository;
	private String memberId = "kim2";
	
	@Test
	public void selectOneTest() {
		System.out.println(mybatisRepository.selectOne(memberId));
	}
	
	@Test
	public void selectListReturnedAsMap() {
		mybatisRepository.selectListReturnedAsMap(memberId);
	}
	
	@Test
	public void selectList() {
		mybatisRepository.selectList();
	}
	
	@Test
	public void insertWithVo() {
		Member member = new Member();
		member.setMemberId("kim2");
		member.setMemberPw("1234");
		member.setMemberName("김승현");
		member.setMemberPhone("01001121190");
		member.setMemberEmail("test@test.com");
		
		mybatisRepository.insertWithVo(member);
	}
	
	//ㄴ
	@Test
	public void insertWithMap() {
		Map<String,Object> commandMap = new HashMap<>();
		Member member = new Member();
		
		member.setMemberId(memberId);
		commandMap.put("member", member);
		commandMap.put("title", "ㄴ");
		commandMap.put("rentBookCnt", 3);
		
		mybatisRepository.insertWithMap(commandMap);
	}
	
	@Test
	public void update() {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw("12345");
		mybatisRepository.update(member);
	}
	
	@Test
	public void procedure() {
		String bIdx = "100487";
		insertWithMap();
		mybatisRepository.procedure(bIdx);
	}
	
	@Test
	public void dynamicQueryIF() {
		//�궗�슜�옄媛� �룄�꽌 寃��깋�븘�꽣�뿉�꽌 info瑜� �꽑�깮�븯怨� 寃��깋�븯硫� �궗�슜�옄媛� �엯�젰�븳 �궎�썙�뱶濡� info 而щ읆�쓣 寃��깋
		//�궗�슜�옄媛� �룄�꽌 寃��깋�븘�꽣�뿉�꽌 author瑜� �꽑�깮�븯怨� 寃��깋�븯硫� �궗�슜�옄媛� �엯�젰�븳 �궎�썙�뱶濡� author 而щ읆�쓣 寃��깋
		//�궗�슜�옄 �꽑�깮 �븘�꽣 : info
		//�궗�슜�옄 �엯�젰 �궎�썙�뱶 : �룄�떆
		Map<String,Object> commandMap = new HashMap<String, Object>();
		commandMap.put("searchType","info");
		commandMap.put("keyword","�룄�떆");
		mybatisRepository.dynamicQueryIF(commandMap);
	}
	
	@Test
	public void dynamicQueryChoose() {
		//�궗�슜�옄媛� �룄�꽌 寃��깋�븘�꽣�뿉�꽌 info瑜� �꽑�깮�븯怨� 寃��깋�븯硫� �궗�슜�옄媛� �엯�젰�븳 �궎�썙�뱶濡� info 而щ읆�쓣 寃��깋
		//�궗�슜�옄媛� �룄�꽌 寃��깋�븘�꽣�뿉�꽌 author瑜� �꽑�깮�븯怨� 寃��깋�븯硫� �궗�슜�옄媛� �엯�젰�븳 �궎�썙�뱶濡� author 而щ읆�쓣 寃��깋
		//�궗�슜�옄媛� 寃��깋�븘�꽣瑜� 吏��젙 �븯吏� �븡�쓣 寃쎌슦 �룄�꽌 �젣紐⑹쑝濡� 寃��깋
		//�궗�슜�옄 �꽑�깮 �븘�꽣 : info
		//�궗�슜�옄 �엯�젰 �궎�썙�뱶 : �룄�떆
		Map<String,Object> commandMap = new HashMap<String, Object>();
		commandMap.put("searchType","title");
		commandMap.put("keyword","�룄�떆");
		mybatisRepository.dynamicQueryChoose(commandMap);
	}
	
	@Test
	public void dynamicQuerySetTag() {
		//�궗�슜�옄媛� �쉶�썝�닔�젙���뿉�꽌 �닔�젙�븳 �궡�슜�쓣 update�븯�뒗 荑쇰━瑜� �옉�꽦
		//�궗�슜�옄媛� password, email留� �닔�젙�뻽�떎硫�, update荑쇰━瑜�
		//[update tb_member set password = 1234, email = 'aa@aa.com' where userId = 'aa']
		
		Member member = new Member();
		member.setMemberId("test");
		member.setMemberEmail("test@update.com");
		//member.setPassword("123999000");
		member.setMemberPhone("010-1190-0112");
		mybatisRepository.dynamicQuerySetTag(member);
	}
	
	@Test
	public void dynamicQueryForeachTagWithList() {
		List<String> userList = new ArrayList<String>();
		userList.add("test");
		userList.add("CLASS");
		
		mybatisRepository
		.dynamicQueryForeachTagWithList(userList);
	}
	
	@Test
	public void dynamicQueryForeachTag() {
		//留뚮뒫 insert荑쇰━ �깮�꽦
		Map<String,Object> commandMap = new HashMap<String, Object>();
		commandMap.put("table", "tb_book");
		commandMap.put("primaryKey", Map.of("col", "b_idx","val","sc_b_idx.nextval"));
		commandMap.put("data"
				, Map.of("title","留뚮뒫�씤�꽌�듃�뿉���븳 3媛�吏� 怨좎같"
						,"author","�뵾�겢�옒�뒪"
						,"info","留덉씠諛뷀떚�뒪�쓽 �룞�쟻荑쇰━瑜� �솢�슜�븯�뒗 諛⑸쾿濡�"));
		mybatisRepository.dynamicQueryForeachTag(commandMap);
	}
	
	@Test
	public void dynamicQueryWhereAndForeachTag() {
		//寃��깋議곌굔�쓣 or �뿰�궛�쑝濡� 寃��깋�븯湲�
		//��異쒓��뒫, �젣紐�, �옉媛�
		//�궗�슜�옄媛� �엯�젰�븳 �궎�썙�뱶
		String[] searchType = {"title","author"};
		Map<String,Object> commandMap = new HashMap<String, Object>();
		commandMap.put("searchType", searchType);
		commandMap.put("keyword", "�룄�떆");
		mybatisRepository.dynamicQueryWhereAndForeachTag(commandMap);
	}
	
	@Test
	public void resultMap() {
		System.out.println(mybatisRepository.resultMap(memberId));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
