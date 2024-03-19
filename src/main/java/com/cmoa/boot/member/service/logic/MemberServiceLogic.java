package com.cmoa.boot.member.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmoa.boot.member.domain.MemberVO;
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

}
