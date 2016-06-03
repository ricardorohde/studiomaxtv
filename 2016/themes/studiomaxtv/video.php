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
    <div class="wrapper-video">
        <div class="vin vin-gray">
            <span class="vin-title vin-search">
                <i class="fa fa-play-circle"></i> <?= $titulo; ?>
            </span>
        </div>

        <article class="video-content">
            <div class="video-frame">
                <div class="ratio16">
                    <iframe class="ratio_element" width="100%" src="https://www.youtube.com/embed/<?= $link; ?>?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
            <div class="video-dados">
                <p><b>Autor:</b> <?= $autor; ?></p>
                <p><b>Postado em:</b> <?= date('d/m/Y H:i', strtotime($data)); ?>Hs</p>
                <p><b>Descrição:</b> <?= $descricao; ?></p>
            </div>
        </article>

        <div class="video-content">
            <?php
            $Cat = new Read;
            $Cat->ExeRead('videos_categoria', "WHERE url_name = :cat", "cat={$categoria}");
            $Categ = $Cat->getResult()[0];
            ?>
            <div class="vin vin-<?= $Categ['color']; ?>">
                <span class="vin-title"><?= mb_strtoupper($Categ['categoria'], 'UTF-8'); ?></span>
            </div>
            <div class="video-group">
                <?php
                $Videos = new Read;
                $Videos->ExeRead('videos', "WHERE titulo != :tit AND categoria = :cat AND id != :id ORDER BY data DESC LIMIT :limit", "tit=''&cat={$categoria}&id={$id}&limit=5");
                if ($Videos->getResult()):
                    $tpl_videos = $View->Load('videos');
                    foreach ($Videos->getResult() as $v):
                        $v['titulo'] = Check::Words($v['titulo'], 7);
                        $View->Show($v, $tpl_videos);
                    endforeach;
                else:
                    WSErro("<span class='fa fa-exclamation-triangle'></span> Desculpe, não encontramos mais videos para a categoria <b>" . mb_strtoupper($Categ['categoria'], 'UTF-8') . "</b>", WS_ALERT);
                endif;
                ?>

            </div>
        </div>
    </div>
</div>