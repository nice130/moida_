package com.moyda.www.dto;

import org.springframework.web.multipart.*;

import lombok.*;

@NoArgsConstructor(access=AccessLevel.PRIVATE)
public class HostDto {
	@Data
	public static class MyPageDto	{
		private Integer hostNo;
		private String nickname;
		private String phone;
		private String area;
		private String account;
		private String profile;
		private String license;
	}
	
	@Data
	public static class InfoUpdateDto	{
		private Integer hostNo;
		private String nickname;
		private String phone;
		private String area;
		private String account;
		private String profile;
		private String password;
		private String license;
	}
	
	@Data
	public static class UpdateRequestDto	{
		private Integer hostNo;
		private String nickname;
		private String phone;
		private String area;
		private String account;
		private String profile;
		private String password;
		private String license;
	}
	
	@Data
	public static class OutCheckDto	{
		private Integer hostNo;
		private String nickname;
		private String account;
	}
	
	@Data
	public static class MyProgramDto {
		private Integer hostNo;
		private String profile;
		private String programName;
		private String content;
		private String license;
		private String schedule;
		private String location;
		private Integer fee;
		private String note;
		private Integer caBNo;
		private Integer caSNo;
		private Integer nop;
	}
	
	@Data
	public static class ProgramRegiDto	{
		private Integer proNo;
		private Integer hostNo;
		private String profile;
		private String programName;
		private String content;
		private String license;
		private String schedule;
		private String location;
		private Integer fee;
		private String note;
		private Integer caBNo;
		private Integer caSNo;
	}
}
