<header class="main-header">
    <div class="content">
        <a href="<?= HOME; ?>" title="<?= SITENAME; ?>"><h1 class="main-header-logo"><?= SITENAME; ?></h1></a>
        <nav class="main-header-menu">
            <?php
            $checkLocal = $Link->getLocal()[0];
            ?>
            <a class="mobmenu" href="#" title="Mobile Nav"><i class="fa fa-bars"></i> MENU</a>
            <ul>    
                <li><a href="<?= HOME; ?>" <?= $checkLocal === 'index' ? 'class="active"' : ''; ?>>HOME</a></li>
                <li><a href="<?= HOME . '/videos'; ?>" <?= $checkLocal === 'videos' ? 'class="active"' : ($checkLocal === 'categoria' ? 'class="active"' : ($checkLocal === 'busca' ?  'class="active"' : '')); ?>>VIDEOS</a></li>
                <li><a href="<?= HOME . '/sobre-nos'; ?>" <?= $checkLocal === 'sobre-nos' ? 'class="active"' : ''; ?>>SOBRE NÓS</a></li>
                <li><a href="<?= HOME . '/contato'; ?>" <?= $checkLocal === 'contato' ? 'class="active"' : ''; ?>>CONTATO</a></li>
            </ul>
        </nav>
        <div class="main-rds">
            <a href="http://www.facebook.com/studiomaxtv" title="Curta o <?= SITENAME; ?> no Facebook"><span class="fa fa-facebook-official fa-2x"></span></a>
            <a href="http://www.youtube.com/studiomaxtv" title="<?= SITENAME; ?> no YouTube"><span class="fa fa-youtube-square fa-2x"></span></a>
        </div>
    </div>
</header>