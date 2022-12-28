<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  <script src="/evweb/js/common.js" type="text/javascript"></script>
	  
	  <script type="text/javascript">
	  	$(document).ready(function () {
	  		// 탑메뉴 페이지 포커싱 처리
		  	$(".navLeft ul").children("li").eq(page).children("a").addClass("active");
		    $(document).scroll(function () {
		     
		    });
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
						<li><a class="nav-link" href="/evweb/monitoring">충전소현황</a></li>
						<li><a class="nav-link" href="/evweb/service">고객센터</a></li>
						<li><a class="nav-link" href="/evweb/admin">관리자</a></li>
			          	<li><a class="nav-link" href="/evweb/mypage">MYPAGE</a></li>
					</ul>
				</div>
				<div class="navRight">
			        <ul>
			          <li><a class="getstarted" href="/evweb/login.do">LOGIN</a></li>  
			          <li style="display: none;"><a class="getstarted" href="#">LOGOUT</a></li>  
			        </ul>
	        	</div>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav>
	    </div>
	</body>
</html>