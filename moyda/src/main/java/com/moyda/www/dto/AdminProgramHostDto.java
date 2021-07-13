package com.moyda.www.dto;

import lombok.*;
import lombok.experimental.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain=true)
public class AdminProgramHostDto {
	private Integer hostNo;
	private String email;
	private String nickname;
	private String profile;
	private String phone;
	private String area;
	private String account;
	private Integer reportCnt;
	private Boolean enabled;
	private Integer proNo;
	private String name;
	private String content;
	private Integer fee;
}
