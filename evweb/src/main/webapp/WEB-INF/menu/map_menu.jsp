<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Map</title>
<link rel="stylesheet" href="/evweb/vendor/bootstrap/css/bootstrap-select.css" />
<script src="/evweb/vendor/bootstrap/js/bootstrap-select.min.js"></script>

<script type="text/javascript">
	var page = 1;
	var cate = '${category}';
	var key = '${keyword}';
	$(document).ready(function () {
		$("#category").val(cate).attr("selected","selected");
		
		
		$("select#company").selectpicker();
	});
	
</script>
</head>
<body>
	<aside id="sidebar" class="sidebar mapSidebar">
		<form class="searchForm" method="get" action="/evweb/map/search.do" style="padding: 0;">
			<div class="col-sm-4"  style="float: left;padding:0">
				<select name="category"  id="category" class="form-control">
					<option value="all">전체선택</option>
					<option value="name">충전소명</option>
					<option value="addr">주소</option>
				</select>
			</div>
			<div class="search-bar search-form d-flex align-items-center col-sm-8" style="padding: 0;float:none;">
				<input type="text" name="keyword" placeholder="Search" title="Enter search keyword" value="${keyword}">
				<button type="submit" title="Search"><i class="bi bi-search"></i></button>
		    </div>
		</form>
		<div class="mapSearchResult">
			<div class="searchSelect">
				<div class="form-check mb-3 pl-0">
					<span class="col-sm-4" style="float:left;">회사명</span>
					<select name="company"  id="company" class="selectpicker form-control col-sm-8" multiple data-live-search="true" data-width="100%" data-actions-box="true">
						<c:forEach var="company" items="${companyList}">
							<option value="${company}">${company}</option>
						</c:forEach>
					</select>
		        </div>
				<div>
					<h5 class="card-title">검색조건</h5>
					<div class="form-check d-flex">
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" name="filter" value="Y">무료주차
						</label>
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" name="filter" value="Y">급속
						</label>
						<label class="form-check-label">
							<input class="form-check-input" type="checkbox" name="filter" value="Y">완속
						</label>
			        </div>
			         <div class="dropdown">
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
						  더보기
						</button>
						<div class="dropdown-menu">
						  <a class="dropdown-item" href="#">낮은 가격순</a>
						  <a class="dropdown-item" href="#">높은 가격순</a>
						  <a class="dropdown-item" href="#">인기순</a>
						  <a class="dropdown-item" href="#">이용순</a>
						</div>
					</div>
		        </div>
	        </div>
	        <div class="mapSearchList">
		         <c:forEach var="list" items="${stationList}">
		        	<div class="card mb-1 mr-1">
			            <div class="card-body">
							<h5 class="card-title"><i class="bi bi-geo-alt-fill mr-1"></i>${list.station_name}</h5>
							<h6 class="card-subtitle mb-2 text-muted">${list.addr_do} ${list.addr_sigun}<br>${list.addr_detail}</h6>
							<p class="card-text mb-0"><i class="bi bi-building"></i> ${list.station_company}</p>
							<p class="card-text mb-0"><i class="bi bi-clock"></i> ${list.use_time}</p>
			            	<span class="clickInfo"><i class="bi bi-send-fill"></i></span>
			            </div>
		          	</div>
	          	</c:forEach>
	        </div>
        </div>
	</aside>
</body>
</html>