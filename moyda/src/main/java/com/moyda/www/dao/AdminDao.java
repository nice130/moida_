package com.moyda.www.dao;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.moyda.www.dto.*;
import com.moyda.www.entity.*;

public interface AdminDao {
	
	public Integer countByReportUser();

	public List<AdminProgramUserDto> findReportProgramUser(@Param("startRowNum") Integer srn, @Param("endRowNum") Integer ern);
		
	public User findUserById(@Param("userNo") Integer userNo);
	
	public Integer updateUser(@Param("u") User user);

	public List<AdminProgramHostDto> findSubProgram(@Param("startRowNum") Integer srn, @Param("endRowNum") Integer ern);
	
	public Integer countBySubPro();
	
	public Integer updateSubPro(@Param("p") Program pro);

	public List<AdminProgramHostDto> findHostDetailById(@Param("hostNo") Integer hostNo);
	
	public List<AdminProgramHostDto> findProDetailById(@Param("proNo") Integer proNo);

	public List<AdminProHostUserDto> findReportProgram(@Param("startRowNum") Integer srn, @Param("endRowNum") Integer ern);
	
	public Integer countByReportPro();
	
	public Integer updateHost(@Param("h") Host host);
	
	public Integer deleteProgram(@Param("proNo") Integer proNo);

	
}
