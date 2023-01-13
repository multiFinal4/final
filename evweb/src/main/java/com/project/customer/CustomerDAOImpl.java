package com.project.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class CustomerDAOImpl implements CustomerDAO {
	SqlSession sqlsession;
	
	@Autowired
	 public CustomerDAOImpl(SqlSession sqlsession) {
		super();
		this.sqlsession = sqlsession;
	}
	
	
	@Override
	public int register(CustomerDTO dto) {
	
		return sqlsession.insert("com.project.customer.register",dto);
		
	}

	@Override
	public List<CustomerDTO> customerList() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("com.project.customer.list");
	}

	@Override
	public int update(CustomerDTO user) {
		
		return sqlsession.update("com.project.customer.update", user);
	}

	@Override
	public int delete(String customer_id) {
		
		return sqlsession.delete("com.project.customer.delete", customer_id);
	}

	@Override
	public boolean idCheck(String customer_id) {
		int check;
		check = sqlsession.selectOne("com.project.customer.idcheck",customer_id);
		if(check==0) {
			return true;
		}else {
			return false;
		}
	
	}

    // ����������
	@Override
	public CustomerDTO getCustomerInfo(String customer_id) {
		
		return sqlsession.selectOne("com.project.customer.read", customer_id);
	}


	@Override
	public List<CustomerDTO> findByState(String state) {
		return sqlsession.selectList("com.project.customer.findbystate", state);
	}


	@Override
	public List<CustomerDTO> findListByState(String state, String remainNo, String name) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("state", state);
		map.put("remainNo", remainNo);
		map.put("name", name);
		return sqlsession.selectList("com.project.customer.stateSelect", map);
	
	}


	@Override
	public List<CustomerDTO> customerList(String remainNo, String name) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("remainNo", remainNo);
		map.put("name", name);	
		return sqlsession.selectList("com.project.customer.selectall",map);
	}


	@Override
	public List<CustomerDTO> findByName(String state, String name) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("state", state);
		map.put("name", name);	
		return sqlsession.selectList("com.project.customer.findbyname",map);
	
	}

	@Override
	public int change(String customer_id) {
		
		return sqlsession.delete("com.project.customer.change", customer_id);
	}
	@Override
	public int realdelete(String customer_id) {
		
		return sqlsession.delete("com.project.customer.realdelete", customer_id);
	}
}
