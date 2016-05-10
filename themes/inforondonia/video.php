<?php
if ($Link->getData()):
    extract($Link->getData());
    $View = new View;
    $tpl_videos = $View->Load('videos');
else:
    header('Location: ' . HOME . DIRECTORY_SEPARATOR . '404');
endif;
?>
<div class="content">
    <div class="main_left">
        <div class="main_content">
            <header class="header_content">
                <h1 class="header_title"><i class="fa fa-play-circle"></i> <?= $titulo; ?> </h1>
                <span class="header_line"></span>
                <div class="header_social">
                    <a href="https://www.facebook.com/sharer/sharer.php?u=<?= HOME . '/video/' . $url_name; ?>" title="Compartilhar no Facebook" class="rds_facebook" target="_blank"><i class="fa fa-facebook-square fa-2x"></i></a>
                    <a href="https://twitter.com/home?status=<?= HOME . '/video/' . $url_name; ?>" title="Compartilhar no Twitter" class="rds_twitter" target="_blank"><i class="fa fa-twitter-square fa-2x"></i></a>
                    <a href="https://plus.google.com/share?url=<?= HOME . '/video/' . $url_name; ?>" title="Compartilhar no Google+" class="rds_googleplus" target="_blank"><i class="fa fa-google-plus-square fa-2x"></i></a>
                    <a href="whatsapp://send?text=<?= $titulo . ' ' . HOME . '/video/' . $url_name; ?>" title="Compartilhar no Whatsapp" class="rds_whatsapp"><i class="fa fa-whatsapp fa-2x"></i></a>
                </div>
            </header>
            <article class="content_pag">
                <div class="frameBox">
                    <div class="ratio16">
                        <iframe class="ratio_element" width="100%" src="https://www.youtube.com/embed/<?= $link; ?>?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
                    </div>
                    <p><b>Autor:</b> <?= $autor; ?></p>
                    <p><b>Postado em:</b> <?= date('d/m/Y H:i', strtotime($data)); ?>Hs</p>
                </div>
            </article>
        </div>
    </div>
    <?php require(REQUIRE_PATH . '/inc/sidebar.inc.php'); ?>
</div>
