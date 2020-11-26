package com.kaeru.eLearning.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaeru.eLearning.board.BoardVO;
import com.kaeru.eLearning.util.Criteria;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public int getTotalBoard() {
		return mybatis.selectOne("BoardDAO.getTotalBoard");
	}
	
	public List<BoardVO> getBoardList(Criteria criteria) {
		Map<String, Object> map = new HashMap<>();
		map.put("criteria", criteria);
		return mybatis.selectList("BoardDAO.getBoardList", map);
	}
	
	public BoardVO getBoard(int bseq) {
		return mybatis.selectOne("BoardDAO.getBoard", bseq);
	}
	
	public void writeBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.writeBoard", vo);
	}
	
	public void deleteBoard(int bseq) {
		mybatis.delete("BoardDAO.deleteBoard", bseq);
	}
	
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	
	// 댓글용
	public List<BoardVO> getReply(int bseq) {
		return mybatis.selectList("BoardDAO.getReply", bseq);
	}
	
	public void replyBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.replyBoard", vo);
	}
	
	public void deleteReply(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteReply", vo);
	}

	
	// mypage용
	public List<BoardVO> getBoardListByWriterId(String writerId) {
		return mybatis.selectList("BoardDAO.getBoardListByWriterId", writerId);
	}
}
