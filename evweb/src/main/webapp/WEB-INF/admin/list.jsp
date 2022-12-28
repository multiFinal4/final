<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="card-body">
              <h5 class="card-title">회원 관리</h5>

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
                    <th scope="col">수정</th>
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
	                    		<td><button class="btn btn-primary rounded-pill" onclick="location.href='#'">수정</button></td>
	                    		<td><button class="btn btn-primary rounded-pill" onclick="location.href='#'">삭제</button></td>
	                  	</tr>
	                 	
                 	</c:forEach>
                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
</body>
</html>