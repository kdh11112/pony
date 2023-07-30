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
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">

<style>
.content{
	box-sizing: border-box;
	width:400px;
}
.contant-area{
	flex: 1;
	width: 90%;
    margin: 10px auto;
    display: flex;
	
}
.content-body {
    border: 1px solid #dedede;
    box-sizing: border-box;
	width:10vm;
	height:800px;
	float: left;
}
.inquiry{
    border: 1px solid #dedede;
    box-sizing: border-box;
	width:800px;
	height:800px;
    margin: 0px 1%;
    float: right;
}
.title{
	margin:0 30px;
}
.no-car,.sub{
	margin:0 30px;
}
.head{
	margin:20px 60px;
}
.infomodify_btn{
	margin-left:13px;
}
.inquiryGo{
	float:right;
}
.floating_area--3yEuORHlfZ .inner--2zhHC3FZRa {
    position: relative;
    margin: 0 auto;
    text-align: right;
    width: 1280px;
    right: 0;
    bottom: 0;
    left: 0;
}
.floating_area--3yEuORHlfZ {
    height: 76px;
    background-color: #0A58CA;
}
.floating_area--3yEuORHlfZ .buy_area2 {
    box-shadow: none;
    padding: 14px 0;
    display: block;
    text-align: right;
    display: inline-block;
    max-width: none;
    margin-left: 29px;
    border-radius: 6px;
    box-shadow: none;
    border: 0;
    font-size: 16px;
    line-height: 48px;
    text-align: center;
    vertical-align: top;
    -webkit-box-flex: 1;
    background-color: #ffffff;
    font-weight: bold
}
.num--2CYvhIm-m6{
	font-size: 24px;
    vertical-align: top;
    line-height: 48px;
    font-weight: bold;
    font-style: normal;
    white-space: nowrap;
    color: #ffffff;
    text-align: left;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
}
.floating_area--3yEuORHlfZ .buy_area2 {
    position: relative;
    -webkit-box-pack: justify;
    justify-content: space-between;
    background-color: #0A58CA;
    letter-spacing: -0.5px;
    text-align: right;
}
.floating_area--3yEuORHlfZ {
    position: fixed;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 3000;
}
.floating_area--3yEuORHlfZ:before {
    position: absolute;
    top: -10px;
    right: 0;
    left: 0;
    height: 10px;
    opacity: 0.06;
    background: linear-gradient(180deg, rgba(11,26,58,0.0001) 0%, #0b1a3a 100%);
    content: '';
}
.contents--2E6XJtdAJn {
    padding: 30px 0 44px;
}
.floating_area--3yEuORHlfZ {
    display: block;
}
.floating_area--3yEuORHlfZ .buy_area2 em {
    display: inline-block;
    margin-left: 12px;
    font-size: 20px;
    line-height: 48px;
    vertical-align: top;
}
.floating_area--3yEuORHlfZ .buy_area2 em {
    display: block;
    font-size: 16px;
    font-weight: bold;
    line-height: 23px;
}
.floating_area--3yEuORHlfZ .title--cW4o5HCufH .buy_area2 {
    display: inline-block;
    font-size: 18px;
    vertical-align: top;
}
.floating_area--3yEuORHlfZ .title--cW4o5HCufH .buy_area2 {
    display: block;
    font-size: 13px;
    letter-spacing: -0.5px;
}
span{
	color: white;
	text-align: right;
	
}
.floating_area--3yEuORHlfZ .buy_area2 {
    margin-right: 10px;
    white-space: nowrap;
    color: #ffffff;
    text-align: left;
}
buy_area2 .link_buy--jXvxZ8Agr-{
    outline: none;
    border: 0;
    background: transparent;
    cursor: pointer;
    color: #000000;
    margin: 0;
    padding: 0;
    -webkit-text-size-adjust: none;
    appearance: auto;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-variant-alternates: ;
    font-stretch: ;
    font-optical-sizing: ;
    font-kerning: ;
    font-feature-settings: ;
    font-variation-settings: ;
    text-rendering: auto;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    box-sizing: border-box;
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
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="/cartlist">모든 상품보기</a></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item" href="/cartlist">장바구니</a></li>
								<li><a class="dropdown-item" href="/myOrderList">내 주문내역</a></li>
							</ul>
						</li>
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
				<h1 class="display-4 fw-bolder">나의 장바구니</h1>
				<p class="lead fw-normal text-black-50 mb-0">이용 중인 현대자동차 서비스를
					마이페이지에서 확인하세요.</p>
			</div>

		</header>
		<!-- Section-->
		<section class="py-5 two-column-layout">

			<div class="contant-area">
				<div id="mypage" class="container" data-v-269e3e5f>
					<div class="content" data-v-269e3e5f>
						<div class="content-body" data-v-269e3e5f>
							<div class="my-title" data-v-269e3e5f>
								<div class="head" data-v-269e3e5f>
									<strong data-v-269e3e5f>
										<a href="/mypage"><span data-v-269e3e5f>${dto.memberName }</span></a>
										님, 안녕하세요! 
									</strong> 
									<a href="" class="btn btn-primary active infomodify_btn" >
									<span>정보수정</span>
									</a>
								</div>
							</div>
							
							<!-- 포인트 1:1문의내역 -->
							
							<div class="my-info" data-v-269e3e5f>
								<ul data-v-269e3e5f>
									<li data-v-269e3e5f>
										<a href="#data-link-area="마이페이지-메인" data-link-name="포인트" draggable="true"
											class="btn btn-primary active" data-v-269e3e5f>
											<span> 포인트 	</span>
										</a> 
										<strong data-v-269e3e5f>0 P</strong>
									</li>

									<li data-v-269e3e5f>
										<a class="btn btn-primary active" href="mypageqna">
											<span>1:1 문의 내역 </span>
										</a> 
										<strong data-v-269e3e5f>0 건</strong>
									</li>
								</ul>
							</div>
							<!-- 포인트 1:1문의내역 end-->

							<!--시승신청내역 정비예약내역-->
							<div class="my-activity" data-v-269e3e5f>
								<div class="category-title" data-v-269e3e5f></div>
								<div class="details" data-v-269e3e5f>
									<div class="el-row" style="margin-left: -10px; margin-right: -10px;"
										data-v-269e3e5f>
									</div>
								</div>
								<div class="history-list" data-v-269e3e5f>
									<div class="el-row" style="margin-left: -10px; margin-right: -10px;"
										data-v-269e3e5f>
										<div class="el-col el-col-8" style="padding-left: 10px; padding-right: 10px;"
											data-v-269e3e5f>
											<div class="content-box" data-v-269e3e5f>
												<div class="title" data-v-269e3e5f>
													<a href="#draggable="true" class="btn btn-primary active">
														<span>시승 신청 내역</span>
													</a>
												</div>
											</div>
										</div>

										<div class="el-col el-col-8" style="padding-left: 10px; padding-right: 10px;"
											data-v-269e3e5f>
											<div class="content-box" data-v-269e3e5f>
												<div class="title" data-v-269e3e5f>
													<a href="#draggable="true" class="btn btn-primary active">
														<span> 정비예약 신청 내역 </span>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 시승신청내역 정비예약내역 end -->
					
					<!-- 1:1문의내역 리스트 -->
					<div class="container-fluid">
						<section class="inquiry">
							<div class="page-title">
								<div class="container">
									<h3>1:1 문의내역</h3>
								</div>
							</div>

							<!-- board list area -->
							<div id="inquiry_list">
								<div class="container">
									<table class="board-table">
										<thead>
											<tr>
												<th scope="col" class="th-"></th>
												<th scope="col" class="th-num">번호</th>
												<th scope="col" class="th-title">제목</th>
												<th scope="col" class="th-date">등록일</th>
												<th width="15%" scope="col" class="th-status">답변상태</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="qlist" items="${qnalist }">
												<tr class="list">
													<td><input type="checkbox" name="checkbox" /></td>
													<td>${qlist.questionNo }</td>
													<th>
														<a href="mypageqnadetail?questionNo=${qlist.questionNo }">${qlist.questionTitle }</a>
													</th>
													<td>${qlist.memberNo }</td>
													<td><fmt:parseDate var="dateString" value="${qlist.questionDate }"
															pattern="yyyy-MM-dd HH:mm:ss" /> 
														<fmt:formatDate value="${dateString }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
													<td>${qlist.answerStatus }</td>
												</tr>
											</c:forEach>
											<tr>
												<td>
							                    	<a href="/qnawrite"><button type="button" class="btn btn-dark inquiryGo" >1:1문의하러가기</button></a>
							                    </td>
								             </tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="floating_area--3yEuORHlfZ">
								<div class="inner--2zhHC3FZRa">
									<div class="buy_area2" >
										<span class="title--cW4o5HCufH">총 주문금액</span>
											<span class="num--2CYvhIm-m6">금액불러오기</span>원
									<button type="button" class="link_buy--jXvxZ8Agr-">총 주문하기
									</button>
									</div>
								</div>
							</div>
						</section>
					</div>

					<!-- 1:1문의내역 리스트 end -->
				</div>
			</div>
		</section>
		<!-- Footer-->
		<footer class="py-5 bg-secondary">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; PONY MOTORS 2023</p>
			</div>
		</footer>
	</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="css/mypage/js/scripts.js"></script>
</body>
</html>
