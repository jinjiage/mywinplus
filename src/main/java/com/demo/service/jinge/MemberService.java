package com.demo.service.jinge;

import com.demo.model.Member;

public interface MemberService {

	Member selectByPrimaryKey(Integer member_id);

	Integer selectOneMember(String string);

	void saveMember(Member member);

	Integer selectMemberByName(String string);

	Member selectLogin(String mobile_Phone, String password);

	Member selectMemberByPhone(String mobile_Phone);

	Member findMemberByIdentity(String identity);

}
