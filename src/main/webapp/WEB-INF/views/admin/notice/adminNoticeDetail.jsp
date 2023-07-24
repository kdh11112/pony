<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
<title>PONY ADMIN</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/admin/css/styles.css" rel="stylesheet" />
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
                       <img id="sidebarToggle" src="css/admin/assets/list.png">공지사항</img>
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
			<div class="container">
				<table class="table">
					<tr>
						<th>번호</th>
						<td colspan="2">${detail.noticeNo }</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${detail.noticeDate }</td>
						
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="5">${detail.noticeTitle }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="5">${detail.noticeContents }</td>
					</tr>
					<tr>
						<td colspan="6">
							<a href="/adminnotice"><input type="button" class="btn btn-outline-dark" value="목록" /></a>
							<a href="adminmodify?noticeNo=${detail.noticeNo }" class="btn btn-outline-secondary">수정</a>
							<a href="admindelete?noticeNo=${detail.noticeNo }"><input type="button" class="btn btn-outline-danger" value="삭제" /></a>		
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="css/admin/js/scripts.js"></script>
</body>
</html>