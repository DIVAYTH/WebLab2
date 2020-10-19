"use strict";

$(function () {
    $(".group input").on("click", function () {
        $('.group input').prop('checked', false);
        $(this).prop("checked", true);
    });

    $(".graph").on("click", function (e) {
        let point = this.getBoundingClientRect();
        let r = $('input[name="R"]:checked').val();
        let xVal = e.clientX - point.left;
        let yVal = e.clientY - point.top;
        let x = (((xVal - 200) * r) / 140).toFixed(1);
        let y = (((200 - yVal) * r) / 140).toFixed(1);
        checkValue(y, x, r, e);
        $.get("control",{X: x, Y: y, R: r}, function (text) {
            window.document.write(text);
        } )
    });

    $('.submitBtn').on('click', function (event) {
        let y = $('input[name="Y"]').val();
        let x = $('input[name="X"]:checked').val();
        let r = $('input[name="R"]:checked').val();
        checkValue(y, x, r, event);
    })
});

function checkValue(y, x, r, event) {
    if (!r) {
        showError('Вы не выбрали радиус', event);
    } else if (!y) {
        showError('Вы не ввели Y', event);
    } else if (y < -3 || y > 3) {
        showError('Y должен быть от -3 до 3', event);
    } else if (isNaN(y)) {
        showError('Y должен быть числом', event);
    } else if (!x) {
        showError('Вы не ввели X', event);
    } else if (x < -2 || x > 2) {
        showError('X должен быть от -2 до 2', event);
    }
}

function showError(message, event) {
    $('.error').css({'color': 'red', 'position': 'absolute', 'margin': '0 0 0 20px'}).html(message)
    event.preventDefault();
}