package com.project.charger;

import java.util.List;
import java.util.Map;

public interface ChargerService {
	int insert(ChargerDTO charger);
	List<ChargerDTO> chargerList();
	List<ChargerDTO> chargerList(String stationId);
	List<ChargerDTO> chargerList(Map<String, Object> select);
	ChargerDTO info(String stationId, String chargerId);
	int deleteAll();
}
