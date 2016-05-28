<?php
$View = new View;
$ReadMain = new Read;
$banners = $ReadMain;
$banners->ExeRead("banners", "WHERE tipo = :idtipo AND data_inicial <= CURRENT_DATE() AND data_final >= CURRENT_DATE() ORDER BY RAND()", "idtipo=1");
if ($banners->getResult()):
    ?>
    <section class="wrapper-slide">
        <div class="flexslider">
            <ul class="slides">
                <?php
                foreach ($banners->getResult() as $bnr):
                    echo "<li>";
                    echo "<a href=\"{$bnr['link']}\" title=\"{$bnr['titulo']}\" target=\"_blank\">";
                    echo "<img alt=\"{$bnr['titulo']}\" title=\"{$bnr['titulo']}\" src=\"" . HOME . "/tim.php?src=" . HOME . "/uploads/{$bnr['banner']}&w=1920&h=480&zc=0\" class=\"banner\" />";
                    echo "</a>";
                    echo "</li>";
                endforeach;
                ?>
            </ul>
        </div>
    </section>
    <?php
endif;
?>
<div class="content">
    <section class="wrapper-player">
        <div class="player-box"><img src="<?= INCLUDE_PATH; ?>/images/EXE_player.jpg" alt="PLAYER"></div>
        <div class="player-dados">
            <div class="player-status"> <span class="fa fa-circle live"></span> AO VIVO</div>
            <div class="player-status"> <span class="fa fa-circle rec"></span> REC</div>
            <div class="player-tit">TITULO DO VIDEO EM EXECUÇÃO</div>
            <div class="player-desc">Descrição sobre o video em execução, trazendo informações sobre o que o usário irá assistir.</div>
        </div>
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
                <a href="<?= HOME.'/categoria/ultimos';?>" title="Últimos" class="vin-btn btn-green">VER MAIS</a>
            </div>
            <div class="video-group">
                <?php
                $lastVideos = $ReadMain;
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
                <a href="<?= HOME.'/categoria/politica';?>" title="Política" class="vin-btn btn-blue">VER MAIS</a>
            </div>
            <div class="video-group">
                <?php
                $Videos = $ReadMain;
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
                <a href="<?= HOME.'/categoria/policia';?>" title="Policía" class="vin-btn btn-red">VER MAIS</a>
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
                <a href="<?= HOME.'/categoria/saude';?>" title="Saúde" class="vin-btn btn-orange">VER MAIS</a>
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
    <section class="wrapper-newsletter">
        <div class="vin vin-purple">
            <span class="vin-title">Newsletter</span>
        </div>
        <div class="newsletter-form">
            <form action="">
                <div class="newsletter-input">
                    <label for="news_nome">NOME</label>
                    <input type="text" id="news_nome" name="nome" placeholder="Digite seu nome">
                </div>
                <div class="newsletter-input">
                    <label for="news_email">E-MAIL</label>
                    <input type="text" id="news_email" name="email" placeholder="Digite seu e-mail">
                </div>
                <button type="submit" class="newsletter-btn btn-purple"> <span class="fa fa-send"></span> Cadastrar</button>
            </form>
        </div>
    </section>
</div>