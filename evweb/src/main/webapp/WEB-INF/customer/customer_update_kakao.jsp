<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		<title>카카오회원 수정</title>
		<link href="https://fonts.gstatic.com" rel="preconnect">
		<link	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
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
		<h1 class="pagetitle" > <img src='/evweb/images/favicon/favicon.ico' style='width:50px;'>[ 카카오회원 수정 ]</h1><br/>
			<form action="/evweb/customer/update.do" method="post">
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">이름</label>
					<div class="col-sm-3">
						${customerinfo.name} <input name="name" class="form-control"
							type="text" value="${customerinfo.name}">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">핸드폰
						번호</label>
					<div class="col-sm-3">
						<input name="phone_no" type="text" class="form-control"
							value="${customerinfo.phone_no}" minlength="1" required>
					</div>
					<label for="inputText" class="col-sm-2 col-form-label">(-
						제외하고 입력)</label>
				</div>
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">주소</label>
					<div class="col-sm-3">
						<div class="row mb-2">
							<input type="text" name="zipcode" id="zipcode" size="7" class="form-control col-sm-4 mr-2" value="${customerinfo.zipcode}" readonly>
			            	<button class="btn btn-primary col-sm-4" id="adrbtn" type="button" value="우편번호찾기" onclick="kakaopost()" >우편번호찾기</button>
	                  	</div>
	                  	<input type="text" name="customer_addr"  id="customer_addr" class="form-control" minlength="5" value="${customerinfo.customer_addr}" required > 
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">상세주소</label>
					<div class="col-sm-3">
						<input name="address" class="form-control"
							value="${customerinfo.address}" type="text" minlength="5"
							required>
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputEmail" class="col-sm-2 col-form-label" id="input">Email</label>
					<div class="col-sm-3">
						<input name="email" type="email" value="${customerinfo.email}" class="form-control" minlength="5" required>
					</div>
				</div>
	
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">생년월일</label>
					<div class="col-sm-3">
						<input name="birth" class="form-control" type="text" value="${customerinfo.birth}" minlength="1" required>
					</div>
					<c:choose>
						<c:when test="${customerinfo.birth == '1111-11-11'}">
							<label for="inputText" class="col-sm-3 col-form-label" style="color: gray;">임시 생년월일입니다. 변경해주세요.</label>
						</c:when>
					</c:choose>
				</div>
				
				<br>
				<br>
				<input name="pass" type="hidden" class="form-control" value="${customerinfo.pass}">
				<input name="ps_question" class="form-control" value="${customerinfo.ps_question}" type="hidden">
				<input name="ps_answer" class="form-control" value="${customerinfo.ps_answer}" type="hidden">
				<input name="state" class="form-control" type="hidden" value="${customerinfo.state}">
			 	<input name="customer_id" class="form-control" type="hidden" value="${customerinfo.customer_id}">
				
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label"></label>
					<div class="">
						<button type="submit" class="btn btn-primary">완료</button>
					</div>
					<div class="col-sm-3">
						<button type="button" onclick="location.href='/evweb/customer/read.do?customer_id=${customerinfo.customer_id}&state=READ'" class="btn btn-primary">취소</button>
					</div>
				</div>
			</form>
			
		</div>
	</body>
</html>