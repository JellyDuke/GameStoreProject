package com.gamestoreproject.dao;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Member;

public interface MemberDao {

	Member selectMemberInfo(String inputId);

	int joinInsertInfo(@Param("member")Member member);
}
