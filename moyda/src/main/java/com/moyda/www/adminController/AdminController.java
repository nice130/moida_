package com.moyda.www.adminController;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.moyda.www.adminService.*;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	//프로그램에서 신고된 회원 목록
	@GetMapping({"/admin/", "/admin/main", "/admin/reportProgramUserList"})
	public ModelAndView adminReportProgramUserList(@RequestParam(defaultValue="1") Integer pageno) {
		//신고된 프로그램, 회원
		return new ModelAndView("main").addObject("viewname", "adminMain.jsp")
				.addObject("admin", "admin/reportProgramUserList.jsp").addObject("page", service.findReportProgramUser(pageno));
	}
	
	//신고된 회원 상세정보
	@GetMapping("/admin/reportUserDetail")
	public ModelAndView adminReportUserDetail(Integer userNo) {
		return new ModelAndView("main").addObject("viewname", "adminMain.jsp").addObject("admin", "admin/reportUserDetail.jsp")
				.addObject("userDetail", service.findUserById(userNo));
	}
	
	//신청된 프로그램 리스트
	@GetMapping("/admin/programSubList")
	public ModelAndView adminProgramSubList(@RequestParam(defaultValue="1") Integer pageno) {
		return new ModelAndView("main").addObject("viewname", "adminMain.jsp")
				.addObject("admin", "admin/programSubList.jsp").addObject("page", service.findSubProgram(pageno));
	}
	
	//프로그램 신청 or 신고된 호스트 계정 상세정보 확인
	@GetMapping("/admin/hostDetail")
	public ModelAndView adminHostDetail(Integer hostNo) {
		return new ModelAndView("main").addObject("viewname", "adminMain.jsp")
				.addObject("admin", "admin/hostDetail.jsp").addObject("hostDetail", service.findHostDetail(hostNo));
	}
	
	//신청한 프로그램 상세정보
	//팝업창 띄우기
	@GetMapping("/admin/programDetail")
	public ModelAndView adminProgramDetail(Integer proNo) {
		return new ModelAndView("admin/programDetail").addObject("proDetail", service.findProDetailById(proNo));
	}
	
	//신고된 프로그램 리스트
	@GetMapping("/admin/reportProgramList")
	public ModelAndView adminReportProgramList(@RequestParam(defaultValue = "1") Integer pageno) {
		return new ModelAndView("main").addObject("viewname", "adminMain.jsp")
				.addObject("admin", "admin/reportProgramList.jsp").addObject("page", service.findReportProgram(pageno));
	}
	
}
