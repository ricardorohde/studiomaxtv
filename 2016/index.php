<?php
ob_start();
require('./_app/Config.inc.php');
$Session = new Session;
Check::UserOnline();
?>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <!--[if lt IE 9]><script src="<?= HOME; ?>/_cdn/html5.js"></script><![endif]-->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="theme-color" content="#35314E">
        <?php
        $Link = new Link;
        $Link->getTags();
        ?>
        <!-- CSS -->
        <link rel='stylesheet' type='text/css' href='https://fonts.googleapis.com/css?family=Oxygen:400,700'>
        <link rel="stylesheet" type='text/css' href="<?= HOME; ?>/_cdn/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<?= INCLUDE_PATH; ?>/css/style.min.css"/>
        <link rel="stylesheet" type='text/css' href="<?= HOME; ?>/_cdn/flexslider/flexslider.css">
    </head>
    <body>
        <?php
        //Topo
        require(REQUIRE_PATH . '/inc/header.inc.php');

        //Capa
        if (!require($Link->getPatch())):
            WSErro('Erro ao incluir arquivo de navegação!', WS_ERROR, true);
        endif;

        //Rodape
        require(REQUIRE_PATH . '/inc/footer.inc.php');
        ?>
    </body>
    <!-- JS -->
    <script src="<?= HOME; ?>/_cdn/jquery.js"></script>
    <script src="<?= HOME; ?>/_cdn/flexslider/flexslider.min.js"></script>
    <script src="<?= HOME; ?>/_cdn/_scripts.conf.js"></script>
</html>
<?php
ob_end_flush();