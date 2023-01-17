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
		String time = dto.getdatatime();
		
		int pm10 = Integer.parseInt(dto.getPm10());
			if(pm10 > 75) 		{ 	dto.setPm10("매우나쁨");	}
			else if(pm10>35) 	{	dto.setPm10("나쁨");	}
			else if(pm10>15)	{	dto.setPm10("보통");		}
			else   {		 		dto.setPm10("좋음");	}
			
			int pm25 = Integer.parseInt(dto.getPm25());
			if(pm25 > 150) 		{ 	dto.setPm25("매우나쁨");	}
			else if(pm25>80) 	{	dto.setPm25("나쁨");	}
			else if(pm25>30)	{	dto.setPm25("보통");		}
			else   {		 		dto.setPm25("좋음");	}
			
//			String ftmp = Double.toString(Math.round(13.12 + 0.6215*Double.parseDouble(tmp) 
//			-11.37*Math.pow(Double.parseDouble(wsd)*3600/1000,0.16)
//			+0.3965*Math.pow(Double.parseDouble(wsd)*3600/1000,0.16)*Double.parseDouble(tmp)));
			
			dto.setdatatime(time);
//			dto.setFtmp(ftmp.substring(0,ftmp.indexOf(".")));
		return dao.insert(dto);
		
			}

	@Override
	public List<AirqualityDTO> airqualityList(String stationname) {
		return dao.readList(stationname);
	}

	@Override
	public int delete(String stationname) {
		return dao.delete(stationname);
	}

	@Override
	public AirqualityDTO read(String stationname, String datatime) {
		datatime = datatime.substring(0, 2);
		return dao.read(stationname, datatime);
	}

}
