package com.project.weather;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class WeatherServiceImpl implements WeatherService {
	WeatherDAO dao;
	@Autowired
	public WeatherServiceImpl(WeatherDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public int insert(WeatherDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public List<WeatherDTO> readList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String day, String time) {
		// TODO Auto-generated method stub
		return 0;
	}

}
