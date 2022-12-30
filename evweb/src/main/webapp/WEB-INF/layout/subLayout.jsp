<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>sub</title>
	</head>
	<body>
		<header id="header">
			<tiles:insertAttribute name="top"></tiles:insertAttribute>
		</header>
		<div id="content">
				<div class="row" style="margin-left: auto;margin-right: auto;">
			 		 <div id="sideNav" class="col-sm-2">
						<tiles:insertAttribute name="menu"></tiles:insertAttribute>
      				 </div>
				 	<div id="container" class="col-sm-10">
						<tiles:insertAttribute name="content"></tiles:insertAttribute>
				 	</div>
				</div>
		</div>
		<footer id="footer" class="sub">
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</footer>
	</body>
</html>




