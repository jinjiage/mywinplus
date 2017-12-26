package com.demo.dao.jinge;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import org.springframework.data.repository.query.Param;

import com.demo.model.Member;

public interface MemberOneRepository extends JpaRepository<Member, Integer> ,JpaSpecificationExecutor<Member>{
	@Query(value="select count(*) from member where mobile_phone =?",nativeQuery=true)
	public Integer findOne(String phone);
	@Query(value="select count(*) from member where name =?",nativeQuery=true)
	public Integer findByName(String string);
	@Query(value="select m from Member m where m.mobile_Phone =:mobile_Phone and m.password=:password")
	public Member findMember(@Param("mobile_Phone") String mobile_Phone,@Param("password") String password);
	@Query(value="select m from Member m where m.mobile_Phone = ?")
	public Member findMemberByPhone(String mobile_Phone);
}
