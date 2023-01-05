<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=odl70mizmg"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: calc(100vh - 130px);"></div>
</body>

<script type="text/javascript">

$(function() {
	
	initMap();
	
});


function initMap() { 
	
	var areaArr = new Array();  // 지역을 담는 배열 ( 지역명/위도경도 )
	areaArr.push(
			/* DB와 연동해서 컨트롤러에서 list 에 데이터담아오기 */
			/*지역구 이름*/			/*위도*/					/*경도*/			
		 {chargeid : '강남' , lat : '37.4959854' , lng : '127.0664091', chargetype : 'DC콤보', chargeway : '동시', chargekW:'100', chargestate:'충전대기',update:'23.01.04', NY:'N'},  // 강남구 중심좌표
		 {chargeid : '강동' , lat : '37.5492077' , lng : '127.1464824', chargetype : 'DC콤보', chargeway : '동시', chargekW:'100', chargestate:'충전대기',update:'23.01.04', NY:'N'},  // 강동구 중심좌표
		 {chargeid : '강북' , lat : '37.6469954' , lng : '127.0147158', chargetype : 'DC콤보', chargeway : '동시', chargekW:'100', chargestate:'충전대기',update:'23.01.04', NY:'N'},  // 강북구 중심좌표
		 {chargeid : '강서' , lat : '37.5657617' , lng : '126.8226561', chargetype : 'DC콤보', chargeway : '동시', chargekW:'100', chargestate:'충전대기',update:'23.01.04', NY:'N'},  // 강서구 중심좌표
		 {chargeid : '관악' , lat : '37.4603732' , lng : '126.9536086', chargetype : 'DC콤보', chargeway : '동시', chargekW:'100', chargestate:'충전대기',update:'23.01.04', NY:'N'},  // 관악구 중심좌표
		 {chargeid : '광진' , lat : '37.5574120' , lng : '127.0796211', chargetype : 'DC콤보', chargeway : '동시', chargekW:'100', chargestate:'충전대기',update:'23.01.04', NY:'N'},  // 광진구 중심좌표
		 {chargeid : '구로' , lat : '37.4954856' , lng : '126.858121' , chargetype : 'DC콤보', chargeway : '동시', chargekW:'100', chargestate:'충전대기',update:'23.01.04', NY:'N'},  // 구로구 중심좌표
		 {chargeid : '금천' , lat : '37.4600969' , lng : '126.9001546', chargetype : 'DC콤보', chargeway : '동시', chargekW:'100', chargestate:'충전대기',update:'23.01.04', NY:'N'},  // 마포구 중심좌표
		 {chargeid : '제주' , lat : '33.394694' , lng : '126.372333', chargetype : 'DC콤보', chargeway : '동시', chargekW:'100', chargestate:'충전대기',update:'23.01.04', NY:'N'}  // 제주
	);
	
	
	
	let markers = new Array(); // 마커 정보를 담는 배열
	let infoWindows = new Array(); // 정보창을 담는 배열
	
	var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.5311008, 126.9810742), //지도 시작 지점
        zoom: 13, //지도의 초기 줌 레벨
        minZoom: 7, //지도의 최소 줌 레벨
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
		 var infoWindow = new naver.maps.InfoWindow({
		     content: '<div style="width:200px;text-align:center;padding:10px;"><b> -' + '충전기 아이디 : ' +areaArr[i].chargeid + ' - </b><br>'+'타입 : ' +areaArr[i].chargetype +
		     '<br>'+'충전방식 : '+areaArr[i].chargeway+'<br>'+'용량(kW) : '+areaArr[i].chargekW+'<br>'+'현재상태 : '+areaArr[i].chargestate+'<br>'+'업데이트일자 : '+
		     areaArr[i].update+'<br>'+'삭제여부?? : '+areaArr[i].NY+'</div>'
		 }); // 클릭했을 때 띄워줄 정보 HTML 작성
	    
		 markers.push(marker); // 생성한 마커를 배열에 담는다.
		 infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
	}
    
	 /* , areaArr[i].chargetype, areaArr[i].chargeway, areaArr[i].chargekW, areaArr[i].chargestate, areaArr[i].update */
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