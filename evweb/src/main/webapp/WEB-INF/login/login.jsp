<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/evweb/css/login.css" rel="stylesheet">
<style type="text/css">
body{
	position: relative;
	width: 1440px;
	height: 1024px;
	background: #EAF5FC;
	
}
#window{
	position: absolute;
	width: 409px;
	height: 564px;
	left: 55%;
	top: 230px;
	background: #FFFFFF;
	box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.25);
	border-radius: 20px;
}
#login{
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 40px;
	line-height: 48px;
	color: #454545;
}
#id{
	width: 222px;
	height: 52px;
	left: 648px;
	top: 372px;
	background: #F5F5F5;
}
#pass{
	width: 222px;
	height: 52px;
	left: 648px;
	top: 442px;
	background: #F5F5F5;
}

</style>
<title>Insert title here</title>
</head>
<body>


	<div id = "window">
		<div id = "login">LOGIN</div>
		<form name="login_frm" action="/evweb/login/login" method="post">
			<div>
				<div class="form-group col-sm-2">
					<div class="col-sm-3">
						<img src="/evweb/images/loginid.png">
						<input type="text" name="id" id ="id" placeholder="ID"/>
					</div>
				</div>
				<div>
					<img src="/evweb/images/loginpass.png">
					<input type="text" name="pass" id ="pass" placeholder="Passward"/>
				</div>
				<div>
					<input type="submit" value="가입하기" class="btn btn-success"/>
				</div>
			</div>
			
			
			
		</form>
	
	
	
	</div>
	
	

</body>
</html>