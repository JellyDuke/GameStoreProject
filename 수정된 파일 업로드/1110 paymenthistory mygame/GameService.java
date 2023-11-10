package com.gamestoreproject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gamestoreproject.dao.GameDao;
import com.gamestoreproject.dto.Game;
import com.gamestoreproject.dto.Review;

@Service
public class GameService {
	
	@Autowired
	private GameDao gdao;
	
	public ArrayList<HashMap<String, String>> gameList() {
		System.out.println("SERVICE - rankGameList()");
		ArrayList<HashMap<String, String>> GameList = gdao.selectRankGameList();
		return GameList;
	}
	public ArrayList<Game> getgameList(int gameCount) {
		System.out.println("SERVICE - getgameList()");
		ArrayList<Game> GameList = gdao.selectGameList(gameCount);
		return GameList;
	}
	//디테일 시작
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
			int rcode_right = Integer.parseInt(rcode.substring(2));
			
			rcode = rcode_left + String.format("%05d",rcode_right + 1);
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
	
	public String getGcode(String gname) {
		return gdao.getgcode(gname);
	}
	//끝
	
	public String getScode() {

		System.out.println("SERVICE - getScode() 호출");
		
		String scode = null;
		try {
			scode = gdao.selectScode();
			String scode_left = scode.substring(0, 2);
			int scode_right = Integer.parseInt(scode.substring(2));
			scode = scode_left + String.format("%05d", scode_right + 1);
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
	public String getSgcode(String memId, String gcode) {

		System.out.println("SERVICE - getSgcode() 호출");
		
		String sgcode = null;
		try {
			sgcode = gdao.selectSgcode(memId, gcode);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return sgcode;
	}
public ArrayList<Game> getbasketList(String memId) {
		
		System.out.println("SERVICE - getbasketList() 호출");
		
		ArrayList<Game> basketList = null;
		try {
			basketList = gdao.selectBasketList(memId);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return basketList;
	}

	public int getSelDeleteBasket_Result(String memId, List<String> gcodeList) {

		System.out.println("SERVICE - getSelDeleteBasket_Result() 호출");
		
		int result = 0;
		try {
			result = gdao.deleteSelBasket(memId, gcodeList);
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}

	public int getDeleteCantBuyGame_Result(String memId) {

		System.out.println("SERVICE - getDeleteCantBuyGame_Result() 호출");
		
		int result = 0;
		try {
			result = gdao.deleteCantBuyGame(memId);
		}
		catch (Exception e) {
			e.printStackTrace();
			return 3;
		}
		
		return result;
	}

	public ArrayList<HashMap<String, String>> getCouponList(String memId) {
		
		System.out.println("SERVICE - getCouponList() 호출");
		
		ArrayList<HashMap<String, String>> couponList = null;
		try {
			couponList = gdao.selectCouponList(memId);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return couponList;
	}

	public String getOcode(String gcode, String gname) {

		System.out.println("SERVICE - getOcode() 호출");
		
		String ocode = null;
		try {
			ocode = gdao.selectOcode(gcode, gname);
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return ocode;
	}

	public int getMpoint(String memId) {

		System.out.println("SERVICE - getMpoint()");
		
		int mpoint = 0;
		try {
			mpoint = gdao.selectMpoint(memId);
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return mpoint;
	}

	public String getGameBuyResult(String memId, String totalPrice, String couponCode, String[] gcodeArray, String[] gpriceArray) {
		
		try {
			// totalPrice >>  MEMBERS 테이블 - UPDATE - 포인트 차감
			System.out.println("pointResult");
			int pointResult = gdao.updatePoint(memId, Integer.parseInt(totalPrice));
			
			// COUPONS 테이블 - UPDATE - CUSED => Y로 변경(매개 변수 : 쿠폰코드, 아이디)
			int couponResult = 0;
			if(couponCode != null && couponCode.length() > 0) {
				System.out.println("couponResult");
				couponResult = gdao.updateCoupons(memId, couponCode);			
			}
			
			int orderResult = 0;
			int deleteResult = 0;
			for(int i=0;i<gcodeArray.length;i++) {
				System.out.println("ginfo");
				Game ginfo = gdao.selectBuyGameInfo(gcodeArray[i]);
				System.out.println("ocode");
				String ocode = gdao.selectLastOcode();
				String ocode_left = ocode.substring(0, 2);
				int ocode_right = Integer.parseInt(ocode.substring(2));
				ocode = ocode_left + String.format("%05d", ocode_right + 1);
				
//			couponCode, ginfo.get게임이름,원가,할인률,  id >> ORDERS 테이블 - INSERT
//			ORDERS 테이블 - INSERT - 주문 정보 추가 (매개변수 : 쿠폰코드(NULL 가능), 게임 이름, 아이디, 결제액, 원가, 할인률)
				System.out.println("orderResult");
				orderResult = orderResult + gdao.insertOrders(ocode, couponCode, memId, gpriceArray[i], ginfo.getGprice(), ginfo.getGsale(), ginfo.getGname());
				
//			장바구니 Delete >>  id, gcode
				System.out.println("deleteResult");
				System.out.println(memId);
				System.out.println(ginfo.getGcode());
				deleteResult = deleteResult + gdao.buyDeleteBasket(memId, ginfo.getGcode());
			}
			return pointResult+couponResult+orderResult+deleteResult+"";
		}
		catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
		
		
	}
	public int adminChange(Double percent, String gcode) {
		return gdao.adminChange(percent, gcode);
	}
	public ArrayList<Game> getMemgList(String mid) {
		ArrayList<Game> gList = gdao.getMemgList(mid);
		for(Game game : gList) {
			int grcheck = gdao.grcheck(game.getGcode(),mid);
			if(grcheck > 0) {
				game.setGrcheck("Y");
			} else {
				game.setGrcheck("N");
			}
		 System.out.println(game.getGrcheck());
		}
		return gList;
	}
	public int refundCheck(String oprice, String ocode, String mid) {
		int changeCheck = gdao.changeCheck(ocode);
		if(changeCheck>0) {
			int refundCheck = gdao.refund(mid, oprice);
			return refundCheck;
		}
		return 0;
	}

}
