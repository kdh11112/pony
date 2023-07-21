<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css"
	rel="stylesheet" />

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section class="vh-100">
	
	
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-8 col-lg-6 col-xl-5">
					<div class="card shadow-2-strong" style="border-radius: 1rem;">
					<div align="center">
						<img src="images/pony_motors_log_cut.png" alt="" align="middle" />
					</div>
						<div class="card-body p-5 text-center">
						
						
						<form action="login" method="post">

							<div class="form-outline mb-4">
								<input type="email" name="email" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
								<label class="form-label" for="typeEmailX-2">Email</label>
							</div>


							<div class="form-outline mb-4">
								<input type="password" id="typePasswordX-2" name="password" class="form-control form-control-lg shadow-sm" />
								<label class="form-label" for="typePasswordX-2">Password</label>
							</div>

							<!-- Checkbox  체크박스 -->
							<div class="form-check d-flex justify-content-start mb-4" >
								<input class="form-check-input" type="checkbox" name="remember" value="" id="form1Example3" />
								 <label class="form-check-label" for="form1Example3"> Remember password </label>
							</div>
							
							<div align="center">
							<button class="btn btn-primary btn-lg btn-block" type="submit" style=" width: 300px; height: 45px">Login</button>
							</div>
							


							<div class="d-flex justify-content-center">
								<button class="btn btn-lg btn-block" 
									style="background-color: #dd4b39; color: white; width: 300px; height: 45px; padding: 0px; margin: 10px;">
									<i class="fab fa-google me-2" style="color: white;"></i> Sign in with google <!-- 이거 누르면 구글로그인으로  -->
								</button>


							</div>

							<div>
								<button class="btn btn-primary btn-lg btn-white shadow-sm" type="submit"
									style="padding: 0px;">
									<img src="images/kakao/kakao_login_medium_wide.png" alt="" 
										style="width: 100%;" />  <!-- 이거 누르면 카카오로그인으로  -->
								</button>
							</div>
							
							<hr class="my-4">
						
							</form>
						
						<form action="ponyreg" method="get">
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