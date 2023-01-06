package com.project.charger;

public class ChargerDTO {
	private String station_id; 		// 충전소ID
	private String charger_id; 		// 충전기ID
	private String charger_type;	// 충전기 타입
	private String stat; 			// 충전기 상태
	private String stat_UpdDt; 		// 상태갱신일시
	private String last_Tsdt;		// 마지막 충전시작일시
	private String last_Tedt; 		// 마지막 충전종료일시
	private String now_Tsdt; 		// 충전중 시작일시
	private String output; 			// 충전용량(kW)
	private String method; 			// 충전방식 (단독/동시)
    private String delYn; 			// 충전방식충전기 정보 삭제 여부 (최근 삭제된 충전기 정보 제공)
    private String del_detail;		// 충전기 정보 삭제 사유
	
    public ChargerDTO() {};
    public ChargerDTO(String station_id, String charger_id, String charger_type, String stat, String stat_UpdDt,
			String last_Tsdt, String last_Tedt, String now_Tsdt, String output, String method, String delYn,
			String del_detail) {
		super();
		this.station_id = station_id;
		this.charger_id = charger_id;
		this.charger_type = charger_type;
		this.stat = stat;
		this.stat_UpdDt = stat_UpdDt;
		this.last_Tsdt = last_Tsdt;
		this.last_Tedt = last_Tedt;
		this.now_Tsdt = now_Tsdt;
		this.output = output;
		this.method = method;
		this.delYn = delYn;
		this.del_detail = del_detail;
	}
    
	@Override
	public String toString() {
		return "ChargerDTO [station_id=" + station_id + ", charger_id=" + charger_id + ", charger_type=" + charger_type
				+ ", stat=" + stat + ", stat_UpdDt=" + stat_UpdDt + ", last_Tsdt=" + last_Tsdt + ", last_Tedt="
				+ last_Tedt + ", now_Tsdt=" + now_Tsdt + ", output=" + output + ", method=" + method + ", delYn="
				+ delYn + ", del_detail=" + del_detail + "]";
	}

	public String getStation_id() {
		return station_id;
	}

	public void setStation_id(String station_id) {
		this.station_id = station_id;
	}

	public String getCharger_id() {
		return charger_id;
	}

	public void setCharger_id(String charger_id) {
		this.charger_id = charger_id;
	}

	public String getCharger_type() {
		return charger_type;
	}

	public void setCharger_type(String charger_type) {
		this.charger_type = charger_type;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getStat_UpdDt() {
		return stat_UpdDt;
	}

	public void setStat_UpdDt(String stat_UpdDt) {
		this.stat_UpdDt = stat_UpdDt;
	}

	public String getLast_Tsdt() {
		return last_Tsdt;
	}

	public void setLast_Tsdt(String last_Tsdt) {
		this.last_Tsdt = last_Tsdt;
	}

	public String getLast_Tedt() {
		return last_Tedt;
	}

	public void setLast_Tedt(String last_Tedt) {
		this.last_Tedt = last_Tedt;
	}

	public String getNow_Tsdt() {
		return now_Tsdt;
	}

	public void setNow_Tsdt(String now_Tsdt) {
		this.now_Tsdt = now_Tsdt;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getDel_detail() {
		return del_detail;
	}

	public void setDel_detail(String del_detail) {
		this.del_detail = del_detail;
	}

    
}   
