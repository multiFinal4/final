package com.project.charger;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChargerServiceImpl implements ChargerService{
	ChargerDAO dao;
	public ChargerServiceImpl() {};
	@Autowired
	public ChargerServiceImpl(ChargerDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public List<ChargerDTO> chargerlist() {
		return dao.chargerlist();
	}

}
