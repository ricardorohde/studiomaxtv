<section class="content-header">
    <h1>
        Cadastrar Videos 
        <small>Cadastros de Novos Videos</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=videos/listar">Videos</a></li>
        <li class="active">Cadastrar Videos</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <?php
            $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
            if (isset($dados) && $dados['SendPostForm']):
                $dados['foto'] = ($_FILES['foto']['tmp_name'] ? $_FILES['foto'] : null);
                unset($dados['SendPostForm']);

                require('_models/AdminVideo.class.php');
                $cadastra = new AdminVideo;
                $cadastra->ExeCreate($dados);

                if (!$cadastra->getResult()):
                    WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                else:
                    header("Location: painel.php?exe=videos/listar&acao=cadastrar&id={$cadastra->getResult()}");
                endif;
            endif;
            ?>
            <form role="form" name="CreateForm" action="" method="post" enctype="multipart/form-data">
                <div class="box box-primary">
                    <div class="box-header"><h3 class="box-title">Dados do Video</h3></div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="titulo">Titulo</label>
                                            <input type="text" name="titulo" class="form-control" id="titulo" value="<?= isset($dados['titulo']) ? $dados['titulo'] : ''; ?>" placeholder="Informe o titulo do video">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label for="categoria">Categoria</label>
                                            <select name="categoria" class="form-control" id="categoria">
                                                <option value="">Selecione...</option>
                                                <?php
                                                $readCat = new Read;
                                                $readCat->ExeRead("videos_categoria", "ORDER BY categoria ASC");
                                                if ($readCat->getRowCount() >= 1):
                                                    foreach ($readCat->getResult() as $cat):
                                                        echo "<option ";
                                                        if ($dados['categoria'] == $cat['url_name']):
                                                            echo "selected=\"selected\" ";
                                                        endif;
                                                        echo "value=\"{$cat['url_name']}\"> &raquo;&raquo; {$cat['categoria']}</option>";
                                                    endforeach;
                                                endif;
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="url">Url do Video do YouTube</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-youtube-play"></i>
                                                </div>
                                                <input type="text" name="url" class="form-control" id="url" value="<?= isset($dados['url']) ? $dados['url'] : ''; ?>" placeholder="Informe a url do video do YouTube">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="data">Data do Video</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="data" class="form-control datepicker" id="data" value="<?= isset($dados['data']) ? $dados['data'] : date('d/m/Y'); ?>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="destaque">Em Destaque</label>
                                            <select name="destaque" class="form-control" id="sexo">
                                                <option value="" <?= ($dados['destaque'] == '') ? ' selected="selected"' : ''; ?>>Selecione...</option>
                                                <option value="sim" <?= ($dados['destaque'] == 'sim') ? ' selected="selected"' : ''; ?>>Sim</option>
                                                <option value="nao" <?= ($dados['destaque'] == 'nao') ? ' selected="selected"' : ''; ?>>Não</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="autor">Autor</label>
                                            <input type="text" name="autor" class="form-control" id="autor" value="<?= isset($dados['autor']) ? $dados['autor'] : ''; ?>" placeholder="Informe o autor do Video">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="foto">Foto Capa</label>
                                            <input type="file" name="foto" class="form-control" id="foto">
                                            <p class="help-block">Selecione a foto capa do video.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="descricao">Descrição</label>
                                            <textarea name="descricao" rows="10" class="form-control" id="editor">
                                                <?= isset($dados['descricao']) ? $dados['descricao'] : ''; ?>
                                            </textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <input type="submit" name="SendPostForm" value="Cadastrar" class="btn btn-flat btn-primary"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>