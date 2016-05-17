<?php
if ($Link->getData()):
    extract($Link->getData());
    $data = date('d/m/Y', strtotime($data));
else:
    header('Location: ' . HOME . DIRECTORY_SEPARATOR . '404');
endif;
?>
<div class="content">
    <div class="main_left">
        <div class="main_content">
            <header class="header_content">
                <h1 class="header_title"><i class="fa fa-camera"></i> <?= $evento; ?> </h1>
                <p class="header_subtitle"><i class="fa fa-calendar"></i>  <?= $data; ?> - <i class="fa fa-map-marker"></i> <?= $local; ?> - <i class="fa fa-globe"></i> <?= $cidadeuf; ?></p>
                <span class="header_line"></span>
                <div class="header_social">
                    <a href="https://www.facebook.com/sharer/sharer.php?u=<?= HOME . '/evento/' . $url_name; ?>" title="Compartilhar no Facebook" class="rds_facebook" target="_blank"><i class="fa fa-facebook-square fa-2x"></i></a>
                    <a href="https://twitter.com/home?status=<?= HOME . '/evento/' . $url_name; ?>" title="Compartilhar no Twitter" class="rds_twitter" target="_blank"><i class="fa fa-twitter-square fa-2x"></i></a>
                    <a href="https://plus.google.com/share?url=<?= HOME . '/evento/' . $url_name; ?>" title="Compartilhar no Google+" class="rds_googleplus" target="_blank"><i class="fa fa-google-plus-square fa-2x"></i></a>
                    <a href="whatsapp://send?text=<?= $evento . ' ' . HOME . '/evento/' . $url_name; ?>" title="Compartilhar no Whatsapp" class="rds_whatsapp"><i class="fa fa-whatsapp fa-2x"></i></a>
                </div>
            </header>
            <article class="content_pag">
                <?php
                $getPage = (!empty($Link->getLocal()[2]) ? $Link->getLocal()[2] : 1);
                $Pager = new Pager(HOME . '/evento/' . $url_name . '/');
                $Pager->ExePager($getPage, 10);

                $FotosGal = new Read;
                $FotosGal->ExeRead("banco_fotos", "WHERE id_tipo = :idtipo AND tipo = 'E' ORDER BY id ASC LIMIT :limit OFFSET :offset", "idtipo={$id}&limit={$Pager->getLimit()}&offset={$Pager->getOffset()}");
                if (!$FotosGal->getResult()):
                    WSErro('Desculpe, ainda não há nenhuma <br><b>FOTO PARA ESTA GALARIA</b>!', WS_INFOR);
                else:
                    foreach ($FotosGal->getResult() as $fotos):
                        echo '<div class="boxfotos">';
                        echo '<img alt="' . $evento . '" title="' . $evento . '" src="' . HOME . '/tim.php?src=' . HOME . '/uploads/' . $fotos['foto'] . '&w=870"/>';
                        echo '</div>';
                    endforeach;
                endif;

                echo '<nav style="margin-left:15px;">';
                $Pager->ExePaginator("banco_fotos", "WHERE id_tipo = :idtipo AND tipo = 'E' ORDER BY id ASC", "idtipo={$id}");
                echo $Pager->getPaginator();
                echo '</nav>';
                ?>
            </article>
        </div>
    </div>
    <?php require(REQUIRE_PATH . '/inc/sidebar.inc.php'); ?>
</div>
