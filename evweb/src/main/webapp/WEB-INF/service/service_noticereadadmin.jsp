<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="wmanager_idth=device-wmanager_idth, initial-scale=1">
</head>
<body>
<!-- Admin View -->
	<form class="form-horizontal"
		action="/evweb/notice/read.do?state=UPDATE&notice_no=${notice.notice_no }"
		method="post">

		<div class="col-lg-8">
			<!-- 가로범위 -->
			<div class="card-body">
				<h3 class="card-title">
				<br>
					<strong>공지사항 No. ${notice.notice_no }</strong>
				</h3>
				${notice.notice_writedate }
				<hr />
				<br>
				<h4 class="row mb-3">
					<label class="col-form-label"><strong>[ ${notice.notice_title } ]</strong></label>
				</h4>
				<div class="row mb-3">
					<div class="col-sm-6">
						<label class="col-sm-3 col-form-label">첨부파일</label>
						<c:forEach var="file" items="${boardfiledtolist}">
							<a href="/evweb/notice/download/${notice.manager_id}/${notice.notice_no}/${file.file_no}">${file.originalFilename}</a>
						</c:forEach>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-10">
						<div class="card">
							<div class="card-body" style="height: 300px">
								${notice.notice_content}</div>
						</div>
					</div>
				</div>
				<br>
				<br>
				<div class="row mb-3">
					<div class="col-sm-10" style="text-align: right;">
						<button type="submit" class="btn btn-primary" 
						onclick="location.href='/evweb/reply/write.do?board_no=${list.board_no}'">수정</button>
						<button type="button" class="btn btn-primary" 
						onclick="location.href='/evweb/Notice/list.do'">목록</button>
						<button type="button" class="btn btn-primary" 
						onclick="location.href='/evweb/notice/delete.do?notice_no=${notice.notice_no }'">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>