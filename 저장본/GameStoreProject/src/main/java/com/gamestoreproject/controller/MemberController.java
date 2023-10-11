package com.gamestoreproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@RequestMapping(value = "/loginpage", method = RequestMethod.GET)
	public ModelAndView loginpage(){
		System.out.println("로그인 페이지");
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginPage");
		return mav;
	}
	
	@RequestMapping(value = "/joinpage", method = RequestMethod.GET)
	public ModelAndView joinpage(){
		System.out.println("회원가입 페이지");
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/joinpage");
		return mav;
	}
}
