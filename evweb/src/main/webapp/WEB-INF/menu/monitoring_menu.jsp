<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>CHARGE STATION</title>
	    <script type="text/javascript">
	    	var page = 3;

			var stationId = "${stationId}";
			$(document).ready(function() {
				$("#stationId").change(function() {
					location.href="/evweb/monitoring/main?stationId="+encodeURI($(this).val());
				});
				$("#stationId").val(stationId).attr("selected","selected");
				
			});
	    </script>
    </head>
    <body>
        <aside id="sidebar" class="sidebar">
           	<form id="searchForm" class="search-form d-flex align-items-center" method="get" action="/evweb/monitoring/main?stationId=">
				<select name="stationId"  id="stationId" class="form-control">
					<option value="all">선택해주세요</option>
	             	<c:forEach var="station" items="${stationlist}">
						<option value="${station.station_id}">${station.station_name}</option>
					</c:forEach>
				</select>
			</form>
            <ul class="sidebar-nav" id="sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/monitoring/main?stationId=all">
                        <i class="bi bi-grid"></i>
                        <span>충전소 정보 메인</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
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
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
                        <i class="bi bi-grid"></i>
                        <span>통합보고서</span>
                    </a>
                </li>
            </ul>
        </aside>
    </body>
</html>