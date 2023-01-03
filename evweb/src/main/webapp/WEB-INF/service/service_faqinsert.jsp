<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<form role="form" class="form-horizontal"
			action="/evweb/service/faqinsert" method="POST">
			<fieldset>
				<div id="legend">
					<legend>faq 게시글 작성하기</legend>
				</div>
				

				<div class="form-group">
					<!-- 글제목 -->
					<label class="control-label col-sm-2" for="orgcode">제목</label>
					<div class="col-sm-3">
						<input type="text" id="title" name="title" placeholder="제목"
							class="form-control" required>
					</div>
				</div>

				<div class="form-group">
					<!-- 글내용-->
					<label class="control-label col-sm-2" for="orgname">내용</label>
					<div class="col-sm-3">
						<input type="text" id="content" name="content" placeholder="내용"
							class="form-control" required>

					</div>
				</div>


				<div class="form-group">
					<!-- Button -->
					<div class="col-sm-3 col-sm-offset-2">
						<input type="submit" value="발행" class="btn btn-success" />

					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>