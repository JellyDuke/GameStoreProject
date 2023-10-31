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
	
	public String genCode(String maxAcode) {
		System.out.println("genCode() 호출 : " + maxAcode);
		
		String strCode = maxAcode.substring(0, 2);
		int numCode = Integer.parseInt(maxAcode.substring(2)); 

		String newCode = strCode + String.format("%05d", numCode + 1);
		
		return newCode;
	}
	
}
