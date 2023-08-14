<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<title>PONY MOTORS</title>
<link href="css/admin/css/order.css" rel="stylesheet" />
<link href="css/admin/css/ordersheet.css" rel="stylesheet" />
<link href="css/admin/css/common.css" rel="stylesheet" />
<link href="css/admin/css/nav.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<style id="gnb_style" type="text/css"></style>
<script type="text/javascript" src="https://ssl.pstatic.net/tveta/libs/glad/prod/2.18.0/gfp-sdk.js" charset="utf-8"></script>
<script src="https://ssl.pstatic.net/static.gn/js/clickcrD.js" id="gnb_clickcrD" charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>
<form action="/updateInfo" method="post">
    <label for="memberName">이름:</label>
    <input type="text" id="memberName" name="memberName" value="${memberName}" /><br>

    <label for="memberPhone">전화번호:</label>
    <input type="text" id="memberPhone" name="memberPhone" value="${memberPhone}" /><br>

    <input type="submit" value="정보 수정" />
</form>
</body>


</html>