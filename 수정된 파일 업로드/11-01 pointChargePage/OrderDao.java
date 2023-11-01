package com.gamestoreproject.dao;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Member;
import com.gamestoreproject.dto.Order;

public interface OrderDao {

	String getMaxocode();

	int insertOrder(Order od);

	int deleteOrder(String ocode);
	
	int updatePoint(@Param("loginId")String loginId, @Param("point")String point);
	
	int deletePoint(@Param("loginId")String loginId, @Param("point")String point);

	Order getOrder(String ocode);

}
