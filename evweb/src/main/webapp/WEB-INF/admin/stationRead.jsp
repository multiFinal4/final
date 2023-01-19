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
			<h1 class="pagetitle">충전소 정보 조회</h1>
			<div class="card-body stationWrap col-lg-12">
				<form action="/evweb/admin/station/read.do?stationId=${read.station_id}&state=UPDATE" method="post">
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
							  <input type="text" class="form-control" name="station_name" id="station_name" value="${read.station_name}" readonly="readonly">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="kind" class="col-sm-4 col-form-label">충전소 구분</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="kind" id="kind" value="${read.kind}" readonly="readonly">
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
							  <input type="text" class="form-control" name="station_company" id="station_company" value="${read.station_company}" readonly="readonly">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="busi_call" class="col-sm-4 col-form-label">연락처</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="busi_call" id="busi_call" value="${read.busi_call}" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="addr_do" class="col-sm-4 col-form-label">주소(도)</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="addr_do" id="addr_do" value="제주특별자치도"  readonly="readonly">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="addr_sigun" class="col-sm-4 col-form-label">주소(시/군/구)</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="addr_sigun" id="addr_sigun" value="${read.addr_sigun}"  readonly="readonly">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="addr_detail" class="col-sm-4 col-form-label">상세주소</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="addr_detail" id="addr_detail" value="${read.addr_detail}" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="map_latitude" class="col-sm-4 col-form-label">위도</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="map_latitude" id="map_latitude" value="${read.map_latitude}" readonly="readonly">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="map_longtude" class="col-sm-4 col-form-label">경도</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="map_longtude" id="map_longtude" value="${read.map_longtude}" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="use_time" class="col-sm-4 col-form-label">운영시간</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="use_time" id="use_time" value="${read.use_time}" readonly="readonly">
							</div>
						</div>
						<div class="row col-sm-4">
							<label for="use_time" class="col-sm-4 col-form-label">무료주차</label>
							<div class="col-sm-8">
							  	<input type="text" class="form-control" name="parking_free" id="parking_free" value="${read.parking_free}" readonly="readonly">
							</div>
						</div>
							<div class="row col-sm-4">
							<label for="trafficYn" class="col-sm-4 col-form-label">편의시설</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="trafficYn" id="parking_free" value="${read.trafficYn}" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="manager_id" class="col-sm-4 col-form-label">담당자</label>
							<div class="col-sm-8" id="mgrName">
								<input type='text' class='form-control' value="${read.manager_id}" name='manager_id' id='manager_id'  readonly="readonly">
						  	</div>
						</div>
						<div class="row col-sm-4">
							<label for="note" class="col-sm-4 col-form-label">특이사항</label>
							<div class="col-sm-8">
							  	<input type="text" class="form-control" name="note" id="note" value="${read.note}" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="row col-sm-4">
							<label for="limitYn" class="col-sm-4 col-form-label">이용제한</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="limitYn" id="limitYn" value="${read.limitYn}" readonly="readonly">
							</div>
						</div>
							<div class="row col-sm-4">
							<label for="limit_detail" class="col-sm-4 col-form-label">상세설명</label>
							<div class="col-sm-8">
							  	<input type="text" class="form-control" name="limit_detail" id="limit_detail" value="${read.limit_detail}" readonly="readonly">
							</div>
						</div>
							<div class="row col-sm-4">
							<label for="service_date" class="col-sm-4 col-form-label">서비스기간</label>
							<div class="col-sm-8">
							  <input type="text" class="form-control" name="service_date" id="service_date" value="${read.service_date}" readonly="readonly">
							</div>
						</div>
					</div>
					<div class="text-center">
						<button type="button" class="btn btn-secondary" onclick="history.go(-2)" ><i class="bi bi-list-ul"></i>목록</button>
						<button type="submit" class="btn btn-primary"><i class="bi bi-pencil-square"></i>수정</button>
						<button type="button" class="btn btn-secondary delBtn"><i class="bi bi-trash"></i>삭제</button>
					</div>
				</form>
			</div>
			<div class="alertPop">
				<div class="alertBox">
					<div class="modal fade">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content insert chrgrlist">
								<div class="modal-header">
									<h5 class="modal-title pagetitle"><i class="bi bi-ev-station"></i>충전기 정보</h5>
								</div>
								<div class="modal-body">
					              <table class="table table-hover">
					                <thead class="fixedHeader">
					                  <tr>
					                    <th scope="col" class="tb-center">충전기 ID</th>
					                    <th scope="col" class="tb-center">타입</th>
					                    <th scope="col" class="tb-center">충전방식</th>
					                    <th scope="col" class="tb-center">용량(kW)</th>
					                    <th scope="col" class="tb-center">현재상태</th>
					                    <th scope="col" class="tb-center">업데이트일자</th>
					                    <th scope="col" class="tb-center">삭제</th>
					                  </tr>
					                </thead>
					                <tbody id="list">
					                </tbody>
					              </table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary cancel"><i class="bi bi-dash-square"></i>닫기</button>
								</div>
							</div>
							<div class="modal-content delete">
								<div class="modal-header">
									<h5 class="modal-title">삭제하시겠습니까?</h5>
								</div>
								<div class="modal-body">
									데이터를 삭제하면 복구는 불가능합니다. 그래도 삭제하시겠습니까?
								</div>
								<div class="modal-footer">
									<button type="button" id="delBtn" class="btn btn-primary"><i class="bi bi-check-square"></i>예</button>
									<button type="button" class="btn btn-secondary cancel"><i class="bi bi-dash-square"></i>아니오</button>
								</div>
							</div>
						</div>
					</div>
				</div>
          </div>
         </div>
	</body>
	<script type="text/javascript">
		$(document).ready(function () {
			// 삭제 전 확인 alert
			$(".delBtn").click(function () {
				$(".alertPop .modal").addClass("show");
				$(".alertPop .modal-content.delete").addClass("show");
			});
			$(".cancel").click(function () {
				$(".alertPop .modal").removeClass("show");
				$(".alertPop .modal-content").removeClass("show");
			});

			$("#delBtn").click(function () {
				$(".alertPop .modal").removeClass("show");
				location.href='/evweb/admin/station/delete.do?stationId=${read.station_id}';
			});
			var stationId = "${read.station_id}";
			$("#chrgrInfo").click(function () {
				$(".alertPop .modal").addClass("show");
				$(".alertPop .modal-content.chrgrlist").addClass("show");
				
				$.ajax({
					url: "/evweb/ajax/chargerInfo",
					type: "get",
					data: {
						"stationId" : stationId
					},
					success:function(data){
						strHTML = "";
						for (var i = 0; i < data.length; i++) {
							strHTML += "<tr>";
							strHTML += "<td class='chrgrId tb-center'>"+ data[i].charger_id + "</td>";
							strHTML += "<td class='chrgrType tb-center'>"+ data[i].charger_type + "</td>";
							strHTML += "<td class='chrgrMethod tb-center'>"+ data[i].method + "</td>";
							strHTML += "<td class='chrgrOut tb-center'>"+ data[i].output + "</td>";
							
							chgerStat = data[i].stat;
							state = "";
							switch (chgerStat) {
							case "1":
								chgerStat = "통신이상";
								state = "err";
								break;
							case "2":
								chgerStat = "충전대기";
								break;
							case "3":
								chgerStat = "충전중";
								state = "charging";
								break;
							case "4":
								chgerStat = "운영중지";
								state = "stop";
								break;
							case "5":
								chgerStat = "점검중";
								state = "fix";
								break;
							default:
								chgerStat = "상태미확인";
								state = "noSign";
								break;
							}
							strHTML += "<td class='tb-center'><span class='chrgrStat "+state+"'>"+ chgerStat + "</span></td>";
							strHTML += "<td class='chrgrUdt tb-center'>"+ data[i].stat_UpdDt + "</td>";
							strHTML += "<td class='chrgrDelYn tb-center'>"+ data[i].delYn + "</td>";
							strHTML += "</tr>";
						}
						$("#list").html(strHTML);
						
					},
					error: function error_run(obj, msg, statusMsg) {
						alert("오류발생 ->"+obj+","+msg+","+statusMsg);
					}
				});

			});
		});
	</script>
</html>