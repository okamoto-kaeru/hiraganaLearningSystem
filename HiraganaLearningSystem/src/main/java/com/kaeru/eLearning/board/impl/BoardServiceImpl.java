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
	public int getTotalBoard() {
		return boardDAO.getTotalBoard();
	}
	
	@Override
	public List<BoardVO> getBoardList(Criteria criteria) {
		return boardDAO.getBoardList(criteria);
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
	public List<BoardVO> getReply(int bseq) {
		return boardDAO.getReply(bseq);
	}

	@Override
	public void replyBoard(BoardVO vo) {
		boardDAO.replyBoard(vo);
	}

	@Override
	public void deleteReply(BoardVO vo) {
		boardDAO.deleteReply(vo);
	}

}
