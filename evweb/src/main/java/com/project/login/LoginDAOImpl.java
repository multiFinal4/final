package com.project.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class LoginDAOImpl implements LoginDAO {
	SqlSession session;

	@Autowired
	public LoginDAOImpl(SqlSession session) {
		super();
		this.session = session;
	}

	@Override
	public CustomerDTO login(CustomerDTO loginUser) {
		return session.selectOne("com.project.login.login", loginUser);
	}

}
