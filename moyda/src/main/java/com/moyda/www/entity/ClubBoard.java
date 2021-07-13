package com.moyda.www.entity;

import java.util.Date;

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
public class ClubBoard {
	private Integer clubBoardNo;
	private String title;
	private String content;
	private Integer readCnt;
	private Integer goodCnt;
	private Integer badCnt;
	private String writer;
	private Date writeTime;
	private Integer clubNo;
}
