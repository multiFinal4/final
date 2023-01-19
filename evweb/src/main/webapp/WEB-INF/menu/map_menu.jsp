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
	var resultCount = '${noResult}';
	$(document).ready(function () {
		$("#category").val(cate).attr("selected","selected");

		if (resultCount == "0") {
			$(".key").html(key);
			$(".alertPop .modal").addClass("show");
			$(".alertPop .modal-content").addClass("show");
			
			$(".cancel").click(function () {
				$(".alertPop .modal").removeClass("show");
				$(".alertPop .modal-content").removeClass("show");
			});
		}
		$("select#company").selectpicker();
	});
	
</script>
<style>
	body, html {
		overflow-y:hidden;
	}
</style>
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
				<div class="form-check mb-2 pl-0 d-flex mr-0">
					<h5 class="card-title col-sm-4 pl-0 mb-0 pr-0">회사명</h5>
					<div class="form-check col-sm-8 pl-0 pr-0">
						<select name="company"  id="company" class="selectpicker form-control" title="선택해주세요" data-live-search="true" data-actions-box="true">
							<c:forEach var="company" items="${companyList}">
								<option value="${company}">${company}</option>
							</c:forEach>
						</select>
					</div>
		        </div>
					
				<div class="form-check mb-3 pl-0" style="align-items: center;">
					<div class="col-sm-12 pl-0 pr-0 d-flex">
						<div class="form-check d-flex col-sm-8 pl-0 pr-0">
							<label class="form-check-label">
								<input class="form-check-input txt-hide" type="checkbox" name="filter">주차
							</label>
							<label class="form-check-label">
								<input class="form-check-input txt-hide" type="checkbox" name="filter">급속
							</label>
							<label class="form-check-label">
								<input class="form-check-input txt-hide" type="checkbox" name="filter">완속
							</label>
				        </div>
			         	<div class="dropdown col-sm-4 pl-0 pr-0">
							<select name="stFilter"  id="stFilter" class="selectpicker form-control" title="선택해주세요" data-live-search="true" data-actions-box="true">
									<option value="default">기본순</option>
									<option value="lowFee">낮은 금액순</option>
									<option value="highFee">높은 금액순</option>
									<option value="pop">인기순</option>
							</select>
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
	<div class="alertPop">
		<div class="alertBox">
			<div class="modal fade">
				<div class="modal-dialog modal-dialog-centered">
					
					<div class="modal-content delete">
						<div class="modal-header">
							<h5 class="modal-title">입력하신 "<span class="key font-weight-bold"></span>"에 대한 검색결과가 없습니다.</h5>
						</div>
						<div class="modal-body">
							단어의 철자가 정확한지 확인해 주세요.<br>
							검색어의 단어 수를 줄이거나 보다 정확한 단어로 검색해 주세요.
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary cancel"><i class="bi bi-check-square"></i>확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
</body>
</html>