package com.kaeru.eLearning.member;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String pwd;
	private String memberName;
	private String email;
	private String zipNum;
	private String address1;
	private String address2;
	private String phone;
	private String useyn;
	private Timestamp regdate;
}
