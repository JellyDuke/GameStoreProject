package com.gamestoreproject.dao;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Member;

public interface MemberDao {

	Member selectMemberInfo(String inputId);

	int joinInsertInfo(@Param("member")Member member);

	Member selectMemberLogin(@Param("mid")String userId, @Param("mpw")String userPw);

	int insertMember_kakao(@Param("member")Member member);
}
