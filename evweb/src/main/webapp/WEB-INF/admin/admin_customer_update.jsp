<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	<style type="text/css">
		

	 	#input{
    		background : #FBF5EF;
    		text-align:center;
 		}
 
		</style>
		
		
	</head>
	<body>
		<h1 class="pagetitle"> [ 관리자로 전환] </h1>
		<div class="card-body">
			<form action="/evweb/manager/change.do" method="post">
				<div class="row mb-3">
					<label for="customer_id" class="col-sm-2 col-form-label" id="input"> ID </label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="manager_id" value="${customerinfo.customer_id}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="customer_name" class="col-sm-2 col-form-label" id="input"> 이름 </label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="manager_name" value="${customerinfo.name}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="customer_pass" class="col-sm-2 col-form-label" id="input">비밀번호</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="manager_pass" value="${customerinfo.pass}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="phone_no" class="col-sm-2 col-form-label" id="input">전화번호</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="phone_no" value="${customerinfo.phone_no}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3"> 
					<label for="customer_addr" class="col-sm-2 col-form-label" id="input">주소</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="addr" value="${customerinfo.customer_addr}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
					<label for="email" class="col-sm-2 col-form-label" id="input">Email</label>
					<div class="col-sm-5">
					  <input type="text" class="form-control" name="email" value="${customerinfo.email}" readonly="readonly">
					</div>
				</div>
				<div class="row mb-3">
						<label class="col-sm-2 col-form-label" id="input">권한</label>
						<div class="col-sm-10">
							<select id= "type" name="type" class="form-select" aria-label="Default select example" >
								<option value="충전소 관리자" selected>충전소 관리자</option>
								<option value="사이트 관리자">사이트 관리자</option>
							</select>
						</div>
					</div>
				<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">회사</label>
						<div class="col-sm-3">
							<input name="company" type="text" class="form-control" minlength="1" required>
						</div>
						<label for="inputText" class="col-sm-2 col-form-label">(사이트관리자의 경우 사이트)</label>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">직급</label>
						<div class="col-sm-3">
							<input name="position" class="form-control" type="text" minlength="1" required>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">입사일</label>
						<div class="col-sm-3">
							<input name="hire_date" class="form-control" type="date" minlength="1" required>
						</div>
					</div>
					<input name="state" class="form-control" type="hidden" value="재직">
				<div class="text-center">
					<div class="">
							<button type="submit" class="btn btn-primary">완료</button>
							<button type="button" onclick="location.href='/evweb/manager/customerRead.do?customer_id=${customerinfo.customer_id}&read=READ'" class="btn btn-primary">취소</button>
						</div>
				</div>
			</form>
			</div>
	</body>
</html>