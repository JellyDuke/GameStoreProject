package com.gamestoreproject.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(@Param("userId")String userId, @Param("userPw")String userPw, HttpSession session, RedirectAttributes ra) {
		System.out.println("로그인 처리 요청 - /memberLogin");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("mid : " + userId);
		System.out.println("mpw : " + userPw);
		
		Member loginMember = msvc.getLoginMemberInfo(userId, userPw);
		
		if(loginMember == null) {
			System.out.println("로그인 실패");
			ra.addFlashAttribute("msg","아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.setViewName("redirect:/loginpage");
		}else {
			String mstate = loginMember.getMstate().substring(1,2);
			System.out.println(mstate);
			
			System.out.println("로그인 성공");
			session.setAttribute("loginId", loginMember.getMid());
			session.setAttribute("loginMname", loginMember.getMname());
			session.setAttribute("loginMnickname", loginMember.getMnickname());
			session.setAttribute("loginProfile", loginMember.getMprofile());
			session.setAttribute("loginState", loginMember.getMstate());
			ra.addFlashAttribute("msg","로그인 성공");
			mav.setViewName("redirect:/");
			System.out.println(loginMember.getMid()); 
		}
		return mav;
	}
	@RequestMapping(value="/logout")
	public String memberLogout(RedirectAttributes ra, HttpSession session) {
		System.out.println("로그아웃 요청");
		session.invalidate();
		ra.addFlashAttribute("msg","로그아웃 되었습니다.");
		return "redirect:/";
	}
	@RequestMapping(value = "/memberLogin_kakao")
	public @ResponseBody String memberLogin_kakao(String id, HttpSession session, String profile) {
		System.out.println("카카오 로그인 요청");
		System.out.println("카카오 id : " + id);

		Member loginMember = msvc.getLoginMemberInfo_kakao(id);

		if (loginMember == null) {
			System.out.println("카카오 계정 정보 없음");
			
			return "N";
			
		} else {
			
			System.out.println("카카오 계정 정보 있음");
			System.out.println("로그인 처리");
			
			session.setAttribute("loginId", loginMember.getMid());
			session.setAttribute("loginMname", loginMember.getMname());
			session.setAttribute("loginMnickname", loginMember.getMname());
			session.setAttribute("loginProfile", profile);
			session.setAttribute("loginState", loginMember.getMstate());
			return "Y";
		}
	}
	@RequestMapping(value = "/memberJoin_kakao")
	public @ResponseBody String memberJoin_kakao(Member member){
		System.out.println("카카오 계정 - 회원가입요청 - /memberJoin_kakao");
		System.out.println(member);
		int result = msvc.registMember_kakao(member);
		
		return result+"";
	}
}
