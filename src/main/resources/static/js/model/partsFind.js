$(document).ready(function() {
    function Comma(value) {
        return value.replace(/(\d+)/, function(number) {
            return parseInt(number).toLocaleString();
        });
    }

    $("#parts-find-btn").on("click", function() {
        let partsFindText = document.getElementById("parts-find-text").value;
        document.getElementById("parts-find-text").value = "";
        console.log(partsFindText);
        if (partsFindText == "") {
            alert("찾으실 부품명을 입력해주세요");
        } else {
            $.ajax({
                url: "/searchParts",
                data: { partName: partsFindText },
                success: function(response) {
                    $("div.card-body").empty();
                    for (let i = 0; i < response.length; i++) {
                        let data = "<div class='searched-parts row'><div class='col-md-1'></div><div class='searched-col col-md-7 asd'>"
                            + response[i].partName + "</div><div class='searched-col col-md-3 asd'>"
                            + Comma(String(response[i].partPrice))
                            + "원</div> <div class='col-md-1'></div></div>";
                        $("div.card-body").append(data);
                    }
                },
                error: function(error) {
                    console.log(error + "에러~");
                }
            });
        }
    });
});