package com.moyda.www.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardResponseDto {
	private Integer noticeNo;
	private String title;
	private String content;
	private String writer;
}
