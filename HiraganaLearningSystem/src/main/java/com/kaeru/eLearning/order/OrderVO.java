package com.kaeru.eLearning.order;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {
	private int odseq;
	private int oseq;
	private String memberId;
	private String memberName;
	private String zipNum;
	private String address;
	private String phone;
	private Timestamp indate;
	private int pseq;
	private String productName;
	private int quantity;
	private int price2;
	private String result;
}
