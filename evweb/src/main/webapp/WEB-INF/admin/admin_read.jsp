<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">


<title>관리자 등록</title>
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
		rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<style type="text/css">
	label{
	
	text-align:center;
	}

 	#input{
    background : #FBF5EF;
    
 	}
 
	</style>
		
</head>

<body>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1></h1>
		</div>
		<div>
		<div >
			<div class="card-body">
				<h1 class="pagetitle">[ 마이페이지 ]</h1><br/>

				<!-- General Form Elements -->
				<form action="" method="post">
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">아이디</label>
						<div class="col-sm-3">
							${managerinfo.manager_id}
						</div>
						<span id="checkVal" style="color: red;"></span>
					</div>
					<div class="row mb-3">
						<label for="inputPassword" class="col-sm-2 col-form-label" id="input">비밀번호</label>
						<div class="col-sm-3">
							${managerinfo.manager_pass}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">이름</label>
						<div class="col-sm-3">
							${managerinfo.manager_name}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">핸드폰
							번호</label>
						<div class="col-sm-3">
							${managerinfo.phone_no}
						</div>
						
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label"id="input">주소</label>
						<div class="col-sm-3">
							${managerinfo.addr}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputEmail" class="col-sm-2 col-form-label" id="input">Email</label>
						<div class="col-sm-3">
							${managerinfo.email}
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" id="input">권한</label>
						<div class="col-sm-10">
							${managerinfo.type}
						</div>
						
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">회사</label>
						<div class="col-sm-3">
							${managerinfo.company}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">직급</label>
						<div class="col-sm-3">
							${managerinfo.position}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">입사일</label>
						<div class="col-sm-3">
							${managerinfo.hire_date}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">상태</label>
						<div class="col-sm-3">
							${managerinfo.state}
						</div>
					</div><br/>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label"></label>
						<div class="">
							<button type="button" onclick="location.href='/evweb/manager/list.do?type=all&pageNo=1&name='" class="btn btn-secondary"><i class="bi bi-list-ul"></i>목록</button>
							<button type="button" onclick="location.href='/evweb/manager/read.do?&manager_id=${managerinfo.manager_id}&read=UPDATE'"
							 class="btn btn-primary"><i class="bi bi-pencil-square"></i>수정</button>
							 <button type="button" class="btn btn-secondary delBtn"><i class="bi bi-trash"></i>삭제</button>
						</div>
						<div class="col-sm-3">
							
							
						</div>
						
					</div>
				</form>
			</div>
		</div>
		</div>
		<div class="alertPop">
			<div class="alertBox">
				<div class="modal fade">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">삭제하시겠습니까?</h5>
									<button type="button" class="btn-close"></button>
								</div>
								<div class="modal-body">
									데이터를 삭제하면 복구는 불가능합니다. 그래도 삭제하시겠습니까?
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
			// 삭제 전 확인 alert
			
			$(".delBtn").click(function () {
				$(".alertPop .modal").addClass("show");
				$(".alertPop .modal-content").addClass("show");
			});
			$("#cancel").click(function () {
				$(".alertPop .modal").removeClass("show");
				$(".alertPop .modal-content").removeClass("show");
			});

			$("#delBtn").click(function () {
				$(".alertPop .modal").removeClass("show");
				location.href='/evweb/manager/realdelete.do?manager_id=${managerinfo.manager_id}';
			});
		})
	
	</script>
</html>