<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포니</title>
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
<script type="text/javascript">
$(function(){
	$("input[value='결재']").on("click",function(){
		$(".dis").attr("disabled", false);
	  	$("#frm").submit(); 
	  
		});
	
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
</head>
<%int count = 1; %>
<body class="">
  <div class="wrapper ">
    <%@ include file="./side.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
	<%@ include file="./navi.jsp" %>
      <!-- End Navbar -->
      <div class="content">
      <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                   <div class="row">
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="차대번호" id="vinIdHi" style="width : 250px" value="${work.clientVin }" disabled="disabled">
					      </div>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="차량번호" id="carIdHi" value="${work.clientCarNumber }" style="width : 150px" disabled="disabled">
					      </div>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="고객명" id="memberNameIdHi" value="${work.memberName }" style="width : 150px" disabled="disabled">
					      </div>
					  </div>
                    </div>
                    <div class="Search">
                    <form action="/reg/payment" method="get">
                       <div class="form-row align-items-center">
                       		<div>
					      		 <input type="text" id="datePicker" class="datePicker form-control" value="" name="registrationDateHi" style="height: 40px; width : 150px;"> 
					      	</div>
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" name="registrationRN"  placeholder="접수번호">
					      </div>
					      <button type="submit" class="btn btn-primary btn-round" id="nameSearch">검색</button>
					      <input type="button" name="" id="" value="결재" class="btn btn-primary btn-round"/>
					  </div>
					</form>
                    </div>
               	</div>
              </div>
               	</div>
               	<form action="/reg/payment" id="frm" method="post">
               	<!-- <input type="hidden" name="_method" value="PATCH"/> -->
               	<input type="hidden" id="datePicker" class="datePicker form-control" value="" name="registrationDateHi" style="height: 40px">
               	<input type="hidden" class="form-control" name="registrationNumber" value="${work.registrationNumber }"  placeholder="접수번호">
               	<div class="card">
               	<div class="card-body">
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead class=" text-primary">
                    <tr>
                      <th>
                   		#
          	      	</th>
                      <th>
                        부품명 및 작업내용
                      </th>
                      <th>
                        부품수량
                      </th>
                      <th class="text-center">
                        부품비용
                      </th>
                      <th class="text-right">
                        공임비용
                      </th>
                     </tr>
                    </thead>
                    <tbody id="tbodyPart">
                     <c:forEach var="part" items="${part}" varStatus="i">
                    <tr>
                    	<td><%=count++ %></td>
                    	<td><input type="hidden" name="partList[${i.index}].partNumber" value="${part.partNumber }" /></td>
                    	<td>${part.partName }<input type="hidden" name="partList[${i.index}].partName" value="${part.partName }" /></td>                    	
                    	<td>${part.partNo }<input type="hidden" name="partList[${i.index}].partCount" value="${part.partNo }" /></td>
                    	<td class="text-center">${part.partPrice }<input type="hidden" name="partList[${i.index}].partPrice" value="${part.partPrice }" /></td>
                    	<td class="text-right"></td>
                    </tr> 
                    </c:forEach>
                     <c:forEach var="technology" items="${technology}" varStatus="i">
                    <tr>
                    	<td><%=count++ %><input type="hidden" name="count" value="<%=count %>" /></td>
                    	 <td><input type="hidden" name="techList[${i.index }].technologyNumber" value="${technology.technologyNumber}" /></td>
                    	<td>${technology.technologyDetail}<input type="hidden" name="techList[${i.index }].technologyDetail" value="${technology.technologyDetail}"/></td>
                    	<td>${technology.technologyNo}<input type="hidden" name="techList[${i.index }].technologyCount" value="${technology.technologyNo}" /></td>
                    	<td class="text-center">${work.mechanicName }</td>
                    	<td class="text-right">${technology.technologyPrice}<input type="hidden" name="techList[${i.index }].technologyPrice" value="${technology.technologyPrice}" /></td>
                    </tr> 
                    </c:forEach>   
                    </tbody>
                  </table>
                </div>
              </div>
              </div>
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                 <div class="row"  style="float: right; margin-right: 10px; margin-bottom: 15px;">   
				  	<div style="display: inline-block; margin-right: 70px;">부품 : <input type="text" name="partBout" id="totalPart" class="dis" value="${pBout }" disabled="disabled" /></div>
				  	<div style="display: inline-block; margin-right: 70px;">공임 : <input type="text" name="technologyBout" id="totalTechnology" class="dis" value="${tBout }" disabled="disabled" /></div>
					<div >총합 : <input type="text" name="" id="totalPart" value="${technologyAndPartBout }" disabled="disabled" /></div>
               	</div>
              </div>
            </div>
          </div>
          </form>
            </div>
          </div>
          </div>
      </div>
</body>
</html>