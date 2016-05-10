<?php
ob_start();
session_start();
require('../_app/Config.inc.php');

$login = new Login(1);
$logoff = filter_input(INPUT_GET, 'logoff', FILTER_VALIDATE_BOOLEAN);
$getexe = filter_input(INPUT_GET, 'exe', FILTER_DEFAULT);

if (!$login->CheckLogin()):
    unset($_SESSION['userlogin']);
    header('Location: index.php?exe=restrito');
else:
    $userlogin = $_SESSION['userlogin'];
    $DadosLoga = ['cont_acesso' => $userlogin['cont_acesso'] + 1, 'ip' => $_SERVER['REMOTE_ADDR']];
    $Update = new Update;
    $Update->ExeUpdate('usuarios', $DadosLoga, "WHERE id = :id", "id={$userlogin['id']}");
endif;

if ($logoff):
    $Update->ExeUpdate('usuarios', ['ultimo_acesso' => Check::Data(date('d/m/Y'))], "WHERE id = :id", "id={$userlogin['id']}");
    unset($_SESSION['userlogin']);
    header('Location: index.php?exe=logoff');
endif;
?>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="http://www.creativewebsites.com.br/midia/favicon.ico" />
        <title> CW ADMIN v.4.0 - Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- Bootstrap 3.3.2 -->
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <!-- Font Awesome Icons -->
        <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
        <!-- Ionicons -->
        <link type="text/css" rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" />
        <!-- Morris chart -->
        <link type="text/css" rel="stylesheet" href="plugins/morris/morris.css" />
        <!-- jvectormap -->
        <link type="text/css" rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css" />
        <!-- Datepicker -->
        <link type="text/css" rel="stylesheet" href="plugins/datepicker/datepicker3.css" />
        <!-- Data Tables -->
        <link type="text/css" rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css" />
        <!-- Theme style -->
        <link type="text/css" rel="stylesheet" href="dist/css/AdminLTE.min.css" />
        <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
        <link type="text/css" rel="stylesheet" href="dist/css/skins/_all-skins.min.css" />
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="skin-blue">
        <div class="wrapper">
            <?php
            //Main Menu
            include(__DIR__ . DIRECTORY_SEPARATOR . 'system' . DIRECTORY_SEPARATOR . 'inc' . DIRECTORY_SEPARATOR . 'main-menu.inc.php');
            //Sidebar
            include(__DIR__ . DIRECTORY_SEPARATOR . 'system' . DIRECTORY_SEPARATOR . 'inc' . DIRECTORY_SEPARATOR . 'main-sidebar.inc.php');
            ?>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <?php
                //QUERY STRING
                if (!empty($getexe)):
                    $includepatch = __DIR__ . DIRECTORY_SEPARATOR . 'system' . DIRECTORY_SEPARATOR . strip_tags(trim($getexe) . '.php');
                else:
                    $includepatch = __DIR__ . DIRECTORY_SEPARATOR . 'system' . DIRECTORY_SEPARATOR . 'home.php';
                endif;

                if (file_exists($includepatch)):
                    require_once($includepatch);
                else:
                    echo "<div class=\"content notfound\">";
                    WSErro("<b>Erro ao incluir tela:</b> Erro ao incluir o controller /{$getexe}.php!", WS_ERROR);
                    echo "</div>";
                endif;
                ?>
            </div><!-- /.content-wrapper -->
            <?php
            //Footer
            include(__DIR__ . DIRECTORY_SEPARATOR . 'system' . DIRECTORY_SEPARATOR . 'inc' . DIRECTORY_SEPARATOR . 'footer.inc.php');
            ?>
        </div><!-- ./wrapper -->

        <!-- jQuery 2.1.3 -->
        <script type="text/javascript" src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        <!-- InputMask -->
        <script type="text/javascript" src="plugins/input-mask/jquery.inputmask.js"></script>
        <script type="text/javascript" src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script type="text/javascript" src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
        <!-- Data Tables -->
        <script type="text/javascript" src="plugins/datatables/jquery.dataTables.js"></script>
        <script type="text/javascript" src="plugins/datatables/dataTables.bootstrap.js"></script>
        <!-- CKEditor-->
        <script type="text/javascript" src="plugins/ckeditor/ckeditor.js"></script>
        <!-- FastClick -->
        <script type="text/javascript" src='plugins/fastclick/fastclick.min.js'></script>
        <!-- Sparkline -->
        <script type="text/javascript" src="plugins/sparkline/jquery.sparkline.min.js"></script>
        <!-- jvectormap -->
        <script type="text/javascript" src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script type="text/javascript" src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <!-- daterangepicker -->
        <script type="text/javascript" src="plugins/daterangepicker/daterangepicker.js"></script>
        <!-- datepicker -->
        <script type="text/javascript" src="plugins/datepicker/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="plugins/datepicker/locales/bootstrap-datepicker.pt-BR.js"></script>
        <!-- iCheck -->
        <script type="text/javascript" src="plugins/iCheck/icheck.min.js"></script>
        <!-- SlimScroll 1.3.0 -->
        <script type="text/javascript" src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- ChartJS 1.0.1 -->
        <script type="text/javascript" src="plugins/chartjs/Chart.min.js"></script>
        <!-- AdminLTE App -->
        <script type="text/javascript" src="dist/js/app.min.js"></script>
        <!-- Page script -->
        <script type="text/javascript" src="plugins/custom.js"></script>
    </body>
</html>
<?php
ob_end_flush();
