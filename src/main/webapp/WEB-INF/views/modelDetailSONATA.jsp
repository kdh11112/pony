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
<style>

.container{
        max-width: 100%;
        margin-top: 100px;
        margin-left: 0px;
    }
    .top-title{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 150px;
        background-color: rgb(247, 244, 239);
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
 
   .grid{
        margin-top: 100px;
   }
   .model-info-co1{
        width: 1000px;
    }
    .model-info-co1 > img{
        width: 100%;
    }
    .model-info-co2{
        width: 120px;
        margin-left: 300px;
        font-weight: 600;
        background-color: rgb(130, 155, 225);
        color: white;
        
    }
    .model-info-co3{
    	width:350px;
        background-color: rgb(229, 235, 250);
        font-weight: 600;
        margin-left: 5px;
        color: rgb(115, 116, 117);
    }
    .just-bar{
        height: 5px;
        background-color: white;
    }
    #DetailTopImg{
        display: flex;
        margin: auto;
    }
    .row{
        width: 100%;
    }
    .design-info{
        font-size: 50px;
        font-weight: bold;
    }
    .design-info > div> p{
        font-size: 17px;
        font-weight: 500;
    }
    #info{
        margin-left: 400px;
        width: 400px;
    }
</style>
<script type="text/javascript">
 	var 소나타 =../images/model/A4.png; 
</script>
</head>
<body>
    <div><img src="../images/model/vs_top.png" alt="" width="100%;" style="height: 200px;"></div>
    <div style="height: 100px; background-color: white;"></div>
        <div class="top-title text-center">
            <h1 class="top-title-text">${model.modelName}</h1>
        </div>
        <div>
            <img src="../images/model/sTop.png" alt="" width="70%" id="DetailTopImg">
        </div>
    
    <div class="container">
            <div class="row design-info">
                <div class="col-md-6">DESIGN
                    <p>더욱 스타일리시하게</p>
                    <p>한층 더 진보된 기본기와 함께,</p>
                    <p>디테일이 다른 새로운 라이프스타일이 시작됩니다</p>
                </div>
                <div class="col-md-6" id="info">INFOMATION</div>
            </div>
            <div class="row">
                <div class="model-info-co1 col-md-6"><img src="../images/model/A4.png" alt=""></div>
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
                <div>${model.modelDisplacement}</div>
                <div>${model.modelFuel}</div>
                <div>${model.modelMaximumOutput}</div>
                <div>${model.modelMaximumTalk}</div>
                <div>${model.modelFuelEfficiency}</div>
                <div>${model.modelCoEmissions}</div>
                <div>${model.modelFullLength}mm/${model.modelFullWidth}mm</div>
                <div>${model.modelFullHeight}mm/${model.modelWheelBase}mm</div>
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
        <div class="row">
            <div class="model-info-co1 col-md-6"><img src="../images/model/A6.png" alt=""></div>
        </div>
        <div class="row">
            <div class="model-info-co1 col-md-6"><img src="../images/model/A5.jpg" alt=""></div>
        </div>

	</div>
</body>
</html>