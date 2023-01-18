package com.project.weather;

import java.util.List;

public interface WeatherService {
	int insert(WeatherDTO dto);
	List<WeatherDTO> readList(String nx,String ny);
	int delete(String nx,String ny);
	WeatherDTO read(String nx,String ny, String day, String time);
}
