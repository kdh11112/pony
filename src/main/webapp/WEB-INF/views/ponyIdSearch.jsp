<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet" />
    <title>아이디 찾기</title>
</head>
<body>

	<section class="vh-100">

		
			<div class="container py-5 h-100">
				
				<div class="row d-flex justify-content-center align-items-center h-100">
				
					<div class="col-12 col-md-8 col-lg-6 col-xl-5">
						
						
						<div class="card shadow-2-strong" style="border-radius: 1rem;">
							
							
							
							<div align="center">
								<img src="images/pony_motors_log_cut.png" alt="" align="middle" />
							</div>


							<div class="card-body p-5 text-center">


								<form action="ponyRegOk" id="frm" method="post">

								<div class="form-outline mb-4">
								  <div class="row">
								    <div class="col">
								      <div class="form-floating">
								        <input type="text" id="ponyMemberEmail" name="email" class="form-control form-control-lg shadow-sm" oninput = "checkId()"/>
								        <label>Email</label>
								      </div>
								      <span id="emailValidationMsg" style="color: red; display: none;">올바른 이메일 형식이 아닙니다.</span>
								      <span id="emailAlready" style="color: red; display: none;">사용중인 이메일입니다.</span>
								    </div>
								    <div class="col-auto">
								      <button type="button" class="btn btn-primary btn-lg" style="width: 82px; height: 45px" onclick="id serach()" disabled="disabled">찾기</button>
								    </div>
								  </div>
								</div>
						
						</form>


							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	

    

    
</body>
</html>