package com.project.customer;

import java.util.List;

public interface customerService {
	// ȸ������
	int register(CustomerDTO dto);
	//ȸ����Ϻ���
	List<CustomerDTO> customerList();
	//ȸ�� ����
	int update(CustomerDTO dto);
	//ȸ�� ����
	int delete(String customer_id);
	//id �ߺ� üũ
	boolean idCheck(String customer_id);
	//mypage���� ȸ������ ��ȸ
	public CustomerDTO getCustomerInfo(String customer_id);
	//회원목록 page list를 위한 메소드
	List<CustomerDTO> findByState(String state); 
	List<CustomerDTO> findListByState(String state,String remainNo, String name);
	List<CustomerDTO> customerList(String remainNo, String name);
	List<CustomerDTO> findByName(String state,String name); 
	//관리자전환
	int change(String customer_id);
	int realdelete(String customer_id);
}
