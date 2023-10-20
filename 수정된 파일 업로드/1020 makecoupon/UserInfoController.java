package com.gamestoreproject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gamestoreproject.service.UserInfoService;

@Controller
public class UserInfoController {
	@Autowired
	UserInfoService usvc;
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(){
		System.out.println("내 정보 이동");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myPage");
		return mav;
	}
	@RequestMapping(value = "/mygamepage", method = RequestMethod.GET)
	public ModelAndView myGamePage(){
		System.out.println("내 게임");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myGamePage");
		return mav;
	}
	@RequestMapping(value = "/myreviewpage", method = RequestMethod.GET)
	public ModelAndView myReviewPage(){
		System.out.println("내 리뷰");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myReviewPage");
		return mav;
	}
	@RequestMapping(value = "/mywishlist", method = RequestMethod.GET)
	public ModelAndView myWishList(){
		System.out.println("내 찜");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myWishList");
		return mav;
	}
	@RequestMapping(value = "/mySaleList", method = RequestMethod.GET)
	public ModelAndView mySaleList(){
		System.out.println("찜목록 세일 리스트");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/mySaleList");
		return mav;
	}
	@RequestMapping(value = "/mycouponpage", method = RequestMethod.GET)
	public ModelAndView mycouponpage(){
		System.out.println("내 쿠폰 리스트");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myCouponPage");
		return mav;
	}
	@RequestMapping(value = "/mypaymentpage", method = RequestMethod.GET)
	public ModelAndView mypaymentpage(){
		System.out.println("내 결제내역 리스트");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myPaymentPage");
		return mav;
	}
	@RequestMapping(value = "/myinquirypage", method = RequestMethod.GET)
	public ModelAndView myinquirypage(){
		System.out.println("내 문의내역");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myInquiryPage");
		return mav;
	}
	@RequestMapping(value = "/makecouponpage", method = RequestMethod.GET)
	public ModelAndView makecouponpage(){
		System.out.println(" 리스트");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/makeCouponPage");
		return mav;
	}
	@RequestMapping(value = "/printtype", method = RequestMethod.GET)
	public @ResponseBody ArrayList<String> printType(String text, String type){
		System.out.println("목록 출력");
		ArrayList<String> typeList = usvc.getTypeList(text,type);
		return typeList;
	}
}
