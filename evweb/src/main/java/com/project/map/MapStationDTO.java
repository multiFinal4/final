package com.project.map;

import java.util.List;

public class MapStationDTO {
	
	private String keyword;
	private List<String> company;
	private String park;
	private String quick;
	
	public MapStationDTO() {};
	public MapStationDTO(String keyword, List<String> company, String park, String quick) {
		super();
		this.keyword = keyword;
		this.company = company;
		this.park = park;
		this.quick = quick;
	}
	@Override
	public String toString() {
		return "MapStationDTO [keyword=" + keyword + ", company=" + company + ", park=" + park + ", quick=" + quick
				+ "]";
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public List<String> getCompany() {
		return company;
	}
	public void setCompany(List<String> company) {
		this.company = company;
	}
	public String getPark() {
		return park;
	}
	public void setPark(String park) {
		this.park = park;
	}
	public String getQuick() {
		return quick;
	}
	public void setQuick(String quick) {
		this.quick = quick;
	}
	
	


	
	
}
