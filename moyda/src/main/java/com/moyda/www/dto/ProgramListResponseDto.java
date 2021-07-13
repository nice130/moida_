package com.moyda.www.dto;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class ProgramListResponseDto {
	private Integer proNo;
	private Integer hostNo;
	private String programName;
	private Integer caBNo;
	private Integer caSNo;
	
}
