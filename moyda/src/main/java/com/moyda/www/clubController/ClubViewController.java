package com.moyda.www.clubController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.moyda.www.clubservice.mvc.clubService;


@Controller
public class ClubViewController {
	@Autowired
	private clubService service;
	
	@GetMapping("/club/clubmade")
	public ModelAndView clubCreatePage() {
		return new ModelAndView("/club/createClub"); 
	}
	
	@GetMapping("/club/clubjoin")
	public ModelAndView clubJoinPage() {
		Integer clubNo =11;
		return new ModelAndView("/club/joinClub").addObject("club",service.clubCheck(clubNo));
	}
	
	@GetMapping("/club/clubmain")
	public ModelAndView clubMain() {
		System.out.println();
		return new ModelAndView("clubmain").addObject("viewname","club/clubmain.jsp");
	}
	@GetMapping("/club/aaa")
	public ModelAndView aaa() {
		return new ModelAndView("club/Clublist");
	}
	
	@GetMapping("/club/clubwrite")
	public ModelAndView write() {
		return new ModelAndView("club/clubboard");
	}
	@GetMapping("/club/moimwrite")
	public ModelAndView moimWrite() {
		return new ModelAndView("club/clubmoimboard");
	}
}
