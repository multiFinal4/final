package com.project.login;

import com.project.customer.CustomerDTO;
import com.project.manager.ManagerDTO;

public interface LoginServise {
	ManagerDTO managerlogin(ManagerDTO managerUser);
	CustomerDTO customerlogin(CustomerDTO customerUser);
	CustomerDTO findId(CustomerDTO dto);
	String findPassword(CustomerDTO dto);
}
