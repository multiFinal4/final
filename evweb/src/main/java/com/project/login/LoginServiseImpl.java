package com.project.login;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.customer.CustomerDTO;
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
	
	@Override
	public CustomerDTO customerlogin(CustomerDTO customerUser) {
		return dao.customerlogin(customerUser);
	}

	@Override
	public CustomerDTO findId(CustomerDTO dto) {
		Random random = new Random();
		System.out.println(random.nextInt(8999)+1000);
		return dao.findId(dto);
	}

	@Override
	public String findPassword(CustomerDTO dto) {
		System.out.println(dto);
		CustomerDTO user = dao.findPassword(dto);
		if(user==null) {
			return "";
		}else{
			Random random = new Random();
			String newPass = Integer.toString(random.nextInt(8999)+1000);
			user.setPass(newPass);
			System.out.println(user);
			dao.setPassword(user);
			return newPass;
		}
		
		
		
		
	}
	 
}
