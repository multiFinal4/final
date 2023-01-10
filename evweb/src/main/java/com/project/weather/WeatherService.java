package com.project.weather;

import java.util.List;

public interface WeatherService {
	int insert(WeatherDTO dto);
	List<WeatherDTO> readList(String station_id);
	int delete(String station_id);
	WeatherDTO read(String station_id, String day, String time);
}
