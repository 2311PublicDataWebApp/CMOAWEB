package com.cmoa.boot.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.domain.PageInfo;
import com.cmoa.boot.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore {

	/**
	 * 공지 목록 Service
	 * @return nList
	 */
	@Override
	public List<NoticeVO> selectNoticeList(SqlSession session, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> nList = session.selectList("NoticeMapper.selectNoticeList", null, rowBounds);
		return nList;
	}

}
