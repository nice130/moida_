package com.moyda.www.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Club {
	private Integer clubNo;
	// 가입방식
	private String enabled;
	private String profile;
	private String name;
	private String content;
	private Integer age;
	// 슈퍼 클럽가입
	private String payment;
	// 슈퍼 클럽가입여부
	private String superEnabled;
	// 카테고리 대 번호
	private Integer caBno;
	// 카테고리 소 번호	
	private Integer caSno;
}
