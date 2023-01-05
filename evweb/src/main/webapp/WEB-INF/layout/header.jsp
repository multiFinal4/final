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
	  <link href="/evweb/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	  <link href="/evweb/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	  <link href="/evweb/css/font.css" rel="stylesheet">
	  <link href="/evweb/css/common.css" rel="stylesheet">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="/evweb/js/common.js" type="text/javascript"></script>
	  <script src="/evweb/js/main.js" type="text/javascript"></script>
	  <script type="text/javascript">
	  	$(document).ready(function () {
	  		// 탑메뉴 페이지 포커싱 처리
		  	$(".navLeft ul").children("li").eq(page).children("a").addClass("active");
		});
	  </script>
	</head>
	<body>
	    <div class="d-flex align-items-center mainNav">
	      <h1 class="logo me-auto"><a href="/evweb/index">충전해조</a></h1>
	      <nav id="navbar" class="navbar">
			<div class="navLeft">
				<ul>
					<li><a class="nav-link" href="/evweb/index">HOME</a></li>
					<li><a class="nav-link" href="/evweb/map">Map</a></li>
					<li><a class="nav-link" href="/evweb/monitoring/main?stationId=all">충전소현황</a></li>
					<li><a class="nav-link" href="/evweb/service">고객센터</a></li>
					<c:choose>
						<c:when test="${user.state=='재직'&&user.type=='사이트 관리자'}">
										<li><a class="nav-link" href="/evweb/admin/station/list?category=all&pageNo=1">관리자</a></li>
							          	<li><a class="nav-link" href="/evweb/mypage">MYPAGE</a></li>
										<li><a class="getstarted" href="/evweb/logout.do">LOGOUT</a></li>
						</c:when>
						<c:when test="${user.state=='재직'&&user.type=='충전소 관리자'||user.state=='정상'}">
							          	<li><a class="nav-link" href="/evweb/mypage">MYPAGE</a></li>
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