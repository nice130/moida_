package com.moyda.www.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.moyda.www.boardService.BoardService;

@Controller
public class MController {
	@Autowired
	private BoardService service;
	
	@GetMapping("/home")
	public ModelAndView main() {
		return new ModelAndView("main").addObject("viewname", "mainpage/main.jsp")
				.addObject("pageNo",service.selectPageNo());
	}
}
