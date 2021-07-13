package com.moyda.www.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class ClubDto {
	@Data
	public static class ClubCreateDto{
		private String enabled;
		private MultipartFile profile;
		private String name;
		private String content;
		private Integer age;
		// 카테고리 대 번호
		//private Integer caBno;
		// 카테고리 소 번호	
		//private Integer caSno;
		// 보안 절차
		//private String securityCode;
		//클럽 번호
		private Integer clubNo;
	}
	@Data
	public static class ClubJoinDto{
		private Integer usersNo;
		private Integer clubNo;
		private String grade;
		private String enabled;
		// 보안 절차
		private String securityCode;
	}
}
