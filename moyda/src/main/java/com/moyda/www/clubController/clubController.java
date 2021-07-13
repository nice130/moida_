package com.moyda.www.clubController;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.moyda.www.clubservice.mvc.VerifyRecaptcha;
import com.moyda.www.clubservice.mvc.clubService;
import com.moyda.www.dto.ClubDto.ClubCreateDto;
import com.moyda.www.dto.ClubDto.ClubJoinDto;
import com.moyda.www.entity.Club;

@Controller
@SessionAttributes({"clubNo","club"})
public class clubController {
	@Autowired
	private clubService service;

	// 클럽개설
	@PostMapping("/club/clubcreate")
	public ModelAndView clubCreateJoin(ClubCreateDto dto, RedirectAttributes rs, Principal principal) {
		Club club = service.clubCreate(dto, principal);
		rs.addFlashAttribute("msg","클럽 개설이 되었습니다. 자유롭게 활동해보세요!");
		rs.addFlashAttribute("club",club);
		return new ModelAndView("redirect:/club/clubmain");
	}

	// 클럽 가입
	@PostMapping("/club/clubjoin")
	public ModelAndView clubJoin(ClubJoinDto dto, RedirectAttributes ra,Principal principal) {
		Integer clubNo =11;
		Club clubJoin = service.clubJoin(dto, principal,clubNo);
		System.out.println(clubJoin);
		ra.addFlashAttribute("club",clubJoin);
		return new ModelAndView("redirect:/club/clubmain");
	}
	// 임시클럽이동?
	@GetMapping("/club/clubgo")
	public ModelAndView clubGo(@RequestParam Integer clubNo, Model model,HttpSession session) {
		System.out.println(clubNo);
		Club club = service.go(clubNo);
		club.setClubNo(clubNo);
		session.setAttribute("clubNo", clubNo);
		session.setAttribute("club", club);
		model.addAttribute("club",club);
		return new ModelAndView("clubmain").addObject("viewname","club/clubmain.jsp").addObject("club",club);
	}
	// 보안 API
	@ResponseBody
	@RequestMapping(value = "VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
		VerifyRecaptcha.setSecretKey("시크릿 코드");
		String gRecaptchaResponse = request.getParameter("recaptcha");
		try {
			if(VerifyRecaptcha.verify(gRecaptchaResponse))
				return 0; // 성공
			else return 1; // 실패
		} catch (Exception e) {
			e.printStackTrace();
			return -1; //에러
		}
	}
	// 클럽이름 체크
	@GetMapping(path="/club/nameCheck", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> nameCheck(@RequestParam String clubName) {
		if(service.nameCheck(clubName)==true)
			return ResponseEntity.ok("좋은 클럽명 이네요!");
		return ResponseEntity.status(HttpStatus.CONFLICT).body("사용중인 클럽명입니다 ㅠㅠ");
	}


	// 클럽 메인
	@GetMapping("/club/mainlist")
	public ModelAndView clubMain(@RequestParam(defaultValue="1") Integer clubNo,@RequestParam Principal principal) {
		return new ModelAndView("/club/clubmain.jsp").addObject("clubList", service.mainList(clubNo,principal));
	}
	

	
	
	// 클럽게시판
	@GetMapping("/club/clublist")
	public ModelAndView clublist(Integer clubNo,@RequestParam(defaultValue="1") Integer pageno) {
		return new ModelAndView("/clubmain").addObject("viewname","club/clubboard.jsp").addObject("page",service.list(pageno));
	}

	@GetMapping("/club/read")
	public ModelAndView read(@RequestParam Integer clubNo, Principal principal) {
		//String username = (principal!=null)? principal.getName(): null;
		String username = "@naver.com";
		return new ModelAndView("/club/read").addObject("board", service.read(clubNo,username));
	}
}