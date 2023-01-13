<%@page import="com.project.faq.FaqDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="/evweb/css/FAQ.css"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>service</title>
<style type="text/css">
.collapsible-link::before {
  content: '';
  width: 14px;
  height: 2px;
  background: #333;
  position: absolute;
  top: calc(50% - 1px);
  right: 1rem;
  display: block;
  transition: all 0.3s;
}
/* Vertical line */
.collapsible-link::after {
  content: '';
  width: 2px;
  height: 14px;
  background: #333;
  position: absolute;
  top: calc(50% - 7px);
  right: calc(1rem + 6px);
  display: block;
  transition: all 0.3s;
}
.collapsible-link[aria-expanded='true']::after {
  transform: rotate(90deg) translateX(-1px);
}
.collapsible-link[aria-expanded='true']::before {
  transform: rotate(180deg);
}
/* 내용 css바꾸기 */
.card{
  background-color: #e7f1ff;
}
/* 
body {
  background: #86b7fe;
  background: -webkit-linear-gradient(to left, #86b7fe, #ffffff);
  background: linear-gradient(to top, #86b7fe, #ffffff);
  min-height: 100vh;
} */
</style>
</head>
<body>
	<div>
		<h1 class="pagetitle">자주 찾는 도움말</h1>
		<hr>
	</div>
	
	
	<div class="row">
    <div class="col-lg-9 mx-auto">
      <!-- Accordion -->
      <div id="accordionExample" class="accordion shadow">
			<%
		List<FaqDTO> faqlist = (List<FaqDTO>) request.getAttribute("faqlist");
		int size = faqlist.size();
		
		for (int i = 0; i < size; i++) {
				FaqDTO faq = faqlist.get(i);
		%>
        <!-- Accordion item 1 -->
        <div class="card">
          <div id="heading<%=+i%>" class="card-header bg-white shadow-sm border-0">
            <h6 class="mb-0 font-weight-bold"><a href="#" data-toggle="collapse" data-target="#collapse<%=+i%>" aria-expanded="false" aria-controls="collapse<%=+i%>" 
            class="d-block position-relative text-dark text-uppercase collapsible-link py-2"><%=faq.gettitle()%></a></h6>
          </div>
          <div id="collapse<%=+i%>" aria-labelledby="heading<%=+i%>" data-parent="#accordionExample" class="collapse">
            <div class="card-body p-5">
              <p class="font-weight-light m-0"><%=faq.getcontent()%></p>
            </div>
          </div>
        </div>
		<%
			}
		%>
		<table align="center">
					<tr align="center">
				<td colspan="10"><a href="/evweb/faq/paginglist?pageNo=0">1</a>
					<a href="/evweb/faq/paginglist?pageNo=1">2</a> <a
					href="/evweb/faq/paginglist?pageNo=2">3</a> <a
					href="/evweb/faq/paginglist?pageNo=3">4</a></td>
			</tr>
		</table>
		
        <!-- <!-- Accordion item 1
        <div class="card">
          <div id="headingOne" class="card-header bg-white shadow-sm border-0">
            <h6 class="mb-0 font-weight-bold"><a href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne" class="d-block position-relative text-dark text-uppercase collapsible-link py-2">Collapsible Group Item #1</a></h6>
          </div>
          <div id="collapseOne" aria-labelledby="headingOne" data-parent="#accordionExample" class="collapse show">
            <div class="card-body p-5">
              <p class="font-weight-light m-0">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.</p>
            </div>
          </div>
        </div>
        Accordion item 2
        <div class="card">
          <div id="headingTwo" class="card-header bg-white shadow-sm border-0">
            <h6 class="mb-0 font-weight-bold"><a href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="d-block position-relative collapsed text-dark text-uppercase collapsible-link py-2">Collapsible Group Item #2</a></h6>
          </div>
          <div id="collapseTwo" aria-labelledby="headingTwo" data-parent="#accordionExample" class="collapse">
            <div class="card-body p-5">
              <p class="font-weight-light m-0">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.</p>
            </div>
          </div>
        </div>
        Accordion item 3
        <div class="card">
          <div id="headingThree" class="card-header bg-white shadow-sm border-0">
            <h6 class="mb-0 font-weight-bold"><a href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="d-block position-relative collapsed text-dark text-uppercase collapsible-link py-2">Collapsible Group Item #3</a></h6>
          </div>
          <div id="collapseThree" aria-labelledby="headingThree" data-parent="#accordionExample" class="collapse">
            <div class="card-body p-5">
              <p class="font-weight-light m-0">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.</p>
            </div>
          </div>
        </div> -->
      </div>
    </div>
  </div>
	
</body>
</html>