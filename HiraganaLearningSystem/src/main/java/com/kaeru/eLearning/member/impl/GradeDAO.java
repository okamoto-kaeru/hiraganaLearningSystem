package com.kaeru.eLearning.member.impl;

import java.util.List;

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
	
	public List<GradeVO> getGradeByMemberId(String memberId) {
		return mybatis.selectList("GradeDAO.getGradeByMemberId", memberId);
	}
	
	public List<GradeVO> getAverage(String memberId) {
		return mybatis.selectList("GradeDAO.getAverage", memberId);
	}
	
	// 회원가입시 성적보기 위해서 null데이터 삽입
	public void initGrade(String memberId) {
		GradeVO vo = new GradeVO();
		vo.setMemberId(memberId);
		
		vo.setHiraganaLine("あ행");
		initGradeShortCut(vo);
		
		vo.setHiraganaLine("か행");
		initGradeShortCut(vo);
		
		vo.setHiraganaLine("さ행");
		initGradeShortCut(vo);
		
		vo.setHiraganaLine("た행");
		initGradeShortCut(vo);
		
		vo.setHiraganaLine("な행");
		initGradeShortCut(vo);
		
		vo.setHiraganaLine("は행");
		initGradeShortCut(vo);
		
		vo.setHiraganaLine("ま행");
		initGradeShortCut(vo);
		
		vo.setHiraganaLine("や행");
		initGradeShortCut(vo);
		
		vo.setHiraganaLine("ら행");
		initGradeShortCut(vo);
		
		vo.setHiraganaLine("わ행");
		initGradeShortCut(vo);
	}
	
	public void initGradeShortCut(GradeVO vo) {
		vo.setWhatQuiz("hiraganaAssociativeQuiz");
		mybatis.insert("GradeDAO.initGrade", vo);
		
		vo.setWhatQuiz("hiraganaTextQuiz");
		mybatis.insert("GradeDAO.initGrade", vo);
		
		vo.setWhatQuiz("hiraganaWordQuiz");
		mybatis.insert("GradeDAO.initGrade", vo);
	}
}
