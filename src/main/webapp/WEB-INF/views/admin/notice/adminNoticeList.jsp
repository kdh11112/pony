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
	        	<section class="notice">
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
									<td colspan="4">
										<nav aria-label="Page navigation example">
											<ul class="pagination">
												<c:if test="${map.prev }">
													<li class="page-item"><a class="page-link"
														href="list?currentPage=${map.currentPage-5 }">이전</a></li>
												</c:if>
												<c:forEach var="i" begin="${map.startPageNo }"
													end="${map.endPageNo }">
													<li class="page-item"><a class="page-link"
														href="adminnotice?currentPage=${i }">${i }</a></li>
												</c:forEach>
												<c:if test="${map.next }">
													<li class="page-item"><a class="page-link"
														href="adminnotice?currentPage=${map.currentPage+5 }">다음</a></li>
												</c:if>
											</ul>
										</nav>
									</td>
								</tr>
				            </table>
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
</body>
</html>
