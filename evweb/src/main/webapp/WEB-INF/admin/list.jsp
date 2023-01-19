<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Insert title here</title>
<script type="text/javascript">
	var type = "${type}"
	var pageNo = "${pageNo}";
	var endPage = "${endPage}"
	$(document).ready(function() {
		$("#type").val(type).attr("selected","selected")
		$("#type").change(function(){
			location.href="/evweb/manager/list.do?type="+encodeURI($(this).val())+"&pageNo=1&name="; 
		});
		console.log(endPage)
		console.log(endPage-pageNo)
		console.log(10-Number(endPage)+Number(pageNo))
		if(endPage<=10){
			$(".page-item").eq(pageNo).addClass("active");
		}else if (pageNo<=6) {
			$(".page-item").eq(pageNo).addClass("active");
		}else if ((Number(pageNo)+4)>endPage) {
			$(".page-item").eq(10-Number(endPage)+Number(pageNo)).addClass("active");
		}else{
			$(".page-item").eq(6).addClass("active");
		}
	})
</script>

</head>
<body>
<div class="row">
              <h2 class="pagetitle">회원 관리</h2>
 			<div class="col-lg-12 stationWrap">
 				<div class="search-bar d-flex">
					<form method="get" action="/evweb/manager/list.do" class="form-inline cateSelect">
						<select name="type"  id="type" class="form-control">
								<option value="all" selected>전체</option>
								<option value="일반 사용자">일반 사용자</option>
								<option value="사이트 관리자">사이트 관리자</option>
								<option value="충전소 관리자">충전소 관리자</option>
						</select>
					<div class = "search-form d-flex align-items-center">
						<input type="text" name="name" placeholder="Search" title="Enter search keyword">
						<input type="hidden" name="pageNo" value = "1" >
						<button type="submit" title="Search"><i class="bi bi-search"></i></button>
					</div>
					</form>
			    </div>
              <table class="table table-hover table-striped">
                <thead>
                  <tr>
                    <th scope="col" style="width: 9%">이름</th>
                    <th scope="col" style="width: 15%">연락처</th>
                    <th scope="col" style="width: 15%">주소</th>
                    <th scope="col" style="width: 15%">이메일</th>
                    <th scope="col" style="width: 15%">계정상태</th>
                    <th scope="col" style="width: 15%">구분</th>
                    <th scope="col" style="width: 8%">상세</th>
                    <th scope="col" style="width: 8%">퇴사/탈퇴처리</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="managerlist" items="${managerlistPage}">
	                  	<tr>
	                  	 	 <th scope="row">${managerlist.manager_name}</th>
	                    		<td>${managerlist.phone_no}</td>
	                    		<td>${managerlist.addr}</td>
	                    		<td>${managerlist.email}</td>
	                    		<td>${managerlist.state}</td>
	                    		<td>${managerlist.type}</td>
	                    		<td><button class="btn btn-primary rounded-pill" style = "line-height: 1.0 " onclick="location.href='/evweb/manager/read.do?manager_id=${managerlist.manager_id}&read=READ'">상세</button></td>
	                    		<td><button class="btn btn-primary rounded-pill" style = "line-height: 1.0 " onclick="location.href='/evweb/manager/delete.do?manager_id=${managerlist.manager_id}'">퇴사</button></td>
	                  	</tr>
                 	</c:forEach>
                 	<c:forEach var="customerlist" items="${customerlistPage}">
	                  	<tr>
	                  	 	 <th scope="row">${customerlist.name}</th>
	                    		<td>${customerlist.phone_no}</td>
	                    		<td>${customerlist.customer_addr}</td>
	                    		<td>${customerlist.email}</td>
	                    		<td>${customerlist.state}</td>
	                    		<td>일반 사용자</td>
	                    		<td><button class="btn btn-primary rounded-pill" style = "line-height: 1.0 " onclick="location.href='/evweb/manager/customerRead.do?customer_id=${customerlist.customer_id}&read=READ'">상세</button></td>
	                    		<td><button class="btn btn-primary rounded-pill" style = "line-height: 1.0 " onclick="location.href='/evweb/manager/delete.do?customer_id=${customerlist.customer_id}'">탈퇴</button></td>
	                  	</tr>
                 	</c:forEach>
                </tbody>
              </table>
            </div>
            <div class="text-right col-sm-12" style=" padding-right: 0;">
					<ul class="pagination" style="justify-content: center;">
							<li class="page-item">
							<c:if test="${pageNo!=1}">
							  <a class="page-link" href="/evweb/manager/list.do?type=${type}&pageNo=${pageNo-1}&name=${name}" tabindex="-1" aria-disabled="true"><</a>
							</c:if>
							</li>
							<c:choose>
								<c:when test="${endPage<=10}">
				                	<c:forEach var="page" begin="1" end="${endPage}" step="1" varStatus="status">
										<li class="page-item"><a class="page-link" href="/evweb/manager/list.do?type=${type}&pageNo=${status.index}&name=${name}">${status.index}</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${pageNo<=5}">
											<c:forEach var="page" begin="1" end="10" step="1" varStatus="status">
												<li class="page-item"><a class="page-link" href="/evweb/manager/list.do?type=${type}&pageNo=${status.index}&name=${name}">${status.index}</a></li>
											</c:forEach>
										</c:when>
										<c:when test="${(pageNo+4)>=endPage}">
											<c:forEach var="page" begin="${endPage-9}" end="${endPage}" step="1" varStatus="status">
												<li class="page-item"><a class="page-link" href="/evweb/manager/list.do?type=${type}&pageNo=${status.index}&name=${name}">${status.index}</a></li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="page" begin="${pageNo-5}" end="${pageNo+4}" step="1" varStatus="status">
												<li class="page-item"><a class="page-link" href="/evweb/manager/list.do?type=${type}&pageNo=${status.index}&name=${name}">${status.index}</a></li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
							
						
							<c:if test="${pageNo!=endPage}">
							<li class="page-item">
							  <a class="page-link" href="/evweb/manager/list.do?type=${type}&pageNo=${pageNo+1}&name=${name}">></a>
							</li>
							</c:if>
					</ul>
			</div>
		</div>
</body>
</html>