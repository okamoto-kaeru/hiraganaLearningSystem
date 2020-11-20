package com.kaeru.eLearning.product;

import java.util.List;

public interface ProductService {

	// 신제품 5개를 조회
	List<ProductVO> getNewProduct();
	
	// best 상품 3개 조회
	List<ProductVO> getBestProduct();

	// pseq를 사용해서 제품정보 조회
	ProductVO getProductByPseq(int pseq);

	// 팔 수 있는 모든 제품을 조회
	List<ProductVO> getProductList();
	
	public List<ProductVO> getProductListByKind(String kind);

}