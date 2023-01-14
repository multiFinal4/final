<%@page import="java.time.LocalDate"%>
<%@page import="com.project.weather.WeatherUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="/evweb/weather/css/weatherbasic.css" rel="stylesheet" type="text/css">
		<link href="/evweb/weather/css/weathercommon-ui.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
			var stationId = "${stationId}";
			$(document).ready(function() {
				
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
		</style>
	</head>
	<body>
		<div class="monitoringMain row d-flex">
			<h1 class="pagetitle" id="stationName">${stationInfo.station_name}</h1>
			<button id="updateList" type="button" class="btn btn-primary"><i class="bi bi-arrow-clockwise"></i> 업데이트</button>
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
											
											
											<%-- <c:choose>
												  <!-- 충전기타입(01:DC차데모,	02: AC완속,	03: DC차데모+AC3상,04: DC콤보,05: DC차데모+DC콤보,06: DC차데모+AC3상+DC콤보,	07: AC3상) -->
											      <c:when test="${charger.charger_type == '01'}">
													<span class="text-muted small pt-2 ps-1">DC차데모</span>
											      </c:when> 
											      <c:when test="${charger.charger_type == '02'}">
													<span class="text-muted small pt-2 ps-1">AC완속,</span>
											      </c:when> 
											      <c:when test="${charger.charger_type == '03'}">
													<span class="text-muted small pt-2 ps-1">DC차데모+AC3상</span>
											      </c:when> 
											      <c:when test="${charger.charger_type == '04'}">
													<span class="text-muted small pt-2 ps-1">DC콤보</span>
											      </c:when> 
											      <c:when test="${charger.charger_type == '05'}">
													<span class="text-muted small pt-2 ps-1">DC차데모+DC콤보</span>
											      </c:when> 
											      <c:when test="${charger.charger_type == '06'}">
													<span class="text-muted small pt-2 ps-1">DC차데모+AC3상+DC콤보</span>
											      </c:when> 
											      <c:otherwise>
													<span class="text-muted small pt-2 ps-1">${charger.charger_type}</span>
											      </c:otherwise> 
											</c:choose>  --%>
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
									<div class="cmp-cur-weather cmp-cur-weather-lifestyle">
										<ul class="wrap-3">
											<li><a href="/evweb/weather/getlist.do?stationId=${stationId}" class="sym-btn txt-only sym-btn-sm sym-btn-color-blue"	target="_blank" title="새창열림">날씨 예보 바로가기</a></li>
										</ul>
									</div>
									<div class="cmp-cmn-para cmp-cur-weather-air">
										<p class="right spon"> 정보출처: <a href="https://www.weather.go.kr/w/index.do" target="_blank" title="새창열림">기상청 날씨누리</a></p>
									</div>
									<div class="cmp-impact-fct">
										<p>해당지역에 발효중인 특보가 없습니다.</p>
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
									
									<div class="cmp-cur-weather cmp-cur-weather-air">
										<h3 class="hid">대기질정보</h3>
										<ul class="wrap-2 air-wrap no-underline">
											<li><span class="lbl">초미세먼지<small>(PM2.5)</small></span>
												<strong class="air-level val"><span	class="air-lvv-wrap air-lvv-2"><span class="air-lvv">27</span>
												<small class="unit">㎍/m³</small></span>
												<span class="air-lvt" style="color: #000;">보통<a  href="#legend" data-air-type="pm25">범례보기</a></span></strong></li>
												
											<li><span class="lbl">미세먼지<small>(PM10)</small></span> 
												<strong	class="air-level val"><span	class="air-lvv-wrap air-lvv-2"><span class="air-lvv">68</span>
												<small class="unit">㎍/m³</small></span>
												<span class="air-lvt" style="color: #000;">보통<a href="#legend" data-air-type="pm10">범례보기</a></span></strong></li>
											<li><span class="lbl">오존<small>(O<small>3</small>)</small></span>
												<strong class="air-level val"><span	class="air-lvv-wrap air-lvv-1"><span class="air-lvv">0.016</span>
												<small class="unit">ppm</small></span>
												<span class="air-lvt" style="color: #000;">좋음<a href="#legend"	data-air-type="o3">범례보기</a></span></strong></li>
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
											<div class="shadow-box" data-air-type="o3">
												<div class="inner">
													<a href="#close" class="close-box">닫기</a>
													<h5>오존(ppm)</h5>
													<ul class="air-legend">
														<li class="air-legend-1"><span>좋음<br>(0~0.03)
														</span></li>
														<li class="air-legend-2"><span>보통<br>(0.031~0.09)
														</span></li>
														<li class="air-legend-3"><span>나쁨<br>(0.091~0.15)
														</span></li>
														<li class="air-legend-4"><span>매우나쁨<br>(0.151~)
														</span></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
	
									<div class="cmp-cmn-para cmp-cur-weather-air">
										<p class="right">계산측정소(도시대기) 01.10.(화) 14:00 기준</p>
									</div>
	
									<div class="cmp-cmn-para cmp-cur-weather-air">
										<p class="right spon">
											정보출처: <a href="http://m.airkorea.or.kr" target="_blank"
												title="새창열림">대기질정보(한국환경공단)</a>, <a
												href="https://www.kasi.re.kr" target="_blank" title="새창열림">일출일몰정보(한국천문연구원)</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 충전량 차트 -->
					<div class="col-md-8 pr-0">
						<div class="card info-card sales-card">
							<div class="card-header">
								<h5 class="card-title">일간 충전량</h5>
								<h1>${chargeAmount}</h1>
							</div>
							<div class="card-body"></div>
						</div>
						<div class="card info-card sales-card">
							<div class="card-header">
								<h5 class="card-title">주간 충전량</h5>
							</div>
							<div class="card-body"></div>
						</div>
					</div>
				</div>
	        </div>
		</div>
	</body>
</html>