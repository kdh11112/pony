<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet" />

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


								<form action="ponyRegOk" method="post">

									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="email" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
													<label for="typeEmailX-2">Email</label>
												</div>
											</div>
											
											<div class="col-auto">
												<button class="btn btn-primary btn-lg" style="width: 82px; height: 45px">인증</button>
											</div>
										</div>
									</div>

									<div class="form-outline mb-4">
										<div class="row">

											<div class="col">
												<div class="form-floating">
													<input type="email" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
													<label for="typeEmailX-2">인증번호</label>
												</div>
											</div>

											<div class="col-auto">
												<button class="btn btn-primary btn-lg"
													style="width: 82px; height: 45px">확인</button>
											</div>

										</div>
									</div>

									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="email" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
													<label for="typeEmailX-2">Password</label>
												</div>
											</div>
										</div>
									</div>

									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="email" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
													<label for="typeEmailX-2">ConfirmPassword</label>
												</div>
											</div>
										</div>
									</div>




									<div class="form-outline mb-4">
									    <div class="row">
									        <div class="col" style="width: 155px">
									            <div class="form-floating d-flex align-items-center" style="width: 185px">
									                <input type="text" id="firstInput" class="form-control form-control-lg shadow-sm" maxlength="6" />
									                <label for="firstInput">RegNumberFist</label>
									            </div>
									        </div>
									        <div class="col-auto" style="width: 30px; margin-right: 20px;">
									            <div class="form-floating d-flex align-items-center" style="width: 30px">
									                <input type="text" id="secondInput" class="form-control form-control-lg shadow-sm" maxlength="1" />
									            </div>
									        </div>
									        <div class="col-auto align-self-center">
									            <div style="display: flex; align-items: center; padding-top: 20px;">
									                <span style="margin-right: 5px">*</span>
									                <span style="margin-right: 5px">*</span>
									                <span style="margin-right: 5px">*</span>
									                <span style="margin-right: 5px">*</span>
									                <span style="margin-right: 5px">*</span>
									                <span style="margin-right: 5px">*</span>
									            </div>
									        </div>
									        <div class="col-auto">
									            <button class="btn btn-primary btn-lg" style="width: 82px; height: 45px;">확인</button>
									        </div>
									    </div>
									</div>
									
									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="email" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
													<label for="typeEmailX-2">Phone</label>
												</div>
											</div>
										</div>
									</div>
									
									
									
									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="email" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
													<label for="typeEmailX-2">Address</label>
												</div>
											</div>
										</div>
									</div>


									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="email" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
													<label for="typeEmailX-2">Address2</label>
												</div>
											</div>
										</div>
									</div>

							<div align="center">
							<button class="btn btn-primary btn-lg btn-block" type="submit" style=" width: 300px; height: 45px">Sign up</button>
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