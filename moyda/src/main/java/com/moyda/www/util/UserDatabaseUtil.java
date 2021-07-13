package com.moyda.www.util;
import java.sql.Connection;
import java.sql.DriverManager;


public class UserDatabaseUtil {
	  public static Connection getConnection() {
		    try {
		      String dbURL = "jdbc:mysql://121.65.47.76:3306/user_?verifyServerCertificate=false&useSSL=true";
		      String dbID = "moyda_";
		      String dbPassword = "1234";
		      Class.forName("com.mysql.jdbc.Driver");
			/*
			  설정없이 그냥 실행시 
			  java.lang.ClassNotFoundException: com.mysql.jdbc.Driver
			   라는 드라이버를 찾을 수 없다는 오류가 발생합니다. 
			   드라이버를 다운받은후 web-inf/lib 에 넣으면 됩니다.
			*/ 
		      return DriverManager.getConnection(dbURL, dbID, dbPassword);
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
				
		    return null;
		    // 오류 발생시 null 값 리턴
		  }
		}