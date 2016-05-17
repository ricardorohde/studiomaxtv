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
$(function checkDestaque() {
    var cDestaque = "#destaque";
    var cDestaqueTipo = '#destaque_tipo';
    var cDataFSlide = '#data_fslide';
    $(cDestaque).change(function () {
        if ($(this).val() === 'sim') {
            $(cDestaqueTipo).removeAttr("disabled");
            $(cDataFSlide).removeAttr("disabled");
            $(cDestaqueTipo).change(function () {
                if ($(cDestaqueTipo).val() === 'slide') {
                    $(cDataFSlide).removeAttr("disabled");
                } else {
                    $(cDataFSlide).attr("disabled", "disabled");
                }
            });
        } else {
            $(cDestaqueTipo).attr("disabled", "disabled");
            $(cDataFSlide).attr("disabled", "disabled");
        }
    });
});

$(function checkColunista() {
    var cColuna = "#coluna";
    var cColunista = '#colunista';
    $(cColuna).change(function () {
        if ($(this).val() === 'sim') {
            $(cColunista).removeAttr("disabled");
        } else {
            $(cColunista).attr("disabled", "disabled");
        }
    });
});

//CKEditor
CKEDITOR.replaceAll();