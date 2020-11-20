package com.kaeru.eLearning.order.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaeru.eLearning.order.OrderVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int getMaxOseq() {
		return mybatis.selectOne("OrderDAO.getMaxOseq");
	}
	
	public void insertOrders(OrderVO vo) {
		mybatis.insert("OrderDAO.insertOrders", vo);
	}
	
	public void insertOrderDetail(OrderVO vo) {
		mybatis.insert("OrderDAO.insertOrderDetail", vo);
	}
	
	public List<Integer> getOrderNumber(String memberId) {
		return mybatis.selectList("OrderDAO.getOrderNumber", memberId);
	}
	
	public List<OrderVO> getOrderedNow(OrderVO vo) {
		return mybatis.selectList("OrderDAO.getOrderedNow", vo);
	}
	
	public List<OrderVO> getOrdered(OrderVO vo) {
		return mybatis.selectList("OrderDAO.getOrdered", vo);
	}
	
	public List<OrderVO> getOrderList(String memberId) {
		return mybatis.selectList("OrderDAO.getOrderList", memberId);
	}
	
	public List<Integer> getAllOrderNumber(String memberId) {
		return mybatis.selectList("OrderDAO.getAllOrderNumber", memberId);
	}
}
