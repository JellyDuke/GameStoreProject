package com.gamestoreproject.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Coupon;
import com.gamestoreproject.dto.Game;
import com.gamestoreproject.dto.Order;
import com.gamestoreproject.dto.Review;

public interface GameDao {
	
	//GAME RANK LIST
	ArrayList<HashMap<String, String>> selectRankGameList();

	//검색엔진
	ArrayList<String> getTyp(String text);
	//태그
	ArrayList<String> gettag();
	
	//쿠폰 시작
	int makecoupon(Coupon coupon);

	int codeCheck(String cnumber);

	int codecheck(String code);

	String getcode();

	String gettype(String code);

	int registcoupon(Coupon coupon);

	String getpercent(String code);

	int stackCh(String code);

	ArrayList<Coupon> getcouponList(String uid);

	int checkcode(@Param("code")String code, @Param("cowner")String cowner);
	
	String getgcode(String gname);
	//쿠폰 끝
	
	//gameInfo
	ArrayList<Game> getInfo(String text);
	
	//GAMELIST
	ArrayList<Game> selectGameList(@Param("gameCount") int gameCount);

	//order
	int getprice(String text);

	String getMemPoint(String mid);

	String getTotalMemPoint(String mid);

	String getMemUsedPoint(String mid);

	ArrayList<Order> getMemOrder(String mid);

	String getMNick(String mid);
	
	ArrayList<Order> getoList(String mid);
	//order 끝
	
	//gamedetail 시작
	Game selectGameDetail(@Param("gcode") String gcode);

	String selectRcode();

	int insertReview(@Param("review") Review review);

	ArrayList<HashMap<String, String>> selectReviewList(@Param("gcode") String gcode);

	int deleteReview(@Param("rcode") String rcode);

	int modifyReview(@Param("review") Review review);

	String selectLikeId(@Param("memId") String memId, @Param("rcode") String rcode);

	String getReviewLikes(@Param("rcode") String rcode);

	int addReviewLike(@Param("rcode") String rcode, @Param("likes") String likes);

	int addLikeId(@Param("memId") String memId, @Param("rcode") String rcode, @Param("selected") String selected);

	int deleteReviewLikes(@Param("rcode") String rcode);

	String selectScode();
	//gamedetail 끝

	//basket 시작
	int insertGameBasket(@Param("scode") String scode, @Param("memId") String memId, @Param("gcode") String gcode);
	
	String selectSgcode(@Param("memId") String memId, @Param("gcode") String gcode);

	ArrayList<Game> selectBasketList(@Param("memId") String memId);

	int deleteSelBasket(@Param("memId") String memId, @Param("gcodeList") List<String> gcodeList);

	int deleteCantBuyGame(@Param("memId") String memId);

	ArrayList<HashMap<String, String>> selectCouponList(@Param("memId") String memId);

	String selectOcode(@Param("gcode") String gcode, @Param("gname") String gname);

	int selectMpoint(@Param("memId") String memId);

	int updatePoint(@Param("memId") String memId, @Param("totalPrice") int totalPrice);

	int updateCoupons(@Param("memId") String memId, @Param("couponCode") String couponCode);

	Game selectBuyGameInfo(@Param("gcode") String gcode);

	String selectLastOcode();

	int insertOrders(@Param("ocode") String ocode, @Param("couponCode") String couponCode, @Param("memID") String memId, @Param("gprice") String gprice, @Param("goriginprice") int goriginprice, @Param("gsale") double gsale, @Param("gname") String gname);

	int buyDeleteBasket(@Param("memId") String memId, @Param("gcode") String gcode);
	//basket 끝
	
	//admin
	int adminChange(@Param("percent")Double percent, @Param("gcode")String gcode);

	ArrayList<Game> getMemgList(String mid);

	int grcheck(@Param("gcode")String gcode, @Param("mid")String mid);
}
