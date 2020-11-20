package com.kaeru.eLearning.worker;

import java.util.List;

import com.kaeru.eLearning.board.BoardVO;
import com.kaeru.eLearning.member.MemberVO;
import com.kaeru.eLearning.order.OrderVO;
import com.kaeru.eLearning.product.ProductVO;
import com.kaeru.eLearning.util.Criteria;

public interface WorkerService {

	WorkerVO getWorker(WorkerVO vo);
	
	int isWorker(WorkerVO vo);
	
	
	// product
	public int getTotalProduct(String productName);
	
	public List<ProductVO> getProductList(String productName, Criteria criteria);
	
	public void insertProduct(ProductVO vo);
	
	public void updateProduct(ProductVO vo);
	
	
	// member
	public int getTotalMember(String memberName);
	
	public List<MemberVO> getMemberList(String memberName, Criteria criteria);
	
	public void updateMember(MemberVO vo);
	
	
	// order
	public int getTotalOrder(String memberName);
	
	public List<OrderVO> getOrderList(String memberName, Criteria criteria);
	
	public void updateOrderDetail(int odseq);
	
	
	// board
	public int getTotalBoard(String writerId);
	
	public List<BoardVO> getBoardListByWriterId(String writerId, Criteria criteria);
}