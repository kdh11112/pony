<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<title></title>
<link href="css/admin/css/common.css" rel="stylesheet" />
<link href="css/admin/css/nav.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://ssl.pstatic.net/static.checkout/layout/202307261800/css/customer/chk_n_common.css">
<!-- <link href="css/admin/css/order/finalorder.css" rel="stylesheet" /> -->
<link type="text/css" rel="stylesheet" href="https://order.pstatic.net/202308/09_161200_1691565120/order_customer/static/css/service/front/order/ordersheet.css?1691577253961">
<style>
.logoimg {
	width: 100px;
	height: 80px;
	padding-left: 10px;
}

.ordernumber {
	display: block;
	padding: 10px 15px 9px;
	background: none;
	color: #222;
	font-size: 13px;
	line-height: 18px;
	text-decoration: none;
	letter-spacing: -0.5px;
	padding-top: 5px;
	color: #0A58CA;
}

.bill_content {
	padding-top: 20px !important;
	margin-top: 6px;
}

.scroll {
	margin-top: 54px !important;
}

.txt {
	margin: 93px 0 11px;
	width: 520px;
	height: 37px;
	background-position: 0 -260px;
	font-size: 16px;
	line-height: 19px;
	color: #000;
	padding: 0;
	background-color: #FAFAFA;
	padding-left: 70px;
}

.finalendmsg {
	color: #0A58CA;
	font-size: 33px;
	font-weight: bold;
	line-height: 65px;
}

.endmsg {
	color: black;
	font-size: 33px;
	font-weight: bold;
	line-height: 65px;
}

.orderendtxt_content {
	padding-top: 55px !important;
}

.product_dsc {
	width: 190px !important;
}

.product_list {
	padding-left: 15px;
}
</style>
</head>
<body class="w_bg1">
	<div id="wrap">
		<!-- u_skip -->
		<div id="u_skip"></div>
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
				<h1 class="display-4 fw-bolder">주문/결제</h1>
				<p class="lead fw-normal text-black-50 mb-0" style="font-size: 20px; color: #00000080;"></p>
			</div>
		</header>
		<!-- //header -->

		<!-- container -->
		<div id="container">
			<!-- content -->
			<div id="order" class="order_sc _root _cartDiv">
				<div class="order_header">
					<ol class="process">

					</ol>
				</div>

				<div class="order_content ">

					<div class="orderendtxt_wrap pointplus_info">
						<span class="top_line"></span>
						<div class="orderendtxt_content">
							<p class="txt">
								<span class="finalendmsg">주문이 정상적으로 완료</span><span class="endmsg">되었습니다.</span>
							</p>

						</div>
					</div>

					<div class="orderend_info">
						<div class="info_wrap">
							<h4>주문번호</h4>
							<span class="ordernumber"> <strong>2023081689911581</strong>
							</span>
						</div>

						<div class="info_wrap">
							<h4>배송지정보</h4>
							<div class="info_dsc">
								<ul>
									<li>정희진</li>
									<li>010-</li>
									<li>(0)</li>
								</ul>
							</div>
						</div>
						<dl class="benefit_fold_panel on spot_benefit_pay">
							<dt class="fold_heading">
								<a href="#" class="_click(nmp.front.order.order_sheet.result.togglePayEventInfo()) _stopDefault">
									<strong> 포인트 혜택 </strong> <span class="benefit_spot_green" style="color: #0A58CA;">400원</span>
								</a>
							</dt>
						</dl>

					</div>

					<div class="order_bill">
						<div class="bill_content">
							<span class="logo"><img src="images/pony_motors_log_cut.png" alt="" class="logoimg" /></span>
							<div class="scroll">
								<ul class="product_list">
									<li class="product_item">
										<div class="product_dsc">
											<p>- 망그러진 아기망곰 마스킹테이프 다꾸</p>
											<ul class="option_list">
												<li>옵션 :</li>
												<li>주문수량 : 개</li>
											</ul>
											<strong class="price"><em style="padding-left: 12px;">5,000</em>원</strong>
										</div>
									</li>

								</ul>
							</div>

							<!-- 주문금액 Start -->
							<div class="order_bill_info">
								<div class="sum">
									<strong class="price_sum_title">주문금액</strong>
									<p class="price_sum_detail" style="color: #0A58CA;">
										<em>8,000</em>원
									</p>
								</div>
								<ul class="calc_list">
									<li><strong>상품금액</strong>
										<p>
											<em>6,000</em>원
										</p></li>
									<li><strong>배송비</strong>
										<p>
											+<em>3,000</em>원
										</p></li>

								</ul>
							</div>
							<!-- 주문금액 End -->

							<!-- 결제상세 Start -->
							<div class="order_bill_info">
								<div class="sum">결제상세</div>
								<div class="area_payment_info">
									<div class="sum">
										<strong class="price_sum_title">포인트 사용</strong>
										<p class="price_sum_detail" style="color: #0A58CA;">
											<em>8,000</em>원
										</p>
									</div>
								</div>
							</div>
						</div>
						<span class="ob_bottom"></span>
					</div>


					<div class="cutting_line cutting_line_v3"></div>
					<div class="payment_agree_wrap">

						<a href="/myorderlist"><button class="" style="background-color: #0A58CA; border: none;" >
							<span class="txt_purchase">구매내역 보기</span>
						</button></a>
						<!--N=a:ctm.buylst-->
						<a href="/partall"><button class="" style="background-color: #0A58CA; border: none;">
							<span class="txt_shophome">부품 목록 가기</span>
						</button></a>
						<div class="shdw_bottom"></div>
					</div>
				</div>
			</div>
			<!-- //content -->
		</div>
		<!-- //container -->

		<!-- footer -->
		<footer class="py-5 bg-secondary" style="background-color: #6c757d !important;">
			<div class="container">
				<p class="m-0 text-center text-white" style="font-size: 16px;">Copyright &copy; Your Website 2023</p>
			</div>
		</footer>
		<!-- //footer -->

	</div>

</body>
</html>