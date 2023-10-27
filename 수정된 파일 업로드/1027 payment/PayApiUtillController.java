package com.gamestoreproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PayApiUtillController {
	@RequestMapping(value="/portoneTestPage")
	public ModelAndView portoneTestPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("payment/portoneTestPage");
		return mav;
	}
}
