package com.cmoa.boot.booking.service;

import com.cmoa.boot.booking.domain.BookResultVO;
import com.cmoa.boot.booking.domain.BookingVO;
import com.cmoa.boot.exhibit.domain.ExhibitVO;

public interface BookingService {

	/**
	 * 예매 등록 Service
	 * @param exhibit
	 * @return result
	 */
	int insertBooking(BookingVO booking);

	/**
	 * 예매 번호 불러오기 Service
	 * @return bookingNo
	 */
	int getCurrBookingNo();

	/**
	 * 예매 정보 불러오기 Service
	 * @param bookingNo
	 * @return bOne
	 */
	BookResultVO findOneByNo(int bookingNo);

}
