<div class="content">
    <div class="main_left">
        <div class="main_content">
            <header class="header_content">
                <h1 class="header_title"><i class="fa fa-television"></i> TV <?= SITENAME; ?> </h1>
                <p class="header_tagline">Assista a TV <?= SITENAME; ?></p>
                <span class="header_line"></span>
            </header>
            <article class="content_pag">
                <?php
                //TV Lateral
                $ReadTv = new Read;
                $ReadTv->ExeRead("tv", "WHERE url != :url AND tv = :tv", "url=''&tv=true");
                if ($ReadTv->getResult()):
                    $Tv = $ReadTv->getResult()[0];
                    ?>
                    <div class="play_tv">    
                        <div class="ratio16">
                            <iframe class="ratio_element" src="<?= $Tv['url']; ?>" width="100%" frameborder="0" scrolling="no" allowfullscreen="" webkitallowfullscreen="" mozallowfullscreen="" oallowfullscreen="" msallowfullscreen=""></iframe>
                        </div>
                    </div>
                    <?php
                endif;
                ?>
            </article>
        </div>
    </div>
    <?php require(REQUIRE_PATH . '/inc/sidebar.inc.php'); ?>
</div>
