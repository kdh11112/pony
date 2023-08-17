<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.board-table tbody td, .board-table tfoot td {
	text-align: left !important;
}

.board-table thead th, .board-table tfoot th {
	padding: 0px !important;
	text-align: left !important;
	border-left : 20px !important;
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
.board-table tfoot th{
	width: 1000px; 
}
.board-table thead th{
	width: 700px; 
} 
.board-table tfoot td,
.board-table thead td{
	text-align: right; 
} 
.board-table thead td{
	padding-right: 10px;
}
/* thead {
	background: #EBEDEE;
} */
#bodytd {
	text-align: center !important;
}
tfoot{
	vertical-align: left !important;
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
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<div class="container-fluid">
					<img id="sidebarToggle" src="css/admin/assets/list.png">
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							<li class="nav-item active"><a class="nav-link" href="/admin">AdminHome</a></li>
							<li class="nav-item"><a class="nav-link" href="/">UserPage</a></li>
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
								<div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="#!">Action</a>
									<a class="dropdown-item" href="#!">Another action</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#!">Something else here</a>
								</div></li>
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
										<th>주문번호</th>
										<td class="td-no" >${order.orderNo }</td>
										<td>
											<input type="hidden" name="orderNo" value="${order.orderNo }">
										</td>
									</tr>
									<tr>
										<th>주문일</th>
										<td class="td-date" >
											<fmt:parseDate var="dateString" value="${order.orderDate }" pattern="yyyy-MM-dd HH:mm:ss" />
											<fmt:formatDate value="${dateString }" pattern="yyyy-MM-dd HH:mm:ss" />
										</td>
									</tr>
									<tr>
										<th>수령인</th>
										<td class="td-recipient">${order.orderRecipientName }</td>
									</tr>
									<tr>
										<th>연락처</th>
										<td class="td-rphone" >${order.orderRecipientPhone }</td>
									</tr>
									<tr>
										<th>배송지</th>
										<td class="td-addrs" >${order.orderRecipientAddress }</td>
									</tr>
									<tr>
										<th>주문상태</th>
										<td class="td-status" >${order.orderStatus}</td>
									</tr>
								</thead>
							</table>
							<table class="board-table"  style="padding-bottom: 20px !important;" >
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
							<table class="board-table">
								<tbody>
									<tr>
										<th width="5%">
											<input type="checkbox" id="allCheck" />
										</th>
										<th width="15%">부품번호</th>
										<th width="50%">부품명</th>
										<th width="15%">주문 수량</th>
										<th width="15%">판매가</th>
									</tr>
									<c:forEach var="orderDetails" items="${orderDetails }">
										<tr>
											<td id="bodytd">
												<input type="checkbox" name="RowCheck" value="${orderDetails.partNumber }" />
											</td>
											<!-- 부품번호 -->
											<td class="td-partno" id="bodytd">${orderDetails.partNumber }</td>
											<!-- 부품명 -->
											<td class="td-partname">${orderDetails.partName }</td>
											<!-- 주문수량 -->
											<td class="td-quantity" id="bodytd">${orderDetails.orderdetailOrderQuantity }</td>
											<!-- 판매가 -->
											<td class="td-amount" id="bodytd">
												<fmt:formatNumber pattern="###,###,###원">
													<c:out value=" ${orderDetails.orderdetailAmount }" />
												</fmt:formatNumber>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<a href="/adminorderlist">
								<input type="button" class="btn btn-outline-dark" value="배송시작" />
							</a>
							<a href="/adminorderlist">
								<input type="button" class="btn btn-outline-dark" value="목록" />
							</a>
							<a href="orderdelete?orderNo=${order.orderNo }">
								<input type="button" class="btn btn-outline-danger" value="삭제" />
							</a>
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