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
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<title>PONY MOTORS</title>
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

<script type="text/javascript">
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
</script>

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
			<h1 class="top-title-text2">온라인 예약으로 고객님이 원하시는 장소와 시간에 차량관리를 받을 수 있습니다.</h1>
		</div>
		<div class="testDriveContent text-center">
		<div id="reservationOk">
		<h3>신청이 완료 되었습니다.</h3>		
		<h4><a href="/carMaintenanceReservationDetail">내 예약 내역 보러가기</a></h4>
		</div>
		</div>
		
	</div>

</body>
</html>
