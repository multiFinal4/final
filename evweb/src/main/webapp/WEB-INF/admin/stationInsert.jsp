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
		<h1 class="pagetitle">충전소 등록</h1>
		<div class="card-body stationWrap">
			<form action="/evweb/admin/station/insert.do" method="post">
				<div class="row mb-3">
					<label for="station_name" class="col-sm-2 col-form-label">충전소 이름</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="station_name" id="station_name">
					</div>
				</div>
				<div class="row mb-3">
					<label for="station_company" class="col-sm-2 col-form-label">충전소 회사</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="station_company" id="station_company">
					</div>
				</div>
				<div class="row mb-3">
					<label for="charger_no" class="col-sm-2 col-form-label">충전기 대수</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="charger_no" id="charger_no">
					</div>
				</div>
				<div class="row mb-3">
					<label for="addr_do" class="col-sm-2 col-form-label">주소(도)</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="addr_do" id="addr_do">
					</div>
				</div>
				<div class="row mb-3">
					<label for="addr_sigun" class="col-sm-2 col-form-label">주소(시/군/구)</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="addr_sigun" id="addr_sigun">
					</div>
				</div>
				<div class="row mb-3">
					<label for="addr_detail" class="col-sm-2 col-form-label">상세주소</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="addr_detail" id="addr_detail">
					</div>
				</div>
				<div class="row mb-3">
					<label for="manager_id" class="col-sm-2 col-form-label">담당자</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="manager_id" id="manager_id">
					</div>
					<div class="col-sm-1">
					  <button type="button" id="mgrBtn" class="btn btn-primary"><i class="bi bi-search"></i>관리자</button>
					</div>
				</div>
				<div class="row mb-3">
					<label for="service_date" class="col-sm-2 col-form-label">서비스기간</label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" name="service_date" id="service_date">
					</div>
				</div>
				<div class="text-center">
					<button type="button" class="btn btn-secondary" onclick="location.href='/evweb/admin/station/list?category=all&pageNo=1'" ><i class="bi bi-list-ul"></i>목록</button>
					<button type="submit" class="btn btn-primary"><i class="bi bi-pencil-square"></i>등록</button>
					<button type="reset" class="btn btn-secondary"><i class="bi bi-arrow-repeat"></i>초기화</button>
				</div>
			</form>
		</div>
		
		<div class="alertPop">
			<div class="alertBox">
				<div class="modal fade">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">충전소 담당자 리스트</h5>
									<button type="button" class="btn-close"></button>
								</div>
								<div class="modal-body">
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
								<div class="modal-footer">
									<button type="button" id="delBtn" class="btn btn-primary"><i class="bi bi-check-square"></i>예</button>
									<button type="button" id="cancel" class="btn btn-secondary"><i class="bi bi-dash-square"></i>아니오</button>
								</div>
							</div>
						</div>
					</div>
				</div>
          </div>
	</body>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#mgrBtn").click(function () {
				$(".alertPop .modal").addClass("show");
				
				category = $(this).children("a").text();
				$("#boardCategory li").children("a").removeClass("active");
				$(this).children("a").addClass("active");
				
				$.ajax({
					url: "/erp/ajax/managerList",
					type: "get",
					data: {
						"category" : category
					},
					success:function(data){
						strHTML = "";
						for (var i = 0; i < data.length; i++) {
							strHTML += "<tr>";
							strHTML += "<td class='boardContent'>";
							strHTML += "<a href='/erp/board/read.do?boardNo="+data[i].boardno+"&state=READ'>";
							strHTML += data[i].title;
							strHTML += "</a>";
							strHTML += "</td>";
							strHTML += "<td class='boardDate'>"+data[i].write_date+"</td>";
							strHTML += "</tr>";
						}
						$("#mydatalist").html(strHTML);
					},
					error: function error_run(obj, msg, statusMsg) {
						alert("오류발생 ->"+obj+","+msg+","+statusMsg);
					}
				});
			});
			$("#cancel").click(function () {
				$(".alertPop .modal").removeClass("show");
			});
		})
	
	</script>
</html>