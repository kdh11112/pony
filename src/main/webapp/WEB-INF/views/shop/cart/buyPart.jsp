<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>PONY MOTORS</title>
<link href="css/admin/css/order.css" rel="stylesheet" />
<link href="css/admin/css/ordersheet.css" rel="stylesheet" />
<link href="css/admin/css/common.css" rel="stylesheet" />
<link href="css/admin/css/nav.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<style id="gnb_style" type="text/css"></style>
<script type="text/javascript" src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.18.0/gfp-sdk.js" charset="utf-8"></script>
<script src="https://ssl.pstatic.net/static.gn/js/clickcrD.js" id="gnb_clickcrD" charset="utf-8"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

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
							<li><a class="dropdown-item" href="/myOrderList">내 주문내역</a></li>
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
			<h1 class="display-4 fw-bolder">주문/결제</h1>
			<p class="lead fw-normal text-black-50 mb-0" style="font-size: 20px; color: #00000080;">주문을 완료해주세요.</p>
		</div>
	</header>


	<!-- //header -->
	<section>
		<!-- container -->
		<div id="container">
			<!-- content 지우면안됨-->
			<div id="order" class="order_sc _root _cartDiv">

				<div class="order_header">
					<h3 class="order_payment">
						<span class="blind">주문/결제</span>
					</h3>
				</div>

				<form id="orderForm" name="orderForm" class="_orderForm" method="post">
					<input type="hidden" name="tempOrderId" value="">

					<div class="order_content" style="width: 1098px;">
						<div class="product_area">
							<span class="top_line"></span>
							<table cellspacing="0" class="tb_products">
								<caption>주문내역</caption>
								<colgroup>
									<col width="500">
									<col width="190">
									<col width="190">
									<col width="130">
									<col>
								</colgroup>
								<thead class="point_plus">
									<tr style="background-color: #FAFBFC !important;">
										<th scope="col" class="product" style="backgroud-color: #f0f0f0 !important;">상품정보</th>
										<th scope="col">배송비</th>
										<th scope="col">수량</th>
										<th scope="col" class="col_price">상품금액</th>
									</tr>
								</thead>
								<tbody>

									<tr class="seller_same_t" style="background-color: #FAFBFC !important;">
										<td>
											<span class="bdr"></span>
											<div class="product_info" style="padding-left: 130px;">
												<div class="product_dsc">
													<strong> 엔진오일 </strong>
													<div class="option">옵션: 소나타</div>
												</div>
												<span class="vm"></span>
											</div>
										</td>

										<td rowspan="3">
											<span class="deli_fee"><span class="sp_order ico_deli"></span><span class="sum _deliveryPrice2023072918466586">3,000원<a href="#" class="sp_order ico_que _deliveryFeeLayerBtn2023072918466586 _click(nmp.front.order.order_sheet.showLayerDeliveryFee(2023072992390142)) _stopDefault"></a></span><span class="_deliveryPriceText2023072918466586"></span></span>
										</td>

										<td rowspan="2">1개</td>
										<td class="col_price" rowspan="2">
											<strong><em class="_productOrderPayAmt2023072992390141">25,900</em>원</strong>
										</td>
									</tr>


								</tbody>
							</table>
							<div class="cutting_line" style="background-color: #FAFBFC !important;"></div>
						</div>
						<div class="destination_wrap">
							<div class="deliver_wrap _deliveryInfos _deliveryInfoType">
								<h4>
									<span class="blind">배송지정보</span>
								</h4>
								<div class="deliver_option_wrap">
									<strong class="req" title="필수입력">배송지 입력</strong>
								</div>
									<ul class="addr_list _deliveryPlaces _deliveryPlaces_0">
										<li>${memDTO.memberName }</li>
										<li>${memDTO.memberPhone }</li>
										<li>(${memDTO.memberZip }) ${memDTO.memberAddress1 } ${memDTO.memberAddress2 }
											<button class="btn _click(nmp.front.order.order_sheet.editDeliveryInfo()) _stopDefault">정보수정</button>
										</li>
									</ul>
<!-- 									<ul class="addr_list _deliveryPlaces _deliveryPlaces_0">
										<li><input type="text" name="" id="" /></li>
										<li><input type="text" name="" id="" maxlength="3"/>-<input type="text" name="" id="" maxlength="4"/>-<input type="text" name="" id="" maxlength="4"/></li>
										<li>(우편번호) 서울특별시 종로구 어쩌구 디아망 건물 4층
											<button class="btn _click(nmp.front.order.order_sheet.editDeliveryInfo()) _stopDefault">정보수정</button>
										</li>
									</ul> -->
								<div class="_deliveryMemoOuter ">
									<strong class="_deliveryMemoHeader" style="display: none;">배송메모</strong>
									<div class="_deliveryMemoInner ">
										<div class="comments deliveryMemo">
											<p class="products_tit _deliveryMemoProductName deliverySingleMemo">엔진오일 외 1건</p>

											<div class="dropdown_wrap">
												<input type="text" placeholder="요청사항을 직접 입력합니다" title="배송 메세지" name="deliveryMemo" class="deli_msg placeholder _deliveryForm deliverySingleMemo _click(nmp.front.order.order_sheet.showLatestDeliveryMemo()) _stopDefault">
											</div>
											<span class="length deliverySingleMemo">500자까지 입력 가능합니다.</span>
										</div>
									</div>
								</div>
								<p class="delivery">※ 제주도, 도서산간 지역의 경우 5000원의 배송비가 발생합니다.</p>
							</div>
							<div class="userinfo_wrap _purchaserInfo">
								<h4>주문자 정보</h4>
								<ul class="user_info">
									<li>${memDTO.memberName }</li>
									<li class="_telNoHighlight "><span class="_memberTelNumber">${memDTO.memberPhone }</span></li>
									<li><span class="_memberEmailAddress">ju*****@n*******.com</span></li>
								</ul>
								<ul class="info_dsc">
									<li class="info_confirm"><span class="_telNoNoti _telNoInfo" style="display: block">주문자 정보로 결제관련 정보가 제공됩니다.<br>정확한 정보로 등록되어있는지 확인해주세요.
									</span></li>
								</ul>
								<input type="hidden" name="order.memberName" value="${memDTO.memberName }">
								<input type="hidden" name="order.memberCellPhoneNo" value="010-3***-0***">
							</div>

						</div>
						<input type="hidden" name="prestigeKey" value="" class="_certificationForm">

						<div class="discount_wrap">
							<div class="discount_info discountPriceInfo">

								<div class="area_point_title _naverPointAreaTitle">
									<strong class="req type_paymoney"> <span class="npay_logo"></span>포인트 사용
									</strong>
								</div>
								<ul class="list_discount type_point _naverPointArea">

									<li class="item_discount">
										<div class="area_label point_balance">
											<strong>보유</strong>
										</div>

										<div class="area_item point_balance">
											<div class="input_area">
												<span class="value _remainTotalPointBalanceArea">${memDTO.memberPoint }</span> <span class="measure _remainTotalPointMeasureArea ">원</span>
											</div>
										</div>
									</li>

									<li class="item_discount">
										<div class="area_label">
											<strong>사용</strong>
										</div>
										<div class="area_item">
											<div class="input_area _useNaverCashInputArea point_green">
												<input type="text" id="mileage" title="네이버페이 포인트" name="payAmounts.NAVER_CASH" value="0" maxlength="7" class="_onlyPriceTarget _calculationDiscountTarget _mileageUseAmount _subPayMeans _blur(nmp.front.order.order_sheet.calculateTotalPriceOnBlurForNaverCash()) _focus(nmp.front.order.order_sheet.checkUseWithPayLater()) _payForm">
												<span class="measure">원</span>
												<button type="button" class="btn_delete _clearPoint _click(nmp.front.order.order_sheet.clearPoint()) _stopDefault" style="display: none;">
													<span class="blind">사용 포인트 삭제</span>
												</button>
											</div>
											<button class="btn type_npaypoint">전액사용</button>
										</div>
									</li>
								</ul>
								<br /> <br />

								<div class="payment_wrap ">

									<div class="payment">
										<ul class="paymethod_list _paymentsArea" style="display: block;">

											<li class="paymethod _payMethodTab _naverPaymentsCardTab">
												<div class="header">
													<span> <input type="radio" name="payradio" value="card">
													</span> <label>카드결제</label> <em class="_generalPaymentAmount payment_price">55,800원</em>
												</div>
											</li>
											<li class="paymethod _payMethodTab _naverPaymentsCardTab">
												<div class="header has_detail">
													<span> <input type="radio" name="payradio" value="transfer">
													</span> <label>무통장입금</label> <em class="_generalPaymentAmount payment_price off"></em>
												</div>
											</li>
										</ul>



										<dl class="spot_benefit_pay benefit_fold_panel _payEventHeader _benefitAreaDisplayStatus on" style="display: block;">
											<dt class="fold_heading">
												<a href="#" class="_click(nmp.front.order.order_sheet.togglePayEventInfo()) _stopDefault">
													<strong>포인트 적립</strong><span class="benefit_spot_green">총 <em class="_totalBenefitMileageWithPayEvent">2,940</em>원
													</span>
												</a>
											</dt>
										</dl>
									</div>
									<div class="agree_wrap">
										<div class="area_notice">
											<p class="notice">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</p>
										</div>
									</div>
								</div>
							</div>

							<div class="price_sum _paymentDetail">
								<h4>결제상세</h4>
								<div class="sum">
									<strong class="price_sum_title">주문금액</strong>
									<p class="price_sum_detail">
										<em class="_totalPayPrice">55,800</em>원
									</p>
								</div>
								<ul class="calc_list">
									<li><strong>상품금액</strong>
										<p>
											<em class="_totalOrderPrice">56,000</em>원
										</p></li>

									<li><strong>배송비</strong>
										<p>
											<dummy class="_totalDeliveryFeeSign">+</dummy>
											<em class="_totalDeliveryFee">3,000</em>원
										</p></li>
								</ul>
								<ul class="total_list">
									<li class="_payPointUsedAmountArea" style="display: none;"><strong class="price_sum_title">네이버페이 포인트 사용</strong>
										<p class="price_sum_detail">
											<em class="_usePayPointPrice">0</em> 원
										</p></li>
									<li class="_generalPaymentAmountArea total_item" style="display: list-item;"><strong class="price_sum_title _generalPaymentClass">총 결제금액</strong>
										<p class="price_sum_detail">
											<em class="_generalPaymentAmount">55,800</em> 원
										</p></li>
								</ul>
							</div>
							<input type="hidden" class="_totalPayAmount" value="55800">
						</div>

						<div class="payment_agree_wrap">
							<button class="btn_payment _click(nmp.front.order.order_sheet.account()) _stopDefault _doPayButton">결제하기</button>
						</div>

					</div>
					<input type="hidden" name="_callback" value="nmp.front.order.order_sheet.refreshPage">
				</form>

			</div>
		</div>
		<div style="padding: 30px;"></div>
	</section>
	<!-- footer -->
	<footer class="py-5 bg-secondary" style="background-color: #6c757d !important;">
		<div class="container">
			<p class="m-0 text-center text-white" style="font-size: 16px;">Copyright &copy; Your Website 2023</p>
		</div>
	</footer>

	<!-- //footer -->



</body>
</html>