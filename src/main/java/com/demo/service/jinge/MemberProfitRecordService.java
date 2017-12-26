package com.demo.service.jinge;

import org.springframework.data.domain.Page;

import com.demo.model.MemberProfitRecord;

public interface MemberProfitRecordService {

	MemberProfitRecord getOne(Integer id);

	Page findMemberProfitRecordBymemberId(Integer id, Integer page, Integer pageSize);





	

}
