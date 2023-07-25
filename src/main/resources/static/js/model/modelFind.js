
         $(function(){
            $("select").change(function() {
                var selectedModel = $("#selectModel").val();
                
                if (selectedModel === "") {
                    $("#card-img1").attr("src", "../images/model/vs_logo.jpg");
                }else if (selectedModel === "AVANTE") {
                    $("#card-img1").attr("src", "https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F5662_000_9%2F20230313103619999_CT56XDZ2R.png%2F20230313102856_v.png%3Ftype%3Dm1500");
                }else if(selectedModel === "SONATA"){
                    $("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F5662_000_9%2F20230503101116687_KBFEQSEHR.png%2F20230503100646_X.png%3Ftype%3Dm1500");
                }else if(selectedModel === "GRANDEUR"){
                    $("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_8/20221114125621183_IOQGN0BH1.png/20221114124905_u.png?type=m1500");
                }else if(selectedModel === "PALISADE"){
                    $("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_9/20230602100123286_X619RPAHU.png/20230602094536_k.png?type=m1500");
                }else if(selectedModel === "TUCSON"){
                    $("#card-img1").attr("src","https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_8/20220713140508604_CLPS0GTFK.png/20220713140232_Z.png?type=m1500");
                }
                
            });
            $(".vs-btn").on("click",function(){
            	var selectedModel = $("#selectModel").val();
            	if(selectedModel === ""){
            		alert("모델을 선택해주세요")
            	}else {
            		document.getElementById("frm").submit();
            	}
            })
            
        });
