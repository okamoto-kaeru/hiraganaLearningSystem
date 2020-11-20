package com.kaeru.eLearning.cart;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CartVO {
	private int cseq;
	private String memberId;
	private String memberName;
	private int pseq;
	private String productName;
	private int quantity;
	private int price2;
	private Timestamp indate;	
}
