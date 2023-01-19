<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		<title>아이디/비밀번호 찾기</title>
		<!-- Google Fonts -->
		<link href="https://fonts.gstatic.com" rel="preconnect">
		<!-- Vendor CSS Files -->
		<link href="/evweb/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="/evweb/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
		<link href="/evweb/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
		<link href="/evweb/vendor/quill/quill.snow.css" rel="stylesheet">
		<link href="/evweb/vendor/quill/quill.bubble.css" rel="stylesheet">
		<link href="/evweb/css/font.css" rel="stylesheet">
		<link href="/evweb/css/common.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/evweb/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
			.nav-link {
				color : #0d6efd
			}
			 
			 @font-face {
			    font-family: 'jejudoldam';
			    src: url('/evweb/css/jejudoldam.ttf');
				font-weight: normal;
			    font-style: normal;
			}
			.btn-primary{
				background-color: #F37321;
				border-color: #F37321;
			}
			.btn-primary:hover{
			    color: #fff;
			    background-color: #444;
			    border-color: #444;
			}
			.nav-link{
				color: #F37321;
			}
			h1 a {font-family: 'jejudoldam';}
		</style>
		<script type="text/javascript">
			$(document).ready(function(){
				$("#idbtn").click(function() {
					$("#idbtn").attr("aria-selected","true")
					$("#passbtn").attr("aria-selected","false")
					$("#idbtn").attr("class", "nav-link active")
					$("#passbtn").attr("class", "nav-link")
					$("#passfind").attr("class","tab-pane fade")
					$("#idfind").attr("class","tab-pane fade active show")
				})
				$("#passbtn").click(function() {
					$("#passbtn").attr("aria-selected","true")
					$("#idbtn").attr("aria-selected","false")
					$("#idbtn").attr("class", "nav-link")
					$("#passbtn").attr("class", "nav-link active")
					$("#idfind").attr("class","tab-pane fade")
					$("#passfind").attr("class","tab-pane fade active show")
				})
			})
		</script>
	</head>
	
	<body>
	
	  <main>
	  	<div class="card">
	            <div class="card-body">
	              <h5 class="card-title">아이디 / 비밀번호 찾기</h5>
	
	              <!-- Default Tabs -->
	              <ul class="nav nav-tabs" id="myTab" role="tablist">
	                <li class="nav-item" role="presentation">
	                  <button class="nav-link active" id="idbtn" data-bs-toggle="tab" data-bs-target="#idfind" type="button" role="tab" aria-controls="idfind" aria-selected="true">아이디 찾기</button>
	                </li>
	                <li class="nav-item" role="presentation">
	                  <button class="nav-link" id="passbtn" data-bs-toggle="tab" data-bs-target="#passfind" type="button" role="tab" aria-controls="passfind" aria-selected="false" tabindex="-1">비밀번호 찾기</button>
	                </li>
	              </ul>
	              <div class="tab-content pt-2" id="myTabContent">
	                <!--*************************** 아이디 찾기 *************************************-->
	                <div class="tab-pane fade active show" id="idfind" role="tabpanel" aria-labelledby="home-tab">
		              <h6 class="card-title pb-0 fs-4 mt-3">등록된 정보로 아이디 찾기</h6>
	                  <form action="/evweb/login/findId.do" method="post" class="row g-3 needs-validation" novalidate>
	
	                    <div class="col-12">
	                      <label for="yourUsername" class="form-label">이름</label>
	                      <div class="input-group has-validation">
	                        <input type="text" name="name" class="form-control" id="yourUsername" minlength="2"required>
	                        <div class="invalid-feedback">이름을 입력하세요.</div>
	                      </div>
	                    </div>
	
	                    <div class="col-12">
	                      <label for="yourPhoneNo" class="form-label">전화 번호</label>
	                      <input type="text" name="phone_no" class="form-control" id="yourPhoneNo" minlength="2" required>
	                      <div class="invalid-feedback">가입에 사용한 전화번호를 입력하세요.</div>
	                    </div>
						<div class="col-12">
	                      <div class="form-check">
	                      <br/>
	                      </div>
	                    </div>
	                    <div class="col-12">
	                      <button class="btn btn-primary w-100" type="submit">아이디 찾기</button>
	                    </div>
	                  </form>
	                	
	                </div>
	                    <!--*************************** 비밀번호 찾기 *************************************-->
	                <div class="tab-pane fade" id="passfind" role="tabpanel" aria-labelledby="profile-tab">
	                	<h6 class="card-title pb-0 fs-4 mt-3">비밀번호 찾기</h6>
		                  <form action="/evweb/login/findPass.do" method="post" class="row g-3 needs-validation" novalidate>
							<div class="col-12">
	                   		   	<label for="yourUsername" class="form-label">아이디</label>
	                   				<div class="input-group has-validation">
	                      	  		<input type="text" name="customer_id" class="form-control" id="yourUsername" minlength="2" required>
	                        			<div class="invalid-feedback">아이디를 입력하세요.</div>
	                      			</div>
	                    	</div>
							<div class="col-12">
								<label for="yourPhoneNo" class="form-label">전화 번호</label> 
									<div class="input-group has-validation">
									<input	type="text" name="phone_no" class="form-control" id="yourPhoneNo" minlength="2" required>
										<div class="invalid-feedback">가입에 사용한 전화번호를 입력하세요.</div>
									</div>
							</div>
							<div class="col-12">
								<label for="yourPsQuestion" class="form-label">질문</label>
								<div class="input-group has-validation">
									<input type="text" name="ps_question" class="form-control" id="yourPsQuestion" minlength="2" required>
										<div class="invalid-feedback">비밀번호 찾기 질문을 입력하세요.</div>
								</div>
							</div>
							<div class="col-12">
								<label for="yourPsAnswer" class="form-label">답변</label>
								<div class="input-group has-validation">
									<input type="text" name="ps_answer" class="form-control" id="yourPsAnswer" minlength="2" required>
										<div class="invalid-feedback">비밀번호 찾기 답변을 입력하세요.</div>
								</div>
							</div>
							<div class="col-12">
	                      <div class="form-check">
	                      <br/>
	                      </div>
	                    </div>
							<div class="col-12">
								<button class="btn btn-primary w-100" type="submit">비밀번호 찾기</button>
							</div>
							</form>
	                </div>
	                <div align="right"  class="mt-3">
	               		 <button class="btn btn-secondary " onclick="window.close()">닫기</button>
	                </div>
	              </div>
	
	            </div>
	          </div>
	  
	  </main>
	</body>
</html>