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
	private String address;
	private String phone;
	private String useyn;
	private Timestamp regdate;
}
