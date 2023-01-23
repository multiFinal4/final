<%@page import="com.project.customer.CustomerDTO"%>
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
	<div class="col-lg-8">
		<!-- 가로범위 -->
		<div>
			<h5 class="card-title">
				<strong>1:1 문의글 작성하기</strong>
			</h5>
			<hr>
			<br />
			<!-- 게시판 제목이랑 내용물이랑 너무 붙어있어서 공백추가함 -->

			<!-- General Form Elements -->
			<form action="/evweb/service/write.do" method="post"
				enctype="multipart/form-data">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">카테고리</label>
					<div class="col-sm-10">
						<select class="form-select" name="board_category"
							aria-label="Default select example">
							<option value="계정문의">계정문의</option>
							<option value="사이트오류접수">사이트 오류접수</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>

				<div class="row mb-3">
					<label for="inputId" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<c:choose>
							<c:when test="${user.state=='재직'}">
								<!-- 매니저로 로그인했다면 -->
								<input type="hidden" class="form-control" name="manager_id" value="${user.manager_id}">
								${user.manager_id}
							</c:when>
							<c:when test="${user.state=='카카오'}">
								<input type="hidden" class="form-control" name="customer_id" value="${user.customer_id}">
								카카오 로그인 회원입니다.
							</c:when>
							<c:otherwise>
								<!-- 일반회원으로 로그인했다면 -->
								<input type="hidden" class="form-control" name="customer_id" value="${user.customer_id}">
								${user.customer_id}
							</c:otherwise>
						</c:choose>

					</div>
				</div>

				<div class="row mb-3">
					<label for="inputEmail" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="board_title">
					</div>
				</div>

				<div class="row mb-3">
					<label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" style="height: 300px"
							name="board_content"></textarea>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">파일첨부</label>
					<div class="col-sm-10">
						<input class="form-control" type="file" id="files" name="files"
							multiple="multiple">
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10">
						<input class="form-control" type="file" id="files" name="files"
							multiple="multiple">
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10">
						<input class="form-control" type="file" id="files" name="files"
							multiple="multiple">
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">등록하기</button>
					</div>
				</div>
			</form>
			<!-- End General Form Elements -->

		</div>
	</div>
</body>
</html>




