<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="/css/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/css/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
  포니
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="/css/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/css/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/css/assets/demo/demo.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function(){
		  $("li").on("click", function() {
			    // 클릭한 li 요소에 "active" 클래스 추가
			    $("li").removeClass("active");
			    $(this).addClass("active");
			    
			    // 선택한 li 요소의 인덱스 값 "activeIndex"를 localStorage에 저장
			    var activeIndex = $("li").index(this);
			    localStorage.setItem("activeIndex", activeIndex);
			  });
			  
			  // 페이지 로드 시 이전 선택한 li 요소의 인덱스 값 "activeIndex"를 가져와서 "active" 클래스 추가
			  var activeIndex = localStorage.getItem("activeIndex");
			  if (activeIndex !== null) {
			    $("li").eq(activeIndex).addClass("active");
			  }
	})
</script> 
</head>
   <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="" class="simple-text logo-mini">
        <img alt="" src="/css/admin/logoTitle.png">
        </a>
        <a href="" class="simple-text logo-normal">
          PONY MOTORS
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="/reg/registration">
              <i class="nc-icon nc-bank"></i>
              <p>일반접수</p>
            </a>
          </li>
          <li>
            <a href="/reg/work">
              <i class="nc-icon nc-settings"></i>
              <p>일반작업</p>
            </a>
          </li>
          <li>
            <a href="/reg/payment">
              <i class="nc-icon nc-diamond"></i>
              <p>일납수반</p>
            </a>
          </li>
		  <li>
		      <a data-toggle="collapse" href="#pagesExamples1">
		          <i class="nc-icon nc-layout-11"></i>
		          <p>고객관리
		             <b class="caret"></b>
		          </p>
		      </a>
		          <div class="collapse" id="pagesExamples1">
		              <ul class="nav">
		                  <li>
		                      <a href="/reg/reservation">
		                          <span class="nc-icon nc-bell-55"></span>
		                          <span class="sidebar-normal">예약관리</span>
		                      </a>
		                  </li>
		                  <li>
		                      <a href="/css/examples/pages/timeline.html">
		                          <span class="nc-icon nc-single-02"></span>
		                          <span class="sidebar-normal">문의사항</span>
		                      </a>
		                  </li>
		              </ul>
		          </div>
           </li>
		  <li>
		      <a data-toggle="collapse" href="#pagesExamples2">
		          <i class="nc-icon nc-layout-11"></i>
		          <p>고객등록
		             <b class="caret"></b>
		          </p>
		      </a>
		          <div class="collapse" id="pagesExamples2">
		              <ul class="nav">
		                  <li>
		                      <a href="/reg/carRegister">
		                          <span class="nc-icon nc-bus-front-12"></span>
		                          <span class="sidebar-normal">고객차량등록</span>
		                      </a>
		                  </li>
		                  <li>
		                      <a href="/reg/register">
		                          <span class="nc-icon nc-badge"></span>
		                          <span class="sidebar-normal">회원가입</span>
		                      </a>
		                  </li>
		              </ul>
		          </div>
           </li>
          <li class="active-pro">
            <a href="./upgrade.html">
              <i class="nc-icon nc-spaceship"></i>
              <%out.println("<p>" + session.getAttribute("mechanicName") + "</p>"); %>
            </a>
          </li>
        </ul>
      </div>
    </div>
  <script src="/css/assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="/css/assets/js/core/bootstrap.min.js" type="text/javascript"></script>