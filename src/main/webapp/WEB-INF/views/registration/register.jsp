<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>일반접수</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="/css/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/css/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/css/plugins/iCheck/square/blue.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	var id="${list}"; 
	$('button[type=submit]').on("click",function(){
    	let mechanicNameId = $('#mechanicNameId').val();
    	if(mechanicNameId == null || mechanicNameId == "" || mechanicNameId == undefined || mechanicNameId == "undefined") {
            alert("이름을 입력해주세요");
            return false;
        }
    })
});
</script>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <img src="/css/assets/invi.png" alt="" />
  </div>

  <div class="register-box-body">
     <form action="/reg/register" method="post">
  	<div class="row">
  	    <div class="col-xs-7">
        </div>
        <div class="col-xs-5">
<%--     <select name="shopNo" class="form-control">
        <c:forEach items="${list}" var="shop">
            <option value="${shop.shopNo}">
                ${shop.shopArea} / ${shop.shopAreaPoint}
            </option>
        </c:forEach>
	</select> --%>
	<input type="hidden" name="shopNo" id="" value="${shopNo}"/>
	    </div>
    </div>

      <div class="form-group has-feedback">
        <input type="text" class="form-control" value="${Id }" placeholder="아이디" readonly="readonly">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="mechanicName" id="mechanicNameId" placeholder="이름">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="mechanicPw" placeholder="비밀번호">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
<!--       <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Retype password">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div> -->
      <div class="row">
        <div class="col-xs-8">
        <p>비밀번호 미설정시 <br/>지점번호+사원번호의 조합을 가짐</p>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat" id="rg">가입</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 2.2.3 -->
<script src="/css/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/css/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/css/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
    

  });
</script>
</body>
</html>