<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 날짜의 형식을 지정할 수 있음. 데이터 베이스에서 날짜의 형식을 바꿀수도있지만 jstl로 변경할수도있다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>PONY ADMIN</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/admin/css/styles.css" rel="stylesheet" />
<link href="css/admin/css/board.css" rel="stylesheet" />

</head>
<body>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<div class="border-end bg-white" id="sidebar-wrapper">
			<div class="sidebar-heading border-bottom bg-light">
				<img alt="" src="css/admin/assets/invi.png"> 
				<a class="logo-link" href="/admin"> PONY Admin</a>
			</div>
			<div class="list-group list-group-flush">
               	<a class="list-group-item list-group-item-action list-group-item-light p-3" href="/adminpartlist">재고관리</a>
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
					<img id="sidebarToggle" src="css/admin/assets/list.png">
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
							<li class="nav-item active"><a class="nav-link" href="/admin">AdminHome</a></li>
	                        <li class="nav-item"><a class="nav-link" href="/">UserPage</a></li>
	                        <li class="nav-item dropdown">
	                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
	                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
	                                <a class="dropdown-item" href="#!">Action</a>
	                                <a class="dropdown-item" href="#!">Another action</a>
	                                <div class="dropdown-divider"></div>
	                                <a class="dropdown-item" href="#!">Something else here</a>
								</div>
							</li>
						</ul>
					</div> 
				</div>
			</nav>
			<!-- Page content-->
	        <div class="container-fluid">
	        	<section class="boardsection">
  					<div class="page-title">
						<div class="container">
							<h3>공지사항</h3>
        				</div>
    				</div>
    							
    				<!-- board list area -->
				    <div id="board-list">
				        <div class="container">
				            <table class="board-table">
				                <thead>
					                <tr>
					                    <th scope="col" class="th-num">번호</th>
					                    <th scope="col" class="th-title">제목</th>
					                    <th scope="col" class="th-date">등록일</th>
					                    <th scope="col" class="th-view">조회수</th>
					                </tr>
				                </thead>
				                <tbody>
					                <c:forEach var="list" items="${list }">
						                <tr>
						                    <td>${list.noticeNo }</td>
						                    <th>
						                      <a href="admindetail?noticeNo=${list.noticeNo}">${list.noticeTitle }</a>
						                      <p>테스트</p>
						                    </th>
						                    <td><fmt:parseDate var="dateString"
													value="${list.noticeDate }" pattern="yyyy-MM-dd" /> 
												<fmt:formatDate
													value="${dateString }" pattern="yyyy-MM-dd" /></td>
						                    <td>${list.noticeHits }</td>
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
			                        <a href="/noticewrite">
			                        	<button type="button" class="btn btn-dark" >글작성</button>
			                        </a>
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
			moveForm.append("<input type='hidden' name='noticeNo' value='"
							+ $(this).attr("href") + "'>");
			moveForm.attr("action", "/adminnotice");
			moveForm.submit();
		});		
		
		/* 페이징 버튼 동작시키기 위한 코드*/
		$(".page-link").on("click", function(e) {

			e.preventDefault();
			/* form 태그 내부 pageNum과 관련된 input 태그의 value 값을 클릭한 a태그의 페이지 번호로 삽입 */
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			/* form태그 action 속성 추가 및 "/partall"을 속성값으로 추가 */
			moveForm.attr("action", "/adminnotice");
			/* form 태그 서버 전송 */
			moveForm.submit();

		});
	</script>
</body>
</html>
