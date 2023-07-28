<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<style>
	#topImg{
		width:100%;
		height:300px;
	}
	#whiteBar{
		height:30px;
		background-color: white;
	}
	.top-title{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 150px;
        background-color: rgb(244, 250, 255);
        margin-bottom: 100px
    }
    .top-title-text{
        font-size: 80px;
        font-weight:bold;
        color: #5E5E5E;
    }
    .top-title-text2{
        font-size: 15px;
        font-weight:bold;
        color: #5E5E5E;
    }
    .accordion{
    	width:60%;
    	margin:auto;
    }
    #contents1{
    	width:600px;
    	margin:auto;
    	font-weight:600;
    }
    .form-check{
    	width: 70px;
    	margin:auto;
    	margin-top:30px;
    	font-size:20px;
    }
    .testDriveContent{
    	width:100%;
    	min-height:100px;
    }
    .agreeArea{
    	width:1120px;
    	margin: auto;
    	min-height: 60px;
  	
    }
    .agreeAreaContent{
    	margin-top:100px;
    	border-top: 1px solid black;
    	border-bottom: 1px solid black;   
    }
    #agree-title{
    	display:flex;
    	margin-bottom: 20px;
    	font-size: 17px;
    	font-weight:bold;
    }
    .agree-check{
    	display:flex;
    	margin-left:300px;
    	font-weight:bold;
    	color: #5E5E5E;
    	font-size:15px;
    	height: 30px;
    }
    .accordion{
    	margin-top: 100px;
    }
    #selectModel{
		font-weight: bold;
		font-size: 17px;
		background-color: rgb(134, 167, 236);
		border: 0px;
	}
    #selectOk{
    	width:70px;
		margin-left:320px;
		background-color: rgb(32, 103, 162);
		border: 1px;
		color: white;
		font-weight: bold;
		font-size:17px;
	}
	.scrollspyHeading{
		margin-top:20px;
		margin-bottom: 30px;
		font-weight: bold;
	}
	.scrollspy-example > p{
		line-height:25px;
		margin-top: -10px;
		color: #0a2a5b;
		font-size:14px;
		font-weight: 600;
	}
	.modal-title{
		margin-top:30px;
		font-weight: bold;
		text-align: center;
		
	}
	.modal-content{
		width:120%;
	}
	.modal-body{
		height:700px; 
		overflow: auto;
	}
	.agree-btn{
		margin: auto;
		background-color: rgb(32, 103, 162);
	}
	.accordion-button:not(.collapsed){
		background-color: rgb(193, 220, 255);
		color: white;
		font-weight: bold;
		text-align: center;
		font-size: 17px;
	}
	#flexCheckDefault1,
	#flexCheckDefault2,
	#checkLabel1,
	#checkLabel2{
		cursor: pointer;
	}
	#OkBtn{
		color:white;
		background-color: rgb(32, 103, 162);
		font-weight: bold;
	}
	.accordion-button:not(.collapsed){
		border-bottom-color: red;
	}
	#shopAreaFind{
		width: 70%;
		margin-top:50px;
		margin-bottom: 20px;
	}
	#서울{
	}
	.btn{
		background-color: rgb(32, 103, 162);
		border:1px;
	}
	.shop-area{
		margin-bottom: 10px;
	}
	.btn-primary{
		--bs-btn-hover-bg:rgb(193, 220, 255);
	}
	.shop-area-point{
		margin-top: 30px;
		border-top: 2px solid #D1D1D1;
	}
	.shop-detail{
		margin-top: 30px;
	}.shop-detail > p{
		font-size:15px;
	}.shop-detail > h4{
		font-weight:bold;
		color: #5E5E5E;
	}
	.shop-no-btn{
		background-color: #f19797;
		font-weight: bold;
	}
</style>
<body>

<div><img src="../images/model/vs_top.png" alt="" id="topImg"></div>
    <div id="whiteBar"></div>
        <div class="top-title text-center">
            <h1 class="top-title-text">시승 신청</h1>
        </div>
<div class="testDriveContent text-center">
	<div class="agreeArea ">
		<div class="agreeAreaContent ">
			<div style="color:white;">empty</div>
		    <label id="agree-title">서비스 이용동의*</label>
				<div class="agree-check" style="margin-top:-50px;">
					<div id="check1">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" >
						<label class="form-check-label" for="flexCheckDefault" id="checkLabel1">  (필수) 시승차 이용 및 서비스 이용에 따른 주요 고지사항 및 이용약관 안내</label>
					</div>
				</div>
				<div class="agree-check">
					<div id="check2">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
						<label class="form-check-label" for="flexCheckDefault" id="checkLabel2">  (필수) 시승신청 개인정보 수집 및 이용 동의</label>
					</div>
				</div>
			<div style="color:white;">empty</div>		
		</div>
	</div>
        
        	
			<!-- =============================아코디언 영역============================= -->
	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingOne">
				<button class="accordion-button collapsed" id="headingOneBtn" type="button" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
		  			시승모델 선택하기
				</button>
	    	</h2>
			<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		    	<div class="accordion-body">
		        	<div class="row justify-content-center">
		            	<div class="card mx-auto" style="width: 32rem;">
		                	<select class="selectModel btn btn-secondary" id="selectModel" name="selectModel" >
	                        	<option value="">차량선택</option>
	                            <option value="AVANTE">AVANTE</option>
		                        <option value="SONATA">SONATA</option>
		                        <option value="GRANDEUR">GRANDEUR</option>
		                        <option value="PALISADE">PALISADE</option>
		                        <option value="TUCSON">TUCSON</option>
	                        </select>
		                    <p class="card-text"></p>
		                    <img src="../images/model/vs_logo.jpg" class="card-img-top" alt="..." id="card-img1">
		                    <div><button class="btn btn-info" id="selectOk">선택</button></div>
		                    <div class="card-body"></div>
		            	</div>
					</div>
				</div>
		    </div>
	 	 </div>
		<div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		    	<button class="accordion-button collapsed" id="headingTwoBtn" type="button" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		      		시승장소 선택하기
		    	</button>
		    </h2>
	    	<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
	      		<div class="accordion-body">
		      		<div class="find-shop-area row">
		      			<div class="col-md-6" style="border-right: 1px solid #D1D1D1;">
		      				<div>
		      					<input type="text" value="" placeholder="검색할 지역을 입력해주세요" id="shopAreaFind" name="shopAreaFind"/>
		      				</div>
		      				<div><button type="button" class="btn btn-primary" id="shopFindBtn">검색</button></div>
		      			</div>
		      			<div class="col-md-6">
		      				<div class="shop-area">
			      				<button type="button" class="shop-area-btn btn btn-primary" value="서울" id="서울" >서울</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="부산" id="부산" >부산</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="대구" id="대구">대구</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="인천" id="인천">인천</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="광주" id="광주">광주</button>
		      				</div>
		      				<div class="shop-area">
			      				<button type="button" class="shop-area-btn btn btn-primary" value="대전" id="대전">대전</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="경기" id="경기">경기</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="경남" id="경남">경남</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="경북" id="경북">경북</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="전남" id="전남">전남</button>
		      				</div>
		      				<div class="shop-area">
			      				<button type="button" class="shop-area-btn btn btn-primary" value="전북" id="전북">전북</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="제주" id="제주">제주</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="충남" id="충남">충남</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="충북" id="충북">충북</button>
			      				<button type="button" class="shop-area-btn btn btn-primary" value="세종" id="세종">세종</button>
		      				</div>
		      			</div>
		      		</div>
		      		<div class="shop-area-point row">
		      			
		      		</div>
	      		</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingThree">
				<button class="accordion-button collapsed" id="headingThreeBtn" type="button" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					시승날짜 선택하기
				</button>
		    </h2>
		    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<p>준비중</p>
	      			<p>준비중</p>
	      			<p>준비중</p>
	      			<p>준비중</p>
	      			<p>준비중</p>
	      			<p>준비중</p>
				</div>
		    </div>
		</div>
	</div>
	<div style="margin-top:100px;"><button class="btn" id="OkBtn">신청하기</button></div>
</div>

							<!-- =======================모달영역===================== -->
<div class="modal" tabindex="-1" id="modal1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
        		<h4 class="modal-title">(필수) 시승차 이용 및 서비스 이용에 따른 주요 고지사항 및 이용약관 안내</h4>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
      	<div class="modal-body">
    <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-light p-3 rounded-2" tabindex="0">
		<h4 class="scrollspyHeading" id="scrollspyHeading1">1. 유의사항</h4>
	  	<p>①고객님의 시승차 운전이 불가하다고 판단 시 귀사 직원의 판단에 따라 즉시 시승이 중단/취소될 수 있으며 향후 시승 이용이 제한될 수 있습니다.</p>
		<p>(음주, 심신미약, 운전미숙, 과속 및 난폭운전, 기상악화 등 안전상 위험하다고 판단되는 경우)</p>
		<p>②시승서비스 이용을 위해서는 시승 전 반드시 운전면허증을 제시해야 합니다.</p>
		<p>③시승차는 보험 적용 기준에 따라 만 21세 이상만 운행 가능합니다.</p>
		<p>④다음 시승 신청 고객님들을 위해 시승 신청시간을 준수해 주시기 바랍니다.</p>
		<p>신청 변동사항이 있을 경우 드라이빙라운지 혹은 담당 카마스터에게 사전 연락을 부탁드립니다.</p>
		<p>고객님과 연락이 두절되는 경우 시승 신청이 자동 취소될 수 있습니다.</p>
		<p>시승시간은 총 1시간 또는 1시간 30분입니다. (시승시간은 예약 시간대별로 상이하며 거점별 운영 상황에 따라 변경될 수 있습니다.)</p>
		<p>* long-time 시승 (총 2시간 30분)을 원하시는 경우 방문 희망 드라이빙라운지로 유선 연락 주시길 바랍니다.</p>
		<p>해당 드라이빙라운지 예약 상황에 따라 희망하시는 차종의 시승 가능 여부를 안내드립니다.</p>
		<p>⑤시승 고객님의 안전한 운행을 위해 동승 시승을 희망하시는 경우 카마스터가 동승합니다.</p>
		<p>⑥계약 이력 또는 담당 카마스터가 있는 고객님이 동승 시승을 희망하시는 경우 담당 카마스터와 동승 시승 가능 여부 확인 후 예약이 확정됩니다. 
		계약 이력이 있는 고객님은 담당 카마스터가 동승이 불가능한 경우, 동승 시승 서비스 이용이 제한될 수 있습니다.</p>
		<p>⑦시승서비스는 고객님께서 차량을 구매하기 전 관심 차종을 경험할 수 있는 기회를 드리고자 제공되는 서비스입니다. 
		따라서 개인적 용도로 시승차를 이용하려는 경우 시승이 제한될 수 있습니다. 
		많은 고객님께 시승서비스를 제공하기 위해 고객님 한 분당 연간 6회까지 시승 신청이 가능합니다.</p>
		
		<h4 class="scrollspyHeading" id="scrollspyHeading1">2. 보험사항</h4>
		<p>상기 차량은 대인배상(Ⅰ,Ⅱ), 대물배상, 자기 신체, 자기 차량, 무보험 등의 보험에 가입되어 있으나, 
		보험 가액을 초과하는 부분 및 보험 미적용 부분 (운전자 연령 한정 운전 특약 위반, 차량 사고 시 자차 부담금 최대 10만원 고객 부담) 등에 대해서는
	 	본인이 스스로 책임을 지는 동시에 귀사에 발생한 모든 손해를 배상할 것을 약속합니다.</p>
	 	
		<h4 class="scrollspyHeading" id="scrollspyHeading1">3. 금지사항</h4>
		<p>본인은 귀사가 제공한 상기 차량을 상업적으로 이용하는 등 비정상적으로 운행하거나, 본인 외 제3자에게 운행, 양도, 대여, 담보의 목적으로
		제공하는 등의 행위를 일절 하지 않을 것을 약속합니다. 또한 주행 보조 기능 (AEB 자동 긴급 제동 시스템, FCA 전방 충돌 방지 보조 등) 
		작동을 위하여 위험한 운전을 시도하지 않으며, 항상 안전하게 운전할 것을 약속합니다.</p>
		
		<h4 class="scrollspyHeading" id="scrollspyHeading1">4. 책임사항</h4>
		<p>①본인은 위 보험 사항 및 금지사항, 유의사항을 위반하여 발생한 모든 민·형사상 책임을 부담합니다.</p>
		<p>②본인은 약정된 차량 반납 일시까지 상기 차량을 지정된 반납 장소에 반납하지 않거나 차량 반납 시 차량 상태가 변동된 경우, 
		이로 인해 발생한 모든 손해에 대한 배상 책임을 부담합니다.</p>
		<p>③본인은 교통법규 미준수로 인한 벌금, 과태료 및 시승 운행 시 발생한 도로교통비 등을 부담합니다.
		위치정보 수집장치 부착 사실 고지 시승차량에 장착된 블루링크 단말을 통해 시승서비스 이용 시간 동안 시승차량 및 고객님의 위치정보가 수집됨을 알려드립니다.</p>
 
</div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="agree-btn btn btn-primary" id="agree-btn1">동의</button>
      </div>
    </div>
  </div>
</div>


<div class="modal" tabindex="-1" id="modal2">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
        		<h4 class="modal-title">(필수) 시승신청 개인정보 수집 및 이용 동의</h4>
        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
      	<div class="modal-body">
    <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-light p-3 rounded-2" tabindex="0">
		<h4 class="scrollspyHeading" id="scrollspyHeading1">. 개인정보 수집 및 이용 목적</h4>
		<p>- 시승서비스 제공, 시승차량 사고 발생 시 보험처리 등</p>
		<p>- 사고 대응, 시승차량 도난 방지 및 운행 관리, 고객 불만 등</p>
		<p>- 민원사항 처리, 분쟁 발생 시 대응, 소비자 의견 조사,고객 관리 서비스 제공</p>
		<p>- 교통법규 미준수로 인한 벌금, 과태료처리</p>  	
		
		<h4 class="scrollspyHeading" id="scrollspyHeading1">. 개인정보의 수집 항목</h4>
		<p>[필수 항목]</p>
		<p>- 고객 성명, 휴대전화 번호, 생년월일, 성별, 연계정보(CI), 주소(자택/직장), 시승정보(시승차종, 차량번호, 시승일시), 시승차량 위치정보</p>
		<p>[선택 항목]</p>
		<p>- 자동차 운전경력, 보유차종 및 연식, 기타 시승 관련 요청사항</p>
		
		<h4 class="scrollspyHeading" id="scrollspyHeading1">. 개인정보의 보유 및 이용기간</h4>
		<p>- 시승일 기준 2년 (※ 단, 시승차량 위치정보는 수집일로부터 14일)</p>
		<p style="margin-top:50px;">고객님은 위의 개인정보 수집 이용에 대한 동의를 거부하실 수 있습니다.</p>
		<p>그러나, 동의 거부 시 시승서비스 이용이 불가합니다.</p>
 
</div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="agree-btn btn btn-primary" id="agree-btn2">동의</button>
      </div>
    </div>
  </div>
</div>

<script src="../js/model/testDrive.js"></script>
</body>
</html>