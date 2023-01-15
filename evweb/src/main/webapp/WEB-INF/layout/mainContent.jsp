<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/evweb/css/main.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=odl70mizmg"></script>
</head>
<body class="hero-anime">
	<div class="main">
		<section class="section d-flex">
			<div class="bgOver"></div>
			<div class="mainText">
				<div>
					<h2>
						<span>C</span><span>h</span><span>a</span><span>r</span><span>g</span><span>i</span><span>n</span><span>g</span>
						<span> </span><span>Je</span><span>Ju</span>
					</h2>
					<h1>
						<span>차</span><span>지</span><span>모</span><span>양</span>
					</h1>
					<p class="mb-0">
						차지모양이란? <br> 차지는 충전과 공간을 뜻하는 중의적인 표현이며, <br> 모양은 '모으다'의
						제주 방언입니다.
					</p>
				</div>
			</div>
			<div class="my-5 py-5"></div>
			<span class="mainScroll"> scroll <span class="scrollIcon">
					<i class="bi bi-mouse"></i>
			</span>
			</span>
		</section>

		<section class="section">
			<br> <br> <br> <br> <br> 
			<div class="main-wrap-indicate flex-center">
				<i class="bi bi-chevron-down"></i></i><!-- <img src="/evweb/images/main_indicate.png"> -->
			</div>
			<div class="main-wrap2">
				<br> <br> <br> <br> <br> <br>
				<div class="main-wrap2">
					<div class="wrap">
						<div class="service-flex" style="text-align: center;">
							<div class="service-box shadow " id="chargerCnt">
								<div class="service-text1 blue">전체 맵</div>
								<div class="service-text2">
									전체 맵 한눈에 보기<br>
								</div>
								<div class="service-img">
									<img src="/resources/img/index/main_box1.png">
								</div>
							</div>
							<div class="service-box shadow" id="bidList">
								<div class="service-text1 blue">충전소 조회</div>
								<div class="service-text2">
									이용가능한 충전소 정보<br> 확인하기
								</div>
								<div class="service-img">
									<img src="/resources/img/index/main_box2.png">
								</div>
							</div>
							<div class="service-box shadow" id="csFee">
								<div class="service-text1 blue">충전 요금 정보</div>
								<div class="service-text2">
									충전사 별 충전요금<br> 확인하기
								</div>
								<div class="service-img">
									<img src="/resources/img/index/main_box3.png">
								</div>
								<div>
									<img src=""><a href="/evweb/fee.do"></a>
								</div>
							</div>
							<div class="service-box shadow" id="statistics">
								<div class="service-text1 blue">충전소 랭킹???</div>
								<div class="service-text2">
									!~!3~한 랭킹정보<br> 확인하기
								</div>
								<div class="service-img">
									<img src="/resources/img/index/main_box4.png">
								</div>
							</div>
						</div>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br>
			</div>
		</section>
		<section>
			<br> <br> <br> <br> <br>
			 <br> <br> 내용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ <br><br> <br> <br> <br> 
			 <br> <br> <br> <br> <br> 
		
		</section>
	</div>
</body>
<script>
	(function($) {
		"use strict";

		$(function() {
			var header = $(".start-style");
			$(window).scroll(function() {
				var scroll = $(window).scrollTop();

				if (scroll >= 10) {
					header.removeClass('start-style').addClass("scroll-on");
				} else {
					header.removeClass("scroll-on").addClass('start-style');
				}
			});
		});

		//Animation

		$(document).ready(function() {
			$('body.hero-anime').removeClass('hero-anime');
		});
	})(jQuery);

	/* 	var jeju = new naver.maps.LatLngBounds(new naver.maps.LatLng(33.5864,
	 126.0526), new naver.maps.LatLng(33.1508, 127.0391));

	 var map = new naver.maps.Map("map", {
	 minZoom : 11, // 읍면동 레벨
	 maxBounds : jeju,
	 });

	 var rect = new naver.maps.Rectangle({
	 strokeOpacity : 0,
	 strokeWeight : 0,
	 fillOpacity : 0.2,
	 bounds : jeju,
	 map : map
	 }); */
</script>
</html>



