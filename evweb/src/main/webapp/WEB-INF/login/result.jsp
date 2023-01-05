<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>아이디/비밀번호 찾기</title>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="/evweb/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
.nav-link {
	color : #0d6efd
}
</style>	
<script type="text/javascript"></script>
</head>

<body>

  <main>
  	<div class="card">
            <div class="card-body">
            <c:choose>
            	<c:when test="${state=='id'}">
              		<h5 class="card-title">아이디 찾기</h5>
          	    </c:when>
          	    <c:otherwise>
          	    	<h5 class="card-title">비밀번호 찾기</h5>
          	    </c:otherwise>
            </c:choose>
            
            
              <div class="tab-content pt-2" id="myTabContent">
            <c:choose>
            	<c:when test="${state=='id'&&data!='null'}">
					<div>
						<p>아이디는 ${id}입니다.</p>
					</div>
                </c:when>
                <c:when test="${data=='null'}">
                	<div>
                		<p>해당 정보의 아이디가 없습니다.</p>
                	</div>
                </c:when>
                <c:when test="${pass!=''}">
                 		<p>새로운 비밀번호는 ${pass}입니다.</p>
          	    	    <p>로그인 후 변경 해 주세요</p>
                </c:when>
                   <c:otherwise>
          	    	    <p>해당 아이디의 정보가 없습니다.</p>
          	    	    <p>아이디 및 정보를 다시 확인 해 주세요.</p>
          	    </c:otherwise>
            </c:choose>
                </div>
              </div>

            </div>
  			<div align="right">
               		 <button class="btn btn-secondary " onclick="window.close()">닫기</button>
                </div>
  </main>

</body>

</html>