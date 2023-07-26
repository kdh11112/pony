<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<style>
.board-table tbody td, 
.board-table tfoot td {
  text-align: left !important;
}

.board-table tbody th, 
.board-table tfoot th {
  padding: 0px !important;
}
.btn-primary {
	padding: 10 50px !important;
	cursor: none !important;
	display: none;
	background: none;
	font: black !important;
}
</style>
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
							<h3>고객문의</h3>
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
										<td class="td-answer" id="answernullTd">
											<form action="/answer" method="post">
												<input type="hidden" name="questionNo" value="${detail.questionNo }">
												<!-- 답변이 없는 경우 -->
												<textarea name="answer" id="answerTextarea" cols="100" rows="5"></textarea>
												<input type="submit" value="작성" id="write" class="btn btn-primary"/>
											</form>
										</td>
										<td id="answerTd" style="display: none;">${answerdetail.answerContents }</td>
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
	<script>
    // JavaScript를 사용하여 답변이 있는지 여부를 확인하고 화면을 동적으로 변경하는 함수
    function checkAnswerStatus() {
        var answerTextarea = document.getElementById('answerTextarea');
        var answerTd = document.getElementById('answerTd');
        var writeButton = document.getElementById('write');

        // answerdetail 객체의 answerContents 값을 가져옴
        var answerContents = ${ answerdetail.getAnswerContents() };

        // answerContents 값이 null이 아니면 (답변이 있는 경우)
        if (answerContents) {
            answerTextarea.style.display = 'none'; // textarea 숨김
            answerTd.style.display = 'block'; // td 요소 보이기
            writeButton.style.display = 'none'; // 작성 버튼 숨김
        } else {
            answerTextarea.style.display = 'block'; // textarea 보이기
            answerTd.style.display = 'none'; // td 요소 숨김
            writeButton.style.display = 'block'; // 작성 버튼 보이기
        }
    }

    // 페이지 로드 시 답변 상태를 확인하여 화면을 설정함
    checkAnswerStatus();
</script>
</body>
</html>