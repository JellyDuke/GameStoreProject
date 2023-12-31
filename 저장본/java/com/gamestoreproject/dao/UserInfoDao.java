package com.gamestoreproject.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Answer;
import com.gamestoreproject.dto.Inquire;
import com.gamestoreproject.dto.Member;

public interface UserInfoDao {
	//문의 코드 생성
	String selectMaxIcode();
	
	//문의 답변 코드 생성
	String selectMaxAcode();
	
	//문의 인서트
	int insertInquiry(@Param("in")Inquire in);
	
	//문의 내역 조회
	ArrayList<Inquire> selectInquireList(String mid);

	//프로필 변경
	int updateFile(@Param("mem")Member mem);

	//문의 글 조회
	Inquire selectInquiry(String icode);

	//문의 답변 저장
	int insertAnswer(@Param("aw")Answer aw);

	//문의 답변 조회
	ArrayList<Answer> selectAnswerList(String icode);
	
	//문의 날짜 조회
	String selectAdate(String icode);
	
	//문의 내역 업데이트
	int updateInqueres(@Param("iredate")String adate, @Param("irecomment")String acomment, @Param("icode")String icode);

	//리뷰 리스트 가져오기
	ArrayList<HashMap<String, String>> selectReviewList(@Param("mid")String mid);


}
