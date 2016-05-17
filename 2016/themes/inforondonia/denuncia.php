<div class="content">
    <div class="main_left">
        <div class="main_content">
            <header class="header_content">
                <h1 class="header_title"><i class="fa fa-warning"></i> DENÚNCIA </h1>
                <p class="header_tagline">Registre sua denúncia</p>
                <span class="header_line"></span>
            </header>
            <article class="content_pag">
                <div class="box_denuncia">
                    <div class="denuncia_txt">
                        Faça agora mesmo sua denúncia. Envie-nos fotos, vídeos, reclamações, sugestões, sobre o que esta acontecendo com seu município, todas as denúncias serão investigadas e se forem verídicas serão feitas matérias para mostrar o descaso, e as sugestões serão sempre bem vidas para a melhoria do <b>PORTAL <?= SITENAME; ?></b>.<br> Seus dados serão guardados em sigílo e não aparecerão para o público. 
                    </div>
                    <div class="denuncia_alert">
                        <?php
                        require ('./_app/Library/recaptcha/src/autoload.php');
                        $siteKey = '6Le3hBwTAAAAAKNI-8h4SB3fZ0IcsQe5K2t07Fwa';
                        $secret = '6Le3hBwTAAAAANfBspVekYZcAIivxGKHLlnExLCp';

                        $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
                        if (isset($dados) && $dados['SendPostForm']):
                            unset($dados['SendPostForm']);
                            if (isset($dados['g-recaptcha-response'])):
                                $recaptcha = new \ReCaptcha\ReCaptcha($secret);
                                $resp = $recaptcha->verify($dados['g-recaptcha-response'], $_SERVER['REMOTE_ADDR']);

                                if ($resp->isSuccess()):
                                    WSErro('Mensagem Enviado com sucesso', WS_ACCEPT);
                                else:
                                    WSErro('Ocorreu um erro ao enviar.', WS_ERROR);
                                endif;
                            endif;
                        endif;
                        ?>
                    </div>
                    <div class="denuncia_form">
                        <form name="denunciaForm" action="" method="post" enctype="multipart/form-data">
                            <div class="form_input">
                                <label for="denuncia_nome">Nome</label>
                                <input type="text" name="denuncia_nome" class="denuncia_nome" placeholder="Informe seu Nome">
                            </div>
                            <div class="form_input">
                                <label for="denuncia_email">E-mail</label>
                                <input type="text" name="denuncia_email" class="denuncia_email" placeholder="Informe seu E-mail">
                            </div>
                            <div class="form_input">                                
                                <label for="denuncia_cidade" class="denuncia_cidade">Cidade</label>
                                <input type="text" name="denuncia_cidade" class="denuncia_cidade" placeholder="Informe sua Cidade">
                            </div>
                            <div class="form_input">    
                                <label for="denuncia_uf" class="denuncia_uf">UF</label>
                                <input type="text" name="denuncia_uf" class="denuncia_uf" placeholder="UF">
                            </div>
                            <div class="form_input">
                                <label for="denuncia_nome" class="denuncia_telefone">Telefone</label>
                                <input type="text" name="denuncia_telefone" class="denuncia_telefone" placeholder="Informe seu Telefone">
                            </div>
                            <div class="form_input">
                                <label for="denuncia_nome">Mensagem</label>
                                <textarea rows="10" name="denuncia_msg" class="denuncia_msg" placeholder="Deixe sua Mensagem"></textarea>
                            </div>
                            <div class="form_input">
                                <label for="denuncia_nome">Enviar Fotos</label>
                                <input type="file" name="denuncia_fotos[]" class="denuncia_fotos" placeholder="Envie fotos">
                            </div>
                            <div class="form_input">
                                <label for="denuncia_nome">Link Video</label>
                                <input type="text" name="denuncia_link" class="denuncia_link" placeholder="Link do Video">
                            </div>
                            <div class="form_input">
                                <div class="g-recaptcha denuncia_captcha" data-sitekey="<?= $siteKey; ?>"></div>
                            </div>
                            <div class="form_input">
                                <input type="submit" name="SendPostForm" class="denuncia_send" value="Enviar Denúncia">
                            </div>
                        </form>
                    </div>
                </div>
            </article>
        </div>
    </div>
    <?php require(REQUIRE_PATH . '/inc/sidebar.inc.php'); ?>
</div>
