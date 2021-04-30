package com.kh.toy.member.model.repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.toy.common.util.paging.Paging;
import com.kh.toy.member.model.vo.Member;
import com.kh.toy.shop.model.vo.Shop;

@Mapper
public interface MemberRepository {

	List<Member> selectMemberAll();

	List<Member> selectMemberList(Paging paging);

	public Member readMember(String memberId) throws Exception;

	@Select("select count(*) from tb_member")
	int selectContentCnt();

	@Select("select * from tb_member where member_id = #{memberId}")
	Member selectMemberById(String memberId);
	
	@Select("select * from tb_member where member_email = #{memberEmail}")
	Member selectMemberEmail(String memberEmail);
	
	// @Select("select * from tb_member where member_id = #{memberId}") 뒤 and
	// member_leave_date = null
	@Select("select * from tb_member where member_id = #{memberId}")
	Member selectMemberForAuth(String memberId);

	@Select("select count(*) from tb_member where member_email = #{memberEmail}")
	int selectMemberByEmail(String memberEmail);

	@Select("select count(*) from tb_member where member_phone = #{memberPhone}")
	int selectMemberByTell(String memberPhone);

	@Insert("insert into tb_member(member_id,member_pw,member_name,member_phone,member_email)"
			+ " values(#{memberId},#{memberPw},#{memberName},#{memberPhone},#{memberEmail})")
	int insertMember(Member member);
	
	@Insert("insert into tb_member(member_id,member_pw,member_name,member_phone,member_email,company_num,member_type)"
			+ " values(#{memberId},#{memberPw},#{memberName},#{memberPhone},#{memberEmail},#{companyNum},'MT10')")
	int insertCeo(Member member);

	Member save(Member member);

	Optional<Member> findById(String MemberId);

	Optional<Member> findByName(String MemberName);

	List<Member> findAll(@Param("memberId") String memberId, @Param("memberName") String memberName);



	// 4
	int updateMember(Member member);

	@Select("select * from tb_member where member_id = #{memberId}")
	Member selectUserInfo(String memberId);
	
	@Select("select * from tb_member where member_id = #{memberId}")
	Member memberView(String memberId);

	int adminModify(Member member);
	
	@Select ("select member_id from tb_member where member_email = #{memberEmail}")
	Member findId(Member member);

	int leaveMember(Member member);
	
	int restoreMember(Member member);
	
}
