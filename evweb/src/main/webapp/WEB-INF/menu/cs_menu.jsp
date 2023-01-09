<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>SERVICE</title>
	    <script type="text/javascript">
	    	var page = 3;
	    </script>
    </head>
    <body>
        <aside id="sidebar" class="sidebar">
            <h2>
            	<span>고객센터</span>
            </h2>
            <ul class="sidebar-nav" id="sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/Notice/list.do">
                    <i class="bi bi-grid"></i>
                    <span>공지사항</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/faq/paginglist?pageNo=0">
                    <i class="bi bi-grid"></i>
                    <span>FAQ</span>
                    </a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link collapsed" href="/evweb/service/write.do">
                    <i class="bi bi-journal-text"></i>
                    <span>1:1 문의하기</span>
                    </a>
                </li>
            </ul>
        </aside>
    </body>
</html>