<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title></title>
<link type="text/css" rel="stylesheet" href="https://img.pay.naver.net/static/css/mobile/layout.css">
<link type="text/css" rel="stylesheet" href="//img.pay.naver.net/o/mstatic/css/service/mobile/layout.css?1692005863197">
<link type="text/css" rel="stylesheet" href="//img.pay.naver.net/o/mstatic/css/service/mobile/component.css?1692005863197">
<link type="text/css" rel="stylesheet" href="//img.pay.naver.net/o/mstatic/css/service/mobile/buy.css?1692005863197">
<link type="text/css" rel="stylesheet" href="//img.pay.naver.net/o/mstatic/css/service/mobile/tiles/layout.css?1692005863197">
<link href="css/admin/css/common.css" rel="stylesheet" />
<link href="css/admin/css/nav.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.footerdiv {
	height: 200px;
}

.final_amount {
	color: #0A58CA !important;
}
.sjt{
	color: #0A58CA !important;
}
.bnr_info{
	padding-bottom: 30px;
}
.wrap_buy_box {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="wrap">
	<div class="u_skip"></div>

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
				<h1 class="display-4 fw-bolder">주문취소</h1>
				<p class="lead fw-normal text-black-50 mb-0" style="font-size: 20px; color: #00000080;"></p>
			</div>
		</header>
		<!-- //header -->
		
		
		<div class="container">
			<div id="ct" role="main" style="padding-top: 20px;">
				<form class="_reqForm" action="" method="post">
					<div class="bnr_info">
						<span class="inner"> <strong class="sjt">취소 신청이 완료되었습니다.</strong>
						</span>
					</div>
					<div name="productInfoList" class="wrap_buy_box box_product_list">
						<div class="wrap_buy_cont">
							<ul class="check_list reject_list complete">
								<li>
									<div class="box">
										<div class="inner">
											<div class="inner_cell thmb_cell">
												<span class="thmb"> <img src="https://img.pay.naver.net/o/proxy/phinf/shop1/20221111_65/1668095800482ux0Vj_PNG/69231628209369967_1812638268.png?type=m120" alt="망그러진 아기망곰 마스킹테이프 다꾸 폴꾸 데코 귀여운 캐릭터 종이테이프" width="69" height="69">
												</span>
											</div>
											<div class="inner_cell">
												<div class="txt_box"><strong class="name_product"> 망그러진 아기망곰 마스킹테이프 다꾸 </strong>
													<div class="amount">

														<em class="unit">5,000원</em> <em class="unit">1개</em>
													</div>
													<em class="dsc_charge"> 배송비 3,000 원 </em>
													<!-- <div class="button_inner">
														<button type="button" class="btn_cart _click" style="cursor: pointer;">장바구니 담기</button>
													</div> -->
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>

					<div class="wrap_buy_box box_amount">
						<div class="wrap_tit type_tit">
							<strong class="tit_txt"><span class="txt_inner">환불 예정금액</span></strong>
						</div>
						<div class="wrap_buy_cont final_box">
							<div class="final_amount">
								<strong class="cell_final"> 최종 환불 예정금액 </strong> <strong class="cell_final"><em class="num">8,000</em>원</strong>
							</div>
							<ul class="list_each">
								<li class="item_each"><strong class="cell_final">결제수단입력란</strong> <strong class="cell_final"><em class="num">8,000</em>원</strong></li>
							</ul>
						</div>
					</div>
					<div class="notice_section">
						<strong class="caution">확인해주세요.</strong>
						<p class="dsc">취소 처리 현황 및 추가 취소 요청은 결제내역에서 하실 수 있습니다.</p>
						<p class="dsc">주문번호 내 전체 상품이 취소요청되는 경우, 환불 예정금액은 취소진행중 상품금액과 합산되어 노출될 수 있습니다.</p>
					</div>
					<div class="button_section">
						<div class="button_area type_multi">
							<div class="button_area type_gray">
								<div class="button_bottom">
									<a href="/myorderlist" class="button">결제 내역</a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="footerdiv"></div>
		<link rel="stylesheet" href="//img.pay.naver.net/o/mstatic/css/service/mobile/tiles/layout.css">

		<footer class="py-5 bg-secondary" style="background-color: #6c757d !important;">
			<div class="container">
				<p class="m-0 text-center text-white" style="font-size: 16px;">Copyright &copy; Your Website 2023</p>
			</div>
		</footer>
	</div>
	<hr>
</body>
</html>