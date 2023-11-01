package com.gamestoreproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Coupon;
import com.gamestoreproject.dto.Game;
import com.gamestoreproject.dto.Order;

public interface GameDao {
	
	//GAME RANK LIST
	ArrayList<Game> selectRankGameList();

	ArrayList<String> getTyp(String text);

	ArrayList<String> gettag();

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
	
	//gameInfo
	ArrayList<Game> getInfo(String text);
	
	//GAMELIST
	ArrayList<Game> selectGameList(@Param("gameCount") int gameCount);

	int getprice(String text);

	String getMemPoint(String mid);

	String getTotalMemPoint(String mid);

	String getMemUsedPoint(String mid);

	ArrayList<Order> getMemOrder(String mid);

	String getMNick(String mid);

}
