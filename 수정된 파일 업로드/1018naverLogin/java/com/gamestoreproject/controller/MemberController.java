package com.gamestoreproject.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gamestoreproject.dto.Member;
import com.gamestoreproject.service.MemberService;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class MemberController {
	
	@Autowired
	MemberService msvc;
	
	@RequestMapping(value = "/joinPage")
	public ModelAndView joinPage() {
		
		System.out.println("회원가입 페이지 이동 요청");
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/JoinPage");
		
		return mav;
	}
	
	@RequestMapping(value = "/loginPage")
	public ModelAndView loginPage() {
		
		System.out.println("로그인 페이지 이동 요청");
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("member/LoginPage");
		
		return mav;
	}
	
	@RequestMapping(value = "/loginNaver_auth")
	public String loginNaver_auth() throws IOException {
		String url = "https://nid.naver.com/oauth2.0/authorize";
		String response_type = "code";
		String client_id = "HOSEx7JAz351LtOltNxH";
		String redirect_uri = URLEncoder.encode("http://localhost:8080/loginNaver", "utf-8");
		String state = URLEncoder.encode("LEECHANYOUNG", "utf-8");
		url += "?response_type="+response_type+"&client_id="
		       +client_id+"&redirect_uri="+redirect_uri+"&state="+state;
		return "redirect:"+url;
	}
	
	@RequestMapping(value = "/loginNaver")
	public ModelAndView joinNaver(String code, String state, String error, String error_description, HttpSession session, RedirectAttributes ra) throws IOException {
		
		System.out.println("네이버 로그인");
		System.out.println("code : " + code);
		System.out.println("state : " + state);
		
		ModelAndView mav = new ModelAndView();
		
		if(code != null && state != null) {
			
			String reProfile =  msvc.getMemProfile_Naver(code, state);
			
			if(reProfile == null) {
				ra.addFlashAttribute("msg", "로그인 시도 중 오류가 발생했습니다.");
				mav.setViewName("redirect:/loginPage");
				return mav;
			}
			
			JsonObject memProfile = JsonParser.parseString(reProfile.toString()).getAsJsonObject().get("response").getAsJsonObject();
			
			String mid = memProfile.get("id").getAsString();
			String mnickname = memProfile.get("nickname").getAsString();
			String mprofile_image = memProfile.get("profile_image").getAsString();
			String mname = memProfile.get("name").getAsString();
			
			// 이미 가입된 아이디인지
			Member mem = msvc.getMemInfo(mid);
			
			// 회원가입
			if(mem == null) {
				Member member = new Member();
				member.setMid(mid);
				member.setMnickname(mnickname);
				member.setMprofile(mprofile_image);
				member.setMname(mname);
				
				int result = msvc.getMemberJoin_Naver_Result(member);
				if(result != 0) {
					ra.addFlashAttribute("msg", "로그인에 성공했습니다.");
					session.setAttribute("memberLoginId", mid);
					mav.setViewName("redirect:/");
					return mav;
				}
				else {
					ra.addFlashAttribute("msg", "로그인 시도 중 오류가 발생했습니다.");
					mav.setViewName("redirect:/loginPage");
					return mav;
				}
			}
			else {
				ra.addFlashAttribute("msg", "로그인에 성공했습니다.");
				session.setAttribute("memberLoginId", mid);
				mav.setViewName("redirect:/");
				return mav;
			}
			
		}
		else {
			ra.addFlashAttribute("msg", "로그인 시도 중 오류가 발생했습니다.<br>에러코드 : " + error + "<br>에러 메시지 : " + error_description);
			mav.setViewName("redirect:/loginPage");
			return mav;
		}
		
	}
	
}
