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
					<div class="col-sm-2">
					  <input type="text" class="form-control" name="station_name" id="station_name">
					</div>
				</div>
				<div class="row mb-3">
					<label for="station_company" class="col-sm-2 col-form-label">충전소 회사</label>
					<div class="col-sm-2">
					  <input type="text" class="form-control" name="station_company" id="station_company">
					</div>
				</div>
				<div class="row mb-3">
					<label for="charger_no" class="col-sm-2 col-form-label">충전기 대수</label>
					<div class="col-sm-2">
					  <input type="text" class="form-control" name="charger_no" id="charger_no">
					</div>
				</div>
				<div class="row mb-3">
					<label for="addr_do" class="col-sm-2 col-form-label">주소(도)</label>
					<div class="col-sm-2">
						<select name="addr_do"  id="addr_do" class="form-control">
							<option value="jejudo">제주특별자치도</option>
						</select>
					</div>
				</div>
				<div class="row mb-3">
					<label for="addr_sigun" class="col-sm-2 col-form-label">주소(시/군/구)</label>
					<div class="col-sm-2">
						<select name="addr_sigun"  id="addr_sigun" class="form-control">
							<option value="jeju">제주시</option>
							<option value="seogwipo">서귀포시</option>
						</select>
					</div>
				</div>
				<div class="row mb-3">
					<label for="addr_detail" class="col-sm-2 col-form-label">상세주소</label>
					<div class="col-sm-2">
					  <input type="text" class="form-control" name="addr_detail" id="addr_detail">
					</div>
				</div>
				<div class="row mb-3">
					<label for="manager_id" class="col-sm-2 col-form-label">담당자</label>
					<div class="col-sm-2" id="mgrName">
						<input type='text' class='form-control' value='' name='manager_id' id='manager_id'>
					</div>
					<div class="mb-2">
					  <button type="button" id="mgrBtn" class="btn btn-primary"><i class="bi bi-search"></i>관리자</button>
					</div>
				</div>
				<div class="row mb-3">
					<label for="service_date" class="col-sm-2 col-form-label">서비스기간</label>
					<div class="col-sm-2">
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
	</body>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#mgrBtn").click(function () {
				$(".alertPop .modal").addClass("show");
				$(".alertPop .modal-content").addClass("show");
				
				$.ajax({
					url: "/evweb/ajax/managerList",
					type: "get",
					data: {
						"category" : "충전소 관리자"
					},
					success:function(data){
						strHTML = "";
						for (var i = 0; i < data.length; i++) {
							strHTML += "<tr>";
							strHTML += "<td class='mrgId tb-center'>"+ data[i].manager_id + "</td>";
							strHTML += "<td class='mrgName'>"+ data[i].manager_name + "</td>";
							strHTML += "<td class='mrgCom'>"+ data[i].company + "</td>";
							strHTML += "<td class='mrgPosi'>"+ data[i].position + "</td>";
							strHTML += "<td class='tb-center'><buttton type='button' name='"+i+"' class='btn btn-primary rounded-pill selectMgr'>선택</button></td>";
							strHTML += "</tr>";
						}
						$("#mgrList").html(strHTML);
						$(".selectMgr").click(function () {
							mgrInfo = "";
							mrgId = $(this).attr('name');
							mgrInfo += "<input type='text' class='form-control' value='"+data[mrgId].manager_id+"' name='manager_id' id='manager_id'>";
							$("#mgrName").html(mgrInfo);
							$(".alertPop .modal").removeClass("show");
						});
						
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