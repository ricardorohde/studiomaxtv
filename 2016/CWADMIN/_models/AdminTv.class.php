<?php

/**
 * AdminTv.class [ MODEL ADMIN ]
 * Respnsável por gerenciar os cadastros de Iframe de TVs no Admin do sistema!
 * 
 * @copyright (c) 2014, Gean Marques - CREATIVE WEBSITES
 */
class AdminTv {

    private $Data;
    private $Id;
    private $Error;
    private $Result;

    //Tabela do banco de dados
    const Entity = 'tv';

    /**
     * <b>Cadastrar TV:</b> Envelopa os dados em um array atribuitivo e executa esse método
     * para cadastrar o mesmo no sistema. Validações serão feitas!
     * @param ARRAY $Data = Atribuitivo
     */
    public function ExeCreate(array $Data) {
        $this->Data = $Data;
        $this->checkData();
        if ($this->getResult()):
            $this->Create();
        endif;
    }

    /**
     * <b>Atualizar TV:</b> Envelopa os dados em um array atribuitivo e informe o id de um
     * registro para atualiza-lo no sistema!
     * @param INT $TvId = Id da TV
     * @param ARRAY $Data = Atribuitivo
     */
    public function ExeUpdate($TvId, array $Data) {
        $this->Id = (int) $TvId;
        $this->Data = $Data;
        $this->checkData();
        if ($this->getResult()):
            $this->Update();
        endif;
    }

    /**
     * <b>Remover TV:</b> Informe o ID do registro que deseja remover.
     * @param INT $TvId = Id da TV
     */
    public function ExeDelete($TvId) {
        $this->Id = (int) $TvId;

        $readVideo = new Read;
        $readVideo->ExeRead(self::Entity, "WHERE id = :id", "id={$this->Id}");

        if (!$readVideo->getResult()):
            $this->Error = ['Oppsss, você tentou remover uma TV que não existe no sistema!', WS_ERROR];
            $this->Result = false;
        else:
            $this->Delete();
        endif;
    }

    /**
     * <b>Verificar Cadastro:</b> Retorna TRUE se o cadastro ou update for efetuado ou FALSE se não.
     * Para verificar erros execute um getError();
     * @return BOOL $Var = True or False
     */
    function getResult() {
        return $this->Result;
    }

    /**
     * <b>Obter Erro:</b> Retorna um array associativo com um erro e um tipo.
     * @return ARRAY $Error = Array associatico com o erro
     */
    function getError() {
        return $this->Error;
    }

    /*
     * ***************************************
     * **********  PRIVATE METHODS  **********
     * ***************************************
     */

    //Checa os dados
    private function checkData() {
        if (in_array('', $this->Data)):
            $this->Error = ["Existem campos em branco. Favor preencha todos os campos!", WS_ALERT];
            $this->Result = false;
        else:
            $this->Result = true;
        endif;
    }

    //Seta os Dados
    private function setData() {
        $this->Data['tv'] = !empty($this->Data['tv']) ? 'true' : 'false';
        $this->Data['lateral'] = !empty($this->Data['lateral']) ? 'true' : 'false';
    }

    //Cadastra
    private function Create() {
        $Create = new Create;
        $this->setData();
        $this->Data['qm_cadastr'] = $_SESSION['userlogin']['id'];

        $Create->ExeCreate(self::Entity, $this->Data);
        if ($Create->getResult()):
            $this->Error = ["A TV <b>{$this->Data['titulo']}</b> foi cadastrada com sucesso no sistema!", WS_ACCEPT];
            $this->Result = $Create->getResult();
        endif;
    }

    //Atualiza
    private function Update() {
        $Update = new Update;
        $this->setData();
        $this->Data['qm_alterou'] = $_SESSION['userlogin']['id'];
        $this->Data['data_alterou'] = date('Y-m-d H:i:s');
        $Update->ExeUpdate(self::Entity, $this->Data, "WHERE id = :id", "id={$this->Id}");
        if ($Update->getResult()):
            $this->Error = ["A TV <b>{$this->Data['titulo']}</b> foi atualizada com sucesso no sistema!", WS_ACCEPT];
            $this->Result = $Update->getResult();
        endif;
    }

    //Excluir
    private function Delete() {
        $Delete = new Delete;
        $Delete->ExeDelete(self::Entity, "WHERE id = :id", "id={$this->Id}");
        if ($Delete->getResult()):
            $this->Error = ["TV removida com sucesso do sistema!", WS_ACCEPT];
            $this->Result = true;
        endif;
    }

}
