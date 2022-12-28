<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </head>
    <style>
       
        .sidebar {
            position: fixed;
            top: 60px;
            left: 0;
            bottom: 0;
            width: 300px;
            z-index: 996;
            transition: all 0.3s;
            padding: 20px;
            overflow-y: auto;
            scrollbar-width: thin;
            scrollbar-color: #aab7cf transparent;
            box-shadow: 0px 0px 20px rgba(1, 41, 112, 0.1);
            background-color: #fff;
        }

        @media (max-width: 1199px) {
        .sidebar {
            left: -300px;
        }
        }

        .sidebar::-webkit-scrollbar {
        width: 5px;
        height: 8px;
        background-color: #fff;
        }

        .sidebar::-webkit-scrollbar-thumb {
        background-color: #aab7cf;
        }

        @media (min-width: 1200px) {

        #main,
        #footer {
            margin-left: 300px;
        }
        }

        @media (max-width: 1199px) {
        .toggle-sidebar .sidebar {
            left: 0;
        }
        }

        @media (min-width: 1200px) {

        .toggle-sidebar #main,
        .toggle-sidebar #footer {
            margin-left: 0;
        }

        .toggle-sidebar .sidebar {
            left: -300px;
        }
        }

        .sidebar-nav {
        padding: 0;
        margin: 0;
        list-style: none;
        }

        .sidebar-nav li {
        padding: 0;
        margin: 0;
        list-style: none;
        }

        .sidebar-nav .nav-item {
        margin-bottom: 5px;
        }

        .sidebar-nav .nav-heading {
        font-size: 11px;
        text-transform: uppercase;
        color: #899bbd;
        font-weight: 600;
        margin: 10px 0 5px 15px;
        }

        .sidebar-nav .nav-link {
        display: flex;
        align-items: center;
        font-size: 15px;
        font-weight: 600;
        color: #4154f1;
        transition: 0.3;
        background: #f6f9ff;
        padding: 10px 15px;
        border-radius: 4px;
        }

        .sidebar-nav .nav-link i {
        font-size: 16px;
        margin-right: 10px;
        color: #4154f1;
        }

        .sidebar-nav .nav-link.collapsed {
        color: #012970;
        background: #fff;
        }

        .sidebar-nav .nav-link.collapsed i {
        color: #899bbd;
        }

        .sidebar-nav .nav-link:hover {
        color: #4154f1;
        background: #f6f9ff;
        }

        .sidebar-nav .nav-link:hover i {
        color: #4154f1;
        }

        .sidebar-nav .nav-link .bi-chevron-down {
        margin-right: 0;
        transition: transform 0.2s ease-in-out;
        }

        .sidebar-nav .nav-link:not(.collapsed) .bi-chevron-down {
        transform: rotate(180deg);
        }

        .sidebar-nav .nav-content {
        padding: 5px 0 0 0;
        margin: 0;
        list-style: none;
        }

        .sidebar-nav .nav-content a {
        display: flex;
        align-items: center;
        font-size: 14px;
        font-weight: 600;
        color: #012970;
        transition: 0.3;
        padding: 10px 0 10px 40px;
        transition: 0.3s;
        }

        .sidebar-nav .nav-content a i {
        font-size: 6px;
        margin-right: 8px;
        line-height: 0;
        border-radius: 50%;
        }

        .sidebar-nav .nav-content a:hover,
        .sidebar-nav .nav-content a.active {
        color: #4154f1;
        }

        .sidebar-nav .nav-content a.active i {
        background-color: #4154f1;
        }
    </style>
    <body>
        <aside id="sidebar" class="sidebar">
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
                    <a class="nav-link collapsed" href="#">
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