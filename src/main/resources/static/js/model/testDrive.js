 $(document).ready(function(){
 	
 	/* ========================= 첫번째 이용동의 영역 클릭시 모달창 오픈 ==========================*/
 	$("#check1,#flexCheckDefault1").on("click",function(){
		 $("#modal1").modal("show");
	 })
	/* ========================= 두번째 이용동의 영역 클릭시 모달창 오픈, 첫번째 미동의시 경고창 ==========================*/
	$("#check2,#flexCheckDefault2").on("click",function(){
		let checkbox = document.getElementById("flexCheckDefault1");
		 if(checkbox.checked === false){
			 alert("첫번째 필수항목을 동의해주세요")
			 return false;
		 }else{
		 $("#modal2").modal("show");
			 return false;
		 }
	 })

	 	/* ========================= 첫번째 동의서 버튼 클릭시 체크 되게 ==========================*/	 
 	$("#agree-btn1").on("click",function(){
		let checkbox = document.getElementById("flexCheckDefault1");
		 checkbox.checked = true;
		 $("#modal1").modal("hide");
	 })

	 	/* =============== 두번째 동의서 버튼 클릭시 체크, 첫번째 아코디언 열기, 스크롤 이동 ==================*/	 	 
 	$("#agree-btn2").on("click",function(){
		let checkbox = document.getElementById("flexCheckDefault2");
		let offset = $("#headingThree").offset();
		 checkbox.checked = true;
		 $("#modal2").modal("hide");
		 $("#collapseOne").addClass("show");
		 $('html').animate({scrollTop : offset.top},1);
  	});
	 
	$("#headingOne").on("click",function(){
		let checkbox1 = document.getElementById("flexCheckDefault1");
		let checkbox2 = document.getElementById("flexCheckDefault2");
		if(checkbox1.checked === false || checkbox2.checked === false){
			alert("필수항목을 동의해주세요");
			$("#headingOneBtn").attr("data-bs-toggle","");
			return false;
		}else{
			$("#headingOneBtn").attr("data-bs-toggle","collapse");
		}
	}); 
	 
	$("#headingTwo").on("click",function(){
		let checkbox1 = document.getElementById("flexCheckDefault1");
		let checkbox2 = document.getElementById("flexCheckDefault2");
		if(checkbox1.checked === false || checkbox2.checked === false){
			alert("필수항목을 동의해주세요");
			$("#headingTwoBtn").attr("data-bs-toggle","");
			return false;
		}else{
			$("#headingTwoBtn").attr("data-bs-toggle","collapse");
		}
	});  
	
	$("#headingThree").on("click",function(){
		let checkbox1 = document.getElementById("flexCheckDefault1");
		let checkbox2 = document.getElementById("flexCheckDefault2");
		if(checkbox1.checked === false || checkbox2.checked === false){
			alert("필수항목을 동의해주세요");
			$("#headingThreeBtn").attr("data-bs-toggle","");
			return false;
		}else{
			$("#headingThreeBtn").attr("data-bs-toggle","collapse");
		}
	});  
	
	$("select").change(function() {
		var selectModel = $("#selectModel").val();
			if(selectModel === "") {
	     		$("#card-img1").attr("src", "../images/model/vs_logo.jpg");
	     	}else if(selectModel === "AVANTE") {
	      		$("#card-img1").attr("src", "https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F5662_000_9%2F20230313103619999_CT56XDZ2R.png%2F20230313102856_v.png%3Ftype%3Dm1500");
		    }else if(selectModel === "SONATA"){
		      	$("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F5662_000_9%2F20230503101116687_KBFEQSEHR.png%2F20230503100646_X.png%3Ftype%3Dm1500")
		    }else if(selectModel === "GRANDEUR"){
		     	$("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_8/20221114125621183_IOQGN0BH1.png/20221114124905_u.png?type=m1500")
		    }else if(selectModel === "PALISADE"){
		      	$("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_9/20230602100123286_X619RPAHU.png/20230602094536_k.png?type=m1500")
		    }else if(selectModel === "TUCSON"){
		      	$("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_8/20220713140508604_CLPS0GTFK.png/20220713140232_Z.png?type=m1500")
		    }
	  });
	  
	  
	$("#selectOk").on("click",function(){
		var selectedModel = $("#selectModel").val();
		if(selectedModel === ""){
			alert("모델을 선택해주세요");
			return false;
		}else{
			$("#collapseOne").removeClass("show");
			$("#collapseTwo").addClass("show");
		}
	})
});