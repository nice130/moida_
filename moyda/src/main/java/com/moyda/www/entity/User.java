package com.moyda.www.entity;

import lombok.*;
import lombok.experimental.*;
@Builder
@Accessors(chain = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private Integer userNo;
	private String email;
	private String irum;
	private String nickname;
	private String phone;
	private Integer age;
	private String sex;
	private String area;
	private String profile;
	private String password;
	private Integer exileCnt;
	private Integer reportCnt;
	// enabled가 false일 경우 사용자 비활성화. 로그인해도 아무것도 할 수 없다
	private Boolean enabled;
	// 가입을 신청하면 이메일로 보내질 인증 코드
	private String checkCode;
	private Integer cash;
}
