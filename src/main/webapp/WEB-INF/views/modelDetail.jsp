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
        margin-left:40px;
        font-weight: 600;
        background-color: rgb(130, 155, 225);
        color: white;
        
    }
    .model-info-co3,
    .model-info-co4{
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
    #modelImg1{
        display: flex;
        margin: auto;
    }
    #modelImg2,#modelImg3
   	,#modelImg4{
   		height:620px;
   	}
    .row{
        width: 100%;
    }
    .design-info{
        font-size: 50px;
        font-weight: bold;
    }
    .design-info > div> h3{
        margin-bottom: 50px;
        font-weight: 600;
    }
    .design-info > div> p{
        font-size: 15px;
        font-weight: bold;
        color: #6C757D;
    }
    #info{
        margin-left: 430px;
        width: 400px;
    }
    #btnArea{
    	background-color: white;
    	margin-left:-140px;
    	width:150px;
    }
    #btn{
    	font-weight: bold;
    }
</style>
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
	            	<div class="model-info-co2 col-md-3" id="btnArea" style="width:160px;"><a href="/modelFind"><button type="button" class="btn btn-secondary" id="btn">다른차량 선택</button></a></div>
	            	<div class="model-info-co3 col-md-3" style="margin-top:30px; width:110px; font-size:20px; background-color: white;">현재차량:</div>
	            	<div class="model-info-co4 col-md-3" style="margin-top:20px; background-color: white; font-size:30px; width:200px;">${model.modelName}</div>
            	</div>
            	
            </div>
        </div>
            <div class="row">
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
                </div>
	    </div>
        <div class="row">
            <div class="model-info-co1 col-md-6"><img src="" alt="" id="modelImg3"></div>
            
        </div>
        <div class="row">
            <div class="model-info-co1 col-md-6"><img src="" alt="" id="modelImg4"></div>
        </div>

	</div>
<script>
	$(document).ready(function(){
		let modelName = "${model.modelName}"
        if(modelName === "AVANTE"){
        	$("#designContents1").text("더욱 스타일리시하게")
        	$("#designContents2").text("한층 더 진보된 기본기와 함께,")
        	$("#designContents3").text("디테일이 다른 새로운 라이프스타일이 시작됩니다.")
            $("#modelImg1").attr("src","../images/model/aTop.png")
            $("#modelImg2").attr("src","https://imgauto-phinf.pstatic.net/20230313_224/auto_1678683300167oYBOY_JPEG/20230313135450_wviqsLt5.jpg")
            $("#modelImg3").attr("src","https://imgauto-phinf.pstatic.net/20230313_82/auto_1678683298467uIdUo_JPEG/20230313135450_wmBFEU1E.jpg")
            $("#modelImg4").attr("src","https://imgauto-phinf.pstatic.net/20230313_152/auto_1678683297300DUIJR_JPEG/20230313135449_av7qFb0w.jpg")
            $("#modelImg5").attr("src","https://imgauto-phinf.pstatic.net/20230313_242/auto_1678683340753dnlXG_JPEG/20230313135527_zcwgRRvW.jpg")
        }else if(modelName === "SONATA"){
          	$("#designContents1").text("익숙함도 완전히 새롭게")
        	$("#designContents2").text("탄탄한 헤리티지와 선도적인 디자인,")
        	$("#designContents3").text("첨단 기술의 조합으로 재탄생했습니다.")
            $("#modelImg1").attr("src","../images/model/sTop.jpg")
            $("#modelImg2").attr("src","https://imgauto-phinf.pstatic.net/20230503_63/auto_168308027857598rlv_JPEG/20230503111744_B3Pc2ASO.jpg")
            $("#modelImg3").attr("src","https://imgauto-phinf.pstatic.net/20230503_286/auto_1683080282811dsBrG_JPEG/20230503111746_sApipHSC.jpg")
            $("#modelImg4").attr("src","https://imgauto-phinf.pstatic.net/20230503_46/auto_1683080279126jEDwo_JPEG/20230503111744_jEBDHDBR.jpg")
        }else if(modelName === "GRANDEUR"){
        	$("#designContents1").text("Outclass GRANDEUR")
        	$("#designContents2").text("전통과 미래, 세대와 취향, 기술과 감성의 경계를 지운")
        	$("#designContents3").text("새로운 경험을 선사합니다.")
            $("#modelImg1").attr("src","https://www.hyundai.com/static/images/model/grandeur/23fc/grandeur_highlights_calligraphy.jpg")
            $("#modelImg2").attr("src","https://imgauto-phinf.pstatic.net/20221114_271/auto_1668407587917KB4Eo_JPEG/20221114153304_ocOmX8qM.jpg")
            $("#modelImg3").attr("src","https://imgauto-phinf.pstatic.net/20221114_278/auto_1668407588321tooKE_JPEG/20221114153305_iazfNdZ5.jpg")
            $("#modelImg4").attr("src","https://imgauto-phinf.pstatic.net/20221114_230/auto_1668407592470vF7W4_JPEG/20221114153306_GoR7DgFx.jpg")
        }else if(modelName === "PALISADE"){
        	$("#designContents1").text("당신의 모든 세상")
        	$("#designContents2").text("플래그십 SUV 팰리세이드와 함께")
        	$("#designContents3").text("당신만의 세상을 향한 멋진 여정을 준비하십시오.")
            $("#modelImg1").attr("src","https://www.hyundai.com/static/images/model/palisade/24my/palisade_highlights_calligraphy_black_edition.jpg")
            $("#modelImg2").attr("src","https://imgauto-phinf.pstatic.net/20230602_264/auto_16856654386019KNdn_JPEG/20230602092351_tdAOapEe.jpg")
            $("#modelImg3").attr("src","https://imgauto-phinf.pstatic.net/20230602_31/auto_1685665441574eeGnY_JPEG/20230602092352_EwyRvssR.jpg")
            $("#modelImg4").attr("src","https://imgauto-phinf.pstatic.net/20230602_62/auto_1685665480924d7W81_JPEG/20230602092423_09EvVGob.jpg")
        }else if(modelName === "TUCSON"){
        	$("#designContents1").text("당신만의 특별한 공간")
        	$("#designContents2").text("더 오래 머물수록")
        	$("#designContents3").text("그 가치는 빛이 납니다.")
            $("#modelImg1").attr("src","https://imgauto-phinf.pstatic.net/20220713_300/auto_1657678959857IrlRo_JPEG/20220713112231_nGtj2avU.jpg")
            $("#modelImg2").attr("src","https://imgauto-phinf.pstatic.net/20220713_267/auto_1657678961612evoLb_JPEG/20220713112232_RRUPqwFe.jpg")
            $("#modelImg3").attr("src","https://imgauto-phinf.pstatic.net/20220713_179/auto_1657678963743J8hwa_JPEG/20220713112232_alS7qbIH.jpg")
            $("#modelImg4").attr("src","https://imgauto-phinf.pstatic.net/20220713_80/auto_1657679019560cunWa_JPEG/20220713112329_cEnTDYQr.jpg")
        }
		
		 function valueComma(value) {
		 	return value.replace(/\d+/, function(number) {
		    	return parseInt(number).toLocaleString();
		        });
		    }

		    $(".comma").each(function() {
		        let value = $(this).text();
		        $(this).text(valueComma(value));
		    });
    })

</script>

<script>
$(document).ready(function() {
   
});
</script>
</body>
</html>