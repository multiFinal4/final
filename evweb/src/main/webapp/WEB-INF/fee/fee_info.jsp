<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/evweb/css/fee.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>요금정보</title>
<script type="text/javascript">
$(function(){

    var link = $('#navbarbar a.dot');
    link.on('click',function(e){                                 
        
        //href 속성을 통해, section id 타겟을 잡음
        var target = $($(this).attr('href'));                     
        
        //target section의 좌표를 통해 꼭대기로 이동
        $('html, body').animate({
            scrollTop: target.offset().top -200  //가고싶은 위치
        },600);      //걸리는 시간

        
        //active 클래스 부여
        $(this).addClass('active');

        //앵커를 통해 이동할때, URL에 #id가 붙지 않도록 함.
        e.preventDefault();
    });
    
    $(window).on('scroll',function(){
        findPosition();
    });

    function findPosition(){
        $('section').each(function(){
            if( ($(this).offset().top - $(window).scrollTop() ) < 400){
                link.removeClass('active');
                $('#navbarbar').find('[data-scroll="'+ $(this).attr('id') +'"]').addClass('active');
            }
        });
    }

    findPosition();
});
</script>
</head>
<body>
	<!-- Start Nav Section -->
	<nav id="navbarbar" class="navbarbar">
		<ul class="nav-menu">
			<li><a data-scroll="home" href="#home" class="dot active"> <span>환경부</span>
			</a></li>
			<li><a data-scroll="one" href="#one" class="dot"> <span>한국EV충전서비스센터</span>
			</a></li>
			<li><a data-scroll="two" href="#two" class="dot"> <span>보타리에너지</span>
			</a></li>
			<li><a data-scroll="three" href="#three" class="dot"> <span>블루네트웍스</span>
			</a></li>
			<li><a data-scroll="four" href="#four" class="dot"> <span>씨어스</span>
			</a></li>
			<li><a data-scroll="five" href="#five" class="dot"> <span>대영채비 채비인프라 멤버십</span>
			</a></li>
		</ul>
	</nav>
	<br>
	<br>
	<!-- End Nav Section -->
	<section id="home">
		<div class="title">충전 요금 정보</div>
		<hr>
		<br>
		<br>
		<br>
		<div class="feeInner">
			<h4 class="feeTitle">• 환경부</h4>
			<br>
			<div class="feeTblWrap">
				<table class="table table-striped">
					<tbody>
						<tr>
							<th scope="col" style="width: 33%">완속</th>
							<th scope="col" style="width: 33%">급속(50kW)</th>
							<th scope="col" style="width: 33%">초급속(100kW 이상)</th>
						</tr>
						<tr>
							<td>324.4원</td>
							<td>324.4원</td>
							<td>347.2원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="feeBottom">
				<p>※ 거의 모든 충전사업자에 대해 동일 요금 적용</p>
				<br>
				<span class="linkWrap"> <a target="_blank" class="linkText"
					href="https://www.ev.or.kr/portal/board/notice/"> 관련 정보 <span
						class="arrow"><i class="bi bi-arrow-right-short"></i></span>
				</a>
				</span>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section id="one">
		<div class="feeInner">
			<h4 class="feeTitle">• 한국EV충전서비스센터</h4>
			<br>
			<div class="feeTblWrap">
				<table class="table table-striped">
					<tbody>
						<tr>
							<th scope="col" style="width: 25%">완속</th>
							<th scope="col" style="width: 25%">급속(50kW)</th>
							<th scope="col" style="width: 25%">초급속(100kW 이상)</th>
							<th scope="col" style="width: 25%">비회원</th>
						</tr>
						<tr>
							<td>286.7</td>
							<td>324.4</td>
							<td>347.2원</td>
							<td>430원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="feeBottom">
				<br>
				<span class="linkWrap"> <a target="_blank" class="linkText"
					href="http://evsvc.co.kr/sub/index.php"> 관련 정보 <span
						class="arrow"><i class="bi bi-arrow-right-short"></i></span>
				</a>
				</span>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section id="two">
		<div class="feeInner">
			<h4 class="feeTitle">• 보타리에너지</h4>
			<br>
			<div class="feeTblWrap">
				<table class="table table-striped">
					<tbody>
						<tr>
							<th scope="col" style="width: 50%">기본</th>
							<th scope="col" style="width: 50%">비회원</th>
						</tr>
						<tr>
							<td>255.7원</td>
							<td>300원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="feeBottom">
				<p>※ 조이이브이 멤버십 결제 시 240원</p>
				<br>
				<span class="linkWrap"> <a target="_blank" class="linkText"
					href="https://botari.imweb.me/Notice/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=6023059&t=board"> 관련 정보 <span
						class="arrow"><i class="bi bi-arrow-right-short"></i></span>
				</a>
				</span>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section id="three">
		<div class="feeInner">
			<h4 class="feeTitle">• 블루네트웍스</h4>
			<br>
			<div class="feeTblWrap">
				<table class="table table-striped">
					<tbody>
						<tr>
							<th scope="col" style="width: 33%">완속</th>
							<th scope="col" style="width: 33%">급속(50kW)</th>
							<th scope="col" style="width: 33%">초급속(100kW 이상)</th>
						</tr>
						<tr>
							<td>324.4</td>
							<td>324.4</td>
							<td>347.2원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="feeBottom">
				<br>
				<span class="linkWrap"> <a target="_blank" class="linkText"
					href="http://kblue.co.kr/home/main.php"> 관련 정보 <span
						class="arrow"><i class="bi bi-arrow-right-short"></i></span>
				</a>
				</span>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section id="four">
		<div class="feeInner">
			<h4 class="feeTitle">• 씨어스</h4>
			<br>
			<div class="feeTblWrap">
				<table class="table table-striped">
					<tbody>
						<tr>
							<th colspan="2">완속 회원</th>
						</tr>
						<tr>
							<td>00시~09시 : 157.5원<br /> 09시~10시 : 257.8원<br />
								10시~12시 : 311.0원<br /> 12시~13시 : 257.8원<br /> 13시~17시 : 311원<br />
								17시~23시 : 257.8원<br /> 23시~24시: 157.5원
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="feeBottom">
				<br>
				<span class="linkWrap"> <a target="_blank" class="linkText"
					href="http://www.cus21.co.kr/charging_charge_unit_price_table/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=13299590&t=board"> 관련 정보 <span
						class="arrow"><i class="bi bi-arrow-right-short"></i></span>
				</a>
				</span>
			</div>
		</div>
	</section>
	<br>
	<br>
	<section id="five">
		<div class="feeInner">
			<h4 class="feeTitle">• 대영채비 채비인프라 멤버십</h4>
			<br>
			<div class="feeTblWrap">
				<table class="table table-striped">
					<tbody>
						<tr>
							<th scope="col" style="width: 33%">완속</th>
							<th scope="col" style="width: 33%">급속(50kW)</th>
							<th scope="col" style="width: 33%">초급속(100kW 이상)</th>
						</tr>
						<tr>
							<td>200원 → 155원*</td>
							<td>320원</td>
							<td>340원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="feeBottom">
				<p>※ 2023년 1월 1일 ~ 종료 시까지 완속 충전 요금 인하 이벤트</p>
				<p>※ 대상 : 채비회원, 충전기: 채비 완속 충전기</p>
				<br>
				<span class="linkWrap"> <a target="_blank" class="linkText"
					href="https://chaevi.com/kr/customer/notice.php?bgu=view&idx=59"> 관련 정보 <span
						class="arrow"><i class="bi bi-arrow-right-short"></i></span>
				</a>
				</span>
			</div>
		</div>
	</section>
	<footer id="footerfee">
    <br>
	</footer>
</body>
</html>





