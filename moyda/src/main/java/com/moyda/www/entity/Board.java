package com.moyda.www.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Builder
@Accessors(chain=true)
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private Integer noticeNo;
	private String title;
	private String content;
	private Integer readcnt;
	private String writer;
}

