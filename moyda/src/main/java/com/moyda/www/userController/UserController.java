package com.moyda.www.userController;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.mvc.support.*;

import com.moyda.www.dao.*;
import com.moyda.www.dto.UserDto.*;
import com.moyda.www.userService.*;
@Controller
public class UserController {
	@Autowired
	private UserService userservice;
	@Autowired
	private UhostService hostservice;
	@Autowired
	private UserDao userdao;
	@GetMapping("/")
	public ModelAndView rootPage() {
		return new ModelAndView("rootMain").addObject("viewname","user/root.jsp");
	}
	@GetMapping({"/login"})
	public ModelAndView loginPage() {
		return new ModelAndView("rootMain").addObject("viewname","user/login.jsp");
	}
	@PostMapping("/loginCheck")
	public ModelAndView loginPage(String email,String password,HttpSession session) {
		boolean result = userdao.loginCheck(email,password,session);
		
		if(result == true) {
			System.out.println("성공");
			return new ModelAndView("main").addObject("viewname","mainpage/main.jsp");
		}else {
			System.out.println("실패");
			return new ModelAndView("rootMain").addObject("viewname","user/login.jsp");
		}
	}
	
	@PostMapping("/hostloginCheck")
	public ModelAndView hostloginPage(String email,String password,HttpSession session) {
		boolean result = userdao.hostloginCheck(email,password,session);
		
		if(result == true) {
			System.out.println("성공");
			return new ModelAndView("main").addObject("viewname","mainpage/main.jsp");
		}else {
			System.out.println("실패");
			return new ModelAndView("rootMain").addObject("viewname","user/login.jsp");
		}
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@GetMapping("/join")
	public ModelAndView join() {
		return new ModelAndView("rootMain").addObject("viewname","user/join.jsp");
	}
	@GetMapping("/userjoin")
	public ModelAndView userJoin() {
		return new ModelAndView("rootMain").addObject("viewname","user/userjoin.jsp");
	}
	@PostMapping("/userjoin")
	public ModelAndView userJoin(JoinRequestDto dto) {
		userservice.join(dto);
		return new ModelAndView("redirect:/");
	}
	@GetMapping("/hostjoin")
	public ModelAndView hostJoin() {
		return new ModelAndView("rootMain").addObject("viewname","user/hostjoin.jsp");
	}
	@PostMapping("/hostjoin")
	public ModelAndView hostJoin(hostJoinRequestDto dto) {
		hostservice.join(dto);
		return new ModelAndView("redirect:/");
	}
	@GetMapping("/userfindid")
	public ModelAndView userfindid() {
		return new ModelAndView("rootMain").addObject("viewname","user/userfindid.jsp");
	}
	@PostMapping("/userfindid")
	public ModelAndView userfindid(String irum, String phone, String phone1,String phone2,RedirectAttributes ra) {
		String phone3 = phone+phone1+phone2;
		String email=userservice.userfindId(irum, phone3);
		if(email!=null) {
			System.out.println("이메일이낫널일때");
			ra.addFlashAttribute("msg", "'"+email+"'");
			return new ModelAndView("redirect:/findresult");
		}
		return null;
	}
	@GetMapping("/userfindpass")
	public ModelAndView userfindpass() {
		return new ModelAndView("rootMain").addObject("viewname","user/userfindpass.jsp");
	}
	@PostMapping("/userfindpass")
	public ModelAndView userfindpass(String irum,String email, String e_domain,RedirectAttributes ra) {
		String email1 = email+"@"+e_domain;
//		String email2=userservice.userfind(irum, email1);
		if(email!=null) {
			ra.addFlashAttribute("msg", "'"+email+"'");
			return new ModelAndView("redirect:/findresult");
		}
		return null;
	}
	@GetMapping("/hostfindid")
	public ModelAndView hostfindid() {
		return new ModelAndView("rootMain").addObject("viewname","user/hostfindid.jsp");
	}
	@PostMapping("/hostfindid")
	public ModelAndView hostfindid(String nickname, String phone, String phone1,String phone2,RedirectAttributes ra) {
		String phone3 = phone+phone1+phone2;
		String email=hostservice.hostfindId(nickname, phone3);
		if(email!=null) {
			ra.addFlashAttribute("msg", "'"+email+"'");
			return new ModelAndView("redirect:/findresult");
		}
		return null;
	}
	@GetMapping("/findresult")
	public ModelAndView findresult() {
		return new ModelAndView("rootMain").addObject("viewname","user/findresult.jsp");
	}
}
