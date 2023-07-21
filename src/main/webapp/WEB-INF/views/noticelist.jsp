<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 날짜의 형식을 지정할 수 있음. 데이터 베이스에서 날짜의 형식을 바꿀수도있지만 jstl로 변경할수도있다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
	integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<h2>list.jsp</h2>
	<div class="container">


		<!-- 전체사원의목록 -->
		<table class="table">

			<tr>
				<td colspan="6"><a href="noticewrite"><input type="button"
						class="btn btn-outline-secondary" value="글쓰기" /></a></td>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="list" items="${list }">
				<tr>
					<td>${list.noticeNo }</td>
					<td>${list.noticeTitle }</td>
					<td><a href="detail?noticeNo=${list.noticeNo}">${list.noticeContents }</a></td>
					<td>
						<fmt:parseDate var="dateString" value="${list.noticeDate }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate value="${dateString }" pattern="yyyy-MM-dd"/>
					</td>
					<td>${list.noticeHits }</td>
				</tr>
			</c:forEach>
			<tr>
			<td colspan="4">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  <c:if test="${map.prev }">
			    <li class="page-item"><a class="page-link" href="list?currentPage=${map.currentPage-5 }">이전</a></li>
			    </c:if>
			    <c:forEach var="i" begin="${map.startPageNo }" end="${map.endPageNo }">
			    <li class="page-item"><a class="page-link" href="notice?currentPage=${i }">${i }</a></li>
			    </c:forEach>
			    <c:if test="${map.next }">
			    <li class="page-item"><a class="page-link" href="notice?currentPage=${map.currentPage+5 }">다음</a></li>
			    </c:if>
			  </ul>
			</nav>
			</td>
			</tr>
		</table>

	</div>
</body>
</html>
