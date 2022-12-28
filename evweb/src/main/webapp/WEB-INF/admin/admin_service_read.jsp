<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>admin</title>
</head>
<body>
	<div class="col-lg-8">  <!-- 가로범위 -->
		<div class="card-body">
			<h5 class="card-title">
				<strong>1:1 문의글 답변하기</strong>
			</h5>
			<br />
			<!-- 게시판 제목이랑 내용물이랑 너무 붙어있어서 공백추가함 -->
			
			
			
			<!-- General Form Elements -->
			<form action="/evweb/reply/write.do">
				<div class="row mb-3">
					<div class="col-sm-10">
					<label for="inputCategory" class="col-sm-2 col-form-label">카테고리</label>
						${list.board_category}
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-sm-10">
					<label for="inputId" class="col-sm-2 col-form-label">아이디</label>
						${list.manager_id}
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-sm-10">
					<label class="col-sm-2 col-form-label">제목</label>
						${list.board_title}
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-sm-10">
						<textarea class="form-control" style="height: 250px" 
						name="board_content">${list.board_content}</textarea>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">답변하기</button>
						<button type="button" class="btn btn-primary" 
						onclick="location.href='/evweb/service/list.do?board_category=all'">목록보기</button>
					</div>
				</div>
			</form>
			<!-- End General Form Elements -->

		</div>
	</div>
</body>
</html>