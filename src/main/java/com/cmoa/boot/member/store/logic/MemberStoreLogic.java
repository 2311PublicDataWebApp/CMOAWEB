package com.cmoa.boot.member.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cmoa.boot.member.domain.MemberPageInfo;
import com.cmoa.boot.member.domain.MemberVO;
import com.cmoa.boot.member.domain.MyBookingVO;
import com.cmoa.boot.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	/**
	 * 멤버 로그인 Service
	 */
	@Override
	public MemberVO memberLogin(SqlSession session, MemberVO member) {
		MemberVO mOne = session.selectOne("MemberMapper.checkMemberLogin", member);
		return mOne;
	}

	/**
	 * 멤버 회원가입 Service
	 */
	@Override
	public int registerMember(SqlSession session, MemberVO member) {
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

	/**
	 * 멤버 아이디 찾기 Service
	 */
	@Override
	public MemberVO findOneId(SqlSession session, MemberVO member) {
		MemberVO mOne = session.selectOne("MemberMapper.findOneId", member);
		return mOne;
	}

	/**
	 * 멤버 비밀번호 찾기 Service
	 */
	@Override
	public MemberVO findOneForPw(SqlSession session, MemberVO member) {
		MemberVO mOne = session.selectOne("MemberMapper.findOneForPw", member);
		return mOne;
	}

	/**
	 * 멤버 비밀번호 재설정 Service
	 */
	@Override
	public int updateMemberPW(SqlSession session, MemberVO member) {
		int result = session.insert("MemberMapper.updateMemberPW", member);
		return result;
	}

	/**
	 * 멤버 정보 조회 by userId
	 */
	@Override
	public MemberVO findOneById(SqlSession session, String userId) {
		MemberVO mOne = session.selectOne("MemberMapper.findOneById", userId);
		return mOne;
	}

	/**
	 * 멤버 수정 Service
	 */
	@Override
	public int updateMember(SqlSession session, MemberVO member) {
		int result = session.update("MemberMapper.updateMember", member);
		return result;
	}
	
	/**
	 * 멤버 탈퇴 Service
	 */
	@Override
	public int deleteMember(SqlSession session, String userId) {
		int result = session.delete("MemberMapper.deleteMember", userId);
		return result;
	}

	/**
	 * 멤버 예매내역 Service
	 */
	@Override
	public List<MyBookingVO> selectBookingList(SqlSession session, MemberPageInfo pi, String userId) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MyBookingVO> bList = session.selectList("MemberMapper.selectBookingList", userId, rowBounds);
		return bList;
	}

	/**
	 * 예매 내역 총 갯수
	 */
	@Override
	public int getTotalCount(SqlSession session, String userId) {
		int totalCount = session.selectOne("MemberMapper.selectTotalCount", userId);
		return totalCount;
	}

}
