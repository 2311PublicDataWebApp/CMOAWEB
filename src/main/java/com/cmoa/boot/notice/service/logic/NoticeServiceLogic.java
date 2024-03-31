package com.cmoa.boot.notice.service.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.domain.NoticePageInfo;
import com.cmoa.boot.notice.service.NoticeService;
import com.cmoa.boot.notice.store.NoticeStore;

@Service
public class NoticeServiceLogic implements NoticeService{

	@Autowired
	private NoticeStore nStore;
	@Autowired
	private SqlSession session;
	
	/**
	 * 공지사항 목록 Service
	 * @return nList
	 */
	@Override
	public List<NoticeVO> selectNoticeList(NoticePageInfo pi) {
		List<NoticeVO> nList = nStore.selectNoticeList(session, pi);
		return nList;
	}
	
	/**
	 * 공지사항 목록 Service
	 */
	@Override
	public List<NoticeVO> selectNoticeList() {
		List<NoticeVO> nList = nStore.selectNoticeList(session);
		return nList;
	}
	
	/**
	 * 공지사항 상세 Service
	 */
	@Override
	public NoticeVO selectOneByNo(Integer noticeNo) {
		NoticeVO notice = nStore.selectOneByNo(session, noticeNo);
		return notice;
	}
	
	/**
	 * 공지사항 등록 Service
	 */
	@Override
	public int inserNotice(NoticeVO notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}

	/**
	 * 공지사항 총 갯수 Service
	 */
	@Override
	public int getTotalCount() {
		int totalCount = nStore.getTotalCount(session);
		return totalCount;
	}

}
