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
        <?php
        $Player = new Read;
        $Player->ExeRead("videos", "WHERE destaque = :dest ORDER BY id DESC LIMIT :limit", "dest=sim&limit=1");
        $regPlayer = $Player->getResult()[0];
        ?>
        <div class="player-box">
            <div class="ratio16">
                <iframe class="ratio_element" width="100%" src="<?= $regPlayer['tipo'] === 'video' ? 'https://www.youtube.com/embed/' . $regPlayer['link'] . '?rel=0&amp;showinfo=0&autoplay=true' : $regPlayer['iframe'] ?>" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>
        <div class="player-dados">
            <?php if ($regPlayer['transmissao'] === 'ao-vivo'): ?>
                <div class="player-status"> <span class="fa fa-circle live"></span> AO VIVO</div>
            <?php else: ?>
                <div class="player-status"> <span class="fa fa-circle rec"></span> REC</div>
            <?php endif; ?>
            <div class="player-tit"><?= $regPlayer['titulo']; ?></div>
            <div class="player-desc"><?= $regPlayer['descricao']; ?></div>
        </div>

    </section>
    <?php require(REQUIRE_PATH . '/inc/busca.inc.php'); ?>
    <section class="wrapper-videos">
        <div class="wrapper-category">
            <div class="vin vin-green">
                <span class="vin-title">Últimos</span>
                <a href="<?= HOME . '/categoria/ultimos'; ?>" title="Últimos" class="vin-btn btn-green">VER MAIS</a>
            </div>
            <div class="video-group">
                <?php
                $lastVideos = $ReadMain;
                $lastVideos->ExeRead('videos', "WHERE titulo != :tit AND destaque = :dest ORDER BY id DESC LIMIT :limit", "tit=''&dest=nao&limit=5");
                if ($lastVideos->getResult()):
                    $tpl_lastVideos = $View->Load('videos');

                    foreach ($lastVideos->getResult() as $last):
                        $last['titulo'] = Check::Words($last['titulo'], 7);
                        if (file_exists('uploads/' . $last['foto'])):
                            $last['foto'] = HOME . '/uploads/' . $last['foto'];
                        endif;
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
                <a href="<?= HOME . '/categoria/politica'; ?>" title="Política" class="vin-btn btn-blue">VER MAIS</a>
            </div>
            <div class="video-group">
                <?php
                $Videos = $ReadMain;
                $Videos->ExeRead('videos', "WHERE titulo != :tit AND destaque = :dest AND categoria = :cat ORDER BY id DESC LIMIT :limit", "tit=''&dest=nao&cat=politica&limit=5");
                if ($Videos->getResult()):
                    $tpl_videos = $View->Load('videos');

                    foreach ($Videos->getResult() as $v):
                        $v['titulo'] = Check::Words($v['titulo'], 7);
                        if (file_exists('uploads/' . $v['foto'])):
                            $v['foto'] = HOME . '/uploads/' . $v['foto'];
                        endif;
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
                <a href="<?= HOME . '/categoria/policia'; ?>" title="Policía" class="vin-btn btn-red">VER MAIS</a>
            </div>
            <div class="video-group">
                <?php
                $Videos->setPlaces("tit=''&dest=nao&cat=policia&limit=5");
                if ($Videos->getResult()):
                    $tpl_videos = $View->Load('videos');

                    foreach ($Videos->getResult() as $v):
                        $v['titulo'] = Check::Words($v['titulo'], 7);
                        if (file_exists('uploads/' . $v['foto'])):
                            $v['foto'] = HOME . '/uploads/' . $v['foto'];
                        endif;
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
                <a href="<?= HOME . '/categoria/saude'; ?>" title="Saúde" class="vin-btn btn-orange">VER MAIS</a>
            </div>
            <div class="video-group">
                <?php
                $Videos->setPlaces("tit=''&dest=nao&cat=saude&limit=5");
                if ($Videos->getResult()):
                    $tpl_videos = $View->Load('videos');

                    foreach ($Videos->getResult() as $v):
                        $v['titulo'] = Check::Words($v['titulo'], 7);
                        if (file_exists('uploads/' . $v['foto'])):
                            $v['foto'] = HOME . '/uploads/' . $v['foto'];
                        endif;
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
            <div class="alert alert-success text-center"><span class="fa fa-check-circle"></span> Cadastro realizado com sucesso, acesse seu e-mail e confirme sua assinatura!</div>

            <div class="alert alert-danger text-center"><span class="fa fa-exclamation-circle"></span> Ocorreu um erro ao tentar efetuar o cadastro!</div>

            <div class="alert alert-danger text-center"><span class="fa fa-exclamation-circle"></span> Não foi possivel efetuar o cadastro! Já existe um cadastro com esse e-mail.</div>

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