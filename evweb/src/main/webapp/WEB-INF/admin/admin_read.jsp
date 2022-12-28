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
</head>

<body>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1></h1>
		</div>
		<div>
		<div >
			<div class="card-body">
				<h5 class="card-title">관리자 정보</h5>

				<!-- General Form Elements -->
				<form action="" method="post">
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">아이디</label>
						<div class="col-sm-3">
							${managerinfo.manager_id}
						</div>
						<span id="checkVal" style="color: red;"></span>
					</div>
					<div class="row mb-3">
						<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
						<div class="col-sm-3">
							${managerinfo.manager_pass}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-3">
							${managerinfo.manager_name}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">핸드폰
							번호</label>
						<div class="col-sm-3">
							${managerinfo.phone_no}
						</div>
						<label for="inputText" class="col-sm-2 col-form-label"></label>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">주소</label>
						<div class="col-sm-3">
							${managerinfo.addr}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-3">
							${managerinfo.email}
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label">권한</label>
						<div class="col-sm-10">
							${managerinfo.type}
						</div>
						
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">회사</label>
						<div class="col-sm-3">
							${managerinfo.company}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">직급</label>
						<div class="col-sm-3">
							${managerinfo.position}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">입사일</label>
						<div class="col-sm-3">
							${managerinfo.hire_date}
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">상태</label>
						<div class="col-sm-3">
							${managerinfo.state}
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label"></label>
						<div class="">
							<button type="button" onclick="location.href='/evweb/manager/read.do?&manager_id=${managerinfo.manager_id}&read=UPDATE'"
							 class="btn btn-primary">수정</button>
						</div>
						<div class="col-sm-3">
							<button type="button" onclick="location.href='/evweb/manager/list.do?'" class="btn btn-primary">목록</button>
						</div>
						
					</div>
				</form>
			</div>
		</div>
		</div>
</body>
</html>