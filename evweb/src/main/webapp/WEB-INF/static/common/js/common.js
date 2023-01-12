
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