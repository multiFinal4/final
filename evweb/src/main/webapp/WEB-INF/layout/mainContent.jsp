<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Insert title here</title>
		<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=odl70mizmg"></script>
	</head>
	<body>
		<div class="main">
			<section class="section">
				<div class="bgOver"></div>
				<h1>MAIN CONTENT 1</h1>
			</section>
			<section class="section">
				<div id="map" style="width:100%;height: 100%;"></div>
			</section>
		</div>
	</body>
	<script>
	var jeju = new naver.maps.LatLngBounds(
		    new naver.maps.LatLng(33.5864, 126.0526),
		    new naver.maps.LatLng(33.1508, 127.0391));

		var map = new naver.maps.Map("map", {
		    minZoom: 11, // 읍면동 레벨
		    maxBounds: jeju,
		});

		var rect = new naver.maps.Rectangle({
		    strokeOpacity: 0,
		    strokeWeight: 0,
		    fillOpacity: 0.2,
		    bounds: jeju,
		    map: map
		});
	</script>
</html>

   
	
	