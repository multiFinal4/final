package com.project.login;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.manager.ManagerDTO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	SqlSession session;

	@Autowired
	public LoginDAOImpl(SqlSession session) {
		super();
		this.session = session;
	}

	@Override
	public ManagerDTO managerlogin(ManagerDTO managerUser) {
		return session.selectOne("com.project.login.managerlogin", managerUser);
	}
	/*
	 * @Override public CustomerDTO customerlogin(CustomerDTO customerUser); { return
	 * session.selectOne("com.project.login.customerlogin", customerUser); }
	 */
	
}
