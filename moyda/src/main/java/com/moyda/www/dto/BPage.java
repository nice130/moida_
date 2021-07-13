package com.moyda.www.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
public class BPage {
	private int startRowNum;
	private int endRowNum;
	
	private int pageno;
	private int start;
	private int end;
	private int prev;
	private int next;
	
	List<BoardDto> list;
}
