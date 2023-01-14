<%@page import="com.project.file.BoardFileDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="/evweb/css/FAQ.css"> -->
<meta charset="UTF-8">
<meta name="viewport"
	content="wmanager_idth=device-wmanager_idth, initial-scale=1">
<title>admin</title>

<style type="text/css">

body, html{
	overflow-y:hidden;
}
#container{
	height:calc(100vh - 130px);
	overflow-y:auto; 
}
.card {
	margin-bottom: 30px;
	border: none;
	border-radius: 5px;
	box-shadow: 0px 0 30px rgb(1 41 112/ 10%);
}

.card { -
	-bs-card-spacer-y: 1rem; -
	-bs-card-spacer-x: 1rem; -
	-bs-card-title-spacer-y: 0.5rem; -
	-bs-card-border-width: 1px; -
	-bs-card-border-color: var(- -bs-border-color-translucent); -
	-bs-card-border-radius: 0.375rem; -
	-bs-card-box-shadow:; -
	-bs-card-inner-border-radius: calc(0.375rem - 1px); -
	-bs-card-cap-padding-y: 0.5rem; -
	-bs-card-cap-padding-x: 1rem; -
	-bs-card-cap-bg: rgba(0, 0, 0, 0.03); -
	-bs-card-cap-color:; -
	-bs-card-height:; -
	-bs-card-color:; -
	-bs-card-bg: #fff; -
	-bs-card-img-overlay-padding: 1rem; -
	-bs-card-group-margin: 0.75rem;
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	height: var(- -bs-card-height);
	word-wrap: break-word;
	background-color: var(- -bs-card-bg);
	background-clip: border-box;
	border: var(- -bs-card-border-width) solid var(- -bs-card-border-color);
	border-radius: var(- -bs-card-border-radius);
}
.col-form-label{
	padding: 0;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="col-lg-8">
		<!-- 가로범위 -->
		
		<form name="readForm" role="form" method="post">
		  <input type="hidden" id="bno" name="bno" value="${list.board_no}" />
		  <input type="hidden" id="page" name="page" value="${scri.page}"> 
		  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
		  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
		  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
		</form>
		
		
		
		<div class="card-body">
			<h1 class="pagetitle">1:1 문의글 답변하기</h1>
			<hr />


			<%
			List<BoardFileDTO> list = (List<BoardFileDTO>) request.getAttribute("boardfiledtolist");
			int size = list.size();
			%>


			<!-- General Form Elements -->
			<div class="row mb-3">
				<div class="col-sm-8">
					<h5>
						<label for="inputCategory" class="col-sm-8 col-form-label"><strong>No.
								${list.board_no}</strong> <span style="color: #dddfe2;"> | </span>
							${list.board_date}</label>
					</h5>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-sm-8">
					<label for="inputCategory" class="col-sm-2 col-form-label">카테고리
						:</label> ${list.board_category}
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-sm-8">
					<label for="inputmanager_id" class="col-sm-2 col-form-label">작성자
						:</label>
					<c:choose>
						<c:when test="${list.customer_id =='없음'}">
							<!-- 매니저로 로그인했다면 -->
							<input type="hidden" class="form-control" name="manager_id"
								value="${list.manager_id}">
							${list.manager_id}
						</c:when>
						<c:otherwise>
							<!-- 일반회원으로 로그인했다면 -->
							<input type="hidden" class="form-control" name="customer_id"
								value="${list.customer_id}">
							${list.customer_id}
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<%
			if (size > 0) {
			%>
			<!-- 첨부파일 있으면 뜨고, 없으면 안 뜨게 -->
			<div class="row mb-3">
				<div class="col-sm-8">
					<label class="col-sm-2 col-form-label">첨부파일 :</label>
					<c:forEach var="file" items="${boardfiledtolist}">
						<a
							href="/evweb/service/download/${list.manager_id}/${list.board_no}/${file.file_no}">${file.originalFilename}</a>
					</c:forEach>

				</div>
			</div>
			<%
			} else {
			}
			;
			%>
			
			<div class="row mb-3">
				<div class="col-sm-8">
					<h4><strong><label class="col-sm-2 col-form-label">제목 :</label>
					${list.board_title}</strong></h4>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-10">
					<!-- <label class="col-sm-2 col-form-label">내용</label> -->
					<div class="card">
						<div class="card-body" style="height: 150px">
							${list.board_content}</div>
					</div>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-sm-10">
					<button type="button" class="btn btn-primary"
						onclick="location.href='/evweb/reply/write.do?board_no=${list.board_no}'">답변하기</button>
					<button type="button" id="list_btn" class="btn btn-primary"
						onclick="history.go(-1)">목록보기</button>
				</div>
			</div>

			<!-- End -->

		</div>
		<br>
		<c:choose>
			<c:when test="${not empty replylist}">
				<hr>
				<br>
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="card-body">

								<h5 class="card-title">
									<strong>└ [충전해조] 운영자의 답변입니다.</strong>
								</h5>
								<div class="card-body">
									<!-- 댓글 for문 -->
									<c:forEach var="replylist" items="${replylist}">
										<div class="row mb-3">
											<div class="col-sm-8">
												<label for="inputId" class="col-sm-2 col-form-label">답변번호
													:</label> ${replylist.reply_no}
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-sm-8">
												<label for="inputId" class="col-sm-2 col-form-label">담당자
													:</label> ${replylist.manager_id}
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-sm-8">
												<label for="inputDate" class="col-sm-2 col-form-label">답변날짜
													:</label> ${replylist.reply_date}
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-sm-10">
												<div class="card">
													<div class="card-body" style="height: 150px">
														${replylist.reply_content}</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<br> <br>
					</div>
				</div>
			</c:when>
			<c:otherwise>  
			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>


