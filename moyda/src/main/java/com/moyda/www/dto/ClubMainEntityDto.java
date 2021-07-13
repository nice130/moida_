package com.moyda.www.dto;

import java.util.List;

import com.moyda.www.entity.ClubBoard;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClubMainEntityDto {
	private Integer clubNo;
	private String profile;
	private String name;
	private String content;
	private String superEnabled;
	
	//게시글 출력
	private List<ClubBoard> clubBoard;
}
