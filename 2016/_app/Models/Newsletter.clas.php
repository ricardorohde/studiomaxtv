<?php

/**
 * Newsletter.class [ MODEL ADMIN ]
 * Respnsável por gerenciar os usuários cadastrados em newsletter no site!
 * 
 * @copyright (c) 2016, Gean Marques CREATIVE WEBSITES
 */
class Newsletter {

    private $Data;
    private $User;
    private $Error;
    private $Result;

    //Nome da tabela no banco de dados
    const Entity = 'newsletter_usuario';

    /**
     * <b>Cadastrar Usuário:</b> Envelope os dados de um usuário em um array atribuitivo e execute esse método
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
    
    

}
