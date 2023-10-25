package com.gamestoreproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Coupon;
import com.gamestoreproject.dto.Game;

public interface GamesDao {

	ArrayList<Game> selectGameList();

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

	ArrayList<Game> getInfo(String text);

}
