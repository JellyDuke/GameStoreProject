package com.gamestoreproject.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gamestoreproject.dao.MemberDao;
import com.gamestoreproject.dto.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memdao;
	
	public String midCheck(String inputId) {
		System.out.println("SERVICE - midCheck() 호출");
		System.out.println("아이디 : " + inputId);

		// SELECT * FROM MEMBERS WHERE MID = #{아이디}

		Member member = memdao.selectMemberInfo(inputId);

		System.out.println(member);

		String result = "N";

		if (member == null) {
			result = "Y";
		}

		return result;
	}

	public int memJoin(Member mem, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("MemberService - memJoin() 호출");

		System.out.println(mem);

		int result = 0;

		try {
			result = memdao.joinInsertInfo(mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
