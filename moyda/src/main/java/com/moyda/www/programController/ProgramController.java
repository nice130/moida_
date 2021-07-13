package com.moyda.www.programController;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.moyda.www.dto.*;
import com.moyda.www.entity.*;
import com.moyda.www.programService.*;

@Controller
public class ProgramController {

	@Autowired
	private ProgramService service;
	
	//	프로그램 목록
	@GetMapping({"/program/list"})
	public ModelAndView programList(@RequestParam(defaultValue="1") Integer pageNo) {
		System.out.println("============================================================");
		System.out.println(service.list(pageNo));
		System.out.println("============================================================");
		return new ModelAndView("main").addObject("viewname", "program/list.jsp").addObject("page", service.list(pageNo));
	}
	
	//	프로그램 정보 확인 읽기
	@GetMapping({"/program/read"})
	public ModelAndView read(@RequestParam Integer proNo) {
		proNo = 1;
		Integer hostNo = 36;
		return new ModelAndView("main").addObject("viewname", "program/read.jsp").addObject("pro", service.read(proNo, hostNo));
	}
	
	@PostMapping({"/program/signUp"})
	public ModelAndView signUp() {
		Integer proNo = 1;
		Integer openNo = 1;
		Integer usersNo = 11;
		Integer hostNo = 36;
		System.out.println(service.programSignUp(proNo, openNo, usersNo, hostNo));
		Program programSignUp = service.programSignUp(proNo, openNo, usersNo, hostNo);
		return new ModelAndView("redirect:/program/list");
	}
}
