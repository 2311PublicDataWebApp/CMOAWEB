package com.cmoa.boot.notice.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.domain.NoticePageInfo;

public interface NoticeStore {

	/**
	 * 공지사항 목록 Service
	 * @param session
	 * @param pi
	 * @return nList
	 */
	List<NoticeVO> selectNoticeList(SqlSession session, NoticePageInfo pi);
	
	/**
	 * 공지사항 목록 Service
	 * @param session
	 * @return nList
	 */
	List<NoticeVO> selectNoticeList(SqlSession session);
	
	/**
	 * 공지사항 상세 Service
	 * @param session
	 * @param noticeNo
	 * @return notice
	 */
	NoticeVO selectOneByNo(SqlSession session, Integer noticeNo);
	
	/**
	 * 공지사항 등록 Service
	 * @param session
	 * @param notice
	 * @return result
	 */
	int insertNotice(SqlSession session, NoticeVO notice);

	/**
	 * 공지사항 총 갯수 Service
	 * @param session
	 * @return totalCount
	 */
	int getTotalCount(SqlSession session);

}
