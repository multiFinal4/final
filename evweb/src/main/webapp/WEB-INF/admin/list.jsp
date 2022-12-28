<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<style type="text/css">

.search-bar {
    top: 50px;
    left: 0;
    right: 0;
    box-shadow: 0px 0px 15px 0px rgba(1, 41, 112, 0.1);
    background: white;
    z-index: 9999;
    transition: 0.3s;
    width: 30%;
  }
.search-bar-show {
    top: 60px;
    visibility: visible;
    opacity: 1;
  }
}

.search-form {
  width: 30%;
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
</head>
<body>
<div class="card-body">
              <h2 class="card-title">회원 관리</h2>
 
		<div class="search-bar " >
			<form class="search-form d-flex align-items-center  " method="POST"
				action="#">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
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