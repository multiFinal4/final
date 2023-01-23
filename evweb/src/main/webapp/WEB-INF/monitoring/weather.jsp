<%@page import="com.project.weather.WeatherUtil"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.airquality.AirqualityDTO"%>
<%@page import="com.project.weather.WeatherDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<title>단기예보 - 기상청 날씨누리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=1551">
<meta name="format-detection" content="telephone=no">
<link rel="shortcut icon" href="/w/iphone-shortcut.png">
<link rel="apple-touch-icon-precomposed" href="/w/iphone-shortcut.png">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<link href="/evweb/weather/css/basic.css" rel="stylesheet"
	type="text/css">
<link href="/evweb/weather/css/common-ui.css" rel="stylesheet"
	type="text/css">
<link href="/evweb/weather/css/custom.css" rel="stylesheet"
	type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="/evweb/weather/js/highcharts.js"></script>
<%
ArrayList<WeatherDTO> weatherlist = (ArrayList<WeatherDTO>) request.getAttribute("weatherList");
WeatherUtil util = new WeatherUtil();
LocalDate now = LocalDate.now();
String today = util.getDate(now, "yyyy-MM-dd");
String nexttoday = util.getDate(now.plusDays(1), "yyyy-MM-dd");
String next2today = util.getDate(now.plusDays(2), "yyyy-MM-dd");
String dayOfWeekval = util.getDayOfWeek(now);
String nextDayOfWeekval = util.getDayOfWeek(now.plusDays(1));
String next2DayOfWeekval = util.getDayOfWeek(now.plusDays(2));
String tmn = util.getTmn(weatherlist, today);
String nexttmn = util.getTmn(weatherlist, nexttoday);
String next2tmn = util.getTmn(weatherlist, next2today);
String tmx = util.getTmx(weatherlist, today);
String nexttmx = util.getTmx(weatherlist, nexttoday);
String next2tmx = util.getTmx(weatherlist, next2today);
int todaysize = util.getTodaySize(weatherlist, today);
int next2todaysize = util.getTodaySize(weatherlist, next2today);
%>
<script type="text/javascript">
	$(document).ready(
			function() {
				/* 기온 차트 */
				tchartWidth = 47 * (
<%=next2todaysize%>
	+ 24 +
<%=todaysize%>
	);
				var $tchartWrap = $(
						'.cmp-dfs-slider .dfs-tab-body .slide-wrap .tchart')
						.css({
							width : tchartWidth + 'px'
						});
				var tchartId = "my-tchart";
				var $tchart = $('<div>').attr('id', tchartId).css({
					width : '100%',
					height : '100%'
				}).appendTo($tchartWrap);
				var tempList = JSON.parse($tchartWrap.attr('data-data'));
				var tchart = createTChart(tchartId, tempList[0]);
				$('.slide-wrap').css({
					width : tchartWidth + 462 + 'px'
				});

			})

	function createTChart(id, tempList) {
		var minPadding = 1.0 / (tempList.length * 2.0);
		var maxPadding = minPadding;
		var minValue = 999;
		var maxValue = -999;
		for (var i = 0; i < tempList.length; i++) {
			if (tempList[i] < -50) {
				tempList[i] = null;
				continue;
			}
			var tempValue = tempList[i];
			if (tempValue > maxValue)
				maxValue = tempValue;
			if (tempValue < minValue)
				minValue = tempValue;
		}
		var lineColor = "#009AE0", fontColor = "#000000";
		var chart = Highcharts.chart(id, {
			plotOptions : {
				series : {
					pointStart : 1
				},
				spline : {
					color : lineColor,
					dataLabels : {
						enabled : true,
						style : {
							fontSize : '14px',
							fontWeight : 'normal',
							color : fontColor,
							textOutline : false
						},
						formatter : function() {
							return this.y + '℃';
						}
					},
					enableMouseTracking : false
				}
			},
			series : [ {
				name : '',
				data : tempList,
				showInLegend : false,
				animation : false
			} ],
			yAxis : {
				min : minValue - 1,
				max : maxValue + 1,
				tickInterval : 0.1,
				gridLineColor : "rgba(0,0,0,0)",
				labels : {
					enabled : false
				},
				title : {
					enabled : false
				},
			},
			xAxis : {
				lineColor : "rgba(0,0,0,0)",
				tickColor : "rgba(0,0,0,0)",
				labels : {
					enabled : false
				},
				title : {
					enabled : false
				},
				minPadding : minPadding,
				maxPadding : maxPadding,
				margin : 0,
				padding : 0,
			},
			chart : {
				type : 'spline',
				backgroundColor : "rgba(0,0,0,0)",
				margin : 0,
				padding : 0,
				style : {
					fontFamily : "'ns', sans-serif"
				}
			},
			title : {
				text : null
			},
			credits : {
				enabled : false
			},
		});
		return chart;
	}
</script>
<style>
#header.index {
	position: relative;
}

#content {
	padding-top: 0
}

.table-col td:first-of-type {
	border-left: 1px solid #e0e6ef;
}

body {
	height: 20%;
}

footer {
	position: fixed;
	line-height: 1.45;
	letter-spacing: 0;
	font-size: 14px;
	width: 100%;
	height: 52px;
	background: #fff;
	z-index: 1001;
	border-top: 1px solid #E6E6E6;
}

header {
	width: auto;
	height: 220%;
	position: relative;
	left: 0;
	top: 0;
	z-index: 1000;
	line-height: 1.5;
	letter-spacing: 0;
}

.h1, h1 {
	font-size: 2.5rem;
	margin-bottom: 0.5rem;
	font-weight: 500;
	line-height: 1.2;
}

#centertxt {
	text-align: center;
}

pm10box {
	color: black;
	text-decoration: none;
	padding: 20px; /* 패딩: 안쪽여백, 마진: 밖여백 */
	display: inline-block; /* 인라인모드/블럭모드 이해 필요  */
	width: 70px;
	text-align: center;
	margin: 5px;
	font-size:;
}
</style>
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="cmp-dfs-slider hr1-fct">
		<h2 class="pagetitle">날씨 및 미세먼지</h2>
		<div class="row" style="float: right;">

			<h5 class="sym-btn txt-only"
				style="float: right; width: 350px; margin-left: 5px; padding-left: 5px; padding-right: 5px;">${station.station_name}</h5>
			<h5 class="sym-btn txt-only"
				style="float: right; width: 350px; margin-left: 5px; padding-left: 5px; padding-right: 5px;">${station.addr_sigun}
				${station.addr_detail}</h5>
			<button type="button"
				style="float: right; width: 140px; margin-left: 5px; padding-left: 5px; padding-right: 5px;"
				class="btn btn-secondary"
				onclick="location.href='/evweb/weather/getData.do?stationId=${stationId}&path='">업데이트</button>
		</div>
		<div class="dfs-tab-body">

			<ul class="item-lbl">
				<li>시각</li>
				<li>날씨</li>
				<li>기온</li>
				<li>체감온도</li>
				<li>강수량<small>(mm)</small></li>
				<li>강수확률</li>
				<li>바람<small>(<span class="unit">m/s</span>)
				</small></li>
				<li>습도</li>
			</ul>
			<ul class="item-lbl-graph  rain-exists">
				<li>시각</li>
				<li>날씨</li>
				<li>기온</li>
				<li class="rain">강수량<small>(mm)</small> <a href="#"
					class="pop10-toggle-btn">10분강수<span>보기</span></a>
				</li>
				<li class="snow">적설<small>(cm)</small></li>
				<li>강수확률</li>
				<li>풍향<br>풍속<small><span class="unit">(m/s)</span></small></li>
				<li>습도</li>
			</ul>
			<ul class="item-lbl-midterm">
				<li>날짜</li>
				<li>날씨</li>
				<li>기온</li>
				<li>강수확률</li>
			</ul>
			<div class="dfs-slider" tabindex="0"
				style="touch-action: pan-y pinch-zoom; width: 1920px; overflow-x: auto;">
				<div class="slide-wrap  d-flex"
					style="width: 3000px; transform: translate(0px, 0px) translateZ(0px);">
					<div class="slide ">
						<h4 class="hid">오늘</h4>

						<div class="daily" data-date="${weatherList.get(0).day}"
							data-start-time="${weatherList.get(0).time}시"
							data-start-data-time="${weatherList.get(0).time}:00"
							data-experimental="">
							<div class="daily-head">
								<span class="date"><%=weatherlist.get(0).getDay().substring(8, 10)%>일(<%=dayOfWeekval%>)</span>
								<%
								if (!tmx.equals("-")) {
								%><span class="tminmax"><span class="tmin">최저<span
										class="minval"><%=tmn%>℃</span></span><span class="tmax">최고<span
										class="maxval"><%=tmx%>℃</span></span></span>
								<%
								}
								%>
								<ul class="table-head">
									<li>시각</li>
									<li>날씨</li>
									<li>기온<br>(체감)
									</li>
									<li>강수량</li>

									<li>강수<br>확률
									</li>
									<li>바람</li>
									<li>습도</li>
								</ul>
							</div>
							<div class="item-wrap">
								<c:forEach end="<%=todaysize%>" var="weatherList"
									items="${weatherList}">
									<ul class="item vs-item  v-item-first  "
										data-date="${weatherList.day}"
										data-time="${weatherList.time}:00">
										<li><span class="hid">시각: </span><span>${weatherList.time}시</span></li>
										<c:choose>
											<c:when
												test="${weatherList.time == '06' or weatherList.time == '05' or weatherList.time == '04' or weatherList.time == '03' or weatherList.time == '02' or weatherList.time == '01'
															 or weatherList.time == '00'  or weatherList.time == '23'  or weatherList.time == '22' or weatherList.time == '21' or weatherList.time == '20' or weatherList.time == '19'}">

												<c:choose>
													<c:when test="${weatherList.sky == '1'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB01_N" title="맑음">맑음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '3'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB03_N" title="구름많음">구름많음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '4'}">
														<c:choose>
															<c:when test="${weatherList.pty == '1'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB05" title="비">비</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '2'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB06" title="비/눈">비/눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '3'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB08" title="눈">눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '4'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB09" title="소나기">소나기</span></li>
															</c:when>
															<c:otherwise>
																<li><span class="hid">날씨: </span><span
																	class="wic DB04_N" title="흐림">흐림</span></li>
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${weatherList.sky == '1'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB01" title="맑음">맑음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '3'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB03" title="구름많음">구름많음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '4'}">
														<c:choose>
															<c:when test="${weatherList.pty == '1'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB05" title="비">비</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '2'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB06" title="비/눈">비/눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '3'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB08" title="눈">눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '4'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB09" title="소나기">소나기</span></li>
															</c:when>
															<c:otherwise>
																<li><span class="hid">날씨: </span><span
																	class="wic DB04" title="흐림">흐림</span></li>
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>
											</c:otherwise>
										</c:choose>

										<li><span class="hid">기온(체감온도) </span><span
											class="hid feel">${weatherList.tmp}℃<span
												class="chill">(13℃)</span></span></li>
										<li><span class="hid">체감온도: </span><span>${weatherList.ftmp}℃</span></li>
										<c:choose>
											<c:when test="${weatherList.pcp == '강수없음'}">
												<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
											</c:when>
											<c:otherwise>
												<li class="pcp "><span class="hid">강수량: </span><span>${weatherList.pcp}</span></li>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${weatherList.pop == '0'}">
												<li><span class="hid">강수확률: </span><span>&nbsp;</span></li>
											</c:when>
											<c:otherwise>
												<li><span class="hid">강수확률: </span><span>${weatherList.pop}%</span></li>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${weatherList.vec == '북풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm N_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '북서풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm NW_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '북동풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm NE_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '남풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm S_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '남동풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm SE_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '남서풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm SW_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '서풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm W_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '동풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm E_b" title="${weatherList.vec}"></span>
											</c:when>
										</c:choose>
										<span class="wspd">${weatherList.wsd}<span class="unit">m/s</span></span>
										</li>
										<li><span class="hid">습도: </span><span>${weatherList.reh}%</span></li>
									</ul>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="slide">
						<h4 class="hid">내일</h4>
						<div class="daily" data-date="<%=nexttoday%>"
							data-start-time="01시" data-start-data-time="01:00"
							data-experimental="">
							<div class="daily-head">

								<span class="date"><%=nexttoday.substring(8, 10)%>일(<%=nextDayOfWeekval%>)</span>

								<span class="tminmax"><span class="tmin">최저<span
										class="minval"><%=nexttmn%>℃</span></span><span class="tmax">최고<span
										class="maxval"><%=nexttmx%>℃</span></span></span>

								<ul class="table-head">
									<li>시각</li>
									<li>날씨</li>
									<li>기온<br>(체감)
									</li>
									<li>강수량</li>

									<li>강수<br>확률
									</li>
									<li>바람</li>
									<li>습도</li>
								</ul>
							</div>
							<div class="item-wrap">
								<c:forEach begin="<%=todaysize+1%>" end="<%=todaysize+24%>"
									var="weatherList" items="${weatherList}">

									<ul class="item vs-item  v-item-first "
										data-date="${weatherList.day}"
										data-time="${weatherList.time}:00">
										<li><span class="hid">시각: </span><span>${weatherList.time}시</span></li>
										<c:choose>
											<c:when
												test="${weatherList.time == '06' or weatherList.time == '05' or weatherList.time == '04' or weatherList.time == '03' or weatherList.time == '02' or weatherList.time == '01'
															 or weatherList.time == '00'  or weatherList.time == '23'  or weatherList.time == '22' or weatherList.time == '21' or weatherList.time == '20' or weatherList.time == '19'}">

												<c:choose>
													<c:when test="${weatherList.sky == '1'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB01_N" title="맑음">맑음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '3'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB03_N" title="구름많음">구름많음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '4'}">
														<c:choose>
															<c:when test="${weatherList.pty == '1'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB05" title="비">비</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '2'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB06" title="비/눈">비/눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '3'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB08" title="눈">눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '4'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB09" title="소나기">소나기</span></li>
															</c:when>
															<c:otherwise>
																<li><span class="hid">날씨: </span><span
																	class="wic DB04_N" title="흐림">흐림</span></li>
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${weatherList.sky == '1'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB01" title="맑음">맑음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '3'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB03" title="구름많음">구름많음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '4'}">
														<c:choose>
															<c:when test="${weatherList.pty == '1'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB05" title="비">비</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '2'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB06" title="비/눈">비/눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '3'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB08" title="눈">눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '4'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB09" title="소나기">소나기</span></li>
															</c:when>
															<c:otherwise>
																<li><span class="hid">날씨: </span><span
																	class="wic DB04" title="흐림">흐림</span></li>
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>
											</c:otherwise>
										</c:choose>
										<li><span class="hid">기온(체감온도) </span><span
											class="hid feel">${weatherList.tmp}℃<span
												class="chill">(13℃)</span></span></li>
										<li><span class="hid">체감온도: </span><span>${weatherList.ftmp}℃</span></li>
										<c:choose>
											<c:when test="${weatherList.pcp == '강수없음'}">
												<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
											</c:when>
											<c:otherwise>
												<li class="pcp "><span class="hid">강수량: </span><span>${weatherList.pcp}</span></li>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${weatherList.pop == '0'}">
												<li><span class="hid">강수확률: </span><span>&nbsp;</span></li>
											</c:when>
											<c:otherwise>
												<li><span class="hid">강수확률: </span><span>${weatherList.pop}%</span></li>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${weatherList.vec == '북풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm N_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '북서풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm NW_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '북동풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm NE_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '남풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm S_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '남동풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm SE_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '남서풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm SW_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '서풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm W_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '동풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm E_b" title="${weatherList.vec}"></span>
											</c:when>
										</c:choose>
										<span class="wspd">${weatherList.wsd}<span class="unit">m/s</span></span>
										</li>
										<li><span class="hid">습도: </span><span>${weatherList.reh}%</span></li>
									</ul>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="slide">
						<h4 class="hid">모레</h4>
						<div class="daily" data-date="<%=next2today%>"
							data-start-time="01시" data-start-data-time="01:00"
							data-experimental="">
							<div class="daily-head">

								<span class="date"><%=next2today.substring(8, 10)%>일(<%=next2DayOfWeekval%>)</span>

								<span class="tminmax"><span class="tmin">최저<span
										class="minval"><%=next2tmn%>℃</span></span><span class="tmax">최고<span
										class="maxval"><%=next2tmx%>℃</span></span></span>

								<ul class="table-head">
									<li>시각</li>
									<li>날씨</li>
									<li>기온<br>(체감)
									</li>
									<li>강수량</li>

									<li>강수<br>확률
									</li>
									<li>바람</li>
									<li>습도</li>
								</ul>
							</div>
							<div class="item-wrap">
								<c:forEach begin="<%=todaysize+25%>"
									end="<%=todaysize+24+next2todaysize%>" var="weatherList"
									items="${weatherList}">

									<ul class="item vs-item  v-item-first "
										data-date="${weatherList.day}"
										data-time="${weatherList.time}:00">
										<li><span class="hid">시각: </span><span>${weatherList.time}시</span></li>
										<c:choose>
											<c:when
												test="${weatherList.time == '06' or weatherList.time == '05' or weatherList.time == '04' or weatherList.time == '03' or weatherList.time == '02' or weatherList.time == '01'
															 or weatherList.time == '00'  or weatherList.time == '23'  or weatherList.time == '22' or weatherList.time == '21' or weatherList.time == '20' or weatherList.time == '19'}">

												<c:choose>
													<c:when test="${weatherList.sky == '1'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB01_N" title="맑음">맑음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '3'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB03_N" title="구름많음">구름많음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '4'}">
														<c:choose>
															<c:when test="${weatherList.pty == '1'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB05" title="비">비</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '2'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB06" title="비/눈">비/눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '3'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB08" title="눈">눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '4'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB09" title="소나기">소나기</span></li>
															</c:when>
															<c:otherwise>
																<li><span class="hid">날씨: </span><span
																	class="wic DB04_N" title="흐림">흐림</span></li>
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${weatherList.sky == '1'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB01" title="맑음">맑음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '3'}">
														<li><span class="hid">날씨: </span><span
															class="wic DB03" title="구름많음">구름많음</span></li>
													</c:when>
													<c:when test="${weatherList.sky == '4'}">
														<c:choose>
															<c:when test="${weatherList.pty == '1'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB05" title="비">비</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '2'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB06" title="비/눈">비/눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '3'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB08" title="눈">눈</span></li>
															</c:when>
															<c:when test="${weatherList.pty == '4'}">
																<li><span class="hid">날씨: </span><span
																	class="wic DB09" title="소나기">소나기</span></li>
															</c:when>
															<c:otherwise>
																<li><span class="hid">날씨: </span><span
																	class="wic DB04" title="흐림">흐림</span></li>
															</c:otherwise>
														</c:choose>
													</c:when>
												</c:choose>
											</c:otherwise>
										</c:choose>
										<li><span class="hid">기온(체감온도) </span><span
											class="hid feel">${weatherList.tmp}℃<span
												class="chill">(13℃)</span></span></li>
										<li><span class="hid">체감온도: </span><span>${weatherList.ftmp}℃</span></li>
										<c:choose>
											<c:when test="${weatherList.pcp == '강수없음'}">
												<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
											</c:when>
											<c:otherwise>
												<li class="pcp "><span class="hid">강수량: </span><span>${weatherList.pcp}</span></li>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${weatherList.pop == '0'}">
												<li><span class="hid">강수확률: </span><span>&nbsp;</span></li>
											</c:when>
											<c:otherwise>
												<li><span class="hid">강수확률: </span><span>${weatherList.pop}%</span></li>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${weatherList.vec == '북풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm N_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '북서풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm NW_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '북동풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm NE_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '남풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm S" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '남동풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm SE_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '남서풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm SW_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '서풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm W_b" title="${weatherList.vec}"></span>
											</c:when>
											<c:when test="${weatherList.vec == '동풍'}">
												<li><span class="hid">바람: </span><span
													class="wdic sm E_b" title="${weatherList.vec}"></span>
											</c:when>
										</c:choose>
										<span class="wspd">${weatherList.wsd}<span class="unit">m/s</span></span>
										</li>
										<li><span class="hid">습도: </span><span>${weatherList.reh}%</span></li>
									</ul>
								</c:forEach>
							</div>
						</div>
					</div>


					<div class="tchart"
						data-data="[[<%for (int i = 0; i < next2todaysize + 24 + todaysize; i++) {%><%=weatherlist.get(i).getTmp()%><%if (i == (next2todaysize + 23 + todaysize)) {
	break;
}%>,<%}%>]]"
						style="width: 100%;">
						<div id="my-tchart" data-highcharts-chart="0"
							style="width: 100%; height: 100%;">
							<div id="highcharts-admbqg1-0" dir="ltr"
								class="highcharts-container "
								style="position: relative; overflow: hidden; width: 3000px; height: 100px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: ns, sans-serif;">
								<svg version="1.1" class="highcharts-root"
									style="font-family: 'ns', sans-serif; font-size: 12px;"
									xmlns="http://www.w3.org/2000/svg" width="3000" height="100"
									viewBox="0 0 3000 100">
									<desc>Created with Highcharts 6.1.2</desc>
									<defs>
									<clipPath id="highcharts-admbqg1-1">
									<rect x="0" y="0" width="3000" height="100" fill="none"></rect></clipPath></defs>
									<rect fill="rgba(0,0,0,0)" class="highcharts-background" x="0"
										y="0" width="100%" height="100" rx="0" ry="0"></rect>
									<rect fill="none" class="highcharts-plot-background" x="0"
										y="0" width="3000" height="100"></rect>
									<g class="highcharts-grid highcharts-xaxis-grid "
										data-z-index="1">
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 69.5 0 L 69.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 163.5 0 L 163.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 257.5 0 L 257.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 351.5 0 L 351.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 445.5 0 L 445.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 539.5 0 L 539.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 633.5 0 L 633.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 727.5 0 L 727.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 821.5 0 L 821.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 915.5 0 L 915.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1009.5 0 L 1009.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1103.5 0 L 1103.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1197.5 0 L 1197.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1291.5 0 L 1291.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1385.5 0 L 1385.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1479.5 0 L 1479.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1573.5 0 L 1573.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1667.5 0 L 1667.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1761.5 0 L 1761.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1855.5 0 L 1855.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 1949.5 0 L 1949.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2044.5 0 L 2044.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2138.5 0 L 2138.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2232.5 0 L 2232.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2326.5 0 L 2326.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2420.5 0 L 2420.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2514.5 0 L 2514.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2608.5 0 L 2608.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2702.5 0 L 2702.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2796.5 0 L 2796.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2890.5 0 L 2890.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 2984.5 0 L 2984.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 3078.5 0 L 3078.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 3172.5 0 L 3172.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 3266.5 0 L 3266.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 3360.5 0 L 3360.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 3454.5 0 L 3454.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 3548.5 0 L 3548.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 3642.5 0 L 3642.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 3736.5 0 L 3736.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 3830.5 0 L 3830.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 3924.5 0 L 3924.5 100" opacity="1"></path>
									<path fill="none" data-z-index="1" class="highcharts-grid-line"
										d="M 4018.5 0 L 4018.5 100" opacity="1"></path></g>
									<g class="highcharts-grid highcharts-yaxis-grid "
										data-z-index="1">
									<path fill="none" stroke="rgba(0,0,0,0)" stroke-width="1"
										data-z-index="1" class="highcharts-grid-line"
										d="M 0 100.5 L 3000 100.5" opacity="1"></path>
									<path fill="none" stroke="rgba(0,0,0,0)" stroke-width="1"
										data-z-index="1" class="highcharts-grid-line"
										d="M 0 83.5 L 3000 83.5" opacity="1"></path>
									<path fill="none" stroke="rgba(0,0,0,0)" stroke-width="1"
										data-z-index="1" class="highcharts-grid-line"
										d="M 0 67.5 L 3000 67.5" opacity="1"></path>
									<path fill="none" stroke="rgba(0,0,0,0)" stroke-width="1"
										data-z-index="1" class="highcharts-grid-line"
										d="M 0 50.5 L 3000 50.5" opacity="1"></path>
									<path fill="none" stroke="rgba(0,0,0,0)" stroke-width="1"
										data-z-index="1" class="highcharts-grid-line"
										d="M 0 33.5 L 3000 33.5" opacity="1"></path>
									<path fill="none" stroke="rgba(0,0,0,0)" stroke-width="1"
										data-z-index="1" class="highcharts-grid-line"
										d="M 0 17.5 L 3000 17.5" opacity="1"></path>
									<path fill="none" stroke="rgba(0,0,0,0)" stroke-width="1"
										data-z-index="1" class="highcharts-grid-line"
										d="M 0 -0.5 L 3000 -0.5" opacity="1"></path></g>
									<rect fill="none" class="highcharts-plot-border"
										data-z-index="1" x="0" y="0" width="3000" height="100"></rect>
									<g class="highcharts-axis highcharts-xaxis " data-z-index="2">
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 69.5 100 L 69.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 163.5 100 L 163.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 257.5 100 L 257.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 351.5 100 L 351.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 445.5 100 L 445.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 539.5 100 L 539.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 633.5 100 L 633.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 727.5 100 L 727.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 821.5 100 L 821.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 915.5 100 L 915.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1009.5 100 L 1009.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1103.5 100 L 1103.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1197.5 100 L 1197.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1291.5 100 L 1291.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1385.5 100 L 1385.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1479.5 100 L 1479.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1573.5 100 L 1573.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1667.5 100 L 1667.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1761.5 100 L 1761.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1855.5 100 L 1855.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 1949.5 100 L 1949.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2044.5 100 L 2044.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2138.5 100 L 2138.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2232.5 100 L 2232.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2326.5 100 L 2326.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2420.5 100 L 2420.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2514.5 100 L 2514.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2608.5 100 L 2608.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2702.5 100 L 2702.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2796.5 100 L 2796.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2890.5 100 L 2890.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 2984.5 100 L 2984.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 3078.5 100 L 3078.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 3172.5 100 L 3172.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 3266.5 100 L 3266.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 3360.5 100 L 3360.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 3454.5 100 L 3454.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 3548.5 100 L 3548.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 3642.5 100 L 3642.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 3736.5 100 L 3736.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 3830.5 100 L 3830.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 3924.5 100 L 3924.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-tick"
										stroke="rgba(0,0,0,0)" stroke-width="1"
										d="M 4018.5 100 L 4018.5 110" opacity="1"></path>
									<path fill="none" class="highcharts-axis-line"
										stroke="rgba(0,0,0,0)" stroke-width="1" data-z-index="7"
										d="M 0 100.5 L 3000 100.5"></path></g>
									<g class="highcharts-axis highcharts-yaxis " data-z-index="2">
									<path fill="none" class="highcharts-axis-line" data-z-index="7"
										d="M 0 0 L 0 100"></path></g>
                          <g class="highcharts-series-group"
										data-z-index="3">
									<g data-z-index="0.1"
										class="highcharts-series highcharts-series-0 highcharts-spline-series "
										transform="translate(0,0) scale(1 1)"
										clip-path="url(#highcharts-admbqg1-1)">
									<path fill="none"
										d="M 23.229885057471 36.20689655172414 C 23.229885057471 36.20689655172414 51.4336984448952 30.45977011494253 70.236240703178 30.45977011494253 C 89.0387829614588 30.45977011494253 98.4400540905992 33.908045977011696 117.24259634888 36.20689655172414 C 136.045138607164 38.50574712643699 145.44640973630598 39.65517241379312 164.24895199459 41.954022988505756 C 183.051494252874 44.2528735632184 192.45276538201603 45.402298850574475 211.2553076403 47.70114942528736 C 230.05784989858003 49.99999999999976 239.45912102772 51.149425287356564 258.261663286 53.44827586206897 C 277.064205544284 55.747126436781855 286.465476673426 56.896551724137936 305.26801893171 59.19540229885058 C 324.070561189994 61.49425287356323 333.471832319136 62.64367816091929 352.27437457742 64.94252873563218 C 371.0769168357 67.24137931034458 380.47818796484 70.6896551724138 399.28073022312 70.6896551724138 C 418.0832724814039 70.6896551724138 427.484543610546 70.6896551724138 446.28708586883 70.6896551724138 C 465.089628127114 70.6896551724138 474.49089925625594 74.1379310344825 493.29344151454 76.4367816091954 C 512.09598377282 78.7356321839078 521.4972549019601 82.183908045977 540.29979716024 82.183908045977 C 559.102339418524 82.183908045977 568.503610547666 82.183908045977 587.30615280595 82.183908045977 C 606.1086950642341 82.183908045977 615.509966193376 82.183908045977 634.31250845166 82.183908045977 C 653.1150507099401 82.183908045977 662.5163218390801 87.93103448275862 681.31886409736 87.93103448275862 C 700.121406355644 87.93103448275862 709.5226774847858 87.93103448275862 728.32521974307 87.93103448275862 C 747.127762001354 87.93103448275862 756.529033130496 87.93103448275862 775.33157538878 87.93103448275862 C 794.13411764706 87.93103448275862 803.5353887762001 93.67816091954023 822.33793103448 93.67816091954023 C 841.140473292764 93.67816091954023 850.541744421906 93.67816091954023 869.34428668019 93.67816091954023 C 888.1468289384741 93.67816091954023 897.548100067616 93.67816091954023 916.3506423259 93.67816091954023 C 935.15318458418 93.67816091954023 944.5544557133201 93.67816091954023 963.3569979716 93.67816091954023 C 982.1595402298801 93.67816091954023 991.56081135902 93.67816091954023 1010.3633536173 93.67816091954023 C 1029.1658958755802 93.67816091954023 1038.56716700472 91.37931034482757 1057.369709263 87.93103448275862 C 1076.17225152128 84.48275862068965 1085.57352265042 82.18390804597702 1104.3760649087 76.4367816091954 C 1123.17860716698 70.6896551724138 1132.57987829612 63.79310344827588 1151.3824205544 59.19540229885058 C 1170.18496281268 54.59770114942529 1179.58623394182 55.74712643678161 1198.3887762001 53.44827586206897 C 1217.19131845838 51.14942528735632 1226.59258958752 50.000000000000014 1245.3951318458 47.70114942528736 C 1264.1976741040799 45.40229885057473 1273.59894523322 41.954022988505756 1292.4014874915 41.954022988505756 C 1311.20402974982 41.954022988505756 1320.60530087898 41.954022988505756 1339.4078431373 41.954022988505756 C 1358.21038539558 41.954022988505756 1367.61165652472 41.954022988505756 1386.414198783 41.954022988505756 C 1405.2167410412799 41.954022988505756 1414.6180121704201 45.40229885057473 1433.4205544287 47.70114942528736 C 1452.22309668698 50.000000000000014 1461.6243678161197 51.14942528735631 1480.4269100744 53.44827586206897 C 1499.22945233268 55.7471264367816 1508.63072346182 56.896551724137936 1527.4332657201 59.19540229885058 C 1546.23580797838 61.49425287356323 1555.6370791075199 64.94252873563218 1574.4396213658 64.94252873563218 C 1593.24216362408 64.94252873563218 1602.64343475322 64.94252873563218 1621.4459770115 64.94252873563218 C 1640.24851926978 64.94252873563218 1649.6497903989198 70.6896551724138 1668.4523326572 70.6896551724138 C 1687.25487491548 70.6896551724138 1696.6561460446198 70.6896551724138 1715.4586883029 70.6896551724138 C 1734.2612305611801 70.6896551724138 1743.66250169032 70.6896551724138 1762.4650439486 70.6896551724138 C 1781.2675862068802 70.6896551724138 1790.66885733602 70.6896551724138 1809.4713995943 70.6896551724138 C 1828.2739418525803 70.6896551724138 1837.67521298172 76.4367816091954 1856.47775524 76.4367816091954 C 1875.2802974982799 76.4367816091954 1884.68156862742 76.4367816091954 1903.4841108857 76.4367816091954 C 1922.28665314398 76.4367816091954 1931.68792427312 76.4367816091954 1950.4904665314 76.4367816091954 C 1969.2930087896798 76.4367816091954 1978.69427991882 76.4367816091954 1997.4968221771 76.4367816091954 C 2016.2993644354203 76.4367816091954 2025.7006355645797 76.4367816091954 2044.5031778229 76.4367816091954 C 2063.3057200811795 76.4367816091954 2072.70699121032 70.6896551724138 2091.5095334686 70.6896551724138 C 2110.31207572688 70.6896551724138 2119.7133468560196 70.6896551724138 2138.5158891143 70.6896551724138 C 2157.31843137258 70.6896551724138 2166.7197025017203 68.3908045977011 2185.52224476 64.94252873563218 C 2204.32478701828 61.49425287356318 2213.72605814742 58.04597701149425 2232.5286004057 53.44827586206897 C 2251.3311426639802 48.85057471264368 2260.73241379312 45.40229885057472 2279.5349560514 41.954022988505756 C 2298.33749830968 38.50574712643679 2307.73876943882 38.50574712643679 2326.5413116971 36.20689655172414 C 2345.34385395538 33.9080459770115 2354.74512508452 30.45977011494253 2373.5476673428 30.45977011494253 C 2392.35020960108 30.45977011494253 2401.75148073022 30.45977011494253 2420.5540229885 30.45977011494253 C 2439.3565652467796 30.45977011494253 2448.75783637592 30.45977011494253 2467.5603786342 30.45977011494253 C 2486.3629208924804 30.45977011494253 2495.76419202162 30.45977011494253 2514.5667342799 30.45977011494253 C 2533.3692765381797 30.45977011494253 2542.7705476673204 33.908045977011525 2561.5730899256 36.20689655172414 C 2580.37563218388 38.505747126436816 2589.77690331302 39.65517241379312 2608.5794455713 41.954022988505756 C 2627.38198782958 44.2528735632184 2636.78325895872 45.40229885057472 2655.585801217 47.70114942528736 C 2674.38834347528 50 2683.78961460442 53.44827586206897 2702.5921568627 53.44827586206897 C 2721.39469912102 53.44827586206897 2730.7959702501803 53.44827586206897 2749.5985125085 53.44827586206897 C 2768.40105476678 53.44827586206897 2777.80232589592 59.19540229885058 2796.6048681542 59.19540229885058 C 2815.40741041248 59.19540229885058 2824.80868154162 59.19540229885058 2843.6112237999 59.19540229885058 C 2862.41376605818 59.19540229885058 2871.81503718732 59.19540229885058 2890.6175794456 59.19540229885058 C 2909.42012170388 59.19540229885058 2918.82139283302 59.19540229885058 2937.6239350913 59.19540229885058 C 2956.42647734958 59.19540229885058 2965.82774847872 59.19540229885058 2984.630290737 59.19540229885058 C 3003.4328329952796 59.19540229885058 3012.83410412442 59.19540229885058 3031.6366463827 59.19540229885058 C 3050.4391886409803 59.19540229885058 3059.84045977012 59.19540229885058 3078.6430020284 59.19540229885058 C 3097.4455442866797 59.19540229885058 3106.8468154158204 59.19540229885058 3125.6493576741 59.19540229885058 C 3144.45189993238 59.19540229885058 3153.85317106152 53.44827586206897 3172.6557133198 53.44827586206897 C 3191.45825557808 53.44827586206897 3200.8595267072205 53.44827586206897 3219.6620689655 53.44827586206897 C 3238.46461122378 53.44827586206897 3247.86588235292 53.44827586206897 3266.6684246112 53.44827586206897 C 3285.47096686948 53.44827586206897 3294.8722379986198 46.551724137931096 3313.6747802569 41.954022988505756 C 3332.4773225151794 37.35632183908052 3341.87859364432 33.9080459770115 3360.6811359026 30.45977011494253 C 3379.48367816088 27.011494252873565 3388.88494929002 27.0114942528736 3407.6874915483 24.71264367816093 C 3426.4900338065795 22.413793103448317 3435.89130493572 21.264367816089543 3454.693847194 18.965517241379317 C 3473.49638945232 16.666666666664252 3482.89766058148 13.218390804597703 3501.7002028398 13.218390804597703 C 3520.50274509808 13.218390804597703 3529.90401622722 13.218390804597703 3548.7065584855 13.218390804597703 C 3567.5091007437795 13.218390804597703 3576.9103718729193 13.218390804597703 3595.7129141312 13.218390804597703 C 3614.5154563894803 13.218390804597703 3623.91672751862 13.218390804597703 3642.7192697769 13.218390804597703 C 3661.5218120351797 13.218390804597703 3670.9230831643204 18.965517241379317 3689.7256254226 18.965517241379317 C 3708.52816768088 18.965517241379317 3717.9294388100197 18.965517241379317 3736.7319810683 18.965517241379317 C 3755.53452332658 18.965517241379317 3764.9357944557205 24.71264367816093 3783.738336714 24.71264367816093 C 3802.54087897228 24.71264367816093 3811.94215010142 24.71264367816093 3830.7446923597 24.71264367816093 C 3849.54723461798 24.71264367816093 3858.94850574712 24.71264367816093 3877.7510480054 24.71264367816093 C 3896.5535902636802 24.71264367816093 3905.95486139282 24.71264367816093 3924.7574036511 24.71264367816093 C 3943.55994590938 24.71264367816093 3952.96121703852 24.71264367816093 3971.7637592968 24.71264367816093 C 3990.5663015550804 24.71264367816093 4018.7701149425 24.71264367816093 4018.7701149425 24.71264367816093"
										class="highcharts-graph" data-z-index="1" stroke="#009AE0"
										stroke-width="2" stroke-linejoin="round"
										stroke-linecap="round"></path></g>
									<g data-z-index="0.1"
										class="highcharts-markers highcharts-series-0 highcharts-spline-series "
										transform="translate(0,0) scale(1 1)" clip-path="none">
									<path fill="#009AE0"
										d="M 27 36 A 4 4 0 1 1 26.99999800000017 35.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 74 30 A 4 4 0 1 1 73.99999800000016 29.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 121 36 A 4 4 0 1 1 120.99999800000016 35.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 168 42 A 4 4 0 1 1 167.99999800000018 41.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 215 48 A 4 4 0 1 1 214.99999800000018 47.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 262 53 A 4 4 0 1 1 261.9999980000002 52.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 309 59 A 4 4 0 1 1 308.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 356 65 A 4 4 0 1 1 355.9999980000002 64.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 403 71 A 4 4 0 1 1 402.9999980000002 70.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 450 71 A 4 4 0 1 1 449.9999980000002 70.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 497 76 A 4 4 0 1 1 496.9999980000002 75.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 544 82 A 4 4 0 1 1 543.9999980000001 81.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 591 82 A 4 4 0 1 1 590.9999980000001 81.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 638 82 A 4 4 0 1 1 637.9999980000001 81.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 685 88 A 4 4 0 1 1 684.9999980000001 87.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 732 88 A 4 4 0 1 1 731.9999980000001 87.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 779 88 A 4 4 0 1 1 778.9999980000001 87.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 826 94 A 4 4 0 1 1 825.9999980000001 93.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 873 94 A 4 4 0 1 1 872.9999980000001 93.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 920 94 A 4 4 0 1 1 919.9999980000001 93.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 967 94 A 4 4 0 1 1 966.9999980000001 93.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1014 94 A 4 4 0 1 1 1013.9999980000001 93.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1061 88 A 4 4 0 1 1 1060.9999980000002 87.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1108 76 A 4 4 0 1 1 1107.9999980000002 75.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1155 59 A 4 4 0 1 1 1154.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1202 53 A 4 4 0 1 1 1201.9999980000002 52.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1249 48 A 4 4 0 1 1 1248.9999980000002 47.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1296 42 A 4 4 0 1 1 1295.9999980000002 41.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1343 42 A 4 4 0 1 1 1342.9999980000002 41.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1390 42 A 4 4 0 1 1 1389.9999980000002 41.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1437 48 A 4 4 0 1 1 1436.9999980000002 47.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1484 53 A 4 4 0 1 1 1483.9999980000002 52.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1531 59 A 4 4 0 1 1 1530.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1578 65 A 4 4 0 1 1 1577.9999980000002 64.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1625 65 A 4 4 0 1 1 1624.9999980000002 64.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1672 71 A 4 4 0 1 1 1671.9999980000002 70.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1719 71 A 4 4 0 1 1 1718.9999980000002 70.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1766 71 A 4 4 0 1 1 1765.9999980000002 70.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1813 71 A 4 4 0 1 1 1812.9999980000002 70.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1860 76 A 4 4 0 1 1 1859.9999980000002 75.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1907 76 A 4 4 0 1 1 1906.9999980000002 75.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 1954 76 A 4 4 0 1 1 1953.9999980000002 75.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2001 76 A 4 4 0 1 1 2000.9999980000002 75.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2048 76 A 4 4 0 1 1 2047.9999980000002 75.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2095 71 A 4 4 0 1 1 2094.9999980000002 70.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2142 71 A 4 4 0 1 1 2141.9999980000002 70.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2189 65 A 4 4 0 1 1 2188.9999980000002 64.99600000066667 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2236 53 A 4 4 0 1 1 2235.9999980000002 52.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2283 42 A 4 4 0 1 1 2282.9999980000002 41.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2330 36 A 4 4 0 1 1 2329.9999980000002 35.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2377 30 A 4 4 0 1 1 2376.9999980000002 29.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2424 30 A 4 4 0 1 1 2423.9999980000002 29.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2471 30 A 4 4 0 1 1 2470.9999980000002 29.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2518 30 A 4 4 0 1 1 2517.9999980000002 29.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2565 36 A 4 4 0 1 1 2564.9999980000002 35.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2612 42 A 4 4 0 1 1 2611.9999980000002 41.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2659 48 A 4 4 0 1 1 2658.9999980000002 47.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2706 53 A 4 4 0 1 1 2705.9999980000002 52.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2753 53 A 4 4 0 1 1 2752.9999980000002 52.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2800 59 A 4 4 0 1 1 2799.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2847 59 A 4 4 0 1 1 2846.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2894 59 A 4 4 0 1 1 2893.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2941 59 A 4 4 0 1 1 2940.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 2988 59 A 4 4 0 1 1 2987.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3035 59 A 4 4 0 1 1 3034.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3082 59 A 4 4 0 1 1 3081.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3129 59 A 4 4 0 1 1 3128.9999980000002 58.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3176 53 A 4 4 0 1 1 3175.9999980000002 52.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3223 53 A 4 4 0 1 1 3222.9999980000002 52.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3270 53 A 4 4 0 1 1 3269.9999980000002 52.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3317 42 A 4 4 0 1 1 3316.9999980000002 41.99600000066666 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3364 30 A 4 4 0 1 1 3363.9999980000002 29.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3411 25 A 4 4 0 1 1 3410.9999980000002 24.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3458 19 A 4 4 0 1 1 3457.9999980000002 18.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3505 13 A 4 4 0 1 1 3504.9999980000002 12.996000000666664 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3552 13 A 4 4 0 1 1 3551.9999980000002 12.996000000666664 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3599 13 A 4 4 0 1 1 3598.9999980000002 12.996000000666664 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3646 13 A 4 4 0 1 1 3645.9999980000002 12.996000000666664 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3693 19 A 4 4 0 1 1 3692.9999980000002 18.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3740 19 A 4 4 0 1 1 3739.9999980000002 18.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3787 25 A 4 4 0 1 1 3786.9999980000002 24.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3834 25 A 4 4 0 1 1 3833.9999980000002 24.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3881 25 A 4 4 0 1 1 3880.9999980000002 24.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3928 25 A 4 4 0 1 1 3927.9999980000002 24.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 3975 25 A 4 4 0 1 1 3974.9999980000002 24.996000000666665 Z"
										class="highcharts-point"></path>
									<path fill="#009AE0"
										d="M 4022 25 A 4 4 0 1 1 4021.9999980000002 24.996000000666665 Z"
										class="highcharts-point"></path></g></g>
                          <text x="2021" text-anchor="middle"
										class="highcharts-title" data-z-index="4"
										style="color:#333333;font-size:18px;fill:#333333;" y="24"></text>
									<text x="2021" text-anchor="middle" class="highcharts-subtitle"
										data-z-index="4" style="color:#666666;fill:#666666;" y="24"></text>
                                <g data-z-index="6"
										class="highcharts-data-labels highcharts-series-0 highcharts-spline-series "
										visibility="visible" transform="translate(0,0) scale(1 1)">
                         <c:forEach varStatus="status"
										end="<%=todaysize+48%>" var="weatherList"
										items="${weatherList}">
                          <g
											class="highcharts-label highcharts-data-label highcharts-data-label-color-undefined "
											data-z-index="1"
											transform="translate(${(weatherList.weatherrow-1)*47+4},${(tmx-weatherList.tmp)*6+4})">
                        	<text x="5" data-z-index="1"
											style="font-size:14px;font-weight:normal;color:#000000;fill:#000000;"
											y="19">${weatherList.tmp}℃</text></g>
                          </c:forEach>
                          
                          </g>
                          <g class="highcharts-legend" data-z-index="7">
									<rect fill="none" class="highcharts-legend-box" rx="0" ry="0"
										x="0" y="0" width="8" height="8" visibility="hidden"></rect>
									<g data-z-index="1">
									<g></g></g></g>
									<g class="highcharts-axis-labels highcharts-xaxis-labels "
										data-z-index="7"></g>
									<g class="highcharts-axis-labels highcharts-yaxis-labels "
										data-z-index="7"></g></svg>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 미세먼지 시작 -->
			<div class="card-body">
				<div class="cmp-cmn-para odam-updated" style="padding: 10px;">
					<a href="/evweb/airquality/getDataDust.do?stationId=${stationId}"
						class="updated-at">
					</a>
				</div>
				<div style="display: flex; justify-content: center;">
					<div class="forecast-body" style="font-family: &amp; amp;">
						<%-- ${airqualityInfo.datatime} --%>
						<div class="forecast-body" style="font-family: &amp; amp;">
							<div class="forecast-body-summary">
								<table>
									<tr class="wf-row-pm25">
									<tr>
										<td>지역</td>

										<c:forEach items="${airqualityInfo}" var="dust">
	
											<!-- 구름 -->
											<td style="padding: px 1px 0px 0px;">
												<div style="display: inline-block; width: 80px;">
													<svg width="80px" height="80px" version="1.1"
														viewBox="0 0 64 52"
														style="filter: transform-origin: 50% 50% 0px;">
														<g>
														<c:choose>
											<c:when test="${dust.pm25value<=15}"><path fill="#099d6e"
															d="M47.165,51.322H16.834c-7.142,0-12.952-5.81-12.952-12.952c0-6.042,4.264-11.29,10.076-12.615 c-0.025-0.298-0.036-0.584-0.036-0.861c0-6.736,5.479-12.216,12.215-12.216c4.756,0,8.986,2.697,11.01,6.941 c5.152-0.822,9.957,1.677,12.398,6.033c6.063,1.131,10.571,6.503,10.571,12.718C60.117,45.513,54.308,51.322,47.165,51.322z"></path>
												</c:when>
											<c:when test="${dust.pm25value<=35}"><path fill="#fbde3d"
															d="M47.165,51.322H16.834c-7.142,0-12.952-5.81-12.952-12.952c0-6.042,4.264-11.29,10.076-12.615 c-0.025-0.298-0.036-0.584-0.036-0.861c0-6.736,5.479-12.216,12.215-12.216c4.756,0,8.986,2.697,11.01,6.941 c5.152-0.822,9.957,1.677,12.398,6.033c6.063,1.131,10.571,6.503,10.571,12.718C60.117,45.513,54.308,51.322,47.165,51.322z"></path>
												</c:when>
											<c:when test="${dust.pm25value<=75}"><path fill="#fb9c3d"
															d="M47.165,51.322H16.834c-7.142,0-12.952-5.81-12.952-12.952c0-6.042,4.264-11.29,10.076-12.615 c-0.025-0.298-0.036-0.584-0.036-0.861c0-6.736,5.479-12.216,12.215-12.216c4.756,0,8.986,2.697,11.01,6.941 c5.152-0.822,9.957,1.677,12.398,6.033c6.063,1.131,10.571,6.503,10.571,12.718C60.117,45.513,54.308,51.322,47.165,51.322z"></path>
												</c:when>
											<c:when test="${dust.pm25value>=76}"><path fill="#cb0b3d"
															d="M47.165,51.322H16.834c-7.142,0-12.952-5.81-12.952-12.952c0-6.042,4.264-11.29,10.076-12.615 c-0.025-0.298-0.036-0.584-0.036-0.861c0-6.736,5.479-12.216,12.215-12.216c4.756,0,8.986,2.697,11.01,6.941 c5.152-0.822,9.957,1.677,12.398,6.033c6.063,1.131,10.571,6.503,10.571,12.718C60.117,45.513,54.308,51.322,47.165,51.322z"></path>
												</c:when>
										<%-- </c:choose> --%>
       											   </c:choose>
        										  
       
            									<text text-anchor="middle" font-family="serif"
															font-size="12" y="42" x="32" fill="#ffffff">${dust.stationname}</hr5>
       											   </g>
      												  </svg>
												</div>
												
												
											</td>
										</c:forEach>
									<tr>
										<td>PM<sub>2.5</sub></td>
										<c:forEach items="${airqualityInfo}" var="dust"><td>
												<pm10box style="">${dust.pm25value}</pm10box>
											</td></c:forEach>
									</tr>
									<tr>
										<td>PM<sub>10</sub></td>
										<c:forEach items="${airqualityInfo}" var="dust"><td>
										<c:choose>
											<c:when test="${dust.pm10value<=30}"><pm10box style="background-color:#099d6e;">${dust.pm10value}</pm10box></c:when>
											<c:when test="${dust.pm10value<=80}"><pm10box style="background-color:#fbde3d;">${dust.pm10value}</pm10box></c:when>
											<c:when test="${dust.pm10value<=150}"><pm10box style="background-color:#fb9c3d;">${dust.pm10value}</pm10box></c:when>
											<c:when test="${dust.pm10value>=151}"><pm10box style="background-color:#cb0b3d;">${dust.pm10value}</pm10box></c:when>
										<%-- </c:choose> --%>
       											   </c:choose>
												
											</td></c:forEach>

									</tr>
									<c:forEach items="${airqualityInfo}" var="dust">
										
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 미세먼지 끝 -->
</body>
</html>
