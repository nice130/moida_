package com.moyda.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.moyda.www.util.*;


public class MemberDAO {
  // 로그인 체크 코드
  public String loginCheck(String email, String password) {
    String name = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
		
    try {
      conn = UserDatabaseUtil.getConnection(); 
      String SQL = "SELECT NAME FROM member WHERE email=? and password=?";
      pstmt = conn.prepareStatement(SQL);
      pstmt.setString(1, email);
      pstmt.setString(2, password);
			
      rs = pstmt.executeQuery();
      if(rs.next()) {
        name = rs.getString("name");
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      try {
        if(rs != null)
          rs.close();
      } catch (Exception e2) {
        e2.printStackTrace();
      }
    }
		
    return name;
  }
}