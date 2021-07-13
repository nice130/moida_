package com.moyda.www.adminService;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.moyda.www.dao.*;
import com.moyda.www.entity.*;

@Service
public class AdminRestService {
	
	@Autowired
	private AdminDao adminDao;
	
	public Integer updateUserOut(User user) {
		int a = user.getUserNo();
		User u = User.builder().userNo(a).enabled(true).build();
		return adminDao.updateUser(u);
	}
	
	public Integer updateUserCom(User user) {
		int a = user.getUserNo();
		User u = User.builder().userNo(a).enabled(false).build();
		return adminDao.updateUser(u);
	}
	
	public Integer updateSubProGood(Program pro) {
		int a = pro.getProNo();
		Program p = Program.builder().proNo(a).enabled(true).build();
		return adminDao.updateSubPro(p);
	}

	public Integer updateSubProBad(Program pro) {
		int a = pro.getProNo();
		Program p = Program.builder().proNo(a).enabled(false).build();
		return adminDao.updateSubPro(p);
	}
	
	public Integer updateHostOut(Host host) {
		int a = host.getHostNo();
		Host h = Host.builder().hostNo(a).enabled(true).build();
		return adminDao.updateHost(h);
	}
	
	public Integer updateHostCom(Host host) {
		int a = host.getHostNo();
		Host h = Host.builder().hostNo(a).enabled(false).build();
		return adminDao.updateHost(h);
	}
	
	public Integer deleteProgram(Integer proNo) {
		return adminDao.deleteProgram(proNo);
	}

}
