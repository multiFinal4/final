<%@page import="com.project.weather.WeatherUtil"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.weather.WeatherDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<link href="/evweb/weather/css/basic.css" rel="stylesheet" type="text/css">
		<link href="/evweb/weather/css/common-ui.css" rel="stylesheet" type="text/css">
		<link href="/evweb/weather/css/component.css" rel="stylesheet" type="text/css">
		<link href="/evweb/weather/css/custom.css" rel="stylesheet" type="text/css">
		<link href="/evweb/weather/css/ie.css" rel="stylesheet" type="text/css">
		<link href="/evweb/weather/css/impact_fcst.css" rel="stylesheet" type="text/css">
		<link href="/evweb/weather/css/impact_fcst3.css" rel="stylesheet" media="print" type="text/css">
		<link href="/evweb/weather/css/slick.css" rel="stylesheet" type="text/css">
		<script src="/evweb/weather/js/lodash.min.js"></script>
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script src="/evweb/weather/js/clipboard.min.js"></script>
		<script src="/evweb/weather/js/moment-with-locales.js"></script>
		<script src="/evweb/weather/js/moment-timezone.js"></script>
		<script src="/evweb/weather/js/jquery-3.4.1.min.js"></script>
		<script src="/evweb/weather/js/jquery-ui.min.js"></script>
		<script src="/evweb/weather/js/iscroll-probe.js"></script>
		<script src="/evweb/weather/js/slick.min.js"></script>
		<script src="/evweb/weather/js/mustache.min.js"></script>
		<script src="/evweb/weather/js/store.modern.min.js"></script>
		<script src="/evweb/weather/js/object-assign.js"></script>
		<script src="/evweb/weather/js/highcharts.js"></script>
		<script src="/evweb/weather/js/fn.js"></script>
		<script src="/evweb/weather/js/app-config.js"></script>
		<script src="/evweb/weather/js/app-weather-forecast-short-term.js"></script>
		<script src="/evweb/weather/js/app-init.js"></script>
		<script src="/evweb/weather/js/sea-config.js"></script>
		<script src="/evweb/weather/js/dong-config.js"></script>
		<script src="/evweb/weather/js/com.ui-2021.js"></script>
		<script> 
			window.appBase = "\/w\/";
			window.vmapBaseUrl = "https:\/\/vmap.kma.go.kr";
			window.vmapBaseParam = "HIDEMENU=Y";
			window.wgisBaseUrl = "https:\/\/www.weather.go.kr\/wgis-nuri";
			var hashParam = null;
		</script>
	<script src="/evweb/weather/js/my-point-slider.js"></script>
	<script src="/evweb/weather/js/dong-searchbox.js"></script>
	<script src="/evweb/weather/js/bookmark-dropdown.js"></script>
	<script src="/evweb/weather/js/today-warning.js"></script>
	<link href="/evweb/weather/css/impact_fcst.css" rel="stylesheet" type="text/css">
	<link href="/evweb/weather/css/impact_fcst3.css" rel="stylesheet" type="text/css">
	<style>
            .table-col td:first-of-type { border-left:1px solid #e0e6ef;}
            body {height:20%;}
            footer {position: relative; line-height: 1.45; letter-spacing: 0; font-size: 14px;width: 100%;height: 52px;background: #fff;z-index: 1001;border-top:1px solid #E6E6E6;}
            header {width: auto;  height: 220%;  position: relative;  left: 0;  top: 0;  z-index: 1000;line-height: 1.5;  letter-spacing : 0;}
			.h1, h1 { font-size: 2.5rem; margin-bottom: 0.5rem; font-weight: 500; line-height: 1.2;} 
			
        </style>
	</head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="cmp-dfs-slider hr1-fct">
	<div class="dfs-tab">
        <div class="dfs-tab-head-wrap">
            <ul class="dfs-tab-head">
	                    <li data-experimental="">
                        		<a href="#" data-date="2023-01-07" class="on" title="선택됨"><span>오늘</span></a>
	                        	<i class="tt-btn" tabindex="0"><span class="tt">오늘 예보를 1시간 간격으로 제공합니다.</span></i>
	                    </li>
	                    <li data-experimental="">
                        		<a href="#" data-date="2023-01-08"><span>내일</span></a>
	                        	<i class="tt-btn" tabindex="0"><span class="tt">내일 예보를 1시간 간격으로 제공합니다.</span></i>
	                    </li>
	                    <li data-experimental="">
                        		<a href="#" data-date="2023-01-09"><span>모레</span></a>
	                        	<i class="tt-btn" tabindex="0"><span class="tt">모레 예보를 1시간 간격으로 제공합니다.</span></i>
	                    </li>
            </ul>
        </div>
        <ul class="right">
            <div class="cmp-dfs-updated">
			    <a href="#" class="open-box"><span>최근발표시각</span></a>
			    <div class="shadow-box">
			        <div class="inner">
			            <a href="#close" class="close-box">닫기</a>
			            <h5>최근발표시각</h5>
			            <dl><dt>단기예보:</dt><dd>01.07.(토) 14:00</dd></dl>
			        </div>
			    </div>
			</div>
        </ul>
       
    </div>
     <button type="button"  class="btn btn-secondary" onclick="location.href='/evweb/weather/getData.do'" >데이터불러오기</button>
    <div class="dfs-tab-body">
        <ul class="item-lbl">
            <li>시각</li>
            <li>날씨</li>
            <li>기온</li>
            <li>체감온도</li>
            <li>강수량<small>(mm)</small></li>
            <li>강수확률</li>
            <li>바람<small>(<span class="unit">m/s</span>)</small></li>
            <li>습도</li>
        </ul>
        <ul class="item-lbl-graph  rain-exists">
            <li>시각</li>
            <li>날씨</li>
            <li>기온</li>
            <li class="rain">강수량<small>(mm)</small>
                <a href="#" class="pop10-toggle-btn">10분강수<span>보기</span></a>
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
        <div class="dfs-slider" tabindex="0" style="touch-action: pan-y pinch-zoom;">
            <div class="slide-wrap  rain-exists" style="width: 5178px; transform: translate(0px, 0px) translateZ(0px);">
                <div class="slide">
                    <h4 class="hid">오늘</h4>
                    <% ArrayList<WeatherDTO> weatherlist = (ArrayList<WeatherDTO>) request.getAttribute("weatherList");
                    	LocalDate date = LocalDate.now();
                    	LocalDate nextdate = date.plusDays(1);
                    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    	String today = date.format(formatter);
                    	String nexttoday = nextdate.format(formatter);
                    	WeatherUtil util = new WeatherUtil();
                        String dayOfWeekval= util.getDayOfWeek(date);
                        String nextDayOfWeekval= util.getDayOfWeek(nextdate);
                        String tmn = util.getTmn(weatherlist, today);
                        String nexttmn = util.getTmn(weatherlist, nexttoday);
                        String tmx = util.getTmx(weatherlist, today);
                        String nexttmx = util.getTmx(weatherlist, nexttoday);
                        int todaysize = util.getTodaySize(weatherlist, today);
                    %>
                    <div class="daily" data-date="${weatherList.get(0).day}" data-start-time="${weatherList.get(0).time}시" data-start-data-time="${weatherList.get(0).time}:00" data-experimental="">
                        <div class="daily-head">
                            <span class="date"><%=weatherlist.get(0).getDay().substring(9,10)%>일(<%=dayOfWeekval%>)</span>
                                <span class="tminmax"><span class="tmin">최저<span class="minval"><%=tmn%>℃</span></span><span class="tmax">최고<span class="maxval"><%=tmx%>℃</span></span></span>
                            <ul class="table-head">
                                <li>시각</li>
                                <li>날씨</li>
                                <li>기온<br>(체감)</li>
                                <li>강수량</li>
                                
                                <li>강수<br>확률</li>
                                <li>바람</li>
                                <li>습도</li>
                                <li>한파<br>영향</li>
                            </ul>
                        </div>
                        <div class="item-wrap">
                      	  <c:forEach end="<%=todaysize%>" var="weatherList" items="${weatherList}">
                      	  		
									<ul class="item vs-item  v-item-first "	data-date="${weatherList.day}"	data-time="${weatherList.time}:00">
										<li><span class="hid">시각: </span><span>${weatherList.time}시</span></li>
										<c:choose>
											<c:when test="${weatherList.sky == '1'}">
												<li><span class="hid">날씨: </span><span class="wic DB01" title="맑음">맑음</span></li>
											</c:when>
											<c:when test="${weatherList.sky == '3'}">
												<li><span class="hid">날씨: </span><span	class="wic DB03" title="구름많음">구름많음</span></li>
											</c:when>
											<c:when test="${weatherList.sky == '4'}">	
												<li><span class="hid">날씨: </span><span	class="wic DB04" title="흐림">흐림</span></li>
											</c:when>
										</c:choose>
											<li><span class="hid">기온(체감온도) </span><span class="hid feel">${weatherList.tmp}℃<span	class="chill">(13℃)</span></span></li>
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
													<li><span class="hid">바람: </span><span	class="wdic sm N_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '북서풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm NW_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '북동풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm NE_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '남풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm S_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '남동풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm SE_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '남서풍'}">
													<li><span class="hid">바람: </span><span class="wdic sm SW_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '서풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm W_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '동풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm E_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
											</c:choose>
												<span class="wspd">${weatherList.wsd}<span class="unit">m/s</span></span></li>	
												<li><span class="hid">습도: </span><span>${weatherList.reh}%</span></li>
												<li><span class="hid">한파영향: </span><span class="lvl-white lvl-show"></span></li>
											</ul>
                      	   </c:forEach>	
                           </div>
                    </div>
                </div>
                <div class="slide">
                
                    <h4 class="hid">내일</h4>
                    <div class="daily" data-date="<%=nexttoday%>" data-start-time="01시" data-start-data-time="01:00" data-experimental="">
                        <div class="daily-head">
                        
                            <span class="date"><%=nexttoday.substring(9,10)%>일(<%=nextDayOfWeekval%>)</span>
                            
                                <span class="tminmax"><span class="tmin">최저<span class="minval"><%=nexttmn%>℃</span></span><span class="tmax">최고<span class="maxval"><%=nexttmx%>℃</span></span></span>
                            
                            <ul class="table-head">
                                <li>시각</li>
                                <li>날씨</li>
                                <li>기온<br>(체감)</li>
                                <li>강수량</li>
                                
                                <li>강수<br>확률</li>
                                <li>바람</li>
                                <li>습도</li>
                                <li>한파<br>영향</li>
                            </ul>
                        </div>
                        <div class="item-wrap">
                            <c:forEach begin="<%=todaysize+1%>" end="<%=todaysize+24%>" var="weatherList" items="${weatherList}">
                      	  		
									<ul class="item vs-item  v-item-first "	data-date="${weatherList.day}"	data-time="${weatherList.time}:00">
										<li><span class="hid">시각: </span><span>${weatherList.time}시</span></li>
										<c:choose>
											<c:when test="${weatherList.sky == '1'}">
												<li><span class="hid">날씨: </span><span class="wic DB01" title="맑음">맑음</span></li>
											</c:when>
											<c:when test="${weatherList.sky == '3'}">
												<li><span class="hid">날씨: </span><span	class="wic DB03" title="구름많음">구름많음</span></li>
											</c:when>
											<c:when test="${weatherList.sky == '4'}">	
												<li><span class="hid">날씨: </span><span	class="wic DB04" title="흐림">흐림</span></li>
											</c:when>
										</c:choose>
											<li><span class="hid">기온(체감온도) </span><span class="hid feel">${weatherList.tmp}℃<span	class="chill">(13℃)</span></span></li>
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
													<li><span class="hid">바람: </span><span	class="wdic sm N_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '북서풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm NW_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '북동풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm NE_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '남풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm S_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '남동풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm SE_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '남서풍'}">
													<li><span class="hid">바람: </span><span class="wdic sm SW_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '서풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm W_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
												<c:when test="${weatherList.vec == '동풍'}">
													<li><span class="hid">바람: </span><span	class="wdic sm E_b" title="${weatherList.vec}">${weatherList.vec}</span>
												</c:when>
											</c:choose>
												<span class="wspd">${weatherList.wsd}<span class="unit">m/s</span></span></li>	
												<li><span class="hid">습도: </span><span>${weatherList.reh}%</span></li>
												<li><span class="hid">한파영향: </span><span class="lvl-white lvl-show"></span></li>
											</ul>
                      	   </c:forEach>	
                          </div>
                          
                    </div>
                    
                </div>
        	</div>
       	<div class="dfs-slider-border"></div>
       	<div class="iScrollHorizontalScrollbar iScrollLoneScrollbar" style="overflow: hidden;">
       	<div class="iScrollIndicator" style="transition-duration: 0ms; display: block; width: 167px; transform: translate(0px, 0px) translateZ(0px);"></div></div>
    </div>
	</div>
</div>
</body>
</html>