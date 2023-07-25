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


								<form action="ponyRegOk" id="frm" method="post" onsubmit="return false;">

								<div class="form-outline mb-4">
								  <div class="row">
								    <div class="col">
								      <div class="form-floating">
								        <input type="text" id="ponyMemberEmail" class="form-control form-control-lg shadow-sm" />
								        <label>Email</label>
								      </div>
								      <span id="emailValidationMsg" style="color: red; display: none;">올바른 이메일 형식이 아닙니다.</span>
								    </div>
								    <div class="col-auto">
								      <button class="btn btn-primary btn-lg" style="width: 82px; height: 45px" onclick="sendAuthCode()" disabled="disabled">인증</button>
								    </div>
								  </div>
								</div>

									<div class="form-outline mb-4">
										<div class="row">

											<div class="col">
												<div class="form-floating">
													<input type="text" id="authCode" class="form-control form-control-lg shadow-sm" />
													<label>인증번호</label>
												</div>
											</div>

											<div class="col-auto">
												<button class="btn btn-primary btn-lg" style="width: 82px; height: 45px" onclick="autoemail()">확인</button> <!-- 여기 누르면 Post요청 보내기 -->
											</div>

										</div>
									</div>

									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="password" id="password" value="aaaa" class="form-control form-control-lg shadow-sm" />
													<label>Password</label>
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
												</div>
											</div>
										</div>
									</div>


									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="text" id="fullName" value="Test" class="form-control form-control-lg shadow-sm" />
													<label>FullName</label>
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
									                    <label>RegNumberFist</label>
									                </div>
									            </div>
									            
									            <div style="margin-left: 10px;">
									                <input type="text" id="secondInput" value="888888" class="form-control form-control-lg shadow-sm" maxlength="1" style="width: 30px; height: 58px;" />
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
													<input type="text" id="phone" value="01055555555" class="form-control form-control-lg shadow-sm phone" maxlength="13" />
													<label>Phone</label>
												</div>
											</div>
										</div>
									</div>
									
									
									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="text" id="postcode" class="form-control form-control-lg shadow-sm">
													<label>ZipCode</label>
												</div>
											</div>
											
											<div class="col-auto">
												<button class="btn btn-primary btn-lg" onclick="execDaumPostcode()" style="width: 82px; height: 45px">검색</button>
											</div>
										</div>
									
									
										<div class="col">
											<div class="form-floating">
												<input type="text" id="address" class="form-control form-control-lg shadow-sm">
												<label>주소</label>
											</div>
										</div>
										
										<div class="form-outline mb-4 row">
										    <div class="col">
										        <div class="form-floating">
										            <input type="text" id="detailAddress" class="form-control form-control-lg shadow-sm">
										            <label>상세 주소</label>
										            <span id="guide" style="color:#999;display:none"></span>
										        </div>
										    </div>
										
										    <div class="col">
										        <div class="form-floating">
										            <input type="text" id="extraAddress" class="form-control form-control-lg shadow-sm">
										            <label>참고항목</label>
										            <span id="guide" style="color:#999;display:none"></span>
										        </div>
										    </div>
										</div>
										
							<div align="center" >
								<button id="regBtn" disabled="disabled" class="btn btn-primary btn-lg btn-block" style="width: 300px; height: 45px; margin-top: 20px;" onclick="submitForm()">Sign up</button>

							</div>
										
										
									</div>



								
						</form>


						
							

							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	
	
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>





<script> // 핸드폰번호 입력시 자동 하이픈 추가
  $(document).on("keyup", ".phone", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	});
  	
</script>
  
  
<script> // 인증번호 확인 스크립트
function autoemail() {
	
	const authInput = document.getElementById('authCode');
	const authValue = authInput.value;
	
	const formData = new FormData();
	formData.append('authcode', authValue);
	
	
	fetch('autoEmailOk', {
	  method: 'POST' ,
	  body: formData
	
	})
	 .then(data => { // 서버에서 받은 응답 데이터를 처리
       
	 if(data.status !== 200){
    	   console.log("실패")
    	   alert('실패하셧습니다.');
     }else{
       //성공하면 회원가입버튼 활성화
       //console.log(data);
    //   console.log("성공")
       alert('인증에 성공하셨습니다.')
       const regBtn = document.getElementById('regBtn');
       regBtn.disabled =  false;
       }
     })
     .catch(error => {
       // 오류 처리
       console.error('Error:', error);
     });
	
}

</script>
  
<script> // 이메일 인증번호 발송 스크립트
  function sendAuthCode() {
    // 인증 버튼을 눌렀을 때 실행되는 비동기 POST 요청
    // 폼 데이터를 가져와서 fetch() 메서드를 사용하여 서버로 POST 요청 보냄

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


<script>
function isValidEmail(email) {
	  // 간단한 이메일 형식 검사를 위한 정규식
	  const emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
	  return emailRegex.test(email);
	}

	document.getElementById('ponyMemberEmail').addEventListener('input', function() {
	  const emailInput = document.getElementById('ponyMemberEmail');
	  const emailValidationMsg = document.getElementById('emailValidationMsg');
	  const authButton = document.querySelector('.btn-primary');

	  if (isValidEmail(emailInput.value)) {
	    emailValidationMsg.style.display = 'none';
	    authButton.disabled = false;
	  } else {
	    emailValidationMsg.style.display = 'block';
	    authButton.disabled = true;
	  }
	});

</script>


<script>
function submitForm() {
	  const email = document.getElementById('ponyMemberEmail').value;
	  const password = document.getElementById('password').value;
	  const confirmPassword = document.getElementById('password2').value;
	  const fullName = document.getElementById('fullName').value;
	  const regNumberFirst = document.getElementById('firstInput').value;
	  const regNumberSecond = document.getElementById('secondInput').value;
	  const phone = document.getElementById('phone').value;
	  const postcode = document.getElementById('postcode').value;
	  const address = document.getElementById('address').value;
	  const detailAddress = document.getElementById('detailAddress').value;
	  const extraAddress = document.getElementById('extraAddress').value;

	  const formData = new FormData();
		  formData.append('email', email);
		  formData.append('password', password);
		  formData.append('confirmPassword', confirmPassword);
		  formData.append('fullName', fullName);
		  formData.append('regNumberFirst', regNumberFirst);
		  formData.append('regNumberSecond', regNumberSecond);
		  formData.append('phone', phone);
		  formData.append('postcode', postcode);
		  formData.append('address', address);
		  formData.append('detailAddress', detailAddress);
		  formData.append('extraAddress', extraAddress);

		 console.log("aaaaaaaaaaaaaaaaaaaaaaaa");
		  
	
	fetch('ponyRegOk', {
    method: 'POST',
    body: formData
  })
  .then(response => {
    if (!response.ok) {
      throw new Error('Failed to submit form');
    }
    return response.json(); // JSON 형식으로 응답 파싱 (옵션이며, 응답 형식에 따라 사용)
  })
  .then(data => {
    // 서버에서 받은 응답 데이터를 처리
    console.log(data);
    window.location.href = '/login';
  })
  .catch(error => {
    // 오류 처리
    console.error('Error:', error);
  });  
	
	  
	}


</script>


</body>
</html>