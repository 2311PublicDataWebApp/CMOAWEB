package com.cmoa.boot.member.service;

import java.util.List;

import com.cmoa.boot.member.domain.MemberPageInfo;
import com.cmoa.boot.member.domain.MemberVO;
import com.cmoa.boot.member.domain.MyBookingVO;

public interface MemberService {
	
	/**
	 * 멤버 로그인 Service
	 * @param member
	 * @return mOne
	 */
	MemberVO memberLogin(MemberVO member);

	/**
	 * 멤버 회원가입 Service
	 * @param member
	 * @return result
	 */
	int registerMember(MemberVO member);

	/**
	 * 멤버 아이디 찾기 Service
	 * @param member
	 * @return mOne
	 */
	MemberVO findOneId(MemberVO member);

	/**
	 * 멤버 비밀번호 찾기 Service
	 * @param member
	 * @return mOne
	 */
	MemberVO findOneForPw(MemberVO member);

	/**
	 * 멤버 비밀번호 재설정 Service
	 * @param member
	 * @return result
	 */
	int updateMemberPW(MemberVO member);

	/**
	 * 멤버 정보 조회 by userId
	 * @param userId
	 * @return mOne
	 */
	MemberVO findOneById(String userId);

	/**
	 * 멤버 수정 Service
	 * @param member
	 * @return result
	 */
	int updateMember(MemberVO member);

	/**
	 * 멤버 탈퇴 Service
	 * @param userId
	 * @return result
	 */
	int deleteMember(String userId);

	/**
	 * 멤버 예매내역 Service
	 * @param pi 
	 * @param userId
	 * @return bList
	 */
	List<MyBookingVO> selectBookingList(MemberPageInfo pi, String userId);

	/**
	 * 예매 내역 총 갯수
	 * @param userId 
	 * @return totalCount
	 */
	int getTotalCount(String userId);

}
