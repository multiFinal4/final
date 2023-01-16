<%@page import="com.project.faq.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="/evweb/css/FAQ.css"> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>service</title>
<style type="text/css">
.collapsible-link::before {
	content: '';
	width: 14px;
	height: 2px;
	background: #333;
	position: absolute;
	top: calc(50% - 1px);
	right: 1rem;
	display: block;
	transition: all 0.3s;
}
/* Vertical line */
.collapsible-link::after {
	content: '';
	width: 2px;
	height: 14px;
	background: #333;
	position: absolute;
	top: calc(50% - 7px);
	right: calc(1rem + 6px);
	display: block;
	transition: all 0.3s;
}

.collapsible-link[aria-expanded='true']::after {
	transform: rotate(90deg) translateX(-1px);
}

.collapsible-link[aria-expanded='true']::before {
	transform: rotate(180deg);
}
/* 내용 css바꾸기 */
.card {
	background-color: #e7f1ff;
}
</style>
</head>
<body>
	<div class="card-body">
		<h1 class="pagetitle">자주 찾는 도움말</h1>
		<hr>
	<div class="row">
		<div class="col-lg-12 stationWrap">
			<!-- 검색 기능 -->
			<form class="search-bar d-flex" method="post"
				action="/evweb/faq/search">
				<select name="field" class="form-control" style="width: 150px">
					<option value="title">제목</option>
					<option value="content">글내용</option>
				</select> <input class="col-md-4" type="hidden" name="criteria" value="is"
					text="="> <input type="text" class="form-control"
					name="value" id="keywordInput" style="width: 250px;" />
				<button type="submit" id="searchBtn" class="btn btn-primary">검색</button>
			</form>
		</div>

		<div class="col-lg-12 stationWrap">
		<div id="accordionExample" class="accordion shadow">
				<%
				List<FaqDTO> faqlist = (List<FaqDTO>) request.getAttribute("faqlist");
				int size = faqlist.size();

				for (int i = 0; i < size; i++) {
					FaqDTO faq = faqlist.get(i);
				%>
				<!-- Accordion item 1 -->
				<div class="card">
					<div id="heading<%=+i%>"
						class="card-header bg-white shadow-sm border-0">
						<h6 class="mb-0 font-weight-bold">
							<a href="#" data-toggle="collapse" data-target="#collapse<%=+i%>"
								aria-expanded="false" aria-controls="collapse<%=+i%>"
								class="d-block position-relative text-dark text-uppercase collapsible-link py-2"><%=faq.gettitle()%></a>
						</h6>
					</div>
					<div id="collapse<%=+i%>" aria-labelledby="heading<%=+i%>"
						data-parent="#accordionExample" class="collapse">
						<div class="card-body p-10">
							<p class="font-weight-light m-0"><%=faq.getcontent()%></p>
						</div>
					</div>
				</div>
				<%
				}
				%>
				<table align="center">
					<tr>
						<td colspan="10">
							<div><%=size%></div> <a href="/evweb/faq/paginglist?pageNo=0">1</a>

							<%
							if (size > 0) {
							%> <a href="/evweb/faq/paginglist?pageNo=1">2</a> <a
							href="/evweb/faq/paginglist?pageNo=2">3</a> <a
							href="/evweb/faq/paginglist?pageNo=3">4</a> <a
							href="/evweb/faq/paginglist?pageNo=4">5</a> <a
							href="/evweb/faq/paginglist?pageNo=5">6</a> <a
							href="/evweb/faq/paginglist?pageNo=6">7</a> <a
							href="/evweb/faq/paginglist?pageNo=7">8</a> <a
							href="/evweb/faq/paginglist?pageNo=8">9</a> <a
							href="/evweb/faq/paginglist?pageNo=9">10</a> <%
 } else {
 %>
							<p>
								꼬잉
								<%
							}
							%>
							
							<ul class="paging">
								<c:if test="${paging.prev}">
									<span><a
										href='<c:url value="/test?page=${paging.startPage-1}"/>'>이전</a></span>
								</c:if>
								<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
									var="num">
									<span><a href='<c:url value="/test?page=${num}"/>'>${num}</a></span>
								</c:forEach>
								<c:if test="${paging.next && paging.endPage>0}">
									<span><a
										href='<c:url value="/test?page=${paging.endPage+1}"/>'>다음</a></span>
								</c:if>
							</ul> <!-- 
							이 게시글의 총 페이지 수 >> 100 페이지
							이 페이지가 지금 몇 페이지인가 >> 100페이지 중 몇번째 페이지 인지? V
							
							 -->
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>