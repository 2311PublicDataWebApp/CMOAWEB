package com.cmoa.boot.notice.domain;

import java.sql.Date;
import java.sql.Timestamp;

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
public class NoticeVO {
	@NonNull
	private Integer noticeNo;
	@NonNull
	private String noticeTitle;
	@NonNull
	private String noticeWriter;
	@NonNull
	private String noticeContent;
	private Date noticeDate;
	private Date updateDate;
}
