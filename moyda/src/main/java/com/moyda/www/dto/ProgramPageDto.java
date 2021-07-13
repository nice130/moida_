package com.moyda.www.dto;

import java.util.*;

import lombok.*;

@Data
@Builder
public class ProgramPageDto {
	private int startRowNum;
	private int endRowNum;
	private int pageNo;
	private int start;
	private int end;
	private int prev;
	private int next;
	
	List<ProgramListResponseDto> list;
}
