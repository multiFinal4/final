function loading(){
	$(".loading").fadeIn();
}

// 충전소 리스트 업데이트				
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


// 충전소 업데이트(단일)				
function stationUpdate(stationId) {
	$.ajax({
		url: "/evweb/ajax/updateOne",
		type: "get",
		data: {
			"stationId" : stationId
		},
		success: function(){
		    alert("업데이트 완료");
			location.reload();
		},
		error: function(){
		  console.error("오류가 발생했습니다. 잠시 후 다시 시도해 주세요.");
		}
	});
}

// 충전소 담당자 호출
function stationManager(){
	$.ajax({
		url: "/evweb/ajax/managerList",
		type: "get",
		data: {
			"category" : "충전소 관리자"
		},
		success:function(data){
			strHTML = "";
			for (var i = 0; i < data.length; i++) {
				strHTML += "<tr>";
				strHTML += "<td class='mrgId tb-center'>"+ data[i].manager_id + "</td>";
				strHTML += "<td class='mrgName'>"+ data[i].manager_name + "</td>";
				strHTML += "<td class='mrgCom'>"+ data[i].company + "</td>";
				strHTML += "<td class='mrgPosi'>"+ data[i].position + "</td>";
				strHTML += "<td class='tb-center'><buttton type='button' name='"+i+"' class='btn btn-primary rounded-pill selectMgr'>선택</button></td>";
				strHTML += "</tr>";
			}
			$("#mgrList").html(strHTML);
			$(".selectMgr").click(function () {
				mgrInfo = "";
				mrgId = $(this).attr('name');
				mgrInfo += "<input type='text' class='form-control' value='"+data[mrgId].manager_id+"' name='manager_id' id='manager_id'>";
				$("#mgrName").html(mgrInfo);
				$(".alertPop .modal").removeClass("show");
			});
			
		},
		error: function() {
			alert("오류가 발생했습니다. 잠시 후 다시 시도해 주세요.");
		}
	});	
}