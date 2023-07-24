<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	                <img id="sidebarToggle" src="css/admin/assets/list.png"></img>
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
            				<h3>고객문의</h3>
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
			                </tr>
			                </thead>
			                <tbody>
			                <tr>
			                    <td>3</td>
			                    <th>
			                      <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
			                      <p>테스트</p>
			                    </th>
			                    <td>2017.07.13</td>
			                </tr>
			                </tbody>
			            </table>
			        </div>
			    </div>
			
			    <!-- board search area -->
			    <div id="board-search">
			        <div class="container">
			            <div class="search-window">
			                <form action="">
			                    <div class="search-wrap">
			                        <label for="search" class="blind">공지사항 내용 검색</label>
			                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
			                        <button type="submit" class="btn btn-dark">검색</button>
			                    </div>
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