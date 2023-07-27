<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
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
<style>
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
				<h1 class="display-4 fw-bolder">마이페이지</h1>
				<p class="lead fw-normal text-black-50 mb-0">이용 중인 현대자동차 서비스를
					마이페이지에서 확인하세요.</p>
			</div>

		</header>
            
            <!-- Page content-->
	        <div class="container-fluid">
	        	<section class="notice">
  					<div class="page-title">
						<div class="container">
							<h3>1:1문의</h3>
        				</div>
    				</div>
    							
    				<!-- board list area -->
				    <div id="board-list">
						<div class="container">
							<table class="board-table">
								<tbody>
									<tr>	
										<th>번호</th>
										<td class="td-no">${detail.questionNo }</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td class="td-writer">${detail.memberNo }</td>
									</tr>
									<tr>
										<th>등록일</th>
										<td class="td-date">
											<fmt:parseDate var="dateString" value="${detail.questionDate }" pattern="yyyy-MM-dd HH:mm:ss" /> 
											<fmt:formatDate value="${dateString }" pattern="yyyy-MM-dd HH:mm:ss" />
										</td>
									</tr>
									<tr>
										<th>답변상태</th>
										<td class="td-status">${detail.answerStatus }</td>
									</tr>
									<tr>
										<th>제목</th>
										<td class="td-title">${detail.questionTitle }</td>
									</tr>
									<tr>
										<th>내용</th>
										<td class="td-contents">${detail.questionContents }</td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<th>답변</th>
										<td class="td-answer" colspan="8">${detail.questionContents }</td>
									</tr>
								</tfoot>
							</table>
							<a href="/questionlist"><input type="button" class="btn btn-outline-dark" value="목록" /></a>
							<a href="questiondelete?questionNo=${detail.questionNo }"><input type="button" class="btn btn-outline-danger" value="삭제" /></a>		
						</div>
					</div>
				</section>
	        </div>
        </div>
	</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="css/admin/js/scripts.js"></script>
</body>
</html>