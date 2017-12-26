package com.demo.service.jinge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.dao.jinge.SysTypeRepository;
import com.demo.model.SysType;
@Service
public class SysTypeServiceImpl implements SysTypeService {
	@Autowired
	SysTypeRepository sysTypeRepository;
	public List<SysType> find(String typeName) {
		return sysTypeRepository.findSysTypeList(typeName);
	}
	public String getName(String string, String type) {
		// TODO Auto-generated method stub
		return sysTypeRepository.getName(string,type);
	}

}
