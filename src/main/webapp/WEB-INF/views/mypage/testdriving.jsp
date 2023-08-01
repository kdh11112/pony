<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>mypage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
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
				<h1 class="display-4 fw-bolder">시승신청예약내역</h1>
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
									<strong data-v-269e3e5f><span data-v-269e3e5f>${mdto.memberName }</span>
										님, 안녕하세요! </strong> <a href=""
										class="btn btn-primary active infomodify_btn"><span>정보수정
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
										</span></a> <strong data-v-269e3e5f>0 P</strong></li>

									<li data-v-269e3e5f><a class="btn btn-primary active"
										href="mypageqna"><span>1:1 문의 내역 <!---->
										</span></a> <strong data-v-269e3e5f>0 건</strong></li>
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
													<a href="#
															draggable="
														true" class="btn btn-primary active"><span>시승
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

					<!-- 시승신청내역 -->

					<div id="mycarinfo">
						<div class="my-car" data-v-269e3e5f>
							<div class="title mycarTitle" data-v-269e3e5f>
								<strong data-v-269e3e5f> 나의 자동차 <span data-v-269e3e5f>0대</span></strong>

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
															<th scope="col" class="th-num">시승신청모델</th>
															<th scope="col" class="th-num">시승신청지점</th>
															<th scope="col" class="th-title">시승신청일자</th>
															<th scope="col" class="th-date">시승신청시간</th>
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
															</tr>
														</c:forEach>

													</tbody>

												</table>
											</div>
										</div> 
							</c:if>
						</div>

					<!-- 1:1문의내역 리스트 end -->

					<!---->
					<!---->

				</div>

			</div>
		</section>
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
