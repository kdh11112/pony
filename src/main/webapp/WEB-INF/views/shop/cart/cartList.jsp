<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>PONY MOTORS</title>
<link href="css/admin/css/nav.css" rel="stylesheet" />
<link href="css/admin/css/cart/app.css" rel="stylesheet" />
<link href="css/admin/css/cart/global.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<style id="gnb_style" type="text/css"></style>
<style>
.product_info--TaUyJVEOf0 {
	border-bottom: 1px solid #ececef;
}
.input_check, .chkbox {
	display: inline-block;
	margin: 2px;
	vertical-align: top;
	width: 20px;
	height: 20px;
	margin-right: 15px;
	border: 1px solid #0A58CA;
	border-radius: 2px;
	vertical-align: top;
	font-size: 16px;
	line-height: 20px;
	background-color: #0A58CA;
	accent-color: #0A58CA;
	position: relative;
	font-weight: bold;
	z-index: 10;
	padding: 0;
	-webkit-text-size-adjust: none;
}
.check_box--1f8iu11KzL {
	font-size: 16px;
	text-align: left;
	font-weight: bold;
}
.info_area--2AT8d3T9eq p {
	color: gray;
	font-size: small;
}
.option--1bwpDWrPvl {
	position: relative;
	width: 42px;
	height: 25px;
	text-align: left;
	margin-left: 0px;
	margin-right: 0px;
	padding-top: 0px important;
	padding: 0px important;
}
.option--1bwpDWrPvl input {
	position: absolute;
	width: 30px;
	height: 25px;
	text-align: center;
	border: 1px solid #d5d9dc;
	/* border-right: 0px; */
	line-height: 19px;
	font-size: 12px;
	color: #4c4848;
	left: 0;
	border-radius: 4px;
	
}
.quantity_btn {
	position: absolute;
	border: 1px solid #d5d9dc;;
	color: #0A58CA;
	width: 14px;
	height: 13px;
	padding: 0px;
	background-color: #fff;
	font-weight: bold;
	font-size: 7px;
	vertical-align: middle;
}
.plus_btn {
	top: 0;
	right: 0
}
.minus_btn {
	bottom: 0;
	right: 0
}
.pointspan,
.pointspan2 {
	font-size: 70%;
}
.price_area--jjAq5tYP9m total--2a5HJtyfeD{
	text-align: right;
}
</style>
<script type="text/javascript" src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.18.0/gfp-sdk.js" charset="utf-8"></script>
<script src="https://ssl.pstatic.net/static.gn/js/clickcrD.js" id="gnb_clickcrD" charset="utf-8"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="css/mypage/js/scripts.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
							<li><a class="dropdown-item" href="/partall">모든 상품보기</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="/cartlist">장바구니</a></li>
							<li><a class="dropdown-item" href="/myorderlist">내 주문내역</a></li>
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
			<h1 class="display-4 fw-bolder">장바구니</h1>
			<p class="lead fw-normal text-black-50 mb-0" style="font-size: 20px; color: #00000080;">주문을 완료해주세요.</p>
		</div>
	</header>
	<div id="app">
		<div class="cart--3ESq5SxCdE pc_type">
			<div class="check_all--mLXOEtPdIW">
				<div class="fixed_area--3onkZminap">
					<div class="inner--3_4mSHtQSw">
						<div class="check_box--1f8iu11KzL">
							<input type="checkbox" id="allCheck" name="allCheck" class="input_check">
							전체 선택
							<script>
								$("#allCheck").click(function() {
									var chk = $("#allCheck").prop("checked");
									if (chk) {
										$(".chkbox").prop("checked", true);
										itemSum();
									} else {
										$(".chkbox").prop("checked", false);
										itemSum();
									}
								});
							</script>
						</div>
						<button type="button" class="btn_delete--3P5eHI2eDa" id="selectDelete_btn">
							<svg width="16" height="16" viewBox="0 0 16 16" fill="none" class="ico_delete--2NfiVYXLHf">
						<path d="M13 2.5l.707.707-4.646 4.647 4.646 4.646-.707.707-4.646-4.646-4.647 4.646L3 12.5l4.647-4.646L3 3.207l.707-.707 4.647 4.647L13 2.5z" fill="#BDC0C6"></path></svg>
							<span class="none_280--1hzCgfasqV">선택</span> 삭제
						</button>
					</div>
					<script>
						$("#selectDelete_btn").click(function(e) {
							e.preventDefault();
							var confirm_val = confirm("정말 삭제하시겠습니까?");
							 
                            if (confirm_val) {
								var checkArr = new Array();
	
								$("input[class='chkbox']:checked").each(function() {
									checkArr.push($(this).attr("data-cartNo"));
								});
	
								$.ajax({
									url : "/deleteCart",
									type : "post",
									data : {
										chkbox : checkArr
									},
									success : function() {
										location.href = "/cartlist";
									}
								});
                            }
						});
					</script>
				</div>
			</div>
			<script>
				/* 숫자에 콤마 */
				function makePrice(data) {
					return data.toString()
							.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				}
				function itemSum() {
					var str = "";
					var sum = 0;
					var orderDeliveryCharge = 0;
					var finalTotalPrice = 0;
					var count = $(".chkbox").length;
					var totalKind = 0;
					var point = 0;
					
					for (var i = 0; i < count; i++) {
						if ($(".chkbox")[i].checked == true) {
							sum += parseInt($(".chkbox")[i].value);
							point += Math.floor(parseInt($(".chkbox")[i].value*0.05));
							totalKind += 1;
						}
					}
					/* 배송비 */
					if (sum >= 30000) {
						orderDeliveryCharge = 0;
					} else if (sum == 0) {
						orderDeliveryCharge = 0;
					} else {
						orderDeliveryCharge = 3000;
					}
					/* 최종 가격 */
					finalTotalPrice = sum + orderDeliveryCharge;
					$("#total_Count").html(totalKind);
					$("#total_sum").html(makePrice(sum));
					$("#delivery").html(makePrice(orderDeliveryCharge));
					$("#delivery2").html(makePrice(orderDeliveryCharge));
					$("#finalTotalPrice").html(makePrice(finalTotalPrice));
					$("#finalTotalPrice2").html(makePrice(finalTotalPrice));
					$("#finalPoint").html(makePrice(point));
					/* hidden에 값 넣기 */
					$("#amount_form").val(sum);
					$("#delivery_form").val(delivery);
					$("#point_form").val(point);
					
				}
			</script>
			<div class="contents--2E6XJtdAJn">
				<div class="store_container--382-BRTlye M511263889">
					<div class="store_card--EAQK-9jWb0 expand">
						<div class="store_header--7wpCMVVbgW"></div>
						<div class="store_content--1atEHLZlpd">
							<div>
								<div class="products--zxkj6UbISb">
									<div class="products_info--HVXp_hAnl0">
										<div class="info--2I2hfPeviI">
											<c:forEach var="usercart" items="${usercart }">
												<div>
													<div class="product--BPAxWCQbvE">
														<div class="product_info--TaUyJVEOf0">
															<div class="cell--HIdeeyUnFa">
																<div class="product_description--Lh-hSnnkFf">
																	<div class="check--2EZEnyir5V">
																		<input type="checkbox" name="RowCheck" class="chkbox" onClick="itemSum()" value="${usercart.cartTotal }" data-cartNo="${usercart.cartNo }">
																	</div>
																	<div class="inner--1emXN2Ic_f">
																		<div class="info_area--2AT8d3T9eq">
																			<div class="title--2r7IrJqWav">${usercart.partName }</div>
																			<p>옵션 : ${usercart.modelName }</p>
																		</div>
																	</div>
																</div>
															</div>
															<div class="cell--HIdeeyUnFa">
																<div class="product_item--2aghEtsw40">
																	<div class="option--1bwpDWrPvl">
																		<input type="text" style="width: 25px;" value="${usercart.cartCount }">
																		<button class="quantity_btn plus_btn">+</button>
																		<button class="quantity_btn minus_btn">-</button>
																	</div>
																</div>
																<button type="button" class="btn_modify--3dB-BgyPu5" data-cartNo="${usercart.cartNo}">주문수정</button>
																<!-- 주문 수량 수정 -->
																<form action="/modifyCart" method="post" class="count_modify_form">
																	<input type="hidden" name="cartNo" class="update_cartNo" />
																	<input type="hidden" name="cartCount" class="update_cartCount" />
																	<input type="hidden" class="firstcartCount" value=${usercart.cartCount } />
																	<input type="hidden" class="partNo_input" value="${usercart.partNo}">
																	<input type="hidden" name="memberNo" value="${usercart.memberNo }" />
																</form>
															</div>
															<div class="cell--HIdeeyUnFa">
																<div class="list_price--1DcaXbXz9W">
																	<div class="price_area--1eytys13Os total--2lIL693L7i">
																		<span class="title--1MQ9l0MwlN">상품금액</span><em><span class="num--1hENWZ6Uv8"><fmt:formatNumber pattern="###,###,###" value="${usercart.cartTotal }" /></span>원</em>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<td class=cart_info>
												<form action="/buypartorder" method="post" autocomplete="off" id="orderForm">
													<input type="hidden" name="amount_form" id="amount_form" value="">
													<input type="hidden" name="chkbox[]_form" id="chk_form" value="">
													<input type="hidden" name="delivery_form" id="delivery_form" value="">
													<input type="hidden" name="point_form" id="point_form" value="">
												</form>
<%-- 													<input type="hidden" class="partPrice_input" value="${usercart.partPrice}">
													<input type="hidden" class="cartCount_input" value="${usercart.cartCount}">
													<input type="hidden" class="totalPrice_input" value="${usercart.partPrice * usercart.cartCount}">
													<input type="hidden" class="delivery_input" value="${usercart.partPrice * usercart.cartCount}"> --%>
												</td>
											</c:forEach>
										</div>
										<div class="price--38egva9GaS">
											<div class="price_area--3Gj1SZEf9T">
												<span class="title--1eMhZQR6b8">배송비</span><em><span class="num--1rDSy6v0kt" id="delivery"></span>원 </em>
												<div class="desc--xy8RI3Ogkn">(3만원 이상 구매 시 배송비 무료)</div>
											</div>
											<div class="bundle_delivery_price--2lRQD9tvwa">
												<div class="price_area--YbK6aILyup"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="store_price--1ITT00wh3a">
								<div class="list_price--2q5Q85MYD-">
									<div class="sub_area--K_qcAIhSzX">
										<div class="price_area--jjAq5tYP9m">
											<span class="title--3G_o4_rhfc">선택상품금액</span><em><span class="num--37aOyGmdW1" id="total_sum"></span>원</em>
										</div>
										<span class="ico--2YmD3a15el"><svg width="15" height="14" viewBox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path fill="#C7C7C7" d="M.502 6h14v2h-14z"></path>
										<path fill="#C7C7C7" d="M6.502 0h2v14h-2z"></path></svg></span>
										<div class="price_area--jjAq5tYP9m">
											<span class="title--3G_o4_rhfc">총 배송비<span class="delivery_layer_area--24GraQM4cv"> </span></span><em><span class="num--37aOyGmdW1" id="delivery2"></span>원</em>
										</div>
									</div>
									<div class="total_area--a6Q91DyB5T">
										<div class="inner--2z0IE5sNLy">
											<div class="price_area--jjAq5tYP9m total--2a5HJtyfeD">
												<span class="title--3G_o4_rhfc">주문금액</span><em><span class="num--37aOyGmdW1" id="finalTotalPrice2"></span>원</em>
												<br /><span class="pointspan">(적립예정 <span class="pointspan2" id="finalPoint"></span>원)</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<ul class="notice--WcNb-89c6_">
				<li>장바구니 상품은 <em>최대 30일간 저장</em>됩니다.
				</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
				<li>일부 상품의 경우 카드 할부기간이 카드사 제공 기간보다 적게 제공될 수 있습니다.</li>
			</ul>
			<div class="banner--2RTE2HmuHK">
				<div id="cart_ad">
					<div style="width: 100%; height: auto; margin: 0px auto; line-height: 0;">
						<iframe id="cart_ad_tgtLREC" frameborder="no" scrolling="no" tabindex="0" name="" title="AD" style="width: 100%; height: 67px; visibility: inherit; border: 0px; vertical-align: bottom;"></iframe>
					</div>
				</div>
			</div>
			<div class="floating_area--3yEuORHlfZ">
				<div class="inner--2zhHC3FZRa">
					<div class="buy_area--1s7Qe73yzk">
						<div class="btn_expand--2d-FsCrHVi">
							<span class="title--cW4o5HCufH">총 주문금액</span><em><span class="num--2CYvhIm-m6" id="finalTotalPrice"> </span>원 </em>
						</div>
						<button type="button" class="link_buy--jXvxZ8Agr-">
							총 주문하기<span class="badge--ltxr8Ih722" id="total_Count"></span>
						</button>
						<script>
							$(".link_buy--jXvxZ8Agr-").click(function(e) {
								e.preventDefault();
								var checkArr = new Array();

								$("input[class='chkbox']:checked").each(function() {
									checkArr.push($(this).attr("data-cartNo"));
									//alert(checkArr);
								});
								$("#chk_form").val(checkArr);
								$.ajax({
									url : "/buypartorder",
									type : "post",
									data : {chkbox : checkArr},
									success : function(response){
										$("#orderForm").submit();
										location.href = "/buypart";
									}
								
								});
							});
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var tt = "${cart}";
		if (tt == 'false') {
			$("#allCheck").prop("checked", false);
		} else {
			$("#allCheck").prop("checked", true);
			$(".chkbox").prop("checked", true);
			itemSum();
		}
		/* 수량버튼 */
		$(".plus_btn").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			$(this).parent("div").find("input").val(++quantity);
		});
		$(".minus_btn").on("click", function() {
			let quantity = $(this).parent("div").find("input").val();
			if (quantity > 1) {
				$(this).parent("div").find("input").val(--quantity);
			}
		});
		
		/* 수량수정버튼 */
		$(".btn_modify--3dB-BgyPu5").on("click", function() {
			
			/* input:text */
		    let updateCartCountInput = $(this).parent("div").find("input");
		    /* 기존 수량 */
			let cartCount = $(this).parent("div").find(".firstcartCount").val();
		    
		    /* 컨트롤러로 보내서 update */
		    let updateCartCount = updateCartCountInput.val();
			let cartNo = $(this).data("cartno");
			let partNo = $(this).parent("div").find(".partNo_input").val();
			
			updateCartCount = parseInt(updateCartCount);
			cartCount = parseInt(cartCount);
			
		    partNo = parseInt(partNo);
					/* alert(stockQuantity) ; */
					/* 수정하려는 수량이 재고 수량보다 많을 경우, 경고 메세지를 표시 */
					if (updateCartCount > partNo) {
						alert("입력 수량은 주문 가능 수량을 초과할 수 없습니다. \n(주문가능 수량 : "
								+ partNo + ")");
						/* input의 값을 기존 수량으로 되돌림 */
						updateCartCountInput.val(cartCount);
						return;
					}

					$(".update_cartNo").val(cartNo);
					$(".update_cartCount").val(updateCartCount);
					$(".count_modify_form").submit();
				});
	</script>
</body>
</html>
