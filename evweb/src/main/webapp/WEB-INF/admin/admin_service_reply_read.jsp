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

			<h3>
				<strong>문의답변내용</strong>
			</h3>
			<br />
			<!-- for문 -->
			<c:forEach var = "list" items="${list}">
				<div class="row mb-3">
						<div class="col-sm-8">
							<label for="inputId" class="col-sm-2 col-form-label">담당자 :</label>
							${list.manager_id}
						</div>
					</div>
				<div class="row mb-3">
					<div class="col-sm-10">
						<div class="card">
							<div class="card-body" style="height: 150px">
								${list.reply_content}</div>
						</div>
					</div>
				</div>
				<br/>
			</c:forEach>	
			
			<div class="row mb-3">
				<div class="col-sm-10">
					<%-- <button type="button" class="btn btn-primary"
						onclick="location.href='/evweb/service/read.do?board_no=${board.board_no}&state=READ'">답변보기</button> --%>
					<button type="button" class="btn btn-primary"
						onclick="location.href='/evweb/service/list.do?board_category=all'">목록보기</button>
				</div>
			</div>
	
			<!-- End General Form Elements -->

		</div>
	</div>
</body>
</html>