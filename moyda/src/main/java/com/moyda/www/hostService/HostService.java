package com.moyda.www.hostService;

import java.text.*;
import java.util.*;

import org.modelmapper.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.moyda.www.dao.*;
import com.moyda.www.dto.*;
import com.moyda.www.dto.HostDto.*;
import com.moyda.www.entity.*;

@Service
public class HostService {

	@Autowired
	private HostDao dao;
	@Autowired
	private ModelMapper hostMapper;
	@Autowired
	private SimpleDateFormat dateFormat;
	@Value("d:/java/upload/profile")
	private String profileUploadFolder;
	@Value("http://localhost:8081/profile/")
	private String profilePath;
	@Value("default.jpg")
	private String defaultProfile;
	
	public MyPageDto hostMyPage(Integer hostNo) {
		Host host = dao.hostMyPage(hostNo);
		host.setLicense(dao.hostMyPage2(hostNo).getLicense());
		HostDto.MyPageDto dto = hostMapper.map(host, HostDto.MyPageDto.class);
		return dto;
	}
	
	public InfoUpdateDto hostInfoUpdate(Integer hostNo) {
		Host host = dao.hostMyPage(hostNo);
		host.setLicense(dao.hostMyPage2(hostNo).getLicense());
		HostDto.InfoUpdateDto dto = hostMapper.map(host, HostDto.InfoUpdateDto.class);
		return dto;
	}
	
	public Boolean update(HostDto.UpdateRequestDto dto) {
		Host host = hostMapper.map(dto, Host.class);
		if(dao.update(host)==1) {
			if(dao.update2(host)==1) {
				return true;
			}
		}
		return false;
	}
	
	public OutCheckDto hostOutCheck(Integer hostNo) {
		Host host = dao.hostMyPage(hostNo);
		HostDto.OutCheckDto dto = hostMapper.map(host, HostDto.OutCheckDto.class);
		return dto;
	}
	
	public Boolean hostOut(HostDto.OutCheckDto dto) {
		Host host = hostMapper.map(dto, Host.class);
		return dao.out(host)==1;
	}
	
	public MyProgramDto myProgram(Integer hostNo) {
		Program pro = dao.myProgram(hostNo);
		pro.setSchedule(dao.myProgramOpenCourse(hostNo).getSchedule());
		pro.setLocation(dao.myProgramOpenCourse(hostNo).getLocation());
		pro.setNop(dao.myProgramCourse(hostNo));
		pro.setLicense(dao.hostMyPage2(hostNo).getLicense());
		HostDto.MyProgramDto dto = hostMapper.map(pro, HostDto.MyProgramDto.class);
		return dto;
	}
	
	public Boolean programUpdate(HostDto.MyProgramDto dto) {
		Program pro = hostMapper.map(dto, Program.class);
		if(dao.programUpdate(pro)==1) {
			if(dao.programUpdate2(pro)==1) {
				return true;
			}
		}
		return false;
	}
	
	public Integer programRegistration(HostDto.ProgramRegiDto dto) {
		Program pro = hostMapper.map(dto, Program.class);
		dao.programRegistration(pro);
		dao.programRegistration2(pro);
		return dto.getProNo();
	}
	

}