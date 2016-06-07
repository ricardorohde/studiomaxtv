$(function () {
    //SELETOR, EVENTO/EFEITO, CALLBACK, AÇÃO
    $('.j_newssubmit').submit(function () {
        var form = $(this);
        var dados = form.serialize();

        $.ajax({
            url: './cdn/ajax/newsletter.php',
            data: dados,
            type: 'POST',
            dataType: 'HTML',
            beforeSend: function () {
                form.find('.j_ico_process').fadeIn(500);
            },
            success: function (resposta) {
                console.log(resposta);
            }

        });

        return false;
    });
});

