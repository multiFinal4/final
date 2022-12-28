package com.project.manager;

import java.util.List;

public interface ManagerService {
	int register(ManagerDTO dto);
	List<ManagerDTO> managerfind(String manager_name,String type);
	int delete(String manager_id);
	List<ManagerDTO> findByType(String type); 
	List<ManagerDTO> findByName(String manager_name); 
	boolean idCheck(String manager_id);
	List<ManagerDTO> selectList();
	ManagerDTO getManagerInfo(String manager_id);
	int update(ManagerDTO manager);

}
