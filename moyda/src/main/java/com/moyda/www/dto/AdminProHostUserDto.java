package com.moyda.www.dto;

import lombok.*;
import lombok.experimental.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Accessors(chain = true)
public class AdminProHostUserDto {
	private Integer hostNo;
	private String hostEmail;
	private Integer reportCnt;
	private Integer hostEnabled;
	private Integer proNo;
	private String name;
	private Integer proEnabled;
	private Integer userNo;
	private String userEmail;
}


