<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
		<td>deptno</td>
		<td>dname</td>
		<td>loc</td>
	</tr>
	<c:forEach var="dept" items="${deptList}">
		<tr>
	       <td >"${ dept.deptno }"</td>
	       <td >"${ dept.dname }"</td>
	       <td >"${ dept.loc }"</td>
	    </tr>
    </c:forEach>
	</table>
</body>
</html>