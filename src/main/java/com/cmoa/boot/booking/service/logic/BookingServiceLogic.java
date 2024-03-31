package com.cmoa.boot.booking.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cmoa.boot.booking.domain.BookResultVO;
import com.cmoa.boot.booking.domain.BookingVO;
import com.cmoa.boot.booking.service.BookingService;
import com.cmoa.boot.booking.store.BookingStore;

@Service
public class BookingServiceLogic implements BookingService {

	@Autowired
	private BookingStore bStore;
	@Autowired
	private SqlSession session;
	
	/**
	 * 예매 등록 Service
	 */
	@Override
	public int insertBooking(BookingVO booking) {
		int result = bStore.insertBooking(session, booking);
		return result;
	}

	/**
	 * 예매 번호 불러오기 Service
	 */
	@Override
	public int getCurrBookingNo() {
		int bookingNo = bStore.getCurrBookingNo(session);
		return bookingNo;
	}

	/**
	 * 예매 정보 불러오기 Service
	 */
	@Override
	public BookResultVO findOneByNo(int bookingNo) {
		BookResultVO bOne = bStore.findOneByNo(session, bookingNo);
		return bOne;
	}

	@Override
	public int selectTotalCount(BookingVO booking) {
		int totalCount = bStore.selectTotalCount(session, booking);
		return totalCount;
	}

}
