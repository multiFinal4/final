<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	    <title>간단한 지도 표시하기</title>
	    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=odl70mizmg"></script>
	</head>
	<body>
	<div id="map" style="width:100%;height: calc(100vh - 130px);"></div>
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

		var logger = $('#logger');

		naver.maps.Event.addListener(map, 'zoom_changed', function() {
		    logZoom(map.getZoom());
		});

		logZoom(map.getZoom());

		function logZoom(zoom) {
		    logger.html('zoom:' + zoom);
		}
		
		
	</script>
</html>