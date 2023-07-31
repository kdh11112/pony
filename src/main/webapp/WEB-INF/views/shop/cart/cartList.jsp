<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html lang="ko">
<head>

<title>PONY MOTORS</title>

<link href="css/admin/css/nav.css" rel="stylesheet" />
<link href="css/admin/css/cart/app.css" rel="stylesheet" />
<link href="css/admin/css/cart/global.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<style id="gnb_style" type="text/css"></style>
<script type="text/javascript" src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.18.0/gfp-sdk.js" charset="utf-8"></script>
<script src="https://ssl.pstatic.net/static.gn/js/clickcrD.js" id="gnb_clickcrD" charset="utf-8"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="css/mypage/js/scripts.js"></script>
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
							<button type="button" class="btn_check--31ufZfaM8S" id="check-all" role="checkbox" aria-checked="false">
								<span class="check--2GKphErdbj"><svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_check--3-_9ZRQGKX">
								<path d="M12.945 4L14.1 5.154 6.387 12.8 2 8.4l1.155-1.153 3.232 3.246L12.945 4z" fill="#C7CACD"></path></svg></span>전체 선택<span class="blind">선택안됨</span>
							</button>
						</div>
						<button type="button" class="btn_delete--3P5eHI2eDa">
							<svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_delete--2NfiVYXLHf">
						<path d="M13 2.5l.707.707-4.646 4.647 4.646 4.646-.707.707-4.646-4.646-4.647 4.646L3 12.5l4.647-4.646L3 3.207l.707-.707 4.647 4.647L13 2.5z" fill="#BDC0C6"></path></svg>
							<span class="none_280--1hzCgfasqV">선택</span> 삭제
						</button>
					</div>
				</div>
			</div>
			<div class="contents--2E6XJtdAJn">
				<div class="store_container--382-BRTlye M511263889">
					<div class="store_card--EAQK-9jWb0 expand">
						<div class="store_header--7wpCMVVbgW"></div>
						<div class="store_content--1atEHLZlpd">
							<div>
								<div class="products--zxkj6UbISb">
									<div class="products_info--HVXp_hAnl0">
										<div class="info--2I2hfPeviI">
											<div>
												<div class="product--BPAxWCQbvE">
													<div class="product_info--TaUyJVEOf0">
														<div class="cell--HIdeeyUnFa">
															<div class="product_description--Lh-hSnnkFf">
																<div class="check--2EZEnyir5V">
																	<button type="button" class="btn_check--31ufZfaM8S checked--2A5fgfRoYJ" role="checkbox" aria-checked="true">
																		<span class="check--2GKphErdbj"><svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_check--3-_9ZRQGKX">
																		<path d="M12.945 4L14.1 5.154 6.387 12.8 2 8.4l1.155-1.153 3.232 3.246L12.945 4z" fill="#C7CACD"></path></svg></span>
																	</button>
																</div>
																<div class="inner--1emXN2Ic_f">

																	<div class="info_area--2AT8d3T9eq">
																		<div class="title--2r7IrJqWav">엔진오일</div>
																		<div class="price--2Uv-07hf78">25,900원</div>
																	</div>

																</div>
															</div>
														</div>
														<div class="cell--HIdeeyUnFa">
															<div class="product_item--2aghEtsw40">
																<div class="option--1bwpDWrPvl">옵션 : 소나타 / 1개</div>
															</div>
															<button type="button" class="btn_modify--3dB-BgyPu5">주문수정</button>
														</div>
														<div class="cell--HIdeeyUnFa">
															<div class="list_price--1DcaXbXz9W">
																<div class="price_area--1eytys13Os total--2lIL693L7i">
																	<span class="title--1MQ9l0MwlN">상품금액</span><em><span class="num--1hENWZ6Uv8">25,900</span>원</em>
																</div>
															</div>
															<div class="m_only--3xDkIw7vDP"></div>
															<div class="order_buttons--2Fb79h6uWq">
																<button type="button">
																	<span class="none_280--1-kFXWiEW1">주문</span>수정
																</button>
															</div>
														</div>
													</div>
												</div>

											</div>
										</div>
										<div class="price--38egva9GaS">
											<div class="price_area--3Gj1SZEf9T">
												<span class="title--1eMhZQR6b8">배송비</span><em><span class="num--1rDSy6v0kt">3,000</span>원
													</em>
												<div class="desc--xy8RI3Ogkn">(3만원 이상 구매 시 배송비 무료)</div>
											</div>
											<div class="bundle_delivery_price--2lRQD9tvwa">
												<div class="price_area--YbK6aILyup">
													<span class="title--ZpNwRwHfIo">묶음배송비<span class="layer_area--wUHtUYOxVq"> </span></span><em><span class="desc--17xjQ2CGB9">위 2건 함께 주문 시 </span><span class="num"> 3,000</span>원</em>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="store_price--1ITT00wh3a">
								<div class="list_price--2q5Q85MYD-">
									<div class="sub_area--K_qcAIhSzX">
										<div class="price_area--jjAq5tYP9m">
											<span class="title--3G_o4_rhfc">선택상품금액</span><em><span class="num--37aOyGmdW1">56,000</span>원</em>
										</div>
										<span class="ico--2YmD3a15el"><svg width="15" height="14" viewBox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path fill="#C7C7C7" d="M.502 6h14v2h-14z"></path>
										<path fill="#C7C7C7" d="M6.502 0h2v14h-2z"></path></svg><span class="blind">더하기</span></span>
										<div class="price_area--jjAq5tYP9m">
											<span class="title--3G_o4_rhfc">총 배송비<span class="delivery_layer_area--24GraQM4cv"> </span></span><em><span class="num--37aOyGmdW1">3,000</span>원</em>
										</div>

									</div>
									<div class="total_area--a6Q91DyB5T">
										<div class="inner--2z0IE5sNLy">
											<div class="price_area--jjAq5tYP9m total--2a5HJtyfeD">
												<span class="title--3G_o4_rhfc">주문금액</span><em><span class="num--37aOyGmdW1">55,800</span>원</em>
											</div>
										</div>
									</div>
								</div>
								<div class="store_price_empty_area--1jjMvE5SXu"></div>
								<div class="link_area--14aJI6oflh">
									<a href="#" class="link_buy--KOU5pZhUVG"> &nbsp; 2건 주문하기 </a>
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
							<span class="title--cW4o5HCufH">총 주문금액</span><em><span class="num--2CYvhIm-m6">55,800</span>원 </em>
						</div>
						<button type="button" class="link_buy--jXvxZ8Agr-">
							총 주문하기<span class="badge--ltxr8Ih722">2</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
