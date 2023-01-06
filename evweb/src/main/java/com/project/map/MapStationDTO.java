package com.project.map;

public class MapStationDTO {
	
	private String station_id;
	private String map_code;
	private String map_center;
	private String map_latitude;
	private String map_longtude;
	
	public MapStationDTO() {}
	public MapStationDTO(String station_id, String map_code, String map_center, String map_latitude,
			String map_longtude) {
		super();
		this.station_id = station_id;
		this.map_code = map_code;
		this.map_center = map_center;
		this.map_latitude = map_latitude;
		this.map_longtude = map_longtude;
	}
	@Override
	public String toString() {
		return "MapStationDTO [station_id=" + station_id + ", map_code=" + map_code + ", map_center=" + map_center
				+ ", map_latitude=" + map_latitude + ", map_longtude=" + map_longtude + "]";
	}
	
	public String getStation_id() {
		return station_id;
	}
	public void setStation_id(String station_id) {
		this.station_id = station_id;
	}
	public String getMap_code() {
		return map_code;
	}
	public void setMap_code(String map_code) {
		this.map_code = map_code;
	}
	public String getMap_center() {
		return map_center;
	}
	public void setMap_center(String map_center) {
		this.map_center = map_center;
	}
	public String getMap_latitude() {
		return map_latitude;
	}
	public void setMap_latitude(String map_latitude) {
		this.map_latitude = map_latitude;
	}
	public String getMap_longtude() {
		return map_longtude;
	}
	public void setMap_longtude(String map_longtude) {
		this.map_longtude = map_longtude;
	}
	
	
	
}
