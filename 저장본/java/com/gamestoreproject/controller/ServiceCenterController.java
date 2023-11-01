package com.gamestoreproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gamestoreproject.dao.UserInfoDao;
import com.gamestoreproject.dto.Inquire;
import com.gamestoreproject.service.ServiceCenterService;
import com.gamestoreproject.service.UserInfoService;

@Controller
public class ServiceCenterController {
	
	@Autowired
	private ServiceCenterService scs;
	@Autowired
	private UserInfoService usvc;
	
	
	@RequestMapping(value = "/serviceCenter", method = RequestMethod.GET)
	public ModelAndView mypage(){
		System.out.println("ServiceCenterController - 고객지원 페이지 이동");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("serviceCenter/serviceCenter");
		return mav;
	}
	@RequestMapping(value = "/inquiry", method = RequestMethod.GET)
	public ModelAndView inquiry(){
		System.out.println("ServiceCenterController - 고객지원 페이지 이동");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("serviceCenter/inquiryPage");
		return mav;
	}
}
