<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript">
			var mgr_id = "${user.manager_id}";
			var pageNo = "${pageNo}"; 
			var endPage = "${endPage}"; 
			$(document).ready(function() {
				$(".pageitemWrap .page-item").eq(pageNo-1).addClass("active");
				var pageSlice = Math.floor((pageNo-1)/10);
				
				$(".pageitemWrap ul").css({"margin-left":(-340*pageSlice)});
				
				if(pageSlice == Math.floor(endPage/10)){
					$(".pageitemWrap").css({"width":"auto"});
				} 
					
				$(".page-item.next").click(function(){
					location.href="/evweb/manager/stationlist.do?manager_id="+mgr_id+"&pageNo="+((10*(pageSlice+1)+1));
				});

				$(".page-item.prev").click(function(){

					if(pageSlice != 0){
						location.href="/evweb/manager/stationlist.do?manager_id="+mgr_id+"&pageNo="+(10*(pageSlice));
					}
					
				});
				
				$("#updateList").click(function () {
					loading();
					ajaxCall();
				});
				
			});
		</script>
	</head>
	<body>
		<div class="row">
			<h1 class="pagetitle">충전소 리스트</h1>
	        <div class="col-lg-12 stationWrap">
	            <div class="search-bar d-flex" style="justify-content: space-between">
			    </div>
	              <table class="table table-hover table-striped">
	                <thead>
	                  <tr>
	                    <th scope="col" style="width:6%;">번호</th>
	                    <th scope="col" style="width:16%;">충전소 ID</th>
	                    <th scope="col" style="width:18%;">충전소 이름</th>
	                    <th scope="col" style="width:20%;">충전소 회사</th>
	                    <th scope="col" style="width:30%;">주소</th>
	                    <th scope="col" style="width:10%;">담당자</th>
	                  </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="list" items="${stationlistPage}">
							<tr>
							  <th scope="row">${list.rn}</th>
							  <td>${list.station_id}</td>
							  <td><a href="/evweb/manager/station/read.do?stationId=${list.station_id}&state=READ">${list.station_name}</a></td>
							  <td>${list.station_company}</td>
							  <td>${list.addr_do} ${list.addr_sigun}</td>
							  <td>${list.manager_id}</td>
							</tr>
	                  	</c:forEach>
	                </tbody>
	              </table>
	            </div>
	            <br>
				<div class="boardBottom text-center col-sm-12" style="padding-right: 0;">
					<ul class="pagination">
							<li class="page-item prev">
							  <a class="page-link" href="#"><</a>
							</li>
							<li class="pageitemWrap">
								<ul class="pagination">
			                	<c:forEach var="page" begin="1" end="${endPage}" step="1" varStatus="status">
									<li class="page-item"><a class="page-link" href="/evweb/manager/stationlist.do?manager_id=${manager_id}&pageNo=${status.index}">${status.index}</a></li>
								</c:forEach>
								</ul>
							</li>
							<li class="page-item next">
							  <a class="page-link" href="#">></a>
							</li>
					</ul>
				</div>
	      </div>
	      
	      
	</body>
</html>