<%@page import="com.project.faq.FaqDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-8">
		<h5 class="card-title">
			<strong style="color: navy;">공지사항 수정</strong>
		</h5>
		<hr />
		<form class="form-horizontal"
			action="/evweb/faq/update?_id=${list._id}" method="post">
			<%-- 				<input type="hidden" name="_id" value="${list._id }"> --%>
			

			<div class="row mb-3">
				<div class="col-sm-10">
					<label class="col-sm-12 col-form-label"><span
						class="help-block" style="color: gray;"> 게시글 유형에 맞는 내용으로 작성
							부탁드립니다. </span></label> <input type="text" class="form-control" name="title"
						value="${list.title}">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-10">
					<div class="card">
						<textarea name="content"
							style="border: 1px; border-color: gray; height: 200px;">  ${list.content }</textarea>
					</div>
				</div>
			</div>
			<br> <br>
			<div class="row mb-3">
				<div class="col-sm-10" style="text-align: right;">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/evweb/admin_faq.do?pageNo=0'">취소</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>