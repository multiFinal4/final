package com.project.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ManagerServiceImpl implements ManagerService {
	ManagerDAO dao;
	
	@Autowired
	public ManagerServiceImpl(ManagerDAO dao) {
		super();
		this.dao = dao;
	}
	@Override
	public List<ManagerDTO> selectList() {
		return dao.selectList();
	}
	@Override
	public int register(ManagerDTO dto) {
		return dao.register(dto);
	}
	@Override
	public int update(ManagerDTO manager) {
		return dao.update(manager);
	}
	@Override
	public List<ManagerDTO> managerfind(String manager_name,String type) {
		return dao.managerfind(manager_name, type);
	}
	@Override
	public int delete(String manager_id) {
		return dao.delete(manager_id);
	}
	@Override
	public List<ManagerDTO> findByType(String type) {
		List<ManagerDTO> list = null;
		if(type.equals("all")) {
				list = dao.selectList();
		}else {
			list = dao.findByType(type);
		}
		return list;
	}
	@Override
	public List<ManagerDTO> selectList(String endNo, String name) {
		return dao.selectList(endNo, name);
	}
	@Override
	public List<ManagerDTO> findListByType(String type,String endNo, String name) {
		List<ManagerDTO> list = null;
		if(type.equals("all")) {
				list = dao.selectList(endNo, name);
		}else {
			list = dao.findListByType(type, endNo, name);
		}
		return list;
	}
	@Override
	public List<ManagerDTO> findByName(String type,String name) {
		return dao.findByName(type,name);
	}
	public boolean idCheck(String manager_id) {
		return dao.idCheck(manager_id);
	}

	
	
	//조회시 연월일만 표시
	@Override
	public ManagerDTO getManagerInfo(String manager_id) {
		ManagerDTO manager = dao.getManagerInfo(manager_id);
		manager.setHire_date(manager.getHire_date().substring(0, 10));
		return manager;
	}

	
}
