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
}
