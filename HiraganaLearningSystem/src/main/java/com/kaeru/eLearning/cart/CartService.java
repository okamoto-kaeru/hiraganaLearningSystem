package com.kaeru.eLearning.cart;

import java.util.List;

public interface CartService {

	List<CartVO> getCartList(String memberId);

	void insertCart(CartVO vo);

	void deleteCart(int cseq);

	void updateCart(CartVO vo);

}