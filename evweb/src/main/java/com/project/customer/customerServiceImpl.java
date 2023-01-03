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

	@Override
	public List<CustomerDTO> findByState(String state) {
		List<CustomerDTO> list = null;
		if(state.equals("all")) {
				list = dao.customerList();
		}else {
			list = dao.findByState(state);
		}
		return list;
	}

	@Override
	public List<CustomerDTO> findListByState(String state, String remainNo, String name) {
		List<CustomerDTO> list = null;
		if(state.equals("all")) {
				list = dao.customerList(remainNo, name);
		}else {
			list = dao.findListByState(state, remainNo, name);
		}
		return list;
	}

	@Override
	public List<CustomerDTO> customerList(String remainNo, String name) {
		return dao.customerList(remainNo, name);
	}

	@Override
	public List<CustomerDTO> findByName(String state, String name) {
		return dao.findByName(state, name);
	}

}
