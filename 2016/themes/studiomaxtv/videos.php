<div class="content">
    <section class="wrapper-filter">
        <div class="vin vin-gray">
            <span class="vin-title">Filtrar</span>
        </div>
        <ul>
            <li><a href="<?= HOME . '/categoria/politica'; ?>" class="txt-categories">EDUCAÇÃO</a></li>
            <li><a href="<?= HOME . '/categoria/politica'; ?>" class="txt-categories">ENTRETENIMENTO</a></li>
            <li><a href="<?= HOME . '/categoria/esporte'; ?>" class="txt-categories">ESPORTE</a></li>
            <li><a href="<?= HOME . '/categoria/politica'; ?>" class="txt-categories">POLICÍA</a></li>
            <li><a href="<?= HOME . '/categoria/politica'; ?>" class="txt-categories">POLÍTICA</a></li>
            <li><a href="<?= HOME . '/categoria/politica'; ?>" class="txt-categories">BRONCA LIVRE</a></li>
            <li><a href="<?= HOME . '/categoria/politica'; ?>" class="txt-categories">TRIBUNA LIVRE</a></li>
            <li><a href="<?= HOME . '/categoria/saude'; ?>" class="txt-categories">SAÚDE</a></li>
        </ul>
    </section>
    <section class="wrapper-busca">
        <div class="busca-tit">Buscar</div>
        <div class="busca-form">
            <form action="">
                <input type="text" name="s" class="busca-input" placeholder="Digite o que deseja buscar. Ex. Tribuna Livre...">
                <button type="submit" name="searchSubmit" class="busca-btn"><span class="fa fa-search fa-2x"></span> Buscar</button>
            </form>
        </div>
    </section>
    <section class="wrapper-videos">
        <div class="wrapper-category">
            <div class="vin vin-green">
                <span class="vin-title">Últimos</span>
                <span class="vin-btn btn-green">VER MAIS</span>
            </div>
            <div class="video-group">
                <?php for ($v = 1; $v <= 5; $v++): ?>
                    <div class="video-box">
                        <div class="video-thumb"><img src="https://placeimg.com/640/380/arch" alt="Video EXE"></div>
                        <div class="video-title">Titulo do video aparecerá aqui para visualização</div>
                    </div>
                <?php endfor; ?>
            </div>
        </div>

        <div class="wrapper-category">
            <div class="vin vin-blue">
                <span class="vin-title">Política</span>
                <span class="vin-btn btn-blue">VER MAIS</span>
            </div>
            <div class="video-group">
                <?php for ($v = 1; $v <= 5; $v++): ?>
                    <div class="video-box">
                        <div class="video-thumb"><img src="https://placeimg.com/640/380/people" alt="Video EXE"></div>
                        <div class="video-title">Titulo do video aparecerá aqui para visualização</div>
                    </div>
                <?php endfor; ?>
            </div>
        </div>

        <div class="wrapper-category">
            <div class="vin vin-red">
                <span class="vin-title">Policía</span>
                <span class="vin-btn btn-red">VER MAIS</span>
            </div>
            <div class="video-group">
                <?php for ($v = 1; $v <= 5; $v++): ?>
                    <div class="video-box">
                        <div class="video-thumb"><img src="https://placeimg.com/640/380/nature" alt="Video EXE"></div>
                        <div class="video-title">Titulo do video aparecerá aqui para visualização</div>
                    </div>
                <?php endfor; ?>
            </div>
        </div>

        <div class="wrapper-category">
            <div class="vin vin-orange">
                <span class="vin-title">Saúde</span>
                <span class="vin-btn btn-orange">VER MAIS</span>
            </div>
            <div class="video-group">
                <?php for ($v = 1; $v <= 5; $v++): ?>
                    <div class="video-box">
                        <div class="video-thumb"><img src="https://placeimg.com/640/380/tech" alt="Video EXE"></div>
                        <div class="video-title">Titulo do video aparecerá aqui para visualização</div>
                    </div>
                <?php endfor; ?>
            </div>
        </div>
    </section>
</div>