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
			$(document).ready(function() {
				$("#category").change(function() {
					location.href="/evweb/admin/station/list?category="+encodeURI($(this).val());
				});

				$("#category").val(cate).attr("selected","selected");
			});
		</script>
	</head>
	<body>
		<div class="row">
			<h1 class="pagetitle">충전소 리스트</h1>
	        <div class="col-lg-12 stationWrap">
	            <div class="search-bar d-flex">
					<form action="" class="form-inline cateSelect">
						<select name="category"  id="category" class="form-control">
							<option value="all">회사명</option>
			                <c:forEach var="company" items="${companyList}">
								<option value="${company.station_company}">${company.station_company}</option>
							</c:forEach>
						</select>
					</form>
					<form class="search-form d-flex align-items-center" method="POST" action="#">
						<input type="text" name="query" placeholder="Search" title="Enter search keyword">
						<button type="submit" title="Search"><i class="bi bi-search"></i></button>
					</form>
			    </div>
	              <table class="table table-hover">
	                <thead>
	                  <tr>
	                    <th scope="col">번호</th>
	                    <th scope="col">충전소 ID</th>
	                    <th scope="col">충전소 이름</th>
	                    <th scope="col">충전소 회사</th>
	                    <th scope="col">주소</th>
	                    <th scope="col">담당자</th>
	                  </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="list" items="${stationlist}">
							<tr>
							  <th scope="row">${list.rownum}</th>
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
				<div class="text-right col-sm-12" style="padding-right: 0;">
					<button type="submit" onclick="location.href='/evweb/admin/station/insert'" class="btn btn-primary"><i class="bi bi-pencil-square"></i> 등록</button>
				</div>
	      </div>
	</body>
</html>