<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>PONY ADMIN</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/admin/css/styles.css" rel="stylesheet" />
<link href="css/admin/css/board.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<!-- Top navigation-->
			<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
				<div class="container-fluid">
					 <a href="/admin"><img id="sidebarToggle" src="images/pony_motors_log_cut.png"></img></a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							<li class="nav-item active"><a class="nav-link" href="/admin">AdminHome</a></li>
							<li class="nav-item"><a class="nav-link" href="/">UserPage</a></li>
							<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">▼</a>
								<div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
									<!-- <a class="dropdown-item" href="/adminpartlist">재고관리</a> -->
									<a class="dropdown-item" href="/adminorderlist">주문목록</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/questionlist">고객문의</a>
									<a class="dropdown-item" href="/adminnotice">공지사항</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- Page content-->
			<div class="container-fluid">
				<section class="boardsection">
					<div class="page-title">
						<div class="container">
							<h3>고객 주문목록</h3>
						</div>
					</div>
					<!-- board list area -->
					<div id="board-list">
						<div class="container">
							<table class="board-table">
								<thead>
									<tr>
										<th scope="col" class="th-">
											<input type="checkbox" id="allCheck" name="allCheck" />
										</th>
										<th scope="col" class="th-num">주문번호</th>
										<th scope="col" class="th-total">주문금액</th>
										<th scope="col" class="th-member">고객번호</th>
										<th scope="col" class="th-date">주문일</th>
										<th width="15%" scope="col" class="th-status">주문상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${orderlist }">
										<tr>
											<!-- 주문번호를 value로 줘서 체크하면 주문번호가 배열로 담기게 -->
											<td>
												<input type="checkbox" name="RowCheck" value="${list.orderNo }" />
											</td>
											<td>
												<a href="adminorderdetail?orderNo=${list.orderNo }">${list.orderNo }</a>
											</td>
											<td>
												${list.orderTotal }
											</td>
											<td>${list.memberNo }
											</td>
											<td>
												<fmt:parseDate var="dateString" value="${list.orderDate }" pattern="yyyy-MM-dd HH:mm:ss" />
												<fmt:formatDate value="${dateString }" pattern="yyyy-MM-dd HH:mm" />
											</td>
											<!-- 답변상태에 따른 글씨색 변화 -->
											<c:choose>
												<c:when test="${list.orderStatus == '배송준비중'}">
													<td class="td-status" style="color: navy;">${list.orderStatus}</td>
												</c:when>
												<c:when test="${list.orderStatus == '배송중' || '배송완료'}">
													<td class="td-status" style="color: black;">${list.orderStatus}</td>
												</c:when>
												<c:when test="${list.orderStatus == '주문취소'}">
													<td class="td-status" style="color: red;">${list.orderStatus}</td>
												</c:when>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
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
							<form id="moveForm" method="get">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
								<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }">
							</form>
						</div>
					</div>
					<!-- board search area -->
					<div id="board-search">
						<div class="container">
							<div class="search-window">
								<form action="">
									<div class="search-wrap">
										<select name="type" class="choicetype">
											<option value="">--</option>
											<option value="W">고객번호</option>
											<option value="T">주문일</option>
											<option value="A">주문상태</option>
										</select>
										<input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
										<button type="submit" class="btn btn-dark">검색</button>
									</div>

									<input type="button" class="btn btn-dark" value="삭제" onclick="deleteValue();" />
								</form>
							</div>
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
	<script>
		/* 수정, 조회 후 현재 페이지로 다시 리다이렉트하게 하기 위해 hidden으로 현재 페이지 정보 넘겨줌 */
		let moveForm = $("#moveForm");

		$(".move").on("click", function(e) {
			e.preventDefault();
			moveForm.append("<input type='hidden' name='orderNo' value='"
							+ $(this).attr("href") + "'>");
			moveForm.attr("action", "/adminorderlist");
			moveForm.submit();
		});		
		
		/* 페이징 버튼 동작시키기 위한 코드*/
		$(".page-link").on("click", function(e) {

			e.preventDefault();
			/* form 태그 내부 pageNum과 관련된 input 태그의 value 값을 클릭한 a태그의 페이지 번호로 삽입 */
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			/* form태그 action 속성 추가 및 "/partall"을 속성값으로 추가 */
			moveForm.attr("action", "/adminorderlist");
			/* form 태그 서버 전송 */
			moveForm.submit();

		});
	</script>
</body>
</html>
