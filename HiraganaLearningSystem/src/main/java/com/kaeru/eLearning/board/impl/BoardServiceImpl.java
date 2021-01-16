package com.kaeru.eLearning.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaeru.eLearning.board.BoardService;
import com.kaeru.eLearning.board.BoardVO;
import com.kaeru.eLearning.util.Criteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	
	@Override
	public int getTotalBoard(String word) {
		return boardDAO.getTotalBoard(word);
	}
	
	@Override
	public List<BoardVO> getBoardList(String word, Criteria criteria) {
		return boardDAO.getBoardList(word, criteria);
	}

	@Override
	public BoardVO getBoard(int bseq) {
		return boardDAO.getBoard(bseq);
	}

	@Override
	public void writeBoard(BoardVO vo) {
		boardDAO.writeBoard(vo);
	}

	@Override
	public void deleteBoard(int bseq) {
		boardDAO.deleteBoard(bseq);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}
	
	@Override
	public int getTotalReply(int bseq) {
		return boardDAO.getTotalReply(bseq);
	}
	
	@Override
	public List<BoardVO> getReply(int bseq, Criteria criteria) {
		return boardDAO.getReply(bseq, criteria);
	}

	@Override
	public void replyBoard(BoardVO vo) {
		boardDAO.replyBoard(vo);
	}

	@Override
	public void deleteReply(BoardVO vo) {
		boardDAO.deleteReply(vo);
	}

	@Override
	public List<BoardVO> getBoardListByWriterId(String writerId) {
		return boardDAO.getBoardListByWriterId(writerId);
	}

}
