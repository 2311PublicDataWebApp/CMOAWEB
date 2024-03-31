package com.cmoa.boot.notice.service;

import java.util.List;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.domain.NoticePageInfo;

public interface NoticeService {

	/**
	 * 공지사항 목록 Service
	 * @param pi
	 * @return nList
	 */
	List<NoticeVO> selectNoticeList(NoticePageInfo pi);

	/**
	 * 공지사항 목록 Service
	 * @return nList
	 */
	List<NoticeVO> selectNoticeList();
	
	/**
	 * 공지사항 상세 Service
	 * @param noticeNo
	 * @return notice
	 */
	NoticeVO selectOneByNo(Integer noticeNo);
	
	/**
	 * 공지사항 등록 Service
	 * @param notice
	 * @return result
	 */
	int inserNotice(NoticeVO notice);

	/**
	 * 공지사항 총 갯수 Service
	 * @return totalCount
	 */
	int getTotalCount();

}
