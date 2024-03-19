package com.cmoa.boot.reserve.domain;

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
public class ReserveVO {

	@NonNull
	private Integer reserveNo;
	@NonNull
	private String userId;
	@NonNull
	private Integer exhibitNo;
	@NonNull
	private String noticeContent;
	private Date reserveDate;
	private String reservePhone;
	private String reserveEmail;
	@NonNull
	private Integer peopleNo;
}
