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

<script>
//로그인 폼의 Submit 이벤트 처리 (login.js)
document.getElementById("loginForm").addEventListener("submit", function (event) {
  event.preventDefault(); // 기본 Submit 동작 막기

  const formData = new FormData(event.target);

  // 폼 데이터를 서버로 전송
  const xhr = new XMLHttpRequest();
  xhr.open("POST", "/login_proc", false); // 동기적으로 요청 처리 (false)
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  xhr.send(new URLSearchParams(formData).toString());

  if (xhr.status === 200) {
    // 응답이 성공적으로 돌아왔을 때 리다이렉트
    window.location.href = "/"; // 리다이렉트될 페이지로 이동
  } else {
    console.error("Error:", xhr.statusText);
  }
});
</script>

<script>
function redirectToGoogle() {
    window.location.href = "oauth2/authorization/google";
}

function redirectToKaKao(){
	window.location.href = "oauth2/authorization/kakao"
}
</script>


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
						
						
						<form action="/login_proc" method="post">

							<div class="form-outline mb-4">
								<input type="email" name="email" id="email" class="form-control form-control-lg shadow-sm" value="djw2717@naver.com"/>
								<label class="form-label">Email</label>
							</div>


							<div class="form-outline mb-4">
								<input type="password" id="password" name="password" class="form-control form-control-lg shadow-sm" value="aaaa"/>
								<label class="form-label">Password</label>
							</div>

							<!-- Checkbox  체크박스 -->
							<div class="form-check d-flex justify-content-start mb-4" >
								<input class="form-check-input" type="checkbox" name="remember" value="" id="" />
								 <label class="form-check-label"> Remember password </label>
							</div>
							
							<div align="center">
							<button class="btn btn-primary btn-lg btn-block" type="submit" style=" width: 300px; height: 45px">Login</button>
							</div>
							


							<div class="d-flex justify-content-center">
								<button class="btn btn-lg btn-block" onclick="redirectToGoogle()"
									style="background-color: #dd4b39; color: white; width: 300px; height: 45px; padding: 0px; margin: 10px;">
									<i class="fab fa-google me-2" style="color: white;"></i> Sign in with google <!-- 이거 누르면 구글로그인으로  -->
								</button>


							</div>

							<div>
								<button class="btn btn-primary btn-lg btn-white shadow-sm" type="submit" onclick="redirectToKaKao()"
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