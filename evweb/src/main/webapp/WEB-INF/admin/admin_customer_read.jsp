<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
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
		
		<div class="card-body">
			<h1 class="pagetitle">[ 회원 정보 ]</h1><br/>
			<form action="" method="post">
				<div class="row mb-3">
					<label for="customer_id" class="col-sm-2 col-form-label" id="input"> ID </label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="customer_id" id="customer_id" value="${customerinfo.customer_id}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="customer_name" class="col-sm-2 col-form-label" id="input"> 이름 </label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="name" id="customer_name" value="${customerinfo.name}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="customer_pass" class="col-sm-2 col-form-label" id="input">비밀번호</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="pass" id="customer_pass" value="${customerinfo.pass}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="phone_no" class="col-sm-2 col-form-label" id="input">전화번호</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="phone_no" id="phone_no" value="${customerinfo.phone_no}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3"> 
					<label for="customer_addr" class="col-sm-2 col-form-label" id="input">주소</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="customer_addr" id="customer_addr" value="${customerinfo.customer_addr}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="email" class="col-sm-2 col-form-label" id="input">Email</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="email" id="email" value="${customerinfo.email}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="customer_birth" class="col-sm-2 col-form-label" id="input">생년월일</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="birth" id="customer_birth" value="${customerinfo.birth}" readonly="readonly">
					</div>
				</div><br/>
				<div class="text-center">
					<button type="button" onclick='location.href="/evweb/manager/customerRead.do?customer_id=${customerinfo.customer_id}&read=UPDATE"' class="btn btn-primary"><i class="bi bi-pencil-square"></i>관리자로 전환</button>
					<button type="button" onclick="location.href='/evweb/manager/list.do?type=all&pageNo=1&name='" class="btn btn-secondary"><i class="bi bi-list-ul"></i>목록</button>
					<button type="button" class="btn btn-secondary delBtn"><i class="bi bi-trash"></i>삭제</button>
				</div>
			</form>
			</div>
		<div class="alertPop">
			<div class="alertBox">
				<div class="modal fade">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">탈퇴하시겠습니까?</h5>
									<button type="button" class="btn-close"></button>
								</div>
								<div class="modal-body">
									탈퇴하면 데이터는 복구 불가능합니다. 그래도 탈퇴하시겠습니까?
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
				location.href='/evweb/customer/realdelete.do?customer_id=${customerinfo.customer_id}';
			});
		})
	
	</script>
		
	</body>
	
	
</html>