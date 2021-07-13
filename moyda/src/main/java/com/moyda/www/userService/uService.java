package com.moyda.www.userService;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import com.moyda.www.entity.*;

public class uService {
	@Autowired
	SqlSession sqlSession;
	
	public boolean loginCheck(User user) {
		String name = sqlSession.selectOne("user.loginCheck", user);
		return (name == null) ? false : true;
	}
	
	public User viewMember(User user) {
		return sqlSession.selectOne("user.viewMember",user);
	}
	
	public void logout(HttpSession session) {
		
	}
}
