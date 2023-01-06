<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="wmanager_idth=device-wmanager_idth, initial-scale=1">
<title>admin</title>
</head>
<body>
	<div class="col-lg-8">  <!-- 가로범위 -->
		<div class="card-body">
			<h5 class="card-title">
				<strong>1:1 문의글 답변하기</strong>
			</h5>
			<hr/>
			
			<!-- General Form Elements -->
			<div class="row mb-3">
				<div class="col-sm-8">
				<label for="inputCategory" class="col-sm-8 col-form-label"><h5><strong>No.</strong>${list.board_no}</h5></label>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-sm-8">
				<label for="inputCategory" class="col-sm-2 col-form-label">카테고리  :</label>
					${list.board_category}
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-sm-8">
				<label for="inputmanager_id" class="col-sm-2 col-form-label">작성자  :</label>
					${list.manager_id}
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-sm-8">
				<label class="col-sm-2 col-form-label">제목  :</label>
					${list.board_title}
				</div>
			</div>

			<!-- 디비에 저장된 파일명을 출력(클라이언트가 선택한 파일명) -->
			<div class="row mb-3">
				<div class="col-sm-8">
				<label class="col-sm-2 col-form-label">첨부파일 :</label>
					<c:forEach var="file" items="${boardfiledtolist}">
						<a href="/evweb/service/download/${list.manager_id}/${list.board_no}/${file.file_no}">${file.originalFilename}</a> 
					</c:forEach>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-sm-10">
					<!-- <label class="col-sm-2 col-form-label">내용</label> -->
					<div class="card">
			            <div class="card-body" style="height: 150px">
			              ${list.board_content}
		            	</div>
	       			 </div>
				</div>
			</div>
			
			<div class="row mb-3">
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary" 
					onclick="location.href='/evweb/reply/write.do?board_no=${list.board_no}'">답변하기</button>
					<button type="button" class="btn btn-primary" 
					onclick="location.href='/evweb/reply/list.do?board_no=${list.board_no}'">답변보기</button>
					<button type="button" class="btn btn-primary" 
					onclick="location.href='/evweb/service/list.do?board_category=all'">목록보기</button>
				</div>
			</div>
			
			<!-- End General Form Elements -->

		</div>
	</div>
</body>
</html>