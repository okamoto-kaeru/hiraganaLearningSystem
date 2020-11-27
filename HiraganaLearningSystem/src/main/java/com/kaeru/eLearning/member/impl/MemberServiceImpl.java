package com.kaeru.eLearning.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaeru.eLearning.member.GradeVO;
import com.kaeru.eLearning.member.MemberService;
import com.kaeru.eLearning.member.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO getMemberByMemberId(String memberId) {
		return memberDAO.getMemberByMemberId(memberId);
	}

	@Override
	public int insertMember(MemberVO vo) {
		return memberDAO.insertMember(vo);
	}

	@Override
	public MemberVO findId(MemberVO vo) {
		return memberDAO.findId(vo);
	}

	@Override
	public MemberVO findPassword(MemberVO vo) {
		return memberDAO.findPassword(vo);
	}

	@Override
	public void updatePassword(MemberVO vo) {
		memberDAO.updatePassword(vo);
	}
}
