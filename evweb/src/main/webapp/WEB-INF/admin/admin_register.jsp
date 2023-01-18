<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>관리자 등록</title>
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
		 $(document).ready(function() {
			$("#manager_id").on("keyup", function() {
				var inputid = { "manager_id": $("#manager_id").val() }
				if($("#manager_id").val().length < 4){
					$("#checkVal").text("4글자 이상 입력해주세요")
				}else{
					$.ajax({
					url:"/evweb/manager/idcheak",
					type: "post",
					data: inputid,
					success: function(data){
						if(data == false){	
							$("#checkVal").text("사용불가능아이디")
						}else{
							$("#checkVal").text("사용가능아이디")
						}
					}
				})
				}
			})
		}) 
	</script>
	<style type="text/css">
	
 
 	#input{
    background : #FBF5EF;
    text-align:center;
 	}
 
</style>
	
</head>
<body>
			<div class="card-body">
<<<<<<< HEAD
				<h2 class="pagetitle">관리자 등록</h2>
				<br>
=======
				<h3 class="pagetitle"> [ 관리자 등록 ]</h3><br/>
>>>>>>> origin/youn
				<!-- General Form Elements -->
				<form action="/evweb/manager/register.do" method="post">
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">아이디</label>
						<div class="col-sm-3">
							<input  type="text" class="form-control" minlength="4" id ="manager_id" name="manager_id" required>
						</div>
						<span id="checkVal" style="color: red;"></span>
					</div>
					<div class="row mb-3">
						<label for="inputPassword" class="col-sm-2 col-form-label" id="input">비밀번호</label>
						<div class="col-sm-3">
							<input name="manager_pass" type="password" class="form-control" minlength="4" required>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">이름</label>
						<div class="col-sm-3">
							<input name="manager_name" type="text" class="form-control" minlength="1" required>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">핸드폰
							번호</label>
						<div class="col-sm-3">
							<input name="phone_no" type="text" class="form-control" minlength="1" required>
						</div>
						<label for="inputText" class="col-sm-2 col-form-label">(예시 :010-
							0000-0000)</label>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label" id="input">주소</label>
						<div class="col-sm-3">
							<input name="addr" class="form-control" type="text" minlength="5" required>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputEmail" class="col-sm-2 col-form-label" id="input">Email</label>
						<div class="col-sm-3">
							<input name="email" type="email" class="form-control" minlength="5" required>
						</div>
					</div>
					<div class="row mb-3">
						<label class="col-sm-2 col-form-label" id="input">권한</label>
						<div class="col-sm-10">
							<select name="type" class="form-select" aria-label="Default select example" >
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
						<label for="inputText" class="col-sm-2 col-form-label"></label>
					</div>
					<input name="state" class="form-control" type="hidden" value="재직">
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