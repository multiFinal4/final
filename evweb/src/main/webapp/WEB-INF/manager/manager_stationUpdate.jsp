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
		<div class="row">
			<h1 class="pagetitle">충전소 정보 수정</h1>
			<div class="card-body stationWrap col-lg-12">
				<form action="/evweb/manager/station/update.do" method="post">
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="station_id" class="col-sm-4 col-form-label">충전소 ID</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="station_id" id="station_id" value="${read.station_id}" readonly="readonly">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="station_name" class="col-sm-4 col-form-label">충전소 이름</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="station_name" id="station_name" value="${read.station_name}" >
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="kind" class="col-sm-4 col-form-label">충전소 구분</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="kind" id="kind" value="${read.kind}">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="charger_no" class="col-sm-4 col-form-label">충전기 대수</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="charger_no" id="charger_no" value="${read.charger_no}" readonly="readonly">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="station_company" class="col-sm-4 col-form-label">운영기관</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="station_company" id="station_company" value="${read.station_company}">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="busi_call" class="col-sm-4 col-form-label">연락처</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="busi_call" id="busi_call" value="${read.busi_call}">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="addr_do" class="col-sm-4 col-form-label">주소(도)</label>
							<div class="col-sm-8">
								<select name="addr_do"  id="addr_do" class="form-control">
									<option value="jejudo">제주특별자치도</option>
								</select>
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="addr_sigun" class="col-sm-4 col-form-label">주소(시/군/구)</label>
							<div class="col-sm-8">
								<select name="addr_sigun"  id="addr_sigun" class="form-control">
									<option value="jeju">제주시</option>
									<option value="seogwipo">서귀포시</option>
								</select>
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="addr_detail" class="col-sm-4 col-form-label">상세주소</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="addr_detail" id="addr_detail" value="${read.addr_detail}">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="map_latitude" class="col-sm-4 col-form-label">위도</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="map_latitude" id="map_latitude" value="${read.map_latitude}">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="map_longtude" class="col-sm-4 col-form-label">경도</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="map_longtude" id="map_longtude" value="${read.map_longtude}">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="use_time" class="col-sm-4 col-form-label">운영시간</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="use_time" id="use_time" value="${read.use_time}">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="use_time" class="col-sm-4 col-form-label">무료주차</label>
							<div class="col-sm-8">
								<select name="parking_free"  id="parking_free" class="form-control">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</div>
						</div>
							<div class="row col-sm-4">
							<label for="trafficYn" class="col-sm-4 col-form-label">편의시설</label>
							<div class="col-sm-8">
								<select name="trafficYn"  id="trafficYn" class="form-control">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="manager_id" class="col-sm-4 col-form-label">담당자</label>
							<div class="col-sm-8">
								<input type='text' class='form-control' value='${read.manager_id}' name='manager_id' id='manager_id' readonly="readonly">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="note" class="col-sm-4 col-form-label">특이사항</label>
							<div class="col-sm-8">
							  	<input type="text" class="form-control" name="note" id="note" value="${read.note}">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="limitYn" class="col-sm-4 col-form-label">이용제한</label>
							<div class="col-sm-8">
								<select name="limitYn"  id="limitYn" class="form-control">
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</div>
						</div>
							<div class="row col-sm-4">
							<label for="limit_detail" class="col-sm-4 col-form-label">상세설명</label>
							<div class="col-sm-8">
							  	<input type="text" class="form-control" name="limit_detail" id="limit_detail" value="${read.limit_detail}">
							</div>
						</div>
							<div class="row col-sm-4">
							<label for="service_date" class="col-sm-4 col-form-label">서비스기간</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="service_date" id="service_date" value="${read.service_date}">
							</div>
						</div>
					</div>
					<div class="text-center mt-5">
						<button type="submit" class="btn btn-primary"><i class="bi bi-pencil-square"></i> 수정</button>
						<button type="reset" class="btn btn-secondary">초기화</button>
					</div>
				</form>
			</div>
			<div class="alertPop">
				<div class="alertBox">
					<div class="modal fade">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content insert">
								<div class="modal-header">
									<h5 class="modal-title pagetitle"><i class="bi bi-journal-text"></i>충전소 담당자 리스트</h5>
										<button type="button" id="cancel" class="btn"><i class="bi bi-x-lg" style="margin-right: 0;"></i></button>
								</div>
								<div class="modal-body">
					              <table class="table table-hover">
					                <thead class="fixedHeader">
					                  <tr>
					                    <th scope="col" class="tb-center">관리자 ID</th>
					                    <th scope="col">이름</th>
					                    <th scope="col">회사</th>
					                    <th scope="col">직급</th>
					                    <th scope="col" class="tb-center">선택</th>
					                  </tr>
					                </thead>
					                <tbody id="mgrList">
					                </tbody>
					              </table>
								</div>
							</div>
						</div>
					</div>
				</div>
	         </div>
		</div>
	</body>
	<script>
		$(document).ready(function () {
			$("#mgrBtn").click(function () {
				$(".alertPop .modal").addClass("show");
				$(".alertPop .modal-content").addClass("show");
				stationManager();
			});
			
			$("#cancel").click(function () {
				$(".alertPop .modal").removeClass("show");
				$(".alertPop .modal-content").removeClass("show");
			});
		});
	</script>
</html>