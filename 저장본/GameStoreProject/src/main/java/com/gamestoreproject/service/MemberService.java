package com.gamestoreproject.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.MemberDao;
import com.gamestoreproject.dto.Member;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Component
@Service
public class MemberService {
	@Autowired
	private MemberDao memdao;

	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;

	public String midCheck(String inputId) {
		System.out.println("SERVICE - midCheck() 호출");
		System.out.println("아이디 : " + inputId);

		// SELECT * FROM MEMBERS WHERE MID = #{아이디}

		Member member = memdao.selectMemberInfo(inputId);

		System.out.println(member);

		String result = "N";

		if (member == null) {
			result = "Y";
		}

		return result;
	}

	public int memJoin(Member mem, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("MemberService - memJoin() 호출");
		
		System.out.println(mem);

		int result = 0;

		try {
			result = memdao.joinInsertInfo(mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public Member getLoginMemberInfo(String userId, String userPw) {
		System.out.println("SERVICE - getLoginMemberInfo() 호출");
		Member memInfo = memdao.selectMemberLogin(userId, userPw);
		return memInfo;
	}

	public Member getLoginMemberInfo_kakao(String id) {
		System.out.println("SERVICE - getLoginMemberInfo_kakao(String id)");

		return memdao.selectMemberInfo(id);
	}

	public int registMember_kakao(Member member) {
		System.out.println("SERVICE - registMember_kakao(Member member)");

		return memdao.insertMember_kakao(member);
	}

	public int memberFindMpwCheck(String userId) {
		return memdao.memberFindMpwCheck(userId);
	}

	// 난수 생성
	public void randomNumber() {
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("임시번호 : " + checkNum);
		authNumber = checkNum;
	}

	// 이메일 보낼 양식!
	public String memberFindMpw(String email) {
		randomNumber();
		String setFrom = "gamestoreproject@naver.com"; // email-config에 설정한 자신의 이메일 주소를 입력
		String toMail = email;
		String mpw = authNumber + "";
		memdao.memberFindMpw(email, mpw);
		String title = "임시번호 이메일 입니다."; // 이메일 제목
		String content = "홈페이지를 방문해주셔서 감사합니다." + // html 형식으로 작성
				"<br><br>" + "임시 번호는 " + mpw + "입니다." + "<br>" + "해당 임시번호를 바꾸시길 바랍니다.."; // 이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}

	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

public String getMemProfile_Naver(String code, String state) throws IOException {
		
		System.out.println("SERVICE - getMemProfile_Naver 호출");
		
		// 토큰 받아오기
		StringBuilder urlBuilder = new StringBuilder("https://nid.naver.com/oauth2.0/token"); /*URL*/
		urlBuilder.append("?grant_type=" + "authorization_code");
		urlBuilder.append("&client_id=" + "HOSEx7JAz351LtOltNxH");
		urlBuilder.append("&client_secret=" + "ksuuOJhGi0");
		urlBuilder.append("&code=" + code);
		urlBuilder.append("&state=" + URLEncoder.encode(state, "utf-8"));

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "KakaoAK c0b3e8ece651d68fe2b20615d0ef8274");
		conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		System.out.println("Response code: " + conn.getResponseCode());
		
		if(conn.getResponseCode() != 200) {
			return null;
		}
		
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}
		else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		// System.out.println(sb.toString());
		
		JsonObject token = (JsonObject)JsonParser.parseString(sb.toString());
		String access_token = token.get("access_token").getAsString();
		
		// 토큰으로 프로필 받아오기
		String memberProfile = getmemProfile(access_token);

		return memberProfile;
	}

	private String getmemProfile(String access_token) throws IOException {

		System.out.println("SERVICE - getmemProfile() 호출");
		
		StringBuilder urlBuilder = new StringBuilder("https://openapi.naver.com/v1/nid/me"); /*URL*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", " Bearer "+access_token);
		System.out.println("Response code: " + conn.getResponseCode());
		
		if(conn.getResponseCode() != 200) {
			System.out.println("오류");
			return null;
		}
		
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		}
		else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		//System.out.println("프로필");
		//System.out.println(sb.toString());
		
		return sb.toString();
	}

	public Member getMemInfo(String id) {
		
		System.out.println("SERVICE - getMemInfo() 호출");
		
		Member mem = null;
		try {
			mem = memdao.getMemInfo(id);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return mem;
	}
	

	public int getMemberJoin_Naver_Result(Member mem) {

		System.out.println("SERVICE - getMemberJoin_Naver_Result() 호출");
		
		int result = 0;
		try {
			result = memdao.memberJoin_Naver(mem);
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}
}
