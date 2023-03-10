<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		<title>회원가입</title>
		<link href="https://fonts.gstatic.com" rel="preconnect">
		<link href="/evweb/css/style.css" rel="stylesheet">
		<script>
		function kakaopost() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		           document.querySelector("#zipcode").value = data.zonecode;
		           document.querySelector("#customer_addr").value =  data.address
		        }
		    }).open();
		}
		</script>
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
			<h1 class="pagetitle">
				<img src='/evweb/images/favicon/favicon.ico' style='width: 40px;'>
				회원 가입
			</h1><br/>
			<!-- 회원등록 -->
			<form action="/evweb/customer/register.do" method="post">
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">아이디</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" minlength="4"
							id="customer_id" name="customer_id" required>
					</div>
					
				</div>
				<div class="row mb-3">
					<label for="inputPassword" class="col-sm-2 col-form-label" id="input">비밀번호</label>
					<div class="col-sm-3">
						<input name="pass" type="password" class="form-control"
							minlength="4" required>
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">핸드폰
						번호</label>
					<div class="col-sm-3">
						<input name="phone_no" type="text" class="form-control"
							minlength="1" required>
					</div>
					<label for="inputText" class="col-sm-2 col-form-label"></label>
				</div>
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">이름</label>
					<div class="col-sm-3">
						<input name="name" type="text" class="form-control" minlength="1"
							required>
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">주소</label>
					<div class="col-sm-3">
						<div class="row mb-2">
							<input type="text" name="zipcode" id="zipcode" size="7" class="form-control col-sm-4 mr-2" readonly>
			                <button class="btn btn-primary col-sm-4" id="adrbtn" type="button" value="우편번호찾기" onclick="kakaopost()" >우편번호찾기</button>
	                  	</div>
	                  	<input type="text" name="customer_addr"  id="customer_addr" class="form-control" minlength="5" required> 
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">상세주소</label>
					<div class="col-sm-3">
						<input name="address" type="text" class="form-control" minlength="3" 
							required>
					</div>
				</div>
				
				<div class="row mb-3">
					<label for="inputEmail" class="col-sm-2 col-form-label" id="input">Email</label>
					<div class="col-sm-3">
						<input name="email" type="email" class="form-control" minlength="5"
							required>
					</div>
				</div>
	
				<!-- 
						<input name="insertdate" class="form-control" type="hidden" value=sysdate>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label"></label>
							<div class="col-sm-3"> -->
	
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">생년월일</label>
					<div class="col-sm-3">
						<input name="birth" type="text" class="form-control" minlength="1"
							required>
					</div>
					<label for="inputText" class="col-sm-2 col-form-label">(예시 :
						2022-12-17)</label>
				</div>
	
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">비밀번호
						찾기용 질문</label>
					<div class="col-sm-3">
						<input name="ps_question" type="text" class="form-control"
							minlength="3" required>
					</div>
				</div>
	
				<div class="row mb-3">
					<label for="inputText" class="col-sm-2 col-form-label" id="input">질문에대한
						대답</label>
					<div class="col-sm-3">
						<input name="ps_answer" type="text" class="form-control"
							minlength="1" required>
					</div>
				</div>
	
	
				<input name="state" class="form-control" type="hidden" value="정상">
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label"></label>
					<div class="col-sm-3">
						<button type="submit" class="btn btn-primary">등록</button>
					</div>
				</div>
			</form>
		</div>
	</body>
</html>