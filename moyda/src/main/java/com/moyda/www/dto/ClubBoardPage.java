package com.moyda.www.dto;

import java.util.*;

import lombok.*;

@Data
@Builder
public class ClubBoardPage {
	private int startRowNum;
	private int endRowNum;
	
	private int pageno;
	private int start;
	private int end;
	private int prev;
	private int next;
	
	List<ClubListDto> list;
}
