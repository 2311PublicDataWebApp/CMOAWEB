package com.cmoa.boot.member.store;

import org.apache.ibatis.session.SqlSession;
import com.cmoa.boot.member.domain.MemberVO;

public interface MemberStore {
	
	/**
	 * 멤버 로그인 Service
	 * @param session
	 * @param member
	 * @return mOne
	 */
	MemberVO memberLogin(SqlSession session, MemberVO member);

}
