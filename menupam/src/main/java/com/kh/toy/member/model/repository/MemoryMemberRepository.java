/*
 * package com.kh.toy.member.model.repository;
 * 
 * import java.util.ArrayList; import java.util.HashMap; import java.util.List;
 * import java.util.Map; import java.util.Optional;
 * 
 * import com.kh.toy.common.util.paging.Paging; import
 * com.kh.toy.member.model.vo.Member;
 * 
 * public class MemoryMemberRepository implements MemberRepository{
 * 
 * 
 * private static Map<String, Member> store = new HashMap<>(); private static
 * long sequence = 0L;
 * 
 * @Override public List<Member> selectMemberList(Paging paging) { // TODO
 * Auto-generated method stub return null; }
 * 
 * @Override public Member readMember(String memberId) throws Exception { //
 * TODO Auto-generated method stub return null; }
 * 
 * @Override public int selectContentCnt() { // TODO Auto-generated method stub
 * return 0; }
 * 
 * @Override public Member selectMemberById(String memberId) { // TODO
 * Auto-generated method stub return null; }
 * 
 * @Override public Member selectMemberForAuth(String memberId) { // TODO
 * Auto-generated method stub return null; }
 * 
 * @Override public int selectMemberByEmail(String memberEmail) { // TODO
 * Auto-generated method stub return 0; }
 * 
 * @Override public int selectMemberByTell(String memberPhone) { // TODO
 * Auto-generated method stub return 0; }
 * 
 * @Override public int insertMember(Member member) { // TODO Auto-generated
 * method stub return 0; }
 * 
 * @Override public Member save(Member member) { member.setMemberId("0");
 * store.put(member.getMemberId(), member);
 * 
 * 
 * return member;
 * 
 * }
 * 
 * @Override public List<Member> findAll() {
 * 
 * return new ArrayList<>(store.values());
 * 
 * }
 * 
 * @Override public Optional<Member> findById(String MemberId) {
 * 
 * return Optional.ofNullable(store.get(MemberId)); }
 * 
 * @Override public Optional<Member> findByName(String MemberName) { return
 * store.values().stream() .filter(member ->
 * member.getMemberName().equals(MemberName)) .findAny();
 * 
 * 
 * }
 * 
 * public void clearStore() { store.clear(); }
 * 
 * 
 * 
 * }
 */