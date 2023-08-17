<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 날짜의 형식을 지정할 수 있음. 데이터 베이스에서 날짜의 형식을 바꿀수도있지만 jstl로 변경할수도있다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
<link href="css/mypage/css/styles.css" rel="stylesheet" />
<link href="css/mypage/css/board.css" rel="stylesheet" />
<title>Insert title here</title>
</head>

<body>
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
							aria-current="page" href="/">Home</a></li>
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
					
				</div>
			</div>
		</nav>
		<!-- Header-->
		<header>

			<img src="images/cloud.jpg" alt="" />
			<div class="header-content text-center text-black">
				<h1 class="display-4 fw-bolder">공지사항</h1>
				<p class="lead fw-normal text-black-50 mb-0">자주하는 질문, ARS 상담, 구매가이드 등 도움이 되는 정보를 한 눈에 확인해보세요.</p>
			</div>

		</header>

	<div class="container">


		<!-- 전체사원의목록 -->
		<table class="table">

			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="list" items="${list }">
				<tr>
					<td>${list.noticeNo }</td>
					<td>${list.noticeTitle }</td>
					<td>
						<a href="detail?noticeNo=${list.noticeNo}">${list.noticeContents }</a>
					</td>
					<td>
						<fmt:parseDate var="dateString" value="${list.noticeDate }" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${dateString }" pattern="yyyy-MM-dd" />
					</td>
					<td>${list.noticeHits }</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${map.prev }">
								<li class="page-item"><a class="page-link" href="list?currentPage=${map.currentPage-5 }">이전</a></li>
							</c:if>
							<c:forEach var="i" begin="${map.startPageNo }" end="${map.endPageNo }">
								<li class="page-item"><a class="page-link" href="notice?currentPage=${i }">${i }</a></li>
							</c:forEach>
							<c:if test="${map.next }">
								<li class="page-item"><a class="page-link" href="notice?currentPage=${map.currentPage+5 }">다음</a></li>
							</c:if>
						</ul>
					</nav>
				</td>
			</tr>
		</table>

	</div>
</body>
</html>
