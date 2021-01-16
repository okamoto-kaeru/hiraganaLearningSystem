package com.kaeru.eLearning.worker.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaeru.eLearning.board.BoardVO;
import com.kaeru.eLearning.hiragana.HiraganaWordQuizVO;
import com.kaeru.eLearning.member.MemberVO;
import com.kaeru.eLearning.order.OrderVO;
import com.kaeru.eLearning.product.ProductVO;
import com.kaeru.eLearning.util.Criteria;
import com.kaeru.eLearning.worker.WorkerVO;

@Repository
public class WorkerDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// login관련
	public WorkerVO getWorker(WorkerVO vo) {
		return mybatis.selectOne("WorkerDAO.getWorker", vo);
	}
	
	
	// product 관련
	public int getTotalProduct(String productName) {
		return mybatis.selectOne("WorkerDAO.getTotalProduct", productName);
	}
	
	public List<ProductVO> getProductList(String productName, Criteria criteria) {
		Map<String, Object> map = new HashMap<>();
		map.put("productName", productName);
		map.put("criteria", criteria);
		return mybatis.selectList("WorkerDAO.getProductList", map);
	}
	
	public void insertProduct(ProductVO vo) {
		mybatis.insert("WorkerDAO.insertProduct", vo);
	}
	
	public void updateProduct(ProductVO vo) {
		mybatis.update("WorkerDAO.updateProduct", vo);
	}
	
	
	// order관련
	public int getTotalOrder(String memberName) {
		return mybatis.selectOne("WorkerDAO.getTotalOrder", memberName);
	}
	
	public List<OrderVO> getOrderList(String memberName, Criteria criteria) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberName", memberName);
		map.put("criteria", criteria);
		return mybatis.selectList("WorkerDAO.adminOrderList", map);
	}
	
	public void updateOrderDetail(int odseq) {
		mybatis.update("WorkerDAO.updateOrderDetail", odseq);
	}
	
	
	// 회원관리
	public int getTotalMember(String memberName) {
		return mybatis.selectOne("WorkerDAO.getTotalMember", memberName);
	}
	
	public List<MemberVO> getMemberList(String memberName, Criteria criteria) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberName", memberName);
		map.put("criteria", criteria);
		return mybatis.selectList("WorkerDAO.memberList", map);
	}
	
	public void updateMember(MemberVO vo) {
		mybatis.update("updateMember", vo);
	}
	
	
	
	// 게시판 관리
	public int getTotalBoard(String writerId) {
		return mybatis.selectOne("WorkerDAO.getTotalBoard", writerId);
	}
	
	public List<BoardVO> getBoardListByWriterId(String writerId, Criteria criteria) {
		Map<String, Object> map = new HashMap<>();
		map.put("writerId", writerId);
		map.put("criteria", criteria);
		return mybatis.selectList("WorkerDAO.getBoardListByWriterId", map);
	}
	
	
	// 히라가나 단어 관련
	public int getTotalHiraganaWord(String hiraganaWordKind) {
		return mybatis.selectOne("WorkerDAO.getTotalHiraganaWord", hiraganaWordKind);
	}
	
	public List<HiraganaWordQuizVO> getHiraganaWord(String hiraganaWordKind, Criteria criteria) {
		Map<String, Object> map = new HashMap<>();
		map.put("hiraganaWordKind", hiraganaWordKind);
		map.put("criteria", criteria);
		return mybatis.selectList("WorkerDAO.getHiraganaWord", map);
	}
	
	public HiraganaWordQuizVO getWordByhiraganaWordSeq(int hiraganaWordSeq) {
		return mybatis.selectOne("WorkerDAO.getWordByhiraganaWordSeq", hiraganaWordSeq);
	}
	
	public void insertHiraganaWord(HiraganaWordQuizVO vo) {
		mybatis.insert("WorkerDAO.insertHiraganaWord", vo);
	}
	
	public void updateHiraganaWord(HiraganaWordQuizVO vo) {
		mybatis.update("WorkerDAO.updateHiraganaWord", vo);
	}
	
	public void deleteHiraganaWord(int hiraganaWordSeq) {
		mybatis.delete("WorkerDAO.deleteHiraganaWord", hiraganaWordSeq);
	}
}
