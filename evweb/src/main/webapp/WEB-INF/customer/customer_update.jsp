<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">


<title>일반회원 수정</title>
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
 #adrbtn{ margin: 10px;}
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
			<div>
				<div class="card-body">
					<h1 class="pagetitle">[ 일반회원 수정 ]</h1><br/>

					<!-- General Form Elements -->
					<form action="/evweb/customer/update.do" method="post">
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label" id="input">아이디</label>
							<div class="col-sm-3">${user.customer_id}</div>

						</div>
						<div class="row mb-3">
							<label for="inputPassword" class="col-sm-2 col-form-label" id="input">비밀번호</label>
							<div class="col-sm-3">
								<input name="pass" type="password" class="form-control"
									value="${customerinfo.pass}" minlength="4" required>
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
							<label for="inputText" class="col-sm-2 col-form-label" id="input">이름</label>
							<div class="col-sm-3">
								${customerinfo.name} <input name="name" class="form-control"
									type="hidden" value="${customerinfo.name}">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label" id="input">우편번호</label>
							<div class="col-sm-3">
								<input name="zipcode"  id="zipcode" size="7" 
									value="${customerinfo.zipcode}" type="text" minlength="5" required readonly> 
							</div>
						</div>
			
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label" id="input">주소</label>
							<div class="col-sm-3">
								<input name="customer_addr" id="customer_addr"  class="form-control"
									value="${customerinfo.customer_addr}" type="text" minlength="5"
									required><button class="btn btn-primary w-20" id="adrbtn" type="button" value="우편번호찾기" onclick="kakaopost()" >주소변경</button>
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
								<input name="email" type="email" value="${customerinfo.email}"
									class="form-control" minlength="5" required>
							</div>
						</div>


						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label" id="input">생년월일</label>
							<div class="col-sm-3">
								<input name="birth" class="form-control" type="hidden"
									value="${customerinfo.birth}"> ${customerinfo.birth}
							</div>

						</div>

						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label" id="input">비밀번호찾기
								질문</label>
							<div class="col-sm-3">
								<input name="ps_question" class="form-control"
									value="${customerinfo.ps_question}" type="text" minlength="3"
									required>
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label" id="input">비밀번호찾기
								대답</label>
							<div class="col-sm-3">
								<input name="ps_answer" class="form-control"
									value="${customerinfo.ps_answer}" type="text" minlength="1"
									required>
							</div>
						</div>
						<input name="state" class="form-control" type="hidden"
							value="${customerinfo.state}"> <input name="customer_id"
							class="form-control" type="hidden"
							value="${customerinfo.customer_id}">

						<div class="row mb-3">
							<label class="col-sm-2 col-form-label"></label>
							<div class="">
								<button type="submit" class="btn btn-primary">완료</button>
							</div>
							<div class="col-sm-3">
								<button type="button"
									onclick="location.href='/evweb/customer/read.do?customer_id=${customerinfo.customer_id}&state=READ'"
									class="btn btn-primary">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
</html>