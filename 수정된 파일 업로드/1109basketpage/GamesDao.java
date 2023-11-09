package com.gamestoreproject.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Game;
import com.gamestoreproject.dto.Review;

public interface GamesDao {

	ArrayList<Game> selectGameList(@Param("gameCount") int gameCount);

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

}
