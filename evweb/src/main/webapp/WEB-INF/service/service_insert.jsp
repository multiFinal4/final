<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>service</title>
</head>
<body>
	<div class="col-lg-8">  <!-- 가로범위 -->
		<div class="card-body">
			<h5 class="card-title">
				<strong>1:1 문의글 작성하기</strong>
			</h5>
			<br />
			<!-- 게시판 제목이랑 내용물이랑 너무 붙어있어서 공백추가함 -->

			<!-- General Form Elements -->
			<form action="/evweb/service/write.do" method="post">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label">카테고리</label>
					<div class="col-sm-10">
						<select class="form-select" name="board_category" aria-label="Default select example">
							<option selected="">선택하세요.</option>
							<option value="계정문의">계정문의</option>
							<option value="사이트오류접수">사이트 오류접수</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>

				<div class="row mb-3">
					<label for="inputId" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="manager_id">
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
						<textarea class="form-control" style="height: 300px" name="board_content"></textarea>
					</div>
				</div>

				<div class="row mb-3">
					<label for="inputNumber" class="col-sm-2 col-form-label">파일첨부</label>
					<div class="col-sm-10">
						<input class="form-control" type="file" id="formFile" multiple="multiple">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputNumber" class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10">
						<input class="form-control" type="file" id="formFile">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputNumber" class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10">
						<input class="form-control" type="file" id="formFile">
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




