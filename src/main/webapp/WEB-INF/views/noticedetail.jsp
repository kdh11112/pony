<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<title>PONY MOTORS</title>
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

#mycarinfo {
	border: 1px solid #dedede;
	box-sizing: border-box;
	width: 800px;
	height: 800px;
	margin: 0px 1%;
	float: right;
}

.title {
	margin: 0 30px;
}

.no-car, .sub {
	margin: 10px 40px;
}

.head {
	margin: 20px 60px;
}

.infomodify_btn {
	margin-left: 13px;
}

.mycarTitle {
	margin-top: 20px;
}
</style>
</head>
<body>
<!-- Navigation-->
		<jsp:include page="/WEB-INF/views/gnav.jsp" />
		<!-- Header-->
		<header>

			<img src="images/cloud.jpg" alt="" />
			<div class="header-content text-center text-black">
				<h1 class="display-4 fw-bolder">공지사항</h1>
				<p class="lead fw-normal text-black-50 mb-0">자주하는 질문, ARS 상담, 구매가이드 등 도움이 되는 정보를 한 눈에 확인해보세요.</p>
			</div>

		</header>
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
					<a href="notice"><input type="button" class="btn btn-outline-dark" value="목록" /></a>
					<%-- <a href="modify?noticeNo=${detail.noticeNo }" class="btn btn-outline-secondary">수정</a>
					<a href="delete?noticeNo=${detail.noticeNo }"><input type="button" class="btn btn-outline-danger" value="삭제" /></a> --%>	
				</td>
				
			</tr>
		</table>
	</div>
</body>
</html>