package com.gamestoreproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServiceCenterController {
	@RequestMapping(value = "/serviceCenter", method = RequestMethod.GET)
	public ModelAndView mypage(){
		System.out.println("고객지원 페이지 이동");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("serviceCenter/serviceCenter");
		return mav;
	}
}
