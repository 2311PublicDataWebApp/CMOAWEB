package com.cmoa.boot.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cmoa.boot.member.domain.MemberVO;
import com.cmoa.boot.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public MemberVO memberLogin(SqlSession session, MemberVO member) {
		MemberVO mOne = session.selectOne("MemberMapper.checkMemberLogin", member);
		return mOne;
	}

}
