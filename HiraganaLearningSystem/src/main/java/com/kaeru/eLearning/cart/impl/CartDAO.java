package com.kaeru.eLearning.cart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaeru.eLearning.cart.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CartVO> getCartList(String memberId) {
		return mybatis.selectList("CartDAO.getCartList", memberId);
	}
	
	public void insertCart(CartVO vo) {
		mybatis.insert("CartDAO.insertCart", vo);
	}
	
	public void deleteCart(int cseq) {
		mybatis.delete("CartDAO.deleteCart", cseq);
	}
	
	public void updateCart(CartVO vo) {
		mybatis.update("CartDAO.updateCart", vo);
	}
}
