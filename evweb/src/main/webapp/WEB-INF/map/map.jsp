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
		$(".mapClose").click(function() {
			$(".mapMarkerWrap").removeClass("on");
		});
		
		$("input:checkbox").click(function() {

			/* var checkboxValues = [];
		    $("input[name='filter']:checked").each(function(i) {
		        checkboxValues.push($(this).val());
		    });
			
		    for (var i = 0; i < checkboxValues.length; i++) {
		    	if (checkboxValues[i] != "Y") {
					checkboxValues[i] = "N";
				}
			}
		     */
          	var chckVal = "";
			if($(this).prop('checked')) {
				chckVal = $(this).val();
	        }
			else {
				chckVal = "N";
			} 
			
			$.ajax({
				url: "/evweb/ajax/map/search.do",
				type: "get",
				data: {
					"category" : cate,
					"keyword" : key,
					"park" : chckVal
				},
				success: function(data){
					strHTML = "";
					var testArr = [];
					for (var i = 0; i < data.length; i++) {
						strHTML += "<div class='card mb-1 mr-1'>";
						strHTML += "    <div class='card-body'>";
						strHTML += "		<h5 class='card-title'><i class='bi bi-geo-alt-fill mr-1'></i>";
						strHTML += 				data[i].station_name;
						strHTML += "		</h5>";
						strHTML += "		<h6 class='card-subtitle mb-2 text-muted'>";
						strHTML	+=				data[i].addr_do+" "+data[i].addr_sigun+"<br>"+data[i].addr_detail;
						strHTML += "		</h6>";
						strHTML += "		<p class='card-text mb-0'><i class='bi bi-building'></i>";
						strHTML +=  			data[i].station_company;
						strHTML += "		</p>";
						strHTML += "		<p class='card-text mb-0'><i class='bi bi-clock'></i>";
						strHTML +=				data[i].use_time;
						strHTML += "		</p>";
						strHTML += "    	<span class='clickInfo'><i class='bi bi-send-fill'></i></span>";
						strHTML += "    </div>";
						strHTML += "</div>";
						
						testArr.push(data[i]);
					}
					$(".mapSearchList").html(strHTML);
					initMap(chckVal, testArr);
										
					// String으로 변환하여 출력
					
				},
				error: function(){
				  console.error("insertDiagram.do Error");
				}
			});
		});
		
		
	});
	
	function initMap(chckVal, testArr) { 
		
		var map = new naver.maps.Map('map', {
	        center: new naver.maps.LatLng(33.3885379, 126.5626925), //지도 시작 지점
	        zoom: 11, //지도의 초기 줌 레벨
	        minZoom: 11, //지도의 최소 줌 레벨
	        zoomControl: true, //줌 컨트롤의 표시 여부
	        zoomControlOptions: { //줌 컨트롤의 옵션
	       		position: naver.maps.Position.TOP_RIGHT
	        }
	    });

        map.setOptions("tileTransition", true); //타일 fadeIn 효과 켜기
        
		var markers = []; // 마커 정보를 담는 배열
		var infowindowList = []; // 정보창을 담는 배열
		//var list = [];
		
		
		var areaArr = [];  // 충전소 정보 담는 배열
		
		// 주차 체크여부
		if (chckVal != "Y") {
			<c:forEach items="${stationList}" var="list">
				areaArr.push({
								chargeid : "${list.station_id}" , 
								chargeName : "${list.station_name}" , 
								lat : "${list.map_latitude}", 
								lng : "${list.map_longtude}"
							});
			</c:forEach>
			
		}else{
			for (var i = 0; i < testArr.length; i++) {
				areaArr.push({
					chargeid : testArr[i].station_id, 
					chargeName : testArr[i].station_name , 
					lat : testArr[i].map_latitude, 
					lng : testArr[i].map_longtude
				});
			}

		}

		for (var i = 0; i < areaArr.length; i++) {
		    var marker = new naver.maps.Marker({
		        map: map,
		        title: areaArr[i].chargeName, // 지역구 이름 
		        icon:{
		        	content:"<img alt='Marker' src='/evweb/images/location-pin.png' style='width:30px;'>"
		        },
		        size: new naver.maps.Size(38, 58),
		        anchor: new naver.maps.Point(19, 58),
		        position: new naver.maps.LatLng(areaArr[i].lat , areaArr[i].lng) // 지역구의 위도 경도 넣기 
		    });
		    
		    
		    /* 정보창 */
			var stationInfo = "";
			    stationInfo += "<div class='markerInfo'><div class='markerName'>";
			    stationInfo += areaArr[i].chargeName;
			    stationInfo += "</div></div>";
		    var infoWindow = new naver.maps.InfoWindow({
		    		content: stationInfo,
		    		borderWidth: 0,
		    	    disableAnchor: true,
		    	    backgroundColor: 'transparent',
		    	    pixelOffset: new naver.maps.Point(0, -28),
		    	}); // 클릭했을 때 띄워줄 정보 HTML 작성
													    
			markers.push(marker); // 생성한 마커를 배열에 담는다.
			infowindowList.push(infoWindow); // 생성한 정보창을 배열에 담는다.
			//list.push("1");
			
		}
		

	    for (var i=0, ii=markers.length; i<ii; i++) {
	    	naver.maps.Event.addListener(map, "click", ClickMap(i));
	        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
	        
	  	}
	    // 리스트 클릭해도 이동
	    var $mapSearchList = $(".mapSearchList").children("div");
	    
	    $mapSearchList.click(function() {
			var i = $(this).index();
			naver.maps.Event.trigger(markers[i], 'click', getClickHandler(i));
		});
	    
	    // 제주도 중심으로 이동
	    $(".mapControl .center").click(function() {
			$(".mapMarkerWrap").removeClass("on");
	    	naver.maps.Event.trigger(map, "click", ClickMap(i));
	    	map.setCenter(new naver.maps.LatLng(33.3885379, 126.5626925));
	    	map.setZoom(11);

	    });
		
	    // 지도클릭 시 안내창 닫기
		function ClickMap(i) {
			return function () {
			  var infowindow = infowindowList[i];
			  infowindow.close()
			}
		}
	    // 마커클릭 이벤트
	    function getClickHandler(i) {
            return function(e) {  // 마커를 클릭하는 부분
            	$(".mapMarkerWrap").addClass("on");
                var marker = markers[i], // 클릭한 마커의 index 찾기
                    infoWindow = infowindowList[i]; // 클릭한 마커와 동일한 index 안내창
                if (infoWindow.getMap()) {
                    infoWindow.close();
                } else {
                    infoWindow.open(map, marker); // 나타내기
                    map.setZoom(18, false);
                    map.panTo(marker.position);
                }
                markerClickAjax(i);
                
    		}
    	}
	    
	    // ajax로 클릭한 충전소 정보 받아오기
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
						strHTML += "  <p class='chargerType d-flex mb-0'>"+chgerType+"/ "+data[i].method;
						// 충전기상태 (1: 통신이상, 2: 충전대기,3: 충전중, 4: 운영중지,5: 점검중, 9: 상태미확인)
						chgerStat = data[i].stat;
						state = "";
						switch (chgerStat) {
						case "1":
							chgerStat = "통신이상";
							state = "err";
							break;
						case "2":
							chgerStat = "충전대기";
							break;
						case "3":
							chgerStat = "충전중";
							state = "charging";
							break;
						case "4":
							chgerStat = "운영중지";
							state = "stop";
							break;
						case "5":
							chgerStat = "점검중";
							state = "fix";
							break;
						default:
							chgerStat = "상태미확인";
							state = "noSign";
							break;
						}
						
						strHTML += "  	<span class='"+state+"'>"+chgerStat+"</span>";
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
</script>
</head>
<body>
	<div id="map" style="width: 100%; height: calc(100vh - 130px);"></div>
	<div class="mapMarkerWrap">
	    <div class="stationInfoTop">
	        <h4 class="stationInfoTitle pb-3 mb-3"><i class='bi bi-pin-fill'></i>충전소 정보</h4>
	        <span class="mapClose"><i class="bi bi-x-lg"></i></span>
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
	                <li class="d-flex">
	                    <h6>회원</h6>
	                    <p>
	                        <span class="fee"></span>
	                        <span class="unit">원/kWh</span>
	                    </p>
	                </li>
	                <li  class="d-flex">
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
	            <ul class="type d-flex pl-0">
	                <li class="pakring">
	                    <h6>주차여부</h6>
	                    <p>
	                        <span class="typeImg">
	                        	<i class="bi bi-p-circle"></i>
	                        </span>
	                    </p>
	                </li>
	                <li class="fac">
	                    <h6>편의제공</h6>
	                    <p>
	                        <span class="typeImg">
	                        	<i class="bi bi-cup-hot"></i>
	                        </span>
	                    </p>
	                </li>
	            </ul>
	        </div>
	    </div>
	    <div class="stationInfoMid">
	        <ul id="chargerInfo" class="pl-0"></ul>
	    </div>
	</div>
    <div class="mapControl">
        <button class="btn center mb-3" type="button"><i class="bi bi-geo-alt"></i></button>
        <button class="btn current" type="button"><i class="bi bi-record-circle"></i></button>
    </div>
</body>


</html>