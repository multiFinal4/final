package com.project.map;

public class MapStationDTO {
	private int rn;					// 리스트용 Rownum
	private String station_id;		// 충전소 ID
	private String station_name;	// 충전소 이름
	private String addr_do;			// 도
	private String addr_sigun;		// 시/군/구
	private String addr_detail;		// 상세주소
	private String station_company;	// 충전소 운영기관
	private String busi_call; 		// 운영기관연락처
	private String manager_id;		// 충전소 담당자
	private String service_date;	// 서비스 기간
	private int	charger_no;			// 충전기 갯수
	private String kind; 			// 충전소 구분
	private String map_code; 		// 지역구분 상세(행정구역코드 앞 2자리+법정동코드3자리)
	private String map_latitude; 	// 위도
	private String map_longtude; 	// 경도
	private String use_time; 		// 운영시간
	private String parking_free; 	//무료주차여부
	private String note; 			// 특이사항
	private String limitYn; 		// 이용제한여부
	private String limit_detail; 	// 이용제한여부 상세
	private String trafficYn; 		// 편의사항여부	

	private String standard;		// 완속요금
	private String quick;			// 급속요금
	private String superQuick;  	// 초급속요금
	private String nonmem;			// 비회원요금
	
	
	public MapStationDTO() {}
	public MapStationDTO(int rn, String station_id, String station_name, String addr_do, String addr_sigun,
			String addr_detail, String station_company, String busi_call, String manager_id, String service_date,
			int charger_no, String kind, String map_code, String map_latitude, String map_longtude, String use_time,
			String parking_free, String note, String limitYn, String limit_detail, String trafficYn, String standard,
			String quick, String superQuick, String nonmem) {
		super();
		this.rn = rn;
		this.station_id = station_id;
		this.station_name = station_name;
		this.addr_do = addr_do;
		this.addr_sigun = addr_sigun;
		this.addr_detail = addr_detail;
		this.station_company = station_company;
		this.busi_call = busi_call;
		this.manager_id = manager_id;
		this.service_date = service_date;
		this.charger_no = charger_no;
		this.kind = kind;
		this.map_code = map_code;
		this.map_latitude = map_latitude;
		this.map_longtude = map_longtude;
		this.use_time = use_time;
		this.parking_free = parking_free;
		this.note = note;
		this.limitYn = limitYn;
		this.limit_detail = limit_detail;
		this.trafficYn = trafficYn;
		this.standard = standard;
		this.quick = quick;
		this.superQuick = superQuick;
		this.nonmem = nonmem;
	}
	@Override
	public String toString() {
		return "MapStationDTO [rn=" + rn + ", station_id=" + station_id + ", station_name=" + station_name
				+ ", addr_do=" + addr_do + ", addr_sigun=" + addr_sigun + ", addr_detail=" + addr_detail
				+ ", station_company=" + station_company + ", busi_call=" + busi_call + ", manager_id=" + manager_id
				+ ", service_date=" + service_date + ", charger_no=" + charger_no + ", kind=" + kind + ", map_code="
				+ map_code + ", map_latitude=" + map_latitude + ", map_longtude=" + map_longtude + ", use_time="
				+ use_time + ", parking_free=" + parking_free + ", note=" + note + ", limitYn=" + limitYn
				+ ", limit_detail=" + limit_detail + ", trafficYn=" + trafficYn + ", standard=" + standard + ", quick="
				+ quick + ", superQuick=" + superQuick + ", nonmem=" + nonmem + "]";
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
	public String getBusi_call() {
		return busi_call;
	}
	public void setBusi_call(String busi_call) {
		this.busi_call = busi_call;
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
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getMap_code() {
		return map_code;
	}
	public void setMap_code(String map_code) {
		this.map_code = map_code;
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
	public String getUse_time() {
		return use_time;
	}
	public void setUse_time(String use_time) {
		this.use_time = use_time;
	}
	public String getParking_free() {
		return parking_free;
	}
	public void setParking_free(String parking_free) {
		this.parking_free = parking_free;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getLimitYn() {
		return limitYn;
	}
	public void setLimitYn(String limitYn) {
		this.limitYn = limitYn;
	}
	public String getLimit_detail() {
		return limit_detail;
	}
	public void setLimit_detail(String limit_detail) {
		this.limit_detail = limit_detail;
	}
	public String getTrafficYn() {
		return trafficYn;
	}
	public void setTrafficYn(String trafficYn) {
		this.trafficYn = trafficYn;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getQuick() {
		return quick;
	}
	public void setQuick(String quick) {
		this.quick = quick;
	}
	public String getSuperQuick() {
		return superQuick;
	}
	public void setSuperQuick(String superQuick) {
		this.superQuick = superQuick;
	}
	public String getNonmem() {
		return nonmem;
	}
	public void setNonmem(String nonmem) {
		this.nonmem = nonmem;
	}
	
	
	
	
}
