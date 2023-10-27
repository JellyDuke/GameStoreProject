package com.gamestoreproject.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.gamestoreproject.dto.Member;

public interface MemberDao {

	Member selectMemberInfo(String inputId);

	int joinInsertInfo(@Param("member")Member member);

	Member selectMemberLogin(@Param("mid")String userId, @Param("mpw")String userPw);

	int insertMember_kakao(@Param("member")Member member);

	int memberFindMpwCheck(@Param("userId")String userId);

	void memberFindMpw(@Param("mid")String email, @Param("mpw")String mpw);

	Member getMemInfo(@Param("id")String id);

	int memberJoin_Naver(@Param("mem")Member mem);

	int deleteMember(@Param("mid")String memberId);

	int selectfindAccount(@Param("mid")String mid, @Param("mpw")String currentPw);

	int updateMpw(@Param("mpw")String newPw, @Param("mid")String mid);

}