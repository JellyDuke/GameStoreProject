package com.gamestoreproject.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

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
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class MemberController {
	@Autowired
	private MemberService msvc;
	
	@RequestMapping(value = "/loginpage", method = RequestMethod.GET)
	public ModelAndView loginpage(){
		System.out.println("MEMBER CONTROLLER - 로그인 페이지");
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/loginPage");
		return mav;
	}
	
	@RequestMapping(value = "/joinpage", method = RequestMethod.GET)
	public ModelAndView joinpage(){
		System.out.println("MEMBER CONTROLLER - 회원가입 페이지");
			
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/joinpage");
		return mav;
	}
	@RequestMapping(value="/memberIdCheck")
	public @ResponseBody String memIdCheck(String inputId) {
		System.out.println("MEMBER CONTROLLER - memberIdCheck");
		
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
		System.out.println("MEMBER CONTROLLER - 로그인 처리 요청 - /memberLogin");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("mid : " + userId);
		System.out.println("mpw : " + userPw);
		
		//login 로그인 등록 확인
		Member loginMember = msvc.getLoginMemberInfo(userId, userPw);
		
		if(loginMember == null) {
			System.out.println("로그인 실패");
			ra.addFlashAttribute("msg","아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.setViewName("redirect:/loginpage");
		}else {
			
			System.out.println("로그인 성공");
			session.setAttribute("loginId", loginMember.getMid());
			session.setAttribute("loginMpw", loginMember.getMpw());
			session.setAttribute("loginMname", loginMember.getMname());
			session.setAttribute("loginMnickname", loginMember.getMnickname());
			session.setAttribute("loginProfile", loginMember.getMprofile());
			session.setAttribute("loginState", loginMember.getMstate());
			session.setAttribute("loginMdate", loginMember.getMdate());
			session.setAttribute("loginPoint", loginMember.getMpoint());
			
			ra.addFlashAttribute("msg","로그인 성공");
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	@RequestMapping(value="/logout")
	public String memberLogout(RedirectAttributes ra, HttpSession session) {
		System.out.println("MEMBER CONTROLLER - 로그아웃 요청");
		session.invalidate();
		ra.addFlashAttribute("msg","로그아웃 되었습니다.");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/findAccount", method = RequestMethod.GET)
	public ModelAndView findAccount(){
		System.out.println("MEMBER CONTROLLER - 계정 찾기");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("serviceCenter/findAccount");
		return mav;
	}
	
	@RequestMapping(value = "/secession", method = RequestMethod.GET)
	public ModelAndView removeMember(HttpSession session, ModelAndView mv,RedirectAttributes ra) {
		System.out.println("MEMBER CONTROLLER - 회원탈퇴 요청");
		Member member = new Member();
		member.setMid((String)session.getAttribute("loginId"));
		String memberId = member.getMid();
		
		if(memberId == null) {
			ra.addFlashAttribute("msg","로그인 이후 이용 가능합니다.");
			mv.setViewName("redirect:/loginpage");
			return mv;
		}else {
			try {
				int result = msvc.removeMember(memberId,session);
				if (result > 0) {
					mv.setViewName("redirect:/logout");
				}
			} catch (Exception e) {
				e.printStackTrace();
				ra.addFlashAttribute("msg","로그아웃 되었습니다.");
				mv.setViewName("home");
			}
		}
		
		return mv;
	}
	
	@RequestMapping(value="/rePassword")
	public ModelAndView rePassword() {
		ModelAndView mav = new ModelAndView();
		System.out.println("MEMBER CONTROLLER - 비밀번호 변경 페이지");
		mav.setViewName("userInfo/rePassword");
		return mav;
	}
	
	@RequestMapping(value = "/changePw", method = RequestMethod.POST)
	public String chageMpw(String currentPw, String newPw, String newPwConfirm,HttpSession session, RedirectAttributes ra ) {
		System.out.println("MEMBER CONTROLLER - 비밀번호 변경 요청");
		String mid = (String) session.getAttribute("loginId");
		
		int findAccount = msvc.findAccount(mid, currentPw);
		System.out.println(findAccount);
		System.out.println(newPw + mid);
		if(findAccount == 0) {
			ra.addFlashAttribute("msg","올바른 비밀번호를 입력하세요.");
			return "redirect:/rePassword";
		}else {
			ra.addFlashAttribute("msg","비밀번호 변경이 되었습니다.");
			int result = msvc.changePw(newPw,mid);
			return "redirect:/logout";
		}
		
	}
	
	@RequestMapping(value = "/memberLogin_kakao")
	public @ResponseBody String memberLogin_kakao(String id, HttpSession session, String profile) {
		System.out.println("MEMBER CONTROLLER - 카카오 로그인 요청");
		System.out.println("카카오 id : " + id);

		Member loginMember = msvc.getLoginMemberInfo_kakao(id);

		if (loginMember == null) {
			System.out.println("카카오 계정 정보 없음");
			
			return "N";
			
		} else {
			
			System.out.println("카카오 계정 정보 있음");
			System.out.println("로그인 처리");
			
			session.setAttribute("loginId", loginMember.getMid());
			session.setAttribute("loginMpw", loginMember.getMpw());
			session.setAttribute("loginMname", loginMember.getMname());
			session.setAttribute("loginMnickname", loginMember.getMnickname());
			session.setAttribute("loginProfile", loginMember.getMprofile());
			session.setAttribute("loginState", loginMember.getMstate());
			session.setAttribute("loginMdate", loginMember.getMdate());
			session.setAttribute("loginPoint", loginMember.getMpoint());
			return "Y";
		}
	}
	@RequestMapping(value = "/memberJoin_kakao")
	public @ResponseBody String memberJoin_kakao(Member member){
		System.out.println("MEMBER CONTROLLER - 카카오 계정 - 회원가입요청 - /memberJoin_kakao");
		System.out.println(member);
		int result = msvc.registMember_kakao(member);
		
		return result+"";
	}
	@RequestMapping(value = "/memberFindMpw", method = RequestMethod.POST)
	public String memberFindMpw(String userId,RedirectAttributes ra) throws Exception{
		System.out.println("MEMBER CONTROLLER - 계정 비밀번호 찾기");
		
		if(msvc.memberFindMpwCheck(userId)==0) {
			System.out.println("memberPWCheck");
			ra.addFlashAttribute("msg","아이디와 이메일를 확인해주세요");
			
			return "redirect:/findAccount";
		}else {
			msvc.memberFindMpw(userId);
			ra.addFlashAttribute("msg","임시번호가 발급 되었습니다.");

			return"redirect:/loginpage";
		}
	}
	@RequestMapping(value = "/loginNaver_auth")
	public String loginNaver_auth() throws IOException {
		System.out.println("MEMBER CONTROLLER - 동의 페이지 요청");
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
		
		System.out.println("MEMBER CONTROLLER - 네이버 로그인");
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
					System.out.println(member.getMpw()+member.getMdate());
					ra.addFlashAttribute("msg", "로그인에 성공했습니다.");
					session.setAttribute("loginId", member.getMid());
					session.setAttribute("loginMpw", member.getMpw());
					session.setAttribute("loginMname", member.getMname());
					session.setAttribute("loginMnickname", member.getMnickname());
					session.setAttribute("loginProfile", member.getMprofile());
					session.setAttribute("loginState", member.getMstate());
					session.setAttribute("loginMdate", member.getMdate());
					session.setAttribute("loginPoint", member.getMpoint());
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
				session.setAttribute("loginId", mem.getMid());
				session.setAttribute("loginMpw", mem.getMpw());
				session.setAttribute("loginMname", mem.getMname());
				session.setAttribute("loginMnickname", mem.getMnickname());
				session.setAttribute("loginProfile", mem.getMprofile());
				session.setAttribute("loginState", mem.getMstate());
				session.setAttribute("loginMdate", mem.getMdate());
				session.setAttribute("loginPoint", mem.getMpoint());
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
