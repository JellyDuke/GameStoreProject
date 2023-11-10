package com.gamestoreproject.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

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
import com.gamestoreproject.dto.Order;
import com.gamestoreproject.service.GameService;
import com.gamestoreproject.service.PayService;
import com.gamestoreproject.service.UserInfoService;
import com.google.gson.Gson;

@Controller
public class UserInfoController {
	
	@Autowired
	private UserInfoService usvc;
	@Autowired
	private GameService gsvc;	
	//페이지 보기 시작
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(){
		System.out.println("USERINFO CONTROLLER - 내 정보 이동");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userInfo/myPage");
		return mav;
	}
	@RequestMapping(value = "/mygamepage", method = RequestMethod.GET)
	public ModelAndView myGamePage(HttpSession session){
		System.out.println("USERINFO CONTROLLER - 내 게임");
		String mid = (String) session.getAttribute("loginId");
		ArrayList<Game> gList = gsvc.getMemgList(mid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("gList", gList);
		System.out.println(gList);	
		mav.setViewName("userInfo/myGamePage");
		return mav;
	}
	@RequestMapping(value = "/myreviewpage", method = RequestMethod.GET)
	public ModelAndView myReviewPage(HttpSession session){
		System.out.println("USERINFO CONTROLLER - 내 리뷰");
		String mid = (String) session.getAttribute("loginId");
		
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, String>> reviewList = usvc.getReviewList(mid);
		System.out.println(reviewList);
		
		if(reviewList != null && reviewList.size() > 0) {
			mav.addObject("reviewList", reviewList);
		}
		
		mav.setViewName("userInfo/myReviewPage");
		return mav;
	}
	@RequestMapping(value = "/paymentHistory", method = RequestMethod.GET)
	public ModelAndView paymentHistory(HttpSession session){
		String mid = (String) session.getAttribute("loginId");
		System.out.println("USERINFO CONTROLLER - 결제내역/환불 페이지");
		ArrayList<Order> oList = usvc.getoList(mid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("oList", oList);
		System.out.println(oList);
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
			ArrayList<String> tagList = new ArrayList<String>();
			tagList.add("액션");
			tagList.add("시뮬레이션");
			tagList.add("전략");
			tagList.add("어드벤처");
			tagList.add("인디");
			tagList.add("레이싱");
			tagList.add("대규모 멀티플레이어");
			tagList.add("스포츠");
			tagList.add("RPG");
			tagList.add("캐주얼");
			if(tagList.contains(c.getCtype())) {
				c.setTypeCheck("tag");
			} else {
				String gname = c.getCtype();
				String gcode = gsvc.getGcode(gname);
				c.setCgcode(gcode);
				c.setTypeCheck("title");
			}
			if(compare>=0) {
				c.setDatecheck("Y");
			} else {
				c.setDatecheck("N");
			}
		}
		System.out.println(couponList);
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
		int updateResult = usvc.updateFile(mem,session, ra);
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
	@RequestMapping(value = "/inquiryWrite", method = RequestMethod.POST)
	public ModelAndView inquiryWrite(Inquire in, HttpSession session, RedirectAttributes ra){
		System.out.println("ServiceCenterController - 문의 등록 요청");
		ModelAndView mav = new ModelAndView();
		
		String writer = (String) session.getAttribute("loginId");
		String nickname = (String) session.getAttribute("loginMnickname");
		
		if(writer == null) {
			mav.setViewName("redirect:/loginpage"); //성공 후 내 문의 내역으로 보내주기.
			ra.addFlashAttribute("msg","로그인 후 이용 가능합니다.");
		}else {
			in.setImcode(writer);
			in.setInickname(nickname);
			int result = usvc.registInquiry(in);
			
			System.out.println(in);
			if(result > 0 ) {
				System.out.println("등록 성공");
				mav.setViewName("redirect:/"); //성공 후 내 문의 내역으로 보내주기.
				ra.addFlashAttribute("msg","글 등록 성공");
			}else {
				System.out.println("등록 실패");
				mav.setViewName("redirect:/inquiry"); //실패 후 다시 작성
				ra.addFlashAttribute("msg","글등록 실패");
			}
		}
		return mav;
	}
	@RequestMapping(value = "/inquiryHistory", method = RequestMethod.GET)
	public ModelAndView inquiryHistory(HttpSession session, Inquire inquire){
		System.out.println("USERINFO CONTROLLER - 문의 내역 리스트");
		
		ModelAndView mav = new ModelAndView();
		String mid = (String) session.getAttribute("loginId");
		ArrayList<Inquire> inquireList = null;
		//1.문의 목록 조회
		inquireList = usvc.inquireList(mid);
		System.out.println(inquireList);
		
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
		
		mav.setViewName("userInfo/inquiryViewPage");
		mav.addObject("inquire", inquire);
		return mav;
	}
	//문의 답변
	@RequestMapping(value="/inquiryAnswerWrite")
	public @ResponseBody String inquiryAnswerWrite(String icode, String acomment,Answer aw, HttpSession session) {
		System.out.println("USERINFO CONTROLLER - inquiryAnswerWrite");
		String mid = (String)session.getAttribute("loginId");
		aw.setIcode(icode);
		aw.setAcomment(acomment);

		aw.setAmid(mid); //문의 답변자 작성자 저장
		int result = usvc.registAnswer(aw,icode);
		
		return result+"";
	}
	
	@RequestMapping(value="/answersList")
	public @ResponseBody String answerList(String icode,Inquire inquire, Answer answer, HttpSession session) {
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
	
	//결제
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
		session.setAttribute("loginPoint", memPoint);
		
		mav.setViewName("payment/pointRechargePage");
		return mav;
	}
	//결제끝
}
