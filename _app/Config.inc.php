<?php

//CONFIGURAÇÕES NO PHP
setlocale(LC_TIME, 'portuguese');
date_default_timezone_set("America/Manaus");

// CONFIGURAÇÕES DO BANCO ####################
define('HOST', 'localhost');
define('USER', 'root');
define('PASS', '1234');
define('DBSA', '_inforondonia_2016');

// DEFINE SERVIDOR DE E-MAIL ################
define('MAILUSER', 'email@dominio.com.br');
define('MAILPASS', 'senhadoemail');
define('MAILPORT', 'postadeenvio');
define('MAILHOST', 'servidordeenvio');

// DEFINE IDENTIDADE DO SITE ################
define('SITENAME', 'INFORONDONIA');
define('SITEDESC', 'As principais notícias de Rondônia, Brasil e Mundo. Coberturas de Eventos e Videos você encontra aqui. INFORONDONIA - Informação é a nossa prioridade! ');
define('CIDADE', 'Rolim de Moura');
define('UF', 'RO');

// DEFINE A BASE DO SITE ####################
define('HOME', 'http://localhost/servidor/inforondonia/2016');
define('THEME', 'inforondonia');

define('INCLUDE_PATH', HOME . DIRECTORY_SEPARATOR . 'themes' . DIRECTORY_SEPARATOR . THEME);
define('REQUIRE_PATH', 'themes' . DIRECTORY_SEPARATOR . THEME);

// AUTO LOAD DE CLASSES ####################
function __autoload($Class) {
    $cDir = ['Conn', 'Helpers', 'Models'];
    $iDir = null;
    foreach ($cDir as $dirName):
        if (!$iDir && file_exists(__DIR__ . DIRECTORY_SEPARATOR . $dirName . DIRECTORY_SEPARATOR . $Class . '.class.php') && !is_dir(__DIR__ . DIRECTORY_SEPARATOR . $dirName . DIRECTORY_SEPARATOR . $Class . '.class.php')):
            include_once (__DIR__ . DIRECTORY_SEPARATOR . $dirName . DIRECTORY_SEPARATOR . $Class . '.class.php');
            $iDir = true;
        endif;
    endforeach;
    if (!$iDir):
        trigger_error("Não foi possível incluir {$Class}.class.php", E_USER_ERROR);
        die;
    endif;
}

// TRATAMENTO DE ERROS #####################
//CSS constantes :: Mensagens de Erro
define('WS_ACCEPT', 'success');
define('WS_INFOR', 'info');
define('WS_ALERT', 'warning');
define('WS_ERROR', 'danger');

//WSErro :: Exibe erros lançados :: Front
function WSErro($ErrMsg, $ErrNo, $ErrDie = null) {
    $CssClass = ($ErrNo == E_USER_NOTICE ? WS_INFOR : ($ErrNo == E_USER_WARNING ? WS_ALERT : ($ErrNo == E_USER_ERROR ? WS_ERROR : $ErrNo)));
    echo "<p class=\"alert alert-{$CssClass} text-center\">{$ErrMsg}</p>";

    if ($ErrDie):
        die;
    endif;
}

//PHPErro :: personaliza o gatilho do PHP
function PHPErro($ErrNo, $ErrMsg, $ErrFile, $ErrLine) {
    $CssClass = ($ErrNo == E_USER_NOTICE ? WS_INFOR : ($ErrNo == E_USER_WARNING ? WS_ALERT : ($ErrNo == E_USER_ERROR ? WS_ERROR : $ErrNo)));
    echo "<p class=\"alert alert-{$CssClass} \">";
    echo "<b>Erro na Linha: #{$ErrLine} ::</b> {$ErrMsg}<br>";
    echo "<small>{$ErrFile}</small>";
    echo "</p>";
    if ($ErrNo == E_USER_ERROR):
        die;
    endif;
}

set_error_handler('PHPErro');
