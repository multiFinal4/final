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
	public List<ManagerDTO> findByName(String type,String name) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("manager_name", name);	
		return sqlsession.selectList("com.project.manager.findbyname",map);
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

	@Override
	public ManagerDTO getManagerInfo(String manager_id) {
		return sqlsession.selectOne("com.project.manager.read", manager_id);
	}

	@Override
	public int update(ManagerDTO manager) {
		return sqlsession.update("com.project.manager.update", manager);
	}

	@Override
	public List<ManagerDTO> findListByType(String type, String endNo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("endNo", endNo);
		return sqlsession.selectList("com.project.manager.typeSelect", map);
	}

	@Override
	public List<ManagerDTO> selectList(String endNo) {
		return sqlsession.selectList("com.project.manager.selectall", endNo);
	}
}
