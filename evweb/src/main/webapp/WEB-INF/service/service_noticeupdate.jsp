<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.project.notice.NoticeDTO"%>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-8">
		<h5 class="card-title">
			<strong style="color: navy;">공지사항 수정</strong>
		</h5>
		<hr />
		<form class="form-horizontal" action="/evweb/notice/update.do"
			method="post">
			<div class="row mb-3">
				<div class="col-sm-8">
					<h5>
						<label id="notice_no" class="col-sm-8 col-form-label"> <strong>No.</strong>${notice.notice_no}</label>
					</h5>
				</div>
			</div>
			<input type="hidden" name="notice_no" value="${notice.notice_no }">
			<div class="row mb-3">
				<div class="col-sm-8">
					<label for="inputCategory" class="col-sm-2 col-form-label">작성자
						:</label> ${notice.manager_id }
				</div>
				<input type="hidden" name="manager_id" value="${notice.manager_id }">
			</div>
			<div class="row mb-3">
				<div class="col-sm-8">
					<label class="col-sm-3 col-form-label">최초 작성날짜 :</label>
					${notice.notice_writedate }
				</div>
				<br> <br> <input type="hidden" name="notice_writedate"
					value="${notice.notice_writedate }">
			</div>
			<div class="row mb-3">
				<div class="col-sm-10">
					<label class="col-sm-12 col-form-label"><span
						class="help-block" style="color: gray;"> 게시글 유형에 맞는 내용으로 작성
							부탁드립니다. </span></label> <input type="text" class="form-control"
						name="notice_title" value="${notice.notice_title }">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-10">
					<div class="card">
						<textarea name="notice_content"
							style="border: 1px; border-color: gray; height: 200px;">  ${notice.notice_content }</textarea>
					</div>
				</div>
			</div>
			<br> <br>
			<div class="row mb-3">
				<div class="col-sm-10" style="text-align: right;">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/evweb/Notice/list.do'">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>