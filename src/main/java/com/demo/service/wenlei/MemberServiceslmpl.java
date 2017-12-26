package com.demo.service.wenlei;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import org.springframework.stereotype.Service;

import com.demo.dao.wenlei.FinancialPlannerRepository;
import com.demo.dao.wenlei.MemberAccountRepository;
import com.demo.dao.wenlei.MemberDepositRecordRepository;
import com.demo.dao.wenlei.MemberRepository;
import com.demo.dao.wenlei.MemberTradeRecordRepository;
import com.demo.dao.wenlei.MemberWithdrawRecordRepository;
import com.demo.model.FinancialPlanner;
import com.demo.model.Member;
import com.demo.model.MemberAccount;
import com.demo.model.MemberDepositRecord;
import com.demo.model.MemberTradeRecord;
import com.demo.model.MemberWithdrawRecord;

@Service
public class MemberServiceslmpl implements MemberServices {
@Autowired
MemberRepository memberDao;
@Autowired
MemberWithdrawRecordRepository   memberWithdrawRecord;
@Autowired
FinancialPlannerRepository    financialPlannerRepository;    
@Autowired
MemberTradeRecordRepository    memberTradeRecordRepository;
@Autowired
MemberAccountRepository    memberAccountRepository;
@Autowired  
MemberDepositRecordRepository memberDepositRecordRepository;
	public Page<Member> fenPage(Integer page, Integer rowsize, final Member member) {
		Pageable pageable=new PageRequest(page-1, rowsize);
		Specification<Member> specification=new Specification<Member>() {
		public Predicate toPredicate(Root<Member> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
			List<Predicate> list=new ArrayList<Predicate>();
		if (member!=null) 
			{
		
				if (member.getName()!=null&&!member.getName().equals("")) {
           
					Path  enamepath = root.get("name");
				   list.add(builder.like(enamepath, "%"+member.getName()+"%"));
					
				}	
				if (member.getMobile_Phone()!=null&&!member.getMobile_Phone().equals("")) {

					Path mobile_Phone = (Path) root.get("mobile_Phone");
					list.add(builder.equal(mobile_Phone, member.getMobile_Phone()));

				}
				if (member.getMember_name()!=null&&!member.getMember_name().equals("")) {
					Path    member_name= (Path) root.get("member_name");
					 list.add(builder.like(member_name,"%"+member.getMember_name()+"%"));

				}
				if (member.getInvitationCode()!=null&&!member.getInvitationCode().equals("")) {
					Path invitationCode = (Path) root.get("invitationCode");
					list.add(builder.equal(invitationCode, member.getInvitationCode()));
				}
				/*if (member.getCreate_date()!=null&&!member.getCreate_date().equals("")) {
                  
					
				}*/
			
			}
			return builder.and(list.toArray(new Predicate[list.size()]));
		}
	};

		return memberDao.findAll(specification, pageable);
	}

	public List<Member> selectlist() {
	      
		return memberDao.findAll();
	}
	public Member selectname(Integer id) {
		
		return memberDao.findOne(id);
	}
	
	public MemberWithdrawRecord selectname3(Integer id) {
	
		return memberWithdrawRecord.findOne(id);
	}

	public FinancialPlanner selectname2(Integer id) {
		
		return financialPlannerRepository.findOne(id);
	}

	public List<MemberTradeRecord> testqueryMemberTradeRecord(Integer member_id) {
		
		return memberTradeRecordRepository.testqueryMemberTradeRecord(member_id);
	}

	public List<MemberDepositRecord> testqueryMemberDepositRecord(Integer member_id) {
		
		return memberDepositRecordRepository.testqueryMemberDepositRecord(member_id);
	}

	
	public List<MemberWithdrawRecord> MemberWithdrawRecord(Integer member_id) {
	
		
		return  memberWithdrawRecord.MemberWithdrawRecord(member_id) ;
		
	}

	public Member jingli(Integer id) {
		
		return  memberDao.findOne(id);
	}

	/*public List<MemberAccount>selectname1(Integer id) {
		return memberAccountRepository.upMemberAccount(id);
	}

*/



	
	


}
