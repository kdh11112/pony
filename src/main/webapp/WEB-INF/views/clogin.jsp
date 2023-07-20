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
						<div class="card-body p-5 text-center">

							<h3 class="mb-5">커스텀 로그인</h3>

							<div class="form-outline mb-4">
								<input type="email" id="typeEmailX-2"
									class="form-control form-control-lg" /> <label
									class="form-label" for="typeEmailX-2">Email</label>
							</div>

							<div class="form-outline mb-4">
								<input type="password" id="typePasswordX-2"
									class="form-control form-control-lg" /> <label
									class="form-label" for="typePasswordX-2">Password</label>
							</div>

							<!-- Checkbox -->
							<div class="form-check d-flex justify-content-start mb-4">
								<input class="form-check-input" type="checkbox" value=""
									id="form1Example3" /> <label class="form-check-label"
									for="form1Example3"> Remember password </label>
							</div>

							<button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>

							<hr class="my-4">

							<div class="d-flex justify-content-center">
								<button class="btn btn-lg btn-block"
									style="background-color: #dd4b39; width: 300px; height: 45px; margin-bottom: 20px">
								</button>
								
							</div>
							<div>
								<button class="btn btn-primary btn-lg btn-white" type="submit">
									<img src="images/kakao_login_medium_wide.png" alt="" style="width: 100%;" />
								</button>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>