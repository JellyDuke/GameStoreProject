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

import com.gamestoreproject.dto.Answer;
import com.gamestoreproject.dto.Coupon;
import com.gamestoreproject.dto.Game;
import com.gamestoreproject.dto.Inquire;
import com.gamestoreproject.dto.Member;
import com.gamestoreproject.service.UserInfoService;
import com.google.gson.Gson;

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
	//문의 관련
	@RequestMapping(value = "/inquiryHistory", method = RequestMethod.GET)
	public ModelAndView inquiryHistory(HttpSession session){
		System.out.println("USERINFO CONTROLLER - 문의 내역 리스트");
		
		ModelAndView mav = new ModelAndView();
		String mid = (String) session.getAttribute("loginId");
		
		//1.문의 목록 조회
		ArrayList<Inquire> inquireList = usvc.inquireList(mid);
		mav.addObject("inquireList",inquireList);
		
		mav.setViewName("userInfo/inquiryHistoryPage");
		return mav;
	}
	//inquiryViewPage.jsp
	@RequestMapping(value = "/inquiryView")
	public ModelAndView boardView(String icode) {
		System.out.println("USERINFO CONTROLLER - 문의 글 상세 보기 요청");
		ModelAndView mav = new ModelAndView();
		System.out.println("상세보기 글번호 : " + icode);
		
		//1.문의 정보 조회
		Inquire inquire = usvc.getInquiryView(icode);
		System.out.println(inquire);
		
		//2 문의 상세 페이지	
		mav.setViewName("userInfo/inquiryViewPage");
		mav.addObject("inquire", inquire);
		return mav;
	}
	//문의 답변
	@RequestMapping(value="/inquiryAnswerWrite")
	public @ResponseBody String inquiryAnswerWrite(String icode, String acomment,Answer aw, HttpSession session) {
		System.out.println("USERINFO CONTROLLER - inquiryAnswerWrite");
		aw.setIcode(icode);
		aw.setAcomment(acomment);
		
		//댓글 작성자 확인
		String mid = (String)session.getAttribute("loginId");
		aw.setAmid(mid); //문의 답변자 작성자 저장
		int result = usvc.registAnswer(aw);
		
		System.out.println(aw);
		return result+"";
	}
	
	@RequestMapping(value="/answersList")
	public @ResponseBody String answerList(String icode) {
		System.out.println("USERINFO CONTROLLER - answerList");
		System.out.println("문의 조회 할 코드 : " + icode );

		//1. service - 답변 목록 조회
		ArrayList<Answer> answerList = usvc.getAnswerList(icode);
		
		//조회된 답변 목록 확인
		System.out.println(answerList.size());
		System.out.println(answerList);
		
		//2. JSON 변환 후 응답
		//gson 사용 {key : value}
		Gson gson = new Gson();
		String awList = gson.toJson(answerList);
		System.out.println("조회"+awList);
		return awList;	
	}
	//문의 끝
}
