package com.gamestoreproject.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameController {
	@RequestMapping(value = "/gameDetail")
	public ModelAndView gameDetail() {
		System.out.println("게임 디테일 페이지");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("game/gameDetail");
		
		return mav;
	}
}
