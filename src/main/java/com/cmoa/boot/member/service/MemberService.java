package com.cmoa.boot.member.service;

import com.cmoa.boot.member.domain.MemberVO;

public interface MemberService {
	
	/**
	 * 멤버 로그인 Service
	 * @param member
	 * @return mOne
	 */
	MemberVO memberLogin(MemberVO member);

}
