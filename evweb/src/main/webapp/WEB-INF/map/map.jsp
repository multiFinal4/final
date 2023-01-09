<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=odl70mizmg"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: calc(100vh - 130px);"></div>
	<div class="mapMarkerWrap">
	    <div class="stationInfoTop">
	        <h4 class="stationInfoTitle">충전소 이름</h4>
	        <div class="stationInfoAddr">
	            <h5>주소</h5>
	            <span  class="addr"></span>
	        </div>
	        <div class="stationInfoCom">
	            <h5>운영기관</h5>
	            <span class="com"></span>
	        </div>
	        <div class="stationInfoTime">
	            <h5>운영시간</h5>
	            <span class="time"></span>
	        </div>
	        <div class="chargeFee">
	            <h5>충전 요금</h5>
	            <ul class="type">
	                <li>
	                    <h6>회원</h6>
	                    <p>
	                        <span class="fee"></span>
	                        <span class="unit">원/kWh</span>
	                    </p>
	                </li>
	                <li>
	                    <h6>비회원</h6>
	                    <p>
	                        <span class="fee"></span>
	                        <span class="unit">원/kWh</span>
	                    </p>
	                </li>
	            </ul>
	        </div>
	        <div class="stationFac">
	            <h5>편의시설</h5>
	            <ul class="type">
	                <li class="pakring">
	                    <h6>주차여부</h6>
	                    <p>
	                        <span class="stat"></span>
	                    </p>
	                </li>
	                <li class="fac">
	                    <h6>편의제공</h6>
	                    <p>
	                        <span class="stat"></span>
	                    </p>
	                </li>
	            </ul>
	        </div>
	    </div>
	    <div class="stationInfoMid">
	        <h4 class="stationInfoTitle">충전기 정보</h4>
	        <ul class="chargerInfo">
	            <li class="chargerNo">
	                <h5>충전기 호수</h5>
	                <p class="chargerType">완속 <span>사용여부</span></p>
	                <ul class="type">
	                    <li>
	                        <h6>DC콤보</h6>
	                        <span class="statueImg"></span>
	                    </li>
	                    <li>
	                        <h6>DC차데모</h6>
	                        <span class="statueImg"></span>
	                    </li>
	                    <li>
	                        <h6>AC3상</h6>
	                        <span class="statueImg"></span>
	                    </li>
	                    <li>
	                        <h6>AC완속</h6>
	                        <span class="statueImg"></span>
	                    </li>
	                </ul>
	            </li>
	        </ul>
	    </div>
	</div>
</body>

<script type="text/javascript">

$(function() {
	initMap();
});


function initMap() { 

	var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
	<c:forEach items="${stationList}" var="list">
		areaArr.push({
						chargeid : "${list.station_name}" , 
						lat : "${list.map_latitude}", 
						lng : "${list.map_longtude}", 
						chargetype : "${list.map_latitude}", 
						chargeway : "${list.map_latitude}", 
						chargekW:"${list.map_latitude}", 
						chargestate:"${list.map_latitude}",
						update:"${list.map_latitude}", 
						NY:"${list.map_latitude}"
					});

	</c:forEach>
	
	let markers = new Array(); // 마커 정보를 담는 배열
	let infoWindows = new Array(); // 정보창을 담는 배열
	var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(33.3885379, 126.5626925), //지도 시작 지점
        zoom: 11, //지도의 초기 줌 레벨
        minZoom: 11, //지도의 최소 줌 레벨
        zoomControl: true, //줌 컨트롤의 표시 여부
        zoomControlOptions: { //줌 컨트롤의 옵션
       		position: naver.maps.Position.TOP_RIGHT
        }
    });
	
	
	for (var i = 0; i < areaArr.length; i++) {
		// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주자 !

	    var marker = new naver.maps.Marker({
	        map: map,
	        title: areaArr[i].chargeid, // 지역구 이름 
	        position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
	    });
	    
	    /* 정보창 */
		var stationInfo = "";
	    stationInfo += "<div style='width:200px;text-align:center;padding:10px;'>";
	    stationInfo += areaArr[i].chargeid;
	    stationInfo += "</div>";
    	 /*   + '충전기 아이디 : ' +areaArr[i].chargeid + ' - </b><br>'+'타입 : ' 
    	   + areaArr[i].chargetype 
    	   + '<br>'
    	   + '충전방식 : '
    	   + areaArr[i].chargeway
    	   + '<br>'+'용량(kW) : '
    	   + areaArr[i].chargekW
    	   + '<br>'+'현재상태 : '
    	   + areaArr[i].chargestate
    	   + '<br>'
    	   + '업데이트일자 : '
    	   + areaArr[i].update
    	   + '<br>'
    	   + '삭제여부?? : '
    	   + areaArr[i].NY+'</div>' */
	    var infoWindow = new naver.maps.InfoWindow({content: stationInfo }); // 클릭했을 때 띄워줄 정보 HTML 작성
												    
		markers.push(marker); // 생성한 마커를 배열에 담는다.
		infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
	}
    
    function getClickHandler(seq) {
            return function(e) {  // 마커를 클릭하는 부분
                var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
                    infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다
                if (infoWindow.getMap()) {
                    infoWindow.close();
                } else {
                    infoWindow.open(map, marker); // 표출
                }
    		}
    	}
    
    for (var i=0, ii=markers.length; i<ii; i++) {
    	console.log(markers[i] , getClickHandler(i));
        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
    }
}


	//setOptions 메서드를 이용해 옵션을 조정할 수도 있습니다.
	map.setOptions("mapTypeControl", true); //지도 유형 컨트롤의 표시 여부
	
	naver.maps.Event.addListener(map, 'zoom_changed', function (zoom) {
	    console.log('zoom:' + zoom);
	});
	
	map.setOptions('minZoom', 10);
	console.log('잘못된 참조 시점', map.getOptions('minZoom'), map.getOptions('minZoom') === 10);
	
	// 지도의 옵션 참조는 init 이벤트 이후에 참조해야 합니다.
	naver.maps.Event.once(map, 'init', function () {
	    console.log('올바른 참조 시점', map.getOptions('minZoom') === 10);
	});
	
	// 지도 인터랙션 옵션
	$("#interaction").on("click", function(e) {
	    e.preventDefault();
	
	    if (map.getOptions("draggable")) {
	        map.setOptions({ //지도 인터랙션 끄기
	            draggable: false,
	            pinchZoom: false,
	            scrollWheel: false,
	            keyboardShortcuts: false,
	            disableDoubleTapZoom: true,
	            disableDoubleClickZoom: true,
	            disableTwoFingerTapZoom: true
	        });
	
	        $(this).removeClass("control-on");
	    } else {
	        map.setOptions({ //지도 인터랙션 켜기
	            draggable: true,
	            pinchZoom: true,
	            scrollWheel: true,
	            keyboardShortcuts: true,
	            disableDoubleTapZoom: false,
	            disableDoubleClickZoom: false,
	            disableTwoFingerTapZoom: false
	        });
	
	        $(this).addClass("control-on");
	    }
	});
	
	// 관성 드래깅 옵션
	$("#kinetic").on("click", function(e) {
	    e.preventDefault();
	
	    if (map.getOptions("disableKineticPan")) {
	        map.setOptions("disableKineticPan", false); //관성 드래깅 켜기
	        $(this).addClass("control-on");
	    } else {
	        map.setOptions("disableKineticPan", true); //관성 드래깅 끄기
	        $(this).removeClass("control-on");
	    }
	});
	
	// 타일 fadeIn 효과
	$("#tile-transition").on("click", function(e) {
	    e.preventDefault();
	
	    if (map.getOptions("tileTransition")) {
	        map.setOptions("tileTransition", false); //타일 fadeIn 효과 끄기
	
	        $(this).removeClass("control-on");
	    } else {
	        map.setOptions("tileTransition", true); //타일 fadeIn 효과 켜기
	        $(this).addClass("control-on");
	    }
	});
	
	// min/max 줌 레벨
	$("#min-max-zoom").on("click", function(e) {
	    e.preventDefault();
	
	    if (map.getOptions("minZoom") === 10) {
	        map.setOptions({
	            minZoom: 7,
	            maxZoom: 21
	        });
	        $(this).val(this.name + ': 7 ~ 21');
	    } else {
	        map.setOptions({
	            minZoom: 10,
	            maxZoom: 21
	        });
	        $(this).val(this.name + ': 10 ~ 21');
	    }
	});
	
	//지도 컨트롤
	$("#controls").on("click", function(e) {
	    e.preventDefault();
	
	    if (map.getOptions("scaleControl")) {
	        map.setOptions({ //모든 지도 컨트롤 숨기기
	            scaleControl: false,
	            logoControl: false,
	            mapDataControl: false,
	            zoomControl: false,
	            mapTypeControl: false
	        });
	        $(this).removeClass('control-on');
	    } else {
	        map.setOptions({ //모든 지도 컨트롤 보이기
	            scaleControl: true,
	            logoControl: true,
	            mapDataControl: true,
	            zoomControl: true,
	            mapTypeControl: true
	        });
	        $(this).addClass('control-on');
	    }
	});
	
	$("#interaction, #tile-transition, #controls").addClass("control-on");
</script>
</html>