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
                <span class="vin-title">Todos os Videos</span>                
            </div>
            <div class="video-group">
                <?php
                $getPage = (!empty($Link->getlocal()[1]) ? $Link->getlocal()[1] : 1);
                $Pager = new Pager(HOME . '/videos/');
                $Pager->ExePager($getPage, 50);

                $lastVideos = $ReadVideo;
                $lastVideos->ExeRead('videos', "WHERE titulo != :tit AND categoria != :cat ORDER BY id DESC LIMIT :limit OFFSET :offset", "tit=''&cat=ao-vivo&limit={$Pager->getLimit()}&offset={$Pager->getOffset()}");
                if (!$lastVideos->getResult()):
                    WSErro("<span class='fa fa-exclamation-triangle'></span> Desculpe, ainda estamos cadastrando videos para esta categoria.. :)", WS_ALERT);
                else:
                    $tpl_lastVideos = $View->Load('videos');

                    foreach ($lastVideos->getResult() as $last):
                        $last['titulo'] = Check::Words($last['titulo'], 7);
                        if (file_exists('uploads/' . $last['foto'])):
                            $last['foto'] = HOME . '/uploads/' . $last['foto'];
                        endif;
                        $View->Show($last, $tpl_lastVideos);
                    endforeach;

                    echo '<nav>';
                    $Pager->ExePaginator('videos', "WHERE titulo != :tit AND categoria != :cat", "tit=''&cat=ao-vivo");
                    echo $Pager->getPaginator();
                    echo '</nav>';
                endif;
                ?>
            </div>
        </div>
    </section>
</div>