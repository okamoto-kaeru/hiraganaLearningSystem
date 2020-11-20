package com.kaeru.eLearning.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kaeru.eLearning.product.ProductService;
import com.kaeru.eLearning.product.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<ProductVO> getNewProduct() {
		return productDAO.getNewProduct();
	}
	
	@Override
	public List<ProductVO> getBestProduct() {
		return productDAO.getBestProduct();
	}

	@Override
	public ProductVO getProductByPseq(int pseq) {
		return productDAO.getProductByPseq(pseq);
	}

	@Override
	public List<ProductVO> getProductList() {
		return productDAO.getProductList();
	}

	@Override
	public List<ProductVO> getProductListByKind(String kind) {
		return productDAO.getProductListByKind(kind);
	}

}
