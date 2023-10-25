package com.gamestoreproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gamestoreproject.dto.Coupon;
import com.gamestoreproject.dto.Game;
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
	public ModelAndView mycouponpage(HttpSession session) throws ParseException{
		System.out.println("내 쿠폰 리스트");		
		String uid = (String)session.getAttribute("loginId");
		ArrayList<Coupon> couponList = usvc.getcouponList(uid);
		//System.out.println(couponList);
		ModelAndView mav = new ModelAndView();
		for(Coupon c : couponList) {
			double x = 100*Double.parseDouble(c.getCpercent());
			int y = 100;
			c.setCpercent(Integer.toString(( y - (int) x)));
			c.setCdeadline(c.getCdeadline().substring(0, 10));
			c.setCdate(c.getCdate().substring(0, 10));
			String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(dateFormat.parse(c.getCdeadline().substring(0, 10)).getTime()); 
			Date today = new Date(dateFormat.parse(todayfm).getTime());
			int compare = date.compareTo(today); 
			if(compare>=0) {
				c.setDatecheck("Y");
			} else {
				c.setDatecheck("N");
			}
		}
		mav.addObject("cList", couponList);
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
	public @ResponseBody ArrayList<String> printType(String text){
		System.out.println("목록 출력");
		ArrayList<String> typeList = usvc.getTypeList(text);
		return typeList;
	}
	@RequestMapping(value = "/printgame", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Game> printgame(String text){
		System.out.println("목록 출력");
		ArrayList<Game> typeList = usvc.getgameList(text);
		return typeList;
	}
	@RequestMapping(value = "/printtag", method = RequestMethod.GET)
	public @ResponseBody ArrayList<String> printTag(){
		System.out.println("목록 출력");
		ArrayList<String> tagList = usvc.getTagList();
		return tagList;
	}
	@RequestMapping(value = "/makecoupon", method = RequestMethod.GET)
	public ModelAndView makecoupon(Coupon coupon, HttpSession session){
		int x = 100-Integer.parseInt(coupon.getCpercent());
		int y = 100;
		coupon.setCpercent(Double.toString(((double) x / (double) y)));
		System.out.println(coupon);
		coupon.setCowner((String)session.getAttribute("loginId"));
		int insertResult = usvc.makecoupon(coupon);
		if(insertResult > 0) {
			System.out.println("등록성공");
		} else {
			System.out.println("등록실패");
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/makeCouponPage");
		return mav;
	}
	@RequestMapping(value = "/registCoupon", method = RequestMethod.GET)
	public ModelAndView registCoupon(String code, HttpSession session){
		System.out.println("쿠폰 동록");		
		ModelAndView mav = new ModelAndView();
		String cowner = (String)session.getAttribute("loginId");
		int registResult = usvc.registCoupon(code,cowner);
		if(registResult > 0) {			
			System.out.println("등록 완료");
		}
		mav.setViewName("redirect:/mycouponpage");
		return mav;
	}
	@RequestMapping(value = "/checkcode", method = RequestMethod.GET)
	public @ResponseBody int checkcode(String code, HttpSession session){
		System.out.println("중복 체크");
		String cowner = (String)session.getAttribute("loginId");
		int checknum = usvc.checkcode(code, cowner);
		System.out.println(checknum);
		return checknum;
	}
}
