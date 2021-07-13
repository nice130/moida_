package com.moyda.www.clubservice.mvc;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.moyda.www.dao.ClubDao;
import com.moyda.www.dao.UserDao;
import com.moyda.www.dto.ClubBoardPage;
import com.moyda.www.dto.ClubDto.ClubCreateDto;
import com.moyda.www.dto.ClubDto.ClubJoinDto;
import com.moyda.www.dto.ClubListDto;
import com.moyda.www.dto.ClubMainEntityDto;
import com.moyda.www.entity.Club;
import com.moyda.www.entity.ClubBoard;
import com.moyda.www.entity.ClubUser;
import com.moyda.www.entity.User;
import com.moyda.www.exception.BoardNotFoundException;
import com.moyda.www.util.ClubPagingUtil;


@Service
public class clubService {
	@Autowired
	private ClubDao clubDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private SimpleDateFormat timeFormat;

//	@Autowired
//	private SimpleDateFormat dateFormat;
	@Value("c:/upload/profile")
	private String profileUploadFolder;
	@Value("http://localhost:8082/profile/")
	private String profilePath;
	@Value("default.jpg")
	private String defaultProfile;


	@Transactional
	public Club clubCreate(ClubCreateDto dto, Principal principal) {
		Club club = modelMapper.map(dto, Club.class);
		MultipartFile profile = dto.getProfile();

		// 클럽 번호 +1 로직
		club.setClubNo(clubDao.findByMaxClubNo()+1);
		if(profile!=null || profile.isEmpty()==false) {
			int lastIndexOfDot =  profile.getOriginalFilename().lastIndexOf('.');
			String extension = profile.getOriginalFilename().substring(lastIndexOfDot);
			String profilesajin = club.getName() + extension;
			club.setProfile(profilePath + profilesajin); 
			File profileFile = new File(profileUploadFolder, profilesajin);
			try {
				FileCopyUtils.copy(profile.getBytes(), profileFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else
			club.setProfile(profilePath + defaultProfile);
		clubDao.insert(club);
		//String UserName = principal.getName();
		String UserName = "nice130@naver.com";

		User user = userDao.tfindById(UserName);

		Integer userNo = user.getUserNo();
		Integer clubNo = club.getClubNo();
		//클럽장 권한 부여
		String ClubRoll = "ADMIN";
		clubDao.createUserInsert(userNo,clubNo,ClubRoll);
		return clubDao.findByAll(clubNo);
	}

	@Transactional
	public Club clubJoin(ClubJoinDto dto,Principal principal,Integer clubNo) {
		ClubUser user = modelMapper.map(dto, ClubUser.class);
		// 회원 번호, 클럽번호, 회원등급
		//String UserName = principal.getName();
		String UserName = "nice130@naver.com";
		User Clubuser = userDao.tfindById(UserName);
		Integer userNo = Clubuser.getUserNo();
		// 클럽 번호는 새션,같은걸로 가져와야하는데 아직 잘모르겠음;;

		Club club = clubDao.findByAll(clubNo);
		String ClubRoll = "USER";

		clubDao.createUserInsert(userNo, clubNo,ClubRoll);

		return club;
	}

	public boolean nameCheck(String clubName) {
		return !clubDao.existsById(clubName);
	}

	// 클럽 정보 가지고 오기
	public ClubMainEntityDto mainList(Integer clubNo,Principal principal) {
		//임시 클럽번호 지정 후 클럽 정보 select
		clubNo = 6;
		Club club = clubDao.findByAll(clubNo);

		// 클럽안에서 사용자 정보 가져오기 principal.getName();
		String userName = "nice130@naver.com";
		User Clubuser = userDao.tfindById(userName);
		Integer userNo = Clubuser.getUserNo();
		// 사용자의 클럽 번호와 유저 번호가 맞으면 클럽 메인 리스트 출력
		if(clubNo==userNo) {
			club = clubDao.findByClubUserNo(clubNo);
			clubDao.clubBoardList(clubNo);

		}

		return null;
	}


	public Club clubCheck(Integer clubNo) {
		return clubDao.findByAll(clubNo);
	}

	public Club go(Integer clubNo) {
		Club club = clubDao.findByAll(clubNo);

		return club;
	}

	@Cacheable(cacheNames="list", key="#pageno")
	public ClubBoardPage list(Integer pageno) {
		int countOfBoard = clubDao.countByWriter(null);
		ClubBoardPage page = ClubPagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		System.out.println(page);
		List<ClubBoard> boardList = clubDao.findAll(srn, ern);
		List<ClubListDto> dtoList = new ArrayList<>();
		for(ClubBoard clubBoard:boardList) {
			ClubListDto dto = modelMapper.map(clubBoard,ClubListDto.class);
			System.out.println(clubBoard);
			dto.setWriteTimeStr(timeFormat.format(clubBoard.getWriteTime()));
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
	}

	public ClubListDto read(Integer clubNo, String username) {
		ClubBoard board = clubDao.findById(clubNo);
		if(board==null)
			throw new BoardNotFoundException();
		ClubListDto dto = modelMapper.map(board,ClubListDto.class);
		//dto.setWriteTimeStr(timeFormat.format(board.getWriterTime()));
		// 조회수 증가 : 비로그인, 자기글을 읽었을 때 조회수 증가 X, 
		if(username!=null && username.equals(board.getWriter())==false)
			clubDao.update(ClubBoard.builder().clubBoardNo(3).readCnt(0).build());
		return dto;
	}
}