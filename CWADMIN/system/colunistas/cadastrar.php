<section class="content-header">
    <h1>
        Cadastrar Colunistas 
        <small>Cadastros de Novos Colunistas</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="painel.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="painel.php?exe=colunistas/listar">Colunistas</a></li>
        <li class="active">Cadastrar Colunistas</li>
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

                require('_models/AdminColunista.class.php');
                $cadastra = new AdminColunista;
                $cadastra->ExeCreate($dados);

                if (!$cadastra->getResult()):
                    WSErro($cadastra->getError()[0], $cadastra->getError()[1]);
                else:
                    header("Location: painel.php?exe=colunistas/listar&acao=cadastrar&id={$cadastra->getResult()}");
                endif;

                echo "<pre>";
                var_dump($cadastra);
                echo "</pre>";
            endif;
            ?>
            <form role="form" name="UserCreateForm" action="" method="post" enctype="multipart/form-data">
                <div class="box box-primary">
                    <div class="box-header"><h3 class="box-title">Dados do Perfil</h3></div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="nome">Nome</label>
                                            <input type="text" name="nome" class="form-control" id="nome" value="<?= isset($dados['nome']) ? $dados['nome'] : ''; ?>" placeholder="Informe o nome do colunista">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="sobre">Sobre</label>
                                            <textarea name="sobre" rows="10" class="form-control" id="editor">
                                                <?= isset($dados['sobre']) ? $dados['sobre'] : ''; ?>
                                            </textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="foto">Foto do Perfil</label>
                                            <input type="file" name="foto" class="form-control" id="foto">
                                            <p class="help-block">Selecione a foto do perfil do colunista.</p>
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