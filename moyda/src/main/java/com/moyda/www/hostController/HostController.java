package com.moyda.www.hostController;

import java.security.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.moyda.www.dto.HostDto.*;
import com.moyda.www.hostService.*;

@Controller
public class HostController {
	
	@Autowired
	private HostService service;
	
	//	마이 페이지, 내 정보 보기
	@GetMapping({"/host/myPage"})
	public ModelAndView hostMyPage(HttpSession session, Principal principal) {
		System.out.println("====================================================");
		System.out.println(principal.getName());
		System.out.println("====================================================");
		return new ModelAndView("main").addObject("viewname", "hostMain.jsp").addObject("my", "host/hostInfoMain.jsp").addObject("infoMain", "hostInfo.jsp").addObject("host", service.hostMyPage(36));
	}
	
	//	내 정보 수정
	@GetMapping({"/host/infoUpdate"})
	public ModelAndView hostInfoUpdate() {
		return new ModelAndView("main").addObject("viewname", "hostMain.jsp").addObject("my", "host/hostInfoMain.jsp").addObject("infoMain", "infoUpdate.jsp").addObject("host", service.hostInfoUpdate(36));
	}
	
	//	내 정보 수정
	@PostMapping({"/host/update"})
	public ResponseEntity<?> hostUpdate(UpdateRequestDto dto) {
		dto.setHostNo(36);
		
		if(service.update(dto)==true) {
			return ResponseEntity.ok(null);
		}
		return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
	} 

	//	회원 탈퇴 확인
	@GetMapping({"/host/out"})
	public ModelAndView hostOut() {
		return new ModelAndView("main").addObject("viewname", "hostMain.jsp").addObject("my", "host/hostInfoMain.jsp").addObject("infoMain", "hostOut.jsp").addObject("host", service.hostOutCheck(36));
	}
	
	//	탈퇴=계정 정지 처리
	@PostMapping({"/host/out"})
	public String hostOut(OutCheckDto dto) {
		service.hostOut(dto);
		return "redirect:/";
	}

	//	내 프로그램 보기
	@GetMapping({"/host/myProgram"})
	public ModelAndView hostMyProgram() {
		return new ModelAndView("main").addObject("viewname", "hostMain.jsp").addObject("my", "host/myProgramMain.jsp").addObject("proMain", "myProgram.jsp").addObject("pro", service.myProgram(36));
	}

	//	내 프로그램 수정
	@GetMapping({"/host/myProgramUpdate"})
	public ModelAndView hostMyProgramUpdate() {
		return new ModelAndView("main").addObject("viewname", "hostMain.jsp").addObject("my", "host/myProgramMain.jsp").addObject("proMain", "programUpdate.jsp").addObject("pro", service.myProgram(36));
	}
	
	@PostMapping({"/host/programUpdate"})
	public ResponseEntity<?> hostMyProgramUpdate(MyProgramDto dto) {
		dto.setHostNo(36);
		
		if(service.programUpdate(dto)==true) {
			System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
			return ResponseEntity.ok(null);
		}
		System.out.println("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB");
		return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
	}
	
	//	프로그램 등록
	@GetMapping({"/host/programRegistration"})
	public ModelAndView hostProgramRegistration() {
		return new ModelAndView("main").addObject("viewname", "hostMain.jsp").addObject("my", "host/myProgramMain.jsp").addObject("proMain", "programRegistration.jsp");		
	}
	
	//	프로그램 등록
	@PostMapping({"/host/programRegistration"})
	public ModelAndView hostProgramRegistration(ProgramRegiDto dto) {
		//	사진파일 varchar2 50자 자동 생성
		dto.setProfile("00000000001111111111222222222233333333334444444444");
		//	로그인한 아이디 hostNo받아오기
		dto.setHostNo(36);
		//	시퀀스 or Max값 읽어서 +1 
		dto.setProNo(4);
		Integer proNo = service.programRegistration(dto);
		return new ModelAndView("redirect:/host/myProgram");
	}
	
	//	프로그램 삭제	
	@GetMapping({"/host/programDelete"})
	public ModelAndView hostProgramDelete() {
		return new ModelAndView("main").addObject("viewname", "hostMain.jsp").addObject("my", "host/myProgramMain.jsp").addObject("proMain", "programDelete.jsp");
	}

	//	프로그램 삭제
	@PostMapping({"/host/programDelete"})
	public String programDelete() {
		//	서비스 추가할 것
		return "redirect:/";
	}
	
	//	참가비 지급요청
	@GetMapping({"/host/pay"})
	public ModelAndView hostPay() {
		return new ModelAndView("main").addObject("viewname", "hostMain.jsp").addObject("my", "host/hostPay.jsp").addObject("pro", service.myProgram(36));
	}
	
	//	참가비 지급요청
//	@PostMapping({"/host/pay"})
//	public ModelAndView hostPayRequest() {
//		Integer proNo = 1;
//		Integer openNo = 1;
//		Integer usersNo = 11;
//		Integer hostNo = 36;
//		Program programSignUp = service.programSignUp(proNo, openNo, usersNo, hostNo);
//		return new ModelAndView("redirect:/host/pay");
//	}
	
	//	참가비 지급완료
	@PostMapping({"/host/pay"})
	public ModelAndView hostPayComplete() {
		Integer hostNo = 36;
		return new ModelAndView("main").addObject("viewname", "hostMain.jsp").addObject("my", "host/hostPayComplete.jsp").addObject("host", service.hostMyPage(hostNo)).addObject("pro", service.myProgram(hostNo));
	}
}

