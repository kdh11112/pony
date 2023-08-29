$(document).ready(function() {
	// 페이지 스크롤 이동
	let offset = $(".top-title").offset();
	$('html').animate({ scrollTop: offset.top }, 1);

	function Comma(value) {
		return value.replace(/(\d+)/, function(number) {
			return parseInt(number).toLocaleString();
		});

	}
	// keyup 이벤트 추가
	$('#parts-find-text').keyup(function() {
		let item = [];
		let partsFindText = $(this).val(); // 현재 입력 필드의 값 가져오기
		if ($('#parts-find-text').val() != "") {
			$('#parts-find-text').autocomplete({
				source: function(request, response) {
					$.ajax({
						url: "/model/searchParts2",
						data: { partName: partsFindText },
						dataType: 'json',
						success: function(data) {
							if (data.length > 0) {
								for (let i = 0; i < data.length; i++) {
									item.push({
										label: data[i],
									});
								}
							}
							response(item);
						},
					});

				},
				select: function(event, ui) {
					performPartsFind(ui.item.label);
				},
				focus: function(event, ui) {
					return false;
				},
				minLength: 1,
				delay: 100,
				close: function(event) {
				},

			});
		}

	});



	$("#parts-find-btn").on("click", function() {

		let partsFindText = document.getElementById("parts-find-text").value;
		document.getElementById("parts-find-text").value = "";
		console.log(partsFindText);
		if (partsFindText == "") {
			alert("찾으실 부품명을 입력해주세요");
		} else {
			performPartsFind(partsFindText);
		}
	});
	function performPartsFind(partsFindText) {
		$.ajax({
			url: "/model/searchParts",
			data: { partName: partsFindText },
			success: function(response) {
				$("div.card-body").empty();
				for (let i = 0; i < response.length; i++) {
					let data = "<div class='searched-parts row'><div class='col-md-1'></div><div class='searched-col col-md-7 back'>"
						+ response[i].partName + " (차종:" + response[i].modelName + ")</div><div class='searched-col col-md-3 back'>"
						+ Comma(String(response[i].partPrice))
						+ "원</div> <div class='col-md-1'></div></div>";
					$("div.card-body").append(data);
				}
				// 페이지 스크롤 이동
				let offset = $(".searched-parts").offset();
				$('html').animate({ scrollTop: offset.top }, 1);
			},
			error: function(error) {
				console.log(error + "에러~");
			}
		});
	}

});












