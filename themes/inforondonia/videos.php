<div class="content">
    <div class="main_left">
        <div class="main_content">
            <header class="header_content">
                <h1 class="header_title"><i class="fa fa-play-circle"></i> VIDEOS </h1>
                <p class="header_tagline">Galeria de Videos</p>
                <span class="header_line"></span>
            </header>
            <article class="content_pag">
                <?php
                $getPage = (!empty($Link->getlocal()[1]) ? $Link->getlocal()[1] : 1);
                $Pager = new Pager(HOME . '/videos/');
                $Pager->ExePager($getPage, 12);

                $videos = new Read;
                $videos->ExeRead('videos', "WHERE titulo != :t ORDER BY data DESC LIMIT :limit OFFSET :offset", "t=''&limit={$Pager->getLimit()}&offset={$Pager->getOffset()}");
                if (!$videos->getResult()):
                    WSErro('Desculpe, ainda não há nenhum <br><b>VIDEO</b> cadastrado!', WS_INFOR);
                else:
                    $View = new View;
                    $tpl_videos = $View->Load('videos');

                    foreach ($videos->getResult() as $v):
                        $v['titulo'] = Check::Words($v['titulo'], 7);
                        $View->Show($v, $tpl_videos);
                    endforeach;

                    echo '<nav>';
                    $Pager->ExePaginator('videos', "WHERE titulo != :t ORDER BY id DESC", "t=''");
                    echo $Pager->getPaginator();
                    echo '</nav>';
                endif;
                ?>
            </article>
        </div>
    </div>
    <?php require(REQUIRE_PATH . '/inc/sidebar.inc.php'); ?>
</div>
