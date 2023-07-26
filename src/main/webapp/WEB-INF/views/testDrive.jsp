<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
</head>
<script>
$(function(){
    $("#asd").on("click", function() {
        $("#modalModal").modal("toggle"); // "toggle"로 변경
    });

});
</script>
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
    	width:50%;
    	margin:auto;
    }
    #contents1{
    	width:600px;
    	margin:auto;
    	font-weight:600;
    }
    p{
    	margin-bottom: 0rem;
    }
    .form-check{
    	width: 70px;
    	margin:auto;
    	margin-top:30px;
    	font-size:20px;
    }
</style>

<body>

<div><img src="../images/model/vs_top.png" alt="" id="topImg"></div>
    <div id="whiteBar"></div>
        <div class="top-title text-center">
            <h1 class="top-title-text">시승 신청</h1>
        </div>
        <div>
            <img src="" alt="" id="modelImg1">
        </div>
        <div id="asd">asdasdkjashdkjsa
        askladhsaldjsaldj
        	<div class="modal show" tabindex="-1" id="modalModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p><h5>1. 유의사항</h5>
			<p>①고객님의 시승차 운전이 불가하다고 판단 시 귀사 직원의 판단에 따라 즉시 시승이 중단/취소될 수 있으며 향후 시승 이용이 제한될 수 있습니다.</p>
			<p>(음주, 심신미약, 운전미숙, 과속 및 난폭운전, 기상악화 등 안전상 위험하다고 판단되는 경우)</p>
			<p style="color:white;">a</p>
			<p>②시승서비스 이용을 위해서는 시승 전 반드시 운전면허증을 제시해야 합니다.</p>
			<p>③시승차는 보험 적용 기준에 따라 만 21세 이상만 운행 가능합니다.</p>
			<p>④다음 시승 신청 고객님들을 위해 시승 신청시간을 준수해 주시기 바랍니다.</p>
			<p>신청 변동사항이 있을 경우 드라이빙라운지 혹은 담당 카마스터에게 사전 연락을 부탁드립니다.</p>
			<p>고객님과 연락이 두절되는 경우 시승 신청이 자동 취소될 수 있습니다.</p>
			<p>시승시간은 총 1시간 또는 1시간 30분입니다. (시승시간은 예약 시간대별로 상이하며 거점별 운영 상황에 따라 변경될 수 있습니다.)</p>
			<p>* long-time 시승 (총 2시간 30분)을 원하시는 경우 방문 희망 드라이빙라운지로 유선 연락 주시길 바랍니다.</p>
			<p>해당 드라이빙라운지 예약 상황에 따라 희망하시는 차종의 시승 가능 여부를 안내드립니다.</p>

			<p>⑤시승 고객님의 안전한 운행을 위해 동승 시승을 희망하시는 경우 카마스터가 동승합니다.</p>
			<p>⑥계약 이력 또는 담당 카마스터가 있는 고객님이 동승 시승을 희망하시는 경우 담당 카마스터와 동승 시승 가능 여부 확인 후 예약이 확정됩니다.</p> 
			<p>계약 이력이 있는 고객님은 담당 카마스터가 동승이 불가능한 경우, 동승 시승 서비스 이용이 제한될 수 있습니다.</p>
			<p>⑦시승서비스는 고객님께서 차량을 구매하기 전 관심 차종을 경험할 수 있는 기회를 드리고자 제공되는 서비스입니다.</p>
			<p>따라서 개인적 용도로 시승차를 이용하려는 경우 시승이 제한될 수 있습니다.</p>
			<p>많은 고객님께 시승서비스를 제공하기 위해 고객님 한 분당 연간 6회까지 시승 신청이 가능합니다.</p>
2. 보험사항
상기 차량은 대인배상(Ⅰ,Ⅱ), 대물배상, 자기 신체, 자기 차량, 무보험 등의 보험에 가입되어 있으나, 보험 가액을 초과하는 부분 및 보험 미적용 부분 (운전자 연령 한정 운전 특약 위반, 차량 사고 시 자차 부담금 최대 10만원 고객 부담) 등에 대해서는 본인이 스스로 책임을 지는 동시에 귀사에 발생한 모든 손해를 배상할 것을 약속합니다.
3. 금지사항
본인은 귀사가 제공한 상기 차량을 상업적으로 이용하는 등 비정상적으로 운행하거나, 본인 외 제3자에게 운행, 양도, 대여, 담보의 목적으로 제공하는 등의 행위를 일절 하지 않을 것을 약속합니다. 또한 주행 보조 기능 (AEB 자동 긴급 제동 시스템, FCA 전방 충돌 방지 보조 등) 작동을 위하여 위험한 운전을 시도하지 않으며, 항상 안전하게 운전할 것을 약속합니다.
4. 책임사항
①본인은 위 보험 사항 및 금지사항, 유의사항을 위반하여 발생한 모든 민·형사상 책임을 부담합니다.
②본인은 약정된 차량 반납 일시까지 상기 차량을 지정된 반납 장소에 반납하지 않거나 차량 반납 시 차량 상태가 변동된 경우, 이로 인해 발생한 모든 손해에 대한 배상 책임을 부담합니다.
③본인은 교통법규 미준수로 인한 벌금, 과태료 및 시승 운행 시 발생한 도로교통비 등을 부담합니다.
위치정보 수집장치 부착 사실 고지
시승차량에 장착된 블루링크 단말을 통해 시승서비스 이용 시간 동안 시승차량 및 고객님의 위치정보가 수집됨을 알려드립니다.</p>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
        </div>
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	  	서비스 이용 동의
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
		<div id="contents1">
		
		</div>

      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Accordion Item #2
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        Accordion Item #3
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
</div>
</body>
</html>