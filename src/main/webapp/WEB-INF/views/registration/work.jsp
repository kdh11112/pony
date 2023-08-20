<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<title>PONY MOTORS</title>
<style>
.main-panel {
  min-height: 100vh;
  
}
.Search{
	margin-left: 50px;
	display: flex;
	align-items: center;
	justify-content: center;

}
</style>
<!-- JavaScript -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">

<!-- JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/bootstrap-datepicker.ko.min.js"></script>
<%
	int techCount = 10; 
	int partCount = 10;

%>
<script type="text/javascript">

$(function(){
	$("#techId").on("click",function(){
		
		asy();
		$("#technologyNumberId").val("");
	})
	
	$("#techName").on("click",function(){
		
		asy();
		$("#technologyDetailId").val("");
	})
	
	
	$("#partSeachRight").on("click",function(){
		partAsy();
		$("#partNumberId").val("");
	})
	$("#partSeachLeft").on("click",function(){
		partAsy();
		$("#partNameId").val("");
	})
	
	$("input[value='저장']").on("click",function(){
		$(".technologyPriceCell").attr("disabled", false);
		$(".partPriceCell").attr("disabled", false);
		$(".dis").attr("disabled", false);
	  	$("#frm").submit(); 
	  
  	});
	

	
	

	var j = 0;
	var k = 0;
	var count1 = 1;
	var count2 = 1;
	var defaultCount1 = 0;
	var defaultCount2 = 0;
	
	let  total1  = 0;
	let  total2  = 0;
	
	var ppap = 0;
	
	let techData ;
	let partData ; 

	function asy(){
		
		let technologyNumberIdValue = $("#technologyNumberId").val();
		let technologyDetailIdValue = $("#technologyDetailId").val();
		
		
		let query = 'technologyNumberAsy='+technologyNumberIdValue+'&technologyDetailAsy='+technologyDetailIdValue;

		fetch('/reg/work/modal/technology?' + query)
		  .then(response => response.json())
		  .then(data => {
			techData = data;
			
			$(".technologyCountCell").trigger("click");
			
		    let tbody = document.getElementById("technology");
		    
		    tbody.innerHTML = "";
		    
		    for(let i=0; i<data.length; i++){
		    	let row = document.createElement("tr");
		    	row.id = "row"+(i+1);
		    	
		    	
		    	let technologyNumberData = data[i].technologyNumber;
		    	let technologyDetailData = data[i].technologyDetail;
		    	let technologyPriceData = data[i].technologyPrice;
		    	
		    	
		    	let cell = document.createElement("td");
		    	let cell1 = document.createElement("td");
		    	let cell2 = document.createElement("td");
		    	let cell3 = document.createElement("td");
		    	
		    	cell.innerText = technologyNumberData;
		    	cell1.innerText = technologyDetailData;
		    	cell2.innerText = technologyPriceData;
		    	
		    	row.appendChild(cell);
		    	row.appendChild(cell1);
		    	row.appendChild(cell2);
		    	
		    	tbody.appendChild(row);
		    	
		    	(function(index) {
		    	
		    		
		    		  $("#row" + (index + 1)).on("click", function () {
		    	
		    		    fetch('/reg/work/modal/technologyData', {
		    		      method: "POST",
		    		      headers: {
		    		        'Content-Type': 'application/json'
		    		      },
		    		      body: JSON.stringify({
		    		        technologyNumberData: data[index].technologyNumber
		    		      }),
		    		    })
		    		    .then(response => response.json())
		    		    .then(data => {
		    		    	
		    		    	
		    		    	
		    		      ++j;
   	  
		    		      var newRow = document.createElement('tr');
		    		      newRow.id = "trTech"+(j+1);
							
		    		      
		    		      newRow.innerHTML = `
		    		    	<td><button id="technologyDelte" class="btn btn-primary btn-round"> 삭제</button></td>
		    		        <td data-toggle="modal" data-target="#techModal" data-whatever="@mdo"><input type="text" name="technology" id="technologyNumberCell" class="dis" disabled="disabled"/></td>
		    		        <td data-toggle="modal" data-target="#techModal" data-whatever="@mdo"><input type="text" name="technology" id="technologyDetailCell" class="dis" disabled="disabled"/></td>
		    		        <td class="text-center" data-toggle="modal" data-target="#techModal" data-whatever="@mdo"><input type="text" name="technology" id="technologyPriceCell" class="technologyPriceCell" disabled="disabled"/></td>
		    		        <td class="text-right"><input type="text" name="technology" id="technologyCountCell" class="technologyCountCell"/></td>
		    		      `;
		    		      
		    		      let currentTechnology = Number($("#technologyLength").val());
							$("#technologyLength").val(currentTechnology + 1);	
							
		    		     var jj = 0;
		    		      jj += j;
		    		      var mm = technologyDelte.id = "technologyDelte"+(j);
		    		      technologyNumberCell.id = "technologyNumberCell"+(j);
		    		      technologyDetailCell.id = "technologyDetailCell"+(j);
		    		      technologyPriceCell.id = "technologyPriceCell"+(j);
		    		      technologyCountCell.id = "technologyCountCell"+(j);
		    		      
		    		      
		    		      $('#'+mm).on("click",function(){
		    		    	    var row = document.getElementById(mm); // 삭제버튼
		    		    	    row.parentElement.parentElement.remove();

		    		    	}); 

	    		        $("#technologyNumberCell"+(j)).val(data.technologyNumber);
	    		        $("#technologyDetailCell"+(j)).val(data.technologyDetail);
	    		        $("#technologyPriceCell"+(j)).val(data.technologyPrice);
	    		        $("#technologyCountCell"+(j)).val(defaultCount1);
	    		        
	    		        $("#technologyCountCell"+(j)).on("keyup", function(evt) {
	    	            
	    	            var tagId = evt.target.id;
	    	            count1 = parseInt(evt.target.value); 
	    	            //j값을 구하기 위한 숫자 19
	    	            var result1 = tagId.substring(19);
	    	            parseInt($("#technologyPriceCell"+(result1)).val(data.technologyPrice*count1)); 
	    	            total1 += parseInt($("#technologyPriceCell"+(result1)).val())
	    	            $("#totalTechnology").val(total1);
	    		        // ---------------------------------------------------------------
	    		        let tot = 0;
	    		        $(".technologyPriceCell").each(function(index){

	    		        	 let cnt = $(".technologyPriceCell").length;
	    		        	if( index +1 ==   cnt)  return
	    		        	tot +=parseInt($(this).val());
	    		        	
	    		        	
	    		        });
						//테크 합
	    		         $("#totalTechnology").val(tot);
	    		        
	    	            })

		    		      var tbody = document.getElementById('tbodyTech');
		    		      tbody.appendChild(newRow);

		    		      $('#techModal').modal('hide');
		    		    })
		    		    .catch(error => {
		    		      console.error('Error:', error);
		    		    });
		    		  });
		    		})(i);

		    }
		    
			
		    
		  })
		  .catch(error => {
		    console.error('Error:', error);
		  });
		
		
	}

	function partAsy(){

		let partNumberIdValue = $("#partNumberId").val();
		let partNameIdValue = $("#partNameId").val();
		
		
		
		let query = 'partNumberAsy='+partNumberIdValue+'&partNameAsy='+partNameIdValue;

		fetch('/reg/work/modal/part?' + query)
		  .then(response => response.json())
		  .then(data => {
			  partData = data;
			  
			  let tbody = document.getElementById("part");
			    
			  tbody.innerHTML = "";
			  
			    for(let i=0; i<data.length; i++){
			    	let rows = document.createElement("tr");
			    	rows.id = "rows"+(i+1);
			    	
			    	
			    	let partNumberData = data[i].partNumber;
			    	let partNameData = data[i].partName;
			    	let partNoData = data[i].partNo;
			    	let partPriceData = data[i].partPrice;
			    	
			    	
			    	let cell = document.createElement("td");
			    	let cell1 = document.createElement("td");
			    	let cell2 = document.createElement("td");
			    	let cell3 = document.createElement("td");
			    	
			    	cell.innerText = partNumberData;
			    	cell1.innerText = partNameData;
			    	cell2.innerText = partNoData;
			    	cell3.innerText = partPriceData;
			    	
			    	rows.appendChild(cell);
			    	rows.appendChild(cell1);
			    	rows.appendChild(cell2);
			    	rows.appendChild(cell3);
			    	
			    	tbody.appendChild(rows);
			    	
			    	
			    	(function(index) {
			    		  $("#rows" + (index + 1)).on("click", function () {
			    	
			    		    fetch('/reg/work/modal/partData', {
			    		      method: "POST",
			    		      headers: {
			    		        'Content-Type': 'application/json'
			    		      },
			    		      body: JSON.stringify({
			    		        partNumberData: data[index].partNumber
			    		      }),
			    		    })
			    		    .then(response => response.json())
			    		    .then(data => {
			    		    	//console.log(data);
			    		      ++k;
	   	  
			    		      var newRow = document.createElement('tr');
			    		      newRow.id = "trPart"+(k+1);
								
			    		      
			    		      newRow.innerHTML = `
			    		    	<td><button id="partDelte" class="btn btn-primary btn-round"> 삭제</button></td>
		                        <td data-toggle="modal" data-target="#partModal" data-whatever="@mdo"><input type="text" name="part" id="partNumberCell" class="dis" disabled="disabled"/></td>
		                        <td data-toggle="modal" data-target="#partModal" data-whatever="@mdo"><input type="text" name="part" id="partNameCell" class="dis" disabled="disabled"/></td>
			    		        <td class="text-center" data-toggle="modal" data-target="#partModal" data-whatever="@mdo"><input type="text" name="part" id="partPriceCell" class="partPriceCell" disabled="disabled"/></td>
			    		        <td class="text-right"><input type="text" name="part" id="partCountCell" class="partCountCell"/></td>
			    		      `;
			    		

/* 			    		      partNumberCell.name = "part"+(k);
			    		      partNameCell.name = "part"+(k);
			    		      partPriceCell.name = "part"+(k);
			    		      partCountCell.name = "part"+(k);  */
			    		      
			    		     //$("#partLength").val(k);
			    		      let currentPart = Number($("#partLength").val());
								$("#partLength").val(currentPart + 1);	 
			    		      
			    		     var jj = 0;
			    		      jj += k;
			    		      var mm = partDelte.id = "partDelte"+(k);
			    		      partNumberCell.id = "partNumberCell"+(k);
			    		      partNameCell.id = "partNameCell"+(k);
			    		      partPriceCell.id = "partPriceCell"+(k);
			    		      partCountCell.id = "partCountCell"+(k);
			    		      
			    		      
			    		      $('#'+mm).on("click",function(){
			    		    	    var row = document.getElementById(mm); // 삭제버튼

			    		    	    $(this).parent().parent().remove();

			    		    	}); 

		    		        $("#partNumberCell"+(k)).val(data.partNumber);
		    		        $("#partNameCell"+(k)).val(data.partName);
		    		        $("#partPriceCell"+(k)).val(data.partPrice);
		    		        $("#partCountCell"+(k)).val(defaultCount2);
		    		        
		    		        $("#partCountCell"+(k)).on("keyup", function(evt) {
		    	            
		    	            var tagId = evt.target.id;
		    	            count2 = parseInt(evt.target.value);
		    	            
		    	            //j값을 구하기 위한 숫자 19
		    	            var result1 = tagId.substring(13);
		    	            //console.log(result1);
		    	            parseInt($("#partPriceCell"+(result1)).val(data.partPrice*count2)); 
		    	            total2 += parseInt($("#partPriceCell"+(result1)).val())
		    	            $("#totalPart").val(total2);
		    		        // ---------------------------------------------------------------
		    		        let tot = 0;
		    		        $(".partPriceCell").each(function(index){

		    		        	 let cnt = $(".partPriceCell").length;
		    		        	// console.log(cnt + " : " + index);
		    		        	if( index +1 ==   cnt)  return
//		    		        	tot +=parseInt($(this).val())*parseInt($(this).parent().next().find("input").val());
		    		        	tot +=parseInt($(this).val());
		    		        	
		    		        	
		    		        });

		    		         $("#totalPart").val(tot);


		    	            })
		    	            
			    		      var tbody = document.getElementById('tbodyPart');
			    		      tbody.appendChild(newRow);

			    		      $('#partModal').modal('hide'); 
			    		    })
			    		    .catch(error => {
			    		      console.error('Error:', error);
			    		    });
			    		  });
			    		})(i);
			    }
			    
			    
			  
		  })
		  .catch(error => {
		    console.error('Error:', error);
		  });
		
	}
	
	<% for (int i = 1; i <20 ; i++) { %>
	  $("#technologyDelte<%= i %>").on("click", function() {
		  console.log("값 : "+$("#technologyLength").val());
		    var currentValue = parseInt($("#technologyLength").val());
		        // 현재 값이 0보다 크면 1을 뺀 후 업데이트
		        currentValue = currentValue - 1;
		        $("#technologyLength").val(currentValue);
		     
	    $(this).parent().parent().remove();
	  });
	  
	  $("#technologyCountCell<%=i%>").on("keyup", function(evt) {

	        var tagId = evt.target.id;
	        count1 = parseInt(evt.target.value);

	        var prev = $(this).parent().prev().prev().prev().find("input").val()
	        
	         //j값을 구하기 위한 숫자 19
	        var result1 = tagId.substring(19);

	        parseInt($("#technologyPriceCell"+(result1)).val(techData[prev-1].technologyPrice*count1)); 
	        total2 += parseInt($("#technologyPriceCell"+(result1)).val())
	        $("#totalTechnology").val(total2);
	        // ---------------------------------------------------------------
	         let tot = 0;
	        $(".technologyPriceCell").each(function(index){

	        	 let cnt = $(".technologyPriceCell").length;
	        	 //console.log(cnt + " : " + index);
	        	if( index +1 ==   cnt)  return
//	        	tot +=parseInt($(this).val())*parseInt($(this).parent().next().find("input").val());
	        	tot +=parseInt($(this).val());
	        	
	        	
	        });
		
	        $("#totalTechnology").val(tot);  
	        
	        
	        })
	<% } %>
	<% for (int i = 1; i <20 ; i++) { %>
	$("#partDelte<%=i%>").on("click",function(){
	    var currentValue = parseInt($("#partLength").val());
	    
	        // 현재 값이 0보다 크면 1을 뺀 후 업데이트
	        currentValue = currentValue - 1;
	        $("#partLength").val(currentValue);
	      
 		$(this).parent().parent().remove();
	});
		 $("#partCountCell<%=i%>").on("keyup", function(evt) {
            var tagId = evt.target.id;
            count2 = parseInt(evt.target.value);
            var prev = $(this).parent().prev().prev().prev().find("input").val()
            //j값을 구하기 위한 숫자 19
            var result1 = tagId.substring(13);
           parseInt($("#partPriceCell"+(result1)).val(partData[prev-1].partPrice*count2)); 
           total2 += parseInt($("#partPriceCell"+(result1)).val())
           $("#totalPart").val(total2);
        // ---------------------------------------------------------------
        let tot = 0;
        $(".partPriceCell").each(function(index){

        	 let cnt = $(".partPriceCell").length;
        	if( index +1 ==   cnt)  return
        	tot +=parseInt($(this).val());
        	
        	
        });

        $("#totalPart").val(tot); 
		
        
          })
	<% } %>
	

	
})

var $j = jQuery.noConflict(); // $j 변수를 생성해서 jQuery를 사용합니다.

$j(function() {
	$j('.datePicker').datepicker({
	    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
	    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
	    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
	    templates : {
	        leftArrow: '&laquo;',
	        rightArrow: '&raquo;'
	    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
	    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
	    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
	    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
	    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	    
	});//datepicker end
	var today = new Date();  // 오늘 날짜 
	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1;  // 월
	var date = today.getDate();  // 날짜

	// 월/일이 한자리 숫자인 경우 앞에 0을 붙이기 위한 로직
	month = month >= 10 ? month : '0' + month;
	date = date >= 10 ? date : '0' + date;

	var todayString = year + '-' + month + '-' + date;
    $j('.datePicker').val(todayString);
 });
</script>

<body class="">
  <div class="wrapper ">
    <%@ include file="./side.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
	<%@ include file="./navi.jsp" %>
      <!-- End Navbar -->
      <div class="content">
		<!-- 모달 -->
          <div class="modal fade" id="techModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">조회</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="col-md-12">
					  <div class="modal-body">
					    <form name="frmtechnology" id="frmtechnologyId" >
					      <div class="row">
							<div class="Search">
			                      <div class="form-row align-items-center">
							      <div class="form-group mb-0">
							        <input type="text" class="form-control" placeholder="품번" name="technologyNumberModal" id="technologyNumberId">
							      </div>
							      <button type="button" class="btn btn-primary btn-round" id="techId">검색</button>
							  </div>
			                   </div>
							<div class="Search">
			                      <div class="form-row align-items-center">
							      <div class="form-group mb-0">
							        <input type="text" class="form-control" placeholder="기술" name="technologyDetailModal" id="technologyDetailId">
							      </div>
							      <button type="button" class="btn btn-primary btn-round" id="techName">검색</button>
							  </div>
			                   </div>
					      </div>
					    </form>
					    <table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">기술내용</th>
						      <th scope="col">기술비용</th>
						    </tr>
						  </thead>
						  <tbody id="technology">
						  </tbody>
						</table>
					  </div>
					</div>
			      <div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" id="mm">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
            <div class="modal fade" id="partModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">조회</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="col-md-12">
					  <div class="modal-body">
					    <form name="frmtechnology" id="frmtechnologyId" >
					      <div class="row">
							<div class="Search">
			                      <div class="form-row align-items-center">
							      <div class="form-group mb-0">
							        <input type="text" class="form-control" placeholder="품번" name="partNumberModal" id="partNumberId">
							      </div>
							      <button type="button" class="btn btn-primary btn-round" id="partSeachRight">검색</button>
							  </div>
			                   </div>
							<div class="Search">
			                      <div class="form-row align-items-center">
							      <div class="form-group mb-0">
							        <input type="text" class="form-control" placeholder="부품명" name="partNameModal" id="partNameId">
							      </div>
							      <button type="button" class="btn btn-primary btn-round" id="partSeachLeft">검색</button>
							  </div>
			                   </div>
					      </div>
					    </form>
					    <table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">부품명</th>
						      <th scope="col">부품갯수</th>
						      <th scope="col">부품비용</th>
						    </tr>
						  </thead>
						  <tbody id="part">
						  </tbody>
						</table>
					  </div>
					</div>
			      <div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" id="mm">취소</button>
			      </div>
			    </div>
			  </div>
			</div>
      <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                   <div class="row">
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="차대번호" id="vinIdHi" style="width : 250px; " value="${work.clientVin }" disabled="disabled">
					      </div>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="차량번호" id="carIdHi" style="width : 150px;" value="${work.clientCarNumber }" disabled="disabled">
					      </div>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="고객명" id="memberNameIdHi" style="width : 150px;" value="${work.memberName }" disabled="disabled">
					      </div>
					  </div>
                    </div>
                    <div class="Search">
                    <form action="/reg/work" method="get">
                       <div class="form-row align-items-center">
                       		<div>
					      		 <input type="text" id="datePicker" class="datePicker form-control" value="" name="registrationDateHi" style="height: 40px; width : 150px;"> 
					      	</div>
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" name="registrationRN" value="${searchOne.registrationRN }" placeholder="접수번호" style="width: 100px;">
					      </div>
					      
					      <button type="submit" class="btn btn-primary btn-round" id="nameSearch">검색</button>
					      <input type="button" value="저장" class="btn btn-primary btn-round"/>
							<%-- <div class="form-group mb-0">
						        <input type="text" class="form-control" name="technology" value="${work.registrationNumber }" placeholder="실실적접수번호">
						    </div>
							<div class="form-group mb-0">
						        <input type="text" class="form-control" name="part" value="${work.registrationNumber }" placeholder="실실적접수번호">
						    </div> --%>
					  </div>
					</form>
                    </div>
               	</div>
              </div>
            </div>
          </div>
		<form action="/reg/work" method="POST" id="frm">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title">기술</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
				    <input type="hidden" name="_method" value="PATCH"/>
				    <div class="form-group mb-0">
				        <input type="hidden" class="form-control" name="technologyNumberName" value="${work.registrationNumber }" placeholder="실실적접수번호">
				    </div>
				    <div class="form-group mb-0">
				        <input type="hidden" class="form-control" id="technologyLength" name="technologyLength" value="${technologyLength }">
				    </div>
                  <table class="table table-hover" id="table" >
                    <thead class=" text-primary">
                   		<tr>
                   		<th>
                   			#
                   		</th>
	                      <th>
	                        기술번호
	                      </th>
	                      <th>
	                        기술내용
	                      </th>
	                      <th class="text-center">
	                        기술비용
	                      </th>
	                      <th class="text-right" style="">
	                        기술수량
	                      </th>
                      	</tr>
                    </thead>
                    
					<tbody id="tbodyTech">
					  <!-- 기존 코드에서 tr에 id 추가 -->
                        <c:forEach var="technology" items="${technology}">
					  <tr id="trTech<%= ++techCount%>">
					    <!-- 각 td에 클래스 추가 -->
					    <td><button type="button" id="technologyDelte<%=techCount %>" class="btn btn-primary btn-round">삭제</button></td>
						    <td data-toggle="modal" data-target="#techModal" data-whatever="@mdo"><input type="text" name="technology" id="technologyNumberCell<%=techCount %>" value="${technology.technologyNumber}" class="dis"  disabled="disabled"></td>
						    <td data-toggle="modal" data-target="#techModal" data-whatever="@mdo"><input type="text" name="technology" id="technologyDetailCell<%=techCount %>" value="${technology.technologyDetail}" class="dis" disabled="disabled"></td>
						    <td class="text-center" data-toggle="modal" data-target="#techModal" data-whatever="@mdo"><input type="text" name="technology" id="technologyPriceCell<%=techCount %>" value="${technology.technologyPrice}" class="technologyPriceCell"  disabled="disabled"/></td>
						    <td class="text-right"><input type="text" name="technology" id="technologyCountCell<%=techCount %>" class="technologyCountCell" value="${technology.technologyNo}"/></td>
					  </tr>
					  </c:forEach>      
					  <tr id="trTech1">
					    <!-- 각 td에 클래스 추가 -->
					    <td><button type="button" id="technologyDelte" class="btn btn-primary btn-round">삭제</button></td>
					    <td data-toggle="modal" data-target="#techModal" data-whatever="@mdo"><input type="text" name="technology" id="technologyNumberCell" class="dis" disabled="disabled"></td>
					    <td data-toggle="modal" data-target="#techModal" data-whatever="@mdo"><input type="text" name="technology" id="technologyDetailCell" class="dis" disabled="disabled"></td>
					    <td class="text-center" data-toggle="modal" data-target="#techModal" data-whatever="@mdo"><input type="text" name="technology" id="technologyPriceCell" class="technologyPriceCell" disabled="disabled"/></td>
					    <td class="text-right"><input type="text" name="technology" id="technologyCountCell" class="technologyCountCell" /></td>
					  </tr>
					</tbody>
					  <tr>
					  	<td colspan="5" data-toggle="modal" data-target="#techModal" data-whatever="@mdo" style="text-align: right;">합 : <input type="text" name="technologyBout" id="totalTechnology" class="dis" value="${tBout }" disabled="disabled" /></td>
					  </tr>
                  </table>

                </div>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="card card-plain">
              <div class="card-header">
                <h4 class="card-title">부품</h4>
                <p class="card-category"></p>
              </div>
              <div class="card-body">
                <div class="table-responsive">
				    <input type="hidden" name="_method" value="PATCH"/>
				    <div class="form-group mb-0">
				        <input type="hidden" class="form-control" name="partNumberName" value="${work.registrationNumber }" placeholder="실질적접수번호">
				    </div>
				    <div class="form-group mb-0">
				        <input type="hidden" class="form-control" id="partLength" name="partLength" value="${partLength }" placeholder="">
				    </div>
                  <table class="table table-hover">
                    <thead class=" text-primary">
                    <tr>
                      <th>
                   		#
          	      	</th>
                      <th>
                        부품번호
                      </th>
                      <th>
                        부품명
                      </th>
                      <th class="text-center">
                        부품비용
                      </th>
                      <th class="text-right">
                        부품수량
                      </th>
                     </tr>
                    </thead>
                    <tbody id="tbodyPart">
                    <c:forEach var="part" items="${part}">
                      <tr id="trPArt<%= ++partCount%>">
                      <td><button type="button" id="partDelte<%=partCount%>" class="btn btn-primary btn-round">삭제</button></td>
                        <td data-toggle="modal" data-target="#partModal" data-whatever="@mdo"><input type="text" name="part" id="partNumberCell<%=partCount%>" class="dis" value="${part.partNumber }" disabled="disabled"/></td>
                        <td data-toggle="modal" data-target="#partModal" data-whatever="@mdo"><input type="text" name="part" id="partNameCell<%=partCount%>" class="dis" value="${part.partName }" disabled="disabled"/></td>
                        <td class="text-center" data-toggle="modal" data-target="#partModal" data-whatever="@mdo"><input type="text" name="part" id="partPriceCell<%=partCount%>" value="${part.partPrice }" class="partPriceCell" disabled="disabled"/></td>
                        <td class="text-right"><input type="text" name="part" id="partCountCell<%=partCount%>" class="partCountCell" value="${part.partNo }"/></td>
                      </tr>      
                      </c:forEach> 
                      <tr id="trPArt1">
                      <td><button type="button" id="partDelte" class="btn btn-primary btn-round">삭제</button></td>
                        <td data-toggle="modal" data-target="#partModal" data-whatever="@mdo"><input type="text" name="part" id="partNumberCell" class="dis" disabled="disabled"/></td>
                        <td data-toggle="modal" data-target="#partModal" data-whatever="@mdo"><input type="text" name="part" id="partNameCell" class="dis" disabled="disabled"/></td>
                        <td class="text-center" data-toggle="modal" data-target="#partModal" data-whatever="@mdo"><input type="text" name="part" id="partPriceCell" class="partPriceCell" disabled="disabled"/></td>
                        <td class="text-right"><input type="text" name="part" id="partCountCell" class="partCountCell"/></td>
                      </tr>       
                    </tbody>
                    <tr>
					  	<td colspan="5" data-toggle="modal" data-target="#partModal" data-whatever="@mdo" style="text-align: right;">합 : <input type="text" name="partBout" id="totalPart" class="dis" value="${pBout }" disabled="disabled" /></td>
					</tr>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                 <div class="row"  style="float: right; margin-right: 10px; margin-bottom: 15px;">   
					<div>총합 : <input type="text" name="" id="totalTechAndPart" value="${technologyAndPartBout }" disabled="disabled" /></div>
               	</div>
              </div>
            </div>
          </div>
        </div>
		</form>
      </div>
    </div>
  </div>
</body>

</html>