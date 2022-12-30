package com.project.login;

import com.project.manager.ManagerDTO;

public interface LoginDAO {
	ManagerDTO managerlogin(ManagerDTO managerUser);
	//CustomerDTO customerlogin(CustomerDTO customerUser);

}
