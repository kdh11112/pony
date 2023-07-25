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
<link rel="stylesheet" href="../css/model/modelDetail.css">
<script type="text/javascript">
	let modelName = "${model.modelName}";
</script>
</head>
<body>
    <div><img src="../images/model/vs_top.png" alt="" width="100%;" style="height: 200px;"></div>
    <div style="height: 100px; background-color: white;"></div>
        <div class="top-title text-center">
            <h1 class="top-title-text">${model.modelName}</h1>
        </div>
        <div>
            <img src="" alt="" width="70%" id="modelImg1">
        </div>
    
    <div class="container">
    	<div class="row design-info">
        	<div class="col-md-6" >HIGHLIGHT
            	<h3 id="designContents1"></h3>
                <p id="designContents2"></p>
                <p id="designContents3"></p>
            </div>
            <div class="col-md-6" id="info">INFOMATION
            	<div class="info row">
            		<div class="model-info-co1 col-md-6" style="color:white">empty</div>
	            	<div id="modelName">${model.modelName}</div>
            	</div>
            	
            </div>
        </div>
            <div class="row imgArea">
                <div class="model-info-co1 col-md-6"><img src="" alt="" id="modelImg2"></div>
	            <div class="accordion" id="accordionExample" style="width: 600px; margin-left: 230px;">
                    <div class="accordion-item" >
                      <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                          차량 기본정보 및 제원 확인하기
                        </button>
                      </h2>
                        <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body row">
                                <div class="model-info-co2 col-md-3 text-center">가격
                                    <div>엔진형식</div>
                                    <div>과급방식</div>
                                    <div>배기량</div>
                                    <div>연료</div>
                                    <div>최고출력</div>
                                    <div>최대토크</div>
                                    <div>연비</div>
                                    <div>CO배출량</div>
                                    <div>전장/전폭</div>
                                    <div>전고/축거</div>
                                    <div>윤거전/후</div>
                                    <div>공차중량</div>
                                    <div>전륜타이어</div>
                                    <div>후륜타이어</div>
                                    <div>구동방식</div>
                                    <div>변속기</div>
                                    <div>전륜서스펜션</div>
                                    <div>후륜서스펜션</div>
                                    <div>전륜제동장치</div>
                                    <div>후륜제동장치</div>
                                    <div>스티어링</div> 
                                </div>
                                <div class="model-info-co3 col-md-3 text-center">${model.modelPrice}
                                <div>${model.modelEngineType}</div>
                                <div>${model.modelSuperCharged}</div>
                                <div class="comma">${model.modelDisplacement}cc</div>
                                <div>${model.modelFuel}</div>
                                <div class="comma">${model.modelMaximumOutput}hp</div>
                                <div class="comma">${model.modelMaximumTalk}kg.m</div>
                                <div>${model.modelFuelEfficiency}</div>
                                <div>${model.modelCoEmissions}</div>
                                <div class="comma">${model.modelFullLength}mm/${model.modelFullWidth}mm</div>
                                <div class="comma">${model.modelFullHeight}mm/${model.modelWheelBase}mm</div>
                                <div>${model.modelFrontTread}/${model.modelRearTread}</div>
                                <div>${model.modelUnladenVehicleWeight}</div>
                                <div>${model.modelFrontTire}</div>
                                <div>${model.modelRearTire}</div>
                                <div>${model.modelDriveType}</div>
                                <div>${model.modelTransmission}</div>
                                <div>${model.modelFrontSuspension}</div>
                                <div>${model.modelRearSuspension}</div>
                                <div>${model.modelFrontBrake}</div>
                                <div>${model.modelRearBrake}</div>
                                <div>${model.modelStreering}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					        다른차량 선택하기
					      </button>
					    </h2>
					    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					        <div class="accordion-body">
                                <form action="/modelDetail" id="frm">
                                    <div class="container">
                                        <div class="row justify-content-center">
                                            <div class="col-md-6" id="cardArea">
                                                <div class="card mx-auto" style="width: 25rem;">
                                                        <select class="selectModel btn btn-secondary" id="selectModel" name="selectModel" >
                                                            <option value="">차량선택</option>
                                                            <option value="AVANTE">AVANTE</option>
                                                            <option value="SONATA">SONATA</option>
                                                            <option value="GRANDEUR">GRANDEUR</option>
                                                            <option value="PALISADE">PALISADE</option>
                                                            <option value="TUCSON">TUCSON</option>
                                                        </select>
                                                    <div><button class="btn btn-info" style="margin-top:20px; margin-left:320px;" id="selectOk">선택</button></div>
                                                    <p class="card-text" style="height: 100px;"></p>
                                                    <img src="../images/model/vs_logo.jpg" class="card-img-top" alt="..." id="card-img1">
                                                    <div class="card-body"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
					        </div>
					    </div>
					</div>
                </div>
	        </div>
        <div class="row imgArea">
            <img src="" alt="" id="modelImg3" style="width:53.2%; height:500px;">
            <img src="" alt="" id="modelImg4" style="width:46.8%; height:500px;">
        </div>
        <div class="row imgArea">
        	<img src="" alt="" id="modelImg5" style="width:53.2%; height:500px;">
            <img src="" alt="" id="modelImg6" style="width:46.8%; height:500px;">
        </div>

	</div>
<script src="../js/model/modelDetail.js"></script>
</body>
</html>