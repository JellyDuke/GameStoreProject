package com.gamestoreproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameController {
	
	@RequestMapping(value = "/gameList")
	public ModelAndView gameList() {
		
		System.out.println("게임 목록 페이지 이동 요청");
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("game/GameList");
		
		return mav;
		
	}
	
	@RequestMapping(value = "/gameDetail")
	public ModelAndView gameDetail() {
		
		System.out.println("게임 상세 페이지 이동 요청");
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("game/GameDetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/basket")
	public ModelAndView basket() {
		
		System.out.println("장바구니 페이지 이동 요청");
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("payment/BasketPage");
		
		return mav;
	}

}
