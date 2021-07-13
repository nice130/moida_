package com.moyda.www.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Program {
	private Integer proNo;
	private Integer hostNo;
	private String profile;
	private String programName;
	private String content;
	private String license;
	private String schedule;
	private String location;
	private Integer fee;
	private String note;
	private Integer caBNo;
	private Integer caSNo;
	private Boolean enabled;
	private Integer nop;
	private Integer openNo;
}
