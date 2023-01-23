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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src = "/evweb/js/jquery.fullpage.js" type="text/javascript"></script>
<style type="text/css">
.ib-container div {
	background: #fff;
	z-index: 1;
	box-shadow: 0px 0px 0px 10px rgba(255, 255, 255, 1), 1px 1px 3px 10px
		rgba(0, 0, 0, 0.2);
	transition: opacity 0.4s linear, transform 0.4s ease-in-out, box-shadow
		0.4s ease-in-out;
}

.ib-container div.blur {
	box-shadow: 0px 0px 20px 10px rgba(255, 255, 255, 1);
	transform: scale(0.9);
	opacity: 0.7;
}

.ib-container div.active {
	transform: scale(1.05);
	box-shadow: 0px 0px 0px 10px rgba(255, 255, 255, 1), 1px 11px 15px 10px
		rgba(0, 0, 0, 0.4);
	z-index: 50;
	opacity: 1;
}

@font-face {
	font-family: 'LeferiPoint-BlackA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-BlackA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#rankButton").on("click", function() {
			var querydata = {
				"station_name" : $("#station_name").val(),
				"charging_amount" : $("#charging_amount").val()
			}
			$.ajax({
				url : "/evweb/chargingAmountRank",
				type : "POST",
				data : querydata,
				dataType : "json",
				success : function(data) { // 갔다온 다음 결과값
					//	alert('seccuss');	// 나오면 파일을 찾았다는 것
					//	alert(data);  // [object Object],[object Object],[object Object]
	
					// 데이터를 확인하고 싶을 때.
					//	let str = JSON.stringify(data); // <> parse()
					//	alert(str); 
	
					$("#one1").html(data[0].station_name);
					$("#one2").html(data[0].charging_amount);
					$("#two1").html(data[1].station_name);
					$("#two2").html(data[1].charging_amount);
					$("#three1").html(data[2].station_name);
					$("#three2").html(data[2].charging_amount);
					
					/* $.each(data,function(index,item) { // 데이터 =item
						//index가 끝날때까지 
						$("#result").html(index+1 + "위. station_name : " 
													+ item.station_name
													+ ", charging_amount : "
													+ item.charging_amount
													+ "<br>");
					});  //end for문 */
				},  //end success
				error : error_run
			}) //end ajax
		}) //end click
	}) //end ready

	function error_run(obj, msg, statusMsg) {
		alert("오류발생" + obj + "," + msg + "," + statusMsg);
	}
	
	$(document).ready(function() {
		$('#fullpage').fullpage({
		    anchors: ['pg1', 'pg2','pg3'],
		    verticalCentered: false,
		    normalScrollElements: '.scrollable-element',
		    afterLoad : function(anchorLink, index){
		        if(index!=1){
		            $.fn.fullpage.setAllowScrolling(true);
		            $.fn.fullpage.setKeyboardScrolling(true);
		        }
		        if(index!=1) {
		            $('#header').addClass("on");
		        }else {
		            $('#header').removeClass("on");
		     }
		    }
		});
		$('.top button').on('click',function(){
		        $.fn.fullpage.moveTo(1);
		    });
		    $('.fp-enabled h1 a').on('click',function(){
		        $.fn.fullpage.moveTo(1);
		    });
		$(".top button").click(function() {
	        $("html, body").animate({
	            scrollTop : 0
	        }, 300);
	        return false;
	    });
		 
	});
</script>


<style type="text/css">


</style>

</head>
<body class="hero-anime">
	<div class="main" id="fullpage">
		<section class="section d-flex" id="section0" data-anchor="pg1">
			<div class="bgOver"></div>
			<div class="mainText">
				<div style="max-width: 25%">
					<h2>
						<span>C</span><span>h</span><span>a</span><span>r</span><span>g</span><span>i</span><span>n</span><span>g</span>
						<span> </span><span>Je</span><span>Ju</span>
					</h2>
					<h1>
						<span>차</span><span>지</span><span>모</span><span>양</span>
					</h1>
					<p class="mb-0" style="width: 600px;">
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

		<section class="section" id="section1" data-anchor="pg2">
			<div class="main-wrap2">
				<br> <br> <br> <br> <br> <br> 
				<div style="text-align: center;"><img src="/evweb/images/main/title.png" style="width: 300px;"></div>
				<div class="main-wrap2">
					<div class="wrap">
						<div class="service-flex ib-container" id="ib-container"
							style="text-align: center;">
							<!-- z-index : 50 -->
							<div class="service-box shadow"
								onclick="location.href='/evweb/map'">
								<p class="service-text1 blue">전체 맵</p>
								<p class="service-text2">
									전체 맵 한눈에 보기<br>
								</p>
								<p class="service-img">
									<img src="/evweb/images/main/map2.png" style="width: 118px;">
								</p>
							</div>
							<div class="service-box shadow"
								onclick="location.href='/evweb/fee.do'">
								<p class="service-text1 blue">충전소 조회</p>
								<p class="service-text2">
									이용가능한 충전소 정보보기<br>
								</p>
								<p class="service-img">
									<img src="/evweb/images/main/충전소.png" style="width: 115px;">
								</p>
							</div>
							<div class="service-box shadow"
								onclick="location.href='/evweb/fee.do'">
								<p class="service-text1 blue">충전 요금 정보</p>
								<p class="service-text2">
									충전사 별 충전요금보기<br>
								</p>
								<p class="service-img">
									<img src="/evweb/images/main/859976dbb1564980.png"
										style="width: 150px;">
								</p>
							</div>
							<div class="service-box shadow btn trigger" id="rankButton">
								<p class="service-text1 blue">충전소 랭킹</p>
								<p class="service-text2">
									충전량 top3 랭킹보기<br>
								</p>
								<p class="service-img" id="button">
									<img src="/evweb/images/main/c791069357b39fde.png" style="width: 125px;">
								</p>
							</div>
						</div>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br> <br> 
				<br>
			</div>
		</section>
		<section class="section sectionfooter fp-auto-height" id="section2" data-anchor="pg3">
		<div class="footer-top">
	      <div class="container">
	     	 <div class="top">
               	<button></button>
             </div>
	        <div class="row">
	          <div class="col-lg-4 col-md-6 footer-contact">
	            <h3>차지모양</h3>
	          </div>
	
	          <div class="col-lg-4 col-md-6 footer-links">
	            <h4>사업자 정보</h4>
	              <strong>주소:</strong><div>
	              서울특별시 강남구 언주로<br>
	              508 14층(역삼동, 서울상록빌딩)<br>
	              <br>
	              <strong>Phone:</strong> +82 10-5554-5555<br>
	              <strong>Email:</strong> multi4@gmail.com<br>
	              <strong>CEO:</strong> 차현수 <br>
	              <strong>사업자등록번호:</strong> 111-11-12345<br>
	            </div>
	          </div>
	
	          <div class="col-lg-4 col-md-6 footer-links">
	            <h4>Our Services</h4>
	            <ul>
	              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
	              <li><i class="bx bx-chevron-right"></i> <a href="/evweb/map">Map</a></li>
	              <li><i class="bx bx-chevron-right"></i> <a href="/evweb/fee.do">요금정보</a></li>
	              <li><i class="bx bx-chevron-right"></i> <a href="/evweb/monitoring/main?stationId=BNJG3401">충전소현황</a></li>
	              <li><i class="bx bx-chevron-right"></i> <a href="/evweb/Notice/list.do">고객센터</a></li>
	            </ul>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="container footer-bottom clearfix">
	      <div class="copyright">
	        &copy; Copyright <strong><span>충전해조</span></strong>. All Rights Reserved
	      </div>
	    </div>
	
	  <div id="preloader"></div>
	  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
	    
		</section>

		<!-- Modal -->
		<!-- 2021년부터 누적된 충전소별 충전량 총 합계 3위랭킹 -->
		<div class="modal-wrapper" style="backdrop-filter: blur(5px);">
			<div class="modal" style="z-index: 100;">
				<div class="head">
					<a class="btn-close trigger" href="#"> <i class="fa fa-times"
						aria-hidden="true"><i class="bi bi-x-lg"></i></i>
					</a>
				</div>
				<div class="content" style="text-align: center;">
					<h3>RANKING</h3>
					<img src="/evweb/images/main/first-place.png"style="width: 80px;">
					<br>
					<br>
					<h5>
						<span id="one1"></span>,  충전량 : <span id="one2"></span>
						<img src="/evweb/images/main/medal3.png"style="width: 60px;"><hr/>
						
						<span id="two1"></span>,  충전량 : <span id="two2"></span>
						<img src="/evweb/images/main/medal.png"style="width: 60px;"><hr/>

						<span id="three1"></span>,  충전량 : <span id="three2"></span>
						<img src="/evweb/images/main/medal2.png"style="width: 60px;">
					</h5>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	/* 랭킹 모달 */
	$(document).ready(function() {
		$('.trigger').on('click', function() {
			$('.modal-wrapper').toggleClass('open');
			return false;
		});
	});


	/* 메인 글자 효과*/
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

	/* 하단 박스 효과 */
	var $container = $('#ib-container'), $articles = $container.children('div'), timeout;

	$articles.on('mouseenter', function(event) {

		var $article = $(this);
		clearTimeout(timeout);
		timeout = setTimeout(function() {

			if ($article.hasClass('active'))
				return false;

			$articles.not($article).removeClass('active').addClass('blur');

			$article.removeClass('blur').addClass('active');

		}, 10);

	});

	$container.on('mouseleave', function(event) {

		clearTimeout(timeout);
		$articles.removeClass('active blur');

	});

</script>
</html>



