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
<script src="js/jwt.js"></script>
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
												<button class="btn btn-primary btn-lg" style="width: 82px; height: 45px" type="button" onclick="autoemail()">확인</button> <!-- 여기 누르면 Post요청 보내기 -->
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


									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="text" id="fullName" name="fullName" value="Test" class="form-control form-control-lg shadow-sm" />
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
									                    <input type="text" id="firstInput" name="regNumberFirst" class="form-control form-control-lg shadow-sm" maxlength="6" />
									                    <label>RegNumberFist</label>
									                </div>
									            </div>
									            
									            <div style="margin-left: 10px;">
									                <input type="text" id="secondInput" value="3" class="form-control form-control-lg shadow-sm" maxlength="1" style="width: 30px; height: 58px;" />
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
													<input type="text" id="phone" name="phone" value="01055555555" class="form-control form-control-lg shadow-sm phone" maxlength="13" />
													<label>Phone</label>
												</div>
											</div>
										</div>
									</div>
									
									
									<div class="form-outline mb-4">
										<div class="row">
											<div class="col">
												<div class="form-floating">
													<input type="text" id="postcode" name="postcode" class="form-control form-control-lg shadow-sm">
													<label>ZipCode</label>
												</div>
											</div>
											
											<div class="col-auto">
												<button class="btn btn-primary btn-lg" onclick="execDaumPostcode()" style="width: 82px; height: 45px">검색</button>
											</div>
										</div>
									
									
										<div class="col">
											<div class="form-floating">
												<input type="text" id="address" name="address" class="form-control form-control-lg shadow-sm">
												<label>주소</label>
											</div>
										</div>
										
										<div class="form-outline mb-4 row">
										    <div class="col">
										        <div class="form-floating">
										            <input type="text" id="detailAddress" name="detailAddress" class="form-control form-control-lg shadow-sm">
										            <label>상세 주소</label>
										            <span id="guide" style="color:#999;display:none"></span>
										        </div>
										    </div>
										
										    <div class="col">
										        <div class="form-floating">
										            <input type="text" id="extraAddress" name="extraAddress" class="form-control form-control-lg shadow-sm">
										            <label>참고항목</label>
										            <span id="guide" style="color:#999;display:none"></span>
										        </div>
										    </div>
										</div>
										
							<div align="center" >
								<button id="regBtn" type="button" disabled="disabled" class="btn btn-primary btn-lg btn-block" style="width: 300px; height: 45px; margin-top: 20px;" onclick="submitForm()">Sign up</button>

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




<script>

// 핸드폰번호 입력시 자동 하이픈 추가
  $(document).on("keyup", ".phone", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	});

// 이메일 인증번호 발송 스크립트 이미 가입된 이메일이면 메세지를 출력하고 메세지 발송안함
  function sendAuthCode() {
	
    // 인증 버튼을 눌렀을 때 실행되는 비동기 POST 요청
    // 폼 데이터를 가져와서 fetch() 메서드를 사용하여 서버로 POST 요청 보냄

    const emailInput = document.getElementById('ponyMemberEmail');
    const emailValue = emailInput.value;
    const emailAlreadyElement = document.getElementById('emailAlready');

    if (emailAlready.style.display === 'block') {
        alert('사용중인 이메일입니다.');
        return;
      }

    // FormData를 사용하여 폼 데이터 생성
    const formData = new FormData();
    formData.append('email', emailValue);
    // fetch()를 사용하여 서버로 POST 요청 보냄
    fetch('mailConfirm', {
      method: 'POST',
      body: formData
    })
      .then(data => {
        // 서버에서 받은 응답 데이터를 처리
        clearTimeout(timer); //기존 타이머 초기화
        console.log(data);
        startTimer(60);
        
      })
      .catch(error => {
        // 오류 처리
        
        console.error('Error:', error);
      });
    
 }


//타이머 초기화를 위해 함수 바깥에 선언
  let timer;
  let remainingTime; // 전역 변수로 선언

  // 타이머 함수
  function startTimer(seconds) {
    remainingTime = seconds; // 전역 변수에 남은 시간 설정
    const authCodeTimer = document.getElementById('authCodeTimer');
    authCodeTimer.style.display = 'block';

    // 타이머 갱신 함수
    function updateTimer() {
      if (remainingTime > 0) {
        authCodeTimer.innerText = '남은시간: ' + remainingTime + '초';
        remainingTime--;
      } else {
        authCodeTimer.innerText = '시간 초과';
        // 타이머 종료 후에도 텍스트 값을 초기화
        setTimeout(() => {
          authCodeTimer.innerText = '';
          authCodeTimer.style.display = 'none'; // 타이머 숨김
        }, 3000); // 3초 후에 텍스트 값을 초기화하고 숨김
        clearInterval(timer); // 타이머 정지
      }
    }

    // 1초마다 updateTimer 함수를 호출하여 타이머 갱신
    timer = setInterval(updateTimer, 1000);

    // 초기 호출
    updateTimer();
  }
  
// 인증번호 확인 스크립트 인증 성공시 가입하기 버튼 활성화
function autoemail() {
	
	const authInput = document.getElementById('authCode');
	const authValue = authInput.value;
	
	const formData = new FormData();
	formData.append('authcode', authValue);
	
	$.ajax({
		url : '/autoEmailOk',
		method : "post",
		data : {
			authcode : authValue
		},
		success : function( data  ) {
			if(data == "true"){
				console.log("성공");
				alert('인증에 성공하셨습니다.')
		       const regBtn = document.getElementById('regBtn');
		       regBtn.disabled =  false;

		       const authCodeTimer = document.getElementById('authCodeTimer');
		       authCodeTimer.style.color = 'blue'; // 파란색 글씨로 변경
		       authCodeTimer.innerText = '인증이 완료되었습니다.';
		       clearInterval(timer); // 타이머를 멈춤
				
			}else {
				console.log("실패");
				alert('실패하셧습니다.');
			}
		}
	});

}

//이메일 유효성검사
function isValidEmail(email) {
	  // 이메일 형식 검사를 위한 정규식
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

	
//패스워드 유효성 검사
function isValidPassword(password) {
  const pwRegex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
  const hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
  const id = document.getElementById('ponyMemberEmail').value;
  let errorMsg = '';

  if (!pwRegex.test(password)) {
    errorMsg = '비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
  } else if (/(\w)\1\1\1/.test(password)) {
    errorMsg = '같은 문자를 4번 이상 사용하실 수 없습니다.';
  } else if (password.includes(id)) {
    errorMsg = '비밀번호에 아이디가 포함될 수 없습니다.';
  } else if (password.includes(' ')) {
    errorMsg = '비밀번호는 공백 없이 입력해주세요.';
  } else if (hangulcheck.test(password)) {
    errorMsg = '비밀번호에 한글을 사용 할 수 없습니다.';
  }

  return errorMsg;
}

//패스워드 패스워드확인이 일치하는지 확인하는 코드
function passwordsMatch(password, confirmPassword) {
  return password === confirmPassword;
}


//실시간으로 패스워드를 감시하고 유효성검사에 따른 errorMsg 출력
document.getElementById('password').addEventListener('input', function() {
  const pw = document.getElementById('password');
  const validationMsg = document.getElementById("passwordValidationMsg");
  const validationResult = isValidPassword(pw.value);
	console.log("작동하니?");
  validationMsg.innerHTML = validationResult;
});


//실시간으로 패스워드 확인을 감시하고 패스워드랑 일치하지 않으면 메세지 출력
document.getElementById('password2').addEventListener('input', function() {
  const pw = document.getElementById('password');
  const pw2 = document.getElementById('password2');
  const validationMsg2 = document.getElementById("passwordValidationMsg2");

  if (!passwordsMatch(pw.value, pw2.value)) {
    validationMsg2.style.display = "block";
  } else {
    validationMsg2.style.display = "none";
  }
});


//실시간으로 이메일주소를 감시하고 중복체크 (DB 확인)
function checkId(){
        var id = $('#ponyMemberEmail').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'./idCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{id:id},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                	emailAlready.style.display = 'none';
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                	emailAlready.style.display = 'block';

                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
};

        


//모든 유효성검사를 통과한 상태로 가입하기 버튼을 누르면 폼데이터를 제출
function submitForm() {
	
 	//console.log("눌렷니?");
	  const pw = document.getElementById('password').value;
	  const pw2 = document.getElementById('password2').value;
	  const validationMsg = document.getElementById("passwordValidationMsg");
	  const validationMsg2 = document.getElementById("passwordValidationMsg2");
	  const emailValidationMsg = document.getElementById('emailValidationMsg');
	  const authButton = document.querySelector('.btn-primary');
		
	  if (validationMsg.innerText !== '' || validationMsg2.style.display === "block" || emailValidationMsg.style.display === "block" || authButton.disabled) {
	    alert("입력값을 확인하세요.");
	  } else {
	   $("#frm").attr("method", "post").attr("action", "/ponyRegOk").submit();
	  }

 	//console.log(cnt);
	}

</script>


</html>