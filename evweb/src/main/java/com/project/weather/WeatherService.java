package com.project.weather;

import java.util.List;

public interface WeatherService {
	int insert(WeatherDTO dto);
	List<WeatherDTO> readList();
	int delete(String day, String time);
	
}
