<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">


<title>관리자 수정</title>
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
		rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#type").val("${managerinfo.type}").attr("selected","selected");	
		});
	</script>
</head>

<body>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1></h1>
		</div>
		<div>
		<div >
			<div class="card-body">
				<h5 class="card-title">관리자 수정</h5>

				<!-- General Form Elements -->
				<form action="/evweb/manager/update.do" method="post">
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">아이디</label>
						<div class="col-sm-3">
							${managerinfo.manager_id}
							<input name="manager_id" class="form-control" type="hidden" value="${managerinfo.manager_id}">
						</div>
						<span id="checkVal" style="color: red;"></span>
					</div>
					<div class="row mb-3">
						<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
						<div class="col-sm-3">
							<input name="manager_pass" type="password" class="form-control" value="${managerinfo.manager_pass}" minlength="4" required>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-3">
							${managerinfo.manager_name}
							<input name="manager_name" class="form-control" type="hidden" value="${managerinfo.manager_name}">
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">핸드폰
							번호</label>
						<div class="col-sm-3">
							<input name="phone_no" type="text" class="form-control" value="${managerinfo.phone_no}" minlength="1" required>
						</div>
						<label for="inputText" class="col-sm-2 col-form-label">(-
							제외하고 입력)</label>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">주소</label>
						<div class="col-sm-3">
							<input name="addr" class="form-control" value="${managerinfo.addr}" type="text" minlength="5" required>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-3">
							<input name="email" type="email" value="${managerinfo.email}" class="form-control" minlength="5" required>
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">권한</label>
						<div class="col-sm-10">
							<select id= "type" name="type" class="form-select" aria-label="Default select example" >
								<option value="충전소 관리자">충전소 관리자</option>
								<option value="사이트 관리자">사이트 관리자</option>
							</select>
						</div>
						
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">회사</label>
						<div class="col-sm-3">
							<input name="company" type="text" value="${managerinfo.company}" class="form-control" minlength="1" required>
						</div>
						<label for="inputText" class="col-sm-2 col-form-label">(사이트관리자의 경우 사이트)</label>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">직급</label>
						<div class="col-sm-3">
							<input name="position" value="${managerinfo.position}" class="form-control" type="text" minlength="1" required>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">입사일</label>
						<div class="col-sm-3">
							<input name="hire_date" class="form-control" type="text" value="${managerinfo.hire_date}">
						</div>
						<label for="inputText" class="col-sm-2 col-form-label">(예시 : 2022-12-17)</label>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">상태</label>
						<div class="col-sm-3">
							<input name="state" class="form-control" type="text" value="${managerinfo.state}">
						</div>
					</div>
					
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label"></label>
						<div class="">
							<button type="submit" class="btn btn-primary">완료</button>
						</div>
						<div class="col-sm-3">
							<button type="button" onclick="location.href='/evweb/manager/read.do?manager_id=${managerinfo.manager_id}&read=READ'" class="btn btn-primary">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		</div>
</body>
</html>