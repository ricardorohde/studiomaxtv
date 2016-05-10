<section class="content-header">
    <h1>
        Cadastrar Notícias
        <small>Cadastros de Nova Notícia</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=noticias/listar">Notícias</a></li>
        <li class="active">Cadastrar Notícias</li>
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

                require('_models/AdminNoticia.class.php');
                $cadastra = new AdminNoticia;
                $cadastra->ExeCreate($dados);

                if (!$cadastra->getResult()):
                    WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                else:
                    //Atualiza o Sitemap
                    $SiteMap = new Sitemap;
                    $SiteMap->ExeSitemap();
                    $SiteMap->ExeRss();

                    if (!file_exists('../../sitemap.xml')):
                        $SiteMap->ExeSitemapGz();
                        $SiteMap->Ping();
                    endif;

                    header("Location: painel.php?exe=noticias/listar&acao=cadastrar&id={$cadastra->getResult()}");
                endif;
            endif;
            ?>
            <form role="form" name="UserCreateForm" action="" method="post" enctype="multipart/form-data">
                <div class="box box-primary">
                    <div class="box-header"><h3 class="box-title">Dados da Notícia</h3></div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="categoria">Categoria</label>
                                            <select name="categoria" class="form-control" id="categoria">
                                                <option value="">Selecione...</option>
                                                <?php
                                                $readCat = new Read;
                                                $readCat->ExeRead("noticias_categoria", "ORDER BY categoria ASC");
                                                if ($readCat->getRowCount() >= 1):
                                                    foreach ($readCat->getResult() as $cat):
                                                        echo "<option ";
                                                        if ($dados['categoria'] == $cat['cat_url']):
                                                            echo "selected=\"selected\" ";
                                                        endif;
                                                        echo "value=\"{$cat['cat_url']}\"> &raquo;&raquo; {$cat['categoria']}</option>";
                                                    endforeach;
                                                endif;
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="data">Data da Notícia</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="data" class="form-control datepicker" id="data" value="<?= isset($dados['data']) ? $dados['data'] : date('d/m/Y'); ?>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="titulo">Titulo</label>
                                            <input type="text" name="titulo" class="form-control" id="titulo" value="<?= isset($dados['titulo']) ? $dados['titulo'] : ''; ?>" placeholder="Informe o Titulo da Notícia">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="subtitulo">Sub-titulo</label>
                                            <input type="text" name="subtitulo" class="form-control" id="subtitulo" value="<?= isset($dados['subtitulo']) ? $dados['subtitulo'] : ''; ?>" placeholder="Informe o Sub-Titulo da Notícia">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="autor">Autor</label>
                                            <input type="text" name="autor" class="form-control" id="autor" value="<?= isset($dados['autor']) ? $dados['autor'] : ''; ?>" placeholder="Informe o Autor da Notícia">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="fonte">Fonte</label>
                                            <input type="text" name="fonte" class="form-control" id="fonte" value="<?= isset($dados['fonte']) ? $dados['fonte'] : ''; ?>" placeholder="Informe a Fonte da Notícia">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="destaque">Em Destaque</label>
                                            <select name="destaque" class="form-control" id="destaque">
                                                <option value="nao" <?= ($dados['destaque'] == 'nao') ? ' selected="selected"' : ''; ?>>Não</option>
                                                <option value="sim" <?= ($dados['destaque'] == 'sim') ? ' selected="selected"' : ''; ?>>Sim</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="destaque_tipo">Tipo de Destaque</label>
                                            <select name="destaque_tipo" class="form-control" id="destaque_tipo" <?= ($dados['destaque'] == 'sim') ? '' : 'disabled="disabled"'; ?>>
                                                <option value="slide" <?= ($dados['destaque_tipo'] == 'slide') ? ' selected="selected"' : ''; ?>>Slide</option>
                                                <option value="smallnews" <?= ($dados['destaque_tipo'] == 'smallnews') ? ' selected="selected"' : ''; ?>>Small News</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="data_fslide">Quantos dias no Slide?</label>
                                            <input type="number" name="data_fslide" class="form-control" id="data_fslide" value="<?= isset($dados['data_fslide']) ? $dados['data_fslide'] : ''; ?>" placeholder="Quantos dias no Slide?" <?= ($dados['destaque_tipo'] == 'slide') ? '' : 'disabled="disabled"'; ?>>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="coluna">É Coluna?</label>
                                            <select name="coluna" class="form-control" id="coluna">
                                                <option value="nao" <?= ($dados['coluna'] == 'nao') ? ' selected="selected"' : ''; ?>>Não</option>
                                                <option value="sim" <?= ($dados['coluna'] == 'sim') ? ' selected="selected"' : ''; ?>>Sim</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="colunista">Colunista</label>
                                            <select name="colunista" class="form-control" id="colunista"  <?= ($dados['coluna'] == 'sim') ? '' : 'disabled="disabled"'; ?>>
                                                <option value="">Selecione...</option>
                                                <?php
                                                $readCol = new Read;
                                                $readCol->ExeRead("colunistas", "ORDER BY nome ASC");
                                                if ($readCol->getRowCount() >= 1):
                                                    foreach ($readCol->getResult() as $col):
                                                        echo "<option ";
                                                        if ($dados['colunista'] == $col['id']):
                                                            echo "selected=\"selected\" ";
                                                        endif;
                                                        echo "value=\"{$col['id']}\"> &raquo;&raquo; {$col['nome']}</option>";
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
                                            <label for="video">Url do Video do YouTube</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-youtube-play"></i>
                                                </div>
                                                <input type="text" name="video" class="form-control" id="video" value="<?= isset($dados['video']) ? $dados['video'] : ''; ?>" placeholder="Informe a url do video do YouTube para Adicionar na Noticia">
                                            </div>
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
                                            <p class="help-block">Selecione a foto capa da notícia.</p>
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
                                            <label for="noticia">Notícia</label>
                                            <textarea name="noticia" rows="10" class="form-control" id="editor">
                                                <?= isset($dados['noticia']) ? $dados['noticia'] : ''; ?>
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