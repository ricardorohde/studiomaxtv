<ul>
    <?php
    $checkCat = isset($Link->getLocal()[1]) ? $Link->getLocal()[1] : null;

    $View = new View;
    $ReadVideo = new Read;
    $Categories = $ReadVideo;
    $Categories->ExeRead('videos_categoria', "WHERE categoria != :cat AND url_name != :url ORDER BY categoria ASC", "cat=''&url=''");
    if ($Categories->getResult()):
        foreach ($Categories->getResult() as $Cat):
            $activeCat = $checkCat === $Cat['url_name'] ? 'active' : '';
            echo '<li><a href="' . HOME . '/categoria/' . $Cat['url_name'] . '" class="txt-categories '.$activeCat.'">' . mb_strtoupper($Cat['categoria'], 'UTF-8') . '</a></li>';
        endforeach;
    endif;
    ?>
</ul>