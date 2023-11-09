package com.gamestoreproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.MemberDao;

@Service
public class UserInfoService {
	
	@Autowired
	MemberDao mdao;

	public int getBasketCount(String memId) {

		System.out.println("SERVICE - getBasketCount() 호출");
		
		int result = 0;
		try {
			result = mdao.selectBasketCount(memId);
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}

}
