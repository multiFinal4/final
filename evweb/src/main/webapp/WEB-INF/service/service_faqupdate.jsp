<%@page import="com.project.faq.FaqDTO"%>
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
<h1>FAQ 게시글 수정하기</h1>
	<%
	FaqDTO dto = (FaqDTO) request.getAttribute("document");
	%>
	<div class="container-fluid">
		<form role="form" class="form-horizontal"
			action="/evweb/faq/update" method="POST">
			<input type="hidden" name="_id" value="<%=dto.get_id() %>"/>
			<fieldset>
				<div id="legend">
					<legend>아래 양식을 작성해주세요.</legend>
				</div>
				<div class="form-group">
					<!-- 부서코드 -->
					<label class="control-label col-sm-2" for="orgcode">아이디</label>
					<%=dto.get_id()%>
				</div>

				<div class="form-group">
					<!-- FAQ 제목-->
					<label class="control-label col-sm-2" for="orgloc">FAQ 제목</label>
					<div class="col-sm-3">
						<input type="text" id="title" name="title" placeholder="title"
							class="form-control"   value="<%=dto.gettitle() %>">

					</div>
				</div>
				<div class="form-group">
					<!-- FAQ 내용-->
					<label class="control-label col-sm-2" for="orgloc">FAQ 내용</label>
					<div class="col-sm-3">
						<input type="text" id="content" name="content" placeholder=content
							class="form-control"   value="<%=dto.getcontent() %>">

					</div>
				</div>
	
				<div class="form-group">
					<!-- Button -->
					<div class="col-sm-3 col-sm-offset-2">
						<input type="submit" value="수정하기" class="btn btn-success" />

					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>