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
<style>
    .container{
        margin-top: 100px;
    }
    .card-title{
        height: 70px;
        background-color: #5E5E5E;
        font-size: 45px;
        font-weight: bold;
        text-align: center;
        color: aliceblue;
    }
    .top-title{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 150px;
        background-color: rgb(247, 244, 239);
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
    .selectModel{
        font-weight: bold;
        margin-top: 30px;
    }
    .vs-btn {
        display: flex;
        justify-content: center;
        margin: 70px;
    }
    
</style>
</head>
<body>
	<form action="/modelComparison2" id="frm">
	    <div><img src="../images/model/vs_top.png" alt="" width="100%;" style="height: 200px;"></div>
	    <div style="height: 100px; background-color: white;"></div>
	        <div style="background-color: white;">
	            <div class="top-title text-center">
	                <h1 class="top-title-text">모델 비교</h1>
	                <h1 class="top-title-text2">판매되는 차량을 빠르게 비교하여 원하는 차량을 쉽게 찾아볼 수 있습니다</h1>
	            </div>
	            <div>
	            <div class="container">
	                <div class="row justify-content-center">
	                    <div class="col-md-6">
	                        <div class="card mx-auto" style="width: 25rem;">
	                            <h5 class="card-title text-center">A차량 선택</h5>
	                            <div class="select text-center">
	                                <select class="selectModel btn btn-secondary" id="selectModel1" name="selectModel1" >
                                        <option value="">차량선택</option>
                                        <option value="AVANTE">AVANTE</option>
	                                    <option value="SONATA">SONATA</option>
	                                    <option value="GRANDEUR">GRANDEUR</option>
	                                    <option value="PALISADE">PALISADE</option>
	                                    <option value="TUCSON">TUCSON</option>
                                    </select>
	                            </div>
	                            <p class="card-text" style="height: 100px;"></p>
	                            <img src="../images/model/vs_logo.jpg" class="card-img-top" alt="..." id="card-img1">
	                            <div class="card-body"></div>
	                        </div>
	                    </div>
	
	                    <div class="col-md-6">
	                        <div class="card mx-auto" style="width: 25rem">
	                            <h5 class="card-title text-center">B차량 선택</h5>
	                            <div class="dropdown text-center">
                                    <select class="selectModel btn btn-secondary" id="selectModel2" name="selectModel2" >
                                        <option value="">차량선택</option>
                                        <option value="AVANTE">AVANTE</option>
	                                    <option value="SONATA">SONATA</option>
	                                    <option value="GRANDEUR">GRANDEUR</option>
	                                    <option value="PALISADE">PALISADE</option>
	                                    <option value="TUCSON">TUCSON</option>
                                    </select>
	                            </div>
	                            <p class="card-text" style="height: 100px;"></p>
	                            <img src="../images/model/vs_logo.jpg" class="card-img-top" alt="..." id="card-img2">
	                            <div class="card-body"></div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="vs-btn">
	                <button type="button" class="btn btn-secondary">모델 비교</button>
	            </div>
	        </div>
	    </div>
    </form>
    <script>
         $(function(){
            $("select").change(function() {
                var selectedModel1 = $("#selectModel1").val();
                var selectedModel2 = $("#selectModel2").val();
                
                if(selectedModel1 === "") {
                    $("#card-img1").attr("src", "../images/model/vs_logo.jpg");
                }else if(selectedModel1 === "AVANTE") {
                    $("#card-img1").attr("src", "https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F5662_000_9%2F20230313103619999_CT56XDZ2R.png%2F20230313102856_v.png%3Ftype%3Dm1500");
                }else if(selectedModel1 === "SONATA"){
                    $("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F5662_000_9%2F20230503101116687_KBFEQSEHR.png%2F20230503100646_X.png%3Ftype%3Dm1500")
                }else if(selectedModel1 === "GRANDEUR"){
                    $("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_8/20221114125621183_IOQGN0BH1.png/20221114124905_u.png?type=m1500")
                }else if(selectedModel1 === "PALISADE"){
                    $("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_9/20230602100123286_X619RPAHU.png/20230602094536_k.png?type=m1500")
                }else if(selectedModel1 === "TUCSON"){
                    $("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_8/20220713140508604_CLPS0GTFK.png/20220713140232_Z.png?type=m1500")
                }
                
                if(selectedModel2 === "") {
                    $("#card-img2").attr("src", "../images/model/vs_logo.jpg");
                }else if(selectedModel2 === "AVANTE") {
                    $("#card-img2").attr("src", "https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_9/20230313103619999_CT56XDZ2R.png/20230313102856_v.png?type=m1500");
                }else if(selectedModel2 === "SONATA"){
                    $("#card-img2").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F5662_000_9%2F20230503101116687_KBFEQSEHR.png%2F20230503100646_X.png%3Ftype%3Dm1500")
                }else if(selectedModel2 === "GRANDEUR"){
                    $("#card-img2").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_8/20221114125621183_IOQGN0BH1.png/20221114124905_u.png?type=m1500")
                }else if(selectedModel2 === "PALISADE"){
                    $("#card-img2").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_9/20230602100123286_X619RPAHU.png/20230602094536_k.png?type=m1500")
                }else if(selectedModel2 === "TUCSON"){
                    $("#card-img2").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_8/20220713140508604_CLPS0GTFK.png/20220713140232_Z.png?type=m1500")
                }
            });
            $(".vs-btn").on("click",function(){
            	var selectedModel1 = $("#selectModel1").val();
                var selectedModel2 = $("#selectModel2").val();
            	
                if(selectedModel1 ==="" || selectedModel2 ===""){
            		alert("모델을 선택해주세요.");
            	}else if(selectedModel1 === selectedModel2){
            		alert("선택한 모델이 같습니다. 다른모델을 선택해주세요.");
            	}else{
            		document.getElementById("frm").submit();
            	}
                
            })
        });
    </script>
</body>
</html>