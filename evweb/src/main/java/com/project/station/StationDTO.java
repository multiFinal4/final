package com.project.station;

public class StationDTO {
	private String stationId;
	private String stationName;
	private String addrDo;
	private String addrSiGun;
	private String addrDetail;
	private String stationCom;
	private String managerId;
	private String serviceDate;
	private int chargeNo;
	
	public StationDTO() {}
	public StationDTO(String stationId, String stationName, String addrDo, String addrSiGun, String addrDetail,
			String stationCom, String managerId, String serviceDate, int chargeNo) {
		super();
		this.stationId = stationId;
		this.stationName = stationName;
		this.addrDo = addrDo;
		this.addrSiGun = addrSiGun;
		this.addrDetail = addrDetail;
		this.stationCom = stationCom;
		this.managerId = managerId;
		this.serviceDate = serviceDate;
		this.chargeNo = chargeNo;
	}
	@Override
	public String toString() {
		return "StationDTO [stationId=" + stationId + ", stationName=" + stationName + ", addrDo=" + addrDo
				+ ", addrSiGun=" + addrSiGun + ", addrDetail=" + addrDetail + ", stationCom=" + stationCom
				+ ", managerId=" + managerId + ", serviceDate=" + serviceDate + ", chargeNo=" + chargeNo + "]";
	}
	public String getStationId() {
		return stationId;
	}
	public void setStationId(String stationId) {
		this.stationId = stationId;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	public String getAddrDo() {
		return addrDo;
	}
	public void setAddrDo(String addrDo) {
		this.addrDo = addrDo;
	}
	public String getAddrSiGun() {
		return addrSiGun;
	}
	public void setAddrSiGun(String addrSiGun) {
		this.addrSiGun = addrSiGun;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getStationCom() {
		return stationCom;
	}
	public void setStationCom(String stationCom) {
		this.stationCom = stationCom;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getServiceDate() {
		return serviceDate;
	}
	public void setServiceDate(String serviceDate) {
		this.serviceDate = serviceDate;
	}
	public int getChargeNo() {
		return chargeNo;
	}
	public void setChargeNo(int chargeNo) {
		this.chargeNo = chargeNo;
	}
	
	
	
	
}   
