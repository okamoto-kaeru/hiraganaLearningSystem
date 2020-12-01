package com.kaeru.eLearning.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaeru.eLearning.member.GradeService;
import com.kaeru.eLearning.member.GradeVO;

@Service
public class GradeServiceImpl implements GradeService {
	
	@Autowired
	private GradeDAO gradeDAO;
	
	@Override
	public void insertGrade(GradeVO vo) {
		gradeDAO.insertGrade(vo);
	}

	@Override
	public List<GradeVO> getGradeByMemberId(String memberId) {
		return gradeDAO.getGradeByMemberId(memberId);
	}

	@Override
	public List<GradeVO> getAverage(String memberId) {
		return gradeDAO.getAverage(memberId);
	}

	@Override
	public void initGrade(String memberId) {
		gradeDAO.initGrade(memberId);
	}

}
