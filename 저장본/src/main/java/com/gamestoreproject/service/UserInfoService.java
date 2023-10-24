package com.gamestoreproject.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.UserInfoDao;
import com.gamestoreproject.dto.Inquire;

@Service
public class UserInfoService {
	@Autowired
	private UserInfoDao id;
	
	public ArrayList<Inquire> inquireList() {
		System.out.println("UserInfoService - inquireList");
		return id.selectInquireList();
	}

}
