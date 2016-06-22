$(document).ready(function () {
    /*Table de Grid*/
    $('#tableView').dataTable({
        "aaSorting": [[0, 'desc']],
        "oLanguage": {
            "sEmptyTable": "Nenhum registro encontrado",
            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
            "sInfoFiltered": "(Filtrados de _MAX_ registros)",
            "sInfoPostFix": "",
            "sInfoThousands": ".",
            "sLengthMenu": "_MENU_  Resultados por página",
            "sLoadingRecords": "Carregando...",
            "sProcessing": "Processando...",
            "sZeroRecords": "Nenhum registro encontrado",
            "sSearch": "Buscar",
            "oPaginate": {
                "sNext": "Próximo",
                "sPrevious": "Anterior",
                "sFirst": "Primeiro",
                "sLast": "Último"
            },
            "oAria": {
                "sSortAscending": ": Ordenar colunas de forma ascendente",
                "sSortDescending": ": Ordenar colunas de forma descendente"
            }
        }
    });
    /*Esconde avisos*/
    $('.alert').delay(5000).fadeOut(1000);

    /*Esconde dados de acesso*/
    $('.dadosAcess').hide();

    /*Iniciar o DatePicker*/
    $('.datepicker').datepicker({
        language: 'pt-BR'
    });
});

$(function () {
    $("[data-mask]").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/aaaa"});
    $("[datetime-mask]").inputmask("datetime");
    $("[phone-mask]").inputmask("(99) 9999-9999");
});

//Exibi ou Esconde os dados de acesso
$(function () {
    var chkalt = "input[name='altDadosAcess']";
    $(chkalt).change(function () {
        if ($(this).is(":checked")) {
            $(".dadosAcess").show();
        } else {
            $(".dadosAcess").hide();
        }
    });
});

//Desabilita campos
$(function checkTipo() {
    var cIframe = ".tp-iframe";
    var cYoutube = ".tp-youtube";
    var cColuna = "#tipo";
    $(cColuna).change(function () {
        if ($(this).val() === 'tv') {
            $(cIframe).show();
        } else {
            $(cIframe).hide();
        }
        if ($(this).val() === 'video') {
            $(cYoutube).show();
        } else {
            $(cYoutube).hide();
        }
    });
});

//Desabilita campos
$(function checkAgend() {
    var cAgend = ".agendamento";
    var cColuna = "#destaque";
    $(cColuna).change(function () {
        if ($(this).val() === 'sim') {
            $(cAgend).show();
        } else {
            $(cAgend).hide();
        }
    });
});

//CKEditor
CKEDITOR.replaceAll();