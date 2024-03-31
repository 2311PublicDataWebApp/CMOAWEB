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
public class BookResultVO {

	@NonNull
	private Integer bookingNo;
	private String userId;
	private String userName;
	private String bookingName;
	private Date bookingDate;
	private Integer exhibitNo;
	private String exhibitTitle;
	private String exhibitPlace;
	private String bookingPhone;
	private String bookingEmail;
	private Integer peopleNo;

}