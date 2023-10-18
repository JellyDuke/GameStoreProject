package com.gamestoreproject.dao;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Member;

public interface MemberDao {

	Member getMemInfo(@Param("id") String id);

	int memberJoin_Naver(@Param("mem") Member mem);

}
