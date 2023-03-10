<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
</style>
<!-- <link rel="stylesheet" href="/evweb/css/FAQ.css"> -->
<meta charset="UTF-8">
<title>admin</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="card-body">
		<h1 class="pagetitle">문의사항 리스트</h1>
		<br />
		<form role="form" method="get">
			<div class="search d-flex">
				<select class="form-control" style="width: 150px">
					<option value="n"
						<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색</option>
					<option value="t"
						<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
					<option value="c"
						<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					<option value="w"
						<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
					<option value="tc"
						<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					<option value="ctgr"
						<c:out value="${scri.searchType eq 'ctgr' ? 'selected' : ''}"/>>카테고리</option>
				</select> <input type="text" class="form-control" name="keyword"
					id="keywordInput" value="${scri.keyword}" style="width: 250px;" />
				<button id="searchBtn" type="button" class="btn btn-primary">검색</button>
				<script>
					$(function() {
						$('#searchBtn').click(
								function() {
									self.location = "boardListPaging.do"
											+ '${pageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $("select option:selected").val()
											+ "&keyword="
											+ encodeURIComponent($(
													'#keywordInput').val());
								});
					});
				</script>
			</div>
			<!-- 테이블 -->
			<br /> 
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th scope="col" style="width: 8%">번호</th>
						<th scope="col" style="width: 15%">카테고리</th>
						<th scope="col" style="width: 15%">아이디</th>
						<th scope="col" style="width: 32%">제목</th>
						<th scope="col" style="width: 11%">작성날짜</th>
						<th scope="col" style="width: 11%">답변상태</th>
						<th scope="col" style="width: 8%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${list}">
						<tr>
							<th scope="row">${board.board_no}</th>
							<td>${board.board_category}</td>

							<td><c:choose>
									<c:when test="${board.customer_id =='없음'}">
										<!-- 매니저로 로그인했다면 -->
										<input type="hidden" class="form-control" name="manager_id"
											value="${board.manager_id}">
										${board.manager_id}
									</c:when>
									<c:otherwise>
										<!-- 일반회원으로 로그인했다면 -->
										<input type="hidden" class="form-control" name="customer_id"
											value="${board.customer_id}">
										${board.customer_id}
									</c:otherwise>
								</c:choose></td>

							<td><a
								href="/evweb/service/read.do?board_no=${board.board_no}">${board.board_title}</a></td>
							<td>${board.board_date}</td>
							<td>${board.board_state}</td>
							<td><a
								href="/evweb/service/delete.do?board_no=${board.board_no}">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</form>
		<br>



		<!-- 페이징 -->
		<div class="boardBottom text-right col-sm-12"
			style="justify-content: center;">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="boardListPaging.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"><</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li class="page-item ${pageMaker.cri.page == idx?"active":""}">
						<a class="page-link"
						href="boardListPaging.do${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li class="page-item"><a class="page-link"
						href="boardListPaging.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">></a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>