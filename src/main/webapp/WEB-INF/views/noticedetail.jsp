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
<title>Insert title here</title>
</head>
<body>
	<h3>detail.jsp</h3>
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
				</td>
			</tr>
		</table>
	</div>
</body>
</html>