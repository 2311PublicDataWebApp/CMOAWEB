package com.cmoa.boot.exhibit.domain;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date startDate;
	@NonNull
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date endDate;
	private String exhibitDesc;
	private Integer exhibitPeople;
	private String exhibitIntro;
	private String fileName;
	private String fileRename;
	private String filePath;
	private long fileSize;
	
}
