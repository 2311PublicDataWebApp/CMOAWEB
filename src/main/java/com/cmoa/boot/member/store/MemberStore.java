package com.cmoa.boot.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.cmoa.boot.member.domain.MemberPageInfo;
import com.cmoa.boot.member.domain.MemberVO;
import com.cmoa.boot.member.domain.MyBookingVO;

public interface MemberStore {
	
	/**
	 * 멤버 로그인 Service
	 * @param session
	 * @param member
	 * @return mOne
	 */
	MemberVO memberLogin(SqlSession session, MemberVO member);

	/**
	 * 멤버 회원가입 Service
	 * @param session
	 * @param member
	 * @return result
	 */
	int registerMember(SqlSession session, MemberVO member);

	/**
	 * 멤버 아이디 찾기 Service
	 * @param session
	 * @param member
	 * @return mOne
	 */
	MemberVO findOneId(SqlSession session, MemberVO member);

	/**
	 * 멤버 비밀번호 찾기 Service
	 * @param session
	 * @param member
	 * @return mOne
	 */
	MemberVO findOneForPw(SqlSession session, MemberVO member);

	/**
	 * 멤버 비밀번호 재설정 Service
	 * @param session
	 * @param member
	 * @return result
	 */
	int updateMemberPW(SqlSession session, MemberVO member);

	/**
	 * 멤버 정보 조회 by userId
	 * @param session
	 * @param userId
	 * @return mOne
	 */
	MemberVO findOneById(SqlSession session, String userId);

	/**
	 * 멤버 수정 Service
	 * @param session
	 * @param member
	 * @return result
	 */
	int updateMember(SqlSession session, MemberVO member);

	/**
	 * 멤버 탈퇴 Service
	 * @param session
	 * @param userId
	 * @return result
	 */
	int deleteMember(SqlSession session, String userId);

	/**
	 * 멤버 예매내역 Service
	 * @param session
	 * @param pi 
	 * @param userId
	 * @return bList
	 */
	List<MyBookingVO> selectBookingList(SqlSession session, MemberPageInfo pi, String userId);

	/**
	 * 예매 내역 총 갯수
	 * @param session
	 * @param userId 
	 * @return totalCount
	 */
	int getTotalCount(SqlSession session, String userId);

}
