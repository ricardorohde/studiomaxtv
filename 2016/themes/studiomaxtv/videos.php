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
    <section class="wrapper-busca">
        <div class="busca-tit">Buscar</div>
        <div class="busca-form">
            <form action="">
                <input type="text" name="s" class="busca-input" placeholder="Digite o que deseja buscar. Ex. Tribuna Livre...">
                <button type="submit" name="searchSubmit" class="busca-btn"><span class="fa fa-search fa-2x"></span> Buscar</button>
            </form>
        </div>
    </section>
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

        <div class="wrapper-category">
            <div class="vin vin-blue">
                <span class="vin-title">Política</span>
                <a href="#" class="vin-btn btn-blue">VER MAIS</a>
            </div>
            <div class="video-group">
                <?php
                $Videos = $ReadVideo;
                $Videos->ExeRead('videos', "WHERE titulo != :tit AND categoria = :cat ORDER BY data DESC LIMIT :limit", "tit=''&cat=politica&limit=5");
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

        <div class="wrapper-category">
            <div class="vin vin-red">
                <span class="vin-title">Policía</span>
                <a href="#" class="vin-btn btn-red">VER MAIS</a>
            </div>
            <div class="video-group">
               <?php
                $Videos->setPlaces("tit=''&cat=policia&limit=5");                
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

        <div class="wrapper-category">
            <div class="vin vin-orange">
                <span class="vin-title">Saúde</span>
                <a href="#" class="vin-btn btn-orange">VER MAIS</a>
            </div>
            <div class="video-group">
                <?php
                $Videos->setPlaces("tit=''&cat=saude&limit=5");
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