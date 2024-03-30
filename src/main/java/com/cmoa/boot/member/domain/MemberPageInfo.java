package com.cmoa.boot.member.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberPageInfo {
	private int currentPage;
	private int totalCount;
	private int naviTotalCount;
	private int boardLimit;
	private int naviLimit;
	private int startNavi;
	private int endNavi;

	public MemberPageInfo() {
	}

	public MemberPageInfo(int currentPage, int totalCount, int boardLimit) {
		super();
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.naviLimit = 5;
		this.boardLimit = boardLimit;
		this.naviTotalCount = (int) Math.ceil((double) totalCount / boardLimit);
		this.startNavi = ((int)((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
		this.endNavi = startNavi + naviLimit - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
	}
}
