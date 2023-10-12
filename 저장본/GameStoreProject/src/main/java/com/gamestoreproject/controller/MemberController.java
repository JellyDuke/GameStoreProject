package com.gamestoreproject.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gamestoreproject.dto.Member;
import com.gamestoreproject.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService msvc;
	
	@RequestMapping(value = "/loginpage", method = RequestMethod.GET)
	public ModelAndView loginpage(){
		System.out.println("로그인 페이지");
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginPage");
		return mav;
	}
	
	@RequestMapping(value = "/joinpage", method = RequestMethod.GET)
	public ModelAndView joinpage(){
		System.out.println("회원가입 페이지");
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/joinpage");
		return mav;
	}
	@RequestMapping(value="/memberIdCheck")
	public @ResponseBody String memIdCheck(String inputId) {
		System.out.println("memberIdCheck - 호출");
		
		System.out.println("iputId : " + inputId);
		
		String checkResult = msvc.midCheck(inputId);
		
		return checkResult;
	}
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(Member mem, String inputId, String domain, HttpSession session, RedirectAttributes ra)throws IllegalStateException, IOException {
		System.out.println("MemberController - /memberJoin 호출");
		ModelAndView mav = new ModelAndView();
		//이메일
			String mid = inputId + domain;
			mem.setMid(mid);
			
			//회원가입 기능	
			int joinResult = msvc.memJoin(mem,session);
			
			if(joinResult > 0) {
				mav.setViewName("member/loginPage");
				ra.addFlashAttribute("msg", "회원가입 되었습니다.");
			}else {
				System.out.println("가입 실패");
				mav.setViewName("member/joinpage");
				ra.addFlashAttribute("msg","회원가입에 실패하였습니다.");
			}
		return mav;
	}
}
