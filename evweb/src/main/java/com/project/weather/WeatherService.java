package com.project.weather;

import java.util.List;

public interface WeatherService {
	int insert(WeatherDTO dto);
	List<WeatherDTO> readList(String location_no);
	int delete(String location_no);
	
}
