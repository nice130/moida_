package com.moyda.www.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class ClubListDto {
	private Integer clubBoardNo;
	private String title;
	private String content;
	private Integer readCnt;
	private Integer goodCnt;
	private Integer badCnt;
	private String writer;
	private String writeTimeStr;
	private Integer clubNo;
}
