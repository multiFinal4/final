package com.project.charge;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.charger.ChargerService;
import com.project.station.StationDTO;
import com.project.station.StationService;
import com.project.weather.WeatherUtil;

@Controller
@RequestMapping("/charge")
public class ChargeController {
	ChargeService service;
	ChargerService chargerService;
	StationService stationService;
	@Autowired
	public ChargeController(ChargeService service, ChargerService chargerService,StationService stationService) {
		super();
		this.service = service;
		this.chargerService = chargerService;
		this.stationService = stationService;
	}
	
	@RequestMapping("/chart.do")
	public String chargeAmountChart(String stationId, Model model) throws ParseException {
		//메뉴관리를 위한 변수 state
		String state = "chart";
		LocalDate today = LocalDate.now();
		List<StationDTO> stationlist = stationService.stationList(); //메뉴의 스테이션리스트을 위한 것
		//오늘 요일 구하기
		WeatherUtil util = new WeatherUtil();
		ChargeDataPull getTime = null; //충전시간 구하기 위한 클래스
		int day = today.getDayOfWeek().getValue(); //1:월, 7:일 
		List<String> dayamountlist = new ArrayList<String>(); //주간차트에 사용하는 일별 충전량
		List<String> datelist = new ArrayList<String>(); //주간차트에 사용하는 날짜 리스트
		List<String> weekamountlist = new ArrayList<String>(); //월간 차트에 사용하는 주간 충전량
		List<String> weeklist = new ArrayList<String>(); //월간 차트에 사용하는 주 리스트
		List<ChargeDTO> chargelist = new ArrayList<ChargeDTO>(); //월간 차트에 사용하는 목록 리스트
		List<Long> chargetimelist = new ArrayList<Long>();
		double weekamount = 0; //주간 차트에 주간충전량
		double monweekamount = 0; //월간 차트의 주간충전량
		double monthamount = 0;
		for(int i=1; i<=7; i++) { //주간 데이터
			String date = util.getDate(today.minusDays(day).plusDays(i), "yyyyMMdd"); //날짜구하기 (일,월,화,수,목,금,토)
			String datebar = util.getDate(today.minusDays(day).plusDays(i), "yyyy-MM-dd"); //출력 날짜구하기 (일,월,화,수,목,금,토)
			String amount = service.sumchargeAmount(stationId, date);
			weekamount += Double.parseDouble(amount);
			datelist.add(datebar);
			dayamountlist.add(amount);	
		}
		int week = 1; 
		weeklist.add(today.getMonthValue()+"월 첫째 주"); //첫째 주
		for(int i=1; i<=today.lengthOfMonth(); i++) { //월간 데이터
			String date = util.getDate(today.withDayOfMonth(i),"yyyyMMdd"); // i일
			String amount = service.sumchargeAmount(stationId, date);
			for(ChargeDTO dto : service.list(stationId, date)) {
				dto.setCharging_date(util.getDate(today.withDayOfMonth(i),"yyyy-MM-dd"));
				chargetimelist.add(util.getChargeTime(dto.getEnd_time(), dto.getStart_time()));
				chargelist.add(dto);
			}
			monweekamount += Double.parseDouble(amount);
			monthamount += Double.parseDouble(amount);
			if(today.withDayOfMonth(i).getDayOfWeek().getValue()==7 || i == today.lengthOfMonth()) { //일요일에 주간 충전량 저장 및 초기화, 말일에 저장
				if(today.withDayOfMonth(1).getDayOfWeek().getValue()==7 && week==1) { //1일이 일요일인 경우 충전량은 첫주에 포함 
					week++;
					continue;
				}
				weekamountlist.add(String.format("%.2f", monweekamount)); //소수 둘째자리까지 저장
				monweekamount = 0; //주간 충전량 초기화
				switch (week) {
				case 2:
					weeklist.add(today.getMonthValue()+"월 둘째 주"); //
					break;
				case 3:
					weeklist.add(today.getMonthValue()+"월 셋째 주"); //
					break;
				case 4:
					weeklist.add(today.getMonthValue()+"월 넷째 주"); //
					break;
				case 5:
					weeklist.add(today.getMonthValue()+"월 다섯째 주"); //
					break;
				default:
					break;
				}
				week++;
			}
		}
		model.addAttribute("datelist",datelist);
		model.addAttribute("weeklist",weeklist);
		model.addAttribute("state",state);
		model.addAttribute("stationId",stationId);
		model.addAttribute("stationlist",stationlist);
		model.addAttribute("dayamountlist",dayamountlist);
		model.addAttribute("weekamount", String.format("%.2f",weekamount));
		model.addAttribute("monthamount", String.format("%.2f", monthamount));
		model.addAttribute("weekamountlist",weekamountlist);
		model.addAttribute("chargelist",chargelist);
		model.addAttribute("chargetimelist",chargetimelist);
		return "monitoring/chargeamount";
		
	}
}
