package com.kh.toy.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.toy.member.model.vo.Member;

@Mapper
public interface MybatisRepository {
	
	@Select("select * from tb_member where member_id = #{memberId}")
	Member selectOne(String userId);
	
	List<Map<String,Object>> selectListReturnedAsMap(String userId);

	List<Map<String,Object>> resultMap(String userId);
	
	@Select("select * from tb_member")
	List<Member> selectList();
	
	@Insert("insert into tb_member(member_id,member_Pw,member_name,member_phone,member_email)"
			+ "	values(#{memberId},#{memberPw},#{memberName},#{memberPhone},#{memberEmail})")
	int insertWithVo(Member member);
	
	@Insert("insert into tb_rent_master(rm_idx,user_id,title,rent_book_cnt)"
			+ "		values(sc_rm_idx.nextval,#{member.userId},#{title},#{rentBookCnt})")
	int insertWithMap(Map<String,Object> commandMap);
	
	@Update("update tb_member set member_Pw = #{memberPw} where member_id = #{memberId}")
	int update(Member member);
	
	void procedure(String bIdx);
	
	List<Map<String,Object>> dynamicQueryIF(Map<String,Object> commandMap);
	
	List<Map<String,Object>> dynamicQueryChoose(Map<String,Object> commandMap);
	
	int dynamicQuerySetTag(Member member);
	
	List<Member> dynamicQueryForeachTagWithList(List<String> userList);
	
	int dynamicQueryForeachTag(Map<String,Object> commandMap);
	
	List<Map<String,Object>> dynamicQueryWhereAndForeachTag(Map<String,Object> commandMap);
	
	
	
}
