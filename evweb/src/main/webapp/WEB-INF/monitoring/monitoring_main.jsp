<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			var stationId = "${stationId}";
			$(document).ready(function() {
				
			});
		</script>
	</head>
	<body>
		<div class="monitoringMain row">
			<h1 class="pagetitle" id="stationName">${stationInfo.station_name}</h1>
	        <div class="col-lg-12 stationWrap dashboard">
				<div class="row">
					<div class="col-md-4 pd-left0">
					    <div class="card info-card sales-card">
					    	<div class="card-header"><h5 class="card-title">충전소 정보</h5></div>
				            <div class="card-body">
				              <table class="table">
					              <tbody>
						              <tr>
							              <th scope="row">충전소 ID</th>
							              <td>${stationInfo.station_id}</td>
							              <th scope="row">충전소 이름</th>
							              <td>${stationInfo.station_name}</td>
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
					<div class="col-md-8 chargerInfo">
					    <div class="card info-card sales-card">
		              		<div class="card-header"><h5 class="card-title">충전기 정보</h5></div>
				            <div class="card-body">
				                <c:forEach var="charger" items="${chargerlnfo}">
				              		<div class="d-flex align-items-center col-sm-2">
					              		<div class="card-icon rounded-circle d-flex align-items-center justify-content-center"> 
					              			<i class="bi bi-ev-station"></i>
					              		</div>
					              		<div class="chargerInfoMid">
						              		<h6>${charger.charger_id}</h6> 
						              		<span class="text-muted small pt-2 ps-1">${charger.charger_type}</span>
						              		<span class="chrgrStat text-success small pt-1 fw-bold">${charger.stat}</span> 
					              		</div>
				              		</div>
				                </c:forEach>
				            </div>
						</div>
	            	</div>
					<div class="col-md-4 pd-left0">
					    <div class="card info-card sales-card">
		              		<div class="card-header"><h5 class="card-title">일간 충전량</h5></div>
				            <div class="card-body">
				            </div>
						</div>
	            	</div>
					<div class="col-xxl-4 col-md-4">
					    <div class="card info-card sales-card">
		              		<div class="card-header"><h5 class="card-title">주간 충전량</h5></div>
				            <div class="card-body">
				            </div>
						</div>
	            	</div>
					<div class="col-xxl-4 col-md-4">
					    <div class="card info-card sales-card">
		              		<div class="card-header"><h5 class="card-title">날씨 정보</h5></div>
				            <div class="card-body">
				            </div>
						</div>
	            	</div>
	            </div>
	        </div>
		</div>
	</body>
</html>