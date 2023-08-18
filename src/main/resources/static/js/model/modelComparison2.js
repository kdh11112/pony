$(document).ready(function() {
	// 페이지 스크롤 이동
	let offset = $(".row").offset();
	$('html').animate({ scrollTop: offset.top }, 1);

	function valueComma(value) {
		return value.replace(/\d+/, function(number) {
			return parseInt(number).toLocaleString();
		});
	}

	$(".comma").each(function() {
		let value = $(this).text();
		$(this).text(valueComma(value));
	});
});