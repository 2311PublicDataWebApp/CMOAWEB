package com.cmoa.boot.member.domain;

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
public class MemberVO {
	@NonNull
	private String userId;
	@NonNull
	private String userPw;
	@NonNull
	private String userName;
	@NonNull
	private String userEmail;
	private String userPhone;

}
