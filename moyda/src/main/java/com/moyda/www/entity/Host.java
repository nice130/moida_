package com.moyda.www.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Host {
	private Integer hostNo;
	private String email;
	private String nickname;
	private String profile;
	private String phone;
	private String area;
	private String account;
	private String password;
	private Integer reportCnt;
	private Boolean enabled;
	private String checkCode;
	private String license;
}
