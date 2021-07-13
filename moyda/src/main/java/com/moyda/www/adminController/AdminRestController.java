package com.moyda.www.adminController;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.moyda.www.adminService.*;
import com.moyda.www.dto.*;
import com.moyda.www.entity.*;

@RestController
public class AdminRestController {
	
	@Autowired
	private AdminRestService service;
	
	//신고된 회원 계정 정지
	@RequestMapping(path="/admin/reportUserOut", method=RequestMethod.POST)
	public ResponseEntity<?> adminReportUserOut(User user) {
		return ResponseEntity.ok(service.updateUserOut(user));
	}
	
	//신고된 회원 계정 정지 취소
	@PostMapping("/admin/reportUserCom")
	public ResponseEntity<?> adminReportUserCom(User user) {
		return ResponseEntity.ok(service.updateUserCom(user));
	}
	
	//프로그램 승인
	@PostMapping("/admin/programGood")
	public ResponseEntity<?> adminProgramGood(Program pro) {
		return ResponseEntity.ok(service.updateSubProGood(pro));
	}
	
	//프로그램 거절
	@PostMapping("/admin/programBad")
	public ResponseEntity<?> adminProgramBad(Program pro) {
		return ResponseEntity.ok(service.updateSubProBad(pro));
	}
	
	//신고된 프로그램, 호스트 계정 삭제
	@PostMapping("/admin/reportProgramAndHostOut")
	public ResponseEntity<?> adminReportProgramAndHostOut(Integer proNo, Host host) {
//		List<AdminProHostUserDto> dto = 
		service.deleteProgram(proNo);
		return ResponseEntity.ok(service.updateHostOut(host));
	}
	
	@PostMapping("/admin/reportHostCom")
	public ResponseEntity<?> adminReportHostCom(Host host) {
		return ResponseEntity.ok(service.updateHostCom(host));
	}
	
}
