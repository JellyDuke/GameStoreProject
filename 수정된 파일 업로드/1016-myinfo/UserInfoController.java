package com.gamestoreproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserInfoController {
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public ModelAndView mypage(){
		System.out.println("내 정보 이동");		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myPage");
		return mav;
	}
	@RequestMapping(value = "/myReviewPage", method = RequestMethod.GET)
	public ModelAndView myReviewPage(){
		System.out.println("내 리뷰 목록 이동");		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myReviewPage");
		return mav;
	}
	@RequestMapping(value = "/myCouponPage", method = RequestMethod.GET)
	public ModelAndView myCouponPage(){
		System.out.println("내 쿠폰 목록 이동");		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myCouponPage");
		return mav;
	}
	@RequestMapping(value = "/myGamePage", method = RequestMethod.GET)
	public ModelAndView myGamePage(){
		System.out.println("내 게임 목록 이동");		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myGamePage");
		return mav;
	}
	@RequestMapping(value = "/myPaymentPage", method = RequestMethod.GET)
	public ModelAndView myPaymentPage(){
		System.out.println("내 결제내역 이동");		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myPaymentPage");
		return mav;
	}
}
