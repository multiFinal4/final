package com.project.weather;

import java.util.List;

import javax.security.auth.Subject;

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
		String time = dto.getTime().substring(0,2);
		String tmp = dto.getTmp();
		String wsd = dto.getWsd();
		int vec = Integer.parseInt(dto.getVec());
		if(vec>337) {	dto.setVec("북풍");}
		else if(vec>293) {	dto.setVec("북서풍");	}
		else if(vec>247) {	dto.setVec("서풍");	}
		else if(vec>203) {	dto.setVec("남서풍");	}
		else if(vec>157) {	dto.setVec("남풍");	}
		else if(vec>113) {	dto.setVec("남동풍");	}
		else if(vec>67)  {	dto.setVec("동풍");	}
		else if(vec>22)  {	dto.setVec("북동풍");	}
		else {	dto.setVec("북풍"); }
		String ftmp = Double.toString(Math.round(13.12 + 0.6215*Double.parseDouble(tmp) 
						-11.37*Math.pow(Double.parseDouble(wsd)*3600/1000,0.16)
						+0.3965*Math.pow(Double.parseDouble(wsd)*3600/1000,0.16)*Double.parseDouble(tmp)));
		
		dto.setTime(time);
		dto.setFtmp(ftmp.substring(0,ftmp.indexOf(".")));
		dto.setDay(dto.getDay().substring(0, 4)+"-"+dto.getDay().substring(4, 6)+"-"+dto.getDay().substring(6));
	
		return dao.insert(dto);
	}

	@Override
	public List<WeatherDTO> readList(String station_id) {
		return dao.readList(station_id);
	}

	@Override
	public int delete(String station_id) {
		return dao.delete(station_id);
	}

	@Override
	public WeatherDTO read(String station_id, String day, String time) {
		time = time.substring(0,2);
		return dao.read(station_id, day, time);
	}

}
