package com.moyda.www.dto;

import lombok.*;
import lombok.experimental.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
public class AdminProgramUserDto {
	private Integer userNo;
	private String email;
	private Integer reportCnt;
	private String enabled;
	private Integer courseNo;
	private Integer proNo;
	private String name;
}


