<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Map</title>
<script type="text/javascript">
	var page = 1;
</script>
</head>
<body>
	<aside id="sidebar" class="sidebar">
		<div class="card-body">
           <h5 class="card-title">주차</h5>
            <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
               무료주차가능 <br><br>
           <h5 class="card-title">충전방식</h5>
            <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
                급속 <br>
               <input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
               	  완속 <br><br>
           <h5 class="card-title">충전회사</h5>
		<input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
               	  a회사 <br>
               	<input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
               	  b회사 <br>
		<input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
               	  c회사 <br>
               	<input class="form-check-input me-1" type="checkbox" value="" aria-label="...">
               	  d회사 <br>
         </div>
         <div class="dropdown">
		  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		    더보기
		  </button>
		  <div class="dropdown-menu">
		    <a class="dropdown-item" href="#">낮은 가격순</a>
		    <a class="dropdown-item" href="#">높은 가격순</a>
		    <a class="dropdown-item" href="#">인기순</a>
		    <a class="dropdown-item" href="#">이용순</a>
		  </div>
		</div>
	</aside>
</body>
</html>