package com.kaeru.eLearning.board;

import java.util.List;

import com.kaeru.eLearning.util.Criteria;

public interface BoardService {
	
	int getTotalBoard(String word);
	
	List<BoardVO> getBoardList(String word, Criteria criteria);

	BoardVO getBoard(int bseq);

	void writeBoard(BoardVO vo);

	void deleteBoard(int bseq);

	void updateBoard(BoardVO vo);

	// 댓글용
	public int getTotalReply(int bseq);
	
	List<BoardVO> getReply(int bseq, Criteria criteria);

	void replyBoard(BoardVO vo);

	void deleteReply(BoardVO vo);
	
	
	// my page
	List<BoardVO> getBoardListByWriterId(String writerId);
}