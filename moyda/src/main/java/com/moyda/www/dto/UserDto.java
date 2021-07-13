package com.moyda.www.dto;

import java.util.*;

import org.springframework.web.multipart.*;

import lombok.*;

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class UserDto {
	@Data
	//일반회원가입
	public static class JoinRequestDto{
		private String email;
		private String password;
		private String irum;
		private String nickname;
		private String phone;
		private String age;
		private String sex;
		private String area;
		private MultipartFile Profile;
		private List<String> authorities;
	}
	@Data //호스트회원가입
	public static class hostJoinRequestDto{
		private String email;
		private String nickname;
		private MultipartFile profile;
		private String phone;
		private String area;
		private String account;
		private String password;
		private List<String> authorities;
	}
	
	@Data
	public static class ufindIdDto{
		private String email;
		private String irum;
		private String password;
		private String phone;
	}
	
	@Data
	public static class hfindIdDto{
		private String email;
		private String nickname;
		private String password;
		private String phone;
	}
	
	@Data
	public static class UpdateRequestDto {
		private String email;
		private String irum;
		private String password;
		private String newPassword;
		private String nickname;
		private String phone;
		private String age;
		private String sex;
		private String area;
		private MultipartFile profile;
	}
	
}
