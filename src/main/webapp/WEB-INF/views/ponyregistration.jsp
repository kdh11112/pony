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


								<form action="ponyRegOk" method="post" onsubmit="return false;">

									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="email" id="ponyMemberEmail" class="form-control form-control-lg shadow-sm" />
													<label for="ponyMemberEmail">Email</label>
												</div>
											</div>
											
											<div class="col-auto">
												<button class="btn btn-primary btn-lg" style="width: 82px; height: 45px" onclick="sendAuthCode()">인증</button>
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
											<div class="col">
												<div class="form-floating">
													<input type="email" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
													<label for="typeEmailX-2">FullName</label>
												</div>
											</div>
										</div>
									</div>

<div class="form-group">
    <div class="form-outline mb-4">
        <div class="d-flex align-items-center">
            <div style="flex: 0 0 155px;">
                <div class="form-floating">
                    <input type="text" id="firstInput" class="form-control form-control-lg shadow-sm" maxlength="6" />
                    <label for="firstInput">RegNumberFist</label>
                </div>
            </div>
            <div style="margin-left: 10px;">
                <input type="text" id="secondInput" class="form-control form-control-lg shadow-sm" maxlength="1" style="width: 30px; height: 58px;" />
            </div>
            <div class="d-flex align-items-center">
                <span style="margin-right: 5px">* * * * * *</span>
            </div>
            <div style="margin-left: auto;">
                <button class="btn btn-primary btn-lg" style="width: 82px; height: 45px;">확인</button>
            </div>
        </div>
    </div>
</div>




									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="text" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
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
													<label for="typeEmailX-2">ZipCode</label>
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
													<input type="text" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
													<label for="typeEmailX-2">Address</label>
												</div>
											</div>
										</div>
									</div>


									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="text" id="typeEmailX-2" class="form-control form-control-lg shadow-sm" />
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
	
	
	
	<script>
  function sendAuthCode() {
    // 인증 버튼을 눌렀을 때 실행되는 비동기 POST 요청
    // 폼 데이터를 가져와서 fetch() 메서드를 사용하여 서버로 POST 요청 보냄
    // 구현 방법은 이전에 설명한 것과 동일

    // 예시 코드:
    const emailInput = document.getElementById('ponyMemberEmail');
    const emailValue = emailInput.value;

    // FormData를 사용하여 폼 데이터 생성
    const formData = new FormData();
    formData.append('email', emailValue);

    // fetch()를 사용하여 서버로 POST 요청 보냄
    fetch('mailConfirm', {
      method: 'POST',
      body: formData
    })
      .then(response => response.json()) // JSON 형식으로 응답 파싱 (옵션이며, 응답 형식에 따라 사용)
      .then(data => {
        // 서버에서 받은 응답 데이터를 처리
        console.log(data);
      })
      .catch(error => {
        // 오류 처리
        console.error('Error:', error);
      });
  }
  
  </script>

</body>
</html>