package com.cmoa.boot.exhibit.domain;

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
public class ExhibitImgVO {
	@NonNull
	private Integer exhFileNo;
	private Integer exhibitNo;
	private String exhFileName;
	private String exhFileRename;
	private String exhFilePath;
	private long exhFileSize;

}
