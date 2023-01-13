<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>차지모양</title>
		<link rel="icon" href="/evweb/images/favicon/favicon.ico" type="image/x-icon" sizes="16x16">
		<style type="text/css">
			#content{
				padding-top: 80px;
			}
		</style>
	</head>
	<body>
		<header id="header" class="fixed-top index sub">
			<tiles:insertAttribute name="top"></tiles:insertAttribute>
		</header>
		<div id="content">
				<div class="row" style="margin-left: auto;margin-right: auto;">
			 		 <div id="sideNav" class="col-sm-2">
						<tiles:insertAttribute name="menu"></tiles:insertAttribute>
      				 </div>
				 	<div id="container" class="col-sm-10" style="padding:0;">
						<tiles:insertAttribute name="content"></tiles:insertAttribute>
				 	</div>
				</div>
		</div>
		<footer id="footer" class="sub">
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</footer>
		<!-- 로딩창 -->
	      <div class="loading">
   				<div class="loader"></div>	
		  </div>
	</body>
</html>




