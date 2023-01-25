<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Login</title>
<link rel="icon" href="/evweb/images/favicon/favicon.ico" type="image/x-icon" sizes="16x16">
<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<!-- Vendor CSS Files -->
<link href="/evweb/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/evweb/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/evweb/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/evweb/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/evweb/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/evweb/css/style.css" rel="stylesheet">
<link href="/evweb/css/font.css" rel="stylesheet">
<link href="/evweb/css/common.css" rel="stylesheet">
<script type="text/javascript">
	
</script>
</head>

<body>

	<main>
		<div class="container">

			<section
				class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
							<div class="d-flex justify-content-center py-4">
								<a href="index.do" class="logo d-flex align-items-center w-auto">
									<span class="d-none d-lg-block" style="font-family: 'jejudoldam'; color: #333333; font-size: 40px">차지모양</span>
								</a>
							</div>
							<!-- End Logo -->
							<div class="card mb-3">
								<div class="card-body">
									<div class="pt-4 pb-2">
										<h2 class="card-title text-center pb-0 fs-4" style=" color: #333333;font-size: 25px">LOGIN</h2>
										<p class="text-center small">반갑습니다. <b>차지모양</b>입니다.</p>
									</div>
									<form action="/evweb/login.do" method="post" class="row g-3 needs-validation" novalidate>
										<div class="col-12 mb-2">
											<label for="yourUsername" class="form-label">아이디</label>
											<div class="input-group has-validation">
												<input type="text" name="id" class="form-control"
													id="yourUsername" required>
												<div class="invalid-feedback">아이디를 입력하세요.</div>
											</div>
										</div>
										<div class="col-12 mb-2">
											<label for="yourPassword" class="form-label">비밀번호</label> <input
												type="password" name="pass" class="form-control"
												id="yourPassword" required>
											<div class="invalid-feedback">비밀번호를 입력하세요.</div>
										</div>
										<div class="col-12 mb-3" align="right">
											<p class="small mb-0">
												<a href="" onclick="window.open('/evweb/idpassfind','아이디/비밀번호 찾기' ,'width = 500px, height=600px, top=300px, left=300px, scrollbars=yes')">아이디
													찾기, 비밀번호 찾기
												</a>
											</p>
										</div>
										<div class="col-12">
											<button class="btn w-100 mb-2" style="background-color: #f37321; color: #fff;"
												type="submit">로그인</button>
											<!-- 카카오 로그인 자바스크립트 키 : bb8e4e9dda670b70895b6b70b420787b -->
											<a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=ce8affbe0709e40494b6d8ad31a694eb&redirect_uri=http://chargemoyang.com/evweb/kakao&response_type=code">
												<img alt="카카오 로그인 버튼"
												src="/evweb/images/kakao_login_medium_wide.png">
											</a>
											
											
											<!-- <a id="kakao-login-btn"></a>
											<button class="api-btn" onclick="unlinkApp()">앱 탈퇴하기</button>
											<div id="result"></div>

											<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
											<script>
											Kakao.init('bb8e4e9dda670b70895b6b70b420787b'); // 사용하려는 앱의 JavaScript 키 입력
											// SDK 초기화 여부를 판단합니다.
											console.log(Kakao.isInitialized());
											</script>
											<script type="text/javascript">
											  function unlinkApp() {
											    Kakao.API.request({
											      url: '/v1/user/unlink',
											      success: function(res) {
											        alert('success: ' + JSON.stringify(res))
											      },
											      fail: function(err) {
											        alert('fail: ' + JSON.stringify(err))
											      },
											    })
											  }
											</script>
											<script type="text/javascript">
											function kakaoLogin() {
											    Kakao.Auth.login({
											      success: function (response) {
											        Kakao.API.request({
											          url: '/v2/user/me',
											          success: function (response) {
											        	  console.log(response)
											          },
											          fail: function (error) {
											            console.log(error)
											          },
											        })
											      },
											      fail: function (error) {
											        console.log(error)
											      },
											    })
											  }
											</script> -->
										</div>
										<div class="col-12">
											<br>
											<p class="small mb-0">
												계정이 없으신가요? <a href="/evweb/customer/register.do">계정 만들기</a>
											</p>
										</div>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main>
</body>

</html>