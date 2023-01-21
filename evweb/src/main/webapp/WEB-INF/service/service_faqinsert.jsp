<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#content{
padding-top 
}
padding:1px; 
</style>
</head>
<body>
	<div class="col-lg-8">
		<!-- 가로범위 -->
		<div>
			<h5 class="card-title">
				<strong>FAQ 작성하기</strong>
			</h5>
			<hr>
			<form role="form" class="form-horizontal"
				action="/evweb/service/faqinsert" method="POST">

					<div class="row mb-3">
						<label for="content" class="col-sm-2 col-form-label">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="title">
						</div>
					</div>

					<div class="row mb-3">
						<label for="content" class="col-sm-2 col-form-label">내용</label>
						<div class="col-sm-10">
							<textarea class="form-control" style="height: 300px"
								id="content" name="content" >안녕하세요, 차지모양입니다.</textarea>
						</div>
					</div>

					<div class="row mb-3">
						<label class="col-sm-2 col-form-label"></label>
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</div>

			</form>
		</div>
	</div>
</body>
</html>