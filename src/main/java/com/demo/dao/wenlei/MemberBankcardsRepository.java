package com.demo.dao.wenlei;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.demo.model.MemberBankcards;
public interface MemberBankcardsRepository extends  JpaRepository<MemberBankcards,Integer>,JpaSpecificationExecutor<MemberBankcards>{

	@Modifying
	@Query("update   MemberBankcards  S   set S.delflag =?1 where S.id=?2")
	public void queryup(Integer delflag,Integer id);
	@Query(value="select e from MemberBankcards e where e.member.id =?1 and e.delflag =?2")
	public MemberBankcards getMemberBankcards(Integer id, Integer delflag);
	@Query("from   MemberBankcards  m  where m.card_no=?")
	public MemberBankcards getOneMember(String bankCard);
	
}
