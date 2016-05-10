<?php
if ($Link->getData()):
    extract($Link->getData());
else:
    header('Location: ' . HOME . DIRECTORY_SEPARATOR . '404');
endif;
?>
<div class="content">
    <div class="main_left">
        <div class="main_content">
            <header class="header_content">
                <h1 class="header_title"><i class="fa fa-newspaper-o"></i> POSTS de <?= $nome; ?></h1>
                <p class="header_tagline">Veja todos os posts do colunista </p>
                <span class="header_line"></span>
            </header>
            <article class="content_pag">
                <?php
                $getPage = (!empty($Link->getlocal()[2]) ? $Link->getlocal()[2] : 1);
                $Pager = new Pager(HOME . "/colunista/{$url_name}/");
                $Pager->ExePager($getPage, 10);

                $ReadNewsAll = new Read;
                $ReadNewsAll->ExeRead('noticias n, noticias_categoria nc', "WHERE titulo != :titulo AND n.categoria = nc.cat_url AND n.coluna = :coluna AND n.colunista = :colunista ORDER BY n.data DESC LIMIT :limit OFFSET :offset", "titulo=''&coluna=sim&colunista={$id}&limit={$Pager->getLimit()}&offset={$Pager->getOffset()}");

                if (!$ReadNewsAll->getResult()):
                    WSErro('Desculpe, ainda não há nenhuma <b>NOTICIA</b> cadastrada!', WS_INFOR);
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
                    $Pager->ExePaginator('noticias', "WHERE titulo != :t AND colunista = :colunista ORDER BY data DESC", "t=''&colunista={$id}");
                    echo $Pager->getPaginator();
                    echo '</nav>';
                endif;
                ?>
            </article>
        </div>
    </div>
    <?php require(REQUIRE_PATH . '/inc/sidebar.inc.php'); ?>
</div>
