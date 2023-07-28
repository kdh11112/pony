$(function(){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;
		
		$("#allCheck").click(function(){
			var chk_listArr = $("input[name='RowCheck']");
			for (var i = 0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function(){
			if($("input[name='RowCheck']:checked").length == rowCnt){
				$("#allCheck").prop("checked", true);
			}else{
				$("#allCheck").prop("checked", false);
			}
		});
	});