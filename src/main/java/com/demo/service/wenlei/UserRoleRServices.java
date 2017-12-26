package com.demo.service.wenlei;

import java.util.List;

import org.springframework.data.domain.Page;
import com.demo.model.UserRole;

public interface UserRoleRServices {
	public List<UserRole> selectlist();
	public Page<UserRole> fenPage(Integer page,Integer rowsize, final UserRole userRole  );
	
	public void addname(UserRole  userRole);
	
	
}
