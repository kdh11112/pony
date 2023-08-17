<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- css링크 -->
<link rel="stylesheet" href="../css/model/modelFind.css">
</head>
<style>
#parts-find-text{
	margin-left : 100px;
	width: 80%;
	height: 50px;
}
#parts-find-btn{
	width: 100px;
	height: 50px;
	
}
.search-text-btn{
	margin-top: 30px;
	margin-bottom: 30px;
}
.card{
	background-color: #EAEBE6;
}
.card-text{
	font-size: 20px;
	font-weight: bold;
	color: #5E5E5E;
	text-align: center;
	height: 50px;
}
.card-body{
	font-size: 15px;
	font-weight: bold;
	color: #5E5E5E;
	text-align: center;
	padding: 0px;
	margin-bottom: 30px;
}
.asd{
	background-color: white;
}
.col-md-3{
	margin-left: 20px;
}
.searched-parts{
	font-size: 15px;
	
}
.searched-col{
	border-top: 10px solid white;
	border-bottom: 10px solid white;
}
</style>
<body>
	<form action="/modelDetail" id="frm">
	    <div><img src="../images/model/vs_top.png" alt="" id="topImg"></div>
	    <div id="whiteBar"></div>
	        <div id="whiteBar2">
	            <div class="top-title text-center">
	                <h1 class="top-title-text">부품 검색</h1>
	                <h1 class="top-title-text2">원하는 부품의 가격을 쉽게 찾아볼 수 있습니다</h1>
	            </div>
	            <div>
	            <div class="container">
	                <div class="row justify-content-center">
	                    <div class="col-md-12">
	                        <div class="card mx-auto" style="width: 80%">
	                            <h5 class="card-title text-center">부품 검색</h5>
	                            <div class="search-text-btn row">
	                            	<div class="col-md-10"><input type="text" name="" id="parts-find-text" placeholder="부품명을 입력 해주세요" ></div>
		                        	<div class="col-md-2"><button type="button" class="btn btn-secondary" id="parts-find-btn">검색</button></div>
	                            </div>
	                            <div class="select text-center">
	                            </div>
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
	            <div class="vs-btn">
	                
	            </div>
	        </div>
	    </div>
    </form>
    <!-- js링크 -->
    <script src="../js/model/partsFind.js"></script>
</body>
</html>