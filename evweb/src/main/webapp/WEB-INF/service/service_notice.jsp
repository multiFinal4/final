<%@page import="java.util.ArrayList"%>
<%@page import="com.project.notice.NoticeDTO"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
</head>
<body>
	<%
		List<NoticeDTO> noticelist = (ArrayList<NoticeDTO>)request.getAttribute("noticelist");
		int size = noticelist.size();
	%>  
	<div class="col-lg-8">
		<!-- 가로범위 -->
		<div class="card-body">
			<h5 class="card-title">
				<strong>공지사항</strong>
			</h5>
			<br />
			<hr>
			<!-- 본문 시작 -->
			<div class="containar">
				<div class="row">
					<table calss="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>test 이용 문의</td>
								<td>2022-12-31</td>
							</tr>
						</tbody>
					</table>
					
				
		<%--  <c:forEach var="notice" items="${noticelist }">
					<a
						▶
							href="/evweb/notice/read.do?notice_no=${notice_tb.notice_no }&state=READ">${notice_tb.notice_title }</a>
					<br>
				</c:forEach> --%>
			</div>
			</div>


		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/evweb/notice/write.do" style="text-align: right;">글쓰기</a></li>
		</ul>
	</div>
	

</body>
</html>