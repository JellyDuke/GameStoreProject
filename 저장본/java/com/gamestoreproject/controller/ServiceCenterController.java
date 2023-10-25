package com.gamestoreproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gamestoreproject.dto.Inquire;
import com.gamestoreproject.service.ServiceCenterService;

@Controller
public class ServiceCenterController {
	
	@Autowired
	private ServiceCenterService scs;
	
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
	@RequestMapping(value = "/inquiryWrite", method = RequestMethod.POST)
	public ModelAndView inquiryWrite(Inquire in, HttpSession session, RedirectAttributes ra){
		System.out.println("ServiceCenterController - 문의 등록 요청");
		ModelAndView mav = new ModelAndView();
		
		String writer = (String) session.getAttribute("loginId");
		
		if(writer == null) {
			mav.setViewName("redirect:/loginpage"); //성공 후 내 문의 내역으로 보내주기.
			ra.addFlashAttribute("msg","로그인 후 이용 가능합니다.");
		}else {
			in.setImcode(writer);
			int result = scs.registInquiry(in);
		
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
}
