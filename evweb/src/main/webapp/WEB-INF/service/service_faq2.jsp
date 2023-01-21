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
<!-- Admin View -->
	<div>
		<h1 class="pagetitle">자주 찾는 도움말</h1>
		<br>
		<%
		List<FaqDTO> faqlist = (List<FaqDTO>) request.getAttribute("faqlist");
		int size = faqlist.size();
		%>

		<table class="table table-hover">
			<tr bgcolor="#FFFFFF">
				<th></th>
				<th>제목</th>
				<th>내용</th>
				<!-- <th>수정</th> -->
			</tr>
			<%
			for (int i = 0; i < size; i++) {
				FaqDTO faq = faqlist.get(i);
			%>
			<tr>
				<td>▶</td>
				<td><a 
					href="/evweb/faq/detail?key=_id&value=<%=faq.get_id()%>&action=read"><%=faq.gettitle()%></a></td>
				<td><%=faq.getcontent()%></td>
			</tr>
			<%
				} int faqcount = (int)request.getAttribute("faqcount");
				%>
				<table align="center">
					<tr>
						<td colspan="10">
							<div></div> <%for(int i=0; i<(Math.ceil(faqcount/10.0)); i++){ %>
							<a href="/evweb/admin_faq.do?pageNo=<%=i%>"><%=i+1 %></a>
							<%} %>
						</td>
					</tr>
				</table>
		<div class="nav navbar-nav">
			<button type="button" onclick="location.href='/evweb/service/faqinsert'" style="margin-left: auto;" class="btn btn-primary"><i class="bi bi-pencil-square"></i> 등록</button>
		</div>
	</div>
</body>
</html>