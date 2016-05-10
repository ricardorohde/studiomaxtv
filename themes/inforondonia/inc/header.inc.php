<header class="main_header">
    <div class="content">
        <div class="box_header_logords">
            <a href="<?= HOME; ?>" title="<?= SITENAME; ?> - Informação é a nossa prioridade!"><h1 class="main_header_logo"><?= SITENAME; ?> - Informação é a nossa prioridade!</h1></a>
            <div class="main_header_rds">
                <a href="http://www.facebook.com/inforondonia" title="<?= SITENAME; ?> no Facebook" class="rds_facebook" target="_blank"><i class="fa fa-facebook-square fa-2x"></i></a>
                <a href="https://twitter.com/inforondonia" title="<?= SITENAME; ?> no Twitter" class="rds_twitter" target="_blank"><i class="fa fa-twitter-square fa-2x"></i></a>
                <a href="#" title="<?= SITENAME; ?> no Google+" class="rds_googleplus"><i class="fa fa-google-plus-square fa-2x" target="_blank"></i></a>
            </div>
        </div>
        <div class="box_header_banners">
            <?php
            $banners = new Read;
            //Banner Topo 1
            $banners->ExeRead("banners", "WHERE tipo = :idtipo ORDER BY rand()", "idtipo=2");
            if ($banners->getResult()):
                ?>
                <div class=" main_header_banner cycle-slideshow" data-cycle-timeout="5000" data-cycle-slides="> a">
                    <?php
                    foreach ($banners->getResult() as $bnr):
                        echo "<a href=\"{$bnr['link']}\" title=\"{$bnr['titulo']}\" target=\"_blank\">";
                        echo "<img alt=\"{$bnr['titulo']}\" title=\"{$bnr['titulo']}\" src=" . HOME . "/tim.php?src=" . HOME . "/uploads/{$bnr['banner']}&w=745&h=95&zc=0\" class=\"banner\" />";
                        echo "</a>";
                    endforeach;
                    ?>
                </div>
                <?php
            endif;
            //Banner Topo 2
            $banners->setPlaces("idtipo=3");
            if ($banners->getResult()):
                ?>
                <div class="main_header_banner cycle-slideshow" data-cycle-timeout="5000" data-cycle-slides="> a">
                    <?php
                    foreach ($banners->getResult() as $bnr):
                        echo "<a href=\"{$bnr['link']}\" title=\"{$bnr['titulo']}\" target=\"_blank\">";
                        echo "<img alt=\"{$bnr['titulo']}\" title=\"{$bnr['titulo']}\" src=" . HOME . "/tim.php?src=" . HOME . "/uploads/{$bnr['banner']}&w=745&h=95&zc=0\" class=\"banner\" />";
                        echo "</a>";
                    endforeach;
                    ?>
                </div>
                <?php
            endif;
            ?>
        </div>
    </div>

    <div class="content">
        <nav class="main_header_menu">
            <div class="main_header_grpmenu">
                <a class="mobmenu" href="#" title="Mobile Nav"><i class="fa fa-bars"></i> MENU</a>
                <ul>
                    <li><a href="<?= HOME; ?>">INICIO</a></li>
                    <li><a href="<?= HOME . '/noticias'; ?>">NOTÍCIAS</a></li>
                    <li><a href="<?= HOME . '/colunistas'; ?>">COLUNISTAS</a></li>
                    <li><a href="<?= HOME . '/tv-inforondonia'; ?>">TV <?= SITENAME; ?></a></li>
                    <li><a href="<?= HOME . '/eventos'; ?>">EVENTOS</a></li>
                    <li><a href="<?= HOME . '/videos'; ?>">VíDEOS</a></li>
                    <li><a href="<?= HOME . '/midia-kit'; ?>">MÍDIA KIT</a></li>
                    <li><a href="<?= HOME . '/denuncia'; ?>">DENÚNCIA</a></li>
                    <li><a href="<?= HOME . '/quem-somos'; ?>">QUEM SOMOS</a></li>
                </ul>
            </div>
            <div class="main_header_busca">
                <?php
                $search = filter_input(INPUT_POST, 's', FILTER_DEFAULT);
                if (!empty($search)):
                    $search = strip_tags(trim(urlencode($search)));
                    header('Location: ' . HOME . '/busca/' . $search);
                endif;
                ?>
                <form name="busca" action="" method="post">
                    <input type="search" name="s" class="busca_input" placeholder="Digite sua busca...">
                    <button type="submit" name="sendsearch" class="busca_btn"><i class="fa fa-search fa-2x"></i></button>
                </form>
            </div>
        </nav>
    </div>
</header>