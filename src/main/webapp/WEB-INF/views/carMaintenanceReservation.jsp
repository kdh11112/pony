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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/mypage/css/styles.css" rel="stylesheet" />
<link href="css/mypage/css/board.css" rel="stylesheet" />
<!-- <link href="js/mypage/testDrive.js" rel="stylesheet" /> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/carMaintenanceReservation/style.css" />
<script src="css/mypage/js/testDrive.js"></script>

<style>
.content {
	box-sizing: border-box;
	width: 400px;
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

</head>
<body>
	<div id="wrapper">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="#!"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#!"></a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="#!">All Products</a></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item" href="#!">Popular Items</a></li>
								<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
							</ul></li>
					</ul>
					<form class="form-inline">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-secondary my-2 my-sm-0"
							type="submit">검색</button>
					</form>
				</div>
			</div>
		</nav>
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
			<h1 class="top-title-text2">온라인 예약으로 고객님이 원하시는 장소와 시간에 차량관리를 받을 수 있습니다.</h1>
		</div>
		<div class="testDriveContent text-center">
		<form action="/testDriveInsert" id="frm" method="post">
			<!-- =============================아코디언 영역============================= -->
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingZero">
						<button class="accordion-button collapsed" id="headingZeroBtn"
							type="button"
							data-bs-target="#collapseOne" aria-expanded="false"
							aria-controls="collapseOne">정비차량 선택하기</button>
					</h2>
					<div id="collapseZero" class="accordion-collapse collapse"
						aria-labelledby="headingZero" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="row justify-content-center">
								<div class="card mx-auto" style="width: 32rem;">
									<select class="selectModel btn btn-secondary" id="selectModel"
										name="selectModel">
										<option value="">차량선택</option>
										<option value="1">AVANTE</option>
										<option value="2">SONATA</option>
										<option value="3">GRANDEUR</option>
										<option value="4">PALISADE</option>
										<option value="5">TUCSON</option>
									</select>
									<p class="card-text"></p>
									<img src="../images/model/vs_logo.jpg" class="card-img-top"
										alt="..." id="card-img1">
									<div>
										<button type="button" class="btn btn-info" id="selectOk">선택</button>
									</div>
									<div class="card-body"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button collapsed" id="headingOneBtn"
							type="button"
							data-bs-target="#collapseOne" aria-expanded="false"
							aria-controls="collapseOne">정비차량번호</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<input type="text" />
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" id="headingTwoBtn"
							type="button"  
							data-bs-target="#collapseTwo" aria-expanded="false"
							aria-controls="collapseTwo">정비소 선택하기</button>
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
										<button type="button" class="btn btn-primary" id="shopFindBtn">검색</button>
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
							type="button" 
							data-bs-target="#collapseThree" aria-expanded="false"
							aria-controls="collapseThree">정비입고예정일 선택하기</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse"
						aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="CalendarArea">
								<table class="Calendar">
									<thead>
										<tr>
											<td onClick="prevCalendar();" style="cursor: pointer;">&#60;</td>
											<td colspan="5"><span id="calYear"></span>년 <span
												id="calMonth"></span>월</td>
											<td onClick="nextCalendar();" style="cursor: pointer;">&#62;</td>
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
			</div>
			
			<div style="margin-top: 50px;">
				<button class="btn" id="OkBtn">신청하기</button>
			</div>
			</form>
		</div>
		<!-- Footer-->
		<footer class="py-5 bg-secondary">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2023</p>
			</div>
		</footer>
	</div>


</body>
</html>
