package com.cmoa.boot.notice.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.domain.PageInfo;

public interface NoticeStore {

	/**
	 * 공지 목록 Service
	 * @param session
	 * @param pi
	 * @return nList
	 */
	List<NoticeVO> selectNoticeList(SqlSession session, PageInfo pi);

}
