<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.project.airquality.AirqualityDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.project.weather.WeatherUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Insert title here</title>
		<link href="/evweb/weather/css/weatherbasic.css" rel="stylesheet" type="text/css">
		<link href="/evweb/weather/css/weathercommon-ui.css" rel="stylesheet" type="text/css">
		<link href="/evweb/css/charge.css" rel="stylesheet" type="text/css">
		<script src="/evweb/js/charge.js"></script>
		<script src="/evweb/js/pdf.js"></script>
		<script src="/evweb/js/html2canvas.js"></script>
		<script src="/evweb/js/jspdf.min.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://code.highcharts.com/modules/accessibility.js"></script>
		<script type="text/javascript"> //차트에 데이터 넣기
			<%String[] yesandtoday = (String[])request.getAttribute("yesandtoday");
			  String[] yesandtoamount = (String[])request.getAttribute("yesandtoamount");
			  List<String> amountlist =  (ArrayList<String>)request.getAttribute("amountlist");
			  List<String> datelist =  (ArrayList<String>)request.getAttribute("datelist"); %>
			var stationId = "${stationId}";
			const chargedata = [<%=yesandtoamount[0]%>,<%=yesandtoamount[1]%>]
			const chargedate = ['<%=yesandtoday[0]%>','<%=yesandtoday[1]%>']
			const chargeweekdata = [];
			const date = [];
			<%for(int i=0;i<amountlist.size();i++){%>
			chargeweekdata.push([<%=amountlist.get(i)%>])
			<%}%>
			date.push(['<%=datelist.get(0)%>(월)']);
			date.push(['<%=datelist.get(1)%>(화)']);
			date.push(['<%=datelist.get(2)%>(수)']);
			date.push(['<%=datelist.get(3)%>(목)']);
			date.push(['<%=datelist.get(4)%>(금)']);
			date.push(['<%=datelist.get(5)%>(토)']);
			date.push(['<%=datelist.get(6)%>(일)']);
			$(document).ready(function() {
				$("#updateList").click(function () {
					loading();
					ajaxCall();
				});
				highchartday(chargedata,chargedate);
				highchartweek(date,chargeweekdata)
				document.getElementById('pdf').addEventListener('click', function () {
					  Highcharts.charts[1].exportChart({
					    type: 'application/pdf'
					  });
					});
			});
		</script>
		<style type="text/css">
			body, html{
				overflow-y:hidden;
			}
			#container{
				height:calc(100vh - 130px);
				overflow-y:auto; 
			}
			#chargeday {
			    height: 180px;
			}
			#chargeweek {
			    height: 250px;
			}
		</style>
	</head>
	<body>
		<div id = "pdfDiv" class="monitoringMain row">
			<h1 class="pagetitle" id="stationName">${stationInfo.station_name}</h1>
			<div>
				<button style="margin-left: 2px;" data-html2canvas-ignore="ture" id="savePdf" type="button"  class="btn btn-primary">Download PDF</button>
				<button style="margin-left: 2px;"onclick="location.href='/evweb/monitoring/download/excel.do?stationId=${stationInfo.station_id}'" data-html2canvas-ignore="ture" id="exceldown" type="button"  class="btn btn-primary">Download Excel</button>
				<button style="margin-left: 2px;"data-html2canvas-ignore="ture" id="updateList" type="button" class="btn btn-primary"><i class="bi bi-arrow-clockwise"></i> 업데이트</button>
	        </div>
	        <div class="col-lg-12 stationWrap dashboard">
				<div class="row">
					<div class="col-md-4 pd-left0">
					    <div class="card info-card sales-card">
					    	<div class="card-header"><h5 class="card-title">충전소 정보</h5></div>
				            <div class="card-body" style="height: 200px">
				              <table class="table mb-0" style="height: 100%;">
					              <tbody>
						              <tr>
							              <th scope="row" class="border-top-0">충전소 ID</th>
							              <td colspan="3" class="border-top-0">${stationInfo.station_id}</td>
						              </tr>
						              <tr>
							              <th scope="row">충전소 이름</th>
							              <td colspan="3">${stationInfo.station_name}</td>
						              </tr>
						              <tr>
							              <th scope="row">위치</th>
							              <td colspan="3">
								              ${stationInfo.addr_do} 
								              ${stationInfo.addr_sigun}
								              ${stationInfo.addr_detail}
							              </td>
						              </tr>
						              <tr>
							              <th scope="row">구분</th>
							              <td>
								              ${stationInfo.kind} 
							              </td>
							              <th scope="row">이용시간</th>
							              <td>${stationInfo.use_time}</td>
						              </tr>
					              </tbody>
				              </table>
				            </div>
			          	</div>
	            	</div>
					<div class="col-md-8 chargerInfo pr-0">
						<div class="card info-card sales-card">
							<div class="card-header">
								<h5 class="card-title">충전기 정보</h5>
							</div>
							<div class="card-body">
								<c:forEach var="charger" items="${chargerlnfo}">
									<div class="chrgrWrap d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-ev-station"></i>
										</div>
										<div class="chargerInfoMid">
											<h6>${charger.charger_id}</h6>
											<c:if test="${charger.charger_type eq '01' }">
												<span class="chrgrType">DC차데모</span>
											</c:if>
											<c:if test="${charger.charger_type eq '02' }">
												<span class="chrgrType">AC완속</span>
											</c:if>
											<c:if test="${charger.charger_type eq '03' }">
												<span class="chrgrType">DC차데모/AC3상</span>
											</c:if>
											<c:if test="${charger.charger_type eq '04' }">
												<span class="chrgrType">DC콤보</span>
											</c:if>
											<c:if test="${charger.charger_type eq '05' }">
												<span class="chrgrType">DC차데모/DC콤보</span>
											</c:if>
											<c:if test="${charger.charger_type eq '06' }">
												<span class="chrgrType">DC차데모/AC3상/DC콤보</span>
											</c:if>
											<c:if test="${charger.charger_type eq '07' }">
												<span class="chrgrType">AC3상</span>
											</c:if>
											
											<%-- 충전기상태 (1: 통신이상, 2: 충전대기,3: 충전중, 4: 운영중지,5: 점검중, 9: 상태미확인)--%>
	
											<c:if test="${charger.stat eq '1' }">
												<span class="chrgrStat err">통신이상</span>
											</c:if>
											<c:if test="${charger.stat eq '2' }">
												<span class="chrgrStat">충전대기</span>
											</c:if>
											<c:if test="${charger.stat eq '3' }">
												<span class="chrgrStat charging">충전중</span>
											</c:if>
											<c:if test="${charger.stat eq '4' }">
												<span class="chrgrStat stop">운영중지</span>
											</c:if>
											<c:if test="${charger.stat eq '5' }">
												<span class="chrgrStat fix">점검중</span>
											</c:if>
											<c:if test="${charger.stat eq '9' }">
												<span class="chrgrStat noSign">상태미확인</span>
											</c:if>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				
				
					<div class="col-xxl-4 col-md-4 pl-0">
						<div class="card info-card sales-card">
							<div class="card-header">
								<h5 class="card-title">날씨 정보</h5>
							</div>
							<% /* 날짜 정보 출력 */
		                    WeatherUtil util = new WeatherUtil();
		              	 	LocalDate now = LocalDate.now();
		                	String today = util.getDate(now, "MM.dd.");
		                    String dayOfWeekval= util.getDayOfWeek(now);
	                   		 %>
							<div class="card-body">
								<div class="current-weather">
									<div class="cmp-cmn-para odam-updated">
										<a href="/evweb/weather/getData.do?stationId=${stationInfo.station_id}&path=refresh" class="updated-at"><span><%=today%>(<%=dayOfWeekval%>)${weather.time}:00</span></a>
									</div>
									<div class="cmp-cur-weather wbg wbg-type2 BGDB00">
										<h3 class="hid">현재 날씨</h3>
										<ul class="wrap-1">
											<li class="w-icon w-temp no-w">
												<span class="hid">날씨:</span>
											<c:choose>
												<c:when test="${weather.time == '06' or weather.time == '05' or weather.time == '04' or weather.time == '03' or weather.time == '02' or weather.time == '01'
																 or weather.time == '00'  or weather.time == '23'  or weather.time == '22' or weather.time == '21' or weather.time == '20' or weather.time == '19'}">
													<c:choose>
														<c:when test="${weather.sky == '1'}"><span class="wic DB01_N" title="맑음">맑음</span></c:when>
														<c:when test="${weather.sky == '3'}"><span class="wic DB03_N" title="구름많음">구름많음</span></c:when>
														<c:when test="${weather.sky == '4'}">	
															<c:choose>
																<c:when test="${weather.pty == '1'}"><span	class="wic DB05" title="비">비</span></c:when>
																<c:when test="${weather.pty == '2'}"><span	class="wic DB06" title="비/눈">비/눈</span></c:when>
																<c:when test="${weather.pty == '3'}"><span	class="wic DB08" title="눈">눈</span></c:when>
																<c:when test="${weather.pty == '4'}"><span	class="wic DB09" title="소나기">소나기</span></c:when>
																<c:otherwise><span class="wic DB04_N" title="흐림">흐림</span></c:otherwise>
															</c:choose>
														</c:when>
													</c:choose>	
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${weather.sky == '1'}"><span class="wic DB01" title="맑음">맑음</span></c:when>
														<c:when test="${weather.sky == '3'}"><span class="wic DB03" title="구름많음">구름많음</span></c:when>
														<c:when test="${weather.sky == '4'}">	
															<c:choose>
																<c:when test="${weather.pty == '1'}"><span	class="wic DB05" title="비">비</span></c:when>
																<c:when test="${weather.pty == '2'}"><span	class="wic DB06" title="비/눈">비/눈</span></c:when>
																<c:when test="${weather.pty == '3'}"><span	class="wic DB08" title="눈">눈</span></c:when>
																<c:when test="${weather.pty == '4'}"><span	class="wic DB09" title="소나기">소나기</span></c:when>
																<c:otherwise><span class="wic DB04" title="흐림">흐림</span></c:otherwise>
															</c:choose>
														</c:when>
													</c:choose>	
												</c:otherwise>
											</c:choose>
												<span class="hid">기온:</span><span class="tmp">${weather.tmp}<small>℃</small> 
												<span class="minmax"><span>최저</span><span>${tmn}</span><span>최고</span><span>${tmx}</span></span></span><span class="chill">체감(${weather.ftmp}℃)</span></li>
										</ul>
										<ul class="wrap-2 no-underline">
											<li><span class="lbl ic-hm">습도<small>&nbsp;</small></span><span class="val">${weather.reh} <small class="unit">%</small></span></li>
											<li><span class="lbl ic-wind">바람<small>&nbsp;</small></span><span class="val">${weather.vec} ${weather.wsd}<small class="unit">m/s</small></span></li>
											<li><span class="lbl rn-hr1 ic-rn">1시간강수량</span><span 	class="val">
											<c:if test="${weather.pcp=='강수없음'}">-</c:if>  
											<c:if test="${weather.pcp!='강수없음'}">${weather.pcp}</c:if>  
											<small class="unit">mm</small></span></li>
										</ul>
									</div>
										<div class="cmp-cmn-para cmp-cur-weather-air">
											<p class="right spon"> 정보출처: <a href="https://www.weather.go.kr/w/index.do" target="_blank" title="새창열림">기상청 날씨누리</a></p>
										</div>
								</div>
							</div>
						</div>
					<script type="text/javascript">/* 범례보기 스크립트 */
					$(document).ready(function() {
						$(".cmp-cur-weather-air a").on('click', function(e) {
				            e.preventDefault();
				            var airType = $(this).attr('data-air-type');
				            $('.cmp-air-legend .shadow-box').each(function(idx,ele) {
				                var $box = $(ele);
				                if(airType == $box.attr('data-air-type')) {
				                    if(!$box.hasClass('on')) {
				                        $box.addClass('on');
				                        $box.find('.close-box').first().trigger('focus')
				                    }
				                } else {
				                    $box.removeClass('on');
				                }
				            });
				        });
					})
					</script>	
					
						<div class="card info-card sales-card">
							<div class="card-header">
								<h5 class="card-title">미세먼지 정보</h5>
							</div>
							<div class="card-body">
								<div class="cmp-cmn-para odam-updated" style="padding: 10px; ">
									<a href="/evweb/airquality/getDataDust.do?stationId=${stationId}" class="updated-at">
									<%AirqualityDTO airqualityInfo =(AirqualityDTO)request.getAttribute("airqualityInfo"); 
									  LocalDate airdate = LocalDate.parse(airqualityInfo.getDatatime().substring(0,10), DateTimeFormatter.ISO_DATE);
									  String airtime = airqualityInfo.getDatatime().substring(5,7)+"."+airqualityInfo.getDatatime().substring(8,10)
											  		 +".("+util.getDayOfWeek(airdate)+")"+airqualityInfo.getDatatime().substring(11);
									%>
									<span><%=airtime%></span></a>
								</div>	
								<div class="cmp-cur-weather cmp-cur-weather-air">
								<h3 class="hid">대기질정보</h3>
								<ul id = "wrap-3" class="wrap-2 air-wrap no-underline">
									<li><span class="lbl">초미세먼지<small>(PM2.5)</small></span>
										<strong class="air-level val">
											<c:choose>
												<c:when test="${airqualityInfo.pm25value<=15}"><span class="air-lvv-wrap air-lvv-1"></c:when>
												<c:when test="${airqualityInfo.pm25value<=35}"><span class="air-lvv-wrap air-lvv-2"></c:when>
												<c:when test="${airqualityInfo.pm25value<=75}"><span class="air-lvv-wrap air-lvv-3"></c:when>
												<c:when test="${airqualityInfo.pm25value>=76}"><span class="air-lvv-wrap air-lvv-4"></c:when>
												<c:otherwise><span class="air-lvv-wrap air-lvv-0"></c:otherwise>
											</c:choose>
											<span class="air-lvv">${airqualityInfo.pm25value}</span><small class="unit">㎍/m³</small></span>
											<span class="air-lvt" style="color: #000;">
											<c:choose>
												<c:when test="${airqualityInfo.pm25value<=15}">좋음</c:when>
												<c:when test="${airqualityInfo.pm25value<=35}">보통</c:when>
												<c:when test="${airqualityInfo.pm25value<=75}">나쁨</c:when>
												<c:when test="${airqualityInfo.pm25value>=76}">매우나쁨</c:when>
												<c:otherwise>통신장애</c:otherwise>
											</c:choose>
											<a  href="#legend" data-air-type="pm25">범례보기</a></span>
										</strong>
									</li>
									<li><span class="lbl">미세먼지<small>(PM10)</small></span> 
										<strong class="air-level val">
											<c:choose>
												<c:when test="${airqualityInfo.pm10value<=30}"><span class="air-lvv-wrap air-lvv-1"></c:when>
												<c:when test="${airqualityInfo.pm10value<=80}"><span class="air-lvv-wrap air-lvv-2"></c:when>
												<c:when test="${airqualityInfo.pm10value<=150}"><span class="air-lvv-wrap air-lvv-3"></c:when>
												<c:when test="${airqualityInfo.pm10value>=151}"><span class="air-lvv-wrap air-lvv-4"></c:when>
												<c:otherwise><span class="air-lvv-wrap air-lvv-0"></c:otherwise>
											</c:choose>
											<span class="air-lvv">${airqualityInfo.pm10value}</span><small class="unit">㎍/m³</small></span>
											<span class="air-lvt" style="color: #000;">
											<c:choose>
												<c:when test="${airqualityInfo.pm10value<=30}">좋음</c:when>
												<c:when test="${airqualityInfo.pm10value<=80}">보통</c:when>
												<c:when test="${airqualityInfo.pm10value<=150}">나쁨</c:when>
												<c:when test="${airqualityInfo.pm10value>=151}">매우나쁨</c:when>
												<c:otherwise>통신장애</c:otherwise>
											</c:choose>
											<a  href="#legend" data-air-type="pm10">범례보기</a></span>
										</strong>
									</li>
								</ul>
								<div class="cmp-air-legend">
									<div class="shadow-box" data-air-type="pm25">
										<div class="inner">
											<a href="#close" class="close-box">닫기</a>
											<h5>초미세먼지(㎛)</h5>
											<p>입자의 크기가 2.5㎛ 이하인 먼지</p>
											<ul class="air-legend">
												<li class="air-legend-1"><span>좋음<br>(0~15)
												</span></li>
												<li class="air-legend-2"><span>보통<br>(16~35)
												</span></li>
												<li class="air-legend-3"><span>나쁨<br>(36~75)
												</span></li>
												<li class="air-legend-4"><span>매우나쁨<br>(76~)
												</span></li>
											</ul>
										</div>
									</div>
									<div class="shadow-box" data-air-type="pm10">
										<div class="inner">
											<a href="#close" class="close-box">닫기</a>
											<h5>미세먼지(㎛)</h5>
											<p>입자의 크기가 10㎛ 이하인 먼지</p>
											<ul class="air-legend">
												<li class="air-legend-1"><span>좋음<br>(0~30)
												</span></li>
												<li class="air-legend-2"><span>보통<br>(31~80)
												</span></li>
												<li class="air-legend-3"><span>나쁨<br>(81~150)
												</span></li>
												<li class="air-legend-4"><span>매우나쁨<br>(151~)
												</span></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="cmp-cmn-para cmp-cur-weather-air">
								<p class="right spon">
									정보출처: <a href="http://m.airkorea.or.kr" target="_blank"
										title="새창열림">대기질정보(한국환경공단)</a>
								</p>
							</div>
						</div>
					</div>
		        </div>
				<!-- 충전량 -->
		        <div class="col-md-8 pr-0">
						<div class="card info-card sales-card " style="z-index : 1;">
							<div class="card-header">
								<h5 class="card-title">일간 충전량 <span style="float: right">${chargeAmount}kWh</span></h5>
							</div>
							<div class="card-body">
							<figure class="highcharts-figure">
						    <div id="chargeday"></div>
							</figure>
							</div>
						</div>
						<div class="card info-card sales-card" style="z-index : 0;">
							<div class="card-header">
								<h5 class="card-title">주간 충전량 <span style="float: right">${weekamount}kWh</span></h5>
							</div>
							<div class="card-body">
								<figure class="highcharts-figure">
						   		<div id="chargeweek"></div>
								</figure>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>