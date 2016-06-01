<div class="content">
    <section class="wrapper-filter">
        <div class="vin vin-gray">
            <span class="vin-title">Filtrar</span>
        </div>
        <?php require(REQUIRE_PATH . '/inc/filtro-categoria.inc.php'); ?>
    </section>
    <?php require(REQUIRE_PATH . '/inc/busca.inc.php'); ?>
    <section class="wrapper-videos">
        <div class="wrapper-category">
            <div class="vin vin-green">
                <span class="vin-title">Últimos</span>
                <span class="vin-btn btn-green">VER MAIS</span>
            </div>
            <div class="video-group">
                <?php
                $lastVideos = $ReadVideo;
                $lastVideos->ExeRead('videos', "WHERE titulo != :tit ORDER BY data DESC LIMIT :limit", "tit=''&limit=5");
                if ($lastVideos->getResult()):
                    $tpl_lastVideos = $View->Load('videos');

                    foreach ($lastVideos->getResult() as $last):
                        $last['titulo'] = Check::Words($last['titulo'], 7);
                        $View->Show($last, $tpl_lastVideos);
                    endforeach;
                else:
                    WSErro("<span class='fa fa-exclamation-triangle'></span> Desculpe, ainda estamos cadastrando videos para esta categoria.. :)", WS_ALERT);
                endif;
                ?>
            </div>
        </div>
        <?php
        $Categories = new Read;
        $Categories->ExeRead('videos_categoria', "ORDER BY categoria ASC");
        if ($Categories->getResult()):
            foreach ($Categories->getResult() as $Cats):
                ?>
                <div class="wrapper-category">
                    <div class="vin vin-<?= $Cats['color']; ?>">
                        <span class="vin-title"><?= $Cats['categoria']; ?></span>
                        <a href="<?= HOME . '/categoria/' . $Cats['url_name']; ?>" class="vin-btn btn-<?= $Cats['color']; ?>">VER MAIS</a>
                    </div>
                    <div class="video-group">
                        <?php
                        $Videos = $ReadVideo;
                        $Videos->ExeRead('videos', "WHERE titulo != :tit AND categoria = :cat ORDER BY data DESC LIMIT :limit", "tit=''&cat={$Cats['url_name']}&limit=5");
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
                <?php
            endforeach;
        endif;
        ?>
    </section>
</div>