<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<link href="https://www.weather.go.kr/w/resources/css-2021/slick.css?ver=2023010301" rel="stylesheet" type="text/css">
		<link href="/evweb/css/weather_basic.css" rel="stylesheet" type="text/css">
		<link href="https://www.weather.go.kr/w/resources/css-2021/common-ui.css?ver=2023010301" rel="stylesheet" type="text/css">
		<link href="/evweb/css/weather_common-ui.css" rel="stylesheet" type="text/css">
		<link href="https://www.weather.go.kr/w/resources/css-2021/common-ui-mobile.css?ver=2023010301" rel="stylesheet" type="text/css">
		<link href="https://www.weather.go.kr/w/resources/css-2021/custom.css?ver=2023010301" rel="stylesheet" type="text/css">
		<link href="https://www.weather.go.kr/w/resources/css-2021/common-ui-new-mobile.css?ver=2023010301" rel="stylesheet" type="text/css">
		<link href="https://www.weather.go.kr/w/resources/css-2021/component.css?ver=2023010301" rel="stylesheet" type="text/css">
		<link href="https://www.weather.go.kr/w/resources/css-2021/print.css?ver=2023010301" rel="stylesheet" media="print" type="text/css">
		<link href="https://www.weather.go.kr/w/resources/css-2021/ie.css?ver=2023010301" rel="stylesheet" type="text/css">
		<script src="https://www.weather.go.kr/w/resources/js/lodash.min.js"></script>
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/clipboard.min.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/moment-with-locales.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/moment-timezone.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/jquery-3.4.1.min.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/jquery-ui.min.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/iscroll-probe.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/slick.min.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/mustache.min.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/store.modern.min.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/object-assign.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/highcharts.js"></script>
		<script src="https://www.weather.go.kr/w/resources/js/fn.js?ver=2023010301"></script>
		
		<script> 
			window.appBase = "\/w\/";
			window.vmapBaseUrl = "https:\/\/vmap.kma.go.kr";
			window.vmapBaseParam = "HIDEMENU=Y";
			window.wgisBaseUrl = "https:\/\/www.weather.go.kr\/wgis-nuri";
			var hashParam = null;
		</script>
	<script src="https://www.weather.go.kr/w/resources/js/app-2021/my-point-slider.js?ver=2023010301"></script>
	<script src="https://www.weather.go.kr/w/resources/js/app-2021/dong-searchbox.js?ver=2023010301"></script>
	<script src="https://www.weather.go.kr/w/resources/js/app-2021/bookmark-dropdown.js?ver=2023010301"></script>
	<script src="https://www.weather.go.kr/w/resources/js/app-2021/today-warning.js?ver=2023010301"></script>
	<link href="https://www.weather.go.kr/w/resources/css-2021/impact_fcst.css?ver=2023010301" rel="stylesheet" type="text/css">
	<link href="https://www.weather.go.kr/w/resources/css-2021/impact_fcst3.css?ver=2023010301" rel="stylesheet" type="text/css">
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
    <div class="dfs-tab-body">
    
    	
    	
    	
    
    	<div class="tt-btn" tabindex="0" style="margin-left: 19px; z-index: 3; position: absolute; margin-top: 28px;"><p class="tt">
		<img src="/w/resources/image/main/forecast_info.gif;jsessionid=01fMvq7LqNDEOKcZmUScDEjC-RZ0J_NrwfhtHVWY.standalone" alt="단기예보 도움말"></p></div>
        <ul class="item-lbl">
            <li>시각</li>
            <li>날씨</li>
            <li>기온</li>
            <li>체감온도</li>
            <li>강수량<small>(mm)</small></li>
            <li>강수확률</li>
            <li>바람<small>(<span class="unit">m/s</span>)</small></li>
            <li>습도</li>
            <li><a href="/w/weather/warning/impact/impact-loc.do?dongCode=5013025900#dong/5013025900" target="_blank" title="새창열림">한파영향<span class="hide"> 바로가기</span></a></li>
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
                <div class="slide" style="width: 564px;">
                    <h4 class="hid">오늘</h4>
                    <div class="daily" data-date="2023-01-05" data-start-time="13시" data-start-data-time="13:00" data-experimental="">
                        <div class="daily-head">
                            <span class="date">5일(목)</span>
                                <span class="tminmax"><span class="tmin">최저<span class="minval">-</span></span><span class="tmax">최고<span class="maxval">12℃</span></span></span>
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
                            <ul class="item vs-item  v-item-first " data-date="2023-01-05" data-time="13:00">
                                <li><span class="hid">시각: </span><span>13시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB01" title="맑음">맑음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">13℃<span class="chill">(13℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>13℃</span></li>
                                <li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                <li><span class="hid">강수확률: </span><span>&nbsp;</span></li>
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                <li><span class="hid">습도: </span><span>55%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white lvl-show"></span></li>
                            </ul>
                            <ul class="item vs-item " data-date="2023-01-05" data-time="14:00">
                                <li><span class="hid">시각: </span><span>14시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB01" title="맑음">맑음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">13℃<span class="chill">(13℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>13℃</span></li>
                                <li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                <li><span class="hid">강수확률: </span><span>&nbsp;</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>55%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item vs-item " data-date="2023-01-05" data-time="15:00">
                                <li><span class="hid">시각: </span><span>15시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB03" title="구름 많음">구름 많음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">12℃<span class="chill">(12℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>12℃</span></li>
                                <li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                <li><span class="hid">강수확률: </span><span>&nbsp;</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">1<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>55%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item vs-item " data-date="2023-01-05" data-time="16:00">
                                <li><span class="hid">시각: </span><span>16시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB03" title="구름 많음">구름 많음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">11℃<span class="chill">(11℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>11℃</span></li>
                                <li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                <li><span class="hid">강수확률: </span><span>&nbsp;</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">1<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>60%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item vs-item " data-date="2023-01-05" data-time="17:00">
                                <li><span class="hid">시각: </span><span>17시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB01" title="맑음">맑음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">11℃<span class="chill">(11℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>11℃</span></li>
                                <li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                <li><span class="hid">강수확률: </span><span>&nbsp;</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">1<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>60%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item   s-item-first " data-sonagi="0" data-date="2023-01-05" data-time="18:00">
                                <li><span class="hid">시각: </span><span>18시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB03" title="구름 많음">구름 많음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">10℃<span class="chill">(10℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>10℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>20%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">1<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>65%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-05" data-time="19:00">
                                <li><span class="hid">시각: </span><span>19시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB03_N" title="구름 많음">구름 많음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">10℃<span class="chill">(9℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>9℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>20%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>70%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white lvl-show"></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-05" data-time="20:00">
                                <li><span class="hid">시각: </span><span>20시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB01_N" title="맑음">맑음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">10℃<span class="chill">(9℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>9℃</span></li>
                              	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                <li><span class="hid">강수확률: </span><span>0%</span></li>
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                <li><span class="hid">습도: </span><span>70%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-05" data-time="21:00">
                                <li><span class="hid">시각: </span><span>21시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB03_N" title="구름 많음">구름 많음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">9℃<span class="chill">(8℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>8℃</span></li>
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                <li><span class="hid">강수확률: </span><span>20%</span></li>
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-05" data-time="22:00">
                                <li><span class="hid">시각: </span><span>22시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB01_N" title="맑음">맑음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">9℃<span class="chill">(8℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>8℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>0%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-05" data-time="23:00">
                                <li><span class="hid">시각: </span><span>23시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB03_N" title="구름 많음">구름 많음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">9℃<span class="chill">(8℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>8℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>20%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-05" data-time="24:00">
                                <li><span class="hid">시각: </span><span>0시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB01_N" title="맑음">맑음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">8℃<span class="chill">(7℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>7℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>0%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="slide" style="width: 1128px;">
                    <h4 class="hid">내일</h4>
                    <div class="daily" data-date="2023-01-06" data-start-time="01시" data-start-data-time="01:00" data-experimental="">
                        <div class="daily-head">
                            <span class="date">6일(금)</span>
                            
                                <span class="tminmax"><span class="tmin">최저<span class="minval">8℃</span></span><span class="tmax">최고<span class="maxval">12℃</span></span></span>
                            
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
                            <ul class="item s-item   s-item-first " data-sonagi="0" data-date="2023-01-06" data-time="01:00">
                                <li><span class="hid">시각: </span><span>01시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB03_N" title="구름 많음">구름 많음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">8℃<span class="chill">(7℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>7℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>20%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="02:00">
                                <li><span class="hid">시각: </span><span>02시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB03_N" title="구름 많음">구름 많음</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">8℃<span class="chill">(7℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>7℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>20%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="03:00">
                                <li><span class="hid">시각: </span><span>03시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04_N" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">8℃<span class="chill">(7℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>7℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="04:00">
                                <li><span class="hid">시각: </span><span>04시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04_N" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">8℃<span class="chill">(7℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>7℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="05:00">
                                <li><span class="hid">시각: </span><span>05시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04_N" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">8℃<span class="chill">(7℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>7℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>80%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="06:00">
                                <li><span class="hid">시각: </span><span>06시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04_N" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">8℃<span class="chill">(7℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>7℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NW_b" title="북서풍">북서풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>80%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="07:00">
                                <li><span class="hid">시각: </span><span>07시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">8℃<span class="chill">(7℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>7℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm N_b" title="북풍">북풍</span><span class="wspd">1<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>80%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="08:00">
                                <li><span class="hid">시각: </span><span>08시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">8℃<span class="chill">(8℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>8℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm N_b" title="북풍">북풍</span><span class="wspd">1<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>80%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="09:00">
                                <li><span class="hid">시각: </span><span>09시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">9℃<span class="chill">(9℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>9℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm N_b" title="북풍">북풍</span><span class="wspd">1<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="10:00">
                                <li><span class="hid">시각: </span><span>10시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">11℃<span class="chill">(11℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>11℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm NE_b" title="북동풍">북동풍</span><span class="wspd">1<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>70%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="11:00">
                                <li><span class="hid">시각: </span><span>11시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">11℃<span class="chill">(11℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>11℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm E_b" title="동풍">동풍</span><span class="wspd">1<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>70%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="12:00">
                                <li><span class="hid">시각: </span><span>12시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">11℃<span class="chill">(11℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>11℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm SE_b" title="남동풍">남동풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>70%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="13:00">
                                <li><span class="hid">시각: </span><span>13시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">11℃<span class="chill">(11℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>11℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm S_b" title="남풍">남풍</span><span class="wspd">2<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="14:00">
                                <li><span class="hid">시각: </span><span>14시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">11℃<span class="chill">(11℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>11℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm S_b" title="남풍">남풍</span><span class="wspd">3<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="15:00">
                                <li><span class="hid">시각: </span><span>15시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">12℃<span class="chill">(12℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>12℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm S_b" title="남풍">남풍</span><span class="wspd">3<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="16:00">
                                <li><span class="hid">시각: </span><span>16시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB04" title="흐림">흐림</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">12℃<span class="chill">(12℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>12℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>-</span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>30%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm S_b" title="남풍">남풍</span><span class="wspd">4<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="17:00">
                                <li><span class="hid">시각: </span><span>17시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB05" title="비">비</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">12℃<span class="chill">(12℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>12℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>~1<span class="unit">mm</span></span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>60%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm SW_b" title="남서풍">남서풍</span><span class="wspd">4<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="18:00">
                                <li><span class="hid">시각: </span><span>18시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB05" title="비">비</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">11℃<span class="chill">(11℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>11℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>~1<span class="unit">mm</span></span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>60%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm SW_b" title="남서풍">남서풍</span><span class="wspd">3<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>80%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="19:00">
                                <li><span class="hid">시각: </span><span>19시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB05" title="비">비</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">10℃<span class="chill">(8℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>8℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>~1<span class="unit">mm</span></span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>60%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">3<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>80%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white lvl-show"></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="20:00">
                                <li><span class="hid">시각: </span><span>20시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB05" title="비">비</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">10℃<span class="chill">(8℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>8℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>~1<span class="unit">mm</span></span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>60%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">4<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>80%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="21:00">
                                <li><span class="hid">시각: </span><span>21시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB05" title="비">비</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">10℃<span class="chill">(8℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>8℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>~1<span class="unit">mm</span></span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>60%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">5<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>80%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="22:00">
                                <li><span class="hid">시각: </span><span>22시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB05" title="비">비</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">10℃<span class="chill">(7℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>7℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>~1<span class="unit">mm</span></span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>60%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">8<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>80%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="23:00">
                                <li><span class="hid">시각: </span><span>23시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB05" title="비">비</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">11℃<span class="chill">(11℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>11℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>~1<span class="unit">mm</span></span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>60%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">9<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                            <ul class="item s-item  " data-sonagi="0" data-date="2023-01-06" data-time="24:00">
                                <li><span class="hid">시각: </span><span>0시</span></li>
                                <li><span class="hid">날씨: </span><span class="wic DB05" title="비">비</span></li>
                                <li><span class="hid">기온(체감온도) </span><span class="hid feel">10℃<span class="chill">(6℃)</span></span></li>
                                <li><span class="hid">체감온도: </span><span>6℃</span></li>
                                
                                
                                
                                	<li class="pcp "><span class="hid">강수량: </span><span>~1<span class="unit">mm</span></span></li>
                                
                                
                                <li><span class="hid">강수확률: </span><span>60%</span></li>
                                
                                
                                    <li><span class="hid">바람: </span><span class="wdic sm W_b" title="서풍">서풍</span><span class="wspd">10<span class="unit">m/s</span></span></li>
                                
                                
                                
                                <li><span class="hid">습도: </span><span>75%</span></li>
                                <li><span class="hid">한파영향: </span><span class="lvl-white "></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
				</div>
    </div>
</div>
</body>
</html>