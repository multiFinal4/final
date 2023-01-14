<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 
  <title>날짜별로 통계 선 차트</title>
</head>

<body>

  <div class="card info-card sales-card">
						<div class="card-header">
							<h5 class="card-title">주간 충전량</h5>
							<h1></h1>
						</div>
    <div class="card-body">
      <div id="line-chart" style="height: 300px;"></div>
    </div>
  </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
<script>
/*
 * LINE CHART
 * ----------
 */
//LINE randomly generated data
<%List<String> amountlist =  (ArrayList<String>)request.getAttribute("amountlist"); 
  List<String> datelist =  (ArrayList<String>)request.getAttribute("datelist"); %>

const data = [];
const tick = [];
<%for(int i=0;i<amountlist.size();i++){%>
	data.push([<%=i+1%>,<%=amountlist.get(i)%>])
<%}%>

tick.push([1,'<%=datelist.get(0)%>(일)']);
tick.push([2,'<%=datelist.get(1)%>(월)']);
tick.push([3,'<%=datelist.get(2)%>(화)']);
tick.push([4,'<%=datelist.get(3)%>(수)']);
tick.push([5,'<%=datelist.get(4)%>(목)']);
tick.push([6,'<%=datelist.get(5)%>(금)']);
tick.push([7,'<%=datelist.get(6)%>(토)']);

const dataset = {
  label: "충전량",
  data : data,
  color: '#f37321'
}

$.plot('#line-chart', [dataset], {
  grid : {
    hoverable  : true,
    borderColor: '#f3f3f3',
    borderWidth: 1,
    tickColor  : '#f3f3f3',
  },
  series: {
    shadowSize: 0,
    lines: {
      show: true
    },
    points : {
      radius: 5,
      show: true
    }
  },
  lines : {
    fill : true,
    color: '#f37321'
  },
  yaxis : {
    show: true,
    min: 0
  },
  xaxis : {
    show: true,
    ticks: tick
  }
});

//Initialize tooltip on hover
$('<div class="tooltip-inner" id="line-chart-tooltip"></div>').css({
  position: 'absolute',
  display : 'none',
  opacity : 0.8
}).appendTo('body')
$('#line-chart').bind('plothover', function (event, pos, item) {

  if (item) {
    const y = item.datapoint[1].toFixed(0)
    $('#line-chart-tooltip').html(item.series.label + ' : ' + y + 'kWh')
      .css({
        top : item.pageY + 50,
        left: item.pageX + 50
      })
      .fadeIn(200)
  } else {
    $('#line-chart-tooltip').hide()
  }

})
/* END LINE CHART */
</script>
</body>
</html>