package com.moyda.www.dto;

import java.util.List;

import com.moyda.www.entity.Board;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class BoardDto {
	private String title;
	private String content;
	private String writer;
	

}
