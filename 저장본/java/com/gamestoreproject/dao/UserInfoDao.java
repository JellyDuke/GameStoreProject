package com.gamestoreproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Inquire;

public interface UserInfoDao {
	//코드 생성
	String selectMaxIcode();
	
	//문의 인서트
	int insertInquiry(@Param("in")Inquire in);
	
	//문의 내역 조회
	ArrayList<Inquire> selectInquireList();

}
