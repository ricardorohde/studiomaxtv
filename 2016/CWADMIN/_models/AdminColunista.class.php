<?php

/**
 * AdminColunista.class [ MODEL ADMIN ]
 * Respnsável por gerenciar os colunistas no Admin do sistema!
 * 
 * @copyright (c) 2014, Gean M S Bertnai CREATIVE WEBSITES
 */
class AdminColunista {

    private $Data;
    private $Id;
    private $Error;
    private $Result;

    //Nome da tabela no banco de dados
    const Entity = 'colunistas';

    /**
     * <b>Cadastrar Colunista:</b> Envelope os dados de um colunista em um array atribuitivo e execute esse método
     * para cadastrar o mesmo no sistema. Validações serão feitas!
     * @param ARRAY $Data = Atribuitivo
     */
    public function ExeCreate(array $Data) {
        $this->Data = $Data;
        $this->checkData();

        if ($this->getResult()):
            if ($this->Data['foto']):
                $upload = new Upload;
                $upload->Image($this->Data['foto'], Check::Name($this->Data['nome']), 640, 'colunistas');
            endif;

            if (isset($upload) && $upload->getResult()):
                $this->Data['foto'] = $upload->getResult();
                $this->Create();
            else:
                $this->Data['foto'] = NULL;
                $this->Create();
            endif;
            var_dump($this->Data);
        endif;
    }

    /**
     * <b>Atualizar Colunista:</b> Envelope os dados em uma array atribuitivo e informe o id de um
     * usuário para atualiza-lo no sistema!
     * @param INT $ColunistaId = Id do usuário
     * @param ARRAY $Data = Atribuitivo
     */
    public function ExeUpdate($ColunistaId, array $Data) {
        $this->Id = (int) $ColunistaId;
        $this->Data = $Data;
        $this->checkData();
        if ($this->getResult()):
            if (is_array($this->Data['foto'])):
                $this->fotoDelete($this->Id);
                $upload = new Upload;
                $upload->Image($this->Data['foto'], Check::Name($this->Data['nome']), 640, 'colunistas');
            endif;

            if (isset($upload) && $upload->getResult()):
                $this->Data['foto'] = $upload->getResult();
                $this->Update();
            else:
                unset($this->Data['foto']);
                $this->Update();
            endif;
        endif;
    }

    /**
     * <b>Remover Colunista:</b> Informe o ID do colunista que deseja remover. Este método não permite deletar
     * o próprio perfil ou ainda remover todos os ADMIN'S do sistema!
     * @param INT $ColunistaId = Id do colunista
     */
    public function ExeDelete($ColunistaId) {
        $this->Id = (int) $ColunistaId;

        $readUser = new Read;
        $readUser->ExeRead(self::Entity, "WHERE id = :id", "id={$this->Id}");

        if (!$readUser->getResult()):
            $this->Error = [ 'Oppsss, você tentou remover um colunista que não existe no sistema!', WS_ERROR];
            $this->Result = false;
        else:
            $readColuna = $readUser;
            $readColuna->ExeRead('noticias', "WHERE colunista = :idcol", "idcol={$this->Id}");

            if ($readColuna->getRowCount()):
                $this->Error = [ 'Oppsss, você está tentando remover um colunista porém ele tem coluna cadastrada. Para remover delete a coluna antes!!!', WS_ERROR];
                $this->Result = false;
            else:
                $this->fotoDelete($this->Id);
                $this->Delete();
            endif;
        endif;
    }

    /**
     * <b>Verificar Cadastro:</b> Retorna TRUE se o cadastro ou update for efetuado ou FALSE se não.
     * Para verificar erros execute um getError();
     * @return BOOL $Var = True or False
     */
    public function getResult() {
        return $this->Result;
    }

    /**
     * <b>Obter Erro:</b> Retorna um array associativo com um erro e um tipo.
     * @return ARRAY $Error = Array associatico com o erro
     */
    public function getError() {
        return $this->Error;
    }

    /*
     * ***************************************
     * **********  PRIVATE METHODS  **********
     * ***************************************
     */

    //Verifica os dados digitados no formulário
    private function checkData() {
        if (in_array('', $this->Data)):
            $this->Error = [ "Existem campos em branco. Favor preencha todos os campos!", WS_ALERT];
            $this->Result = false;
        else:
            $this->Result = true;
        endif;
    }

    //SetData
    private function setData() {
        $this->Data['sobre'] = trim($this->Data['sobre']);
        $this->Data['data'] = Check::Data(date('d/m/Y'));
        $this->Data['url_name'] = Check::Name($this->Data['nome']);
    }

    //Excluir a Foto
    private function fotoDelete($ColunistaId) {
        $this->Id = (int) $ColunistaId;

        $readFoto = new Read;
        $readFoto->ExeRead(self::Entity, "WHERE id = :id", "id={$this->Id}");
        $foto = "../uploads/{$readFoto->getResult()[0]['foto'] }";
        if (file_exists($foto) && !is_dir($foto)):
            unlink($foto);
        endif

        ;
    }

    //Cadasrtra Colunista!
    private function Create() {
        $Create = new Create;
        //Dados Insert Automatico
        $this->Data['qm_cadastr'] = $_SESSION['userlogin']['id'];
        $this->setData();
        $Create->ExeCreate(self::Entity, $this->Data);
        if ($Create->getResult()):
            $this->Error = ["O colunista <b>{$this->Data['nome']} </b> foi cadastrado com sucesso no sistema!", WS_ACCEPT];
            $this->Result = $Create->getResult();
        endif;
    }

    //Atualiza Usuário!
    private function Update() {
        $Update = new Update;
        //Dados Insert Automatico
        $this->Data['qm_alterou'] = $_SESSION['userlogin']['id'];
        $this->setData();
        $Update->ExeUpdate(self ::Entity, $this->Data, "WHERE id = :id", "id={$this->Id}");
        if ($Update->getResult()):
            $this->Error = ["O colunista <b>{$this->Data['nome']}</b> foi atualizado com sucesso!", WS_ACCEPT];
            $this->Result = true;
        endif;
    }

    //Remove Usuário
    private function Delete() {
        $Delete = new Delete;
        $Delete->ExeDelete(self::Entity, "WHERE id = :id", "id={$this->Id}");
        if ($Delete->getResult()):
            $this->Error = [ "Colunista removido com sucesso do sistema!", WS_ACCEPT];
            $this->Result = true;
        endif;
    }

}
