<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Insert title here</title>
	  	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  
		<script type="text/javascript">
		  	$(document).ready(function () {
		  		// 스크롤이벤트
			    $(window).scroll(function () {
			        if ($(window).scrollTop() > 50) {
			            $('#header').addClass("on");
			        } else {
			            $('#header').removeClass("on");
			        }
			    });
			})
		</script>
	</head>
	<body>
	  	<header id="header" class="fixed-top index">
			<tiles:insertAttribute name="top"></tiles:insertAttribute>
		</header>
		<div id="content">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
		<footer id="footer" class="mainFooter">
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</footer>
	</body>
</html>