package com.moyda.www.util;

import com.moyda.www.dto.*;

public class ProgramPagingUtil {
	// 페이지당 글의 개수
	private final static int COUNT_OF_BOARD_PER_PAGE = 10;
	// 블록당 페이지의 개수
	private final static int COUNT_OF_PAGE_PER_BLOCK = 5;

	public static ProgramPageDto getPage(int pageNo, int countOfBoard) {
		System.out.println(countOfBoard);
		int countOfPage = countOfBoard / COUNT_OF_BOARD_PER_PAGE + 1;
		if (countOfBoard % COUNT_OF_BOARD_PER_PAGE == 0)
			countOfPage--;
		if (pageNo > countOfPage)
			pageNo = countOfPage;

		int startRowNum = (pageNo - 1) * COUNT_OF_BOARD_PER_PAGE + 1;
		int endRowNum = startRowNum + COUNT_OF_BOARD_PER_PAGE - 1;

		endRowNum = (endRowNum > countOfBoard) ? countOfBoard : endRowNum;

		int blockNumber = (pageNo - 1) / COUNT_OF_PAGE_PER_BLOCK;
		int start = blockNumber * COUNT_OF_PAGE_PER_BLOCK + 1;
		int end = start + COUNT_OF_PAGE_PER_BLOCK - 1;
		if (end > countOfPage)
			end = countOfPage;

		int prev = start - 1;
		int next = end + 1;
		if (next > countOfPage)
			next = 0;

		return ProgramPageDto.builder().start(start).end(end).startRowNum(startRowNum).endRowNum(endRowNum)
				.prev(prev).next(next).pageNo(pageNo).build();
	}
}
