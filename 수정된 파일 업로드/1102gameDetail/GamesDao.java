package com.gamestoreproject.dao;

import java.util.ArrayList;
import java.util.HashMap;

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

}
