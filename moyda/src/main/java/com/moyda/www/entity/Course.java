package com.moyda.www.entity;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Accessors(chain=true)
public class Course {
	private Integer courseNo;
	private Integer userNo;
	private Integer openNo;
	private Integer programNo;
	private Integer hostNo;
	private Boolean enabled;
}
