<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.project.notice.NoticeDTO"%>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<script type="text/javascript">
	
</script>
<style type="text/css">
.btn-primary {
	background-color: #F37321;
	border-color: #F37321;
}
</style>
</head>
<body>
	<div>
		<h1 class="pagetitle">공지사항 수정하기</h1>
		<br />
		<form class="form-horizontal" action="/evweb/notice/update.do"
			method="post">


			<div class="form-group">
				<div class="col-md-2 text-right">
					<label id="notice_no" class="control-label">번호</label>
				</div>
				<div class="col-md-8">${notice.notice_no}</div>
			</div>
			<input type="hidden" name="notice_no" value="${notice.notice_no }">
			<div class="form-group" style="">
				<label class="col-sm-2 col-sm-2 control-label">작성자</label>
				<div class="col-sm-10">

					<p class="form-control-static">${notice.manager_id }</p>
					<input type="hidden" name="manager_id"
						value="${notice.manager_id }">
				</div>


				<!-- <div class="form-group"> -->
				<label class="col-sm-2 col-sm-2 control-label">제목</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="notice_title"
						value="${notice.notice_title }"> <span class="help-block">게시글
						유형에 맞는 내용으로 작성 부탁드립니다. </span>
					<!-- </div> -->
				</div>

				<!-- <div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">첨부파일</label>
			</div> -->
				<%-- 	<div class="col-md-8">
			<!-- 디비에 저장된 파일명을 출력(클라이언트가 선택한 파일명) : JSTL -->
			<c:forEach var="file" items="">
				<h5><a href="/erp/board/download/${notice.manager_id}/${notice.notice_no}/${file.boardFileno}">${file.originalFilename}</a></h5>
			</c:forEach>
			</div> --%>
			</div>

			<div class="form-group">
				<div class="col-md-2 text-right">
					<label for="notice_writedate" class="control-label">최초 작성날짜</label>
				</div>
				<div class="col-md-8">${notice.notice_writedate }</div>
				<input type="hidden" name="notice_writedate"
					value="${notice.notice_writedate }">
			</div>
			<div class="form-group">
				<label class="col-sm-2 col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea id="notice_content"
						style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
						rows=15 name="notice_content">${notice.notice_content } </textarea>

				</div>
			</div>

			<div class="form-group">
				<div class="col-md-2 text-right">
					<label for="notice_writedate" class="control-label">고정 여부</label>
				</div>
					<fieldset>
						<c:choose>
							<c:when test="${notice.notice_fix eq 'y'}">
						X <input type="radio" name="notice_fix" value="n" />
						O <input type="radio" name="notice_fix" value="y" checked />
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${notice.notice_fix eq 'n'}">
						X <input type="radio" name="notice_fix" value="n" checked />
						O <input type="radio" name="notice_fix" value="y" />
							</c:when>
						</c:choose>
					</fieldset>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-sm-10" style="text-align: right;">
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/evweb/admin_notice.do'">취소</button>
				</div>
			</div>

		</form>
	</div>
</body>
</html>