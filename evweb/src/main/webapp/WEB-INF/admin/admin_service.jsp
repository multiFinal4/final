<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>admin</title>
<script type="text/javascript">
	
	// 자바스크립트에서 자바가 공유해준 데이터를 사용 - EL을사용
	// ${category} => request.getAttribute('category')
	board_category = "${board_category}" //컨트롤러 요청하고 response될때 값을 받아서 셋팅
	$(document).ready(function() {
		$("#board_category").val(board_category).attr("selected","selected");
		//alert("test~~~~~~");
		$("#board_category").change(function() {
			//alert("test");
			//컨트롤러가 실행되도록
			//select를 선택하면 컨트롤러가 실행되고 파라미터로 category가 파라미터의 값으로 현재 선택한 select의 value속성값이 지정
			location.href="/evweb/service/list.do?board_category="+encodeURI($(this).val())
		});
	});
</script>
</head>
<body>
	<div class="card-body">
		<h5 class="card-title"><strong>문의사항 리스트</strong></h5>
		<br/>
		<!-- Default Table -->
		<form action="#">
			<select name="board_category"  id="board_category">
				<option selected="">선택하세요.</option>
				<option value="all">전체보기</option>
				<option value="계정문의">계정문의</option>
				<option value="사이트오류접수">사이트 오류접수</option>
				<option value="기타">기타</option>
			</select>
		</form>
		<br/>
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">카테고리</th>
					<th scope="col">아이디</th>
					<th scope="col">제목</th>
					<th scope="col">작성날짜</th>
					<th scope="col">답변상태</th>
					<th scope="col">     </th>
				</tr>
				<c:forEach var="board" items="${list}">
					<tr>
						<th scope="row">${board.board_no}</th>
						<td>${board.board_category}</td>
						<td>${board.manager_id}</td>
						<td><a href="/evweb/service/read.do?board_no=${board.board_no}&state=READ">${board.board_title}</a></td>
						<td>${board.board_date}</td>
						<td>${board.board_state}</td>
						<td><a href="/evweb/service/delete.do?board_no=${board.board_no}">삭제</a></td>
					</tr>
				</c:forEach>
			</thead>
		</table>
		<!-- End Default Table Example -->
		
		<!-- 혹시몰라서 검색기능 남겨둠 -->
		<!-- <form action="/evweb/service/search.do" method="post">
			<select name="tag">
				<option value="id">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="text" name="data" /> <input type="submit" value="검색">
		</form> -->
	</div>
</body>
</html>




