<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>admin</title>

<style type="text/css">
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
</style>


<script type="text/javascript">



</script>
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
			<form action="/evweb/service/boardListPaging.do" method="post">
				<h3>
					<strong>고객 문의 내용</strong>
				</h3>
				<br />
				<div class="row mb-3">
					<div class="col-sm-8">
						<label class="col-sm-2 col-form-label">글번호  :</label>
						<input type="hidden" name="board_no" value="${list.board_no}"> ${list.board_no}
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-8">
						<label for="inputId" class="col-sm-2 col-form-label">아이디  :</label>
						<c:choose>
							<c:when test="${list.customer_id =='없음'}">
								<!-- 매니저로 로그인했다면 -->
								<input type="hidden" class="form-control" name="manager_id" value="${list.manager_id}">
								${list.manager_id}
							</c:when>
							<c:otherwise>
								<!-- 일반회원으로 로그인했다면 -->
								<input type="hidden" class="form-control" name="customer_id" value="${list.customer_id}">
								${list.customer_id}
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-8">
						<label class="col-sm-2 col-form-label">제목  :</label>
						${list.board_title}
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
				<br />
				<hr />
				<br />
				<h3>
					<strong>답변하기 :</strong>
				</h3>
				<br/>
				<div class="row mb-3">
					<div class="col-sm-10">	
						담당자 아이디 : ${user.manager_id}<input type="hidden" name="manager_id" value="${user.manager_id}"> 
					</div>
					<br/>
					<br/>
					<div class="col-sm-10">
						<textarea class="form-control" style="height: 200px" 
						name="reply_content" placeholder="내용 작성하기">안녕하세요, 충전해조입니다.</textarea>
						<br/>
						<input type="submit" value="답변완료" class="btn btn-primary">
						<button type="button" id="cancel_btn" class="btn btn-primary" 
						onclick="history.go(-1)">취소</button>
					</div>
				</div>
				<br/>
				<br/>
			</form>
			<!-- End General Form Elements -->

		</div>
	</div>
</body>
</html>