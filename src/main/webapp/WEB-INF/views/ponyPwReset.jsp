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
<meta charset="UTF-8">
<title>Insert title here</title>
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
								      <button type="button" class="btn btn-primary btn-lg" style="width: 82px; height: 45px" onclick="sendAuthCode()" disabled="disabled">인증</button>
								    </div>
								  </div>
								</div>

									<div class="form-outline mb-4">
										<div class="row">

											<div class="col">
												<div class="form-floating">
													<input type="text" id="authCode" class="form-control form-control-lg shadow-sm" />
													<label>인증번호</label>
													<span id="authCodeTimer" style="color: red; display: none;">남은시간 : </span>
												</div>
											</div>

											<div class="col-auto">
												<button type="button" class="btn btn-primary btn-lg" style="width: 82px; height: 45px" type="button" onclick="autoemail()">확인</button> <!-- 여기 누르면 Post요청 보내기 -->
											</div>

										</div>
									</div>

									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="password" id="password" name="password" value="aaaa" class="form-control form-control-lg shadow-sm" />
													<label>Password</label>
													<span id="passwordValidationMsg" style="color: red; display: block;">비밀번호를 입력해주세요.</span>
												</div>
											</div>
										</div>
									</div>

									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="password" id="password2" value="aaaa" class="form-control form-control-lg shadow-sm" />
													<label>ConfirmPassword</label>
													<span id="passwordValidationMsg2" style="color: red; display: none;">비밀번호와 일치하지 않습니다.</span>
												</div>
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