$('#buttonEdit').click(function () {
    $('#edition').css('display', 'block');
});

$('#hide').click(function () {
    $('#edition').css('display', 'none');
});

$('#resetBtn').click(function () {
    $("#public").prop('checked', false);
    $("#private").prop('checked', false);
    $("#delete").prop('checked', false);
});