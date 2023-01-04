<%@page import="com.project.faq.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>service</title>
</head>
<body>
	<div class="col-lg-8">
		<!-- 가로범위 -->
		<div class="card-body">
			<h5 class="card-title">
				<strong>FAQ</strong>
			</h5>
			<hr>
			<!-- -----------------------제목--------------------- -->

			<!-- 가로범위 ~ 문의글작성 범위인데 통일성을 위해서 일단 넣어놨어요-->
			<%
			List<FaqDTO> faqlist = (List<FaqDTO>) request.getAttribute("faqlist");
			int size = faqlist.size();
			%>

			<table align="center" border="0" width="700">
				<tr bgcolor="#FFFFFF">
					<th>글번호(임시)</th>
					<th>제목</th>
					<th>내용</th>
					<th>삭제</th>
				</tr>
				<%
				for (int i = 0; i < size; i++) {
					FaqDTO faq = faqlist.get(i);
				%>
				<tr>
					<td><%=faq.get_id()%></td>
					<td><a
						href="/evweb/service/detail?key=id&value=<%=faq.get_id()%>&action=read"><%=faq.gettitle()%></a></td>
					<td><%=faq.getcontent()%></td>
					<td><a href="mybatisDel.do?_id=<%=faq.get_id()%>">삭제</a></td>
				</tr>
				<%
				}
				%>
				<tr></tr>
				<tr align="center">
					<td colspan="10"><a href="/evweb/faq/paginglist?pageNo=0">1</a>
						<a href="/evweb/faq/paginglist?pageNo=1">2</a>
						<a href="/evweb/faq/paginglist?pageNo=2">3</a>
						<a href="/evweb/faq/paginglist?pageNo=3">4</a>
						</td>
				</tr>
			</table>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/evweb/service/faqinsert"
				style="text-align: right;">글쓰기</a></li>
		</ul>
	</div>
</body>
</html>