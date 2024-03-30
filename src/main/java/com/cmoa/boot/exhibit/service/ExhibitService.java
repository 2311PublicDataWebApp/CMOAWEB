package com.cmoa.boot.exhibit.service;

import java.util.List;

import com.cmoa.boot.exhibit.domain.ExhibitVO;

import lombok.NonNull;

import com.cmoa.boot.exhibit.domain.ExhibitImgVO;
import com.cmoa.boot.exhibit.domain.ExhibitPageInfo;

public interface ExhibitService {

	/**
	 * 전시 리스트 Service
	 * @param pi
	 * @return eList
	 */
	List<ExhibitVO> selectExhibitList(ExhibitPageInfo pi);

	/**
	 * 전시 리스트 Service
	 * @return eList
	 */
	List<ExhibitVO> selectExhibitList();
	
	/**
	 * 전시명 목록 불러오기 Service
	 * @return eList
	 */
	List<ExhibitVO> selectExhibitName();
	
	/**
	 * 전시 사진 불러오기 Service
	 * @param exhibitNo
	 * @return iList
	 */
	List<ExhibitImgVO> findImgByNo(Integer exhibitNo);

	/**
	 * 전시 정보 불러오기 Service
	 * @param exhibitNo
	 * @return eOne
	 */
	ExhibitVO findOneByNo(@NonNull Integer exhibitNo);

	/**
	 * 전시 등록 Service
	 * @param exhibit
	 * @return result
	 */
	int insertExhibit(ExhibitVO exhibit);

	/**
	 * 전시 사진 등록 Service
	 * @param exhImage
	 * @return result
	 */
	int insertExhImages(ExhibitImgVO exhImage);
	
	/**
	 * 전시 총 갯수 Service
	 * @return totalCount
	 */
	int getTotalCount();

}
