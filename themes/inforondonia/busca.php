<?php
if ($Link->getLocal()[1]):
    $search = $Link->getLocal()[1];
    $count = ($Link->getData()['count'] ? $Link->getData()['count'] : '0');
else:
    header('Location: ' . HOME);
endif;
?>
<div class="content">
    <div class="main_left">
        <div class="main_content">
            <header class="header_content">
                <h1 class="header_title"><i class="fa fa-search"></i> Pesquisa por: <?= $search; ?> </h1>
                <p class="header_tagline">Sua pesquisa por <b><?= $search; ?></b> retornou <?= $count; ?> resultados!</p>
                <span class="header_line"></span>
            </header>
            <article class="content_pag">
                <span class="fa fa-television"></span><?php
                $getPage = (!empty($Link->getLocal()[2]) ? $Link->getLocal()[2] : 1);
                $Pager = new Pager(HOME . '/busca/' . $search . '/');
                $Pager->ExePager($getPage, 10);

                $ReadNewsAll = new Read;
                $ReadNewsAll->ExeRead('noticias', "WHERE titulo != :titulo AND (titulo LIKE '%' :link '%' OR noticia LIKE '%' :link '%') ORDER BY id DESC LIMIT :limit OFFSET :offset", "titulo=''&link={$search}&limit={$Pager->getLimit()}&offset={$Pager->getOffset()}");

                if (!$ReadNewsAll->getResult()):
                    WSErro('Desculpe, sua pesquisa não retornou resultados. Você pode resumir sua pesquisa, ou tentar outros termos!', WS_INFOR);
                else:
                    $View = new View;
                    $tpl_noticias = $View->Load('noticias');

                    foreach ($ReadNewsAll->getResult() as $n):
                        $n['titulo'] = Check::Words($n['titulo'], 16);
                        $n['noticia'] = Check::Words(strip_tags($n['noticia']), 36);
                        $n['data'] = date('d/m/Y H:i', strtotime($n['data']));
                        $n['hide'] = empty($n['foto']) ? 'hide' : '';
                        $n['full'] = empty($n['foto']) ? 'full' : '';
                        $View->Show($n, $tpl_noticias);
                    endforeach;

                    echo '<nav>';
                    $Pager->ExePaginator('noticias', "WHERE titulo != :t AND (titulo LIKE '%' :link '%' OR noticia LIKE '%' :link '%') ORDER BY id DESC", "t=''&link={$search}");
                    echo $Pager->getPaginator();
                    echo '</nav>';
                endif;
                ?>
            </article>
        </div>
    </div>
    <?php require(REQUIRE_PATH . '/inc/sidebar.inc.php'); ?>
</div>



