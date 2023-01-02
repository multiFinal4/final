package com.project.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class customerServiceImpl implements customerService {
	CustomerDAO dao;
	
	@Autowired
	public customerServiceImpl(CustomerDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public int register(CustomerDTO dto) {
		
		return dao.register(dto);
	}

	@Override
	public List<CustomerDTO> customerList() {
		// TODO Auto-generated method stub
		return dao.customerList();
	}

	@Override
	public int update(CustomerDTO dto) {
	
		return dao.update(dto);
	}

	@Override
	public int delete(String customer_id) {
		
		return dao.delete(customer_id);
	}

	@Override
	public boolean idCheck(String customer_id) {
		
		return dao.idCheck(customer_id);
	}

	@Override
	public CustomerDTO getCustomerInfo(String customer_id) {
		CustomerDTO user = dao.getCustomerInfo(customer_id);
	
		return user;
	}

}
