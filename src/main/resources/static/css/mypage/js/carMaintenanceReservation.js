$(document).ready(function() {

	/* =============== 두번째 동의서 버튼 클릭시 체크, 첫번째 아코디언 열기, 스크롤 이동 ==================*/
	/*$("#agree-btn2").on("click", function() {
		//let checkbox = document.getElementById("flexCheckDefault2");
		let offset = $("#headingOne").offset();
		//checkbox.checked = true;
		$("#modal2").modal("hide");
		$("#headingOneBtn").attr("class", "accordion-button show");
		$("#collapseOne").addClass("show");
		$('html').animate({ scrollTop: offset.top }, 1);
	});*/

	/*	$("#headingOne,#headingTwo,#headingThree").on("click", function() {
			//let checkbox1 = document.getElementById("flexCheckDefault1");
			//let checkbox2 = document.getElementById("flexCheckDefault2");
			if (checkbox1.checked === false || checkbox2.checked === false) {
				//alert("필수항목을 동의해주세요");
			} else {
			}
				$("#headingOneBtn").attr("data-bs-toggle", "");
				$("#headingTwoBtn").attr("data-bs-toggle", "");
				$("#headingThreeBtn").attr("data-bs-toggle", "");
				$("#headingOneBtn").attr("data-bs-toggle", "collapse");
				return false;
		});*/
	/*$("#headingTwo").on("click", function() {
		let selectModel = $("#selectModel").val();
		if (selectModel === "") {
			alert("모델을 선택해주세요");
			$("#headingTwoBtn").attr("data-bs-toggle", "");
			$("#headingThreeBtn").attr("data-bs-toggle", "");
			return false;
		} else {
			$("#headingTwoBtn").attr("data-bs-toggle", "collapse");
		}
	});*/

	/*$("#headingThree").on("click", function() {
		let selectShop = $(".shop-no-btn").val();
		if (selectShop === undefined || selectShop === "") {
			alert("이전 항목을 선택해주세요");
			$("#headingThreeBtn").attr("data-bs-toggle", "");
			return false;
		} else {
			$("#headingThreeBtn").attr("data-bs-toggle", "collapse");
		}
	});*/
	/*$("select").change(function() {
		var selectModel = $("#selectModel").val();
		if (selectModel === "") {
			$("#card-img1").attr("src", "../images/model/vs_logo.jpg");
		} else if (selectModel === "1") {
			$("#card-img1").attr("src", "https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F5662_000_9%2F20230313103619999_CT56XDZ2R.png%2F20230313102856_v.png%3Ftype%3Dm1500");
		} else if (selectModel === "2") {
			$("#card-img1").attr("src", "https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https%3A%2F%2Fdbscthumb-phinf.pstatic.net%2F5662_000_9%2F20230503101116687_KBFEQSEHR.png%2F20230503100646_X.png%3Ftype%3Dm1500")
		} else if (selectModel === "3") {
			$("#card-img1").attr("src", "https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_8/20221114125621183_IOQGN0BH1.png/20221114124905_u.png?type=m1500")
		} else if (selectModel === "4") {
			$("#card-img1").attr("src", "https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_9/20230602100123286_X619RPAHU.png/20230602094536_k.png?type=m1500")
		} else if (selectModel === "5") {
			$("#card-img1").attr("src", "https://search.pstatic.net/common?quality=75&direct=true&ttype=input&src=https://dbscthumb-phinf.pstatic.net/5662_000_8/20220713140508604_CLPS0GTFK.png/20220713140232_Z.png?type=m1500")
		}
	});*/


	/*$("#selectOk").on("click", function() {
		var selectedModel = $("#selectModel").val();
		if (selectedModel === "") {
			alert("모델을 선택해주세요");
			return false;
		} else {
			//alert("ModelName : " + selectedModel + "를 선택했습니다");
			$("#selectModel option:selected").text(); //text값 가져오기
			$("#collapseOne").removeClass("show");
			$("#headingOneBtn").attr("class", "accordion-button show collapsed");
			$("#headingTwoBtn").attr("class", "accordion-button show");
			$("#collapseTwo").addClass("show");
		}
	})*/


});

$(function() {


	$("#shopFindBtn, .shop-area-btn").on("click", function() {
		console.log("test");
		$("div.shop-area-point.row").empty();
		let shopAreaFind2 = document.getElementById("shopAreaFind").value;
		let selectedVal = "";
		if (shopAreaFind2 === "") { selectedVal = $(this).val(); }
		else selectedVal = shopAreaFind2;

		$.ajax({
			url: "/shopFind",
			data: { shopAreaFind: selectedVal },
			success: function(reponse) {
				for (let i = 0; i < reponse.length; i++) {
					var data = "<div class='shop-detail col-md-4' > <h4>"
						+ reponse[i].shopAreaPoint + "</h4><p>"
						+ reponse[i].shopAddr + "</p><p>"
						+ reponse[i].shopPhone + "</p><button type='button' class='shop-no-btn btn btn-primary' value='"
						+ reponse[i].shopNo + "'>선택</button></div>";
					$("div.shop-area-point.row").append(data);
				}
				document.getElementById("shopAreaFind").value = "";

				let offset = $("#headingThree").offset();
				$('html').animate({ scrollTop: offset.top }, 1);
			},
			error: function() {
				console.log("에러~~~~~");
			}
		})
	})
})
let testDriveTime = [];
let testDriveSchedule = [];
let shopNo = [];
let selectedShopNo ="";

$(document).on("click", ".shop-no-btn", function() {
	//alert("shopAreaPoint = " + $(this).val());
	$("#collapseTwo").removeClass("show");
	$("#headingTwoBtn").attr("class", "accordion-button show collapsed");
	$("#headingThreeBtn").attr("class", "accordion-button show");
	$("#collapseThree").addClass("show");
	selectedShopNo = $(this).val();
		var asd =$("input[name=selectedCars]:checked").val();
		console.log(asd);
	$.ajax({
		url: "/carMaintenanceReservation",
		success: function(response) {
			
				//testDriveTime2 = $("#testDriveTime2").val(testDriveTime);
				buildCalendar();
				let offset = $("#headingThree").offset();
				$('html').animate({ scrollTop: offset.top }, 1);

			}

	

})
})


let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
let today = new Date();     // 페이지를 로드한 날짜를 저장
today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {

	let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
	let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

	let tbody_Calendar = document.querySelector(".Calendar > tbody");
	document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
	document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

	while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
		tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
	}
	let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가         

	for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
		let nowColumn = nowRow.insertCell();        // 열 추가
	}

	const buttonTexts = ["선택"];

	for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
		let nowColumn = nowRow.insertCell();        // 새 열을 추가하고

		let newDIV = document.createElement("p");
		newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
		nowColumn.appendChild(newDIV);

		let testDriveButton;
		let testtotal;
		let newButton;
		if (nowDay >= today) {
			for (let i = 0; i < 1; i++) {
				let buttonRow = document.createElement("div");
				buttonRow.className = "button-row"; // 스타일링을 위한 클래스 추가
				newButton = document.createElement("button");
				newButton.type = "button";
				newButton.dataset.year = nowMonth.getFullYear();
				newButton.dataset.month = (nowMonth.getMonth() + 1);
				newButton.innerText = buttonTexts[i];

				testDriveButton = nowDay.getFullYear() + "-" + leftPad(nowMonth.getMonth() + 1) + "-" + leftPad(nowDay.getDate()) + buttonTexts[i]

				newButton.onclick = handleButtonClick;


				buttonRow.appendChild(newButton);

				nowColumn.appendChild(buttonRow);
			}

		}


		if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
			nowColumn.style.color = "#DC143C";
		}
		if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
			nowColumn.style.color = "#0000CD";
			nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가

		}


		if (nowDay < today) {                       // 지난날인 경우
			nowColumn.className = "pastDay";
		}
		else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
			nowColumn.className = "today";
		}
		else {                                      // 미래인 경우
			nowColumn.className = "futureDay";
		}
	}
}

// 이전달 버튼 클릭
function prevCalendar() {
	nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
	buildCalendar();
}
// 다음달 버튼 클릭
function nextCalendar() {
	nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
	buildCalendar();
}

// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
function leftPad(value) {
	if (value < 10) {
		value = "0" + value;
		return value;
	}
	return value;
}


let shopAreaPoint = "";
$(document).on("click", ".shop-no-btn", function() {
	shopAreaPoint = $(this).closest(".shop-detail").find("h4").text();
	document.getElementById("shopAreaPointName").innerText = shopAreaPoint;
	// 이하 코드 생략
});

let selectedSchedule = ""; // 시간 선택 값을 저장할 변수를 빈 문자열로 초기화합니다.
let clientCarNumber ="";
let no;
let reservationClientRequests="";
function handleButtonClick(event) {
	const button = event.target;
	const buttonYear = button.dataset.year;
	const buttonMonth = button.dataset.month;
	const buttonDate = button.parentElement.parentElement.querySelector("p").innerText;

	selectedSchedule = selectedSchedule = buttonYear + "-" + "0" + buttonMonth + "-" + buttonDate;
 
 	clientCarNumber = $("#selectedCarName").text()
 	 	

	$("#selectedSchedule").val(selectedSchedule);
	// 선택한 체크박스의 값 : no <=-  구하기 
	
alert(selectedSchedule+"\n" + selectedShopNo + "\n" + clientCarNumber+"\n"+no);
	/*alert("선택한 차량: " + $("#selectedCarName").text() + "\n"
		+ "선택한 지점: " + shopAreaPoint + "\n"
		+ "선택한 날짜: " + selectedSchedule + "\n"
		+ "선택한 목록이 맞으면 '신청하기' 버튼을 눌러주세요");*/
		
	let offset = $("#OkBtn").offset();
	$('html').animate({ scrollTop: offset.top }, 1);
}


	
	





/*function carMaintenanceModify() {
		console.log("shopNo : " + shopNo);

		console.log($('input:radio').is(":checked"));

		//시승신청변경 modal로 하기

		$('input:radio').each(function(index) {
			if ($(this).is(":checked") == true) {

				var no = $(this).parent().next().val().trim();

				console.log($("#selectModel option:selected").val());// jquery 선택한 옵션 객체의 값 구하기 
				var optionValue = $("#selectModel option:selected").val();

				//var no = $(this).parent().next().val();

				// /testdrivingmodify?modelNo=111&shopNo=222&testDriverTime=???&testDriveSchedule=????
				$.ajax({
					url : "/testdrivingmodify",
					method : "POST", //
					data : {
						modelNo : optionValue,
						shopNo : shopNo,
						buttonTime : buttonTime,
						testDriveSchedule : testDriveSchedule,
						testDriveNo : no
					},
					success : function(data) {
					}
				});
				console.log(no);
			}
			location.href = "/testdriving";

		});
	}*/
		$(function(){
	
$("#OkBtn").on("click", function() {

	carMaintenanceModify();

	alert(selectedSchedule+"\n" + selectedShopNo + "\n" + clientCarNumber +"\n " + no);

	selectedSchedule = $("#selectedSchedule").val(selectedSchedule);
	selectedShopNo = $("#selectedShopNo").val(selectedShopNo);
	clientCarNumber = $("#clientCarNumber").val(clientCarNumber);
	reservationNo = $("#reservationNo").val(no);
	reservationClientRequests = $("#reservationClientRequests").val(reservationClientRequests);
	
	
	
	
	location.href="/carMaintenanceReservationDetail";
	
	//document.getElementById("frm").submit();
})
	function carMaintenanceModify() {

		console.log("asd"+ $('input:radio').is(":checked"));
		
		//시승신청변경 modal로 하기

		$('.asd').each(function(index) {
			if ($(this).is(":checked") == true) {

				no = $(this).parent().next().val().trim();
				console.log("no : "+no);
				console.log("selectedSchedule : "+selectedSchedule);
				console.log("selectedShopNo : "+selectedShopNo);
				console.log("clientCarNumber: "+clientCarNumber);
				console.log("reservationClientRequests : "+reservationClientRequests);
				//console.log($("#selectModel option:selected").val());// jquery 선택한 옵션 객체의 값 구하기 
				//var optionValue = $("#selectModel option:selected").val();

				//var no = $(this).parent().next().val();

				// /testdrivingmodify?modelNo=111&shopNo=222&testDriverTime=???&testDriveSchedule=????
				$.ajax({
					url : "/updateCarMaintenanceReservation",
					method : "POST", //
					data : {
						clientCarNumber : clientCarNumber,
						selectedShopNo : selectedShopNo,
						selectedSchedule : selectedSchedule,
						reservationNo : no,
						reservationClientRequests : reservationClientRequests
					},
					success : function(data) {
						console.log(data);
					}
				});
			}

		});
	}
})
	
	
	
