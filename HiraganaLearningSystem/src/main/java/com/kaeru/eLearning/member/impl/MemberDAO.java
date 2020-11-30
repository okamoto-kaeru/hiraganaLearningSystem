package com.kaeru.eLearning.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaeru.eLearning.member.GradeVO;
import com.kaeru.eLearning.member.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberVO getMemberByMemberId(String memberId) {
		return mybatis.selectOne("MemberDAO.getMemberByMemberId", memberId);
	}
	
	public int insertMember(MemberVO vo) {
		return mybatis.insert("MemberDAO.insertMember", vo);
	}
	
	public MemberVO findId(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.findId", vo);
	}
	
	public MemberVO findPassword(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.findPassword", vo);
	}
	
	public void updatePassword(MemberVO vo) {
		mybatis.update("MemberDAO.updatePassword", vo);
	}
	
	public void updateMemberInfo(MemberVO vo) {
		mybatis.update("MemberDAO.updateMemberInfo", vo);
	}
}
