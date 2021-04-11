/*
 * package com.kh.toy.member;
 * 
 * 
 * 
 * import java.util.List;
 * 
 * import static org.assertj.core.api.Assertions.*;
 * 
 * import org.junit.Test; import org.junit.jupiter.api.Assertions; import
 * org.junit.jupiter.api.AfterEach;
 * 
 * import com.kh.toy.member.model.repository.MemoryMemberRepository; import
 * com.kh.toy.member.model.vo.Member;
 * 
 * public class MemoryMemberRepositoryTest {
 * 
 * 
 * MemoryMemberRepository repository = new MemoryMemberRepository();
 * 
 * @AfterEach public void afterEach() { repository.clearStore(); }
 * 
 * @Test public void save() { Member member = new Member();
 * member.setMemberName("spring");
 * 
 * repository.save(member);
 * 
 * Member result = repository.findById(member.getMemberId()).get();
 * assertThat(member).isEqualTo(result); System.out.println(member);
 * 
 * }
 * 
 * @Test public void findByName() { Member member1 = new Member();
 * member1.setMemberName("spring1"); repository.save(member1);
 * 
 * Member member2 = new Member(); member2.setMemberName("spring2");
 * repository.save(member2);
 * 
 * Member result = repository.findByName("spring1").get();
 * 
 * assertThat(result).isEqualTo(member1);
 * 
 * System.out.println(member1); }
 * 
 * @Test public void findAll() { Member member1 = new Member();
 * member1.setMemberName("spring1"); repository.save(member1);
 * 
 * Member member2 = new Member(); member2.setMemberName("spring2");
 * repository.save(member2);
 * 
 * List<Member> result = repository.findAll();
 * 
 * assertThat(result.size()).isEqualTo(2);
 * 
 * System.out.println(result);
 * 
 * 
 * }
 * 
 * 
 * }
 */