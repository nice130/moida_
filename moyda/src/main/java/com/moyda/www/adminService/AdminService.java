package com.moyda.www.adminService;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.moyda.www.dao.*;
import com.moyda.www.dto.*;
import com.moyda.www.entity.*;
import com.moyda.www.util.*;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;
//	
//	@Value("http://localhost:8081/profile/")
//	private String profilePath;
//	@Value("default.jpg")
//	private String defaultProfile;
//	
	public AdminPage findReportProgramUser(Integer pageno) {
		int countOfBoard = adminDao.countByReportUser();
		AdminPage page = AdminPagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		
		List<AdminProgramUserDto> userList = adminDao.findReportProgramUser(srn, ern);
		page.setUserList(userList);
		return page;
	}
	
	public User findUserById(Integer userno) {
		return adminDao.findUserById(userno);
	}

	public AdminPage findSubProgram(Integer pageno) {
		int countOfBoard = adminDao.countBySubPro();
		AdminPage page = AdminPagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		
		List<AdminProgramHostDto> subList = adminDao.findSubProgram(srn, ern);
		page.setSubList(subList);
		return page;
	}

	public List<AdminProgramHostDto> findHostDetail(Integer hostNo) {
		return adminDao.findHostDetailById(hostNo);
	}

	public List<AdminProgramHostDto> findProDetailById(Integer proNo) {
		return adminDao.findProDetailById(proNo);
	}

	public AdminPage findReportProgram(Integer pageno) {
		int countOfBoard = adminDao.countByReportPro();
		AdminPage page = AdminPagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		
		List<AdminProHostUserDto> proList = adminDao.findReportProgram(srn, ern);
		page.setProList(proList);
		return page;
	}
	
}
