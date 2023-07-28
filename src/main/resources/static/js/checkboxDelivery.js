	function changeDelivery(){
		var url = "delivery";	//컨트롤러로 보내고자 하는 URL
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for(var i = 0 ; i<list.length ; i++){
			if(list[i].checked){	//선택되어있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		
		// 체크된 값이 없는 경우 예외 처리
		    if (valueArr.length === 0) {
		        alert("선택된 항목이 없습니다.");
		        return;
		    }
		
		    alert("배송 상태로 변경하시겠습니까?");
		    $.ajax({
		        url : url,
		        type : 'post',
		        traditional :  true,
		        data : {
		            partCheck : valueArr // 보내고자 하는 data 변수 설정 valueArr를 partCheck로 보냄
		        },
		        success : function(jdata){
		            if (jdata === 1){
		                alert("변경되었습니다.");
		                location.replace("adminorderlist");  // list로 페이지 새로고침
		            }
		        }
		    });
		}