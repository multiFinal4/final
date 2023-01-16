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
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://code.highcharts.com/modules/accessibility.js"></script>
		<script type="text/javascript"> //차트에 데이터 넣기
			<%List<String> dayamountlist =  (ArrayList<String>)request.getAttribute("dayamountlist");
			  List<String> datelist =  (ArrayList<String>)request.getAttribute("datelist"); 
			  List<String> weekamountlist =  (ArrayList<String>)request.getAttribute("weekamountlist");
			  List<String> weeklist =  (ArrayList<String>)request.getAttribute("weeklist"); %>
			var stationId = "${stationId}";
			const chargeweekdata = [];
			const date = [];
			const chargemonthdata = [];
			const week = [];
			<%for(int i=0;i<dayamountlist.size();i++){%>
				chargeweekdata.push([<%=dayamountlist.get(i)%>])
			<%}%>
			<%for(int i=0;i<weekamountlist.size();i++){%>
				chargemonthdata.push([<%=weekamountlist.get(i)%>])
			<%}%>
			date.push(['<%=datelist.get(0)%>(일)']);
			date.push(['<%=datelist.get(1)%>(월)']);
			date.push(['<%=datelist.get(2)%>(화)']);
			date.push(['<%=datelist.get(3)%>(수)']);
			date.push(['<%=datelist.get(4)%>(목)']);
			date.push(['<%=datelist.get(5)%>(금)']);
			date.push(['<%=datelist.get(6)%>(토)']);
			<%for(int i=0;i<weeklist.size();i++){%>
				week.push('<%=weeklist.get(i)%>')
			<%}%>
			$(document).ready(function() {
				highchartweek(date,chargeweekdata)
				highchartmonth(week,chargemonthdata)
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
		<h1 class="pagetitle" id="stationName">충전 차트</h1>
		<div class="col-lg-12 stationWrap dashboard">
			<div class="col-md-8 pr-0">
				<div class="card info-card sales-card " style="z-index: 1;">
					<div class="card-header">
						<h5 class="card-title">
							주간 충전량 <span style="float: right;">${weekamount}kWh</span>
						</h5>
					</div>
					<div class="card-body">
						<figure class="highcharts-figure">
							<div id="chargeweek"></div>
						</figure>
					</div>
				</div>
			</div>
			<div class="col-md-4 pr-0">
			</div>
		</div>
		<div class="col-lg-12 stationWrap dashboard">
			<div class="col-md-8 pr-0">
				<div class="card info-card sales-card " style="z-index: 0;">
					<div class="card-header">
						<h5 class="card-title">
							월간 충전량 <span style="float: right;">${monthamount}kWh</span>
						</h5>
					</div>
					<div class="card-body">
						<figure class="highcharts-figure">
							<div id="chargemonth"></div>
						</figure>
					</div>
				</div>
			</div>
			<div class="col-md-4 pr-0">
			</div>
		</div>
	</div>
</body>
</html>