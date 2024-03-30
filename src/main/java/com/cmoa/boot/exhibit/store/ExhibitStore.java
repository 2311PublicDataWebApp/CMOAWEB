package com.cmoa.boot.exhibit.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.cmoa.boot.exhibit.domain.ExhibitVO;

import lombok.NonNull;

import com.cmoa.boot.exhibit.domain.ExhibitImgVO;
import com.cmoa.boot.exhibit.domain.ExhibitPageInfo;

public interface ExhibitStore {

	/**
	 * 전시 리스트 Service
	 * @param session
	 * @param pi
	 * @return eList
	 */
	List<ExhibitVO> selectExhibitList(SqlSession session, ExhibitPageInfo pi);

	/**
	 * 전시명 불러오기 Service
	 * @param session
	 * @return eList
	 */
	List<ExhibitVO> selectExhibitName(SqlSession session);

	/**
	 * 전시 총 갯수 Service
	 * @param session
	 * @return totalCount
	 */
	int getTotalCount(SqlSession session);

	/**
	 * 전시명 불러오기 Service
	 * @param exhibitNo
	 * @return eOne
	 */
	ExhibitVO findOneByNo(SqlSession session, @NonNull Integer exhibitNo);

	/**
	 * 전시 사진 불러오기 Service
	 * @param session
	 * @param exhibitNo
	 * @return iList
	 */
	List<ExhibitImgVO> findImgByNo(SqlSession session, Integer exhibitNo);
	
	/**
	 * 전시 등록 Service
	 * @param session
	 * @param exhibit
	 * @return result
	 */
	int insertExhibit(SqlSession session, ExhibitVO exhibit);

	/**
	 * 전시 사진 등록 Service
	 * @param session
	 * @param exhImage
	 * @return 
	 */
	int insertExhImages(SqlSession session, ExhibitImgVO exhImage);


}
