package com.kaeru.eLearning.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaeru.eLearning.member.GradeVO;

@Repository
public class GradeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertGrade(GradeVO vo) {
		mybatis.insert("GradeDAO.insertGrade", vo);
	}
}
