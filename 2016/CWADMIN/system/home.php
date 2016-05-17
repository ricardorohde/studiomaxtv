<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        Dashboard
        <small>Versão 4.0</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <?php
    $Today = date('Y-m-d');
    $ReadDash = new Read;
    ?>
    <div class="row">
        <div class="col-md-3">
            <div class="info-box">
                <?php
                $Views = $ReadDash;
                $Views->ExeRead('ws_siteviews', "WHERE siteviews_date = :today", "today={$Today}");
                if ($Views->getResult()):
                    $CountViews = $Views->getResult()[0];
                else:
                    $CountViews['siteviews_users'] = 0;
                endif;
                ?>
                <div class="info-box-icon bg-yellow">
                    <i class="fa fa-line-chart"></i>
                </div>
                <div class="info-box-content">
                    <span class="info-box-text">Visitas Hoje</span>
                    <span class="info-box-number"><?= $CountViews['siteviews_users']; ?></span>                    
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="info-box">
                <?php
                $News = $ReadDash;
                $News->FullRead("SELECT count(*) AS count FROM noticias");
                $CountNews = $News->getResult()[0];
                ?>
                <div class="info-box-icon bg-green">
                    <i class="fa fa-newspaper-o"></i>
                </div>
                <div class="info-box-content">
                    <span class="info-box-text">Noticias Cadastradas</span>
                    <span class="info-box-number"><?= $CountNews['count']; ?></span>                    
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="info-box">
                <?php
                $Events = $ReadDash;
                $Events->FullRead("SELECT count(*) AS count FROM eventos");
                $CountEvents = $Events->getResult()[0];
                ?>
                <div class="info-box-icon bg-aqua-active">
                    <i class="fa fa-camera-retro"></i>
                </div>
                <div class="info-box-content">
                    <span class="info-box-text">Eventos Cadastrados</span>
                    <span class="info-box-number"><?= $CountEvents['count']; ?></span>                    
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="info-box">
                <?php
                $Videos = $ReadDash;
                $Videos->FullRead("SELECT count(*) AS count FROM videos");
                $CountVideos = $Videos->getResult()[0];
                ?>
                <div class="info-box-icon bg-red">
                    <i class="fa fa-play-circle"></i>
                </div>
                <div class="info-box-content">
                    <span class="info-box-text">Vídeos Cadastrados</span>
                    <span class="info-box-number"><?= $CountVideos['count']; ?></span>                    
                </div>
            </div>
        </div>
    </div>
</section><!-- /.content -->
