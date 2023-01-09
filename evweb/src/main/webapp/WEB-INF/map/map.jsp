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
<script type="text/javascript">
	$(document).ready(function() {
		initMap();
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
	});
	
	function initMap() { 
		var areaArr = new Array();  // 충전소 정보 담는 배열
		<c:forEach items="${stationList}" var="list">
			areaArr.push({
							chargeid : "${list.station_id}" , 
							chargeName : "${list.station_name}" , 
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
		    var marker = new naver.maps.Marker({
		        map: map,
		        title: areaArr[i].chargeName, // 지역구 이름 
		        position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
		    });
		    
		    /* 정보창 */
			var stationInfo = "";
			    stationInfo += "<div style='width:200px;text-align:center;padding:10px;'>";
			    stationInfo += areaArr[i].chargeName;
			    stationInfo += "</div>";
		    var infoWindow = new naver.maps.InfoWindow({content: stationInfo }); // 클릭했을 때 띄워줄 정보 HTML 작성
													    
			markers.push(marker); // 생성한 마커를 배열에 담는다.
			infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
		}
	    
	    function getClickHandler(i) {
            return function(e) {  // 마커를 클릭하는 부분
                var marker = markers[i], // 클릭한 마커의 시퀀스로 찾는다.
                    infoWindow = infoWindows[i]; // 클릭한 마커의 시퀀스로 찾는다
                if (infoWindow.getMap()) {
                    infoWindow.close();
                } else {
                    infoWindow.open(map, marker); // 표출
                }
				
                markerClickAjax(i);
                
    		}
    	}
	    
	    for (var i=0, ii=markers.length; i<ii; i++) {
	    	console.log(markers[i] , getClickHandler(i));
	        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
	    }
	    
		function markerClickAjax(i) {
			$.ajax({
				url: "/evweb/ajax/mapStation",
				type: "get",
				data: {
					"stationId" : areaArr[i].chargeid
				},
				success:function(data){
				    $(".stationInfoTitle").html("<i class='bi bi-pin-fill'></i>"+data.station_name);
				    $(".stationInfoAddr .addr").text(data.addr_do+data.addr_sigun+data.addr_detail);
				    $(".stationInfoCom .com").text(data.station_company);
				    $(".stationInfoTime .time").text(data.use_time);
				    if(data.parking_free == 'Y'){
				    	$("li.pakring").addClass("on");				    	
				    };
				    if(data.trafficYn == 'Y'){
				    	$("li.fee").addClass("on");				    	
				    };
				},
				error: function(){
				  console.error("insertDiagram.do Error");
				}
			});
			
			$.ajax({
				url: "/evweb/ajax/chargerInfo",
				type: "get",
				data: {
					"stationId" : areaArr[i].chargeid
				},
				success:function(data){
					strHTML = "";
					var on = ["","","",""];
					chargerNo = $(".chargerNo .type li");
					for (var i = 0; i < data.length; i++) {
						strHTML += "<li class='chargerNo d-flex'>";
						strHTML += "  <h5>"+data[i].charger_id+"</h5>";
						
						// 충전기타입(01:DC차데모,	02: AC완속,	03: DC차데모+AC3상,04: DC콤보,05: DC차데모+DC콤보,06: DC차데모+AC3상+DC콤보,	07: AC3상)
						chgerType = data[i].charger_type;
						switch (chgerType) {
						case "01":
							chgerType = "DC차데모";
							on[1] = "on";
							break;
						case "02":
							chgerType = "AC완속";
							on[3] = "on";
							break;
						case "03":
							chgerType = "DC차데모+AC3상";
							on[1] = "on";
							on[2] = "on";
							break;
						case "04":
							chgerType = "DC콤보";
							on[0] = "on";
							break;
						case "05":
							chgerType = "DC차데모+DC콤보";
							on[0] = "on";
							on[1] = "on";
							break;
						case "06":
							chgerType = "DC차데모+AC3상+DC콤보";
							on[0] = "on";
							on[1] = "on";
							on[2] = "on";
							break;
						default:
							chgerType = "AC3상";
							on[2] = "on";
							break;
						}
						strHTML += "  <p class='chargerType d-flex mb-0'>"+chgerType+"/"+data[i].method;
						strHTML += "  	<span>"+data[i].stat+"</span>";
						strHTML += "  </p>";
						strHTML += "  <ul class='type d-flex'>";
						strHTML += "      <li class='"+on[0]+"'>";
						strHTML += "          <h6>DC콤보</h6>";
						strHTML += "          <span class='typeImg'>";
						strHTML += "          	<img alt='DC콤보' src='/evweb/images/DC콤보.png'>";
						strHTML += "          </span>";
						strHTML += "      </li>";
						strHTML += "      <li class='"+on[1]+"'>";
						strHTML += "          <h6>DC차데모</h6>";
						strHTML += "          <span class='typeImg'>";
						strHTML += "          	<img alt='DC콤보' src='/evweb/images/DC차데모.png'>";
						strHTML += "          </span>";
						strHTML += "      </li>";
						strHTML += "      <li class='"+on[2]+"'>";
						strHTML += "          <h6>AC3상</h6>";
						strHTML += "          <span class='typeImg'>";
						strHTML += "          	<img alt='DC콤보' src='/evweb/images/AC3상.png'>";
						strHTML += "          </span>";
						strHTML += "      </li>";
						strHTML += "      <li class='"+on[3]+"'>";
						strHTML += "          <h6>AC완속</h6>";
						strHTML += "          <span class='typeImg'>";
						strHTML += "          	<img alt='DC콤보' src='/evweb/images/AC완속.png'>";
						strHTML += "          </span>";
						strHTML += "      </li>";
						strHTML += "  </ul>";
					    strHTML += "</li>";
					}
					$("#chargerInfo").html(strHTML);
					
				},
				error: function(){
				  console.error("insertDiagram.do Error");
				}
			});
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
	
	
</script>
</head>
<body>
	<div id="map" style="width: 100%; height: calc(100vh - 130px);"></div>
	<div class="mapMarkerWrap">
	    <div class="stationInfoTop">
	        <h4 class="stationInfoTitle pb-3"><i class='bi bi-pin-fill'></i>충전소 정보</h4>
	        <div class="stationInfoAddr d-flex">
	            <h5>주소</h5>
	            <span class="addr"></span>
	        </div>
	        <div class="stationInfoCom d-flex">
	            <h5>운영기관</h5>
	            <span class="com"></span>
	        </div>
	        <div class="stationInfoTime d-flex">
	            <h5>운영시간</h5>
	            <span class="time"></span>
	        </div>
	        <div class="chargeFee d-flex">
	            <h5>충전 요금</h5>
	            <ul class="type d-flex">
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
	        <div class="stationFac d-flex">
	            <h5>편의시설</h5>
	            <ul class="type d-flex">
	                <li class="pakring">
	                    <h6>주차여부</h6>
	                    <p>
	                        <span class="typeImg"></span>
	                    </p>
	                </li>
	                <li class="fac">
	                    <h6>편의제공</h6>
	                    <p>
	                        <span class="typeImg"></span>
	                    </p>
	                </li>
	            </ul>
	        </div>
	    </div>
	    <div class="stationInfoMid">
	        <ul id="chargerInfo" class="pl-0"></ul>
	    </div>
	</div>
</body>


</html>