<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		<title>마이페이지</title>
		<link href="https://fonts.gstatic.com" rel="preconnect">
		<link	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
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
		<div class="card-body">
			<h1 class="pagetitle"><img src='/evweb/images/favicon/favicon.ico' style='width:50px;'> [ 카카오회원 마이페이지 ]</h1>
			<hr/>
			<!-- General Form Elements -->
			<form action="/evweb/customer/read.do?state=UPDATE&customer_id=${user.customer_id}" method="post">
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label"  id="input">이름</label>
					<div class="col-sm-3">
						${customerinfo.name}
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">핸드폰
						번호</label>
					<div class="col-sm-3">
						${customerinfo.phone_no}
					</div>
					<label for="inputText" class="col-sm-2 col-form-label"></label>
				</div>
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">주소</label>
					<div class="col-sm-3">
						${customerinfo.customer_addr}
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputEmail" class="col-sm-2 col-form-label" id="input">Email</label>
					<div class="col-sm-3">
						${customerinfo.email}
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" id="input">생년월일</label>
					<div class="col-sm-3">
						<c:choose>
							<c:when test="${customerinfo.birth == null}">
								정보없음
							</c:when>
							<c:otherwise>
								${customerinfo.birth}
							</c:otherwise>
						</c:choose>
					</div>
				</div>
					
				<div class="text-center">
					<button type="submit" class="btn btn-primary"><i class="bi bi-pencil-square"></i>회원정보수정</button>
					<button type="button" class="btn btn-secondary delBtn"><i class="bi bi-trash"></i>회원탈퇴</button>
					<!-- 탈퇴 버튼 누르면 "/customer/delete.do?customer_id=${customerinfo.customer_id}" 로 이어지게 -->
				</div>
			</form>
		</div>
		<div class="alertPop">
			<div class="alertBox">
				<div class="modal fade">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content ">
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
				location.href='/evweb/customer/delete.do?customer_id=${customerinfo.customer_id}';
			});
		})
	
	</script>
		
	
	
	
</html>