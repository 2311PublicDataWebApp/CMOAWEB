package com.cmoa.boot.notice.service.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.domain.PageInfo;
import com.cmoa.boot.notice.service.NoticeService;
import com.cmoa.boot.notice.store.NoticeStore;

@Service
public class NoticeServiceLogic implements NoticeService{

	@Autowired
	private NoticeStore nStore;
	@Autowired
	private SqlSession session;
	
	/**
	 * 공지 목록 Service
	 * @return nList
	 */
	@Override
	public List<NoticeVO> selectNoticeList(PageInfo pi) {
		List<NoticeVO> nList = nStore.selectNoticeList(session, pi);
		return nList;
	}

}
