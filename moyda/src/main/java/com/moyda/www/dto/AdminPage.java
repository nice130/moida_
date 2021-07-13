package com.moyda.www.dto;

import java.util.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AdminPage {
	private int startRowNum;
	private int endRowNum;
	
	private int pageno;
	private int start;
	private int end;
	private int prev;
	private int next;
	
	List<AdminProgramUserDto> userList;
	List<AdminProgramHostDto> subList;
	List<AdminProHostUserDto> proList;
}
