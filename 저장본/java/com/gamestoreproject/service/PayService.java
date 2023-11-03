package com.gamestoreproject.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.OrderDao;
import com.gamestoreproject.dto.Order;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
@Service
public class PayService {
	@Autowired
	OrderDao odao;
	public String kakaoPay_ready(Order od, HttpSession session) throws IOException {
		System.out.println("service kakaoPay_ready");
		String requestUrl = "https://kapi.kakao.com/v1/payment/ready";
		/*
		partner_order_id	가맹점 주문번호, 최대 100자	"RE00000"
		partner_user_id		가맹점 회원 id, 최대 100자	"TESTID"
		item_name			상품명, 최대 100자	"영화제목"
		quantity			상품 수량	1
		total_amount		상품 총액	12000	
		tax_free_amount		상품 비과세 금액	0  
		approval_url		결제 성공 시 redirect url, 최대 255자	"http://localhost:8081/controller/kakaoPay_approval"	
		cancel_url			결제 취소 시 redirect url, 최대 255자	"http://localhost:8081/controller/kakaoPay_cancel"	
		fail_url			결제 실패 시 redirect url, 최대 255자	"http://localhost:8081/controller/kakaoPay_fail"  	  
		 */
		HashMap<String,String> requestParams = new HashMap<String, String>();
		//requestParams.put("partner_order_id", reInfo.getRecode());
		requestParams.put("partner_order_id", "RE00000");
		//requestParams.put("partner_user_id", (String)session.getAttribute("loginId"));
		requestParams.put("partner_user_id", "TESTID");
		requestParams.put("item_name", "Point Charge");
		requestParams.put("quantity", "1");
		requestParams.put("total_amount", od.getOprice());
		requestParams.put("tax_free_amount", "0");
		requestParams.put("approval_url", "http://localhost:8080/kakaoPay_approval");
		requestParams.put("cancel_url", "http://localhost:8080/kakaoPay_cancel");
		requestParams.put("fail_url", "http://localhost:8080/kakaoPay_fail");
		String result = null;
		String response = kakaoResponse_json(requestUrl, requestParams);
		JsonObject re = (JsonObject)JsonParser.parseString(response);
		String tid = re.get("tid").getAsString();
		String nextUrl = re.get("next_redirect_pc_url").getAsString();
		System.out.println("tid : "+tid);
		session.setAttribute("tid", tid);
		System.out.println("nextUrl : "+nextUrl);
		result = nextUrl;
		return result;
	}

	private String kakaoResponse_json(String requestUrl, HashMap<String, String> requestParams) throws IOException {
		System.out.println("service kakaoResponse_json");
		StringBuilder urlBuilder = new StringBuilder(requestUrl); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=TC0ONETIME"); 
        for(String key : requestParams.keySet()) {	
        	urlBuilder.append("&" + URLEncoder.encode(key,"UTF-8") + "=" + URLEncoder.encode(requestParams.get(key), "UTF-8")); /*페이지번호*/
        }    
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "KakaoAK d6c48efebdf45ed34237be35196c98fc");
        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        System.out.println("Response code: " + conn.getResponseCode());
        if(conn.getResponseCode() != 200) {
        	return null;
        }
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
		
		
		return sb.toString();
	}

	public String kakaoPay_approval(String tid, String pg_token) {
		System.out.println("service kakaoPay_approval");
		String requestUrl = "https://kapi.kakao.com/v1/payment/approve";
		HashMap<String,String> requestParams = new HashMap<String, String>();
		requestParams.put("tid", tid);
		requestParams.put("partner_order_id", "RE00000");
		requestParams.put("partner_user_id", "TESTID");
		requestParams.put("pg_token", pg_token);
		String result = null;
		try {
			String response = kakaoResponse_json(requestUrl,requestParams);
			result = response;
			// 결제 상세 정보 X, 성공 유무만 확인
		} catch (IOException e) {			
			e.printStackTrace();
		}
		return result;
	}

	public String registOrderInfo(Order od) {
		// 1. 예매코드 생성 ( RE00001 )
				String maxocode = odao.getMaxocode(); 
				//System.out.println(maxocode);
				String ocode = genCode(maxocode);
				od.setOcode(ocode);
				if(od.getOccode() == null) {
					od.setOccode("C000001");					
				}
				System.out.println(od);
				// 2. DAO - INSERT 
				int insertResult = 0;
				try {
					insertResult = odao.insertOrder(od);			
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				if(insertResult > 0) {
					return ocode;		
				} else {
					return null;
				}
	}
	private String genCode(String currentCode) {
		// System.out.println("genCode() 호출 : "+currentCode);
		// currentCode = MV00000 :: 앞2자리 영문, 뒤 5자리 숫자
		String strCode = currentCode.substring(0, 2);
		int numCode = Integer.parseInt(currentCode.substring(2));
		String newCode = strCode + String.format("%05d", numCode + 1);
		return newCode;
	}

	public int delete(String ocode) {
		return odao.deleteOrder(ocode);
	}
	
	public int inputCharge(String loginId, String point) {
		System.out.println("포인트 충전중?");
		return odao.updatePoint(loginId,point);
	}

	public int minusPoint(String point, String loginId) {
		return odao.deletePoint(loginId, point);
	}
}