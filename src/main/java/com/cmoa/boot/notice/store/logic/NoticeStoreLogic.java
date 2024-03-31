package com.cmoa.boot.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cmoa.boot.notice.domain.NoticeVO;
import com.cmoa.boot.notice.domain.NoticePageInfo;
import com.cmoa.boot.notice.store.NoticeStore;

@Repository
public class NoticeStoreLogic implements NoticeStore {

	/**
	 * 공지사항 목록 Service
	 */
	@Override
	public List<NoticeVO> selectNoticeList(SqlSession session, NoticePageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> nList = session.selectList("NoticeMapper.selectNoticeList", null, rowBounds);
		return nList;
	}
	
	/**
	 * 공지사항 목록 Service
	 */
	@Override
	public List<NoticeVO> selectNoticeList(SqlSession session) {
		List<NoticeVO> nList = session.selectList("NoticeMapper.selectNoticeList");
		return nList;
	}
	
	/**
	 * 공지사항 상세 Service
	 */
	@Override
	public NoticeVO selectOneByNo(SqlSession session, Integer noticeNo) {
		NoticeVO notice = session.selectOne("NoticeMapper.selectOneByNo", noticeNo);
		return notice;
	}
	
	/**
	 * 공지사항 등록 Service
	 */
	@Override
	public int insertNotice(SqlSession session, NoticeVO notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	/**
	 * 공지사항 총 갯수 Service
	 */
	@Override
	public int getTotalCount(SqlSession session) {
		int totalCount = session.selectOne("NoticeMapper.selectTotalCount");
		return totalCount;
	}

}
