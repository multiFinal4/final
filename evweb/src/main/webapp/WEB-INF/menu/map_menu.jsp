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
	$(document).ready(function () {
		$('select').selectpicker();
	});
</script>
</head>
<body>
	<aside id="sidebar" class="sidebar">
		<form class="" method="POST" action="#" style="padding: 0;">
	         <div class="dropdown" style="float: left;">
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
			<div class="search-bar search-form d-flex align-items-center" style="float: none;">
				<input type="text" name="query" placeholder="Search" title="Enter search keyword col-sm-6">
				<button type="submit" title="Search"><i class="bi bi-search"></i></button>
		    </div>
			<div class="searchSelect">
				<h5 class="card-title">주차</h5>
				<div class="form-check">
					<label class="form-check-label">
						<input class="form-check-input" type="checkbox" name="parking" value="parkY">무료주차
					</label>
					<label class="form-check-label">
						<input class="form-check-input" type="checkbox" name="parking" value="parkN">유료주차
					</label>
		        </div>
				<div class="form-check">
					<select name="category"  id="category" class="selectpicker form-control" multiple data-live-search="true" data-actions-box="true" data-actions-box="true">
						<c:forEach var="company" items="${companyList}">
							<option value="${company.station_company}">${company.station_company}</option>
						</c:forEach>
					</select>
		        </div>
				<div class="form-check">
					<label class="form-check-label">
						<input class="form-check-input" type="checkbox" name="parking" value="parkY">무료주차
					</label>
					<label class="form-check-label">
						<input class="form-check-input" type="checkbox" name="parking" value="parkN">유료주차
					</label>
		        </div>
	        </div>
		</form>
	</aside>
</body>
</html>