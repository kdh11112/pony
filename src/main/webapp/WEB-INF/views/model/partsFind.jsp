<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- css링크 -->
<link rel="stylesheet" href="../css/model/modelFind.css">
<link rel="stylesheet" href="../css/model/partsFind.css">

</head>

<body>
		<div>
			<img src="../images/model/vs_top.png" id="topImg">
		</div>
		<div id="whiteBar"></div>
		<div id="whiteBar2">
			<div class="top-title text-center">
				<h1 class="top-title-text">부품 검색</h1>
				<h1 class="top-title-text2">원하는 부품의 가격을 쉽게 찾아볼 수 있습니다</h1>
			</div>
			<div>
				<div></div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-12">
							<div class="card mx-auto" style="width: 80%">
								<h5 class="card-title text-center">부품 검색</h5>
								<div class="search-text-btn row">
									<div class="col-md-10">
										<input type="text" class="row" name="" id="parts-find-text"
											placeholder="부품명을 입력 해주세요" spellcheck="false"> 
									</div>
									<div class="col-md-2">
										<button type="button" class="btn btn-secondary"
											id="parts-find-btn">검색</button>
									</div>
								</div>
								<div class="select text-center"></div>
								<div class="card-text row">
									<div class="col-md-1"></div>
									<div class="col-md-7">부품명</div>
									<div class="col-md-3">금액</div>
								</div>
								<div class="card-body"></div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="vs-btn"></div>
		</div>
	<!-- js링크 -->
	<script src="../js/model/partsFind.js"></script>
</body>
</html>