package com.kaeru.eLearning.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GradeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertGrade(String memberId) {
		mybatis.insert("GradeDAO.insertGrade", memberId);
	}
}
