package com.kaeru.eLearning.product;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductVO {
	private int pseq;
	private String productName;
	private String kind;
	private int price1;
	private int price2;
	private int price3;
	private String content;
	private String image;
	private String useyn;
	private Timestamp regdate;
}
