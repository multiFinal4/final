<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		<title>Top</title>
		<meta content="" name="description">
		<meta content="" name="keywords">
		<link rel="icon" href="/evweb/images/favicon/favicon.ico" type="image/x-icon" sizes="16x16">
		<link rel="apple-touch-icon" sizes="57x57" href="/evweb/images/favicon/apple-icon-57x57.png">
		<link rel="apple-touch-icon" sizes="60x60" href="/evweb/images/favicon/apple-icon-60x60.png">
		<link rel="apple-touch-icon" sizes="72x72" href="/evweb/images/favicon/apple-icon-72x72.png">
		<link rel="apple-touch-icon" sizes="76x76" href="/evweb/images/favicon/apple-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="114x114" href="/evweb/images/favicon/apple-icon-114x114.png">
		<link rel="apple-touch-icon" sizes="120x120" href="/evweb/images/favicon/apple-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="144x144" href="/evweb/images/favicon/apple-icon-144x144.png">
		<link rel="apple-touch-icon" sizes="152x152" href="/evweb/images/favicon/apple-icon-152x152.png">
		<link rel="apple-touch-icon" sizes="180x180" href="/evweb/images/favicon/apple-icon-180x180.png">
		<link rel="icon" type="image/png" sizes="192x192"  href="/evweb/images/favicon/android-icon-192x192.png">
		<link rel="icon" type="image/png" sizes="32x32" href="/evweb/images/favicon/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="96x96" href="/evweb/images/favicon/favicon-96x96.png">
		<link rel="icon" type="image/png" sizes="16x16" href="/evweb/images/favicon/favicon-16x16.png">
		<link href="/evweb/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/evweb/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<link href="/evweb/css/font.css" rel="stylesheet">
		<link href="/evweb/css/common.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link href="/evweb/vendor/bootstrap/js/bootstrap.bundle.min.js" rel="stylesheet">
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="/evweb/js/common.js" type="text/javascript"></script>
		<script src="/evweb/js/main.js" type="text/javascript"></script>
		<script type="text/javascript">
		 	$(document).ready(function () {
		 		// 탑메뉴 페이지 포커싱 처리
		  		$(".navLeft ul").children("li").eq(page).children("a").addClass("active");
			
		  		$(window).scroll(function () {
			        if ($(window).scrollTop() > 50) {
			            $('#header').addClass("on");
			        } else {
			            $('#header').removeClass("on");
			        }
			    });
		 	});
	 	</script>
	 	<style type="text/css">
			 @font-face {
			    font-family: 'jejudoldam';
			    src: url('/evweb/css/jejudoldam.ttf');
				font-weight: normal;
			    font-style: normal;
			}
			
			h1 a{font-family: 'jejudoldam';}
 		</style>
	</head>
	<body>
	    <div class="d-flex align-items-center mainNav">
	      <h1 class="logo me-auto"><a href="/evweb/index">차지모양</a></h1>
	      <nav id="navbar" class="navbar">
			<div class="navLeft">
				<ul>
					<li><a class="nav-link" href="/evweb/index">HOME</a></li>
					<li><a class="nav-link" href="/evweb/map">Map</a></li>
					<li><a class="nav-link" href="/evweb/fee.do">요금정보</a></li>
					<li><a class="nav-link" href="/evweb/monitoring/main?stationId=BNJG3401">충전소현황</a></li>
					<li><a class="nav-link" href="/evweb/Notice/list.do">고객센터</a></li>
					<c:choose>
						<c:when test="${user.state=='재직'&&user.type=='사이트 관리자'}">
										<li><a class="nav-link" href="/evweb/admin/station/list?category=all&pageNo=1">관리자</a></li>
						
										<li><a class="getstarted" href="/evweb/logout.do">LOGOUT</a></li>
						</c:when>
						<c:when test="${user.state=='재직'&&user.type=='충전소 관리자'}">
							          	<li><a class="nav-link" href="/evweb/manager/read.do?read=MYPAGE&manager_id=${user.manager_id}">MYPAGE</a></li>
										<li><a class="getstarted" href="/evweb/logout.do">LOGOUT</a></li>
						</c:when>
						<c:when test="${user.state=='정상' || user.state=='카카오' }">
							          	<li><a class="nav-link" href="/evweb/customer/read.do?state=READ&customer_id=${user.customer_id}">MYPAGE</a></li>
										<li><a class="getstarted" href="/evweb/logout.do">LOGOUT</a></li>
						</c:when>
						<c:otherwise>
										<li><a class="getstarted" href="/evweb/login.do">LOGIN</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav>
	    </div>
	</body>
</html>