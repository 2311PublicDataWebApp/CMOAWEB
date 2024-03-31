package com.cmoa.boot.booking.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class BookingVO {

	@NonNull
	private Integer bookingNo;
	@NonNull
	private String userId;
	@NonNull
	private Integer exhibitNo;
	@NonNull
	private Date bookingDate;
	private String bookingPhone;
	private String bookingEmail;
	@NonNull
	private Integer peopleNo;
	private String bookingName;
}
