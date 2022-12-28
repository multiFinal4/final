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
	public int register(ManagerDTO dto) {
		return dao.register(dto);
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
		return dao.findByType(type) ;
	}

	@Override
	public List<ManagerDTO> findByName(String manager_name) {
		return dao.findByName(manager_name);
	}

}
