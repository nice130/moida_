package com.moyda.www.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.moyda.www.entity.*;

public interface ProgramDao {
	public Integer countByHostNo(@Param("hostNo") Integer hostNo);
	
	public List<Program> findAll(@Param("startRowNum") Integer srn, @Param("endRowNum") Integer ern);
	
	public Program findByProNo(@Param("proNo") Integer proNo);
	
	public Program findByProNo2(@Param("proNo") Integer proNo);
	
	public Program findByHostNo(@Param("hostNo") Integer hostNo);
	
	public Integer signUp(@Param("proNo") Integer proNo, @Param("openNo") Integer openNo, @Param("usersNo") Integer usersNo, @Param("hostNo") Integer hostNo);
}
