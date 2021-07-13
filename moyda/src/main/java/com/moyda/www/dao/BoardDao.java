package com.moyda.www.dao;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.moyda.www.entity.Board;
import com.moyda.www.entity.FaqBoard;

public interface BoardDao {
	public Board findByall(@Param("nno") Integer noticeNo);
	
	public Integer insert(@Param("n") Board board);

	public Integer update(@Param("n") Board board);
	
	public Integer delete(@Param("n") Integer noticeNo);
	
	public Integer countByWriter(@Param("writer") String writer);
	
	public List<Board> findAll(@Param("startRowNum") Integer srn,  @Param("endRowNum") Integer ern);
	
	public Integer faqinsert(@Param("f") FaqBoard faqboard);

	public Integer findByPageNo();
	
	public Board findById(@Param("n") Integer noticeNo);
}
