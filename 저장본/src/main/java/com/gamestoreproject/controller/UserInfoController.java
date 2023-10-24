package com.gamestoreproject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gamestoreproject.dto.Inquire;
import com.gamestoreproject.service.UserInfoService;

@Controller
public class UserInfoController {
	
	@Autowired
	private UserInfoService uis;
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(){
		System.out.println("USERINFO CONTROLLER - 내 정보 이동");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myPage");
		return mav;
	}
	@RequestMapping(value = "/mygamepage", method = RequestMethod.GET)
	public ModelAndView myGamePage(){
		System.out.println("USERINFO CONTROLLER - 내 게임");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myGamePage");
		return mav;
	}
	@RequestMapping(value = "/myreviewpage", method = RequestMethod.GET)
	public ModelAndView myReviewPage(){
		System.out.println("USERINFO CONTROLLER - 내 리뷰");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myReviewPage");
		return mav;
	}
	@RequestMapping(value = "/myWishlist", method = RequestMethod.GET)
	public ModelAndView myWishList(){
		System.out.println("USERINFO CONTROLLER - 내 찜");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myWishList");
		return mav;
	}
	@RequestMapping(value = "/mySaleList", method = RequestMethod.GET)
	public ModelAndView mySaleList(){
		System.out.println("USERINFO CONTROLLER - 세일 리스트");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/mySaleList");
		return mav;
	}
	@RequestMapping(value = "/paymentHistory", method = RequestMethod.GET)
	public ModelAndView paymentHistory(){
		System.out.println("USERINFO CONTROLLER - 결제내역/환불 페이지");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/paymentHistoryPage");
		return mav;
	}
	@RequestMapping(value = "/inquiryHistory", method = RequestMethod.GET)
	public ModelAndView inquiryHistory(){
		System.out.println("USERINFO CONTROLLER - 문의 내역 리스트");
		
		ModelAndView mav = new ModelAndView();
		
		//1.문의 목록 조회
		ArrayList<Inquire> inquireList = uis.inquireList();
		mav.addObject("inquireList",inquireList);
		
		mav.setViewName("userInfo/inquiryHistoryPage");
		return mav;
	}
	
}
