package com.project.airquality;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.station.StationDTO;

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
	public AirqualityDTO read(StationDTO station) {
		String stationname = "";
		double lon = Double.parseDouble(station.getMap_longtude());
		double lat = Double.parseDouble(station.getMap_latitude());
		String mapaddr = station.getAddr_detail().substring(0,3);
		if(mapaddr.equals("한림읍")) { //주소에서 한번 거름
			stationname = "한림읍";
		}else if(mapaddr.equals("성산읍")){
			stationname = "성산읍";
		}else if(mapaddr.equals("대정읍")){
			stationname = "대정읍";
		}else if(mapaddr.equals("애월읍")){
			stationname = "애월읍";
		}else if(mapaddr.equals("남원읍")){
			stationname = "남원읍";
		}else if(mapaddr.equals("조천읍")){
			stationname = "조천읍";
		}else { //나머지는 좌표로 대략적으로
			if(lon<=126.22) {
				if(lat<33.28) {
					stationname = "대정읍";
				}else {
					stationname = "고산리";
				}
			}else if(lon<=126.27) {
				if(lat<=33.28) {
					stationname = "대정읍";
				}else if(lat<=33.38) {
					stationname = "고산리";
				}else {
					stationname = "한림읍";
				}
			}else if(lat<=33.33) {
				if(lon<=126.37) {
					stationname = "대정읍";
				}else if(lon<=126.54) {
					stationname = "강정동";
				}else if(lon<=126.67) {
					stationname = "동홍동";
				}else {
					stationname = "남원읍";
				}
			}else if(lat>33.33) {
				if(lon<=126.30) {
					stationname = "한림읍";
				}else if(lat<=33.38 && lon<126.37) {
					stationname = "한림읍";
				}else if(lat>33.38 && lon<126.37) {
					stationname = "애월읍";
				}else if(lon<126.42) {
					stationname = "애월읍";
				}else if(lon<126.49) {
					stationname = "노형로";
				}else if(lon<126.53) {
					stationname = "연동";
				}else if(lon<126.55) {
					stationname = "이도동";
				}else if(lon<126.62) {
					stationname = "화북동";
				}else if(lon<126.82) {
					stationname = "조천읍";
				}else {
					stationname = "성산읍";
				}
			}
		}
		return dao.read(stationname);
	}

	@Override
	public List<AirqualityDTO> allReadList() {
		//System.out.println("에어퀄리티서비스임플 실행되나?????????????????????????");
		return dao.allReadList();
	}
	

}
