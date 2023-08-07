<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/mypage/css/styles.css" rel="stylesheet" />
<link href="css/mypage/css/board.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap"
	rel="stylesheet">

<script type="text/javascript">
	function carregis() {
		console.log("test");

		//차량정보등록 modal로 하기
		$
				.ajax({
					url : "/carregiok", //전송할 url
					method : "POST", //전송방식
					data : { //전송할 데이터
						clientVin : $("#car-vin").val(), //정보가 저장될 dto의 컬럼명들 : 정보를 입력한 input의 id
						clientCarNumber : $("#car-number").val(),
						clientDistanceDriven : $("#distance-driven").val(),
						clientCarType : $("#car-type").val(),
						clientShipDate : $("#car-delivery-day").val(),
						clientProductionDate : $("#car-production-date").val(),
						clientColor : $("#car-color").val()
					},
					success : function(data) {
						// 등록한 차량 정보를 JSON 형태로 받아옴
						// data는 서버에서 반환된 JSON 데이터를 나타냄
						if (data) {
							// 테이블에 새로운 행 추가
							var newRow = '<tr class="list">'
									+ '<td><input type="checkbox" name="selectedCars" value="' + data.clientVin + '" id="selectedCarsId"></td>'
									+ '<td>' + data.clientVin + '</td>'
									+ '<td>' + data.clientCarNumber + '</td>'
									+ '<td>' + data.clientDistanceDriven
									+ '</td>' + '<td>' + data.clientCarType
									+ '</td>' + '<td>' + data.clientShipDate
									+ '</td>' + '<td>'
									+ data.clientProductionDate + '</td>'
									+ '<td>' + data.clientColor + '</td>'
									+ '</tr>';

							// 새로운 행을 테이블에 추가
							$("#carTable tbody").append(newRow);
						}

						$("#exampleModal").modal("hide");
						resetInputFields();
						// 삭제 성공 후 리다이렉트를 수행합니다.
						window.location.href = "/carregi"; // 삭제 성공 페이지로 리다이렉트합니다.
					},
					error : function(xhr, status, error) {
						// Error callback, handle errors if the request fails
					}
				});
	}
	//차량등록을 하고 새로 차량등록을 할떄 이전에 썻던 정보가 지워져있게 하기
	function resetInputFields() {
		// Reset the input fields to empty strings or default values
		$("#car-vin").val("");
		$("#car-number").val("");
		$("#distance-driven").val("");
		$("#car-type").val("");
		$("#car-delivery-day").val("");
		$("#car-production-date").val("");
		$("#car-color").val("");

	}

	$(document).ready(function() {
	});

	// 등록된 차량 삭제
	function deleteCar(clientVin) {
		let selectedCarsId = $("#selectedCarsId").val()
		// 확인 메시지를 띄워 사용자에게 삭제 여부를 물어봅니다.
		// if (confirm("선택한 차량을 삭제하시겠습니까?")) {
		// Ajax를 사용하여 서버에 삭제 요청을 전송합니다.
		console.log(selectedCarsId);
		$.ajax({
			url : "/deleteCar", // 삭제 요청을 처리하는 서버의 URL
			method : "GET", // 삭제 요청은 POST 방식으로 전송합니다.
			data : {
				clientVin : selectedCarsId
			}, // 삭제할 차대번호를 전달합니다.
			success : function(data) {
				// 삭제 요청에 성공하면 해당 행을 테이블에서 제거합니다.
				$("tr:has(td:contains(" + clientVin + "))").remove();
				// 여기서 "tr:has(td:contains(" + clientVin + "))"은 차대번호가 clientVin인 행을 찾아내는 선택자입니다.
				// Success callback, handle the response from the server if needed
				// Here, you can add code to close the modal and reset the input fields
				$("#exampleModal1").modal("hide"); // Close the modal
				resetInputFields(); // Reset the input fields
				// 삭제 성공 후 리다이렉트를 수행합니다.
				window.location.href = "/carregi"; // 삭제 성공 페이지로 리다이렉트합니다.
			},
			error : function(xhr, status, error) {
				// 삭제 요청에 실패하면 오류 메시지를 처리할 수 있습니다.
				console.log(error);
			}
		});
		//}
	}
</script>

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

#carregibox {
	float: right;
}

.my-car {
	float: left;
}

.carregiGo {
	float: right;
	margin-left: 10px;
	margin-right: 30px;
}

.carregidelete {
	float: right;
}

#carregibox {
	margin-top: 20px;
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
				<h1 class="display-4 fw-bolder">차량등록</h1>
				<p class="lead fw-normal text-black-50 mb-0">이용 중인 현대자동차 서비스를
					마이페이지에서 확인하세요.</p>
			</div>

		</header>
		<!-- Section-->
		<section class="py-5 two-column-layout">


			<%-- 
	<p><sec:authentication property="principal"/></p>
	<p>user : <sec:authentication property="principal.username"/></p>
	<p>password : <sec:authentication property="principal.password"/></p> --%>

			<div class="contant-area">
				<div id="mypage" class="container" data-v-269e3e5f>
					<!--   -->

					<!--   -->
					<div class="content" data-v-269e3e5f>
						<!---->
						<div class="content-body" data-v-269e3e5f>
							<div class="my-title" data-v-269e3e5f>
								<div class="head" data-v-269e3e5f>
									<strong data-v-269e3e5f><a href="/mypage"><span
											data-v-269e3e5f>${dto.memberName }</span></a> 님, 안녕하세요! </strong> <a
										href="" class="btn btn-primary active infomodify_btn"><span>정보수정
											<!---->

									</span></a>
								</div>

							</div>
							<!-- 포인트 1:1문의내역 -->
							<div class="my-info" data-v-269e3e5f>
								<ul data-v-269e3e5f>
									<li data-v-269e3e5f><a
										href="#
											data-link-area="
										마이페이지-메인" data-link-name="포인트" draggable="true"
										class="btn btn-primary active" data-v-269e3e5f><span>
												포인트 <!---->
										</span></a> <strong data-v-269e3e5f>${memberPoint } P</strong></li>

									<li data-v-269e3e5f><a class="btn btn-primary active"
										href="mypageqna"><span>1:1 문의 내역 <!---->
										</span></a> <strong data-v-269e3e5f>${qnacount } 건</strong></li>
								</ul>
							</div>
							<!-- 포인트 1:1문의내역 end-->
							<!--나의자동차 -->
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
													<div class="">나의 자동차</div>
													<a href="/carregi" class="btn btn-primary active"><span>차량등록관리
															<!---->
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
													<a href="#
															draggable="
														true" class="btn btn-primary active"><span>
															차량기본관리 <!---->
													</span></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 시승신청내역 정비예약내역 end -->

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
													<a href="" class="btn btn-primary active"><span>시승
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
													<a href="#
															draggable="
														true" class="btn btn-primary active"><span> 정비
															예약 신청 내역 <!---->
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

					<c:if test=""></c:if>
					<div id="mycarinfo">
						<div class="my-car" data-v-269e3e5f>
							<div class="title mycarTitle" data-v-269e3e5f>
								<strong data-v-269e3e5f> 나의 자동차 <span data-v-269e3e5f>${carcnt }대</span></strong>

							</div>
							<div class="sub" data-v-269e3e5f>
								<span data-v-269e3e5f>등록 차량의 자세한 정보를 확인하실 수 있습니다.</span>
							</div>

							<c:if test="${!hasCars}">
								<div class="no-car" data-v-269e3e5f>
									<span class="ico-nocar" data-v-269e3e5f><i
										data-v-269e3e5f>등록된 차가 없습니다.</i></span>
									<p data-v-269e3e5f>등록된 차량이 없습니다.</p>
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
																	<!-- 등록된 차량 삭제 체크 박스 --> <input type="checkbox"
																	name="selectedCars" value="${clist.clientVin}"
																	id="selectedCarsId">
																</td>
																<td>${clist.clientVin }</td>
																<td>${clist.clientCarNumber }</td>
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
						</div>
						<div id="carregibox">
							<div class="carregiGo">
								<!-- 차량등록하기 모달버튼 -->
								<button type="button" class="btn btn-primary active"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									차량등록하기</button>

								<!--차량등록하기 Modal창 -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">신규차량등록</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<!-- 모달안쪽내용 -->
											<div class="modal-body">
												<form>
													<div class="mb-3">
														<label for="recipient-name" class="col-form-label">차대번호</label>
														<input type="text" class="form-control" id="car-vin">
													</div>
													<div class="mb-3">
														<label for="recipient-name" class="col-form-label">차량번호</label>
														<input type="text" class="form-control" id="car-number">
													</div>
													<div class="mb-3">
														<label for="recipient-name" class="col-form-label">주행거리</label>
														<input type="text" class="form-control"
															id="distance-driven">
													</div>
													<div class="mb-3">
														<label for="recipient-name" class="col-form-label">차종</label>
														<input type="text" class="form-control" id="car-type">
													</div>
													<div class="mb-3">
														<label for="recipient-name" class="col-form-label">출고일</label>
														<input type="date" class="form-control"
															id="car-delivery-day" placeholder="출고일을 선택해주세요.">
													</div>
													<div class="mb-3">
														<label for="recipient-name" class="col-form-label">생산일</label>
														<input type="date" class="form-control"
															id="car-production-date" placeholder="생산일을 선택해주세요.">
													</div>
													<div class="mb-3">
														<label for="recipient-name" class="col-form-label">색상</label>
														<input type="text" class="form-control" id="car-color">
													</div>
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary active"
													data-bs-dismiss="modal"><span>취소</span></button>
												<button type="button" class="btn btn-primary active"
													onclick="carregis()"><span>등록하기</span></button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carregidelete">
								<!-- 차량등록삭제 모달버튼 -->
								<button type="button" class="btn btn-primary active"
									data-bs-toggle="modal" data-bs-target="#exampleModal1">
									<span>차량등록삭제</span></button>

								<!--차량등록삭제 Modal창 -->
								<!-- 모달을 사용할때는 datatarget과 id 이름을 동일하게 해줘야된다. -->
								<div class="modal fade" id="exampleModal1" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">삭제</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<p>등록된 차량을 삭제하시겠습니까?</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary active"
													data-bs-dismiss="modal">취소</button>
												<button type="button" class="btn btn-primary active"
													onclick="deleteCar('${clist.clientVin}')">삭제하기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>
	</div>

	<!---->
	<!---->


	<!-- Footer-->
	<footer class="py-5 bg-secondary">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2023</p>
		</div>
	</footer>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="css/mypage/js/scripts.js"></script>
</body>
</html>
