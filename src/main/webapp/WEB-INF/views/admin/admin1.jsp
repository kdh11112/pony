<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!doctype html>
<html> 
	<head>
		<title>PONY ADMIN</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
		<style>
		    *{margin:0; padding:0;}
			html,body{width:100%; height:100%;}
			ul{list-style:none;}
			img{max-width:100%;}
			#container{position:fixed; width:100%; height:100%;}
			.bg{position:absolute; width:100%; min-height:95%; color:#fff; left:0; top:0;}
			.bg li{position:absolute; left:0; top:0;  width:100%; height:100%;}
			.bg li img{width:100%; height:100vh;}
			.bg li .text{width:100%; text-align:center; position:absolute; left:0; top:200px;}
			.bg li .text h1{font-size:90px;}
			.bg li .text h3{font-size:30px;}
			.bg li .text h6{font-size:18px;}
			.header{position:relative; z-index:9999;}
			.header .logo{position:absolute; left:2%; top:20px; z-index:9999;}
			.open{position:absolute; right:40px; top:30px;}
			.nav{position:fixed; left:0; top:0;right:0; bottom:0; /* width:100%; height:100%; */ background:rgba(0,0,0,0.8); z-index:10000;
			display:none;}
			.close{position:absolute; right:40px; top:30px;}
			.gnb{text-align:center; margin-top:100px;}
			.gnb a{display:block; color:#fff; line-height:70px; font-size:30px; text-decoration:none;}
			.footer{height:5%; position:absolute; left:20px; bottom:0; font-size:12px; color:#fff;}
			.bg .active{z-index:1;}
			.mypage{position:absolute; right:80px; top:23px; color:white; width:35px;}
			
		</style>
		<script src="js/jquery-3.4.1.min.js"></script>
		<script>
			$(function(){
				
				$('.bg li:eq(0)').addClass('active');
				var time=setInterval(fade_change,5000);
				
				function fade_change(){
					var now_img = $(".bg li:eq(0)");
					var next_img = $(".bg li:eq(1)");
					next_img.addClass("active").css("opacity",0).animate({"opacity":1},1000, function(){
					$(".bg").append(now_img);			
					now_img.removeClass("active");
				});
					
				}
				$('.open').click(function(e){
					e.preventDefault();
					$('.nav').fadeIn();
					clearInterval(time);
					//return false
				});
				$('.close').click(function(e){
					e.preventDefault();
					$('.nav').fadeOut();
					time=setInterval(fade_change,5000);
					//return false
				});
			});
		</script>
	</head>
	<body>
	        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">
                <img alt="" src="css/admin/assets/invi.png"> <a class="logo-link" href="/admin"> PONY Admin</a></div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/partlist">재고관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/adminorderlist">주문목록</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/questionlist">고객문의</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/adminnotice">공지사항</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <img id="sidebarToggle" src="css/admin/assets/list.png"></img>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        
	<div class="container">
		<header class="header">
			<div class="logo">
				<a href="/index">
				<img src="images/KakaoTalk_20230720_160646746.png" alt="포니로고">
				</a>
			</div>
			<a href="#" class="open">
				<img src="images/icon_menu.png" alt="닫기">
			</a>
			<nav class="nav">
			   <ul class="gnb">
					<li><a href="/partlist">재고관리</a></li>
					<li><a href="/modelFind">모델검색</a></li>
					<li><a href="/modelComparison">모델비교</a></li>
					<li><a href="#">MENU4</a></li>
				</ul>
				
				<a href="#" class="close">
					<img src="images/button_close.png" alt="닫기">
				</a>
			</nav>
			
		</header>
		<div id="wrap">
			<ul class="bg">
				<li>
					<img src="images/bg_1.jpg" alt="">
					<div class="text">
						<h1>PONY MOTORS</h1>
						<h3>ADMIN PAGE</h3>
					</div>
				</li>
				<li>
					<img src="images/bg_2.jpg" alt="">
					<div class="text">
						<h1>PONY MOTORS</h1>
						<h3>ADMIN PAGE</h3>
					</div>
				</li>
				<li>
					<img src="images/bg_3.jpg" alt="">
					<div class="text">
						<h1>PONY MOTORS</h1>
						<h3>ADMIN PAGE</h3>
					</div>
				</li>
			</ul>
		</div>
		<footer class="footer">
			<p>COPYRIGHT © 2023 PONY MOTORS. ALL RIGHTS RESERVED.</p>
		</footer>
	</div>
	</body>
</html>