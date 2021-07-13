package com.moyda.www.entity;

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
public class FaqBoard {
	private Integer faqno;
	private Integer faqtn;
	private String title;
	private String content;
	private String writer;
}
