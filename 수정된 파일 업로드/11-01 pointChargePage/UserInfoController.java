package com.gamestoreproject.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gamestoreproject.dto.Coupon;
import com.gamestoreproject.dto.Game;
import com.gamestoreproject.dto.Inquire;
import com.gamestoreproject.dto.Member;
import com.gamestoreproject.dto.Order;
import com.gamestoreproject.service.UserInfoService;

@Controller
public class UserInfoController {
	
	@Autowired
	private UserInfoService usvc;
	
	
	//페이지 보기 시작
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
		ArrayList<Inquire> inquireList = usvc.inquireList();
		mav.addObject("inquireList",inquireList);
		
		mav.setViewName("userInfo/inquiryHistoryPage");
		return mav;
	}
	@RequestMapping(value="/pointrechargepage",method = RequestMethod.GET)
	public ModelAndView pointrechargepage(HttpSession session) {
		System.out.println("USERINFO CONTROLLER - 포인트 충전 페이지");
		ModelAndView mav = new ModelAndView();
		String mid = (String) session.getAttribute("loginId");
		if(mid.length()==0) {
			mav.setViewName("redirect:/loginpage");
			return mav;
		}
		String memUsedPoint = usvc.getMemUsedPoint(mid);
		String memTotalPoint = usvc.getMemTotalPoint(mid);
		String memPoint = usvc.getMemPoint(mid);
		ArrayList<Order> memOrder = usvc.getMemOrder(mid);
		for(Order mo : memOrder) {
			mo.setOdate(mo.getOdate().substring(0,10));
		}
		String mnickname = usvc.getMNick(mid);
		mav.addObject("mid", mnickname);
		mav.addObject("morder", memOrder);
		mav.addObject("mupoint", memUsedPoint);
		mav.addObject("mtpoint", memTotalPoint);
		mav.addObject("mpoint", memPoint);
		mav.setViewName("payment/pointRechargePage");
		return mav;
	}
	//페이지 보기 끝
	
	
	
	
	//쿠폰 시작
	@RequestMapping(value = "/mycouponpage", method = RequestMethod.GET)
	public ModelAndView mycouponpage(HttpSession session) throws ParseException{
		System.out.println("USERINFO CONTROLLER - 내 쿠폰 리스트");		
		String uid = (String)session.getAttribute("loginId");
		
		//session login Uid
		ArrayList<Coupon> couponList = usvc.getcouponList(uid);
		
		ModelAndView mav = new ModelAndView();
		
		
		for(Coupon c : couponList) {
			//쿠폰 0.98 -> 2
			double x = 100*Double.parseDouble(c.getCpercent());
			int y = 100;
			
			// y - 98
			c.setCpercent(Integer.toString(( y - (int) x)));
			
			c.setCdeadline(c.getCdeadline().substring(0, 10));
			c.setCdate(c.getCdate().substring(0, 10));
			
			//쿠폰 오늘 날짜와 쿠폰 날짜 비교
			String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			//쿠폰 날짜일
			Date date = new Date(dateFormat.parse(c.getCdeadline().substring(0, 10)).getTime()); 
			//오늘 날짜
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
	@RequestMapping(value = "/printcoupon", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Coupon> printcoupon(HttpSession session) throws ParseException{
		System.out.println("USERINFO CONTROLLER - 내 쿠폰 리스트");		
		String uid = (String)session.getAttribute("loginId");
		
		//session login Uid
		ArrayList<Coupon> couponList = usvc.getcouponList(uid);
		
		ModelAndView mav = new ModelAndView();
		
		
		for(Coupon c : couponList) {
			//쿠폰 0.98 -> 2
			double x = 100*Double.parseDouble(c.getCpercent());
			int y = 100;
			
			// y - 98
			c.setCpercent(Integer.toString(( y - (int) x)));
			
			c.setCdeadline(c.getCdeadline().substring(0, 10));
			c.setCdate(c.getCdate().substring(0, 10));
			
			//쿠폰 오늘 날짜와 쿠폰 날짜 비교
			String todayfm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis()));
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			//쿠폰 날짜일
			Date date = new Date(dateFormat.parse(c.getCdeadline().substring(0, 10)).getTime()); 
			//오늘 날짜
			Date today = new Date(dateFormat.parse(todayfm).getTime());
			int compare = date.compareTo(today); 
			
			if(compare>=0) {
				c.setDatecheck("Y");
			} else {
				c.setDatecheck("N");
			}
		}
		return couponList;
	}
	@RequestMapping(value = "/makecouponpage", method = RequestMethod.GET)
	public ModelAndView makecouponpage(){
		System.out.println("USERINFO CONTROLLER - 리스트");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/makeCouponPage");
		return mav;
	}
	@RequestMapping(value = "/printtype", method = RequestMethod.GET)
	public @ResponseBody ArrayList<String> printType(String text){
		System.out.println("USERINFO CONTROLLER - 목록 출력");
		ArrayList<String> typeList = usvc.getTypeList(text);
		return typeList;
	}
	//검색엔진
	@RequestMapping(value = "/printgame", method = RequestMethod.GET)
	public @ResponseBody ArrayList<Game> printgame(String text){
		System.out.println("목록 출력");
		ArrayList<Game> typeList = usvc.getgameList(text);
		return typeList;
	}
	@RequestMapping(value = "/printprice", method = RequestMethod.GET)
	public @ResponseBody int printprice(String text){
		System.out.println("목록 출력");
		int price = usvc.getprice(text);
		return price;
	}
	//검색엔진 끝
	@RequestMapping(value = "/printtag", method = RequestMethod.GET)
	public @ResponseBody ArrayList<String> printTag(){
		System.out.println("USERINFO CONTROLLER - 목록 출력");
		ArrayList<String> tagList = usvc.getTagList();
		return tagList;
	}
	@RequestMapping(value = "/makecoupon", method = RequestMethod.GET)
	public ModelAndView makecoupon(Coupon coupon, HttpSession session){
		System.out.println("USERINFO CONTROLLER - makecoupon");
		//쿠폰 99 -> 0.01
		int x = 100-Integer.parseInt(coupon.getCpercent());
		int y = 100;
		
		coupon.setCpercent(Double.toString(((double) x / (double) y)));
		System.out.println(coupon);
		
		//session loginId
		coupon.setCowner((String)session.getAttribute("loginId"));
		
		//쿠폰 발행
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
		System.out.println("USERINFO CONTROLLER - 쿠폰 동록");		
		ModelAndView mav = new ModelAndView();
		
		//session loginId 쿠폰 등록자 확인
		String cowner = (String)session.getAttribute("loginId");
		
		//쿠폰 등록
		int registResult = usvc.registCoupon(code,cowner);
		
		if(registResult > 0) {			
			System.out.println("등록 완료");
		}
		mav.setViewName("redirect:/mycouponpage");
		return mav;
	}
	@RequestMapping(value = "/checkcode", method = RequestMethod.GET)
	public @ResponseBody int checkcode(String code, HttpSession session){
		System.out.println("USERINFO CONTROLLER - 중복 체크");
		String cowner = (String)session.getAttribute("loginId");
		
		//쿠폰 중복 체크
		int checknum = usvc.checkcode(code, cowner);
		System.out.println(checknum);
		return checknum;
	}
	//쿠폰 끝
	
	
	//프로필
	@RequestMapping(value="/mproFile", method = RequestMethod.POST)
	public ModelAndView mproFile(Member mem, HttpSession session, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("USERINFO CONTROLLER - 프로필 등록");
		ModelAndView mav = new ModelAndView();

		String mid = (String) session.getAttribute("loginId");
		String mstate = "YP";
		mem.setMid(mid);
		mem.setMstate(mstate);
		
		System.out.println(mem);
		
		//프로필 인서트
		int updateResult = usvc.updateFile(mem,session);
		System.out.println(mem);
			if(updateResult > 0) {
				mav.setViewName("redirect:/mypage");
				session.setAttribute("loginProfile", mem.getMprofile());
				session.setAttribute("loginState", mem.getMstate());
				ra.addFlashAttribute("msg", "프로필 등록 되었습니다.");
			}
			else {
				mav.setViewName("redirect:/mypage");
				ra.addFlashAttribute("msg", "프로필 등록 실패되었습니다.");
			}
		return mav;
	}
	
}
