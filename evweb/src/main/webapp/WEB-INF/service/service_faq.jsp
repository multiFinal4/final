<%@page import="com.project.faq.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>service</title>
</head>
<body>
	<div class="col-lg-8">
		<!-- 가로범위 -->
		<div class="card-body">
			<h5 class="card-title">
				<strong>FAQ</strong>
			</h5>
			<br />
			<hr>
	<div class="col-lg-8">  <!-- 가로범위 ~ 문의글작성 범위인데 통일성을 위해서 일단 넣어놨어요-->
		<div class="card-body">
			<h5 class="card-title">
			</h5>
			<br />
		<%-- 	<%
List<FaqDTO> mongolist  =	(List<FaqDTO>)request.getAttribute("mongolist"); 
	   int size = mongolist.size();
%> --%>
			<h3><a href="/evweb/service/faqinsert">faq 작성하러 가기</a></h3>
			
				<%-- <table align="center" border="1" width="600">
		<tr bgcolor="skyblue">
			<th>아이디</th><th>자바</th><th>성명</th>
			<th>주소</th><th>부서번호</th>
			<th>삭제</th>
		</tr>
		<%
		for(int i = 0;i<size;i++){
			FaqDTO user = mongolist.get(i);
		%>
			<tr>
				<td><a
 href="/mongodb/score/detail?key=id&value=<%=user.getId()%>&action=read"><%= user.getId() %></a></td>
				<td><%= user.getJava()%></td>
				<td><%= user.getName() %></td>
				<td><%= user.getAddr() %></td>
				<td><%= user.getDept()%></td>
				<td>
				
		<a href="mybatisDel.do?id=<%=user.getId() %>">삭제</a></td>
			</tr>
			
		<%} %>
		<tr>
			<td colspan="6">
			<a href="/mongodb/score/paginglist?pageNo=0">1</a>
			<a href="/mongodb/score/paginglist?pageNo=1">2</a>
			<a href="/mongodb/score/paginglist?pageNo=2">3</a>
			<a href="/mongodb/score/paginglist?pageNo=3">4</a>
			</td>
		</tr>
	</table> --%>
	
		</div>
	</div>
	</div>
	</div>
	
</body>
</html>