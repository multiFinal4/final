package com.project.station;

import java.util.Objects;

public class StationDTO {
	private int rn;
	private String station_id;
	private String station_name;
	private String addr_do;
	private String addr_sigun;
	private String addr_detail;
	private String station_company;
	private String manager_id;
	private String service_date;
	private int	charger_no;
	
	public StationDTO() {}

	public StationDTO(String station_company) {
		super();
		this.station_company = station_company;
	}

	
	public StationDTO(int rn, String station_id, String station_name, String addr_do, String addr_sigun,
			String addr_detail, String station_company, String manager_id, String service_date, int charger_no) {
		super();
		this.rn = rn;
		this.station_id = station_id;
		this.station_name = station_name;
		this.addr_do = addr_do;
		this.addr_sigun = addr_sigun;
		this.addr_detail = addr_detail;
		this.station_company = station_company;
		this.manager_id = manager_id;
		this.service_date = service_date;
		this.charger_no = charger_no;
	}

	//read
	public StationDTO(String station_id, String station_name, String addr_do, String addr_sigun, String addr_detail,
			String station_company, String manager_id, String service_date, int charger_no) {
		super();
		this.station_id = station_id;
		this.station_name = station_name;
		this.addr_do = addr_do;
		this.addr_sigun = addr_sigun;
		this.addr_detail = addr_detail;
		this.station_company = station_company;
		this.manager_id = manager_id;
		this.service_date = service_date;
		this.charger_no = charger_no;
	}

	// insert
	public StationDTO(String station_name, String addr_do, String addr_sigun, String addr_detail,
			String station_company, String manager_id, String service_date, int charger_no) {
		super();
		this.station_name = station_name;
		this.addr_do = addr_do;
		this.addr_sigun = addr_sigun;
		this.addr_detail = addr_detail;
		this.station_company = station_company;
		this.manager_id = manager_id;
		this.service_date = service_date;
		this.charger_no = charger_no;
	}

	@Override
	public String toString() {
		return "StationDTO [rn=" + rn + ", station_id=" + station_id + ", station_name=" + station_name + ", addr_do="
				+ addr_do + ", addr_sigun=" + addr_sigun + ", addr_detail=" + addr_detail + ", station_company="
				+ station_company + ", manager_id=" + manager_id + ", service_date=" + service_date + ", charger_no="
				+ charger_no + "]";
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getStation_id() {
		return station_id;
	}

	public void setStation_id(String station_id) {
		this.station_id = station_id;
	}

	public String getStation_name() {
		return station_name;
	}

	public void setStation_name(String station_name) {
		this.station_name = station_name;
	}

	public String getAddr_do() {
		return addr_do;
	}

	public void setAddr_do(String addr_do) {
		this.addr_do = addr_do;
	}

	public String getAddr_sigun() {
		return addr_sigun;
	}

	public void setAddr_sigun(String addr_sigun) {
		this.addr_sigun = addr_sigun;
	}

	public String getAddr_detail() {
		return addr_detail;
	}

	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}

	public String getStation_company() {
		return station_company;
	}

	public void setStation_company(String station_company) {
		this.station_company = station_company;
	}

	public String getManager_id() {
		return manager_id;
	}

	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}

	public String getService_date() {
		return service_date;
	}

	public void setService_date(String service_date) {
		this.service_date = service_date;
	}

	public int getCharger_no() {
		return charger_no;
	}

	public void setCharger_no(int charger_no) {
		this.charger_no = charger_no;
	}

	
//	@Override
//    public int hashCode() {
//        return String.valueOf(this.station_id).hashCode();
//    }
//
//    @Override
//    public boolean equals(Object obj) {
//        if (obj instanceof StationDTO) {
//            StationDTO temp = (StationDTO) obj;
//            return temp.station_id == this.station_id;
//        }
//        return false;
//    }
//
//	
//	
}   
