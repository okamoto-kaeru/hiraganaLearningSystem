package com.kaeru.eLearning.address;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AddressVO> selectAddressByDong(String dong) {
		return mybatis.selectList("AddressDAO.selectAddressByDong", dong);
	}
}
