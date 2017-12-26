package com.demo.dao.jinge;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.demo.model.SysType;

public interface SysTypeRepository extends JpaRepository<SysType, Integer> {
	 @Query("select t from SysType t where t.typeName = ?")
	public List<SysType> findSysTypeList(String typeName);
	 @Query(value="select name from sys_type where type_name=?1 and statu=?2",nativeQuery=true)
	public String getName(String string, String type);
}
