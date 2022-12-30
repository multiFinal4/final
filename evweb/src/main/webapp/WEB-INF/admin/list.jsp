<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<style type="text/css">
.form-label {
    margin-bottom: 0.5rem;
}
.form-select {
    display: block;
    padding: 0.375rem 2.25rem 0.375rem 0.75rem;
    -moz-padding-start: calc(0.75rem - 3px);
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    margin-left: 13px;
    background-color: #fff;
    background-image: url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e);
    background-repeat: no-repeat;
    background-position: right 0.75rem center;
    background-size: 16px 12px;
  	border: 1px solid rgba(1, 41, 112, 0.2);
    border-radius: 3px;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}
.search-bar {
    top: 50px;
    left: 0;
    right: 0;
    box-shadow: 0px 0px 15px 0px rgba(1, 41, 112, 0.1);
    background: white;
    z-index: 9999;
    transition: 0.3s;
    width: 40%;
  }
.search-bar-show {
    top: 60px;
    visibility: visible;
    opacity: 1;
  }
}

.search-form {
  width: 50%;
}

.search-form input {
  border: 0;
  font-size: 14px;
  color: #012970;
  border: 1px solid rgba(1, 41, 112, 0.2);
  padding: 7px 38px 7px 8px;
  border-radius: 3px;
  transition: 0.3s;
  width: 100%;
}
.search-form input:focus,
.search-form input:hover {
  outline: none;
  box-shadow: 0 0 10px 0 rgba(1, 41, 112, 0.15);
  border: 1px solid rgba(1, 41, 112, 0.3);
}

.search-form button {
  border: 0;
  padding: 0;
  margin-left: -30px;
  background: none;
}

.search-form button i {
  color: #012970;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
var type = "${type}"
	$(document).ready(function() {
		$("#type").val(type).attr("selected","selected")
		$("#type").change(function(){
			location.href="/evweb/manager/list.do?type="+encodeURI($(this).val()) 
		});
	})
</script>

</head>
<body>
<div class="card-body">
              <h2 class="card-title">회원 관리</h2>
 	<div class= "row">
		<div class="search-bar" >
			<form class="search-form d-flex align-items-center" method="get"
				action="/evweb/manager/search.do">
				<input type="text" name="name" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
				<select class="form-select col-md-4" name="type" id="type">
					<option value="all" selected>전체</option>
					<option value="사용자">일반 사용자</option>
					<option value="사이트 관리자">사이트 관리자</option>
					<option value="충전소 관리자">충전소 관리자</option>
				</select>
			</form>
		</div>
		<div class="col-md-3" style="padding-bottom: 10px">
			<form action="">
				
			</form>
		</div>
	</div>
		<!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">이름</th>
                    <th scope="col">연락처</th>
                    <th scope="col">주소</th>
                    <th scope="col">이메일</th>
                    <th scope="col">계정상태</th>
                    <th scope="col">구분</th>
                    <th scope="col">상세</th>
                    <th scope="col">삭제</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="managerlist" items="${managerlist}">
	                  	<tr>
	                  	 	 <th scope="row">${managerlist.manager_name}</th>
	                    		<td>${managerlist.phone_no}</td>
	                    		<td>${managerlist.addr}</td>
	                    		<td>${managerlist.email}</td>
	                    		<td>${managerlist.state}</td>
	                    		<td>${managerlist.type}</td>
	                    		<td><button class="btn btn-primary rounded-pill" onclick="location.href='/evweb/manager/read.do?manager_id=${managerlist.manager_id}&read=READ'">상세</button></td>
	                    		<td><button class="btn btn-primary rounded-pill" onclick="location.href='/evweb/manager/delete.do?manager_id=${managerlist.manager_id}'">삭제</button></td>
	                  	</tr>
	                 	
                 	</c:forEach>
                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
</body>
</html>