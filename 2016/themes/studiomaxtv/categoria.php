<?php
if ($Link->getData()):
    extract($Link->getData());
    $View = new View;
else:
    header('Location: ' . HOME . DIRECTORY_SEPARATOR . '404');
endif;
?>
<div class="content">
    <section class="wrapper-filter">
        <div class="vin vin-gray">
            <span class="vin-title">Filtrar</span>
        </div>
        <ul>
            <?php
            $getPage = (!empty($Link->getLocal()[2]) ? $Link->getLocal()[2] : 1);
            $Pager = new Pager(HOME . '/categoria/' . $categoria . '/');
            $Pager->ExePager($getPage, 25);

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
        <div class="vin vin-<?= $color; ?>">
            <span class="vin-title"><?= mb_strtoupper($categoria, 'UTF-8'); ?></span>
        </div>
        <div class="video-group">
            <?php
            $Videos = $ReadVideo;
            $Videos->ExeRead('videos', "WHERE titulo != :tit AND categoria = :cat ORDER BY data DESC LIMIT :limit", "tit=''&cat={$url_name}&limit=5");
            if ($Videos->getResult()):
                $tpl_videos = $View->Load('videos');
                foreach ($Videos->getResult() as $v):
                    $v['titulo'] = Check::Words($v['titulo'], 7);
                    $View->Show($v, $tpl_videos);
                endforeach;
            else:
                WSErro("<span class='fa fa-exclamation-triangle'></span> Desculpe, ainda estamos cadastrando videos para esta categoria.. :)", WS_ALERT);
            endif;
            ?>
        </div>
    </div>
</section>
</div>