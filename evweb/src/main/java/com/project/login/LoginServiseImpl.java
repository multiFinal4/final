package com.project.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.manager.ManagerDTO;

@Service
public class LoginServiseImpl implements LoginServise {
	LoginDAO dao;
	
	@Autowired
	public LoginServiseImpl(LoginDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public ManagerDTO managerlogin(ManagerDTO managerUser) {
		return dao.managerlogin(managerUser);
	}
	/*
	 * @Override public CustomerDTO customerlogin(CustomerDTO customerUser) { return
	 * dao.customerlogin(customerUser); }
	 */

	/*
	 * @Override public CustomerDTO findId(CustomerDTO dto) { // TODO Auto-generated
	 * method stub return dao.findId(dto); }
	 * 
	 * @Override public CustomerDTO findPassword(CustomerDTO dto) { return
	 * dao.findPassword(dto); }
	 */
}
