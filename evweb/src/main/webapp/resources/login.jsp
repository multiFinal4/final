<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/evweb/css/login.css" rel="stylesheet">
<style type="text/css">
#id{
font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 20px;
line-height: 24px;

color: #B0B0B0;
}
#window{
	
position: absolute;
width: 409px;
height: 564px;
left: 522px;
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
body{
	position: relative;
	width: 1440px;
	height: 1024px;
	background: #EAF5FC;
}
#idwindow{
	width: 222px;
	height: 52px;
	left: 648px;
	top: 372px;
	background: #F5F5F5;
}
#passwindow{
	width: 222px;
	height: 52px;
	left: 648px;
	top: 442px;
	background: #F5F5F5;
}
/* Rectangle 506 */

/* LOGIN */


/* Rectangle 507 */
#idimg{
width: 55px;
height: 52px;
left: 593px;
top: 372px;

background: #D9D9D9;
}

/* Rectangle 509 */
#passimg{
width: 55px;
height: 52px;
left: 593px;
top: 442px;

background: #D9D9D9;
}
#pass{
width: 63px;
height: 26px;
left: 666px;
top: 455px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 20px;
line-height: 24px;

color: #B0B0B0;

}

/* Rectangle 511 */
#loginbtn{
width: 275px;
height: 52px;
left: 592px;
top: 525px;

background: #7AA7D0;
border-radius: 5px;
}

/* Rectangle 512 */
#kakaologin{
width: 275px;
height: 52px;
left: 592px;
top: 687px;

background: #F9DA9D;
border-radius: 5px;
}

/* LOGIN */
#loginbtntext{
width: 62px;
height: 24px;
left: 698px;
top: 539px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 20px;
line-height: 24px;

color: #FFFFFF;
}


/* 카카오 회원가입 */
#kakaotext{
width: 134px;
height: 24px;
left: 662px;
top: 701px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 20px;
line-height: 24px;

color: #000000;
}

/* 일반 회원 가입 */

#nomaltext{
width: 120px;
height: 24px;
left: 671px;
top: 639px;

font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 20px;
line-height: 24px;

color: #000000;
}


/* 카카오 로그인 */
#kakaologinttext{
width: 87px;
height: 20px;
left: 780px;
top: 595px;

font-family: 'Nunito';
font-style: normal;
font-weight: 700;
font-size: 15px;
line-height: 20px;
text-align: center;

color: #000000;
}


/* 아이디/비밀번호 찾기 */
#idpasstext{
width: 133px;
height: 20px;
left: 593px;
top: 595px;

font-family: 'Nunito';
font-style: normal;
font-weight: 700;
font-size: 15px;
line-height: 20px;
text-align: center;

color: #000000;

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
						<img id = "idimg" src="/evweb/images/loginid.png">
						<input type="text" name="id" id ="idwindow" placeholder="ID"/>
					</div>
				</div>
				<div>
					<img id = "passimg" src="/evweb/images/loginpass.png">
					<input type="text" name="pass" id ="passwindow" placeholder="Passward"/>
				</div>
				<div>
					<input type="submit" value="가입하기" class="btn btn-success"/>
				</div>
			</div>
			
			
			
		</form>
	
	
	
	</div>
	
	

</body>
</html>