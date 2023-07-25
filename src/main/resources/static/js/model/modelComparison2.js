$(document).ready(function() {
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