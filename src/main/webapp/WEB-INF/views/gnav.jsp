<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#navbarSupportedContent{
		padding-left:450px;
	}
	.nav-item{
		padding:0 50px;
	}
	.nav-link{
		width:100px;
	}
	.mypagebtn{
		 float:right; 
		z-index: 9999;
		position: absolute;
		right: 2%;
		top: 5px;
	}
	.navbar-brand>img{
		/* width:100px; height:70px; */
		position: absolute;
		left: 2%;
		top: 5px;
		z-index: 9999;
		width:100px;
		height:60px;
	}
	.navbar{
	height:80px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/"><img src="../images/pony_motors_log_cut.png" alt="" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        
        <li class="nav-item">
          <a class="nav-link" href="/testDrive">시승신청</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/carMaintenanceReservation">정비예약</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            shop
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/partall">모든상품보기</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/cartlist">장바구니</a></li>
            <li><a class="dropdown-item" href="/myorderlist">내주문내역</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            모델
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/model/modelFind">모델검색</a></li>
            <!-- <li><hr class="dropdown-divider"></li> -->
            <li><a class="dropdown-item" href="/model/modelComparison">모델비교</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/model/partsFind">부품검색</a>
        </li>
      </ul>
    </div>
      <div class="d-flex">
        <a class="btn" href="/mypage">mypage</a>
      </div>
  </div>
</nav>
</body>
</html>