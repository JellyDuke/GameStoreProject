package com.gamestoreproject.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gamestoreproject.dto.Game;
import com.gamestoreproject.dto.Review;
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
		mav.setViewName("game/GameList");
		
		return mav;
	}
	
	@RequestMapping(value = "/gameDetail")
	public ModelAndView gameDetail(String gcode, HttpSession session) {
		
		System.out.println("게임 상세 페이지 이동 요청");
		System.out.println("게임코드 : " + gcode);
		
		ModelAndView mav = new ModelAndView();
		
		Game game = gsvc.getGameDetail(gcode);
		ArrayList<String> gameImgs = new ArrayList<String>();
		for(int i=0;i<game.getGimg().split(" ").length;i++) {
			gameImgs.add(i, game.getGimg().split(" ")[i]);
		}
		
		String system = game.getGsystem();
		
		String minSystem = null;
		if(system.indexOf("최소: ") == -1 || system.indexOf("권장") == -1) {
			minSystem = system;
		}
		else {
			minSystem = system.substring(system.indexOf("최소: "), system.indexOf("권장")).trim();
		}
		
		ArrayList<String> minSystem_Array = new ArrayList<String>();
		for(int i=0;i<minSystem.split(":").length;i++) {
			minSystem_Array.add(minSystem.split(":")[i].trim());
		}
		
		ArrayList<String> minFinalSystem = new ArrayList<String>();
		
		for(int i=0;i<minSystem_Array.size();i++) {
			
			if(i == 0) {
				if(!minSystem_Array.get(i+1).equals("운영체제")) {
					minFinalSystem.add(minSystem_Array.get(i+1).split("운영체제")[0].trim());
				}
				else {
					minFinalSystem.add(minSystem_Array.get(i+1) + " : " + minSystem_Array.get(i+2).split(minSystem_Array.get(i+2).split(" ")[minSystem_Array.get(i+2).split(" ").length -1])[i].trim());					
				}
				continue;
			}
			
			if(i == minSystem_Array.size() - 2) {
				if(minSystem_Array.get(i).split(" ")[minSystem_Array.get(i).split(" ").length - 1].equals("사항")) {
					minFinalSystem.add("추가 " + minSystem_Array.get(i).split(" ")[minSystem_Array.get(i).split(" ").length - 1] + " : " + minSystem_Array.get(i+1).trim());
				}
				else {
					minFinalSystem.add(minSystem_Array.get(i).split(" ")[minSystem_Array.get(i).split(" ").length - 1] + " : " + minSystem_Array.get(i+1).trim());					
				}
				break;
			}
			
			if(minSystem_Array.get(i+1).split(minSystem_Array.get(i+1).split(" ")[minSystem_Array.get(i+1).split(" ").length - 1])[0].trim().split(" ")[minSystem_Array.get(i+1).split(minSystem_Array.get(i+1).split(" ")[minSystem_Array.get(i+1).split(" ").length - 1])[0].trim().split(" ").length - 1].equals("추가")) {
				minFinalSystem.add(minSystem_Array.get(i).split(" ")[minSystem_Array.get(i).split(" ").length - 1] + " : " + minSystem_Array.get(i+1).split(minSystem_Array.get(i+1).split(" ")[minSystem_Array.get(i+1).split(" ").length - 1])[0].trim().replace(" 추가", ""));
			}
			else {
				minFinalSystem.add(minSystem_Array.get(i).split(" ")[minSystem_Array.get(i).split(" ").length - 1] + " : " + minSystem_Array.get(i+1).split(minSystem_Array.get(i+1).split(" ")[minSystem_Array.get(i+1).split(" ").length - 1])[0].trim());				
			}
			
		}
		
		if(minFinalSystem.get(0).equals(minFinalSystem.get(1))) {
			minFinalSystem.remove(0);
		}
		
		String maxSystem = null;
		if(system.indexOf("권장: ") != -1) {
			
			maxSystem = system.substring(system.indexOf("권장: "), system.length());
			
			ArrayList<String> maxSystem_Array = new ArrayList<String>();
			for(int i=0;i<maxSystem.split(":").length;i++) {
				maxSystem_Array.add(maxSystem.split(":")[i].trim());
			}
			
			ArrayList<String> maxFinalSystem = new ArrayList<String>();
			for(int i=0;i<maxSystem_Array.size();i++) {
				
				if(i == 0) {
					
					if(!maxSystem_Array.get(i+1).equals("운영체제")) {
						maxFinalSystem.add(maxSystem_Array.get(i+1).split("운영체제")[0].trim());
					}
					else {
						maxFinalSystem.add(maxSystem_Array.get(i+1) + " : " + maxSystem_Array.get(i+2).split(maxSystem_Array.get(i+2).split(" ")[maxSystem_Array.get(i+2).split(" ").length -1])[i].trim());					
					}
					continue;
				}
				
				if(i == maxSystem_Array.size() - 2) {
					if(maxSystem_Array.get(i).split(" ")[maxSystem_Array.get(i).split(" ").length - 1].equals("사항")) {
						maxFinalSystem.add("추가 " + maxSystem_Array.get(i).split(" ")[maxSystem_Array.get(i).split(" ").length - 1] + " : " + maxSystem_Array.get(i+1).trim());
					}
					else {
						maxFinalSystem.add(maxSystem_Array.get(i).split(" ")[maxSystem_Array.get(i).split(" ").length - 1] + " : " + maxSystem_Array.get(i+1).trim());					
					}
					break;
				}
				if(maxSystem_Array.get(i+1).split(maxSystem_Array.get(i+1).split(" ")[maxSystem_Array.get(i+1).split(" ").length - 1])[0].trim().split(" ")[maxSystem_Array.get(i+1).split(maxSystem_Array.get(i+1).split(" ")[maxSystem_Array.get(i+1).split(" ").length - 1])[0].trim().split(" ").length - 1].equals("추가")) {
					maxFinalSystem.add(maxSystem_Array.get(i).split(" ")[maxSystem_Array.get(i).split(" ").length - 1] + " : " + maxSystem_Array.get(i+1).split(maxSystem_Array.get(i+1).split(" ")[maxSystem_Array.get(i+1).split(" ").length - 1])[0].trim().replace(" 추가", ""));
				}
				else {
					maxFinalSystem.add(maxSystem_Array.get(i).split(" ")[maxSystem_Array.get(i).split(" ").length - 1] + " : " + maxSystem_Array.get(i+1).split(maxSystem_Array.get(i+1).split(" ")[maxSystem_Array.get(i+1).split(" ").length - 1])[0].trim());				
				}
			}
			
			if(maxFinalSystem.get(0).equals(maxFinalSystem.get(1))) {
				maxFinalSystem.remove(0);
			}
			
			mav.addObject("maxFinalSystem", maxFinalSystem);
		}
		mav.addObject("minFinalSystem", minFinalSystem);
		
		ArrayList<HashMap<String, String>> reviewList = gsvc.getReviewList(gcode);
		if(reviewList != null && reviewList.size() > 0) {
			mav.addObject("reviewList", reviewList);
			for(HashMap<String, String> review : reviewList) {
				if(review.get("MID").equals(session.getAttribute("loginId"))) {
					mav.addObject("myReview", review);
				}
			}
		}
		
		String ocode = gsvc.getOcode(gcode, game.getGname());
		mav.addObject("ocode", ocode);
		
		mav.addObject("game", game);
		mav.addObject("gameImgs", gameImgs);
		mav.setViewName("game/GameDetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/review_regist")
	public ModelAndView review_regist(String gameCode, String rate, String re_content, HttpSession session, RedirectAttributes ra) {
		
		System.out.println("리뷰 등록 요청");
		
		ModelAndView mav = new ModelAndView();
		
		// 리뷰 코드 생성
		String rcode = gsvc.getRcode();
		System.out.println("리뷰 코드 : " + rcode);
		
		String loginId = (String)session.getAttribute("loginId");
		if(loginId == null || loginId.length() == 0) {
			ra.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
			mav.addObject("gcode", gameCode);
			mav.setViewName("redirect:/gameDetail");
			return mav;
		}
		int reRate = Integer.parseInt(rate);
		
		// 리뷰 등록 요청
		Review review = new Review();
		review.setRcode(rcode);
		review.setRgcode(gameCode);
		review.setRmcode(loginId);
		review.setRscore(reRate);
		review.setRcontent(re_content);
		
		int result = gsvc.getReviewRegist_Result(review);
		if(result > 0) {
			ra.addFlashAttribute("msg", "리뷰를 작성했습니다.");
		}
		else {
			ra.addFlashAttribute("msg", "오류가 발생했습니다.");
		}
	
		mav.addObject("gcode", gameCode);
		mav.setViewName("redirect:/gameDetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/deleteReview")
	public ModelAndView deleteReview(String rcode, String gcode, RedirectAttributes ra) {
		System.out.println("리뷰 삭제 요청");
		
		ModelAndView mav = new ModelAndView();
		int result = gsvc.getDeleteReview_result(rcode);
		if(result > 0) {
			mav.addObject("gcode", gcode);
			ra.addFlashAttribute("msg", "리뷰를 삭제하였습니다.");
			mav.setViewName("redirect:/gameDetail");
		}
		else {
			mav.addObject("gcode", gcode);
			ra.addFlashAttribute("msg", "리뷰를 삭제하던 중 오류가 발생하였습니다.");
			mav.setViewName("redirect:/gameDetail");
		}
		return mav;
	}
	
	@RequestMapping(value = "/review_modify")
	public ModelAndView review_modify(String gameCode, int rate, String re_content, String rcode, HttpSession session, RedirectAttributes ra) {
		
		System.out.println("리뷰 수정 요청");
		
		ModelAndView mav = new ModelAndView();
		
		Review review = new Review();
		review.setRcode(rcode);
		review.setRscore(rate);
		review.setRcontent(re_content);
		
		int result = gsvc.getModifyReview_Result(review);
		if(result > 0) {
			ra.addFlashAttribute("msg", "리뷰를 수정하였습니다.");
		}
		else {
			ra.addFlashAttribute("msg", "리뷰 수정 중 오류가 발생하였습니다.");
		}
		
		mav.addObject("gcode", gameCode);
		mav.setViewName("redirect:/gameDetail");
		
		return mav;
	}
	
	@RequestMapping(value = "/modifyReviewLikes")
	public @ResponseBody String modifyReviewLikes(String memId, String rcode, String selected) {
		System.out.println("리뷰 좋아요 or 싫어요 버튼 클릭");
		
		String likeId = gsvc.getLikeIdResult(memId, rcode);
		if(likeId != null && likeId.length() > 0) {
			// 이미 평가했음
			return "3";
		}
		
		int resultLikes = gsvc.getLikeReviewResult(memId, rcode, selected);
		
		return resultLikes+"";
	}
	
	@RequestMapping(value = "/addGameBasket")
	public @ResponseBody String addGameBasket(String gcode, String memId) {
		
		System.out.println("장바구니에 게임 추가");
		
		String sgcode = gsvc.getSgcode(memId, gcode);
		
		if(sgcode == null) {
			String scode = gsvc.getScode();
			String result = gsvc.getAddGameResult(scode, memId, gcode);			
			return result;
		}
		
		if(sgcode.equals(gcode)) {
			return "3";
		}
		
		else {
			return 0 + "";
		}
		
	}
	
	@RequestMapping(value = "/basketpage")
	public ModelAndView basketPage(String memId, RedirectAttributes ra) {
		
		System.out.println("장바구니 페이지 이동 요청");
		
		ModelAndView mav = new ModelAndView();
		
		if(memId == null || memId.length() <= 0) {
			ra.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
			mav.setViewName("redirect:/loginpage");
			return mav;
		}
		
		ArrayList<Game> basketList = gsvc.getbasketList(memId);
		mav.addObject("basketList", basketList);
		
		int gameListSize = 0;
		for(Game game : basketList) {
			if(game.getGstate().equals("1")) {
				gameListSize+=1;
			}
		}
		
		ArrayList<HashMap<String, String>> couponList = gsvc.getCouponList(memId);
		mav.addObject("couponList", couponList);
		
		int mpoint = gsvc.getMpoint(memId);
		mav.addObject("mpoint", mpoint);
		
		mav.addObject("gameListSize", gameListSize);
		mav.setViewName("payment/basketpage");
		
		return mav;
	}
	
	@RequestMapping(value = "/deleteBasket")
	public ModelAndView deleteBasket(String[] gcodeArray, HttpSession session, RedirectAttributes ra) {
		
		System.out.println("장바구니 선택 상품 제거 요청");
		
		ModelAndView mav = new ModelAndView();
		
		String memId = (String)session.getAttribute("loginId");
		if(memId == null || memId.length() <= 0) {
			ra.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
			mav.setViewName("redirect:/loginpage");
			return mav;
		}
		
		List<String> gcodeList = new ArrayList<String>();
		for(int i=0;i<gcodeArray.length;i++) {
			gcodeList.add(gcodeArray[i]);
		}
		
		int result = gsvc.getSelDeleteBasket_Result(memId, gcodeList);
		System.out.println("result : " + result);
		
		if(result > 0) {
			ra.addFlashAttribute("msg", result + "개의 상품을 장바구니에서 삭제하였습니다.");
			mav.addObject("memId", memId);
			mav.setViewName("redirect:/basketpage");
		}
		else {
			ra.addFlashAttribute("msg", "장바구니에서 게임을 삭제하던 중 오류가 발생했습니다.");
			mav.addObject("memId", memId);
			mav.setViewName("redirect:/basketpage");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/cantByDelete")
	public ModelAndView cantByDelete(HttpSession session, RedirectAttributes ra) {
		
		System.out.println("구매 불가능한 게임 삭제");
		
		ModelAndView mav = new ModelAndView();
		
		String memId = (String)session.getAttribute("loginId");
		
		if(memId == null || memId.length() <= 0) {
			ra.addFlashAttribute("msg", "로그인 후 이용 가능합니다.");
			mav.setViewName("redirect:/loginpage");
			return mav;
		}
		
		int result = gsvc.getDeleteCantBuyGame_Result(memId);
		if(result == 3) {
			ra.addFlashAttribute("msg", "장바구니에서 게임을 삭제하던 중 오류가 발생했습니다.");
			mav.addObject("memId", memId);
		}
		else if(result > 0) {
			ra.addFlashAttribute("msg", "장바구니에서 구매 불가능한 게임을 " + result + "개 삭제했습니다.");
			mav.addObject("memId", memId);
		}
		else {
			ra.addFlashAttribute("msg", "장바구니에 구매 불가능한 게임이 없습니다.");
			mav.addObject("memId", memId);
		}
		
		mav.setViewName("redirect:/basketpage");
		return mav;
	}
	
	@RequestMapping(value = "/basketGameBuy")
	public @ResponseBody String basketGameBuy(HttpSession session, String totalPrice, String couponCode, String[] gcodeArray, String[] gpriceArray){
		
		System.out.println("장바구니 구매 버튼 클릭");
		
		String memId = (String)session.getAttribute("loginId");
		if(memId == null || memId.length() <= 0) {
			return "0";
		}
		
		String result = gsvc.getGameBuyResult(memId, totalPrice, couponCode, gcodeArray, gpriceArray);
		
		return result;
	}
	
}
/* ArrayList<String> genreList = new  ArrayList<String>();
 * 액션, 인디 >> split(", ") >> [0]액션 [1]인디
 * if(genreList.c)
 * genreList.add([0]), genreList.add([1]);
 * 어드벤처, 캐주얼, 인디, 시뮬레이션
 * 액션, 어드벤처, 시뮬레이션, 전략, 앞서 해보기
 * 
 * 
 * 
 * */