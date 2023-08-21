<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<title>PONY MOTORS</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">

<!-- JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/bootstrap-datepicker.ko.min.js"></script>
<style>
.main-panel {
  min-height: 100vh;
}
.Search{
	margin-left: 50px;
	display: flex;
	align-items: center;
	justify-content: center;

}

</style>

<body class="">
	<div class="wrapper ">
		<%@ include file="./side.jsp"%>
		<div class="main-panel">
			<!-- Navbar -->
			<%@ include file="./navi.jsp"%>
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-user " style="height: 85px;">
							<div class="card-body">
								<form action="/reg/reservation" method="get">
									<div class="row">
										<div class="Search">
											<div class="form-row align-items-center">
												<div class="form-group mb-0">
													<input type="text" class="form-control" placeholder="예약자"
														id="memberName" name="memberName">
												</div>
											</div>
										</div>
										<div class="Search">
											<div class="form-row align-items-center">
												<div class="form-group mb-0" style="padding-left: 50px;">
													<button type="submit" class="btn btn-primary btn-round"
														id="nameSearch">검색</button>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="card card-user">
							<div class="card-body">
								<table class="table">
									<tr class="trRow">
										<th>예약번호</th>
										<th>접수일</th>
										<th>차량번호</th>
										<th>예약자</th>
										<th>예약지점</th>
										<th>고객요청사항</th>
										<th>입고예정일</th>
									<tr>
									<c:forEach var="list" items="${list }">
											<tr class="trRow">
												<td>${list.reservationNo}</td>
												<td>${list.reservationDate}</td>
												<td>${list.clientCarNumber}</td>
												<td>${list.memberName}</td>
												<td>${list.shopAreaPoint}</td>
												<td>${list.reservationClientRequests}</td>
												<td>${list.reservationDueDate}</td>
											</tr>
										</c:forEach>
									<tr>
										<td colspan="6" class="pagetd">
											<nav aria-label="Page navigation example">
												<ul class="pagination">
													<c:forEach var="num" begin="${pageMaker.startPage }"
														end="${pageMaker.endPage }">
														<li class="page-item"><a class="page-link"
															href="${num }">${num }</a></li>
													</c:forEach>
												</ul>
											</nav>
										</td>
									</tr>
								</table>
								<form id="moveForm" method="get">
									<input type="hidden" name="pageNum"
										value="${pageMaker.cri.pageNum }"> <input
										type="hidden" name="perPageNum"
										value="${pageMaker.cri.perPageNum }">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		/* 수정, 조회 후 현재 페이지로 다시 리다이렉트하게 하기 위해 hidden으로 현재 페이지 정보 넘겨줌 */
		let moveForm = $("#moveForm");
	
		$(".move").on("click", function(e) {
			e.preventDefault();
			moveForm.append("<input type='hidden' name='reservationNo' value='"
							+ $(this).attr("href") + "'>");
			moveForm.attr("action", "/reg/reservation");
			moveForm.submit();
		});		
	
		/* 페이징 버튼 동작시키기 위한 코드*/
		$(".page-link").on("click", function(e) {

			e.preventDefault();
			/* form 태그 내부 pageNum과 관련된 input 태그의 value 값을 클릭한 a태그의 페이지 번호로 삽입 */
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			/* form태그 action 속성 추가 및 "/questionlist"을 속성값으로 추가 */
			moveForm.attr("action", "/reg/reservation");
			/* form 태그 서버 전송 */
			moveForm.submit();

		});
	</script>

</body>
</html>