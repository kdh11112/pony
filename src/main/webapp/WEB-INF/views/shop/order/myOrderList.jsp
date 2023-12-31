<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<title>PONY MOTORS</title>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/mypage/css/styles.css" rel="stylesheet" />
<link href="css/admin/css/order/orderlist.css" rel="stylesheet" />
<link href="css/admin/css/order/orderlistpage.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="css/mypage/js/scripts.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.container-fluid{
	height: 64px;
}
</style>
</head>
<body>
	<!-- Navigation-->
	<jsp:include page="/WEB-INF/views/gnav.jsp" />
	<!-- header -->
	<header>
		<img src="images/cloud.jpg" alt="" class="cloud" />
		<div class="header-content text-center text-black">
			<h1 class="display-4 fw-bolder">내 주문목록</h1>
			<p class="lead fw-normal text-black-50 mb-0" style="font-size: 20px; color: #00000080;">주문내역을 확인하실 수 있습니다.</p>
		</div>
	</header>

	<div id="container">
		<div class="TwoStagedLayoutWrapper-module_content-left__2eGzo PcHome_content-left__1Sj2x">
			<div class="PaymentCategoryAndSearchButton_article__3lLC7">
				<div class="PaymentCategoryAndSearchButton_section-category__12UUt">
					<div class="PaymentCategoryAndSearchButton_inner__1MKkv">
						<div class="PaymentCategoryAndSearchButton_category-area__283Ul">
							<div class="HorizontalScrollWrapper_article__1bjeW" style="padding: 10px 20px; background-color: transparent; overflow-x: auto;">

								<ul class="SubFilter_article__3yTR-">
									<li class="SubFilter_item__2o8uJ"><div class="SubFilterItem_article__2Mick">
											<label class="SubFilterItem_label__1qXQf">배송진행 <em class="SubFilter_point__8P9fF"><span class="delivery"></span></em></label>
										</div></li>
									<li class="SubFilter_item__2o8uJ"><div class="SubFilterItem_article__2Mick">
											<label class="SubFilterItem_label__1qXQf">주문취소 <em class="SubFilter_point__8P9fF"><span class="cancelOrder"></span> </em>
											</label>
										</div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="Content_article__1rgzf">
				<div class="Accumulate_article__GnbEJ"></div>
				<div class="PaymentList_article__1wn-r">
					<ul class="PaymentList_list-payment__1fwB8">
						<c:forEach var="userorderlist" items="${userorderlist }">
							<li class="PaymentList_item-payment__3-5IU"><div class="PaymentItem_article__2cJ56">
									<div class="OrderStatus_article__8fznS">
										<strong class="OrderStatus_value__3OX-d">${userorderlist.orderStatus }</strong>
										<p class="OrderStatus_message__DTrxn"></p>
									</div>
									<div class="Product_article__3svXS">
										<div class="Product_thumbnail__z1kjf">
											<img src="images/pony_motors_log.jpg" width="76" height="76">
											<a href="myorderdetail?orderNo=${userorderlist.orderNo }" class="PaymentList_link-detail__I74mH">
												<span class="blind">자세히 보기</span>
											</a>
										</div>
										<div class="Product_info__2eRJ4">
											<span class="Product_date__2vtji"><c:set var="orderDateString" value="${userorderlist.orderDate}" /> <fmt:parseDate var="orderDate" value="${orderDateString}" pattern="yyyy-MM-dd" /> <fmt:formatDate value="${orderDate}" pattern="MM. dd" /> 결제 </span><strong class="Product_name__2hvoM"><span class="ProductName_article__zaafE">엔진오일 외 <span class="ordercount">${kind }</span>개
											</span></strong><span class="Product_price__3Ug1K"><fmt:formatNumber pattern="###,###,###원"> ${userorderlist.orderTotal }</fmt:formatNumber><span class="Product_icon__bdb1m"><svg xmlns="http://www.w3.org/2000/svg" width="46" height="16" viewBox="0 0 49 15">
													
													</svg></span></span>
											<div class="Product_detail__1Hktq">
												<span class="StatusLink_article__327cv">주문상세<span class="StatusLink_icon-arrow__1ZJuG"><svg width="6" height="10" viewBox="0 0 6 10">
														<path d="M1 1L5 5 1 9" transform="translate(-158 -528) translate(-5 417) translate(5) translate(20 48) translate(88 1) translate(0 60) translate(50 2)" stroke="#09aa5c" stroke-width=".9" fill="none" fill-rule="evenodd"></path></svg></span></span>
											</div>
											<a href="myorderdetail?orderNo=${userorderlist.orderNo }" class="PaymentList_link-detail__I74mH">
												<span class="blind">자세히 보기</span>
											</a>
										</div>
									</div>
									<!-- 주문취소 오류남 ㅎㅎ -->
									<ul class="OrderPaymentActionButtons_article__21iuu">
										<c:if test="${userorderlist.orderStatus == '배송준비중' }">
											<li class="OrderPaymentActionButtons_item-button__3Ok1c"><button class="ActionButton_article__2Tfs0 cancelbtn" data-orderNo="${userorderlist.orderNo}" style="background-color: #E2EFF3; font-weight: 700;">주문취소</button></li>
										</c:if>
										<c:if test="${userorderlist.orderStatus == '배송중' }">
											<li class="OrderPaymentActionButtons_item-button__3Ok1c"><button type="button" class="ActionButton_article__2Tfs0 ActionButton_highlight__2tQ-Z">구매확정</button></li>
										</c:if>
										<li class="OrderPaymentActionButtons_item-button__3Ok1c"><a href="/mypageqna">
												<button type="button" class="ActionButton_article__2Tfs0 claim">상품문의</button>
											</a></li>
									</ul>
								</div></li>
						</c:forEach>
					</ul>
					<form id="cancelForm" action="ordercancel" method="post">
						<input type="hidden" name="orderNo">
						<input type="hidden" name="memberNo" value="${memberNo}">
					</form>
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
	<script>
		$(".cancelbtn").on("click", function(e) {
			e.preventDefault();
			let no = $(this).data("orderNo");
			$("#cancelForm").find("input[name='orderNo']").val(no);
			$("#cancelForm").submit();
		});
	</script>
</body>
</html>