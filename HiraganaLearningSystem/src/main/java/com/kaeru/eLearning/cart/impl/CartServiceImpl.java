package com.kaeru.eLearning.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaeru.eLearning.cart.CartService;
import com.kaeru.eLearning.cart.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	public List<CartVO> getCartList(String memberId) {
		return cartDAO.getCartList(memberId);
	}
	
	public void insertCart(CartVO vo) {
		cartDAO.insertCart(vo);
	}
	
	public void deleteCart(int cseq) {
		cartDAO.deleteCart(cseq);
	}
	
	public void updateCart(CartVO vo) {
		cartDAO.updateCart(vo);
	}
	
}
