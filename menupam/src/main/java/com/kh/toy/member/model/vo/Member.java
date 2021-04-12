package com.kh.toy.member.model.vo;

import java.sql.Date;


//TB_MEMBER ���̺��� ROW ������ ���� Ŭ����
public class Member {
	
	//MVC2 ���Ͽ��� M�� MODEL�� �ǹ���
	//MODEL�� ������ ��ü, �����Ͻ� ������ ����ϴ� SERVICE ��ü
	//DBMS�� ������ �����͸� ��ȸ, ����, ����, �����ϴ� DAO ��ü
	
	//������ ��ü : �����ͺ��̽� ���̺��� ��ȸ �ؿ� �� ��(ROW)�� 
	//���� �����ϴ� �뵵�� ����ϴ� ��ü
	//DOMAIN OBJECT, VALUE OBJECT(VO), DATA TRANSFER OBJECT(DTO)
	//ENTITY, BEAN
	
	//VO�� �Ǳ� ���� ����(JAVA BEAN �Ծ�)
	//1. ��� �ʵ庯���� PRIVATE�� ��.(ĸ��ȭ)
	//2. �ݵ�� �⺻�����ڰ� �����ؾ� �Ѵ�.
	//3. ��� �ʵ庯���� GETTER/SETTER �޼��带 ������ �Ѵ�.
	
	//����Ŭ�� �ڹ��� Ÿ�� ����

	//char, vachar2 -> String
	//date -> java.util.date, java.sql.date
	//number -> int, double
	
	/*   TB_MEMBER �÷���
	 *   USER_ID, PASSWORD, EMAIL, GRADE, TELL, REG_DATE
	 * , RENTABLE_DATE, IS_LEAVE
	 */
	
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberType;
	private String memberPhone;
	private String memberEmail;
	private Date memberRegDate;
	private Date memberLeaveDate;
	
	
	
	
	public Member() {
	
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public Date getMemberLeaveDate() {
		return memberLeaveDate;
	}
	public void setMemberLeaveDate(Date memberLeaveDate) {
		this.memberLeaveDate = memberLeaveDate;
	}
	public Date getMemberRegDate() {
		return memberRegDate;
	}
	public void setMemberRegDate(Date memberRegDate) {
		this.memberRegDate = memberRegDate;
	}
	
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberType=" + memberType + ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail
				+ ", memberLeaveDate=" + memberLeaveDate + ", memberRegDate=" + memberRegDate + "]";
	}
	

}
