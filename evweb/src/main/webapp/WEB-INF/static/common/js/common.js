function loading(){
	$(".loading").fadeIn();
}

// 충전소 업데이트				
function ajaxCall() {
	$.ajax({
		url: "/evweb/ajax/updateList",
		type: "POST",
		success: function(){
		    alert("업데이트 완료");
			location.reload();
		},
		error: function(){
		  console.error("insertDiagram.do Error");
		}
	});
}