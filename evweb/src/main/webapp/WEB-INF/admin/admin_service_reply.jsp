<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>admin</title>
</head>
<body>
	<div class="col-lg-8">
		<!-- 가로범위 -->
		<div class="card-body">
			<h5 class="card-title">
				<strong>1:1 문의글 답변하기</strong>
			</h5>
			<hr />
			<br />
			<!-- 게시판 제목이랑 내용물이랑 너무 붙어있어서 공백추가함 -->



			<!-- General Form Elements -->
			<form action="/evweb/reply/write.do" method="post">
				<h3>
					<strong>고객 문의 내용</strong>
				</h3>
				<br />
				<div class="row mb-3">
					<div class="col-sm-10">
						<label class="col-sm-2 col-form-label">글번호</label>
						${list.board_no}
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
						<!-- <textarea class="form-control" style="height: 200px" 
						name="board_content">내용</textarea> -->
						<label class="col-sm-2 col-form-label">내용</label>
						${list.board_content}
					</div>
				</div>
				<hr />
				<br/>
				<!-- 댓글 목록 -->
				<h3>
					<strong>답변하기 :</strong>
				</h3>
				<br/>
				<div class="row mb-3">
					<div class="col-sm-10">
						<textarea class="form-control" style="height: 200px" 
						name="board_content">내용</textarea>
						<br/>
						<button type="submit" class="btn btn-primary">답변하기</button>
					</div>
				</div>
			</form>
			<!-- End General Form Elements -->

		</div>
	</div>
</body>
</html>