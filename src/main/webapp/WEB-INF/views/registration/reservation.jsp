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
					               
					               
						                <form action="/reg/reservationSearch" method="get">
						                  <div class="row">
							          
							                    <div class="Search">
							                       <div class="form-row align-items-center">
												      <div class="form-group mb-0">
												        <input type="text" class="form-control" placeholder="접수일" id="registrationDate" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
												      </div>
												  </div>
							                    </div>
							                    
							                    
							                    <div class="Search">
							                       <div class="form-row align-items-center">
												      <div class="form-group mb-0">
												        <input type="text" class="form-control" placeholder="예약자" id="memberNameIdHi" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
												      </div>
												  </div>
							                    </div>
							                    
					  
							                    
							                    
							                    <div class="Search">
							                       <div class="form-row align-items-center">
							                       	  <div class="form-group mb-0" style="padding-left: 50px;">
												      	<button type="submit" class="btn btn-primary btn-round" id="nameSearch">검색</button>
												      </div>
												  </div>
							                    </div>
						               	  </div>
						                </form>
					                
						              </div>
						            </div>
						            
					          </div>
          
          
						          <div class="col-md-12">
						            <div class="card card-user">
						              <div class="card-body">
						              
							                  <table class="table">
								                  <tr class="trRow">
								                  		<th>예약번호</th>
								                  		<th>접수일</th>
							                            <th>차량번호</th>
								                  		<th>예약자</th>
							                            <th>예약지점</th>
								                        <th>고객요청사항</th>
							                            <th>입고예정일</th>
							                      <tr>
							                
							                
									              <c:forEach var="dto" items="${reservationList }"> 
										                   <tr class="trRow">
											                   
										                            <td>${dto.reservationNo}</td>
											                    	<td>${dto.reservationDate}</td>
										                            <td>${dto.clientCarNumber}</td>
											                    	<td>${dto.memberName}</td>
										                            <td>${dto.shopAreaPoint}</td>
											                        <td>${dto.reservationClientRequests}</td>
										                            <td>${dto.reservationDueDate}</td>
										                       
										                       
											               </tr>
										          </c:forEach>
										          
										          
							                </table>
						                
						              </div>
						            </div>
						          </div>
	        </div>
	      </div>
    </div>
  </div>

</body>
</html>