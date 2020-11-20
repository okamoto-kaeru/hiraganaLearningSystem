package com.kaeru.eLearning.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaeru.eLearning.order.OrderService;
import com.kaeru.eLearning.order.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public int getMaxOseq() {
		return orderDAO.getMaxOseq();
	}

	@Override
	public void insertOrders(OrderVO vo) {
		orderDAO.insertOrders(vo);
	}

	@Override
	public void insertOrderDetail(OrderVO vo) {
		orderDAO.insertOrderDetail(vo);
	}

	@Override
	public List<Integer> getOrderNumber(String memberId) {
		return orderDAO.getOrderNumber(memberId);
	}
	
	@Override
	public List<OrderVO> getOrderedNow(OrderVO vo) {
		return orderDAO.getOrderedNow(vo);
	}
	
	@Override
	public List<OrderVO> getOrdered(OrderVO vo) {
		return orderDAO.getOrdered(vo);
	}

	@Override
	public List<OrderVO> getOrderList(String memberId) {
		return orderDAO.getOrderList(memberId);
	}

	@Override
	public List<Integer> getAllOrderNumber(String memberId) {
		return orderDAO.getAllOrderNumber(memberId);
	}

}
