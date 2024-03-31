package com.cmoa.boot.booking.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cmoa.boot.booking.domain.BookResultVO;
import com.cmoa.boot.booking.domain.BookingVO;
import com.cmoa.boot.booking.store.BookingStore;

@Repository
public class BookingStoreLogic implements BookingStore{

	/**
	 * 예매 등록 Service
	 */
	@Override
	public int insertBooking(SqlSession session, BookingVO booking) {
		int result = session.insert("BookingMapper.insertBooking", booking);
		return result;
	}

	/**
	 * 예매 번호 불러오기 Service
	 */
	@Override
	public int getCurrBookingNo(SqlSession session) {
		int bookingNo = session.selectOne("BookingMapper.getCurrBookingNo");
		return bookingNo;
	}

	/**
	 * 예매 정보 불러오기 Service
	 */
	@Override
	public BookResultVO findOneByNo(SqlSession session, int bookingNo) {
		BookResultVO bOne = session.selectOne("BookingMapper.findOneByNo", bookingNo);
		return bOne;
	}

	@Override
	public int selectTotalCount(SqlSession session, BookingVO booking) {
		int totalCount =  session.selectOne("BookingMapper.selectTotalCount", booking);
		return totalCount;
	}

}
