package com.cmoa.boot.notice.service;

import java.util.List;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.domain.PageInfo;

public interface NoticeService {

	/**
	 * 공지사항 리스트 Service
	 * @param pi
	 * @return nList
	 */
	List<NoticeVO> selectNoticeList(PageInfo pi);

}
