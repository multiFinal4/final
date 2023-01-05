<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</head>
<body>	
<h4>
		<i class="fa fa-angle-right"></i> 게시글 열람하기
	</h4>
	<hr>

	<form class="form-horizontal" 
		action="/evweb/notice/read.do?state=UPDATE&notice_no=${notice.notice_no }" 
		method="post" >

		
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">번호</label>
			</div>
			<div class="col-md-8">${notice.notice_no}</div>
		</div>
	<%-- 	<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="id" class="control-label">작성자</label>
			</div>
			<div class="col-md-8">${board.id}</div>
		</div> --%>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="notice_title" class="control-label">제목</label>
			</div>
			<div class="col-md-8">${notice.notice_title }</div>
		</div>
		
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">첨부파일</label>
			</div>
		<%-- 	<div class="col-md-8">
			<!-- 디비에 저장된 파일명을 출력(클라이언트가 선택한 파일명) : JSTL -->
			<c:forEach var="file" items="">
				<h5><a href="/erp/board/download/${notice.manager_id}/${notice.notice_no}/${file.boardFileno}">${file.originalFilename}</a></h5>
			</c:forEach>
			</div> --%>
			</div>
		
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="title" class="control-label">작성날짜</label>
			</div>
			<div class="col-md-8">${notice.notice_writedate }</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 text-right">
				<label for="text" class="control-label">내용</label>
			</div>
			<div class="col-md-8"
				style="width: 500px; height: 400px; border: solid 1px;">
				${notice.notice_content }
				</div>
		</div>

		<div class="form-group">
			<div class="col-md-10 text-center">
				<input type="submit" class="btn btn-lg btn-primary" 
				value="수정">

				<button type="button" class="btn btn-danger btn-lg"
					onclick="location.href='/evweb/Notice/list.do'">
					<i class="fa fa-fw fa-close"></i> 목록
				</button>
				<button type="button" class="btn btn-danger btn-lg"
					id="deletebtn">
					<i class="fa fa-fw fa-close"></i> 삭제
				</button>
				<a href="/evweb/notice/delete.do?notice_no=${notice.notice_no }">삭제</a> 
			</div>
		</div>
	</form>
</body>
</html>