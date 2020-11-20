package com.kaeru.eLearning.board;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	private int bseq;
	private String title;
	private String content;
	private String writerId;
	private Timestamp writeDate;
	private int replySeq;
	private String replyContent;
	private String replyId;
	private Timestamp replyDate;
}
