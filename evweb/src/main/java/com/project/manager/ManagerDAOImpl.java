package com.project.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ManagerDAOImpl implements ManagerDAO {
	SqlSession sqlsession;
	
	@Autowired
	public ManagerDAOImpl(SqlSession sqlsession) {
		super();
		this.sqlsession = sqlsession;
	}

	@Override
	public int register(ManagerDTO dto) {
		return sqlsession.insert("com.project.manager.register", dto);
	}

	@Override
	public List<ManagerDTO> managerfind(String manager_name,String type) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("name", manager_name);	
		return sqlsession.selectList("com.project.manager.managefind", map);
	}
	@Override
	public List<ManagerDTO> findByType(String type) {
		return sqlsession.selectList("com.project.manager.findbytype", type);
	}
	@Override
	public List<ManagerDTO> findByName(String manager_name) {
		return sqlsession.selectList("com.project.manager.findbyname", manager_name);
	}
	@Override
	public int delete(String manager_id) {
		return sqlsession.update("com.project.manager.delete",manager_id);
	}
	@Override
	public boolean idCheck(String manager_id) {
		int cheak;
		cheak = sqlsession.selectOne("com.project.manager.idcheak",manager_id);
		if(cheak==0) {
			return true;
		}else {
			return false; 
		}
	}

	@Override
	public List<ManagerDTO> selectList() {
		return sqlsession.selectList("com.project.manager.list");
	}
}
