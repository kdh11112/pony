<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>PONY ADMIN</title>

<style>
.board-table thead td {
	colspan: 5 !important;
}
.board-table tbody td, 
.board-table tfoot td {
  text-align: left !important;
}
.board-table thead th, 
.board-table tfoot th {
  padding: 0px !important;
  text-align: left !important;
}
.board-table tbody th {
  padding: 0px !important;
  text-align: center !important;	
}
.btn-primary {
	padding: 10 50px !important;
	cursor: none !important;
	display: none;
	background: none;
	font: black !important;
}
thead {
	background : #EBEDEE;
}
#bodytd{
	text-align: center !important;	
}
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/admin/css/styles.css" rel="stylesheet" />
<link href="css/admin/css/board.css" rel="stylesheet" />

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 체크박스 선택, 삭제 jquery -->
<script src="../js/checkboxAllcheck.js"></script>
<script src="../js/checkboxDelivery.js"></script>
</head>
<body>
	<div class="d-flex" id="wrapper">
        <!-- Sidebar-->
        <div class="border-end bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom bg-light">
            	<img alt="" src="css/admin/assets/invi.png"> 
     			<a class="logo-link" href="/admin"> PONY Admin</a>
     		</div>
            <div class="list-group list-group-flush">
            	<a class="list-group-item list-group-item-action list-group-item-light p-3" href="/partlist">재고관리</a>
            	<a class="list-group-item list-group-item-action list-group-item-light p-3" href="/adminorderlist">주문목록</a>
            	<a class="list-group-item list-group-item-action list-group-item-light p-3" href="/questionlist">고객문의</a>
            	<a class="list-group-item list-group-item-action list-group-item-light p-3" href="/adminnotice">공지사항</a>
        	</div>
        </div>
        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                <div class="container-fluid">
                    <img id="sidebarToggle" src="css/admin/assets/list.png">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                            <li class="nav-item active"><a class="nav-link" href="/admin">AdminHome</a></li>
                            <li class="nav-item"><a class="nav-link" href="/">UserPage</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#!">Action</a>
                                    <a class="dropdown-item" href="#!">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#!">Something else here</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            
            <!-- Page content-->
	        <div class="container-fluid">
	        	<section class="boardsection">
  					<div class="page-title">
						<div class="container">
							<h3>고객 주문목록</h3>
        				</div>
    				</div>
    				<!-- board list area -->
				    <div id="board-list">
						<div class="container">
							<table class="board-table">
								<thead>
									<tr>	
										<th colspan="2">주문번호</th>
										<td class="td-no" colspan="4">${order.orderNo }</td>
										<td><input type="hidden" name="orderNo" value="${order.orderNo }"></td>
									</tr>
									<tr>
										<th colspan="2">주문일</th>
										<td class="td-date" colspan="4">
											<fmt:parseDate var="dateString" value="${order.orderDate }" pattern="yyyy-MM-dd HH:mm:ss" /> 
											<fmt:formatDate value="${dateString }" pattern="yyyy-MM-dd HH:mm:ss" />
										</td>
									</tr>
									<tr>
										<th colspan="2">주문자 번호</th>
										<td class="td-mphone" colspan="4">${order.memberNo }</td>
									</tr>
									<tr>
										<th colspan="2">수령인</th>
										<td class="td-recipient" colspan="4">${order.orderRecipientName }</td>
									</tr>
									<tr>
										<th colspan="2">연락처</th>
										<td class="td-rphone" colspan="4">${order.orderRecipientPhone }</td>
									</tr>
									<tr>
										<th colspan="2">배송지</th>
										<td class="td-addrs" colspan="4">${order.memberNo }</td>
									</tr>
									<tr>
										<th colspan="2">주문상태</th>
										<td class="td-status" colspan="4">${order.orderStatus} 
											<a href="/delivery"><input type="button" class="btn btn-dark" value="배송시작" onclick="changeDelivery();"/></a>
										</td>
									</tr>
								</thead>
							</table>
							<table class="board-table">
								<tbody>
									<tr>
										<th width="5%"><input type="checkbox" id="allCheck" /></th>
										<th width="15%">부품번호</th>
										<th width="50%">부품명</th>
										<th width="15%">주문 수량</th>
										<th width="15%">판매가</th>
									</tr>
									<c:forEach var="list" items="${list }" >
										<tr>
											<td id="bodytd"><input type="checkbox" name="RowCheck" value="${list.partNumber }" /></td>
											<!-- 부품번호 -->
											<td class="td-member" id="bodytd">${list.partNumber }</td>
											<!-- 부품명 -->
											<td class="td-member">${order.memberNo }</td>
											<!-- 주문수량 -->
											<td class="td-member" id="bodytd">${list.orderdetailOrderQuantity }</td>
											<!-- 판매가 -->
											<td class="td-amount" id="bodytd">${list.orderdetailAmount }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<table class="board-table">
								<tfoot>
									
									<tr>
										<th>배송비</th>
										<td class="td-delivery">${order.orderDeliveryCharge }</td>
									</tr>
									<tr>
										<th>사용 포인트</th>
										<td class="td-point">- ${order.orderPoint }</td>
									</tr>
									<tr>
										<th>총 주문금액</th>
										<td class="td-total">${order.orderTotal }</td>
									</tr>
									<tr>
										<th>포인트 혜택</th>
										<td class="td-member">${order.memberNo }</td>
									</tr>		
								</tfoot>
							</table>
							<a href="/adminorderlist"><input type="button" class="btn btn-outline-dark" value="배송시작" /></a>
							<a href="/adminorderlist"><input type="button" class="btn btn-outline-dark" value="목록" /></a>
							<a href="orderdelete?orderNo=${order.orderNo }"><input type="button" class="btn btn-outline-danger" value="삭제" /></a>		
						</div>
					</div>
				</section>
	        </div>
        </div>
	</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="css/admin/js/scripts.js"></script>

</body>
</html>