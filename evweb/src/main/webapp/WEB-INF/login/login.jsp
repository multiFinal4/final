<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title> Login </title>
  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/evweb/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/evweb/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/evweb/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/evweb/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/evweb/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/evweb/css/style.css" rel="stylesheet">
	<script type="text/javascript">
	
	</script>
</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.do" class="logo d-flex align-items-center w-auto">
                  <span class="d-none d-lg-block">충전해조</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h4 class="card-title text-center pb-0 fs-4">Login to Your Account</h4>
                    <p class="text-center small">Enter your ID & password to login</p>
                  </div>

                  <form action="/evweb/login.do" method="post" class="row g-3 needs-validation" novalidate>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">아이디</label>
                      <div class="input-group has-validation">
                        <input type="text" name="id" class="form-control" id="yourUsername" required>
                        <div class="invalid-feedback">아이디를 입력하세요.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">비밀번호</label>
                      <input type="password" name="pass" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">비밀번호를 입력하세요.</div>
                    </div>
                     <div class="col-12" align="right">
                       <p class="small mb-0"><a href="" onclick="window.open('/evweb/idpassfind','아이디/비밀번호 찾기' ,'width = 500px, height=600px, top=300px, left=300px, scrollbars=yes')">아이디 찾기, 비밀번호 찾기</a></p>
                    </div>
					<div class="col-12">
                      <div class="form-check">
                      <br/>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">로그인</button>
                    </div>
                    <div class="col-12">
                       <p class="small mb-0">계정이 없으신가요? <a href="/evweb/customer/register.do">계정 만들기</a></p>
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