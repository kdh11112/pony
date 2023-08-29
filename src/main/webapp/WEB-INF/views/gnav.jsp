<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
<!-- Favicon -->


<style>

	*{
	font-family: 'NanumSquareRound';
	}
	#navbarSupportedContent{
		padding-left:450px;
		
	}
	.nav-item{
		padding:0 50px;
	}
	.nav-link{
		width:100px;
		font-size: 17px;
	}
	.mypageGo{
		 float:right; 
		z-index: 9999;
		position: absolute;
		right: 2%;
		top: 5px;
		padding-top:20px;
	}
	.navbar-brand>img{
		/* width:100px; height:70px; */
		position: absolute;
		left: 2%;
		top: 5px;
		z-index: 9999;
		width:80px;
		height:68px;
	}
	.navbar{
	height:80px;
	}
	* {
    margin: 0px;
    padding: 0px;
}

ul, ol {
    list-style: none;
}

a {
    text-decoration: none
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
	    <%
        String cookieName = "jwtToken";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    // 쿠키의 유효 기간을 0으로 설정하여 삭제
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    break;
                }
            }
        }
    	%>
 		</sec:authorize>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/"><img src="../images/pony_motors_log_cut.png" alt="" /></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        
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
          <a class="nav-link" href="/testDrive">시승신청</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/carMaintenanceReservation">정비예약</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/model/partsFind">부품검색</a>
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
      </ul>
    </div>
    
    <div class="mypage">
			<div class="dropdown">
				
				<div class="dropdown-content">
						<a href="/mypage" class="mypage-link2">MyPage </a>
						<a href="/logout" class="mypage-link1" style="padding-left: 15px; padding-right: 25px;"> Logout</a>
				</div>
			</div>
	</div>
    
<!--       <div class="d-flex">
        <a class="mypageGo" href="/mypage">mypage</a>
        <a class="mypageGo" href="/mypage">mypage</a>        
      </div> -->
  </div>
</nav>
</body>
</html>