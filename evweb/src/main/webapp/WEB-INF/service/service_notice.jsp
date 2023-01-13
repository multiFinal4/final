<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>service</title>
</head>
<body>
	<div>
		<h1 class="pagetitle">공지사항</h1>
		<br/>
		<!-- 본문 시작 -->
		<table class="table table-hover">
			<thead>
				<tr bgcolor="#FFFFFF">
					<th>제목</th>
					<th></th>
				</tr>
				<c:forEach var="notice" items="${noticelist }">
					<tr>
						<td style="color: gray;">✔ <a
							href="/evweb/notice/read.do?notice_no=${notice.notice_no }&state=READ">  ${notice.notice_title }</a></td>
						<td style="text-align: right;">${notice.notice_writedate } </td>
						<%-- <td><a href="/evweb/notice/delete.do?notice_no=<%=notice.getNotice_no() %>">삭제</a></td> --%>
					</tr>
				</c:forEach>
			</thead>
		</table>
	</div>
	<div class="nav navbar-nav">
		<a href="/evweb/service/noticeinsert" style="text-align: right;">글쓰기</a>
	</div>
</body>
</html>