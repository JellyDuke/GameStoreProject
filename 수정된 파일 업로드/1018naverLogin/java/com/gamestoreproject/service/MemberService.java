package com.gamestoreproject.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.MemberDao;
import com.gamestoreproject.dto.Member;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class MemberService {
	
	@Autowired
	MemberDao mdao;

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
			mem = mdao.getMemInfo(id);
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
			result = mdao.memberJoin_Naver(mem);
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}

}
