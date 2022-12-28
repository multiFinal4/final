<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<tiles:insertAttribute name="top"></tiles:insertAttribute>
	</div>
	<div style="background-color: #edeef1;padding: 20px;height: 800px">
		
			<div class="row" style="margin-left: auto;margin-right: auto;">
			 	<div class="col-sm-2" style="background-color: white;margin-right:10px;padding: 0px ">
			 		 <div
			 		 style="border-color:white;height: 800px;">
				        <div style="background-color:#63cde7;padding: 20px;
				        font-family:HY-견고딕;font-size: 16pt;color: white;
				         font-weight: bolder;">${user.job_category}</div>

						<tiles:insertAttribute name="menu"></tiles:insertAttribute>
      				 </div>
			 	</div>
			 	<div class="col-sm-9" style="background-color: white;height: 800px;">
					<tiles:insertAttribute name="content"></tiles:insertAttribute>
			 	</div>
			</div>
	</div>
	
</body>
</html>




