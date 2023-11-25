<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<title>PONY MOTORS</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- css링크 -->
<link rel="stylesheet" href="../css/model/modelComparison1.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/gnav.jsp" />
	<form action="/model/modelComparison2" id="frm">
	<header>
		<img src="../images/model/banner_v01.jpg" alt="" />
		<div class="header-content text-center text-black">
			<p class="lead fw-normal text-black-50 mb-0"></p>
		</div>
	</header>
		<div id="whiteBar"></div>
		<div id="whiteBar2">
			<div class="top-title text-center">
				<h1 class="top-title-text">모델 비교</h1>
				<h1 class="top-title-text2">판매되는 차량을 빠르게 비교하여 원하는 차량을 쉽게 찾아볼 수
					있습니다</h1>
			</div>
			<div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-6">
							<div class="card mx-auto" style="width: 25rem;">
								<h5 class="card-title text-center">A차량 선택</h5>
								<div class="select text-center">
									<select class="selectModel btn btn-secondary" id="selectModel1"
										name="selectModel1">
										<option value="">차량선택</option>
										<c:forEach var="data" items="${model}">
											<option value="${data.modelName}">${data.modelName}</option>
										</c:forEach>
									</select>
								</div>
								<p class="card-text"></p>
								<img src="../images/model/vs_logo.jpg" class="card-img-top"
									alt="..." id="card-img1">
								<div class="card-body"></div>
							</div>
						</div>

						<div class="col-md-6">
							<div class="card mx-auto" style="width: 25rem">
								<h5 class="card-title text-center">B차량 선택</h5>
								<div class="dropdown text-center">
									<select class="selectModel btn btn-secondary" id="selectModel2"
										name="selectModel2">
										<option value="">차량선택</option>
										<c:forEach var="data" items="${model}">
											<option value="${data.modelName}">${data.modelName}</option>
										</c:forEach>
									</select>
								</div>
								<p class="card-text"></p>
								<img src="../images/model/vs_logo.jpg" class="card-img-top"
									alt="..." id="card-img2">
								<div class="card-body"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="vs-btn">
					<button type="button" class="btn btn-secondary">모델 비교</button>
				</div>
			</div>
		</div>
	</form>
	<!-- js링크 -->
	<script src="../js/model/modelComparison1.js"></script>
</body>
</html>