package com.demo.service.wenlei;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.demo.model.MemberAccount;

public interface MemberAccountServices {
/*	public Page<MemberAccount> fenPage(Integer page,Integer rowsize, final MemberAccount memberAccount);
	
*/
	
	public List<Object[]> jingli(Integer pageNum, Integer pageSize,Map<String, Object> map);

	public void queryupdate(double momey, Integer eid);
	
	public MemberAccount  getOneMemberAccount(Integer member_id);
	
	
	
	public void updateMemberAccount(double momey ,Integer id);
	

	/*public void queryupdatece(Integer lei ,Integer id);

	public void queryupdatetz(Integer lei ,Integer id);*/
	
	
}




