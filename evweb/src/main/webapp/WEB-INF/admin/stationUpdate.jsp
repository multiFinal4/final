<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1 class="pagetitle">충전소 정보 수정</h1>
		<div class="card-body stationWrap">
			<form action="/evweb/admin/station/update.do" method="post">
				<div class="row mb-3">
					<label for="station_id" class="col-sm-2 col-form-label">충전소 ID</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="station_id" id="station_id" value="${read.station_id}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="station_name" class="col-sm-2 col-form-label">충전소 이름</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="station_name" id="station_name" value="${read.station_name}">
					</div>
				</div>
				<div class="row mb-3">
					<label for="station_company" class="col-sm-2 col-form-label">충전소 회사</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="station_company" id="station_company" value="${read.station_company}">
					</div>
				</div>
				<div class="row mb-3">
					<label for="charger_no" class="col-sm-2 col-form-label">충전기 대수</label>
					<div class="col-sm-10">
					  <input type="number" class="form-control" name="charger_no" id="charger_no" value="${read.charger_no}" >
					</div>
				</div>
				<div class="row mb-3"> 
					<label for="addr_do" class="col-sm-2 col-form-label">주소</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="addr_do" id="addr_do" value="${read.addr_do}">
					  <input type="text" class="form-control" name="addr_sigun" id="addr_sigun" value="${read.addr_sigun}">
					  <input type="text" class="form-control" name="addr_detail" id="addr_detail" value="${read.addr_detail}">
					</div>
				</div>
				<div class="row mb-3">
					<label for="manager_id" class="col-sm-2 col-form-label">담당자</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="manager_id" id="manager_id" value="${read.manager_id}">
					</div>
				</div>
				<div class="row mb-3">
					<label for="service_date" class="col-sm-2 col-form-label">서비스기간</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="service_date" id="service_date" value="${read.service_date}">
					</div>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-primary"><i class="bi bi-pencil-square"></i> 등록</button>
					<button type="reset" class="btn btn-secondary">초기화</button>
				</div>
			</form>
		</div>
	</body>
</html>