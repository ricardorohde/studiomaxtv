<?php
$Now = date('Y-m-d');
$Read = new Read;
$Read->ExeRead("cotacao", "WHERE atualizado >= :date LIMIT :limit", "date={$Now}&limit=1");
if (!$Read->getResult()):
    $Dolar = new Cotacao('dolar');
    if ($Dolar->getResult()):
        $Euro = clone($Dolar);
        $Euro->setTipo('euro');

        $Dolar->getCotacao();
        $Euro->getCotacao();
    endif;
endif;