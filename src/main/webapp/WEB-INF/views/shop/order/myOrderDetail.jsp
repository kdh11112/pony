<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myorderlist</title>
<link href="css/admin/css/order/orderdetaillayout.css" rel="stylesheet" />
<link href="css/admin/css/order/orderdetail.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/admin/css/order/styles.css" rel="stylesheet" />
<link href="css/mypage/css/board.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="css/mypage/js/scripts.js"></script>
<style>
</style>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="#!"></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="/cartlist">모든 상품보기</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="/cartlist">장바구니</a></li>
							<li><a class="dropdown-item" href="myorderlist">내 주문내역</a></li>
						</ul></li>
				</ul>
				<form class="form-inline">
					<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit" id="search" name="search">검색</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- header -->
	<header>
		<img src="images/cloud.jpg" alt="" class="cloud" />
		<div class="header-content text-center text-black">
			<h1 class="display-4 fw-bolder">주문 상세정보</h1>
			<p class="lead fw-normal text-black-50 mb-0" style="font-size: 20px; color: #00000080;">주문 상세내역을 확인하실 수 있습니다.</p>
		</div>
	</header>

	<div id="container" role="main" style="margin-top: 50px; margin-bottom: 50px; font-family: -apple-system, BlinkMacSystemFont !important ;">

		<div id="content">
			<div class="detail_section ordernum_sc">
				<div class="ordernum">
					<p class="number">
						주문번호
						<c:out value="${order.orderNo }" />
					</p>
					<span class="date">주문일자 <fmt:formatDate value="${orderDate}" pattern="yyyy.MM.dd" /></span>
				</div>
			</div>


			<!-- delivery 단위로 반복 -->

			<ul class="sellerinfo_sc">
				<li class="detail_section">
					<ul class="order_list">
						<!-- productOrder 단위로 반복 -->
						<c:forEach var="userorderdetail" items="${userOrderList }">
							<li>
								<div class="order_list_item">
									<div class="product_info">
										<span class="icon_text status"><c:out value="${userorderdetail.orderStatus }" /></span>
										<c:out value="${userorderdetail.partName }" />

										<!-- 상품 금액 -->
										<div class="sum_amount">
											<strong class="discount_price"><fmt:formatNumber pattern="###,###,###원">
													<c:out value="${userorderdetail.orderdetailAmount }" />
												</fmt:formatNumber> </strong>
										</div>

										<p class="ordernum">
											주문수량 :
											<c:out value="${userorderdetail.orderdetailOrderQuantity }" />
											개
										</p>

										<!-- 옵션 / 사은품 -->
										<ul class="option_list">
											<li><span class="icon_text option">옵션</span> MODEL: <c:out value="${userorderdetail.modelName }" /></li>

										</ul>
									</div>
								</div>
							</li>
						</c:forEach>
						<!-- productOrder 단위로 반복 끝 -->
					</ul>
				</li>
			</ul>
			<!-- delivery 단위로 반복 끝 -->

			<!-- 수신자 / 배송지 정보 -->
			<div class="detail_section">
				<div class="info_area">
					<div class="info_head">
						<h3 class="h3">배송지정보</h3>
					</div>
					<div class="info_cont">
						<ul class="info_list person_info delivery">
							<li><strong>수령인</strong><span><c:out value="${order.orderRecipientName }" /></span></li>
							<li><strong>연락처</strong>
								<div>
									<c:out value="${formattedPhoneNumber}" />
								</div></li>
							<li><strong>배송지</strong><span><c:out value="${order.orderRecipientZip}" /></span><br>
							<c:out value="${order.orderRecipientAddress}" /><br>
							<c:out value="${order.orderRecipientAddressDetail}" /></li>
							<li><strong>배송메모</strong>
								<div>부재시 문 앞에 두고가주세요</div></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- 주문금액 -->
			<div class="detail_section type_payment_info">
				<div class="info_area ">
					<div class="info_head">
						<h3 class="h3">주문금액</h3>
						<strong class="detail_order_price"><fmt:formatNumber pattern="###,###,###원">
								<c:out value="${order.orderTotal }" />
							</fmt:formatNumber></strong>
					</div>
					<div class="info_cont" style="padding-top: 20px;">
						<ul class="info_list">
							<li>
								<div class="total">
									<strong>상품금액</strong> <em class="amount"><span><fmt:formatNumber pattern="###,###,###원">
												<c:out value="${order.orderTotal - order.orderDeliveryCharge - order.orderPoint }" />
											</fmt:formatNumber></span></em>
								</div>
							</li>
							<li>
								<div class="total">
									<strong>배송비</strong> <em class="amount">+<span><fmt:formatNumber pattern="###,###,###원">
												<c:out value="${order.orderDeliveryCharge }" />
											</fmt:formatNumber></span>
									</em>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<!-- 결제상세 -->
			<div class="detail_section type_payment_info">
				<div class="info_area">
					<div class="info_head">
						<h3 class="h3">결제상세</h3>
					</div>
					<div class="info_cont">
						<ul class="info_list">
							<li>
								<div class="total">
									<strong>포인트 사용</strong>
									<p class="amount">
										<span><c:out value="${order.orderPoint }" /></span>원
									</p>
								</div>
							</li>
							<li class="type_main_payment"><strong>카드 결제</strong> <em class="amount"><span><fmt:formatNumber pattern="###,###,###원">
											<c:out value="${order.orderTotal - order.orderPoint }" />
										</fmt:formatNumber></span></em>
								<div class="payment_detail_info">
									신한(4221-****-****-****) <span class="card_payment_type"> 일시불 </span>
								</div>
								<ul class="dot_list type_round">
									<li>결제 상세 내역은 카드사로 문의하시면 정확하게 확인할 수 있습니다.</li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- 포인트 혜택 -->
			<div class="detail_section">
				<input type="checkbox" id="point_chk1" class="hidden" checked="checked">
				<div class="N=a:odd.benefit info_area">
					<label for="point_chk1" class="info_head">
						<h3 class="h3">포인트 혜택</h3> <span class="text_point_color point_benefit">총 1,500원</span>
					</label>
				</div>
			</div>
		</div>


	</div>

	<!-- footer -->
	<footer class="py-5 bg-secondary" style="background-color: #6c757d !important;">
		<div class="container">
			<p class="m-0 text-center text-white" style="font-size: 16px;">Copyright &copy; Your Website 2023</p>
		</div>
	</footer>

	<!-- //footer -->
</body>
</html>