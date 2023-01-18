package com.project.monitoring;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.project.airquality.AirqualityDTO;
import com.project.charge.ChargeDTO;
import com.project.charge.ChargeService;
import com.project.charger.ChargerAPIPull;
import com.project.charger.ChargerController;
import com.project.charger.ChargerDTO;
import com.project.charger.ChargerService;
import com.project.manager.ManagerService;
import com.project.station.StationAPIPull;
import com.project.station.StationDTO;
import com.project.station.StationService;
import com.project.weather.WeatherDTO;
import com.project.weather.WeatherService;
import com.project.weather.WeatherUtil;

@Controller
public class MonitoringController {
	StationService service;
	ChargerService chargerService;
	ManagerService managerService;
	WeatherService weatherService;
	ChargeService chargeService;
	StationAPIPull stationAPIPull;
	ChargerAPIPull chargerAPIPull;
	ChargerController chargerCtrl;
	CreateExcel createExcel;
	
	public MonitoringController() {}
	@Autowired
	public MonitoringController(StationService service, ChargerService chargerService, ManagerService managerService,
			StationAPIPull stationAPIPull, ChargerAPIPull chargerAPIPull, ChargerController chargerCtrl, WeatherService weatherService, 
			ChargeService chargeService,CreateExcel createExcel) {
		super();
		this.service = service;
		this.chargerService = chargerService;
		this.managerService = managerService;
		this.stationAPIPull = stationAPIPull;
		this.chargerAPIPull = chargerAPIPull;
		this.chargerCtrl = chargerCtrl;
		this.weatherService = weatherService;
		this.chargeService = chargeService;
		this.createExcel = createExcel;
	}

	@RequestMapping("/monitoring/main")
	public ModelAndView stationList(String stationId) {
		ModelAndView mv = new ModelAndView("monitoring");
		List<StationDTO> stationlist = service.stationList();
		StationDTO stationInfo = service.read(stationId);
		List<ChargerDTO> chargerlnfo =  chargerCtrl.chargerInfo(stationId);
		
		mv.addObject("stationlist", stationlist);
		mv.addObject("stationId",stationId);
		mv.addObject("stationInfo",stationInfo);
		mv.addObject("chargerlnfo", chargerlnfo);
		
		//날씨 정보
		WeatherUtil weatherutil = new WeatherUtil();
		String code = "1"; // 0 (격자->위경도), 1 (위경도->격자)
		String[] nxny = weatherutil.changenxny(new String[]{"", code, stationInfo.getMap_longtude(),stationInfo.getMap_latitude()});
	    String nx = nxny[0];	/*예보지점의 X 좌표값*/
	    String ny = nxny[1]; 	/*예보지점의 Y 좌표값*/
		List<WeatherDTO> weatherlist = weatherService.readList(nx,ny);
		
		WeatherDTO weather = weatherService.read(nx,ny, LocalDate.now().toString(), LocalTime.now().toString());
		String tmx = weatherutil.getTmx(weatherlist, weatherutil.getDate(LocalDate.now() ,"yyyy-MM-dd"));
		String tmn = weatherutil.getTmn(weatherlist, weatherutil.getDate(LocalDate.now() ,"yyyy-MM-dd"));
		mv.addObject("weatherlist", weatherlist);
		mv.addObject("weather", weather);
		mv.addObject("tmx", tmx);
		mv.addObject("tmn", tmn);
		//충전량
		String chargeAmount = chargeService.sumchargeAmount(stationId, weatherutil.getDate(LocalDate.now(), "yyyyMMdd"));
		mv.addObject("chargeAmount", chargeAmount);
		
		//메뉴관리를 위한 변수 state
		String state = "main";
		mv.addObject("state", state);
		
		//주간 충전량
		//메뉴관리를 위한 변수 state
		//오늘 요일 구하기
		int day = LocalDate.now().getDayOfWeek().getValue(); //1:월, 7:일 
		List<String> amountlist = new ArrayList<String>();
		List<String> datelist = new ArrayList<String>();
		
		String[] yesandtoday = {weatherutil.getDate(LocalDate.now().minusDays(1), "yyyy-MM-dd"),weatherutil.getDate(LocalDate.now(), "yyyy-MM-dd")};// 어제 오늘 날짜
		String[] yesandtoamount = {chargeService.sumchargeAmount(stationId, weatherutil.getDate(LocalDate.now().minusDays(1), "yyyyMMdd")),chargeService.sumchargeAmount(stationId, weatherutil.getDate(LocalDate.now(), "yyyyMMdd"))};
		double weekamount = 0;
		for(int i=0; i<7; i++) {
			String date = weatherutil.getDate(LocalDate.now().minusDays(day).plusDays(i+1), "yyyyMMdd"); //날짜구하기 (일,월,화,수,목,금,토)
			String datebar = weatherutil.getDate(LocalDate.now().minusDays(day).plusDays(i+1), "yyyy-MM-dd"); //날짜구하기 (일,월,화,수,목,금,토)
			String amount = chargeService.sumchargeAmount(stationId, date);
			weekamount += Double.parseDouble(amount);
			datelist.add(datebar);
			amountlist.add(amount);	
		}
		mv.addObject("weekamount", String.format("%.2f",weekamount));
		mv.addObject("yesandtoday", yesandtoday);
		mv.addObject("yesandtoamount", yesandtoamount);
		mv.addObject("datelist",datelist);
		mv.addObject("amountlist",amountlist);

		
		AirqualityDTO airqualityInfo  = null;
		mv.addObject("airqualityInfo",airqualityInfo);
		
		return mv;
	}
	
	@RequestMapping("/monitoring/download/excel.do")
	public ResponseEntity<UrlResource> downexcel(String stationId,HttpSession session) throws MalformedURLException, FileNotFoundException, UnsupportedEncodingException {
		StationDTO station = service.read(stationId);
		List<ChargerDTO> chargerlist = chargerService.chargerList(stationId);
		List<ChargeDTO> chargelist = new ArrayList<ChargeDTO>();
		LocalDate today = LocalDate.now();
		WeatherUtil util = new WeatherUtil();
		double monweekamount = 0; //월간 차트의 주간충전량
		double monthamount = 0;
		for(int i=1; i<=today.lengthOfMonth(); i++) { //월간 데이터
			String date = util.getDate(today.withDayOfMonth(i),"yyyyMMdd"); // i일
			String amount = chargeService.sumchargeAmount(stationId, date);
			for(ChargeDTO dto : chargeService.list(stationId, date)) {
				dto.setCharging_date(util.getDate(today.withDayOfMonth(i),"yyyy-MM-dd"));
				chargelist.add(dto);
			}
			monweekamount += Double.parseDouble(amount);
			monthamount += Double.parseDouble(amount);
			
		}
		String filename = createExcel.createXlsx(station, chargerlist, chargelist, monweekamount, monthamount, session); //엑셀 파일 생성 및 파일이름 가져오기
		UrlResource resource = new UrlResource("file:" + WebUtils.getRealPath(session.getServletContext(), "/WEB-INF/exceldown/" + filename));
		String encodedFilename = UriUtils.encode(filename, "UTF-8");
		String mycontenttype = "attachment; filename=\"" + encodedFilename + "\"";
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, mycontenttype).body(resource);
	}
	// ajax로 충전기정보 업데이트하기
//	@RequestMapping(value = "/ajax/updateList", produces = "application/json;charset=utf-8")
//	@ResponseBody
//	public void stationUpdate() throws Exception {
//		chargerService.deleteAll();
//		service.deleteAll();
//		// 충전소 업데이트
//		for (StationDTO stationDTO : stationAPIPull.stationList()) {
//			service.insert(stationDTO);
//		}
//		// 충전기 업데이트
//		for (ChargerDTO chargerDTO : chargerAPIPull.chargerList()) {
//			chargerService.insert(chargerDTO);
//		}
//
//	}
}
