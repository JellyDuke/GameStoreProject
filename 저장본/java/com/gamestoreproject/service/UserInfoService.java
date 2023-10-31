package com.gamestoreproject.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gamestoreproject.controller.MainController;
import com.gamestoreproject.dao.GameDao;
import com.gamestoreproject.dao.UserInfoDao;
import com.gamestoreproject.dto.Answer;
import com.gamestoreproject.dto.Coupon;
import com.gamestoreproject.dto.Game;
import com.gamestoreproject.dto.Inquire;
import com.gamestoreproject.dto.Member;

@Service
public class UserInfoService {
	@Autowired
	private UserInfoDao udao;
	@Autowired
	private GameDao gdao;
	private int authNumber;
	@Autowired
	private MainController mc;
	
	
	
	//쿠폰 코드 시작
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
	//쿠폰 코드 끝

	//게임 리스트 검색창 엔진
	public ArrayList<Game> getgameList(String text) {
		ArrayList<Game> gameInfo = gdao.getInfo(text);
		ArrayList<Game> gInfo = new ArrayList<Game>();
		for(Game gm : gameInfo) {			
			System.out.println(gm.getGtag());
			gm.setGsale(100-gm.getGsale()*100);
			gInfo.add(gm);
		}
		//System.out.println(gInfo);
		return gInfo;
	}
	//게임 리스트 끝
	
	
	
	public int updateFile(Member mem, HttpSession session) throws IllegalStateException, IOException {
		MultipartFile bfile = mem.getBfile(); //첨부파일
		String mprofile = ""; //파일명 저장할 변수
		String savePath = session.getServletContext().getRealPath("/resources/memberprofile"); //파일 저장 경로
		if(!bfile.isEmpty()) { //첨부파일 확인
			//첨부파일이 있는 경우
			System.out.println("첨부파일 있음");
			
			//임의코드 + img.jpg
			UUID uuid = UUID.randomUUID();
			String code = uuid.toString();
			System.out.println("코드 확인 code: " + code);
			mprofile = code + "_"+bfile.getOriginalFilename();
			
			//저장 경로 폴더에 첨부파일 저장
			System.out.println("저장경로:" + savePath);
			File newFile = new File(savePath,mprofile);
			bfile.transferTo(newFile);
		}
		System.out.println("파일 이름: " + mprofile);
		mem.setMprofile(mprofile);
		System.out.println(mem); //프로필 확인
		int result = 0;
		return result = udao.updateFile(mem);
	}

	//문의 코드 시작
	public Inquire getInquiryView(String icode) {
		System.out.println("UserInfoService - getInquiryView");
		Inquire inquire = udao.selectInquiry(icode);
		return inquire;
	}

	public ArrayList<Inquire> inquireList(String mid) {
		System.out.println("UserInfoService - inquireList");
		return udao.selectInquireList(mid);
	}
	public int registInquiry(Inquire in) {
		System.out.println("UserInfoService - registInquiry");
		mc.registGenCode(in);
		System.out.println(in);
		return udao.insertInquiry(in);
	}
	public int registAnswer(Answer aw) {
		System.out.println("UserInfoService - registAnswer");
		mc.registIcCode(aw);
		System.out.println(aw);
		return udao.insertAnswer(aw);
	}
	public ArrayList<Answer> getAnswerList(String icode) {
		System.out.println("UserInfoService - getAnswerList");
		return udao.selectAnswerList(icode);
	}
	//문의 코드 끝

}
