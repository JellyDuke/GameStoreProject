package com.gamestoreproject.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.GameDao;
import com.gamestoreproject.dto.Game;
import com.gamestoreproject.dto.Review;

@Service
public class GameService {
	
	@Autowired
	private GameDao gdao;
	
	public ArrayList<Game> gameList() {
		System.out.println("SERVICE - rankGameList()");
		ArrayList<Game> GameList = gdao.selectRankGameList();
		return GameList;
	}
	public ArrayList<Game> getgameList(int gameCount) {
		System.out.println("SERVICE - getgameList()");
		ArrayList<Game> GameList = gdao.selectGameList(gameCount);
		return GameList;
	}
	
	public Game getGameDetail(String gcode) {

		System.out.println("SERVICE - getGameDetail() 호출");
		
		Game game = null;
		try {
			game = gdao.selectGameDetail(gcode);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return game;
	}

	public String getRcode() {

		System.out.println("SERVICE - getRcode() 호출");
		
		String rcode = null;
		try {
			rcode = gdao.selectRcode();
			String rcode_left = rcode.substring(0, 2);
			String rcode_right = rcode.substring(2);
			rcode_right = String.format("%05d", Integer.parseInt(rcode_right + 1 ));
			rcode = rcode_left + rcode_right;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return rcode;
	}

	public int getReviewRegist_Result(Review review) {
		
		System.out.println("SERVICE - getReviewRegist_Result() 호출");
		
		int result = 0;
		try {
			result = gdao.insertReview(review);
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}

	public ArrayList<HashMap<String, String>> getReviewList(String gcode) {
		
		System.out.println("SERVICE - getReview() 호출");
		
		ArrayList<HashMap<String, String>> reviewList = null;
		try {
			reviewList = gdao.selectReviewList(gcode);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return reviewList;
	}

	public int getDeleteReview_result(String rcode) {

		System.out.println("SERVICE - getDeleteReview_result() 호출");
		
		try {
			gdao.deleteReviewLikes(rcode);
			gdao.deleteReview(rcode);
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return 1;
	}

	public int getModifyReview_Result(Review review) {

		System.out.println("SERVICE - getModifyReview_Result() 호출");
		
		int result = 0;
		try {
			result = gdao.modifyReview(review);
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}

	public String getLikeIdResult(String memId, String rcode) {

		System.out.println("SERVICE - getLikeIdResult()");
		
		String likeId = null;
		try {
			likeId = gdao.selectLikeId(memId, rcode);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return likeId;
	}

	public int getLikeReviewResult(String memId, String rcode, String selected) {
		
		System.out.println("SERVICE - getLikeReviewResult() 호출");
		
		String likes = gdao.getReviewLikes(rcode);
		if(selected.equals("good")) {
			likes = Integer.parseInt(likes) + 1 + "";
		}
		else {
			likes = Integer.parseInt(likes) - 1 + "";
		}
		
		// 리뷰 테이블 rlike 업데이트
		int result1 = gdao.addReviewLike(rcode, likes);
		
		// rlike 테이블 아이디 추가
		int result2 = gdao.addLikeId(memId, rcode, selected);
		
		if(result1 > 0 && result2 > 0) {
			likes = gdao.getReviewLikes(rcode);
			return Integer.parseInt(likes);
		}
		else {
			return 0;
		}
	}

	public String getScode() {

		System.out.println("SERVICE - getScode() 호출");
		
		String scode = null;
		try {
			scode = gdao.selectScode();
			String scode_left = scode.substring(0, 2);
			String scode_right = scode.substring(2);
			scode_right = String.format("%05d", Integer.parseInt(scode_right + 1 ));
			scode = scode_left + scode_right;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return scode;
	}

	public String getAddGameResult(String scode, String memId, String gcode) {

		System.out.println("SERVICE - getAddGameResult() 호출");
		
		int result = 0;
		try {
			result = gdao.insertGameBasket(scode, memId, gcode);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result + "";
	}
	public String getGcode(String gname) {
		return gdao.getgcode(gname);
	}
}
