package com.moyda.www.boardContoller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.moyda.www.boardService.BoardService;
import com.moyda.www.dto.BPage;
import com.moyda.www.dto.BoardDto;

@Controller
@SessionAttributes("pageNo")
public class BoardController {
	
	@Autowired
	private BoardService service;

	@GetMapping("/notice")
	public ModelAndView Notice(Integer pageNo,Model model) {
		model.addAttribute("pageNo",pageNo);
		return new ModelAndView("main").addObject("viewname", "notice/list.jsp").addObject("bpage", service.list(pageNo)); 
	}
	@GetMapping("/category")
	public ModelAndView category() {
		return new ModelAndView("main").addObject("viewname", "category/list.jsp");
	}
	@GetMapping("/help")
	public ModelAndView help(Integer faqno, Integer pageNo) {
		return new ModelAndView("main").addObject("viewname", "help/help.jsp");
	}
	@GetMapping("/access")
	public ModelAndView access(Integer pageNo) {
		return new ModelAndView("main").addObject("viewname", "access/access.jsp");
	}
	@GetMapping("/notice/read")
	public ModelAndView write(@RequestParam Integer pageNo, Principal principal) {
		String username = (principal!=null)? principal.getName(): null;
		return new ModelAndView("main").addObject("viewname","notice/read.jsp").addObject("board", service.read(pageNo, username));
	}
}
