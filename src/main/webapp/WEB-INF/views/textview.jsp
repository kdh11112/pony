<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   <h1>${name}</h1>
   
   <!-- 토큰이 있는지 확인하는 JavaScript 코드 -->
   <script>
      // 토큰이 쿠키에 저장되어 있는지 확인
      const tokenCookie = document.cookie
         .split('; ')
         .find(row => row.startsWith('jwtToken='));
      if (tokenCookie) {
         const token = tokenCookie.split('=')[1];
         console.log('토큰이 존재합니다:', token);
      } else {
         console.log('토큰이 존재하지 않습니다.');
      }

      // 토큰이 로컬 스토리지에 저장되어 있는지 확인
      const tokenLocalStorage = localStorage.getItem('jwtToken');
      if (tokenLocalStorage) {
         console.log('토큰이 존재합니다:', tokenLocalStorage);
      } else {
         console.log('토큰이 존재하지 않습니다.');
      }
   </script>

</body>
</html>
