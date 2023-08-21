<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="css/admin/assets/invi.png" />
<title>PONY MOTORS</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/mypage/css/styles.css" rel="stylesheet" />
<link href="css/mypage/css/board.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap"
	rel="stylesheet">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">


<style>
.content {
	box-sizing: border-box;
	width: 400px;
}

.contant-area {
	flex: 1;
	width: 90%;
	margin: 10px auto;
	display: flex;
}

.content-body {
	border: 1px solid #dedede;
	box-sizing: border-box;
	width: 10vm;
	height: 800px;
	float: left;
}

.qnaModifyform {
	border: 1px solid #dedede;
	box-sizing: border-box;
	width: 800px;
	height: 800px;
	margin: 0px 1%;
	float: right;
}

.title {
	margin: 0 30px;
}

.no-car, .sub {
	margin: 10px 40px;
}

.head {
	margin: 20px 60px;
}

.infomodify_btn {
	margin-left: 13px;
}

.mycarTitle {
	margin-top: 20px;
}

#summernote {
	width: 100%;
	boarder: 0.5px solid #dedede;
}

textarea {
	resize: none;
}

.boardtitle {
	width: 100%;
}
</style>
</head>
<body>
	<div id="wrapper">
		<!-- Navigation-->
		<jsp:include page="/WEB-INF/views/gnav.jsp" />
		<!-- Header-->
		<header>

			<img src="images/cloud.jpg" alt="" />
			<div class="header-content text-center text-black">
				<h1 class="display-4 fw-bolder">마이페이지</h1>
				<p class="lead fw-normal text-black-50 mb-0">이용 중인 현대자동차 서비스를
					마이페이지에서 확인하세요.</p>
			</div>

		</header>
		<!-- Section-->
		<section class="py-5 two-column-layout">


			<%-- 
	<p><sec:authentication property="principal"/></p>
	<p>user : <sec:authentication property="principal.username"/></p>
	<p>password : <sec:authentication property="principal.password"/></p> --%>

			<div class="contant-area">
				<div id="mypage" class="container" data-v-269e3e5f>
					<!--   -->

					<!--   -->
					<div class="content" data-v-269e3e5f>
						<!---->
						<div class="content-body" data-v-269e3e5f>
							<div class="my-title" data-v-269e3e5f>
								<div class="head" data-v-269e3e5f>
									<strong data-v-269e3e5f><a href="/mypage"><span data-v-269e3e5f>${mdto.memberName }</span></a>
										님, 안녕하세요! </strong> <a href=""
										class="btn btn-primary active infomodify_btn"><span>정보수정
											<!---->

									</span></a>
								</div>

							</div>
							<!-- 포인트 1:1문의내역 -->
							<div class="my-info" data-v-269e3e5f>
								<ul data-v-269e3e5f>
									<li data-v-269e3e5f><strong data-v-269e3e5f>포인트 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${memberPoint } P</strong></li>

									<li data-v-269e3e5f><a class="btn btn-primary active"
										href="mypageqna"><span>1:1 문의 내역 <!---->
										</span></a> <strong data-v-269e3e5f>${qnacount } 건</strong></li>
								</ul>
							</div>
							<!-- 포인트 1:1문의내역 end-->

							<!--시승신청내역 정비예약내역-->
							<div class="my-activity" data-v-269e3e5f>
								<div class="category-title" data-v-269e3e5f></div>
								<div class="details" data-v-269e3e5f>
									<div class="el-row"
										style="margin-left: -10px; margin-right: -10px;"
										data-v-269e3e5f></div>
								</div>
								<div class="history-list" data-v-269e3e5f>
									<div class="el-row"
										style="margin-left: -10px; margin-right: -10px;"
										data-v-269e3e5f>
										<div class="el-col el-col-8"
											style="padding-left: 10px; padding-right: 10px;"
											data-v-269e3e5f>
											<div class="content-box" data-v-269e3e5f>
												<div class="title" data-v-269e3e5f>
													<a href="#
															draggable="
														true" class="btn btn-primary active"><span>시승
															신청 내역 <!---->
													</span></a>
												</div>
												<!---->
											</div>
										</div>

										<div class="el-col el-col-8"
											style="padding-left: 10px; padding-right: 10px;"
											data-v-269e3e5f>
											<div class="content-box" data-v-269e3e5f>
												<div class="title" data-v-269e3e5f>
													<a href="/carMaintenanceReservationDetail" class="btn btn-primary active"><span> 정비
															예약 신청 내역 <!---->
													</span></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 시승신청내역 정비예약내역 end -->
						</div>


					</div>

					<!-- 1:1문의 글수정 -->

					<div class="container-fluid">
						<section class="qnaModifyform">
							<div class="page-title">
								<div class="container">
									<h3>회원정보수정</h3>
								</div>
							</div>

							<!-- board list area -->
							<div id="board-list">
								<div class="container">
									<form action="myinfomodifyOk" method="post" onsubmit="return validateForm();">
										<table class="board-table">

											<tbody>
												<input type="hidden" name="memberNo" value="${dto.memberNo }" />
												<tr>
													<th scope="col" class="th-name">이름</th>
													<td colspan="5"><input type="text" name="memberName" id="memberName" value="${dto.memberName }"/>
													<span id="nameValidationMsg" style="color: red; display: block;">이름을 입력해주세요.</span>
													</td>
												</tr>
												<tr>
													<th scope="col" class="th-title">이메일</th>
													<td colspan="5">${dto.memberEmail }</td>
												</tr>
												<tr>
													<th scope="col" class="th-date">비밀번호</th>
													<td colspan="5"><input type="password" name="memberPassword" id="memberPassword" value=""/>
													<span id="passwordValidationMsg" style="color: red; display: block;">비밀번호를 입력해주세요.</span>
													</td>
												</tr>
												<tr>
													<th scope="col" class="th-date">비밀번호확인</th>
													<td colspan="5"><input type="password" name="memberPassword" id="memberPassword2" value=""/><span id="passwordValidationMsg2" style="color: red; display: none;">비밀번호와 일치하지 않습니다.</span>
													</td>
												</tr>
												<tr>
												    <th scope="col" class="th-date">생일</th>
												    <td colspan="5">
												        <input type="date" name="memberBirthday" id="memberBirthday" value="${dto.memberBirthday }" />
												    </td>
												</tr>
												<tr>
													<th scope="col" class="th-date">핸드폰</th>
													<td colspan="5"><input type="text" name="memberPhone" id="memberPhone" value="${dto.memberPhone }"/></td>
												</tr>
												<tr>
													<th scope="col" class="th-status">주소</th>
													<td colspan="5"><input type="text" name="memberAddress1" id="address_kakao" value="${dto.memberAddress1 }" readonly />상세주소
														<input type="text" name="memberAddress2" id="address_detail" value="${dto.memberAddress2 }"/></td>
												<tr>
												<tr>
													<td colspan="10">
														<a href="/myinfo"><input type="submit"
															class="btn btn-outline-dark" value="정보수정" /></a></td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>
							</div>
						</section>
					</div>

					<!-- 1:1문의내역 리스트 end -->

					<!---->
					<!---->

				</div>

			</div>
		</section>
		<!-- Footer-->
		<footer class="py-5 bg-secondary">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; Your
					Website 2023</p>
			</div>
		</footer>
	</div>
	<!-- Bootstrap core JS-->
	<!-- <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	Core theme JS
	<script src="css/mypage/js/scripts.js"></script>
	Bootstrap core JS
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	Core theme JS
	<script src="css/mypage/js/scripts.js"></script> -->
	<script>
		/* $(document).ready(function() {
			$('#summernote').summernote({
				height : 300,
				minHeight : null,
				maxHeight : null,
				lang : "ko-KR",
				palceholder : '여기에 글을 작성하세요.'
			});
		}); */
		// 핸드폰번호 입력시 자동 하이픈 추가
		  $(document).on("keyup", "#memberPhone", function() { 
				$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
			});
		//패스워드 유효성 검사
		function isValidPassword(memberPassword) {
		  const pwRegex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		  const hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	//	  const id = document.getElementById('ponyMemberEmail').value;
		  let errorMsg = '';

		  if (!pwRegex.test(memberPassword)) {
		    errorMsg = '비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
		  } else if (/(\w)\1\1\1/.test(memberPassword)) {
		    errorMsg = '같은 문자를 4번 이상 사용하실 수 없습니다.';
		  } else if (memberPassword.includes(' ')) {
		    errorMsg = '비밀번호는 공백 없이 입력해주세요.';
		  } else if (hangulcheck.test(memberPassword)) {
		    errorMsg = '비밀번호에 한글을 사용 할 수 없습니다.';
		  }

		  return errorMsg;
		}
		// 이름 유효성 검사
		function isValidName(memberName) {
		  const hangulRegex = /^[가-힣]{1,10}$/; // 한글 이름을 허용하는 정규식
		  const englishRegex = /^[A-Za-z]{1,20}$/; // 영어 이름을 허용하는 정규식
		  const consonantRegex = /[ㄱ-ㅎ]/;
		  const vowelRegex = /[ㅏ-ㅣ]/;
		  const numberRegex = /[0-9]/;
		  const specialCharRegex = /[!@#$%^&*()_+=[\]{};':"\\|,.<>/?]/;

		  let errorMsg1 = '';

		  if (!hangulRegex.test(memberName) && !englishRegex.test(memberName)) {
		    errorMsg1 = '이름은 한글 또는 영어로만 입력해주세요.';
		  } else if (memberName.length > 10) {
		    errorMsg1 = '이름은 10글자까지만 입력 가능합니다.';
		  } else if (hangulRegex.test(memberName)) {
		    if (consonantRegex.test(memberName) && !vowelRegex.test(memberName)) {
		      errorMsg1 = '한글 이름에는 자음과 모음을 단독으로 사용할 수 없습니다.';
		    } else if (numberRegex.test(memberName) || specialCharRegex.test(memberName)) {
		      errorMsg1 = '한글 이름에는 숫자나 특수문자를 포함할 수 없습니다.';
		    }
		  } else if (englishRegex.test(memberName)) {
		    if (numberRegex.test(memberName) || specialCharRegex.test(memberName)) {
		      errorMsg1 = '영어 이름에는 숫자나 특수문자를 포함할 수 없습니다.';
		    }
		  }

		  return errorMsg1;
		}

		//패스워드 패스워드확인이 일치하는지 확인하는 코드
		function passwordsMatch(memberPassword, confirmPassword) {
		  return memberPassword === confirmPassword;
		}


		//실시간으로 패스워드를 감시하고 유효성검사에 따른 errorMsg 출력
		document.getElementById('memberPassword').addEventListener('input', function() {
		  const pw = document.getElementById('memberPassword');
		  const validationMsg = document.getElementById("passwordValidationMsg");
		  const validationResult = isValidPassword(pw.value);
		  validationMsg.innerHTML = validationResult;
		  
		});
		//실시간으로 이름을 감시하고 유효성검사에 따른 errorMsg 출력
		/* document.getElementById('memberName').addEventListener('input', function() {
		  const name = document.getElementById('memberName');
		  const validationMsg = document.getElementById("nameValidationMsg");
		  const validationResult = isValidName(name.value);
		  validationMsg.innerHTML = validationResult;
		  
		}); */
		document.getElementById('memberName').addEventListener('input', function() {
			  const name = document.getElementById('memberName');
			  const validationMsg = document.getElementById("nameValidationMsg");
			  const validationResult = isValidName(name.value);
			  validationMsg.innerHTML = validationResult; // 오류 메시지 갱신

			});
		//실시간으로 패스워드 확인을 감시하고 패스워드랑 일치하지 않으면 메세지 출력
		document.getElementById('memberPassword2').addEventListener('input', function() {
		  const pw = document.getElementById('memberPassword');
		  const pw2 = document.getElementById('memberPassword2');
		  const validationMsg2 = document.getElementById("passwordValidationMsg2");

		  if (!passwordsMatch(pw.value, pw2.value)) {
		    validationMsg2.style.display = "block";
		  } else {
		    validationMsg2.style.display = "none";
		  }
		});
		//사용자가 필수정보를 입력하지 않았을때 경고창
		
		function validateForm() {
		    const memberName = document.getElementById('memberName').value;
		    const memberBirthday = document.getElementById('memberBirthday').value;
		    const memberPassword = document.getElementById('memberPassword').value;
		    const memberPassword2 = document.getElementById('memberPassword2').value;
		    const memberPhone = document.getElementById('memberPhone').value;
		    const address_kakao = document.getElementById('address_kakao').value;
		    
		    if (memberName.trim() === '') {
		        alert('이름을 입력해주세요.');
		        return false;
		    }
		    
		    if (memberBirthday.trim() === '') {
		        alert('생일을 입력해주세요.');
		        return false;
		    }
		    
		    if (memberPassword.trim() === '') {
		        alert('비밀번호를 입력해주세요.');
		        return false;
		    }
		    
		    if (memberPassword !== memberPassword2) {
		        alert('비밀번호와 비밀번호확인이 일치하지 않습니다.');
		        return false;
		    }
		    
		    if (memberPhone.trim() === '') {
		        alert('핸드폰번호를 입력해주세요.');
		        return false;
		    }
		    
		    if (address_kakao.trim() === '') {
		        alert('주소를 입력해주세요.');
		        return false;
		    }
		    
		    // 모든 필수 입력 필드가 입력되었으므로 폼을 제출합니다.
		    return true;
		}
	</script>
	
	<!-- 카카오 주소API -->
		
		<script>
		window.onload = function(){
		    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		                document.getElementById("address_kakao").value = data.address; // 주소 넣기
		                document.querySelector("input[name=memberAddress2]").focus(); //상세입력 포커싱
		            }
		        }).open();
		    });
		}
		</script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>
