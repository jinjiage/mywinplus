package com.demo.service.jinge;

import java.util.List;

import com.demo.model.SysType;

public interface SysTypeService {
	public List<SysType> find(String typeName);

	public String getName(String string, String type);
}
