package com.cmoa.boot.booking.store;

import org.apache.ibatis.session.SqlSession;

import com.cmoa.boot.booking.domain.BookResultVO;
import com.cmoa.boot.booking.domain.BookingVO;

public interface BookingStore {

	/**
	 * 예매 등록 Service
	 * @param session
	 * @param exhibit
	 * @return result
	 */
	int insertBooking(SqlSession session, BookingVO booking);

	/**
	 * 예매 번호 불러오기 Service
	 * @param session
	 * @return bookingNo
	 */
	int getCurrBookingNo(SqlSession session);

	/**
	 * 예매 정보 불러오기 Service
	 * @param session
	 * @param bookingNo
	 * @return bOne
	 */
	BookResultVO findOneByNo(SqlSession session, int bookingNo);

	int selectTotalCount(SqlSession session, BookingVO booking);

}
