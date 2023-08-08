<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>

<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html>
<head>
<title></title>
<meta charset="UTF-8">

<style>
* {
	margin: 0;
	padding: 0;
}

html, body {
	width: 100%;
	height: 100%;
}

ul {
	list-style: none;
}

img {
	max-width: 100%;
}
a{text-decoration: none;}
#container {
	position: fixed;
	width: 100%;
	height: 100%;
}

.bg {
	position: absolute;
	width: 100%;
	min-height: 95%;
	color: #fff;
	left: 0;
	top: 0;
}

.bg li {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

.bg li img {
	width: 100%;
	height: 100vh;
}

.bg li .text {
	width: 100%;
	text-align: center;
	position: absolute;
	left: 0;
	top: 200px;
}

.bg li .text h1 {
	font-size: 90px;
}

.bg li .text h3 {
	font-size: 30px;
}

.bg li .text h6 {
	font-size: 18px;
}

.header {
	position: relative;
	z-index: 9999;
}

.header .logo {
	position: absolute;
	left: 2%;
	top: 20px;
	z-index: 9999;
}

.open {
	position: absolute;
	right: 40px;
	top: 30px;
}

.nav {
	position: fixed;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0; /* width:100%; height:100%; */
	background: rgba(0, 0, 0, 0.8);
	z-index: 10000;
	display: none;
}

.close {
	position: absolute;
	right: 40px;
	top: 30px;
}

.gnb {
	text-align: center;
	margin-top: 100px;
}

.gnb a {
	display: block;
	color: #fff;
	line-height: 70px;
	font-size: 30px;
	text-decoration: none;
}

.footer {
	height: 5%;
	position: absolute;
	left: 20px;
	bottom: 0;
	font-size: 12px;
	color: #fff;
}

.bg .active {
	z-index: 1;
}

.mypage {
	position: absolute;
	right: 80px;
	top: 23px;
	color: white;
	width: 35px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	z-index: 1; /*다른 요소들보다 앞에 배치*/
	width:100px;
	
}

.dropdown-content a {
	display: block;
}

.dropdown:hover .dropdown-content {
	display: block;
}

/* 로그인, 마이페이지, 로그아웃 글씨를 흰색으로 변경 */
.mypage .dropdown-content a {
  color: white;
}

/* GNB(글로벌 내비게이션 바)의 링크 색상 변경 */
.gnb a {
  color: white;
}
</style>
<script src="js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script>

//마이페이지 링크 클릭 시 서버로 사용자 로그인 상태를 확인 요청
 $(function() {
    $('.bg li:eq(0)').addClass('active');
    var time = setInterval(fade_change, 5000);

    function fade_change() {
      var now_img = $(".bg li:eq(0)");
      var next_img = $(".bg li:eq(1)");
      next_img.addClass("active").css("opacity", 0).animate({
        "opacity": 1
      }, 1000, function() {
        $(".bg").append(now_img);
        now_img.removeClass("active");
      });
    }

    $('.open').click(function(e) {
      e.preventDefault();
      $('.nav').fadeIn();
      clearInterval(time);
      //return false
    });

    $('.close').click(function(e) {
      e.preventDefault();
      $('.nav').fadeOut();
      time = setInterval(fade_change, 5000);
      //return false
    });
 });
</script>
</head>
<body>
	<div class="container">
		<header class="header">
			<div class="logo">
				<a href="/index"> <img
					src="images/KakaoTalk_20230720_160646746.png" alt="미니골프">
				</a>
			</div>
			<!-- 마이페이지 링크 -->

				
			<div class="mypage">
			<div class="dropdown">
				<span class="dropbtn"><img src="images/pngegg.png" alt="" /></span>
				<div class="dropdown-content">
				
				<sec:authorize access="!hasAnyRole('ROLE_USER')">
					<a href="/login" class="login-link">로그인</a>
				</sec:authorize>
								
				<sec:authorize access="hasAnyRole('ROLE_USER')">
						<a href="/logout"><sec:authentication property="principal.username"/>님 로그아웃</a>
						<a href="/mypage" class="mypage-link">마이페이지</a>
				</sec:authorize>
					
					
				</div>
			</div>
			</div>
			<a href="#" class="open"> <img src="images/icon_menu.png"
				alt="닫기">
			</a>
			<nav class="nav">

				<ul class="gnb">
					<li><a href="/testDrive">시승신청</a></li>
					<li><a href="/modelFind">모델검색</a></li>
					<li><a href="/modelComparison">모델비교</a></li>
					<li><a href="/carMaintenanceReservation">정비예약</a></li>
				</ul>

				<a href="#" class="close"> <img src="images/button_close.png"
					alt="닫기">
				</a>
			</nav>

		</header>
		<div id="wrap">
			<ul class="bg">
				<li><img src="images/bg_1.jpg" alt="">
					<div class="text">
						<h1>COUNTRY TIMER.</h1>
						<h3>당신의 모험에 더해질 색다른 즐거움.</h3>
						<h6>당신이 도전하는 모든 길을 COUNTRYMAN은 기억할 것입니다.</h6>
					</div></li>
				<li><img src="images/bg_2.jpg" alt="">
					<div class="text">
						<h1>COUNTRY TIMER.</h1>
						<h3>당신의 모험에 더해질 색다른 즐거움.</h3>
						<h6>당신이 도전하는 모든 길을 COUNTRYMAN은 기억할 것입니다.</h6>
					</div></li>
				<li><img src="images/bg_3.jpg" alt="">
					<div class="text">
						<h1>COUNTRY TIMER.</h1>
						<h3>당신의 모험에 더해질 색다른 즐거움.</h3>
						<h6>당신이 도전하는 모든 길을 COUNTRYMAN은 기억할 것입니다.</h6>
					</div></li>
			</ul>
		</div>
		<footer class="footer">
			<p>COPYRIGHT © 2017 BMW KOREA. ALL RIGHTS RESERVED.</p>
		</footer>
	</div>
</body>
</html>