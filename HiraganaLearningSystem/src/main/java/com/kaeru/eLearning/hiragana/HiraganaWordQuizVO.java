package com.kaeru.eLearning.hiragana;

import lombok.Data;

@Data
public class HiraganaWordQuizVO {
	private int hiraganaWordSeq;
	private String hiraganaWordId;
	private String hiraganaWordKind;
	private String hiraganaWordImage;
	private String hiraganaWordSound;
	private String hiraganaLine;
}
