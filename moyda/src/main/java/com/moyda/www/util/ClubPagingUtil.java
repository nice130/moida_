package com.moyda.www.util;

import com.moyda.www.dto.*;

public class ClubPagingUtil {
	
	private final static int COUNT_OF_BOARD_PER_PAGE = 10;
	// 블록당 페이지의 개수
	private final static int COUNT_OF_PAGE_PER_BLOCK = 5;
	
	public static ClubBoardPage getPage(int pageno, int countOfBoard) {
		System.out.println(countOfBoard);
		int countOfPage = countOfBoard/COUNT_OF_BOARD_PER_PAGE + 1;
		if(countOfBoard%COUNT_OF_BOARD_PER_PAGE == 0)
			countOfPage--;
		if(pageno>countOfPage)
			pageno=countOfPage;
		
		int startRowNum = (pageno-1)*COUNT_OF_BOARD_PER_PAGE +1;
		int endRowNum = startRowNum + COUNT_OF_BOARD_PER_PAGE - 1;
		
		endRowNum = (endRowNum>countOfBoard)?countOfBoard:endRowNum;
		
		int blockNumber = (pageno-1)/COUNT_OF_PAGE_PER_BLOCK;
		int start = blockNumber * COUNT_OF_PAGE_PER_BLOCK + 1;
		int end = start + COUNT_OF_PAGE_PER_BLOCK - 1;
		if(end>countOfPage)
			end = countOfPage;
		
		int prev = start - 1;
		int next = end + 1;
		if(next>countOfPage)
			next = 0;
		
		return ClubBoardPage.builder().start(start).end(end).startRowNum(startRowNum).endRowNum(endRowNum)
			.prev(prev).next(next).pageno(pageno).build();
		
	}
}

