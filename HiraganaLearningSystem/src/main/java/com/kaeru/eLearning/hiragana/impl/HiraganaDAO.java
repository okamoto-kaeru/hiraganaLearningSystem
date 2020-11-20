package com.kaeru.eLearning.hiragana.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaeru.eLearning.hiragana.HiraganaVO;

@Repository
public class HiraganaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public HiraganaVO getHiragana(String hiraganaId) {
		return mybatis.selectOne("HiraganaDAO.getHiragana", hiraganaId);
	}
	
	public List<HiraganaVO> getHiraganaLine(String hiraganaLine) {
		return mybatis.selectList("HiraganaDAO.getHiraganaLine", hiraganaLine);
	}
	
	public String getHiraganaMovie(String hiraganaLine) {
		return mybatis.selectOne("HiraganaDAO.getHiraganaMovie", hiraganaLine);
	}
}
