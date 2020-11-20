package com.kaeru.eLearning.hiragana.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaeru.eLearning.hiragana.HiraganaService;
import com.kaeru.eLearning.hiragana.HiraganaVO;

@Service
public class HiraganaServiceImpl implements HiraganaService {
	
	@Autowired
	private HiraganaDAO hiraganaDAO;
	

	@Override
	public HiraganaVO getHiragana(String hiraganaId) {
		return hiraganaDAO.getHiragana(hiraganaId);
	}

	@Override
	public List<HiraganaVO> getHiraganaLine(String hiraganaLine) {
		return hiraganaDAO.getHiraganaLine(hiraganaLine);
	}

	@Override
	public String getHiraganaMovie(String hiraganaLine) {
		return hiraganaDAO.getHiraganaMovie(hiraganaLine);
	}
}
