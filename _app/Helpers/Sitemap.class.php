<?php

/**
 * Sitemap.class [ HELPER SEO ]
 * A classe cria e gerencia Sitemaps e RSS do site!
 * 
 * @copyright (c) 2016, Gabriel Philipe 
 */
class Sitemap {

    private $Format;

    /**
     * <b>ExeRss</b>: Cria o RSS a partir dos posts do blog
     */
    public function ExeRss() {
        $this->setRss(); //Função que cria os códigos XML so Sitemap

        $fp = fopen('../rss.xml', 'w+'); //Cria o rss.xml
        fwrite($fp, $this->Format); //Escreve os códigos no rss.xml
        fclose($fp); //Fecha o rss.xml para não corromper os arquivos
    }

    /**
     * <b>ExeSitemap</b>: Cria Sitemaps a partir dos Posts, Categorias e Páginas cadastradas no banco
     */
    public function ExeSitemap() {
        $this->setSitemap(); //Função que cria os códigos XML so Sitemap

        $fp = fopen('../sitemap.xml', 'w+'); //Cria o sitemap.xml
        fwrite($fp, $this->Format); //Escreve os códigos no sitemap.xml
        fclose($fp); //Fecha o sitemap.xml para não corromper os arquivos
        unlink(BACK . 'sitemap.xml.gz'); //Exclui o sitemap.xml.gz para que seja atualizado
    }

    /**
     * <b>ExeSitemapGz</b>: Cria o sitemap.xml.gz
     */
    public function ExeSitemapGz() {
        $gZip = gzopen('../sitemap.xml.gz', 'w9'); //Cria o sitemap.xml.gz
        $gMap = file_get_contents(BACK . 'sitemap.xml'); //Carrega o conteúdo do sitemap.xml

        gzwrite($gZip, $gMap); //Escreve no sitemap.xml.gz o conteúdo da sitemap.xml
        gzclose($gZip); //Fecha o sitemap.xml.gz para não corromper os arquivos
    }

    /**
     * <b>Ping</b>: Pinga (avisa) o sitemap no Google e no Bing
     * 
     * @return boolean This = TRUE para retorno positivo do PING
     */
    public function Ping() {
        $SitemapPing = array();
        $SitemapPing['g'] = 'https://www.google.com/webmasters/tools/ping?sitemap=' . HOME . '/sitemap.xml';
        $SitemapPing['b'] = 'https://www.bing.com/webmaster/ping.aspx?siteMap=' . HOME . '/sitemap.xml';

        foreach ($SitemapPing as $SitemapUrl):
            $ch = curl_init($SitemapUrl);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_exec($ch);
            $Result = curl_getinfo($ch); //Usado somente para testar se o sitemap foi pingado nos buscadores
            curl_close($ch);

            if ($Result['http_code'] == '200'):
                return true;
            endif;
        endforeach;
    }

    //TODO Configurar sitemap.xml
    
    //Formata o Arquivo sitemap.xml
    private function setSitemap() {
        $this->Format = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
        $this->Format .= '<?xml-stylesheet type="text/xsl" href="sitemap.xsl"?>' . "\n";
        $this->Format .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

        //SITEMAP PÁGINA INICIAL
        $this->Format .= '<url>' . "\n";
        $this->Format .= '<loc>' . HOME . '/</loc>' . "\n";
        $this->Format .= '<lastmod>' . date('Y-m-d\TH:i:sP') . '</lastmod>' . "\n";
        $this->Format .= '<changefreq>Daily</changefreq>' . "\n";
        $this->Format .= '<priority>1.0</priority>' . "\n";
        $this->Format .= '</url>' . "\n";

        //SITEMAP POSTS
        $ReadPosts = $this->Read(DB_POSTS, "WHERE post_status = :st AND post_date <= NOW() AND post_type = :tp", "st=1&tp=post");
        foreach ($ReadPosts as $Post):
            $this->Format .= '<url>' . "\n";
            $this->Format .= '<loc>' . HOME . '/post/' . $Post['post_name'] . '</loc>' . "\n";
            $this->Format .= '<lastmod>' . date('Y-m-d\TH:i:sP', strtotime($Post['post_date'])) . '</lastmod>' . "\n";
            $this->Format .= '<changefreq>Weekly</changefreq>' . "\n";
            $this->Format .= '<priority>0.9</priority>' . "\n";
            $this->Format .= '</url>' . "\n";
        endforeach;

        //SITEMAP CATEGORIAS
        $ReadCategories = $this->Read(DB_CATEGORIES);
        foreach ($ReadCategories as $Category):
            $this->Format .= '<url>' . "\n";
            $this->Format .= '<loc>' . HOME . '/categoria/' . $Category['category_name'] . '</loc>' . "\n";
            $this->Format .= '<lastmod>' . date('Y-m-d\TH:i:sP', strtotime($Category['category_last_view'])) . '</lastmod>' . "\n";
            $this->Format .= '<changefreq>Weekly</changefreq>' . "\n";
            $this->Format .= '<priority>0.8</priority>' . "\n";
            $this->Format .= '</url>' . "\n";
        endforeach;

        $this->Format .= '</urlset>' . "\n";

        return $this->Format; //Retorna o Código do Sitemap
    }

    //Formata o Arquivo rss.xml
    private function setRss() {
        $this->Format = '<?xml version="1.0" encoding="UTF-8" ?>' . "\n";
        $this->Format .= '<rss version="2.0">' . "\n";
        $this->Format .= '<channel>' . "\n";

        //RSS INICIAL
        $this->Format .= '<title>' . SITENAME . '</title>' . "\n";
        $this->Format .= '<link>' . HOME . '/</link>' . "\n";
        $this->Format .= '<description>' . SITEDESC . '</description>' . "\n";
        $this->Format .= '<language>pt-br</language>' . "\n";

        //RSS POSTS
        $ReadPosts = $this->Read('noticias', "WHERE destaque = :dest AND data <= NOW() AND categoria != :catpol AND categoria != :catacid AND categoria != :catpub ORDER BY data DESC LIMIT :limit", "dest=sim&catpol=policial&catacid=acidentes&catpub=publicidade&limit=10");
        foreach ($ReadPosts as $Post):
            $this->Format .= '<item>' . "\n";
            $this->Format .= '<title>' . $Post['titulo'] . '</title>' . "\n";
            $this->Format .= '<link>' . HOME . '/noticia/' . $Post['url_name'] . '</link>' . "\n";
            $this->Format .= '<pubDate>' . date('D, d M Y H:i:s O', strtotime($Post['data'])) . '</pubDate>' . "\n";
            $this->Format .= '<description>';
            $this->Format .= htmlentities(Check::Words($Post['noticia'], 30, '[...]'));
            $this->Format .= '</description>';
            $this->Format .= '</item>' . "\n";
        endforeach;

        $this->Format .= '</channel>' . "\n";
        $this->Format .= '</rss>' . "\n";

        return $this->Format; //Retorna o Código do RSS
    }

    //Função para Ler
    private function Read($Table, $Where = null, $Parse = null) {
        $Read = !isset($Read) ? new Read : $Read; //Verifica se a classe Read já está instanciada!
        $IfWhere = !empty($Where) ? $Where : null; //Verifica se há condições na leitura
        $IfParse = !empty($Parse) ? $Parse : null; //ParseString

        $Read->ExeRead($Table, $IfWhere, $IfParse);
        if ($Read->getResult()):
            return $Read->getResult(); //Retorna os dados do Banco de Dados
        endif;
    }

}
