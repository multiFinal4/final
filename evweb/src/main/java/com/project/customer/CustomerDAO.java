package com.project.customer;

import java.util.List;

public interface CustomerDAO {
	// 회원가입
	int register(CustomerDTO dto);
	//회원목록보기
	List<CustomerDTO> customerList();
	//회원 수정
	int update(CustomerDTO dto);
	//회원 삭제
	int delete(String customer_id);
	//id 중복 체크
	boolean idCheck(String customer_id);
	//mypage에서 회원정보 조회
	public CustomerDTO getCustomerInfo(String customer_id);
	
}
