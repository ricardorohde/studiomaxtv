<!DOCTYPE html>
<?php
require('../../_app/Config.inc.php');
$url = filter_input(INPUT_GET, 'url_name');
if (!empty($url)):
    $Read = new Read;
    $Read->ExeRead("noticias", "WHERE url_name = :url", "url={$url}");

    if ($Read->getResult()):
        $extract = extract($Read->getResult()[0]);
        $data = date('d/m/Y H:i', strtotime($data)) . ' Hrs';
    else:
        header('Location: ' . HOME);
    endif;
endif;
?>
<html lang="pt-br">    
    <head>
        <meta charset="UTF-8">
        <title><?= $titulo . ' - ' . SITENAME; ?></title>
        <style>
            body{ font-family: sans-serif; font-size: 12pt;}
            .box_print{ width: 70%;  margin: 0 15%; float: left;}
            .header_print_logo{ width: 60%; float: left;}
            .header_print_dados{ width: 40%; margin-top: 2%; text-align: right; font-size: 10pt; float: right;}
            .line{ width: 100%; margin-top: 10px; border-bottom: 2px solid #35314e; float: left;}
            .content_print{ width: 100%; float: left;}
            .content_titulo{ width: 100%; margin-top: 1%; font-size: 15pt; float: left;}
            .content_subtitulo{ width: 100%; margin-bottom: 10px; font-size: 11pt; float: left;}
            .content_news{ width: 100%; margin-top: 20px; font-size: 12pt; text-align: justify; }
            .content_news p{ margin: 10px 0;}
            .content_foto{ width: 380px; padding-right: 10px; float: left; }
            @media print{
                .box_print{ width: 100%; margin: 0; float: left;}
                @page :left{ margin: 0.5cm;}
                @page :right{ margin: 0.5cm;}
            }
        </style>
    </head>
    <body onload="window.print()">
        <div class = "box_print" >
            <div class = "header_print" >
                <a href = "<?= HOME; ?>" title = "<?= SITENAME . ' - Informação é a nossa prioridade!'; ?>" >
                    <div class = "header_print_logo" > <img src = "images/logo_topo.png" width = "200" > </div>
                </a>
                <div class = "header_print_dados" >
                    <div class = "header_print_data" ><?= !empty($data) ? '<b>Data:</b> ' . $data : ''; ?> </div>
                    <div class = "header_print_autor" ><?= !empty($autor) ? '<b>Autor:</b> ' . $autor : ''; ?> </div>
                    <div class = "header_print_fonte" ><?= !empty($fonte) ? '<b>Fonte:</b> ' . $fonte : ''; ?> </div>
                </div>
                <span class = "line" ></span>
            </div>
            <div class = "content_print" >
                <div class = "content_titulo" ><?= $titulo ?> </div>
                <div class = "content_subtitulo" ><?= $subtitulo ?> </div>
                <div class = "content_news" >
                    <div class = "content_foto" > <img src = "../../uploads/<?= $foto; ?>" width = "380" ></div>
                    <?= $noticia; ?>
                </div>
            </div>
        </div>
    </body>
</html>
