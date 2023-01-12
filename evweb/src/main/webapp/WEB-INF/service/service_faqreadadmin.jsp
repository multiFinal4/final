<%@page import="com.project.faq.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>service</title>
</head>
<body>
	<!-- Admin View -->
	<div class="col-lg-8">
		<!-- 가로범위 -->
		<div class="card-body">
			<h5 class="card-title">
				<strong>FAQ 읽기</strong>
			</h5>
			<hr />
			
<%
	FaqDTO list = (FaqDTO)request.getAttribute("list");
	%>
			<!-- General Form Elements -->

			<div class="row mb-3">
				<div class="col-sm-8">
					<label class="col-sm-2 col-form-label">제목 :</label> ${list.title}
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-sm-10">
					<!-- <label class="col-sm-2 col-form-label">내용</label> -->
					<div class="card">
						<div class="card-body" style="height: 150px">
							${list.content}</div>
					</div>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary"
						onclick="location.href='/evweb/faq/detail.do?key=_id&value=<%=list.get_id()%>&action=update'">수정하기</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/evweb/faq/delete.do?_id=<%=list.get_id()%>&action=delete'">삭제하기</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/evweb/service/list.do?board_category=all'">목록보기</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>