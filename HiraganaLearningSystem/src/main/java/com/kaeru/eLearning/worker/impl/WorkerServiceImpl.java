package com.kaeru.eLearning.worker.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaeru.eLearning.board.BoardVO;
import com.kaeru.eLearning.hiragana.HiraganaWordQuizVO;
import com.kaeru.eLearning.member.MemberVO;
import com.kaeru.eLearning.order.OrderVO;
import com.kaeru.eLearning.product.ProductVO;
import com.kaeru.eLearning.util.Criteria;
import com.kaeru.eLearning.worker.WorkerService;
import com.kaeru.eLearning.worker.WorkerVO;

@Service
public class WorkerServiceImpl implements WorkerService {
	
	@Autowired
	private WorkerDAO workerDAO;
	
	@Override
	public WorkerVO getWorker(WorkerVO vo) {
		return workerDAO.getWorker(vo);
	}

	@Override
	public int isWorker(WorkerVO vo) {
		WorkerVO admin = getWorker(vo);
		if(admin == null) {	// 아이디가 존재하지 않다
			return -1;
		} else if(admin.getPwd().equals(vo.getPwd())) {	// 아이디 비밀번호가 일치
			return 1;
		} else {
			return 0;  // 아이디는 있는데, 비밀번호가 틀림
		}
	}

	
	// product 관련
	@Override
	public int getTotalProduct(String productName) {
		return workerDAO.getTotalProduct(productName);
	}
	
	@Override
	public List<ProductVO> getProductList(String productName, Criteria criteria) {
		return workerDAO.getProductList(productName, criteria);
	}

	@Override
	public void insertProduct(ProductVO vo) {
		workerDAO.insertProduct(vo);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		workerDAO.updateProduct(vo);
	}

	@Override
	public int getTotalMember(String memberName) {
		return workerDAO.getTotalMember(memberName);
	}
	
	@Override
	public List<MemberVO> getMemberList(String memberName, Criteria criteria) {
		return workerDAO.getMemberList(memberName, criteria);
	}

	@Override
	public void updateMember(MemberVO vo) {
		workerDAO.updateMember(vo);
	}
	
	@Override
	public int getTotalOrder(String memberName) {
		return workerDAO.getTotalOrder(memberName);
	}

	@Override
	public List<OrderVO> getOrderList(String memberName, Criteria criteria) {
		return workerDAO.getOrderList(memberName, criteria);
	}

	@Override
	public void updateOrderDetail(int odseq) {
		workerDAO.updateOrderDetail(odseq);
	}

	@Override
	public int getTotalBoard(String writerId) {
		return workerDAO.getTotalBoard(writerId);
	}

	@Override
	public List<BoardVO> getBoardListByWriterId(String writerId, Criteria criteria) {
		return workerDAO.getBoardListByWriterId(writerId, criteria);
	}
	
	@Override
	public int getTotalHiraganaWord(String hiraganaWordKind) {
		return workerDAO.getTotalHiraganaWord(hiraganaWordKind);
	}
	
	@Override
	public List<HiraganaWordQuizVO> getHiraganaWord(String hiraganaWordKind, Criteria criteria) {
		return workerDAO.getHiraganaWord(hiraganaWordKind, criteria);
	}

	@Override
	public void insertHiraganaWord(HiraganaWordQuizVO vo) {
		workerDAO.insertHiraganaWord(vo);
	}
}
