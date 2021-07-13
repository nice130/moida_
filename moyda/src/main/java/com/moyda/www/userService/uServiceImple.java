package com.moyda.www.userService;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.moyda.www.dao.*;
import com.moyda.www.entity.*;

@Service
public class uServiceImple {
	@Autowired
	UserDao userdao;
	
	//회원 로그인체크
	public boolean loginCheck(String email,String password,HttpSession session) {
		boolean result = userdao.loginCheck(email, password, session);
		if(result) {
			User user = userView(email,password);
			session.setAttribute("email", user.getEmail());
			session.setAttribute("irum", user.getIrum());
		}
		return result;
	}
	//로그인 정보
	public User userView(String email,String password) {
		return userdao.viewUser(email, password);
	}
	//회원 로그아웃
	public void logout(HttpSession session) {
		//세션정보 초기화
		session.invalidate();
	}
}
