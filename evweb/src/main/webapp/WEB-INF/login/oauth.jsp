<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<li th:text="|인가코드 = ${code}|">code</li>
	<li th:text="|유효토큰 = ${access_token}|">code</li>
	<li th:text="|사용자정보 = ${userInfo}|">code</li>
	<li th:text="|동의정보 = ${agreementInfo}|">code</li>
	<a
		href="https://kauth.kakao.com/oauth/logout?client_id=ce8affbe0709e40494b6d8ad31a694eb&
		logout_redirect_uri=http://localhost:8088/evweb/index">로그아웃1</a>

</body>
</html>