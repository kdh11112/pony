<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<title>PONY MOTORS</title>
<link href="css/admin/css/order.css" rel="stylesheet" />
<link href="css/admin/css/ordersheet.css" rel="stylesheet" />
<link href="css/admin/css/common.css" rel="stylesheet" />
<link href="css/admin/css/nav.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<style id="gnb_style" type="text/css"></style>
<style>
.btn_editInfo {
	margin: -1px 0 1px 20px;
	height: 25px;
	vertical-align: middle;
	width: 68px;
	border: 1px solid #dcdee0;
	color: #303038;
	background-color: #fff;
	cursor: pointer;
	font-size: 12px;
	padding: 0;
	background: none;
	word-break: break-all;
	list-style: none;
}

.addr_list div {
	border-bottom: 1px solid #e5e5e5;
	width: 300px;
}

.addr_list li input {
	position: relative;
	text-align: left;
	height: 28px;
	line-height: 25px;
	width: 300px;
	padding-right: 5px;
	list-style: none;
	color: #1e1e23;
	letter-spacing: -0.5px;
	font-family: '나눔고딕', NanumGothic, '맑은고딕', MalgunGothic, '돋움', Dotum,
		Helvetica, sans-serif;
	font-size: 12px;
	display: table-cell;
	vertical-align: top;
	border: none;
}

.fold_heading span {
	height: 20px;
}

.deli_msg {
	margin-top: 10px;
}

.fold_heading {
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
}
.kakaopayimg{
	width: 40px;
	height: 20px;
	vertical-align: middle;
}
.tosspayimg {
	width: 40px;
	height: 20px;
	vertical-align: middle;
	padding-left: 3px;
}
</style>
<script type="text/javascript" src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.18.0/gfp-sdk.js" charset="utf-8"></script>
<script src="https://ssl.pstatic.net/static.gn/js/clickcrD.js" id="gnb_clickcrD" charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- 주소검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%--아임포트 라이브러리--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
	<!-- Navigation-->
	<jsp:include page="/WEB-INF/views/gnav.jsp" />
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
							<c:forEach var="cartItem" items="${cartItems }">
								<tbody>
									<tr class="seller_same_t" style="background-color: #FAFBFC !important;">
										<td>
											<span class="bdr"></span>
											<div class="product_info" style="padding-left: 110px;">
												<div class="product_dsc">
													<strong> <c:out value="${cartItem.partName}" />
													</strong>
													<div class="option">옵션: ${cartItem.modelName }</div>
												</div>
												<span class="vm"></span>
											</div>
										</td>
										<c:if test="${delivery == 0}">
											<td rowspan="3" style="padding-right: 20px;">
												<span class="deli_fee"><span class="sp_order ico_deli"></span><span class="sum _deliveryPrice2023072918466586">무료배송</span></span>

											</td>
										</c:if>
										<c:if test="${delivery == 3000}">
											<td rowspan="3" style="padding-right: 20px;">
												<span class="deli_fee"><span class="sp_order ico_deli"></span><span class="sum _deliveryPrice2023072918466586"><fmt:formatNumber pattern="###,###,###원">
															<c:out value="${delivery }" />
														</fmt:formatNumber></span></span>
											</td>
										</c:if>
										<td rowspan="2">${cartItem.cartCount}개</td>
										<td class="col_price_td" rowspan="2">
											<input type="hidden" id="cartTotal" value="${cartItem.partPrice * cartItem.cartCount}" />
											<strong><em class="_productOrderPayAmt2023072992390141"><fmt:formatNumber pattern="###,###,###원">
														<c:out value="${cartItem.partPrice * cartItem.cartCount}" />
													</fmt:formatNumber></em></strong>
										<!-- <td class="col_price"> -->
											<input type="hidden" class="parts_partNumber" name="" value="${cartItem.partNumber}" />
											<input type="hidden" class="parts_cartCount" name="" value="${cartItem.cartCount}" />
											<input type="hidden" class="parts_partName" name="" value="${cartItem.partName}" />
											<input type="hidden" class="parts_partPrice" name="" value="${cartItem.partPrice}" />
											<input type="hidden" class="parts_modelName" name="" value="${cartItem.modelName}" />
										<!-- </td> -->
										</td>
									</tr>
								</tbody>
							</c:forEach>
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
							<!-- 주문정보 전송 폼 -->
							<form action="/order" method="post" id="orderForm" class="orderForm">
								<ul class="addr_list _deliveryPlaces _deliveryPlaces_0">
									<li><div style="width: 210px !important;">
											<input type="text" id="orderRecipientName" name="orderRecipientName" value="${memDTO.memberName }" placeholder="수령인 성함을 입력해주세요" style="width: 210px !important;" />
										</div></li>
									<li><div style="width: 210px !important;">
											<input type="text" id="orderRecipientPhone" name="orderRecipientPhone" value="${memDTO.memberPhone }" placeholder="수령인 번호를 입력해주세요" style="width: 210px !important;" />
										</div></li>
									<li><div style="width: 210px !important;">
											<input type="text" id="orderRecipientZip" name="orderRecipientZip" style="float: left; width: 210px !important;" value="${memDTO.memberZip }" placeholder="우편번호" />
										</div>
										<button type="button" class="btn_editInfo" onclick="execDaumPostcode()">검색</button></li>
									<li><div>
											<input type="text" id="orderRecipientAddress" name="orderRecipientAddress" value="${memDTO.memberAddress1 }" placeholder="주소를 입력해주세요" />
										</div></li>
									<li><div>
											<input type="text" id="orderRecipientAddressDetail" name="orderRecipientAddressDetail" value="${memDTO.memberAddress2 }" placeholder="상세주소를 입력해주세요" />
										</div></li>
									<input type="hidden" name="orderPoint" id="orderPoint" value="" />
									<input type="hidden" name="memberNo" id="memberNo" value="${memDTO.memberNo }">
									<input type="hidden" name="memberName" id="memberName" value="${memDTO.memberName }">
									<input type="hidden" name="memberPhone" id="memberPhone" value="${memDTO.memberPhone }">
									<input type="hidden" name="memberEmail" id="memberEmail" value="${memDTO.memberEmail }">
									<input type="hidden" name="memberZip" id="memberZip" value="${memDTO.memberZip }">
									<input type="hidden" name="memberAddress" id="memberAddress" value="${memDTO.memberAddress1 }">
									<input type="hidden" name="memberDetailAddress" id="memberDetailAddress" value="${memDTO.memberAddress2 }">
									<input type="hidden" id="parts_totalPrice" name="parts_totalPrice" value="${cartItem.partNumber}" />
									<input type="hidden" id="orderTotal" name="orderTotal" value="" />
									<input type="hidden" id="orderSavePoint" name="orderSavePoint" value="" />
									<input type="hidden" id="orderDeliveryCharge" name="orderDeliveryCharge" value="" />
									<input type="hidden" id="orderPaymentTool" name="orderPaymentTool" value="" />
								</ul>
							</form>
							<script>
								function execDaumPostcode() {
									new daum.Postcode(
											{ oncomplete : function(data) {
													// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

													// 각 주소의 노출 규칙에 따라 주소를 조합한다.
													// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													var addr = ''; // 주소 변수
													var extraAddr = ''; // 참고항목 변수

													//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
													if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
														addr = data.roadAddress;
													} else { // 사용자가 지번 주소를 선택했을 경우(J)
														addr = data.jibunAddress;
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document.getElementById('orderRecipientZip').value = data.zonecode;
													document.getElementById("orderRecipientAddress").value = addr;
													// 커서를 상세주소 필드로 이동한다.
													document.getElementById("orderRecipientAddressDetail").value = '';
													document.getElementById("orderRecipientAddressDetail").focus();
												}
											}).open();
								}
							</script>
							<div class="_deliveryMemoOuter ">
								<strong class="_deliveryMemoHeader" style="display: none;">배송메모</strong>
								<div class="_deliveryMemoInner ">
									<div class="comments deliveryMemo">
										<p class="products_tit _deliveryMemoProductName deliverySingleMemo">
											엔진오일 외 <span class="totalKind_span">0</span>건
										</p>

										<div class="dropdown_wrap">
											<input type="text" placeholder="요청사항을 직접 입력합니다" title="배송 메세지" name="deliveryMemo" class="deli_msg placeholder _deliveryForm ">
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
								<li><span class="_memberEmailAddress">${memDTO.memberEmail }</span></li>
							</ul>
							<ul class="info_dsc">
								<li class="info_confirm"><span class="_telNoNoti _telNoInfo" style="display: block">주문자 정보로 결제관련 정보가 제공됩니다.<br>정확한 정보로 등록되어있는지 확인해주세요.
								</span></li>
							</ul>
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
											<span id="havepoint" class="value _remainTotalPointBalanceArea" value="${memDTO.memberPoint }">${memDTO.memberPoint }</span> <span class="measure _remainTotalPointMeasureArea ">원</span>
										</div>
									</div>
								</li>

								<li class="item_discount">
									<div class="area_label">
										<strong>사용</strong>
									</div>
									<div class="area_item">
										<div class="input_area _useNaverCashInputArea point_green">
											<!-- <input type="text" id="mileage" title="포인트" name="payAmounts" value="0" maxlength="7" onkeyup="updatePoint(this.value)"> -->
											<input type="text" id="mileage" title="포인트" name="payAmounts" value="0" maxlength="7">
											<span class="measure">원</span>
											<button type="button" class="btn_delete _clearPoint _click(nmp.front.order.order_sheet.clearPoint()) _stopDefault" style="display: none;">
												<span class="blind">사용 포인트 삭제</span>
											</button>
										</div>
										<button class="btn type_point_N" data-state="N">전액사용</button>
										<!-- <button class="btn type_point_Y" data-state="Y" style="display: none;">사용취소</button> -->
										<!-- <button class="btn type_npaypoint" data-state="N" onclick="useallpoint();">전액사용</button> -->
									</div>
								</li>
							</ul>
							<br /> <br />
							<script>
								/* 사용자가 포인트 입력 */
								$("#mileage")
										.on( "propertychange change keyup paste input",
												function() {
													/* 사용자가 가지고 있는 포인트를 최대값으로 설정 */
													const maxPoint = parseInt('${memDTO.memberPoint }');
													/* 사용자가 입력한 값 */
													console.log(maxPoint);
													let inputValue = parseInt($(this).val());
													/* 0보다 작은 값 입력하면 값은 0 고정 */
													if (inputValue < 0) {
														$(this).val(0);
														/* 보유 포인트보다 많은 값 입력하면 maxPoint 값으로 고정 */
													} else if (inputValue > maxPoint) {
														$(this).val(maxPoint);
													}
													setTotalInfo();
												});

								/* 포인트 전액사용 버튼 클릭 */
								$(".btn.type_point_N")
										.on( "click",
												function() {
													// function useallpoint() {
													const maxPoint = parseInt('${memDTO.memberPoint }');
													console.log(maxPoint);
													//let state = $(this).data("state");	
													const totalPrice = parseInt('${total}');
													console.log(totalPrice);
													if(totalPrice > maxPoint){
														$("#mileage").val(maxPoint);
														setTotalInfo();
													}else if(totalPrice <= maxPoint){
														$("#mileage").val(totalPrice);
														setTotalInfo();
													}
													/* if(state == 'N'){
														console.log("n동작");
														//값 변경
														$("#mileage").val(maxPoint);
														//글 변경
														$(".btn type_point").css("display", "inline-block");
														$(".btn type_point").css("display", "none");
														
													} else if(state == 'Y'){
														console.log("y동작");
														//값 변경
														$("#mileage").val(0);
														//글 변경
														$(".btn type_point").css("display", "none");
														$(".btn type_point").css("display", "inline-block");		
													}		 */

												});
							</script>
							<div class="payment_wrap ">
								<div class="payment">
									<ul class="paymethod_list _paymentsArea" style="display: block;">

										<li class="paymethod _payMethodTab _naverPaymentsCardTab">
											<div class="header">
												<span> <input type="radio" name="payradio" value="nice" checked="checked">
												</span> <label>카드결제</label> <em class="_generalPaymentAmount payment_price"><span class="finalTotal_span2"></span> 원</em>
											</div>
										</li>
										<li class="paymethod _payMethodTab _naverPaymentsCardTab">
											<div class="header has_detail">
												<span> <input type="radio" name="payradio" value="kakaopay">
												</span> <label>카카오페이</label><img src="images/kakao/kakaopay.png" class="kakaopayimg" /> <em class="_generalPaymentAmount payment_price"></em>
											</div>
										</li>
										<li class="paymethod _payMethodTab _naverPaymentsCardTab">
											<div class="header has_detail">
												<span> <input type="radio" name="payradio" value="tosspay">
												</span> <label>토스페이</label><img src="images/tosspay.png" class="tosspayimg" /> <em class="_generalPaymentAmount payment_price"></em>
											</div>
										</li>
									</ul>

									<dl class="spot_benefit_pay benefit_fold_panel _payEventHeader _benefitAreaDisplayStatus on" style="display: block;">
										<dt class="fold_heading">
											<span class="_click(nmp.front.order.order_sheet.togglePayEventInfo()) _stopDefault"> <strong>포인트 적립</strong><span class="benefit_spot_green">총 <em class="_totalBenefitMileageWithPayEvent"> <fmt:formatNumber pattern="###,###,###원">
															<c:out value="${point }" />
														</fmt:formatNumber>
												</em>
											</span>
											</span>
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
									<em class="_totalPayPrice"> <fmt:formatNumber pattern="###,###,###원">
											<c:out value="${total }" />
										</fmt:formatNumber>
									</em>
								</p>
							</div>
							<ul class="calc_list">
								<li><strong>상품금액</strong>
									<p>
										<em class="_totalOrderPrice"><fmt:formatNumber pattern="###,###,###원">
												<c:out value="${sum }" />
											</fmt:formatNumber></em>
									</p></li>

								<li><strong>배송비</strong>
									<p>
										<dummy class="_totalDeliveryFeeSign">+</dummy>
										<em class="_totalDeliveryFee"><fmt:formatNumber pattern="###,###,###원">
												<c:out value="${delivery }" />
											</fmt:formatNumber></em>
									</p></li>

								<li><strong>포인트 사용</strong>
									<p>
										<dummy class="_totalDeliveryFeeSign">-</dummy>
										<em id="usedPoint" class="_totalDeliveryFee"><span class="usePoint_span">0</span>원</em>
									</p></li>
							</ul>
							<ul class="total_list">

								<li class="_generalPaymentAmountArea total_item" style="display: list-item;"><strong class="price_sum_title _generalPaymentClass">총 결제금액</strong>
									<p class="price_sum_detail">
										<em class="_generalPaymentAmount"><span class="finalTotal_span">0</span>원</em>
									</p></li>
							</ul>
						</div>
						<input type="hidden" class="_totalPayAmount" value="">
					</div>

					<div class="payment_agree_wrap">
						<button class="btn_payment _click" onclick="iamport();">결제하기</button>
					</div>

				</div>
				<input type="hidden" name="_callback" value="nmp.front.order.order_sheet.refreshPage">
				<!-- </form> -->

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
	<script>
		$(document).ready(function() {
			setTotalInfo();
		});

		function setTotalInfo() {
			var totalPrice = 0;
			var orderdetailOrderQuantity = 0; //수량
			var totalKind = 0;
			var finaltotalKind = 0;
			var totalPoint = 0; //적립 포인트
			var deliveryPrice = 0;
			var usePoint = 0;
			var finalTotalPrice = 0;

			totalPrice = ${total};
			totalPoint = ${point};
			deliveryPrice = ${delivery};

			console.log(totalPrice);
			console.log(totalPoint);
			console.log(deliveryPrice);
			$(".col_price_td").each(
					function(index, element) {
						// 총 갯수
						orderdetailOrderQuantity += parseInt($(element).find(".parts_cartCount").val());
						// 총 종류
						totalKind += 1;
					});
			finaltotalKind = totalKind - 1;
			finalTotalPrice = totalPrice + deliveryPrice;

			/* 사용 포인트 */
			usePoint = $("#mileage").val();

			finalTotalPrice = totalPrice - usePoint;

			/* 값 삽입 */
			// 총 가격
			$(".totalPrice_span").html(totalPrice.toLocaleString());
			// 총 종류
			$(".totalKind_span").html(finaltotalKind);
			// 최종 가격(총 가격 + 배송비)
			$(".finalTotal_span").html(finalTotalPrice.toLocaleString());
			$(".finalTotal_span2").html(finalTotalPrice.toLocaleString());
			// 할인가(사용 포인트)
			$(".usePoint_span").html(usePoint.toLocaleString());
			//$("#orderdetailAmount").val(finalTotalPrice);
			$("#orderPoint").val(usePoint);
			$("#orderDeliveryCharge").val(deliveryPrice);
			$("#orderTotal").val(finalTotalPrice);
			$("#orderSavePoint").val(totalPoint);
			$("#orderdetailOrderQuantity").val(totalPoint);

		}
	</script>
	<script>
	/* 결제 기능 */
	function iamport() {
	    var name = $("#memberName").val();
	    var phone = $("#memberPhone").val();
	    var email = $("#memberEmail").val();
	    var postcode = $("#memberZip").val();
	    var address = $("#memberAddress").val() + " " + $("#memberDetailAddress").val();
	    var partName = $(".parts_partName").val();
	    var amount = $("#orderTotal").val();
	    var price = $("#total").text();
		
	    let selectedPaymentMethod = $("input[name='payradio']:checked").val();

	    if (selectedPaymentMethod === "kakaopay") {
	        iamportCommon(selectedPaymentMethod, "kakaopay.TC0ONETIME", partName, amount, email, name, phone, address, postcode);
	        $("#orderPaymentTool").val("kakaopay");
	    } else if (selectedPaymentMethod === "tosspay") {
	        iamportCommon(selectedPaymentMethod, "tosspay.tosstest", partName, amount, email, name, phone, address, postcode);
	        $("#orderPaymentTool").val("tosspay");
	    } else if (selectedPaymentMethod === "nice") {
	        iamportCommon(selectedPaymentMethod, "nice.iamport00m", partName, amount, email, name, phone, address, postcode);
	        $("#orderPaymentTool").val("nice");
	    }
	    //document.location.href = "/order" + rsp.imp_uid; 
	}
	
	function iamportCommon(selectedPaymentMethod, pg, partName, amount, email, name, phone, address, postcode) {
	    var IMP = window.IMP;
	    IMP.init("imp74705060"); // 예: imp00000000a

	    console.log(amount);
	    console.log(email);
	    console.log(name);
	    console.log(address);
	    console.log(postcode);

	    IMP.request_pay({
	        pg: pg,
	        pay_method: "card",
	        merchant_uid: new Date().getTime(),
	        name: partName,
	        amount: amount,
	        buyer_email: email,
	        buyer_name: name,
	        buyer_tel: phone,
	        buyer_addr: address,
	        buyer_postcode: postcode
	    }, function (rsp) {
	        console.log(rsp);

	        if (rsp.success) {
	            OrderInfo();
	            var msg = '결제가 완료되었습니다.';
	            msg += '고유ID : ' + rsp.imp_uid;
	            msg += '상점 거래ID : ' + rsp.merchant_uid;
	            msg += '결제 금액 : ' + rsp.paid_amount;
	            msg += '카드 승인번호 : ' + rsp.apply_num;
	            alert(msg);
				
	            
	            $.ajax({
	                type: "POST",
	                url: "/verifyIamport/" + rsp.imp_uid,
	                headers: { "Content-Type": "application/json" },
                    data: {
                        imp_uid: rsp.imp_uid,
                        merchant_uid: rsp.merchant_uid
                    }
	            }).done(function (data) {
	                console.log(data);

	                if (rsp.paid_amount == data.response.amount) {
	                    alert("결제 및 결제검증완료");
	                    location.replace('/orderend');
	                } else {
	                    cancelPayment(rsp.imp_uid);
	                }
	            });
	        } else {
	            var msg = '결제에 실패하였습니다.';
	            msg += '에러내용 : ' + rsp.error_msg;
	            alert(msg);
	            document.location.href = "/cartlist";
	        }
	    });
	
										}


		//주문 비즈니스 로직
		/* function orderProcess(data, imp_uid) {
			$.ajax({
				type : "POST",
				url : '/api/order',
				data : JSON.stringify(req_data),
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(rsp) {
					alert("결제되었습니다.");
					location.href = "/order/" + rsp.data;

				},
				error : function(xhr) {
					var errorResponse = JSON.parse(xhr.responseText);
					var errorMessage = errorResponse.errorMessage;
					alert(errorMessage);

					// 결제 취소 요청
					cancelPayment(imp_uid);
				}
			});
		} */

	function OrderInfo(){
		/* 상품정보 */
		let form_contents = '';
		let totalOrderdetailAmount = 0;
		$(".col_price_td")
				.each( function(index, element) {
					let partNumber = $(element).find(".parts_partNumber").val();
					let orderdetailOrderQuantity = $(element).find(".parts_cartCount").val();
					let partName = $(element).find(".parts_partName").val();
					let partPrice = $(element).find(".parts_partPrice").val();
					let modelName = $(element).find(".parts_modelName").val();

					let orderdetailAmount = partPrice * orderdetailOrderQuantity;
					totalOrderdetailAmount += orderdetailAmount;

					let partNumber_input = "<input name='orders[" + index + "].partNumber' type='hidden' value='" + partNumber + "'>";
					form_contents += partNumber_input;

					let orderdetailOrderQuantity_input = "<input name='orders[" + index + "].orderdetailOrderQuantity' type='hidden' value='" + orderdetailOrderQuantity + "'>";
					form_contents += orderdetailOrderQuantity_input;

					let partName_input = "<input name='orders[" + index + "].partName' type='hidden' value='" + partName + "'>";
					form_contents += partName_input;

					let partPrice_input = "<input name='orders[" + index + "].partPrice' type='hidden' value='" + partPrice + "'>";
					form_contents += partPrice_input;

					let modelName_input = "<input name='orders[" + index + "].modelName' type='hidden' value='" + modelName + "'>";
					form_contents += modelName_input;

					let orderdetailAmount_input = "<input name='orders[" + index + "].orderdetailAmount' type='hidden' value='" + orderdetailAmount + "'>";
					form_contents += orderdetailAmount_input;
				});
		$(".orderForm").append(form_contents);
		console.log(totalOrderdetailAmount); 
		/* 서버 전송 */
		$(".orderForm").submit();
		
	}
	</script>
</body>

</html>