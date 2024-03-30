package com.cmoa.boot.member.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmoa.boot.member.domain.MemberPageInfo;
import com.cmoa.boot.member.domain.MemberVO;
import com.cmoa.boot.member.domain.MyBookingVO;
import com.cmoa.boot.member.service.MemberService;
import com.cmoa.boot.member.store.MemberStore;

@Service
public class MemberServiceLogic implements MemberService{
	
	@Autowired
	private MemberStore mStore;
	@Autowired
	private SqlSession session;
	
	/**
	 * 멤버 로그인 Service
	 */
	@Override
	public MemberVO memberLogin(MemberVO member) {
		MemberVO mOne = mStore.memberLogin(session, member);
		return mOne;
	}

	/**
	 * 멤버 회원가입 Service
	 */
	@Override
	public int registerMember(MemberVO member) {
		int result = mStore.registerMember(session, member);
		return result;
	}

	/**
	 * 멤버 아이디 찾기 Service
	 */
	@Override
	public MemberVO findOneId(MemberVO member) {
		MemberVO mOne = mStore.findOneId(session, member);
		return mOne;
	}

	/**
	 * 멤버 비밀번호 찾기 Service
	 */
	@Override
	public MemberVO findOneForPw(MemberVO member) {
		MemberVO mOne = mStore.findOneForPw(session, member);
		return mOne;
	}

	/**
	 * 멤버 비밀번호 재설정 Service
	 */
	@Override
	public int updateMemberPW(MemberVO member) {
		int result = mStore.updateMemberPW(session, member);
		return result;
	}

	/**
	 * 멤버 정보 조회 by userId
	 */
	@Override
	public MemberVO findOneById(String userId) {
		MemberVO mOne = mStore.findOneById(session, userId);
		return mOne;
	}

	/**
	 * 멤버 수정 Service
	 */
	@Override
	public int updateMember(MemberVO member) {
		int result = mStore.updateMember(session, member);
		return result;
	}

	/**
	 * 멤버 탈퇴 Service
	 */
	@Override
	public int deleteMember(String userId) {
		int result = mStore.deleteMember(session, userId);
		return result;
	}

	/**
	 * 멤버 예매내역 Service
	 */
	@Override
	public List<MyBookingVO> selectBookingList(MemberPageInfo pi, String userId) {
		List<MyBookingVO> bList = mStore.selectBookingList(session, pi, userId);
		return bList;
	}

	/**
	 * 예매 내역 총 갯수
	 */
	@Override
	public int getTotalCount(String userId) {
		int totalCount = mStore.getTotalCount(session, userId);
		return totalCount;
	}

}
