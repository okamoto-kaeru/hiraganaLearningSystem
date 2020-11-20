package com.kaeru.eLearning.member;

public interface MemberService {

	MemberVO getMemberByMemberId(String memberId);

	int insertMember(MemberVO vo);
	
	MemberVO findId(MemberVO vo);
	
	MemberVO findPassword(MemberVO vo);
	
	void updatePassword(MemberVO vo);
}