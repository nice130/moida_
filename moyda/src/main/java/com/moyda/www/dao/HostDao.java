package com.moyda.www.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.moyda.www.entity.*;

public interface HostDao {
	public Host hostMyPage(@Param("hostNo") Integer hostNo);
	
	public Host hostMyPage2(@Param("hostNo") Integer hostNo);
	
	public Host hostInfoUpdate(@Param("hostNo") Integer hostNo);
	
	public Integer update(@Param("host") Host host);
	
	public Integer update2(@Param("host") Host host);
	
	public Integer out(@Param("host") Host host);
	
	public Program myProgram(@Param("hostNo") Integer hostNo);
	
	public Program myProgramOpenCourse(@Param("hostNo") Integer hostNo);
	
	public int myProgramCourse(@Param("hostNo") Integer hostNo);
	
	public Integer programRegistration(@Param("pro") Program program);
	
	public Integer programRegistration2(@Param("pro") Program program);
	
	public Integer programUpdate(@Param("pro") Program program);
	
	public Integer programUpdate2(@Param("pro") Program program);
	
	public Integer programUpdate3(@Param("pro") Program program);
}
