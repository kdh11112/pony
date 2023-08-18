<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>CarReservation</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/mypage/css/styles.css" rel="stylesheet" />
<link href="css/mypage/css/board.css" rel="stylesheet" />
<!-- <link href="js/mypage/testDrive.js" rel="stylesheet" /> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/carMaintenanceReservation/style.css" />
<script src="js/carMaintenanceReservation/carMaintenanceReservation.js"></script>

<style>
.content {
	box-sizing: border-box;
	width: 400px;
	flex: 1;
	overflow: auto;
}

.contant-area {
	flex: 1;
	width: 90%;
	margin: 10px auto;
	display: flex;
}

.content-body {
	border: 1px solid #dedede;
	box-sizing: border-box;
	width: 10vm;
	height: 800px;
	float: left;
}

#mycarinfo {
	border: 1px solid #dedede;
	box-sizing: border-box;
	width: 800px;
	height: 800px;
	margin: 0px 1%;
	float: right;
}

.title {
	margin: 0 30px;
}

.no-car, .sub {
	margin: 0 30px;
}

.head {
	margin: 20px 60px;
}

.infomodify_btn {
	margin-left: 13px;
}

.mycarTitle {
	margin-top: 20px;
}

#summernote {
	width: 100%;
	boarder: 0.5px solid #dedede;
}

textarea {
	resize: none;
}

.boardtitle {
	width: 100%;
}

#carregibox {
	float: right;
}

.carregiGo {
	float: right;
	margin-left: 10px;
	margin-right: 30px;
}

.carregidelete {
	float: right;
}

.shop-no-btn {
	background-color: #f19797;
	font-weight: bold;
}

.Calendar>thead>tr:first-child>td {
	font-size: 1.7em;
	font-weight: bold;
	color: #5E5E5E;
}

.Calendar>thead>tr:last-child>td {
	font-weight: bold;
	background-color: rgb(134, 167, 236);
	color: white;
	border: 1px solid white;
}

.Calendar {
	width: 100%;
}

.Calendar>tbody>tr>td>p {
	height: 70px;
	border-radius: 45px;
	transition-duration: .2s;
	line-height: 45px;
	margin: 2.5px;
	display: block;
	text-align: center;
}

.pastDay {
	color: lightgray;
	border: 1px solid #E4DCD3;
}

.today {
	width: 14.28%;
	color: white;
	font-weight: bold;
	background-color: rgb(193, 220, 255);
	cursor: pointer;
}

.futureDay {
	background-color: #FFFFFF;
	cursor: pointer;
	border: 1px solid #E4DCD3;
	font-weight: 600;
	color: #5E5E5E;
}

.CalendarArea {
	background-color: white;
	height: auto;
	width: 100%;
	margin: 0px;
	padding: 20px;
	margin: 0 auto;
	border-radius: 5px;
	box-shadow: 0px 40px 30px -20px rgba(0, 0, 0, 0.3);
}
</style>

<!-- <script type="text/javascript">
$(document).ready(function() {
	  $('.accordion-title').on('click', function() {
	    // 아코디언 컨텐츠가 열릴 때마다 footer 위치 업데이트
	    updateFooterPosition();
	  });
	});

	function updateFooterPosition() {
	  var contentHeight = $('.content').outerHeight();
	  var windowHeight = $(window).height();
	  var scrollTop = $(window).scrollTop();
	  var footerHeight = $('.footer').outerHeight();

	  if (contentHeight + footerHeight > windowHeight) {
	    // 아코디언 컨텐츠가 열려 스크롤이 발생할 경우
	    var distanceFromBottom = contentHeight - (scrollTop + windowHeight);
	    var newFooterPosition = Math.max(0, footerHeight - distanceFromBottom);

	    $('.footer').css('bottom', newFooterPosition + 'px');
	  } else {
	    // 스크롤이 발생하지 않을 경우
	    $('.footer').css('bottom', '0');
	  }
	}
</script> -->

</head>
<body>
	<div id="wrapper">
		<!-- Navigation-->
		<jsp:include page="/WEB-INF/views/gnav.jsp" />

		<!-- Header-->
		<header>

			<img src="images/cloud.jpg" alt="" />
			<div class="header-content text-center text-black">

				<p class="lead fw-normal text-black-50 mb-0"></p>
			</div>

		</header>
		<!-- Section-->
		<div id="whiteBar"></div>
		<div class="top-title text-center">
			<h1 class="top-title-text">정비예약신청</h1>
			<h1 class="top-title-text2">온라인 예약으로 고객님이 원하시는 장소와 시간에 차량관리를 받을
				수 있습니다.</h1>
		</div>
		<div class="testDriveContent text-center">
			<form action="/insertCarMaintenanceReservation" id="frm"
				method="post">
				<input type="hidden" name="clientCarNumber" id="clientCarNumber">
				<input type="hidden" name="selectedShopNo" id="selectedShopNo" /> <input
					type="hidden" name="selectedSchedule" id="selectedSchedule" /> <input
					type="hidden" name="reservationClientRequests2"
					id="reservationClientRequests" />
				<!-- =============================아코디언 영역============================= -->
				<div class="accordion" id="accordionExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button collapsed" id="headingOneBtn"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseOne" aria-expanded="false"
								aria-controls="collapseOne">나의 정비차량 선택하기</button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<div class="row justify-content-center">
									<div class="card mx-auto" style="width: 32rem;">


										<c:if test="${!hasCars}">
											<div class="no-car" data-v-269e3e5f>
												<span class="ico-nocar" data-v-269e3e5f><i
													data-v-269e3e5f>등록된 차가 없습니다.</i></span>
												<p data-v-269e3e5f>등록된 차량이 없습니다.</p>
												<p>
													<a href="/carregigo">차량등록하러가기</a>
												</p>
											</div>
										</c:if>
										<c:if test="${!empty userCars  }">
											<!-- 등록차량리스트 -->

											<div class="page-title">
												<div class="container">
													<h3>나의 차량목록</h3>
												</div>
											</div>

											<!-- board list area -->



											<div id="inquiry_list">
												<div class="container">
													<table class="board-table">
														<thead>
															<tr>
																<th scope="col" class="th-num">차량선택</th>
																<th scope="col" class="th-num">차대번호</th>
																<th scope="col" class="th-title">차량번호</th>
																<th scope="col" class="th-date">주행거리</th>
																<th scope="col" class="th-date">차종</th>
																<th scope="col" class="th-date">출고일</th>
																<th scope="col" class="th-date">생산일</th>
																<th scope="col" class="th-date">색상</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="clist" items="${userCars }">
																<tr class="list">
																	<td>
																		<!-- 등록된 차량 삭제 체크 박스 --> <input type="radio"
																		name="selectedCars" value="${clist.clientCarNumber}"
																		id="selectedCarsId">
																	</td>
																	<td>${clist.clientVin }</td>
																	<td id="selectedCarName">${clist.clientCarNumber }</td>
																	<td>${clist.clientDistanceDriven }</td>
																	<td>${clist.clientCarType }</td>
																	<td>${clist.clientShipDate }</td>
																	<td>${clist.clientProductionDate }</td>
																	<td>${clist.clientColor }</td>
																</tr>
															</c:forEach>

														</tbody>

													</table>
												</div>
											</div>
										</c:if>

										<p class="card-text"></p>

										<div class="card-body"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button collapsed" id="headingTwoBtn"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseTwo" aria-expanded="false"
								aria-controls="collapseTwo">장비소 선택하기</button>
						</h2>
						<div id="collapseTwo" class="accordion-collapse collapse"
							aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<div class="find-shop-area row">
									<div class="col-md-6" style="border-right: 1px solid #D1D1D1;">
										<div>
											<input type="text" value="" placeholder="검색할 지역을 입력해주세요"
												id="shopAreaFind" name="shopAreaFind" />
										</div>
										<div>
											<button type="button" class="btn btn-primary"
												id="shopFindBtn">검색</button>
										</div>
									</div>
									<div class="col-md-6">
										<div class="shop-area">
											<button type="button" class="shop-area-btn btn btn-primary"
												value="서울" id="서울">서울</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="부산" id="부산">부산</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="대구" id="대구">대구</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="인천" id="인천">인천</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="광주" id="광주">광주</button>
										</div>
										<div class="shop-area">
											<button type="button" class="shop-area-btn btn btn-primary"
												value="대전" id="대전">대전</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="경기" id="경기">경기</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="경남" id="경남">경남</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="경북" id="경북">경북</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="전남" id="전남">전남</button>
										</div>
										<div class="shop-area">
											<button type="button" class="shop-area-btn btn btn-primary"
												value="전북" id="전북">전북</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="제주" id="제주">제주</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="충남" id="충남">충남</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="충북" id="충북">충북</button>
											<button type="button" class="shop-area-btn btn btn-primary"
												value="세종" id="세종">세종</button>
										</div>
									</div>
								</div>
								<div class="shop-area-point row"></div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingThree">
							<button class="accordion-button collapsed" id="headingThreeBtn"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseThree" aria-expanded="false"
								aria-controls="collapseThree">정비소 방문날짜 선택하기</button>
						</h2>
						<div id="collapseThree" class="accordion-collapse collapse"
							aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<div class="CalendarArea">
									<table class="Calendar">
										<thead>
											<div id="shopAreaPointName"></div>
											<tr>
												<td onClick="prevCalendar();" style="cursor: pointer;"
													id="prevC">&#60;</td>
												<td colspan="5"><span id="calYear"></span>년 <span
													id="calMonth"></span>월</td>
												<td onClick="nextCalendar();" style="cursor: pointer;"
													id="nextC">&#62;</td>
											</tr>
											<tr>
												<td>일</td>
												<td>월</td>
												<td>화</td>
												<td>수</td>
												<td>목</td>
												<td>금</td>
												<td>토</td>
											</tr>
										</thead>

										<tbody>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFour">
							<button class="accordion-button collapsed" id="headingFourBtn"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapseFour" aria-expanded="false"
								aria-controls="collapseFour">정비요청사항</button>
						</h2>
						<div id="collapseFour" class="accordion-collapse collapse"
							aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							<div class="accordion-body">

								<textarea class="form-control" id="reservationClientRequests"
									name="reservationClientRequests" rows="3"></textarea>
							</div>
						</div>
					</div>
				</div>

				<div style="margin-top: 50px;">
					<button class="btn" id="OkBtn" type="button"
						style="margin-bottom: 50px;">신청하기</button>
				</div>
			</form>
		</div>
		<!-- Footer-->
		<!-- <footer class="py-5 bg-secondary" >
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2023</p>
			</div>
		</footer> -->
	</div>


</body>
</html>
