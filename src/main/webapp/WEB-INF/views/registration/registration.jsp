<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">

<!-- JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/bootstrap-datepicker.ko.min.js"></script>
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
<script type="text/javascript">
$(function() {


$("#vin").on("click", function() {
    jax();
    $("#vinSearchId").val("");
  });
  $("#number").on("click", function() {
    jax();
    $("#numberSearchId").val("");
  });
  $("#name").on("click", function() {
    jax();
    $("#nameSearchId").val("");
  });
 
  var clientCarNumber = null;

  function jax() {
	  var vinSearchValue = $("#vinSearchId").val();
	  var numberSearchIdValue = $("#numberSearchId").val();
	  var nameSearchIdValue = $("#nameSearchId").val();

	  $.ajax({
	    url: "/reg/modal", // 요청을 보낼 URL
	    method: "GET", // GET 요청
	    data: {
	      clientVin: vinSearchValue, // 서버로 보낼 데이터
	      clientCarNumber: numberSearchIdValue,
	      memberName: nameSearchIdValue
	    },
	    success: function(data) {
	      var tbody = document.getElementById("t");

	      // 기존 tbody의 내용 비우기
	      tbody.innerHTML = "";

	      // 데이터 배열을 순회하며 tbody에 데이터를 출력
	      for (var i = 0; i < data.length; i++) {
	        // tr 엘리먼트 생성
	        var row = document.createElement("tr");
	        row.id = "row" + (i + 1);

	        // 각 데이터 항목에 해당하는 값을 가져옴
	        var clientVinData = data[i].clientVin;
	        var clientCarNumberData = data[i].clientCarNumber;
	        var memberNameData = data[i].memberName;

	        // td 엘리먼트 생성하고 데이터를 추가
	        var cell = document.createElement("td");
	        var cell1 = document.createElement("td");
	        var cell2 = document.createElement("td");
	        var cell3 = document.createElement("td");

	        cell.innerText = i + 1;
	        cell1.innerText = clientVinData;
	        cell2.innerText = clientCarNumberData;
	        cell3.innerText = memberNameData;
	        
	        

	        // td 엘리먼트를 tr에 추가
	        row.appendChild(cell);
	        row.appendChild(cell1);
	        row.appendChild(cell2);
	        row.appendChild(cell3);

	        // tr을 tbody에 추가
	        tbody.appendChild(row);
	          (function(index) { // 클로저 함수
        	    $("#row" + (index + 1)).on("click", function() { // id값은 "row" + (index + 1)입니다.
        	      //console.log(index + 1); // id값이 1부터 시작하므로 인덱스에 1을 더해줍니다.
        	      console.log(data[index].clientVin);
        	      $.ajax({
        	    	    type: 'post',
        	    	    url: '/reg/registration',
        	    	    data: {
        	    	        clientVin: data[index].clientVin
        	    	    },
        	    	    success: function(response) {
        	    	    	console.log(response);

        	    	    	
        	    	    	
        	    	    	$("#vinIdHi").val(response.clientVin);//차대번호
        	    	    	$("#carIdHi").val(response.clientCarNumber); //차량번호
        	    	    	$("#memberNameIdHi").val(response.memberName);//고객명
        	    	    	
        	    	    	$("#vinId").val(response.clientVin);//차대번호
        	    	    	$("#carId").val(response.clientCarNumber); //차량번호
        	    	    	$("#carTypeId").val(response.clientCarType);//차종
        	    	    	$("#carColorId").val(response.clientColor);//색상
        	    	    	$("#toDayId").val(response.registrationDate);//접수일
        	    	    	$("#beforDrivenId").val(response.clientDistanceDriven);//기존주행거리
        	    	    	$("#afterDrivenId").val(response.clientDistanceDriven);//현재주행거리
        	    	    	$("#ShipDateId").val(response.clientShipDate);//출고일
        	    	    	$("#ProductionDateId").val(response.clientProductionDate);//생산일
        	    	    	$("#ReservationDueDateId").val(response.registrationReservationDueDate);//입고예정일
        	    	    	$("#memberNameId").val(response.memberName);//고객명
        	    	    	$("#NumberId").val(response.memberPhone);//고객전화번호
        	    	    	$("#shopAreaId").val(response.shopArea,response.shopAreaPoint);//최종정비사업소
        	    	    	$("#SignificantId").val(response.registrationSignificant);//특이사항
        	    	    	$("#ClientRequestsId").val(response.registrationClientRequests);//고객요청사항
        	    	    	
        	    	    	$('#exampleModal').modal('hide');
        	    	    	
        	    	    },
        	    	    error: function(xhr, status, error) {
        	    	        console.log(xhr.responseText);
        	    	    }
        	    	});
        	    });
        	  })(i); 
        	  
        	  
	        
        	  /*   $("tr").on("click", function() { // id값은 "row" + (index + 1)입니다.
        	    	let count = $("tr").index(this);
        	    console.log(count);
        	      console.log(clientVinData[1]);
        	    }); */
        	  
        	  
        	  
        }
      },
      error: function(xhr, status, error) {
        console.error("요청 실패: ", xhr, status, error);
      }
    });
  }

  $("input[value='차량접수/수정']").on("click",function(){
	
	  document.frm.method="post";
	  document.frm.action="/reg/registrations";
	  $("#Form").submit(); 
	  
  });
  
  
});
var $j = jQuery.noConflict(); // $j 변수를 생성해서 jQuery를 사용합니다.

$j(function() {
	$j('#datePicker').datepicker({
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
    $j('#datePicker').val(todayString);
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
        <div class="row">
        <div class="col-md-12" >
            <div class="card card-user " style="height: 85px;">
              <div class="card-body" >
                <form>
                  <div class="row">
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="차대번호" id="vinIdHi" style="width : 300px" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
					      </div>
					      
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="차량번호" id="carIdHi" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
					      </div>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="고객명" id="memberNameIdHi" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
					      </div>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
                       		<div>
					      		<input type="text" id="datePicker" class="form-control" value="">
					      	</div>
					      <div class="form-group mb-0">
					        <input type="text" class="form-control" placeholder="접수번호">
					      </div>
					      <button type="submit" class="btn btn-primary btn-round" id="nameSearch">검색</button>
					      <!-- <button type="submit" class="btn btn-primary btn-round">차량접수/수정</button> -->
					      <input type="button" value="차량접수/수정" class="btn btn-primary btn-round"/>
					  </div>
                    </div>
                    <div class="Search">
                       <div class="form-row align-items-center">
					      <button type="submit" class="btn btn-primary btn-round" style="margin-left:50px;">예약</button>
					  </div>
                    </div>
               	</div>
                </form>
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-xl" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">조회</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="col-md-12">
						  <div class="modal-body">
						    <form name="frm">
						      <div class="row">
								<div class="Search">
			                       <div class="form-row align-items-center">
								      <div class="form-group mb-0">
								        <input type="text" class="form-control" placeholder="차대번호" name="clientVin" id="vinSearchId">
								      </div>
								      <button type="button" class="btn btn-primary btn-round" id="vin">검색</button>
								  </div>
			                    </div>
								<div class="Search">
			                       <div class="form-row align-items-center">
								      <div class="form-group mb-0">
								        <input type="text" class="form-control" placeholder="차량번호" name="numberSearch" id="numberSearchId">
								      </div>
								      <button type="button" class="btn btn-primary btn-round" id="number">검색</button>
								  </div>
			                    </div>
								<div class="Search">
			                       <div class="form-row align-items-center">
								      <div class="form-group mb-0">
								        <input type="text" class="form-control" placeholder="고객명" name="nameSearch" id="nameSearchId">
								      </div>
								      <button type="button" class="btn btn-primary btn-round" id="name">검색</button>
								  </div>
			                    </div>
						      </div>
						    </form>
						    <table class="table table-hover">
							  <thead>
							    <tr>
							      <th scope="col">#</th>
							      <th scope="col">차대번호</th>
							      <th scope="col">차량번호</th>
							      <th scope="col">고객명</th>
							    </tr>
							  </thead>
							  <tbody id="t">
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
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <div class="card card-user">
              <div class="card-body">
                <form action="/reg/registrations" method="post" name="frm" id="Form">
                  <div class="row">
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>차대번호</label>
                        <input type="text" class="form-control" id="vinId" name="clientVin" readonly>
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>차량번호</label>
                        <input type="text" class="form-control" id="carId" name="clientCarNumber">
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>차종</label>
                        <input type="text" class="form-control" id="carTypeId" name="clientCarType" readonly>
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>색상</label>
                        <input type="text" class="form-control" id="carColorId" name="clientColor" readonly>
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>접수일</label>
                        <input type="text" class="form-control" id="toDayId" name="registrationDate" readonly>
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <!-- <label>접수번호</label> -->
                        <input type="hidden" class="form-control" id="registrationNumberId" name="registrationNumber1" readonly>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>기존주행거리</label>
                        <input type="text" class="form-control" id="beforDrivenId" name="clientDistanceDriven" readonly >
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>현재주행거리</label>
                        <input type="text" class="form-control" id="afterDrivenId" name="clientDistanceDriven">
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>출고일</label>
                        <input type="text" class="form-control" id="ShipDateId" name="clientShipDate" readonly>
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>생산일</label>
                        <input type="text" class="form-control" id="ProductionDateId" name="clientProductionDate" readonly>
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>입고예정일</label>
                        <input type="text" class="form-control" id="ReservationDueDateId" name="registrationReservationDueDate" readonly>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>고객명</label>
                        <input type="text" class="form-control" id="memberNameId" name="memberName">
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>전화번호</label>
                        <input type="text" class="form-control" id="NumberId" name="memberPhone">
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>지정정비사</label>
                        <select class="form-control" id="mechanicId" name="mechanicNo">
                            	<option value="0">미지정</option>
					        <c:forEach items="${mechanic}" var="mechanic">
					            <option value="${mechanic.mechanicNo}">
					                ${mechanic.mechanicNo} / ${mechanic.mechanicName}
					            </option>
					        </c:forEach>
						</select>
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>최종정비공장</label>
                        <input type="text" class="form-control" id="shopAreaId" name="shopAreaName" readonly>
                      </div>
                    </div>
                    <div class="col-md-2 pr-1">
                      <div class="form-group">
                        <label>최종입고일</label>
                        <input type="text" class="form-control" name="registrationDate" readonly>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>고객요청내역</label>
                        <textarea class="form-control textarea" id="ClientRequestsId" name="registrationClientRequests"></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>특이사항</label>
                        <textarea class="form-control textarea" id="SignificantId" name="registrationSignificant"></textarea>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>