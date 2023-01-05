<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>CHARGE STATION</title>
	    <script type="text/javascript">
	    	var page = 2;
	    </script>
    </head>
    <body>
        <aside id="sidebar" class="sidebar">
            <h2>
            	<span>충전소</span>
            </h2>
            <ul class="sidebar-nav" id="sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
                        <i class="bi bi-grid"></i>
                        <span>충전소 정보 메인</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
                        <i class="bi bi-grid"></i>
                        <span>충전 차트</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/weather/getData.do">
                        <i class="bi bi-grid"></i>
                        <span>날씨</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#">
                        <i class="bi bi-grid"></i>
                        <span>통합보고서</span>
                    </a>
                </li>
            </ul>
        </aside>
    </body>
</html>