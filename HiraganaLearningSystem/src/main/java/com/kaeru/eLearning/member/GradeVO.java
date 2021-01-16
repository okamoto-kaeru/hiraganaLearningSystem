package com.kaeru.eLearning.member;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GradeVO {
	private int gradeSeq;
	private String memberId;
	private String hiraganaLine;
	private String whatQuiz;
	private int score;
	private Timestamp playDate;
}
