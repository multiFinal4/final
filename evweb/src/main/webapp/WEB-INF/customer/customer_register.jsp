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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
	 $(document).ready(function() {
			$("#customer_id").on("keyup", function() {
				var inputid = { "customer_id": $("#customer_id").val() }
				if($("#customer_id").val().length < 4){
					$("#checkVal").text("4글자 이상 입력해주세요")
				}else{
					$.ajax({
					url:"/evweb/customer/idcheak",
					type: "post",
					data: inputid,
					success: function(data){
						if(data == false){	
							$("#checkVal").text("중복된 아이디로 사용불가")
						}else{
							$("#checkVal").text("사용가능아이디")
						}
					}
				})
				}
			})
		}) 
	</script>
</head>
<body>
			<div class="card-body">
				<h2 class="card-title">회원 가입</h2>

				<!-- 회원등록 -->
				<form action="/customer/register.do" method="post">
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">아이디</label>
						<div class="col-sm-3">
							<input  type="text" class="form-control" minlength="4" id ="customer_id" name="customer_id" required>
						</div>
						<span id="checkVal" style="color: red;"></span>
					</div>
					<div class="row mb-3">
						<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
						<div class="col-sm-3">
							<input name="customer_pass" type="password" class="form-control" minlength="4" required>
						</div>
					</div>
						<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">핸드폰
							번호</label>
						<div class="col-sm-3">
							<input name="phone_no" type="text" class="form-control" minlength="1" required>
						</div>
						<label for="inputText" class="col-sm-2 col-form-label">(-
							제외하고 입력하세요)</label>
					</div>
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-3">
							<input name="customer_name" type="text" class="form-control" minlength="1" required>
						</div>
					</div>
				
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">주소</label>
						<div class="col-sm-3">
							<input name="customer_addr" class="form-control" type="text" minlength="5" required>
						</div>
					</div>
					<div class="row mb-3">
						<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-3">
							<input name="email" type="email" class="form-control" minlength="5" required>
						</div>
					</div>
					
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">생년월일</label>
						<div class="col-sm-3">
							<input name="customer_birth" type="text" class="form-control" minlength="1" required>
						</div>
						<label for="inputText" class="col-sm-2 col-form-label">(예시: 20221219)</label>
					</div>
					
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">비밀번호 찾기용 질문</label>
						<div class="col-sm-3">
							<input name="ps_question" type="text" class="form-control" minlength="3" required>
						</div>
					</div>
					
					<div class="row mb-3">
						<label for="inputText" class="col-sm-2 col-form-label">질문에대한 대답</label>
						<div class="col-sm-3">
							<input name="ps_answer" type="text" class="form-control" minlength="5" required>
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