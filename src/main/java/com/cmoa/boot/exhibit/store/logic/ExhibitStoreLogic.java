package com.cmoa.boot.exhibit.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cmoa.boot.exhibit.domain.ExhibitVO;
import com.cmoa.boot.exhibit.domain.ExhibitImgVO;
import com.cmoa.boot.exhibit.domain.ExhibitPageInfo;
import com.cmoa.boot.exhibit.store.ExhibitStore;

import lombok.NonNull;

@Repository
public class ExhibitStoreLogic implements ExhibitStore{

	/**
	 * 전시 리스트 Service
	 */
	@Override
	public List<ExhibitVO> selectExhibitList(SqlSession session, ExhibitPageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<ExhibitVO> eList = session.selectList("ExhibitMapper.selectExhibitList", null, rowBounds);
		return eList;
	}
	
	/**
	 * 전시 리스트 Service
	 */
	@Override
	public List<ExhibitVO> selectExhibitList(SqlSession session) {
		List<ExhibitVO> eList = session.selectList("ExhibitMapper.selectExhibitList");
		return eList;
	}

	/**
	 * 전시명 불러오기 Service
	 */
	@Override
	public List<ExhibitVO> selectExhibitName(SqlSession session) {
		List<ExhibitVO> eList = session.selectList("ExhibitMapper.selectExhibitName");
		return eList;
	}
	
	/**
	 * 전시 사진 불러오기 Service
	 */
	@Override
	public List<ExhibitImgVO> findImgByNo(SqlSession session, Integer exhibitNo) {
		List<ExhibitImgVO> iList = session.selectList("ExhibitMapper.findImgByNo", exhibitNo);
		return iList;
	}

	/**
	 * 전시명 불러오기 Service
	 */
	@Override
	public ExhibitVO findOneByNo(SqlSession session, @NonNull Integer exhibitNo) {
		ExhibitVO eOne = session.selectOne("ExhibitMapper.findOneByNo", exhibitNo);
		return eOne;
	}

	/**
	 * 전시 등록 Service
	 */
	@Override
	public int insertExhibit(SqlSession session, ExhibitVO exhibit) {
		int result = session.insert("ExhibitMapper.insertExhibit", exhibit);
		return result;
	}
	
	/**
	 * 전시 사진 등록 Service
	 */
	@Override
	public int insertExhImages(SqlSession session, ExhibitImgVO exhImage) {
		int result = session.insert("ExhibitMapper.insertExhImages", exhImage);
		return result;
		
	}
	
	/**
	 * 전시 총 갯수 Service
	 */
	@Override
	public int getTotalCount(SqlSession session) {
		int totalCount = session.selectOne("ExhibitMapper.selectTotalCount");
		return totalCount;
	}

}
