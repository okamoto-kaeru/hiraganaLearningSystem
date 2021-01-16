package com.kaeru.eLearning.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaeru.eLearning.member.GradeService;

@Service
public class GradeServiceImpl implements GradeService {
	
	@Autowired
	private GradeDAO gradeDAO;
	
	@Override
	public void insertGrade(String memberId) {
		gradeDAO.insertGrade(memberId);
	}

}
