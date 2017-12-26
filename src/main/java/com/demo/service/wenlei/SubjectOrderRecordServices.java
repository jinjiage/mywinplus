package com.demo.service.wenlei;
import org.springframework.data.domain.Page;
import com.demo.model.SubjectOrderRecord;


public interface SubjectOrderRecordServices {

	public Page<SubjectOrderRecord> fenPage(Integer page,Integer rowsize, final SubjectOrderRecord subjectOrderRecord );
	
	
}
