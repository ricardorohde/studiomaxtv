<?php
$busca = $Link->getLocal()[1];
$count = ($Link->getData()['count'] ? $Link->getData()['count'] : '0');
?>
<div class="content">
    <section class="wrapper-filter">
        <div class="vin vin-gray">
            <span class="vin-title">Filtrar</span>
        </div>
        <ul>
            <?php
            $View = new View;
            $ReadVideo = new Read;
            $Categories = $ReadVideo;
            $Categories->ExeRead('videos_categoria', "WHERE categoria != :cat AND url_name != :url ORDER BY categoria ASC", "cat=''&url=''");
            if ($Categories->getResult()):
                foreach ($Categories->getResult() as $Cat):
                    echo '<li><a href="' . HOME . '/categoria/' . $Cat['url_name'] . '" class="txt-categories">' . mb_strtoupper($Cat['categoria'], 'UTF-8') . '</a></li>';
                endforeach;
            endif;
            ?>
        </ul>
    </section>
    <?php require(REQUIRE_PATH . '/inc/busca.inc.php'); ?>
    <div class="wrapper-category">
        <div class="vin vin-gray">
            <span class="vin-title vin-search">
                Busca por: <?= $busca; ?> <br>
                Sua busca retornou <?= $count; ?> resultados!
            </span>
        </div>
        <div class="video-group">
            <?php
            $getPage = (!empty($Link->getLocal()[2]) ? $Link->getLocal()[2] : 1);
            $Pager = new Pager(HOME . '/busca/' . $busca . '/');
            $Pager->ExePager($getPage, 25);

            $lastVideos = $ReadVideo;
            $lastVideos->ExeRead('videos', "WHERE (titulo LIKE '%' :link '%') ORDER BY data DESC LIMIT :limit OFFSET :offset", "link={$busca}&limit={$Pager->getLimit()}&offset={$Pager->getOffset()}");
            if ($lastVideos->getResult()):
                $tpl_lastVideos = $View->Load('videos');

                foreach ($lastVideos->getResult() as $last):
                    $last['titulo'] = Check::Words($last['titulo'], 7);
                    $View->Show($last, $tpl_lastVideos);
                endforeach;
            else:
                WSErro("<span class='fa fa-exclamation-triangle'></span> Desculpe, sua pesquisa não retornou resultados. Você pode resumir sua pesquisa, ou tentar outros termos!", WS_ALERT);
            endif;
            ?>
        </div>
    </div>

</section>
</div>