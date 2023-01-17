<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>CHARGE STATION</title>
		<link rel="stylesheet" href="/evweb/vendor/bootstrap/css/bootstrap-select.css" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="/evweb/vendor/bootstrap/js/bootstrap-select.min.js"></script>
	    <script type="text/javascript">
	    	var page = 3;
			var stationId = "${stationId}";
			var state = "${state}"
			$(document).ready(function() {
				console.log(state)
				console.log(stationId)
				
					$("#stationId").change(function() {
						if(state == "main"){
							location.href="/evweb/monitoring/main?stationId="+encodeURI($(this).val());
						}else if (state == "weather") {
							location.href="/evweb/weather/getlist.do?stationId="+encodeURI($(this).val());
						}else if (state == "chart") {
							location.href="/evweb/charge/chart.do?stationId="+encodeURI($(this).val());
						}
					});
					$("#stationId").val(stationId).attr("selected","selected");

					$("#stationId").selectpicker();
			});
	    </script>
	    <style type="text/css">
		    .dropdown-menu {
			    max-height: 200px;
			}
			.search-form{
				float: none;
			}
			.search-form button{
				margin-left: 0;
				padding: 6px 12px;
			}
	    </style>
    </head>
    <body>
        <aside id="sidebar" class="sidebar">
           	<form id="searchForm" class="search-form d-flex align-items-center" method="get" action="/evweb/monitoring/main?stationId=">
				<select name="stationId"  id="stationId" class="border rounded form-control selectpicker" data-live-search="true" data-actions-box="true" data-width="100%">
					<c:forEach var="station" items="${stationlist}">
						<option value="${station.station_id}">${station.station_name}</option>
					</c:forEach>
				</select>
			</form>
            <ul class="sidebar-nav" id="sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/monitoring/main?stationId=${stationId}">
                        <i class="bi bi-grid"></i>
                        <span>충전소 정보 메인</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/charge/chart.do?stationId=${stationId}">
                        <i class="bi bi-grid"></i>
                        <span>충전 차트</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/weather/getlist.do?stationId=${stationId}">
                        <i class="bi bi-grid"></i>
                        <span>날씨 및 미세먼지</span>
                    </a>
                </li>
            </ul>
        </aside>
    </body>
</html>