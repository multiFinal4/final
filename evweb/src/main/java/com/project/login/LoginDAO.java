package com.project.login;

import com.project.customer.CustomerDTO;
import com.project.manager.ManagerDTO;

public interface LoginDAO {
	ManagerDTO managerlogin(ManagerDTO managerUser);
	CustomerDTO customerlogin(CustomerDTO customerUser);
	CustomerDTO findId(CustomerDTO dto);
	CustomerDTO findPassword(CustomerDTO dto);
	int setPassword(CustomerDTO dto);
}
