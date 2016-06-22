<section class="content-header">
    <h1>
        Editar Videos 
        <small>Edição de Cadastros de Videos</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=videos/listar">Videos</a></li>
        <li class="active">Editar Videos</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <?php
            $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
            $idEdit = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
            if (isset($dados) && $dados['SendPostForm']):
                $dados['foto'] = ($_FILES['foto']['tmp_name'] ? $_FILES['foto'] : null);
                unset($dados['SendPostForm']);

                require('_models/AdminVideo.class.php');
                $cadastra = new AdminVideo;
                $cadastra->ExeUpdate($idEdit, $dados);

                if (!$cadastra->getResult()):
                    WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                else:
                    header("Location: painel.php?exe=videos/listar&acao=editar&id={$idEdit}");
                endif;
            else:
                $read = new Read;
                $read->ExeRead("videos", "WHERE id = :id", "id={$idEdit}");
                if (!$read->getResult()):
                    header("Location: painel.php?exe=videos/listar");
                else:
                    $dados = $read->getResult()[0];
                    $dados['data'] = date('d/m/Y', strtotime($dados['data']));
                    $dados['data_inicial'] = !empty($dados['data_inicial']) ? date('d/m/Y H:i', strtotime($dados['data_inicial'])) : null;
                    $dados['data_final'] = !empty($dados['data_final']) ?  date('d/m/Y H:i', strtotime($dados['data_final'])): null;
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
                                        <div class="col-md-4">
                                            <label for="tipo">Tipo de Vídeo</label>
                                            <select name="tipo" class="form-control" id="tipo">
                                                <option value="" <?= ($dados['tipo'] == '') ? ' selected="selected"' : ''; ?>>Selecione...</option>
                                                <option value="tv" <?= ($dados['tipo'] == 'tv') ? ' selected="selected"' : ''; ?>>Tv</option>
                                                <option value="video" <?= ($dados['tipo'] == 'video') ? ' selected="selected"' : ''; ?>>Vídeo</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group tp-youtube" <?= !empty($dados['youtube']) ? 'style="display: block;"' : ''; ?>>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="youtube">Url do Video do YouTube</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-youtube-play"></i>
                                                </div>
                                                <input type="text" name="youtube" class="form-control" id="youtube" value="<?= isset($dados['youtube']) ? $dados['youtube'] : ''; ?>" placeholder="Informe a url do video do YouTube">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group tp-iframe" <?= !empty($dados['iframe']) ? 'style="display: block;"' : ''; ?>>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="iframe">Url do Iframe da TV</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-desktop"></i>
                                                </div>
                                                <input type="text" name="iframe" class="form-control" id="iframe" value="<?= isset($dados['iframe']) ? $dados['iframe'] : ''; ?>" placeholder="Informe a url do iframe da TV">
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
                                                <input type="text" name="data" class="form-control datepicker" id="data" value="<?= isset($dados['data']) ? $dados['data'] : ''; ?>" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="destaque">Player Principal</label>
                                            <select name="destaque" class="form-control" id="destaque">
                                                <option value="" <?= ($dados['destaque'] == '') ? ' selected="selected"' : ''; ?>>Selecione...</option>
                                                <option value="sim" <?= ($dados['destaque'] == 'sim') ? ' selected="selected"' : ''; ?>>Sim</option>
                                                <option value="nao" <?= ($dados['destaque'] == 'nao') ? ' selected="selected"' : ''; ?>>Não</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group agendamento" <?= ($dados['destaque'] == 'nao') ? ' style="display: none;"' : ''; ?>>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="data_inicial">Inicio da Exibição em</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="data_inicial" class="form-control" id="data_inicial" value="<?= isset($dados['data_inicial']) ? $dados['data_inicial'] : ''; ?>" data-inputmask="'alias': 'dd/mm/yyyy h:i'" datetime-mask/>
                                            </div>
                                        </div>
                                    
                                        <div class="col-md-4">
                                            <label for="data_final">Fim da Exibição em</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" name="data_final" class="form-control" id="data_final" value="<?= isset($dados['data_final']) ? $dados['data_final'] : '' ?>" data-inputmask="'alias': 'dd/mm/yyyy h:i'" datetime-mask/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label for="transmissao">Tipo de Transmissão</label>
                                            <select name="transmissao" class="form-control" id="transmissao">
                                                <option value="" <?= ($dados['transmissao'] == '') ? ' selected="selected"' : ''; ?>>Selecione...</option>
                                                <option value="ao-vivo" <?= ($dados['transmissao'] == 'ao-vivo') ? ' selected="selected"' : ''; ?>>Ao Vivo</option>
                                                <option value="gravada" <?= ($dados['transmissao'] == 'gravada') ? ' selected="selected"' : ''; ?>>Gravada</option>
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
                                            <label>Capa do Video</label>
                                            <div class="help-image"><img src="<?= file_exists('../uploads/' . $dados['foto']) ? HOME . '/uploads/' . $dados['foto'] : $dados['foto']; ?>" class="img-thumbnail img-responsive"></div>
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
                        <input type="submit" name="SendPostForm" value="Editar" class="btn btn-flat btn-primary"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>