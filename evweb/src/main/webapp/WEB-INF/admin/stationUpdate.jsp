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
		<div class="card-body">
			<h5 class="card-title">충전소 조회</h5>
			<form action="/evweb/admin/station/update" method="post">
				<div class="row mb-3">
					<label for="station_name" class="col-sm-2 col-form-label">충전소 ID</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="station_name" id="station_name" value="${read.station_id}" readonly="readonly">
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
					<label for="charge_no" class="col-sm-2 col-form-label">충전기 대수</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="charge_no" id="charge_no" value="${read.charge_no}">
					</div>
				</div>
				<div class="row mb-3"> 
					<label for="addr_do" class="col-sm-2 col-form-label">주소</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="addr_do" id="addr_do" value="${read.addr_do} ${read.addr_sigun} ${read.addr_detail}">
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
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-secondary">삭제</button>
				</div>
			</form>
		</div>
	</body>
</html>