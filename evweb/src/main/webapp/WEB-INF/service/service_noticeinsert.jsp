<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="/erp/common/css/font-awesome.css" rel="stylesheet" /> -->
<!-- Custom styles for this template -->
</head>
<body>
	<!-- CREATE SEQUENCE notice_tb_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER; -->
	<div class="col-lg-8">
		<!-- 가로범위 -->
		<div>
			<h5 class="card-title">
				<strong>공지사항 작성하기</strong>
			</h5>
			<hr>
			<form action="/evweb/service/noticeinsert" method="POST"
				enctype="multipart/form-data">
				<div class="row mb-3">
					<label for="inputId" class="col-sm-2 col-form-label">작성자</label>
					<div class="col-sm-10">
						<p class="form-control-static">${user.manager_id }</p>
						<input type="hidden" name="manager_id" value="${user.manager_id }">
						<!-- 숨길 거면 -->
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputEmail" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="notice_title">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" style="height: 300px"
							name="notice_content">안녕하세요, 충전해조입니다.</textarea>
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
				<label class="col-sm-2 col-form-label">고정하기</label>
					<fieldset>
						X <input type="radio" name="notice_fix" value="n" checked /> O <input
							type="radio" name="notice_fix" value="y" />
					</fieldset>
				</div>

				<div class="row mb-3">
					<label class="col-sm-2 col-form-label"></label>
					<div class="col-sm-10">
						<button type="submit" class="btn btn-primary">등록</button>
						<input type="button"
							onclick="location.href='/evweb/admin_notice.do'" value="취소"
							class="btn btn-primary">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>