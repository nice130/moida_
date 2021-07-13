package com.moyda.www.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProgramResponseDto {
	private Integer proNo;
	private Integer hostNo;
	private String programName;
	private String content;
	private Integer fee;
	private String note;
	private Integer caBNo;
	private Integer caSNo;
	private String license;
	private String schedule;
	private String location;
	private Integer openNo;
}
