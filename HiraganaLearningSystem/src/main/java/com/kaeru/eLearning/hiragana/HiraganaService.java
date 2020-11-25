package com.kaeru.eLearning.hiragana;

import java.util.List;

public interface HiraganaService {

	HiraganaVO getHiragana(String hiraganaId);

	List<HiraganaVO> getHiraganaLine(String hiraganaLine);
	
	public String getHiraganaMovie(String hiraganaLine);
	
	public List<HiraganaWordQuizVO> getHiraganaWordQuiz(String hiraganaLine);
}