package com.moyda.www.dao;
import javax.servlet.http.*;

import org.apache.ibatis.annotations.*;

import com.moyda.www.entity.*;

public interface UserDao {
	
	public User userfindById(@Param("u") User user);
	
	public Host hostfindById(@Param("h") Host host);
	
	public User userfindByPass(@Param("u") User user);
	
	public Host hostfindByPass(@Param("h")Host host);
	
	public User userfindByPhone(@Param("u") String phone);
	
	public Host hostfindByPhone(@Param("h") String phone);
	
	public User tfindById(@Param("email") String email);

	public Integer userJoin(@Param("u") User user);
	
	public User findByCheckCode(@Param("c") String checkCode);
	
	public Integer update(@Param("up") User user);
	
	public Integer hostJoin(@Param("h") Host host);
	
	public Integer hostupdate(@Param("up") Host host);

	public Boolean existsById(@Param("u")String username);
	
	public Boolean existsByPhone(@Param("p") String phone);
	
	public Boolean existsByHostId(@Param("u")String username);
	
	public Boolean existsByHostPhone(@Param("p") String phone);
	
	public boolean loginCheck(@Param("email")String email,@Param("password") String password, HttpSession session);
	
	public User viewUser(String email, String password);
	
	public void logout(HttpSession session);
	
	//호스트로그인
	public boolean hostloginCheck(@Param("email")String email,@Param("password") String password, HttpSession session);
}