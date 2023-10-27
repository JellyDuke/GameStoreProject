package com.gamestoreproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.controller.MainController;
import com.gamestoreproject.dao.UserInfoDao;
import com.gamestoreproject.dto.Answer;
import com.gamestoreproject.dto.Inquire;

@Service
public class ServiceCenterService {
	@Autowired
	private UserInfoDao udao;
	@Autowired
	private MainController mc;
	
	public String genCode(String maxIcode) {
		System.out.println("genCode() 호출 : " + maxIcode);
		
		String strCode = maxIcode.substring(0, 2);
		int numCode = Integer.parseInt(maxIcode.substring(2)); 

		String newCode = strCode + String.format("%05d", numCode + 1);
		
		return newCode;
	}
	
	public int registInquiry(Inquire in) {
		System.out.println("ServiceCenterService - registInquiry");
		mc.registGenCode(in);
		System.out.println(in);
		return udao.insertInquiry(in);
	}

}
