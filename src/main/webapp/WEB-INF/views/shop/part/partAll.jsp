<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>PONY MOTORS</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/mypage/css/styles.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.content {
	box-sizing: border-box;
	width: 400px;
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

.title {
	margin: 0 30px;
}

.head {
	margin: 20px 60px;
}

.infomodify_btn {
	margin-left: 13px;
}
/* 추가 css */
.container {
	width: 1040px;
}

.choicetype {
	height: 35px;
	padding: 5px 10px 5px 10px;
	border-radius: 4px;
	outline: 0 none;
	border-color: silver;
}

#option_car {
	width: 150px;
}

#option_count {
	width: 50px;
}

.table th, td {
	text-align: center;
}

#selectAction img {
	backgrond-color: white;
}
/* 검색 영역 */
.search_wrap {
	margin-top: 15px;
}

.search_input {
	position: relative;
	text-align: center;
}

.search_input input[name='keyword'] {
	padding: 4px 10px;
	font-size: 15px;
	height: 20px;
	line-height: 20px;
}

.search_btn {
	height: 32px;
	width: 80px;
	font-weight: 600;
	font-size: 18px;
	line-height: 20px;
	position: absolute;
	margin-left: 15px;
	background-color: #c3daf7;
}
}
</style>
</head>
<body>
	<div id="wrapper">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container">
				<a class="navbar-brand" href="#!"></a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="/partall">모든 상품보기</a></li>
								<li>
									<hr class="dropdown-divider" />
								</li>
								<li><a class="dropdown-item" href="/cartlist">장바구니</a></li>
								<li><a class="dropdown-item" href="/myorderlist">내 주문내역</a></li>
							</ul></li>
					</ul>
					<form class="form-inline">
						<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">검색</button>
					</form>
				</div>
			</div>
		</nav>

		<!-- Header-->
		<header>
			<img src="images/cloud.jpg" alt="" />
			<div class="header-content text-center text-black">
				<h1 class="display-4 fw-bolder">상품 목록</h1>
				<p class="lead fw-normal text-black-50 mb-0">간편하게 부품을 주문해보세요.</p>
			</div>
		</header>

		<!-- Section-->
		<section class="py-5 two-column-layout">
			<div class="container">
				<form action="/partall" method="get">
					<table class="table">
						<colgroup>
							<col width="130">
							<col width="400">
							<col width="190">
							<col width="150">
							<col width="130">
							<col width="50">
						</colgroup>
						<tr>
							<th>부품번호</th>
							<th>부품명</th>
							<th>옵션</th>
							<th>수량</th>
							<th>금액</th>
							<th></th>
						</tr>
						<c:if test="${listCheck != 'empty' }">
							<c:forEach var="partlist" items="${partlist }">
								<tr>
									<td>${partlist.partNumber }</td>
									<td style="text-align: left !important; padding-left: 50px;">${partlist.partName }</td>
									<td>
										<select name="selectCar" class="choicetype">
											<option value=" ">--</option>
											<option value="AVANTE">AVANTE</option>
											<option value="SONATA">SONATA</option>
											<option value="GRANDEUR">GRANDEUR</option>
											<option value="PALISADE">PALISADE</option>
											<option value="TUCSON">TUCSON</option>
										</select>
									</td>
									<td>
										<!-- 최대 주문 가능수량 : 재고수량 -->
										<select name="selectCount" class="choicetype">
											<c:forEach begin="1" end="${partlist.partNo }" var="i">
												<option value="${i }">${i }</option>
											</c:forEach>
										</select>
									</td>
									<td style="text-align: right !important; padding-right: 35px;">
										<fmt:formatNumber pattern="###,###,###">${partlist.partPrice }</fmt:formatNumber>
									</td>
									<td>
										<input type="hidden" name="selectPart" value="${partlist.partNumber }" />
										<button type="button" name="selectAction" value="add_to_cart">
											<img src="css/admin/assets/cart.png" style="width: 12px; height: 12px;" />
										</button>
										<!-- <input type="image" src="css/admin/assets/cart.png" style="width: 12px; height: 12px;" /> -->
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${listCheck == 'empty'}">
							<tr>
								<td colspan="6" class="table_empty">등록된 부품이 없습니다.</td>
							</tr>
						</c:if>
						<!-- 검색 영역 -->
						<tr>
							<td colspan="6" class="pagetd">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
											<li class="page-item"><a class="page-link" href="${num }">${num }</a></li>
										</c:forEach>
									</ul>
								</nav>
							</td>
						</tr>
					</table>
				</form>
				<!-- 수정, 조회 후 현재 페이지로 다시 리다이렉트하게 하기 위해 hidden으로 현재 페이지 정보 넘겨줌 -->
				<form id="moveForm" action="/partall" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				</form>
			</div>

			<!-- 검색 Area -->
			<div class="search_wrap">
				<form id="searchForm" action="/partall" method="get">
					<div class="search_input">
						<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
						<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
						<input type="hidden" name="perPageNum" value='${pageMaker.cri.perPageNum}'>
						<button class='btn search_btn'>검 색</button>
					</div>
				</form>
			</div>
		</section>

		<!-- Footer-->
		<footer class="py-5 bg-secondary">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p>
			</div>
		</footer>

	</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="css/mypage/js/scripts.js"></script>
	<script>
		/* 페이징 버튼 동작시키기 위한 코드*/
		let moveForm = $('#moveForm');

		$(".page-item a").on("click", function(e) {
			e.preventDefault();
			/* form 태그 내부 pageNum과 관련된 input 태그의 value 값을 클릭한 a태그의 페이지 번호로 삽입 */
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			/* form 태그 서버 전송 */
			moveForm.submit();
		});

		let searchForm = $('#searchForm');

		/* 부품 이름 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {
			e.preventDefault();
			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.submit();

		});

		//		$("#selectAction").on("click",function(e){
		//			var car = ${"select[name='selectCar']"}.parent().val;
		//			console.log(car);
		//		});
	</script>
</body>
</html>
