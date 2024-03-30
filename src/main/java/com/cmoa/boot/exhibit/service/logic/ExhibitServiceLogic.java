package com.cmoa.boot.exhibit.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmoa.boot.exhibit.domain.ExhibitVO;
import com.cmoa.boot.exhibit.domain.ExhibitImgVO;
import com.cmoa.boot.exhibit.domain.ExhibitPageInfo;
import com.cmoa.boot.exhibit.service.ExhibitService;
import com.cmoa.boot.exhibit.store.ExhibitStore;

import lombok.NonNull;

@Service
public class ExhibitServiceLogic implements ExhibitService{

	@Autowired
	private ExhibitStore eStore;
	@Autowired
	private SqlSession session;
	
	/**
	 * 전시 리스트 Service
	 */
	@Override
	public List<ExhibitVO> selectExhibitList(ExhibitPageInfo pi) {
		List<ExhibitVO> eList = eStore.selectExhibitList(session, pi);
		return eList;
	}
	
	/**
	 * 전시 리스트 Service
	 */
	@Override
	public List<ExhibitVO> selectExhibitList() {
		List<ExhibitVO> eList = eStore.selectExhibitList(session);
		return eList;
	}

	/**
	 * 전시명 불러오기 Service
	 */
	@Override
	public List<ExhibitVO> selectExhibitName() {
		List<ExhibitVO> eList = eStore.selectExhibitName(session);
		return eList;
	}
	
	/**
	 * 전시 사진 불러오기 Service
	 */
	@Override
	public List<ExhibitImgVO> findImgByNo(Integer exhibitNo) {
		List<ExhibitImgVO> iList = eStore.findImgByNo(session, exhibitNo);
		return iList;
	}

	/**
	 * 전시 정보 불러오기 Service
	 */
	@Override
	public ExhibitVO findOneByNo(@NonNull Integer exhibitNo) {
		ExhibitVO eOne = eStore.findOneByNo(session, exhibitNo);
		return eOne;
	}

	/**
	 * 전시 등록 Service
	 */
	@Override
	public int insertExhibit(ExhibitVO exhibit) {
		int result = eStore.insertExhibit(session, exhibit);
		return result;
	}

	/**
	 * 전시 사진 등록 Service
	 */
	@Override
	public int insertExhImages(ExhibitImgVO exhImage) {
		int result = eStore.insertExhImages(session, exhImage);
		return result;
	}
	
	/**
	 * 전시 총 갯수 Service
	 */
	@Override
	public int getTotalCount() {
		int totalCount = eStore.getTotalCount(session);
		return totalCount;
	}

}
