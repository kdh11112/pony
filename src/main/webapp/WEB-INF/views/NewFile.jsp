<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<style>
    table {
      border-collapse: collapse;
      width: 50%;
      margin: auto;
    }

    th, td {
      border: 1px solid black;
      padding: 8px;
      text-align: center;
    }
  </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:set var="x" value="3" /> <!-- x 값 설정 -->
<c:set var="y" value="5" /> <!-- y 값 설정 -->

<table>
  <thead>
    <tr>
      <th>행 / 열</th>
      <c:forEach var="col" begin="1" end="${y-1}">
        <th>${col}열</th>
      </c:forEach>
      <th>${y}열</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="row" begin="1" end="${x}">
      <tr>
        <td>${row}행</td>
        <c:forEach var="col" begin="1" end="${y-1}">
          <c:choose>
            <c:when test="${col + row <= y}">
              <td>${row}-${col}</td>
            </c:when>
            <c:otherwise>
              <td></td>
            </c:otherwise>
          </c:choose>
        </c:forEach>
        <td>${row}-${y}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>


</body>
</html>