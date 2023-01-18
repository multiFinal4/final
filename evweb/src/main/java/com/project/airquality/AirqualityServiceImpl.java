package com.project.airquality;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AirqualityServiceImpl implements AirqualityService {
	AirqualityDAO dao;

	@Autowired
	public AirqualityServiceImpl(AirqualityDAO dao) {
		super();
		this.dao = dao;
	}

	@Override
	public int insert(AirqualityDTO dto) {
		
//		if (!dto.getPm10value().equals("-")) {
//			
//		int Pm10value = Integer.parseInt(dto.getPm10value());
//			if(Pm10value > 75) 		{ 	dto.setPm10value("매우나쁨");	}
//			else if(Pm10value>35) 	{	dto.setPm10value("나쁨");	}
//			else if(Pm10value>15)	{	dto.setPm10value("보통");		}
//			else   {		 		dto.setPm10value("좋음");	}
//		}
//		
//		if(!dto.getPm25value().equals("-")) {
//			int Pm25value = Integer.parseInt(dto.getPm25value());
//			if(Pm25value > 150) 		{ 	dto.setPm25value("매우나쁨");	}
//			else if(Pm25value>80) 	{	dto.setPm25value("나쁨");	}
//			else if(Pm25value>30)	{	dto.setPm25value("보통");		}
//			else   {		 		dto.setPm25value("좋음");	}
//		}
		return dao.insert(dto);
	}

	@Override
	public List<AirqualityDTO> airqualityList(String stationname) {
		return dao.readList(stationname);
	}

	@Override
	public int delete() {
		return dao.delete();
	}

	@Override
	public AirqualityDTO read(String stationname, String datatime) {
		datatime = datatime.substring(0, 2);
		return dao.read(stationname, datatime);
	}
	
//	public StationDTO

}
