<section class="wrapper-slide">

</section>
<div class="content">
    <section class="wrapper-player">
        <div class="player-box"></div>
        <div class="player-dados">
            <div class="player-status">AO VIVO</div>
            <div class="player-tit">TITULO DO VIDEO EM EXECUÇÃO</div>
            <div class="player-desc">Descrição sobre o video em execução, trazendo informações sobre o que o usário irá assistir.</div>
        </div>
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
                <span class="vin-btn vin-btn-green">VER MAIS</span>
            </div>
            <div class="video-group">
                <?php for ($v = 1; $v <= 5; $v++): ?>
                    <div class="video-box">
                        <div class="video-thumb"></div>
                        <div class="video-title">Titulo do video aparecerá aqui para visualização</div>
                    </div>
                <?php endfor; ?>
            </div>
        </div>

        <div class="wrapper-category">
            <div class="vin vin-red">
                <span class="vin-title">Política</span>
                <span class="vin-btn vin-btn-red">VER MAIS</span>
            </div>
            <div class="video-group">
                <?php for ($v = 1; $v <= 5; $v++): ?>
                    <div class="video-box">
                        <div class="video-thumb"></div>
                        <div class="video-title">Titulo do video aparecerá aqui para visualização</div>
                    </div>
                <?php endfor; ?>
            </div>
        </div>

        <div class="wrapper-category">
            <div class="vin vin-blue">
                <span class="vin-title">Esporte</span>
                <span class="vin-btn vin-btn-blue">VER MAIS</span>
            </div>
            <div class="video-group">
                <?php for ($v = 1; $v <= 5; $v++): ?>
                    <div class="video-box">
                        <div class="video-thumb"></div>
                        <div class="video-title">Titulo do video aparecerá aqui para visualização</div>
                    </div>
                <?php endfor; ?>
            </div>
        </div>

        <div class="wrapper-category">
            <div class="vin vin-orange">
                <span class="vin-title">Saúde</span>
                <span class="vin-btn vin-btn-orange">VER MAIS</span>
            </div>
            <div class="video-group">
                <?php for ($v = 1; $v <= 5; $v++): ?>
                    <div class="video-box">
                        <div class="video-thumb"></div>
                        <div class="video-title">Titulo do video aparecerá aqui para visualização</div>
                    </div>
                <?php endfor; ?>
            </div>
        </div>
    </section>
    <section class="wrapper-newsletter">
        <div class="vin vin-purple">
            <span class="vin-title">Newsletter</span>
        </div>
        <div class="newsletter-form">
            <form action="">
            <div class="newsletter-input">
                <label for="news_nome">NOME</label>
                <input type="text" id="news_nome" name="nome" placeholder="Digite seu nome">
            </div>
            <div class="newsletter-input">
                <label for="news_email">E-MAIL</label>
                <input type="text" id="news_email" name="email" placeholder="Digite seu e-mail">
            </div>
                <button type="submit" class="newsletter-btn btn-purple">Cadastrar</button>
            </form>
        </div>
    </section>
</div>