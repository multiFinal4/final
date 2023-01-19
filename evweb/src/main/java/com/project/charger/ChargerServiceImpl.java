package com.project.charger;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.map.MapAPIPull;

@Service
public class ChargerServiceImpl implements ChargerService {

	ChargerDAO dao;
	
	public ChargerServiceImpl() {}
	@Autowired
	public ChargerServiceImpl(ChargerDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public int insert(ChargerDTO charger) {
		return dao.insert(charger);
	}

	@Override
	public List<ChargerDTO> chargerList() {
		return dao.chargerList();
	}

	@Override
	public List<ChargerDTO> chargerList(String stationId) {
		return dao.chargerList(stationId);
	}

	@Override
	public List<ChargerDTO> chargerList(Map<String, Object> select) {
		return null;
	}

	@Override
	public ChargerDTO info(String stationId, String chargerId) {
		return null;
	}
	@Override
	public int deleteAll() {
		return dao.deleteAll();
	}
	@Override
	public int deleteId(String stationId) {
		return dao.deleteId(stationId);
	}

}
