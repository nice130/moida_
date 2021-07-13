package com.moyda.www.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.moyda.www.dto.ClubMainEntityDto;
import com.moyda.www.entity.Club;
import com.moyda.www.entity.ClubBoard;
import com.moyda.www.entity.ClubUser;

public interface ClubDao {
	public Integer insert(@Param("club") Club club);
	
	public Integer clubJoinInsert(@Param("clubuser") ClubUser clubUser);

	public Integer createUserInsert(@Param("usersNo")Integer usersNo,@Param("clubNo")Integer clubNo, @Param("clubRoll") String clubRoll);
	
	public Integer findByMaxClubNo();
	
	public Club findByNo(@Param("clubNo") Integer clubNo);

	public boolean existsById(@Param("name") String clubName);
	
	public Club findByAll(@Param("clubNo") Integer clubNo);

	public Club findByClubUserNo(@Param("clubNo")Integer clubNo);

	public List<ClubBoard> clubBoardList(@Param("clubNo")Integer clubNo);
	
	public Integer boardInsert(@Param("c") ClubBoard clubBoard);

	public Integer countByWriter(@Param("writer") String writer);

	public List<ClubBoard> findAll(@Param("startRowNum") Integer srn,  @Param("endRowNum") Integer ern);

	public ClubBoard findById(@Param("clubNo")Integer clubNo);

	public Integer update(@Param("c") ClubBoard clubBoard);

}
