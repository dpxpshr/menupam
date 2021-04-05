package com.kh.toy.member.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.toy.common.util.paging.Paging;
import com.kh.toy.member.model.vo.Member;

@Mapper
public interface MemberRepository {
	
	List<Member>selectMemberList(Paging paging);
	
	@Select("select count(*) from tb_member")
	int selectContentCnt();
	
	@Select("select * from tb_member where member_id = #{memberId}")
	Member selectMemberById(String memberId);
	//@Select("select * from tb_member where member_id = #{memberId}") 뒤 and member_leave_date = null
	@Select("select * from tb_member where member_id = #{memberId}")
	Member selectMemberForAuth(String memberId);
	
	@Select("select count(*) from tb_member where member_email = #{memberEmail}")
	int selectMemberByEmail(String memberEmail);
	
	@Select("select count(*) from tb_member where member_phone = #{memberPhone}")
	int selectMemberByTell(String memberPhone);
	
	@Insert("insert into tb_member(member_id,member_pw,member_name,member_phone,member_email)"
			+ " values(#{memberId},#{memberPw},#{memberName},#{memberPhone},#{memberEmail})")
	int insertMember(Member member);
	
	
	
}
