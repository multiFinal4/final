<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>ADMIN</title>
	    <script type="text/javascript">
	    	var page = 5;
	    </script>
    </head>
    <body>
        <aside id="sidebar" class="sidebar">
            <h2>
            	<span>관리자 페이지</span>
            </h2>
            <ul class="sidebar-nav" id="sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/admin/station/list?category=all&pageNo=1">
	                    <i class="bi bi-grid"></i>
	                    <span>충전소 관리</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
                    <i class="bi bi-person"></i>
                    <span>충전소별 담당 관리자 설정</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/service/boardListPaging.do">
                    <i class="bi bi-journal-text"></i>
                    <span>고객센터 문의사항 확인</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/manager/register.do">
                    <i class="bi bi-card-list"></i>
                    <span>관리자 등록</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/manager/list.do?type=all&pageNo=1&name=">
                    <i class="bi bi-card-list"></i>
                    <span>회원 관리</span>
                    </a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/weather/getWeatherData.do">
                    <i class="bi bi-card-list"></i>
                    <span>날씨 데이터 업데이트</span>
                    </a>
                </li>
            </ul>
        </aside>
    </body>
</html>