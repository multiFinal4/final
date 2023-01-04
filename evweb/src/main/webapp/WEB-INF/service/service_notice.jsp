<%@page import="com.project.notice.NoticeController"%>
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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>

	<div class="col-lg-8">
		<!-- 가로범위 -->
		<div class="card-body">
			<h5 class="card-title">
				<strong>공지사항</strong>
			</h5>
			<hr>
			<!-- 본문 시작 -->
				<div class="containar">
					<div class="row">
						<table align="center" border="0" width="700">
							<tr bgcolor="#FFFFFF">
								<th><h3>제목</h3></th>
								<th><h3>날짜</h3></th>
								<th><h3>삭제</h3></th>
							</tr>
							<tbody>
							<c:forEach var="notice" items="${noticelist }">
								<tr>
									<td><a
										href="/evweb/notice/read.do?notice_no=${notice.notice_no }&state=READ">${notice.notice_title }</a></td>
									<td>${notice.notice_writedate }</td>
									<%-- <td><a href="/evweb/notice/delete.do?notice_no=<%=notice.getNotice_no() %>">삭제</a></td> --%>
								</tr>
								</c:forEach>
								
						</table>
						<br>
					</div>
				</div>
			
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/evweb/service/noticeinsert"
				style="text-align: right;">글쓰기</a></li>
		</ul>
	</div>

</body>
</html>