package com.gamestoreproject.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gamestoreproject.dto.Game;
import com.gamestoreproject.service.GameService;

@Controller
public class GameController {
	@Autowired
	GameService gsvc;
	
	@RequestMapping(value = "/gameList")
	public ModelAndView gameList(int gameCount) {
		
		System.out.println("게임 목록 페이지 이동 요청");
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Game> beforeGameList = gsvc.getgameList(gameCount-20);
		ArrayList<Game> gameList = gsvc.getgameList(gameCount);
		if(beforeGameList.size() == gameList.size()) {
			gameCount = -1;
		}
		
		ArrayList<String> ganreList = new ArrayList<String>();
		ganreList.add(gameList.get(0).getGtag().split(", ")[0]);
		for(Game gm : gameList) {
			for(int i=0;i<gm.getGtag().split(", ").length;i++) {
				if(!ganreList.contains(gm.getGtag().split(", ")[i])) {
					ganreList.add(gm.getGtag().split(", ")[i]);
				}
			}
		}
		ganreList.remove("앞서 해보기");
		
		mav.addObject("gameList", gameList);
		mav.addObject("ganreList", ganreList);
		mav.addObject("gameCount", gameCount);
		mav.setViewName("game/gameList");
		
		
		return mav;
	}
	
	@RequestMapping(value = "/gameDetail")
	public ModelAndView gameDetail(String gcode) {
		
		System.out.println("게임 상세 페이지 이동 요청");
		System.out.println("게임코드 : " + gcode);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("game/gameDetail");
		
		return mav;
	}
	
}
