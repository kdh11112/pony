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
<title>mypage</title>
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
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap"
	rel="stylesheet">
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
	margin: 10px 40px;
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

<script>
	let tempShopNo = 0; //시승지점 값
	let tempDate = 0; //날짜
	let tempTime = 0; //시간
	function carMaintenanceModify() {
		console.log("shopNo : " + shopNo);

		console.log($('input:radio').is(":checked"));

		//시승신청변경 modal로 하기

		$('input:radio').each(function(index) {
			if ($(this).is(":checked") == true) {

				var no = $(this).parent().next().val().trim();

				console.log($("#selectModel option:selected").val());// jquery 선택한 옵션 객체의 값 구하기 
				var optionValue = $("#selectModel option:selected").val();

				//var no = $(this).parent().next().val();

				// /testdrivingmodify?modelNo=111&shopNo=222&testDriverTime=???&testDriveSchedule=????
				$.ajax({
					url : "/testdrivingmodify",
					method : "POST", //
					data : {
						modelNo : optionValue,
						shopNo : shopNo,
						buttonTime : buttonTime,
						testDriveSchedule : testDriveSchedule,
						testDriveNo : no
					},
					success : function(data) {
					}
				});
				console.log(no);
			}
			location.href = "/testdriving";

		});
	}
	//차량등록을 하고 새로 차량등록을 할떄 이전에 썻던 정보가 지워져있게 하기
	function resetInputFields() {
		// Reset the input fields to empty strings or default values
		$("#modelName").val("");
		$("#shopAreaPoint").val("");
		$("#shopAddr").val("");
		$("#testDriveTime").val("");
		$("#testDriveSchedule").val("");
	}

	function deleteCar() {

		$('input:radio').each(function(index) {
			if ($(this).is(":checked") == true) {

				var no = $(this).parent().next().val();

				$.ajax({
					url : "/testdrivingdelete", // 삭제 요청을 처리하는 서버의 URL
					method : "GET", // 삭제 요청은 POST 방식으로 전송합니다.
					data : {
						testDriveNo : no
					}, // 삭제할 차대번호를 전달합니다.
					success : function(data) {

					}
				});
			}
		});
		location.href = "/testdriving";
	}
</script>

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
							aria-current="page" href="#!">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
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
				</div>
			</div>
		</nav>
		<!-- Header-->
		<header>

			<img src="images/cloud.jpg" alt="" />
			<div class="header-content text-center text-black">
				<h1 class="display-4 fw-bolder">시승신청예약내역</h1>
				<p class="lead fw-normal text-black-50 mb-0"></p>
			</div>

		</header>
		<!-- Section-->
		<section class="py-5 two-column-layout">


			<div class="contant-area">
				<!-- 마이페이지 컨테이너 start -->
				<div id="mypage" class="container" data-v-269e3e5f>
					<!--   -->
					<div class="content" data-v-269e3e5f>
						<!---->
						<div class="content-body" data-v-269e3e5f>
							<div class="my-title" data-v-269e3e5f>
								<div class="head" data-v-269e3e5f>
									<strong data-v-269e3e5f><a href="/mypage"><span
											data-v-269e3e5f>${dto.memberName }</span></a> 님, 안녕하세요! </strong> <a
										href="/myInfo" class="btn btn-primary active infomodify_btn"><span>정보수정
											<!---->

									</span></a>
								</div>

							</div>
							<!-- 포인트 1:1문의내역 -->
							<div class="my-info" data-v-269e3e5f>
								<ul data-v-269e3e5f>
									<li data-v-269e3e5f><strong data-v-269e3e5f>포인트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${memberPoint } P</strong></li>

									<li data-v-269e3e5f><a class="btn btn-primary active"
										href="mypageqna"><span>1:1 문의 내역 <!---->
										</span></a> <strong data-v-269e3e5f>${qnacount } 건</strong></li>
								</ul>
							</div>
							<!-- 포인트 1:1문의내역 end-->

							<!--시승신청내역 정비예약내역-->
							<div class="my-activity" data-v-269e3e5f>
								<div class="category-title" data-v-269e3e5f></div>
								<div class="details" data-v-269e3e5f>
									<div class="el-row"
										style="margin-left: -10px; margin-right: -10px;"
										data-v-269e3e5f></div>
								</div>
								<div class="history-list" data-v-269e3e5f>
									<div class="el-row"
										style="margin-left: -10px; margin-right: -10px;"
										data-v-269e3e5f>
										<div class="el-col el-col-8"
											style="padding-left: 10px; padding-right: 10px;"
											data-v-269e3e5f>
											<div class="content-box" data-v-269e3e5f>
												<div class="title" data-v-269e3e5f>
													<a href="testdriving" class="btn btn-primary active"><span>시승
															신청 내역 <!---->
													</span></a>
												</div>
												<!---->
											</div>
										</div>

										<div class="el-col el-col-8"
											style="padding-left: 10px; padding-right: 10px;"
											data-v-269e3e5f>
											<div class="content-box" data-v-269e3e5f>
												<div class="title" data-v-269e3e5f>
													<a href="/carMaintenanceReservationDetail"
														class="btn btn-primary active"><span> 정비 예약 신청
															내역 <!---->
													</span></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 시승신청내역 정비예약내역 end -->
						</div>


					</div>

					<!-- 시승신청내역 -->

					<div id="mycarinfo">
						<div class="my-car" data-v-269e3e5f>
							<div class="title mycarTitle" data-v-269e3e5f>
								<strong data-v-269e3e5f> 예약된 시승 내역을 확인하세요. <span
									data-v-269e3e5f>${testDriveCount }대</span></strong>

							</div>
							<div class="sub" data-v-269e3e5f>
								<span data-v-269e3e5f>등록 차량의 자세한 정보를 확인하실 수 있습니다.</span>
							</div>

							<c:if test="${empty testdriveapplicationreservationdetailsdto}">
								<div class="no-car" data-v-269e3e5f>
									<span class="ico-nocar" data-v-269e3e5f><i
										data-v-269e3e5f>등록된 차가 없습니다.</i></span>
									<p data-v-269e3e5f>등록된 차량이 없습니다.</p>
								</div>
							</c:if>
							<c:if
								test="${!empty testdriveapplicationreservationdetailsdto  }">
								<!-- 등록차량리스트 -->

								<div class="page-title">
									<div class="container">
										<h3>시승 예약 내역</h3>
									</div>
								</div>

								<!-- board list area -->



								<div id="inquiry_list">
									<div class="container">
										<table class="board-table">
											<thead>
												<tr>
													<th scope="col" class="th-num"></th>
													<th scope="col" class="th-num">시승신청모델</th>
													<th scope="col" class="th-num">시승신청지점</th>
													<th scope="col" class="th-num">시승신청지점주소</th>
													<th scope="col" class="th-title">시승신청일자</th>
													<th scope="col" class="th-date">시승신청시간</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="list"
													items="${testdriveapplicationreservationdetailsdto }">
													<tr class="list">
														<td>
															<!-- 등록된 차량 삭제 체크 박스 --> <input type="radio"
															name="selectedCars" value="" id="selectedCarsId">
														</td>
														<input type="hidden" value="${list.testDriveNo}" />
														<td>${list.modelName}</td>
														<td>${list.shopAreaPoint }</td>
														<td>${list.shopAddr }</td>
														<td>${list.testDriveTime }</td>
														<td>${list.testDriveSchedule }</td>
													</tr>
												</c:forEach>


											</tbody>

										</table>
									</div>
								</div>
							</c:if>
						</div>
						<!-- 시승예약변경버튼모음 -->
						<div id="carregibox">
							<div class="carregiGo">
								<!-- 시승예약변경 모달버튼 -->
								<button type="button" class="btn btn-primary active"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									시승예약변경</button>

								<!-- 시승예약변경 모달 -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-xl">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">정비신청예약변경</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<!-- 모달안쪽내용 -->
											<div class="modal-body">
												<div class="accordion accordion-flush"
													id="accordionFlushExample">
													<!-- 시승모델선택 아코디언 -->
													<div class="accordion-item">
														<h2 class="accordion-header">
															<button class="accordion-button collapsed" type="button"
																data-bs-toggle="collapse" data-bs-target="#collapseOne"
																aria-expanded="false" aria-controls="flush-collapseOne"
																id="headingOneBtn">정비모델선택</button>
														</h2>
														<div id="collapseOne" class="accordion-collapse collapse"
															aria-labelledby="headingOne"
															data-bs-parent="#accordionExample">
															<div class="accordion-body">
																<div class="row justify-content-center">
																	<div class="card mx-auto" style="width: 32rem;">
																		<select class="selectModel btn btn-secondary"
																			id="selectModel" name="selectModel">
																			<option value="">차량선택</option>
																			<option value="1">AVANTE</option>
																			<option value="2">SONATA</option>
																			<option value="3">GRANDEUR</option>
																			<option value="4">PALISADE</option>
																			<option value="5">TUCSON</option>
																		</select>
																		<p class="card-text"></p>
																		<img src="../images/model/vs_logo.jpg"
																			class="card-img-top" alt="..." id="card-img1">
																		<div>
																			<button type="button" class="btn btn-info"
																				id="selectOk">선택</button>
																		</div>
																		<div class="card-body"></div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!-- 시승지점선택 아코디언 -->
													<div class="accordion-item">
														<h2 class="accordion-header" id="headingTwo">
															<button class="accordion-button collapsed" type="button"
																data-bs-toggle="collapse" data-bs-target="#collapseTwo"
																aria-expanded="false" aria-controls="collapseTwo"
																id="headingTwoBtn">시승지점선택</button>
														</h2>
														<div id="collapseTwo" class="accordion-collapse collapse"
															data-bs-parent="#accordionExample"
															aria-labelledby="headingTwo">
															<div class="accordion-body">
																<div class="find-shop-area row">
																	<div class="col-md-6"
																		style="border-right: 1px solid #D1D1D1;">
																		<div>
																			<input type="text" value=""
																				placeholder="검색할 지역을 입력해주세요" id="shopAreaFind"
																				name="shopAreaFind" />
																		</div>
																		<div>
																			<button type="button" class="btn btn-primary"
																				id="shopFindBtn">검색</button>
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="shop-area">
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="서울"
																				id="서울">서울</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="부산"
																				id="부산">부산</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="대구"
																				id="대구">대구</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="인천"
																				id="인천">인천</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="광주"
																				id="광주">광주</button>
																		</div>
																		<div class="shop-area">
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="대전"
																				id="대전">대전</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="경기"
																				id="경기">경기</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="경남"
																				id="경남">경남</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="경북"
																				id="경북">경북</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="전남"
																				id="전남">전남</button>
																		</div>
																		<div class="shop-area">
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="전북"
																				id="전북">전북</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="제주"
																				id="제주">제주</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="충남"
																				id="충남">충남</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="충북"
																				id="충북">충북</button>
																			<button type="button"
																				class="shop-area-btn btn btn-primary" value="세종"
																				id="세종">세종</button>
																		</div>
																	</div>
																</div>
																<div class="shop-area-point row"></div>
															</div>
														</div>
													</div>
													<!-- 시승일자선택 아코디언 -->
													<div class="accordion-item">
														<h2 class="accordion-header" id="headingThree">
															<button class="accordion-button collapsed" type="button"
																data-bs-toggle="collapse"
																data-bs-target="#collapseThree" aria-expanded="false"
																aria-controls="collapseThree" id="headingThreeBtn">정비예정일자선택</button>
														</h2>
														<div id="collapseThree"
															class="accordion-collapse collapse"
															data-bs-parent="#accordionExample">
															<div class="accordion-body">
																<div class="CalendarArea">
																	<table class="Calendar">
																		<thead>
																			<tr>
																				<td onClick="prevCalendar();"
																					style="cursor: pointer;">&#60;</td>
																				<td colspan="5"><span id="calYear"></span>년 <span
																					id="calMonth"></span>월</td>
																				<td onClick="nextCalendar();"
																					style="cursor: pointer;">&#62;</td>
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
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary active"
													data-bs-dismiss="modal">
													<span>취소</span>
												</button>
												<button type="button" class="btn btn-primary active"
													onclick="carMaintenanceModify()" id="OkBtn">
													<span>변경하기</span>
												</button>
											</div>
											<!--  -->
										</div>
									</div>
								</div>
							</div>
							<div class="carregidelete">
								<!-- 차량등록삭제 모달버튼 -->
								<button type="button" class="btn btn-primary active"
									data-bs-toggle="modal" data-bs-target="#exampleModal1">
									<span>정비예약취소</span>
								</button>

								<!-- 시승예약내역 삭제 start -->
								<!-- 모달을 사용할때는 datatarget과 id 이름을 동일하게 해줘야된다. -->
								<div class="modal fade" id="exampleModal1" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-xl">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">정비예약취소</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<p>정비예약을 취소하시겠습니까?</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary active"
													data-bs-dismiss="modal">닫기</button>
												<button type="button" class="btn btn-primary active"
													onclick="deleteCar()">취소하기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 시승예약내역 삭제 end -->
						</div>
						<!-- 시승예약버튼모음 end -->
					</div>
					<!-- 시승신청내역 end -->
				</div>
				<!-- 마이페이지 컨테이너 end -->
			</div>
		</section>
		<!-- Footer-->
		<!-- <footer class="py-5 bg-secondary">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2023</p>
			</div>
		</footer> -->
	</div>


</body>
</html>
