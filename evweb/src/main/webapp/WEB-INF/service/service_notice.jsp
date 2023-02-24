<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>service</title>
</head>
<body>
	<!-- User View -->
	<div>
		<h1 class="pagetitle">공지사항</h1>
		<br />
		<!-- 본문 시작 -->
		<table class="table table-hover">
			<thead>
				<tr bgcolor="#FFFFFF">
					<th>제목</th>
					<th></th>
				</tr>

				<c:forEach var="notice" items="${noticelist }">
					<c:choose>
						<c:when test="${notice.notice_fix eq 'y'}">
							<tr>
								<td> 📌 <a
									href="/evweb/notice/read.do?notice_no=${notice.notice_no }&state=READ">${notice.notice_title }</a></td>
								<td scope="col" style="width: 200px">${notice.notice_writedate }</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:forEach var="notice" items="${noticelist }">
					<c:choose>
						<c:when test="${notice.notice_fix eq 'n'}">
							<tr>
								<td><a
									href="/evweb/notice/read.do?notice_no=${notice.notice_no }&state=READ">${notice.notice_title }</a></td>
								<td scope="col" style="width: 200px">${notice.notice_writedate }</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>

			</thead>
		</table>
	</div>
</body>
</html>