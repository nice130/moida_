package com.moyda.www.programService;

import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.moyda.www.dao.*;
import com.moyda.www.dto.*;
import com.moyda.www.entity.*;
import com.moyda.www.exception.*;
import com.moyda.www.util.*;

@Service
public class ProgramService {
	@Autowired
	private ProgramDao programDao;
	@Autowired
	private ModelMapper programMapper;
	
	public ProgramPageDto list(Integer pageNo) {
		int countOfBoard = programDao.countByHostNo(null);
		ProgramPageDto page = ProgramPagingUtil.getPage(pageNo, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		
		List<Program> programList = programDao.findAll(srn, ern);
		List<ProgramListResponseDto> dtoList = new ArrayList<> ();
		for(Program program:programList) {
			ProgramListResponseDto dto = programMapper.map(program, ProgramListResponseDto.class);
			dtoList.add(dto);
		}
		page.setList(dtoList);
		return page;
	}
	
	public ProgramResponseDto read(Integer proNo, Integer hostNo) {
		Program program = programDao.findByProNo(proNo);
		program.setOpenNo(programDao.findByProNo2(proNo).getOpenNo());
		program.setSchedule(programDao.findByProNo2(proNo).getSchedule());
		program.setLocation(programDao.findByProNo2(proNo).getLocation());
		program.setLicense(programDao.findByHostNo(hostNo).getLicense());
		
		if(program==null) {
			throw new ProgramNotFoundException();
		}
		ProgramResponseDto dto = programMapper.map(program, ProgramResponseDto.class);
		return dto;
	}
	
	public Program programSignUp(Integer proNo, Integer openNo, Integer usersNo, Integer hostNo) {
		programDao.signUp(proNo, openNo, usersNo, hostNo);
		return null;
	}
}
