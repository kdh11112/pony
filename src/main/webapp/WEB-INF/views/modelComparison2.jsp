<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/model/modelComparison2.css">
</head>
<body>
	<h2>${model.modelName}</h2>

    <div><img src="../images/model/vs_top.png" alt="" width="100%;" style="height: 200px;"></div>
    <div style="height: 100px; background-color: white;"></div>
        <div style="background-color: white;">
            <div class="top-title text-center">
                <h1 class="top-title-text">모델 비교</h1>
                <h1 class="top-title-text2">판매되는 차량을 빠르게 비교하여 원하는 차량을 쉽게 찾아볼 수 있습니다</h1>
            </div>
        </div>
    
    <div class="container">
	    <div class="grid text-center">
	        <div class="row">
	            <div class="model-name-co1 col-md-3" style="width: 100px;"></div>
	            <div class="model-name-co2 col-md-3" style="width: 120px; background-color: white;" ></div>
	            <div class="model-name col-md-3" style="margin-left: 5px;">${model1.modelName}</div>
	            <div class="model-name col-md-3" style="margin-left: 5px;">${model2.modelName}</div>
	        </div>
	    
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >가격</div>
	            <div class="model-info-co3 col-md-3 comma">${model1.modelPrice}</div>
	            <div class="model-info-co4 col-md-3 comma">${model2.modelPrice}</div>
	        </div>
	        <div class="row">
	            <div class="just-bar col-md-3"></div>
	            <div class="just-bar col-md-3"></div>
	            <div class="just-bar col-md-3"></div>
	            <div class="just-bar col-md-3"></div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >엔진형식</div>
	            <div class="model-info-co3 col-md-3 ">${model1.modelEngineType}</div>
	            <div class="model-info-co4 col-md-3 ">${model2.modelEngineType}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >과급방식</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelSuperCharged}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelSuperCharged}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" style="font-size: 18px; font-weight: bold;">성능</div>
	            <div class="model-info-co2 col-md-3" >배기량</div>
	            <div class="model-info-co3 col-md-3 comma" >${model1.modelDisplacement}cc</div>
	            <div class="model-info-co4 col-md-3 comma" >${model2.modelDisplacement}cc</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >연료</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelFuel}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelFuel}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >최고출력</div>
	            <div class="model-info-co3 col-md-3 comma" >${model1.modelMaximumOutput}hp</div>
	            <div class="model-info-co4 col-md-3 comma" >${model2.modelMaximumOutput}hp</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >최대토크</div>
	            <div class="model-info-co3 col-md-3 comma" >${model1.modelMaximumTalk}kg.m</div>
	            <div class="model-info-co4 col-md-3 comma" >${model2.modelMaximumTalk}kg.m</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >연비</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelFuelEfficiency}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelFuelEfficiency}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >CO배출량</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelCoEmissions}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelCoEmissions}</div>
	        </div>
	        <div class="row">
	            <div class="just-bar col-md-3"></div>
	            <div class="just-bar col-md-3"></div>
	            <div class="just-bar col-md-3"></div>
	            <div class="just-bar col-md-3"></div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >전장/전폭</div>
	            <div class="model-info-co3 col-md-3 comma" >${model1.modelFullLength}mm/${model1.modelFullWidth}mm</div>
	            <div class="model-info-co4 col-md-3 comma" >${model2.modelFullLength}mm/${model2.modelFullWidth}mm</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >전고/축거</div>
	            <div class="model-info-co3 col-md-3 comma" >${model1.modelFullHeight}mm/${model1.modelWheelBase}mm</div>
	            <div class="model-info-co4 col-md-3 comma" >${model2.modelFullHeight}mm/${model2.modelWheelBase}mm</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" style="font-size: 18px; font-weight: bold;">치수</div>
	            <div class="model-info-co2 col-md-3" >윤거전/후</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelFrontTread}/${model1.modelRearTread}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelFrontTread}/${model2.modelRearTread}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >공차중량</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelUnladenVehicleWeight}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelUnladenVehicleWeight}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >전륜타이어</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelFrontTire}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelFrontTire}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >후륜타이어</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelRearTire}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelRearTire}</div>
	        </div>
	        <div class="row">
	            <div class="just-bar col-md-3"></div>
	            <div class="just-bar col-md-3"></div>
	            <div class="just-bar col-md-3"></div>
	            <div class="just-bar col-md-3"></div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >구동방식</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelDriveType}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelDriveType}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >변속기</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelTransmission}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelTransmission}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >전륜서스펜션</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelFrontSuspension}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelFrontSuspension}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" style="font-size: 18px; font-weight: bold;">섀시</div>
	            <div class="model-info-co2 col-md-3" >후륜서스펜션</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelRearSuspension}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelRearSuspension}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >전륜제동장치</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelFrontBrake}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelFrontBrake}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >후륜제동장치</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelRearBrake}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelRearBrake}</div>
	        </div>
	        <div class="row">
	            <div class="model-info-co1 col-md-3" ></div>
	            <div class="model-info-co2 col-md-3" >스티어링</div>
	            <div class="model-info-co3 col-md-3" >${model1.modelStreering}</div>
	            <div class="model-info-co4 col-md-3" >${model2.modelStreering}</div>
	        </div>
		<div><a href="/modelComparison"><button type="button" class="btn btn-secondary" style="margin-top: 70px;">차량 다시 선택하기</button></a></div>
	    </div>
	</div>
<script src="../js/model/modelComparison2.js"></script>
</body>
</html>