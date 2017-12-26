package com.demo.service.wenlei;

import org.springframework.data.domain.Page;
import com.demo.model.MemberBankcards;
public interface MemberBankcardsServices {
	public Page<MemberBankcards> fenPage(Integer page,Integer rowsize, final MemberBankcards memberBankcards );
	
	
	public void queryup(Integer delflag,Integer id);
	
	
	
	
	
	
}
