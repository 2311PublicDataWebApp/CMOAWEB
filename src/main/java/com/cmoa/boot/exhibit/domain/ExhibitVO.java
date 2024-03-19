package com.cmoa.boot.exhibit.domain;

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
public class ExhibitVO {
	@NonNull
	private Integer exhibitNo;
	@NonNull
	private String exhibitTitle;
	@NonNull
	private String exhibitPlace;
	@NonNull
	private String deptCode;
	@NonNull
	private Date startDate;
	@NonNull
	private Date endDate;
	@NonNull
	private Integer exhFileNo;
	private String exhFileName;
	private String exhFileRename;
	private String exhFilePath;
	private String exhFileSize;
}
