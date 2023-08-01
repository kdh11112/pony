<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 날짜의 형식을 지정할 수 있음. 데이터 베이스에서 날짜의 형식을 바꿀수도있지만 jstl로 변경할수도있다. -->
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<!-- 접근주체 : principal : 보호된 대상에 접근하는 유저 -->
   <p><sec:authentication property="principal"/></p>
   <h1>${name }</h1>
   <%-- <p>user : <sec:authentication property="principal.username"/></p>
   <p>password : <sec:authentication property="principal.password"/></p> --%>
   
   <!-- 권한이 있는지 여부확인 -->
   <%-- <p>/member에 접근할 수 있는지 : <sec:authorize url="/member" var="t">${t}</sec:authorize></p>
   <p>ROLE_USER 권한을 가지고 있는지 <sec:authorize access="hasRole('ROLE_USER')" var="u">${u}</sec:authorize></p> --%>
   
   <%-- <sec:authorize ifNotGranted='ROLE_USER'>
      </sec:authorize>
    --%>
   <%-- <sec:authorize access="!hasAnyRole('ROLE_USER')">
      <p>로그인 안되면 이부분이 출력됩니다.</p>
   </sec:authorize>
   <sec:authorize access="hasAnyRole('ROLE_USER')">
   
   <sec:authorize ifAnyGranted='ROLE_USER'>
      <a href="/clogout"><sec:authentication property="principal.username"/>님 로그아웃</a>
   </sec:authorize> --%>
   

      <%--    <tr>
            <td colspan="4">
            <c:forEach var="i" begin="1" end="10">
                  <a href="list?currentPage=${i }">${i }</a>
               </c:forEach></td>
         </tr> --%>



</body>
</html>