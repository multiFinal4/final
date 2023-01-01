<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			var cate = "${category}";
			var pageNo = "${pageNo}"; 
			$(document).ready(function() {
				$("#category").change(function() {
					location.href="/evweb/admin/station/list?category="+encodeURI($(this).val())+"&pageNo=1";
				});
				$("#category").val(cate).attr("selected","selected");
				$(".page-item").eq(pageNo).addClass("active");
			});
		</script>
	</head>
	<body>
		<div class="row">
			<h1 class="pagetitle">충전소 리스트</h1>
	        <div class="col-lg-12 stationWrap">
	            <div class="search-bar d-flex">
					<form id="searchForm" class="search-form d-flex align-items-center" method="get" action="/evweb/admin/station/search.do?category=${category}">
						<select name="category"  id="category" class="form-control">
							<option value="all">회사명</option>
			                <c:forEach var="company" items="${companyList}">
								<option value="${company.station_company}">${company.station_company}</option>
							</c:forEach>
						</select>
						<input type="text" name="stationName" placeholder="${stationName}" title="Enter search keyword">
						<button type="submit" title="Search"><i class="bi bi-search"></i></button>
					</form>
			    </div>
	              <table class="table table-hover">
	                <thead>
	                  <tr>
	                    <th scope="col" style="width:5%;">번호</th>
	                    <th scope="col" style="width:15%;">충전소 ID</th>
	                    <th scope="col" style="width:20%;">충전소 이름</th>
	                    <th scope="col" style="width:20%;">충전소 회사</th>
	                    <th scope="col" style="width:30%;">주소</th>
	                    <th scope="col" style="width:10%;">담당자</th>
	                  </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="list" items="${stationlistPage}">
							<tr>
							  <th scope="row">${list.rn}</th>
							  <td>${list.station_id}</td>
							  <td><a href="/evweb/admin/station/read?stationId=${list.station_id}&state=READ">${list.station_name}</a></td>
							  <td>${list.station_company}</td>
							  <td>${list.addr_do} ${list.addr_sigun}</td>
							  <td>${list.manager_id}</td>
							</tr>
	                  	</c:forEach>
	                </tbody>
	              </table>
	            </div>
				<div class="boardBottom text-right col-sm-12" style="padding-right: 0;">
					<ul class="pagination">
							<li class="page-item">
							  <a class="page-link" href="#" tabindex="-1" aria-disabled="true"><</a>
							</li>
		                	<c:forEach var="page" begin="1" end="${endPage}" step="1" varStatus="status">
								<li class="page-item"><a class="page-link" href="/evweb/admin/station/list?category=${category}&pageNo=${status.index}">${status.index}</a></li>
							</c:forEach>
							<li class="page-item">
							  <a class="page-link" href="#">></a>
							</li>
					</ul>
					<button type="submit" onclick="location.href='/evweb/admin/station/insert'" class="btn btn-primary"><i class="bi bi-pencil-square"></i> 등록</button>
				</div>
	      </div>
	</body>
</html>