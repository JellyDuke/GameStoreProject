package com.gamestoreproject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gamestoreproject.dao.UserInfoDao;
import com.gamestoreproject.dto.Answer;
import com.gamestoreproject.dto.Game;
import com.gamestoreproject.dto.Inquire;
import com.gamestoreproject.service.GameService;
import com.gamestoreproject.service.ServiceCenterService;

@Controller
public class MainController {
	
	@Autowired
	private GameService gsvc;
	@Autowired
	private ServiceCenterService scsvc;
	@Autowired
	private UserInfoDao id;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(){
		System.out.println("MAIN CONTROLLER - 메인페이지 이동");
		ModelAndView mav = new ModelAndView();
		ArrayList<Game> GameList = gsvc.gameList();
		mav.addObject("GameList",GameList);
		mav.setViewName("home");
		return mav;
	}
	@RequestMapping(value = "/companyView", method = RequestMethod.GET)
	public ModelAndView company(){
		System.out.println("MAIN CONTROLLER -  회사 소개 페이지 이동");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("company/companyView");
		return mav;
	}
	@RequestMapping(value = "/basketpage", method = RequestMethod.GET)
	public ModelAndView basketpage(){
		System.out.println("MAIN CONTROLLER - 장바구니 페이지");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("payment/basketpage");
		return mav;
	}
	public String registGenCode(Inquire in) {
		System.out.println("MAIN CONTROLLER - 문의코드 생성 - registGenCode");
		
		//1. 문의 코드 생성('IC00001')
		String maxIcode = id.selectMaxIcode();
		String inCode = scsvc.genCode(maxIcode);
		in.setIcode(inCode);
		
		return null;
	}
	public String registGenCode(Answer aw) {
		System.out.println("MAIN CONTROLLER - 문의답변코드 생성 - registGenCode");
		//1. 문의 답변 코드 생성('AC00001')
		String maxAcode = id.selectMaxAcode();
		String inCode = scsvc.genCode(maxAcode);
		aw.setAcode(inCode);
		
		return null;
	}
}
