package com.kaeru.eLearning.address;

import java.util.List;

public interface AddressService {

	List<AddressVO> selectAddressByDong(String dong);

}