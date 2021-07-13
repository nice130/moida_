package com.moyda.www.dao;

import org.apache.ibatis.annotations.*;

public interface AuthorityDao {
	//일반회원
	@Insert("insert into authority values(#{users_no}, #{autho_name})")
	public void userJoin(@Param("users_no") Integer integer, @Param("autho_name") String authority);

	@Delete("delete from authority where users_no=#{users_no}")
	public void deleteAllById(@Param("users_no") String username);
	
	//호스트
	@Insert("insert into authority_h values(#{host_no}, #{autho_name})")
	public void hostJoin(@Param("host_no") Integer integer, @Param("autho_name") String authority);
	
}
