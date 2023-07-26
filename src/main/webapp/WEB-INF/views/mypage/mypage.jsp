<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>mypage</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="mypage/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/mypage/css/styles.css" rel="stylesheet" />
    </head>
    <body>
    <div id="wrapper">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/"><img src="images/pony_motors_log_cut.png" alt="" /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
			        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Search</button>
			     	 </form>
                </div>
            </div>
        </nav>
        <!-- Header-->

            <img alt="" src="images/cloud.jpg" class="himg">
            
                <div id="txt">
                    <h1 class="htitle">마이페이지</h1>
                    <p class="hp">이용 중인 현대자동차 서비스를 마이페이지에서 확인하세요.    ${dto.memberName }</p>
                    
     			</div>


		<!-- contents start -->
		
		<div id="contents">
			<div id="mypagehead1">
				<div class="username">username</div>
				<div class="userinfomodify"><a href="">회원정보수정</a></div>
			</div>
			<div id="userhead2">
				<div class="userpoint">사용자 포인트</div>
				<div class="userqna"><a href="/mypageqna">1:1문의내역</a></div>
			</div>
			<div id="usercontents1">
				<div class="usermycar1">나의 현대자동차 0대</div>
				<div class="usermycar2">등록차량정보확인</div>
				<div class="usermycar3">등록된 차량이 없습니다.</div> 
			</div>
			<div id="myactice">
				<div class="myactice1">나의 활동</div>
				<div class="myactice2">관심 있게 보았던 차량과 활동하신 내역을 확인해보세요!</div>
			</div>
			<div id="testdrivinglist">
				<a href="">시승신청내역</a>
			</div>
			<div id="reservationlist">
				<a href="">정비예약내역</a>
			</div>
		</div>
		<!-- contents end -->
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="css/mypage/js/scripts.js"></script>
    </body>
</html>
