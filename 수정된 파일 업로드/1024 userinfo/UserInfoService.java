package com.gamestoreproject.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.GamesDao;
import com.gamestoreproject.dto.Coupon;
@Service
public class UserInfoService {
	@Autowired
	private GamesDao gdao;
	private int authNumber;
	public ArrayList<String> getTypeList(String text) {
		ArrayList<String> typelist = new ArrayList<String>();
		ArrayList<String> typeList = new ArrayList<String>();			
			typelist = gdao.getTyp(text);	
			for(String types : typelist) { 
					typeList.add(types);
			}								
		return typeList;
	}
	public ArrayList<String> getTagList() {
		ArrayList<String> taglist = new ArrayList<String>();
		ArrayList<String> tagList = new ArrayList<String>();
		taglist = gdao.gettag();
		for(String tags : taglist) {
			String[] ty = tags.split(",\s");
			for(String t : ty) {				
				tagList.add(t);
			}
		}
		HashSet<String> hs = new HashSet<String>(tagList); 
		System.out.println(hs);
		tagList.clear();
		tagList.addAll(hs);
		return tagList;
	}
	public void randomNumber() {
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("임시번호 : " + checkNum);
		authNumber = checkNum;
	}
	public int makecoupon(Coupon coupon) {
		int checknum = 1;
		while(checknum!=0) {
			coupon.setCcode(getcnumber(coupon));
			String cnumber = coupon.getCnumber();
			checknum = gdao.codeCheck(cnumber);
		}
		String code = gdao.getcode();
		coupon.setCcode(genCode(code));
		System.out.println(coupon);
		int insertResult = gdao.makecoupon(coupon);
		return insertResult;
	}
	public String getcnumber(Coupon coupon) {
		randomNumber();
		coupon.setCnumber(Integer.toString(authNumber));
		randomNumber();
		coupon.setCnumber(coupon.getCnumber()+Integer.toString(authNumber));
		return coupon.getCnumber();
	}
	public int registCoupon(String code, String cowner) {
		Coupon coupon = new Coupon();
		//System.out.println(code);
		int checknum = gdao.codecheck(code);
		int insertResult = 0;
		if(checknum == 1) {
			System.out.println("등록가능");
			coupon.setCnumber(code);
			String ccode = gdao.getcode();
			coupon.setCcode(genCode(ccode));
			coupon.setCowner(cowner);
			coupon.setCtype(gdao.gettype(code));
			coupon.setCpercent(gdao.getpercent(code));
			coupon.setCnumber(code);
			insertResult = gdao.registcoupon(coupon);
			int stackChange = gdao.stackCh(code);
			if(stackChange > 1) {
				System.out.println("변경 완료");
			}
			System.out.println(coupon);
		} 
		return insertResult;
	}
	private String genCode(String currentCode) {
		// System.out.println("genCode() 호출 : "+currentCode);
		// currentCode = MV00000 :: 앞2자리 영문, 뒤 5자리 숫자
		String strCode = currentCode.substring(0, 2);
		int numCode = Integer.parseInt(currentCode.substring(2));
		String newCode = strCode + String.format("%05d", numCode + 1);
		return newCode;
	}
	public ArrayList<Coupon> getcouponList(String uid) {
		return gdao.getcouponList(uid);
	}
	public int checkcode(String code, String cowner) {
		return gdao.checkcode(code, cowner);
	}
}
