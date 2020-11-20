package com.kaeru.eLearning.order;

import java.util.List;

public interface OrderService {

	int getMaxOseq();

	void insertOrders(OrderVO vo);

	void insertOrderDetail(OrderVO vo);

	List<Integer> getOrderNumber(String memberId);
	
	public List<OrderVO> getOrderedNow(OrderVO vo);
	
	public List<OrderVO> getOrdered(OrderVO vo);

	List<OrderVO> getOrderList(String memberId);

	List<Integer> getAllOrderNumber(String memberId);

}