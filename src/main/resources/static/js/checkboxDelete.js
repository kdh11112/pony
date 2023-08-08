
	function deleteValue(){
		var url = "delete";	//컨트롤러로 보내고자 하는 URL
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for(var i = 0 ; i<list.length ; i++){
			if(list[i].checked){	//선택되어있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0){
			alert("선택된 값이 없습니다.");
		}else{
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : url,
				type : 'post',
				traditional :  true,
				data : {
					valueArr : valueArr //보내고자 하는 data변수 설정
				},
				success : function(jdata){
					if(jdata = 1){
						alert("삭제되었습니다");
						location.replace("questionlist");	//list로 페이지 새로고침
					}else{
						alert("실패하였습니다");
					}
				}
			});
		}
	}
