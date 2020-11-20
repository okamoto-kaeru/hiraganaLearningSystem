package com.kaeru.eLearning.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kaeru.eLearning.product.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 신제품 5개를 조회
	public List<ProductVO> getNewProduct() {
		return mybatis.selectList("ProductDAO.getNewProduct");
	}
	
	// best상품 조회
	public List<ProductVO> getBestProduct() {
		return mybatis.selectList("ProductDAO.getBestProduct");
	}
	
	// pseq를 사용해서 제품정보 조회
	public ProductVO getProductByPseq(int pseq) {
		return mybatis.selectOne("ProductDAO.getProductByPseq", pseq);
	}
	
	// 팔 수 있는 모든 제품을 조회
	public List<ProductVO> getProductList() {
		return mybatis.selectList("ProductDAO.getProductList");
	}
	
	// 종류로 상품을 조회
	public List<ProductVO> getProductListByKind(String kind) {
		return mybatis.selectList("ProductDAO.getProductListByKind", kind);
	}
}
