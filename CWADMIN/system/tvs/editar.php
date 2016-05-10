<section class="content-header">
    <h1>
        Cadastrar TVs 
        <small>Cadastros de Novos Iframe de TV</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=tvs/listar">TVs</a></li>
        <li class="active">Cadastrar TVs</li>
    </ol>
</section>
<section class="content">
    <div class="row">
        <div class="col-md-12">
            <?php
            $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
            $idEdit = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);
            if (isset($dados) && $dados['SendPostForm']):
                unset($dados['SendPostForm']);

                require('_models/AdminTv.class.php');
                $cadastra = new AdminTv;
                $cadastra->ExeUpdate($idEdit, $dados);

                if (!$cadastra->getResult()):
                    WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                else:
                    header("Location: painel.php?exe=tvs/listar&acao=editar&id={$idEdit}");
                endif;
            else:
                $read = new Read;
                $read->ExeRead("tv", "WHERE id = :id", "id={$idEdit}");
                if (!$read->getResult()):
                    header("Location: painel.php?exe=tvs/listar");
                else:
                    $dados = $read->getResult()[0];
                endif;
            endif;
            ?>
            <form role="form" name="UserCreateForm" action="" method="post" enctype="multipart/form-data">
                <div class="box box-primary">
                    <div class="box-header"><h3 class="box-title">Dados da TV</h3></div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="titulo">Titulo</label>
                                            <input type="text" name="titulo" class="form-control" id="titulo" value="<?= isset($dados['titulo']) ? $dados['titulo'] : ''; ?>" placeholder="Informe o titulo da TV">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="url">Url do IFRAME da TV</label>
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-youtube-play"></i>
                                                </div>
                                                <input type="text" name="url" class="form-control" id="url" value="<?= isset($dados['url']) ? $dados['url'] : ''; ?>" placeholder="Informe a url do IFRAME da TV">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" class="chkbool" name="tv" value="true" <?= $dados['tv']=='true' ? 'checked="checked"' : ''; ?>> Exibir na página TV
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" class="chkbool" name="lateral" value="true" <?= $dados['lateral']=='true' ? 'checked="checked"' : ''; ?>> Exibir na Lateral
                                    </label>
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