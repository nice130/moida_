package com.moyda.www.boardService;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.moyda.www.dao.BoardDao;
import com.moyda.www.dto.BPage;
import com.moyda.www.dto.BoardDto;
import com.moyda.www.dto.BoardResponseDto;
import com.moyda.www.entity.Board;
import com.moyda.www.exception.BoardNotFoundException;
import com.moyda.www.util.BoardPagingUtil;
import com.moyda.www.util.AdminPagingUtil;


@Service
public class BoardService {
	
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private ModelMapper modelMapper;
	
	public BPage list(Integer pageno) {
		int countOfBoard = boardDao.countByWriter(null);
		System.out.println(pageno);
		System.out.println("====================================================================");
		BPage bpage = BoardPagingUtil.getPage(pageno, countOfBoard);
		System.out.println(bpage.getStartRowNum());
		int srn = bpage.getStartRowNum();
		int ern = bpage.getEndRowNum();
		
		List<Board> boardList = boardDao.findAll(srn, ern);
		List<BoardDto> dtoList = new ArrayList<>();
		for(Board board:boardList) {
			BoardDto dto = modelMapper.map(board, BoardDto.class);
			dtoList.add(dto); 
		}
		bpage.setList(dtoList);
		System.out.println(srn);
		System.out.println(ern);
		return bpage;
	}

	public Integer selectPageNo() {
		Integer pageNo = boardDao.findByPageNo();
		return pageNo;
	}

	public BoardResponseDto read(Integer pageNo, String username) {
		Board board = boardDao.findById(pageNo);
		if(board==null)
			throw new BoardNotFoundException();
		BoardResponseDto dto = modelMapper.map(board, BoardResponseDto.class);
		if(username!=null && username.equals(board.getWriter())==false)
			boardDao.update(Board.builder().noticeNo(pageNo).readcnt(0).build());
		return dto;
	}
	public void delete(Integer pageNo, String name) {
		Board board = boardDao.findById(pageNo);
	}
}
