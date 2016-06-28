-- --------------------------------------------------------
-- Servidor:                     studiomaxtv.com.br
-- Versão do servidor:           5.5.50-cll - MySQL Community Server (GPL)
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              9.3.0.5104
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela studioma_dbsite2016.banco_fotos
DROP TABLE IF EXISTS `banco_fotos`;
CREATE TABLE IF NOT EXISTS `banco_fotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) DEFAULT NULL COMMENT 'Ordem das Fotos',
  PRIMARY KEY (`id`),
  KEY `id_tipo` (`id_tipo`),
  KEY `tipo` (`tipo`),
  KEY `nome` (`foto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Armazena as fotos selecionadas na opção mais fotos, dependendo do tipo.';

-- Copiando dados para a tabela studioma_dbsite2016.banco_fotos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `banco_fotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco_fotos` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.banners
DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `tipo` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `data_inicial` date NOT NULL,
  `data_final` date NOT NULL,
  `data_atual` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_cadastr` int(9) NOT NULL,
  `qm_alterou` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banner` (`banner`),
  KEY `titulo` (`titulo`),
  KEY `fk_banners_tipo` (`tipo`),
  KEY `fk_banners_qm_cadastr` (`qm_cadastr`),
  KEY `fk_banners_qm_alterou` (`qm_alterou`),
  CONSTRAINT `fk_banners_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_banners_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_banners_tipo` FOREIGN KEY (`tipo`) REFERENCES `banners_tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Armazena informações sobre banners de publicidade';

-- Copiando dados para a tabela studioma_dbsite2016.banners: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
REPLACE INTO `banners` (`id`, `titulo`, `banner`, `tipo`, `link`, `data_inicial`, `data_final`, `data_atual`, `qm_cadastr`, `qm_alterou`) VALUES
	(1, 'Slide 1', 'banners/2016/06/slide-1.jpg', 1, '#', '2016-05-23', '2016-12-31', '2016-05-23 23:55:32', 1, 2),
	(4, 'TRIBUNA LIVRE', 'banners/2016/06/tribuna-livre.jpg', 1, 'http://www.studiomaxtv.com.br/categoria/tribuna-livre', '2016-06-15', '2020-01-01', '2016-06-15 19:17:52', 2, 2),
	(5, 'BRONCA LIVRE', 'banners/2016/06/bronca-livre.jpg', 1, 'http://www.studiomaxtv.com.br/categoria/bronca-livre', '2016-06-15', '2020-01-01', '2016-06-15 20:02:39', 2, 2),
	(6, 'tvdopovo', 'banners/2016/06/tvdopovo.jpg', 1, 'http://www.tvdopovo.com/', '2016-06-15', '2017-04-29', '2016-06-15 20:22:54', 2, 2);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.banners_tipo
DROP TABLE IF EXISTS `banners_tipo`;
CREATE TABLE IF NOT EXISTS `banners_tipo` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `dimens_w` varchar(50) NOT NULL,
  `dimens_h` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tipos de banners';

-- Copiando dados para a tabela studioma_dbsite2016.banners_tipo: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `banners_tipo` DISABLE KEYS */;
REPLACE INTO `banners_tipo` (`id_tipo`, `tipo`, `dimens_w`, `dimens_h`) VALUES
	(1, 'slide', '1920', '480');
/*!40000 ALTER TABLE `banners_tipo` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.colunistas
DROP TABLE IF EXISTS `colunistas`;
CREATE TABLE IF NOT EXISTS `colunistas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `sobre` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_cadastr` int(11) NOT NULL,
  `qm_alterou` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nome` (`nome`),
  KEY `fk_colunistas_qm_cadastr` (`qm_cadastr`),
  KEY `fk_colunistas_qm_alterou` (`qm_alterou`),
  KEY `url_name` (`url_name`),
  CONSTRAINT `fk_colunistas_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_colunistas_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informações de Colunistas';

-- Copiando dados para a tabela studioma_dbsite2016.colunistas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `colunistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `colunistas` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.cotacao
DROP TABLE IF EXISTS `cotacao`;
CREATE TABLE IF NOT EXISTS `cotacao` (
  `id_cotacao` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30) NOT NULL,
  `cotacao` float(15,2) NOT NULL,
  `variacao` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL,
  `atualizado` date NOT NULL,
  PRIMARY KEY (`id_cotacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dados de cotação financeira de dolar, euro, bovespa.';

-- Copiando dados para a tabela studioma_dbsite2016.cotacao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cotacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotacao` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.enquete
DROP TABLE IF EXISTS `enquete`;
CREATE TABLE IF NOT EXISTS `enquete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pergunta` varchar(250) NOT NULL,
  `resp1` varchar(250) NOT NULL,
  `resp2` varchar(250) NOT NULL,
  `resp3` varchar(250) NOT NULL,
  `resp4` varchar(250) NOT NULL,
  `status` char(1) NOT NULL COMMENT 'A = Ativa | D = Desativada',
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qm_cadastr` int(11) NOT NULL,
  `qm_alterou` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informações sobre enquetes';

-- Copiando dados para a tabela studioma_dbsite2016.enquete: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.enquete_usuario
DROP TABLE IF EXISTS `enquete_usuario`;
CREATE TABLE IF NOT EXISTS `enquete_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_enquete` int(11) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registrar os usuários que votaram';

-- Copiando dados para a tabela studioma_dbsite2016.enquete_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete_usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.enquete_votos
DROP TABLE IF EXISTS `enquete_votos`;
CREATE TABLE IF NOT EXISTS `enquete_votos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_enquete` int(11) NOT NULL,
  `voto1` int(11) NOT NULL,
  `voto2` int(11) NOT NULL,
  `voto3` int(11) NOT NULL,
  `voto4` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Informações dos votos das respectivas enquetes';

-- Copiando dados para a tabela studioma_dbsite2016.enquete_votos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete_votos` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete_votos` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.eventos
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `evento` varchar(50) DEFAULT NULL,
  `data` timestamp NULL DEFAULT NULL,
  `local` varchar(150) DEFAULT NULL,
  `cidadeuf` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `marca_foto` int(11) DEFAULT NULL,
  `destaque` varchar(3) DEFAULT 'nao',
  `fotografo` varchar(250) DEFAULT NULL,
  `qm_cadastr` int(11) DEFAULT NULL,
  `qm_alterou` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evento` (`evento`),
  KEY `url_name` (`url_name`),
  KEY `fk_eventos_qm_cadastr` (`qm_cadastr`),
  KEY `fk_eventos_qm_alterou` (`qm_alterou`),
  CONSTRAINT `fk_eventos_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_eventos_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Armazena informações de cadastro de galerias';

-- Copiando dados para a tabela studioma_dbsite2016.eventos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu_tipo` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `case` varchar(100) NOT NULL,
  `pagina` varchar(150) NOT NULL,
  `ico_menu` varchar(50) NOT NULL DEFAULT '',
  `ativo` char(5) NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id_menu`),
  KEY `fk_menu_id_menutipo` (`id_menu_tipo`),
  CONSTRAINT `fk_menu_id_menu_tipo` FOREIGN KEY (`id_menu_tipo`) REFERENCES `menu_tipo` (`id_menu_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Menu';

-- Copiando dados para a tabela studioma_dbsite2016.menu: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
REPLACE INTO `menu` (`id_menu`, `id_menu_tipo`, `titulo`, `case`, `pagina`, `ico_menu`, `ativo`) VALUES
	(1, 1, 'Usuários', 'usuarios', '#', 'fa-users', 'true'),
	(2, 1, 'TV', 'tvs', '#', 'fa-desktop', 'false'),
	(5, 1, 'Videos', 'videos', '#', 'fa-video-camera', 'true'),
	(14, 1, 'Banners', 'banners', '#', 'fa-photo', 'true');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.menu_sub
DROP TABLE IF EXISTS `menu_sub`;
CREATE TABLE IF NOT EXISTS `menu_sub` (
  `id_menu_sub` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `case` varchar(100) NOT NULL,
  `pagina` varchar(150) NOT NULL,
  `ico_menu` varchar(50) NOT NULL DEFAULT 'fa-angle-double-right',
  PRIMARY KEY (`id_menu_sub`),
  KEY `fkmenu_sub_id_menu` (`id_menu`),
  KEY `idx_menu_sub_titulo` (`titulo`),
  CONSTRAINT `fk_menu_sub_id_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Menu Sub';

-- Copiando dados para a tabela studioma_dbsite2016.menu_sub: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_sub` DISABLE KEYS */;
REPLACE INTO `menu_sub` (`id_menu_sub`, `id_menu`, `titulo`, `case`, `pagina`, `ico_menu`) VALUES
	(1, 1, 'Novo Cadastro', 'usuarios', 'cadastrar', 'fa-angle-double-right'),
	(2, 1, 'Listar Cadastros', 'usuarios', 'listar', 'fa-angle-double-right'),
	(7, 5, 'Novo Cadastro', 'videos', 'cadastrar', 'fa-angle-double-right'),
	(8, 5, 'Listar Cadastros', 'videos', 'listar', 'fa-angle-double-right'),
	(9, 14, 'Novo Cadastro', 'banners', 'cadastrar', 'fa-angle-double-right'),
	(10, 14, 'Listar Cadastros', 'banners', 'listar', 'fa-angle-double-right'),
	(17, 2, 'Novo Cadastro', 'tvs', 'cadastrar', 'fa-angle-double-right'),
	(18, 2, 'Listar Cadastros', 'tvs', 'listar', 'fa-angle-double-right');
/*!40000 ALTER TABLE `menu_sub` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.menu_sub_nav
DROP TABLE IF EXISTS `menu_sub_nav`;
CREATE TABLE IF NOT EXISTS `menu_sub_nav` (
  `id_menu_sub_nav` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu_sub` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `case` varchar(100) NOT NULL,
  `pagina` varchar(150) NOT NULL,
  `ico_menu` varchar(50) NOT NULL DEFAULT 'fa-angle-double-right',
  PRIMARY KEY (`id_menu_sub_nav`),
  KEY `fkmenu_sub_id_menu_sub` (`id_menu_sub`),
  CONSTRAINT `fk_menu_sub_id_menu_sub` FOREIGN KEY (`id_menu_sub`) REFERENCES `menu_sub` (`id_menu_sub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Menu Sub Nav';

-- Copiando dados para a tabela studioma_dbsite2016.menu_sub_nav: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_sub_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_sub_nav` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.menu_tipo
DROP TABLE IF EXISTS `menu_tipo`;
CREATE TABLE IF NOT EXISTS `menu_tipo` (
  `id_menu_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_menu_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Menu Tipo';

-- Copiando dados para a tabela studioma_dbsite2016.menu_tipo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_tipo` DISABLE KEYS */;
REPLACE INTO `menu_tipo` (`id_menu_tipo`, `tipo`) VALUES
	(1, 'painel_adm_sidebar'),
	(2, 'painel_est_sidebar');
/*!40000 ALTER TABLE `menu_tipo` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.newsletter_usuario
DROP TABLE IF EXISTS `newsletter_usuario`;
CREATE TABLE IF NOT EXISTS `newsletter_usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `e-mail` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Usuários cadastrados na newsletter';

-- Copiando dados para a tabela studioma_dbsite2016.newsletter_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `newsletter_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.noticias
DROP TABLE IF EXISTS `noticias`;
CREATE TABLE IF NOT EXISTS `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `subtitulo` varchar(250) DEFAULT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `colunista` int(11) DEFAULT NULL,
  `fonte` varchar(100) DEFAULT NULL,
  `destaque` varchar(3) DEFAULT NULL,
  `destaque_tipo` varchar(50) DEFAULT NULL,
  `noticia` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_fslide` timestamp NULL DEFAULT NULL,
  `video` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `marca_foto` int(11) NOT NULL DEFAULT '0' COMMENT '0=não adiciona marca, 1=adiciona marca',
  `contador` int(11) DEFAULT NULL,
  `coluna` varchar(3) DEFAULT NULL,
  `qm_cadastr` int(11) NOT NULL,
  `qm_alterou` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `titulo` (`titulo`),
  KEY `fk_noticias_colunista` (`colunista`),
  KEY `fk_noticias_qm_cadastr` (`qm_cadastr`),
  KEY `fk_noticias_qm_alterou` (`qm_alterou`),
  KEY `fk_noticias_categoria` (`categoria`),
  CONSTRAINT `fk_noticias_categoria` FOREIGN KEY (`categoria`) REFERENCES `noticias_categoria` (`cat_url`),
  CONSTRAINT `fk_noticias_colunista` FOREIGN KEY (`colunista`) REFERENCES `colunistas` (`id`),
  CONSTRAINT `fk_noticias_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_noticias_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Armazena informações de cadastros de noticias';

-- Copiando dados para a tabela studioma_dbsite2016.noticias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.noticias_categoria
DROP TABLE IF EXISTS `noticias_categoria`;
CREATE TABLE IF NOT EXISTS `noticias_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  `cat_url` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `cat_url` (`cat_url`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categorias das Noticias';

-- Copiando dados para a tabela studioma_dbsite2016.noticias_categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.tv
DROP TABLE IF EXISTS `tv`;
CREATE TABLE IF NOT EXISTS `tv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `aovivo` char(5) NOT NULL DEFAULT 'false',
  `descricao` text NOT NULL,
  `ativo` char(5) NOT NULL DEFAULT 'true',
  `qm_cadastr` int(11) NOT NULL,
  `data_cadastr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(11) DEFAULT NULL,
  `data_alterou` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tv_qm_cadastr` (`qm_cadastr`),
  KEY `fk_tv_qm_alterou` (`qm_alterou`),
  KEY `titulo` (`titulo`),
  KEY `fk_tv_categoria` (`categoria`),
  CONSTRAINT `fk_tv_categoria` FOREIGN KEY (`categoria`) REFERENCES `videos_categoria` (`url_name`),
  CONSTRAINT `fk_tv_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_tv_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Link de Iframe para exibir a TV';

-- Copiando dados para a tabela studioma_dbsite2016.tv: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `data_nasc` date DEFAULT NULL,
  `sexo` int(1) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `ativo` varchar(1) DEFAULT 's',
  `nivel` int(1) DEFAULT NULL,
  `cont_acesso` int(11) unsigned DEFAULT '0',
  `ip` varchar(30) DEFAULT NULL,
  `ultimo_acesso` timestamp NULL DEFAULT NULL,
  `qm_cadastr` int(9) DEFAULT NULL,
  `dt_cadastr` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(9) DEFAULT NULL,
  `dt_alterou` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `id` (`id`),
  KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Armazena informações dos usuarios do painel';

-- Copiando dados para a tabela studioma_dbsite2016.usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
REPLACE INTO `usuarios` (`id`, `url_name`, `nome`, `email`, `data_nasc`, `sexo`, `login`, `senha`, `foto`, `ativo`, `nivel`, `cont_acesso`, `ip`, `ultimo_acesso`, `qm_cadastr`, `dt_cadastr`, `qm_alterou`, `dt_alterou`) VALUES
	(1, 'creative-websites', 'Creative Websites', 'suporte@creativewebsites.com.br', '2015-02-14', 1, 'creative', '19d910ef608e4947aa0c6dcee352a3e8', 'usuarios/2015/03/creative.jpeg', 's', 1, 61, '200.186.30.74', '2016-06-13 12:06:10', 1, NULL, 1, '2015-03-25 21:57:12'),
	(2, 'gregorio-max', 'Gregório Max', 'studiomaxprodutora@gmail.com', '2016-06-13', 1, 'max', '111800a41cdf95eba55df312879f81df', 'usuarios/2016/06/max.png', 's', 1, 53, '138.219.48.103', '2016-06-18 14:32:33', 1, '2016-06-13 12:06:03', NULL, NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.videos
DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(255) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `iframe` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `destaque` varchar(3) NOT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `data` date NOT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `descricao` text NOT NULL,
  `tipo` varchar(5) NOT NULL,
  `data_inicial` timestamp NULL DEFAULT NULL,
  `data_final` timestamp NULL DEFAULT NULL,
  `transmissao` varchar(10) NOT NULL,
  `qm_cadastr` int(9) NOT NULL,
  `dt_cadastr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(9) DEFAULT NULL,
  `dt_alterou` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url_name` (`url_name`),
  KEY `titulo` (`titulo`),
  KEY `fk_videos_qm_cadastr` (`qm_cadastr`),
  KEY `fk_videos_qm_alterou` (`qm_alterou`),
  KEY `fk_videos_categoria` (`categoria`),
  CONSTRAINT `fk_videos_categoria` FOREIGN KEY (`categoria`) REFERENCES `videos_categoria` (`url_name`),
  CONSTRAINT `fk_videos_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_videos_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='Armazena informações de cadastro de videos.';

-- Copiando dados para a tabela studioma_dbsite2016.videos: ~121 rows (aproximadamente)
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
REPLACE INTO `videos` (`id`, `url_name`, `categoria`, `titulo`, `iframe`, `youtube`, `link`, `destaque`, `autor`, `data`, `foto`, `descricao`, `tipo`, `data_inicial`, `data_final`, `transmissao`, `qm_cadastr`, `dt_cadastr`, `qm_alterou`, `dt_alterou`) VALUES
	(3, 'historia-de-superacao-de-daniel-neumann-parte-01', 'saude', 'História de superação de Daniel Neumann Parte 01', NULL, 'https://www.youtube.com/watch?v=CxyYwzdRl18', 'CxyYwzdRl18', 'nao', 'Studio Max TV', '2016-06-03', 'https://i.ytimg.com/vi/CxyYwzdRl18/mqdefault.jpg', '<p>Conhe&ccedil;a a hist&oacute;ria de supera&ccedil;&atilde;o de Daniel&nbsp;</p>\r\n', 'video', NULL, NULL, 'gravada', 1, '2016-06-03 13:28:40', 1, '2016-06-04 00:20:41'),
	(13, 'rotary-clube-lanca-campanha-vote-certo-em-rolim-de-moura', 'politica', 'Rotary Clube lança campanha Vote Certo em Rolim de Moura', NULL, 'https://www.youtube.com/watch?v=oGt1MavqMYA', 'oGt1MavqMYA', 'nao', 'Studio Max TV', '2016-06-03', 'https://i.ytimg.com/vi/oGt1MavqMYA/mqdefault.jpg', '<p>teste de video 2</p>\r\n', 'video', NULL, NULL, 'gravada', 1, '2016-06-03 14:11:03', 1, '2016-06-04 01:16:07'),
	(15, 'setor-de-epidemiologia-alerta-populacao-da-falta-de-soro-antiofidico', 'saude', 'Setor de epidemiologia alerta população da falta de soro antiofídico', NULL, 'https://youtu.be/OiR1j8KlfX8', 'OiR1j8KlfX8', 'nao', 'SBT ROLIM DE MOURA', '2016-06-03', 'https://i.ytimg.com/vi/OiR1j8KlfX8/mqdefault.jpg', '<p>Video Cadastrado</p>\r\n', 'video', NULL, NULL, 'gravada', 1, '2016-06-03 23:03:18', 1, '2016-06-04 01:13:38'),
	(16, 'entrevista-diretor-de-rede-da-tv-allamanda-ivan-leis-fala-da-implantacao-do-sinal-digital-sbt-rolim-de-moura', 'bronca-livre', 'Entrevista: Diretor de Rede da TV Allamanda Ivan Leis fala da implantação do sinal digital SBT Rolim de Moura ', NULL, 'https://youtu.be/JggkzV4GWC8', 'JggkzV4GWC8', 'nao', 'STUDIOMAXTV', '2016-06-13', 'https://i.ytimg.com/vi/JggkzV4GWC8/mqdefault.jpg', '<p>Programa: Bronca Livre<br />\r\nApresentadora: Gislaine Lima</p>\r\n\r\n<p>Switcher: Jheime de Paula<br />\r\nSonoplasta: Jheison de Paula<br />\r\nCinegrafista: Allan Somavila</p>\r\n\r\n<p>Produ&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-13 14:41:29', 2, NULL),
	(17, 'sbt-canal-08-implanta-sinal-digital-em-rolim-de-moura', 'tecnologia', 'SBT Canal 08 implanta sinal digital em Rolim de Moura', NULL, 'http://youtu.be/aSDQjZGyrtc', 'aSDQjZGyrtc', 'nao', 'STUDIOMAXTV', '2016-06-13', 'https://i.ytimg.com/vi/aSDQjZGyrtc/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-13 14:53:19', 2, NULL),
	(18, 'secretarios-da-prefeitura-se-reunem-com-cooperativa-recicoop', 'politica', 'Secretários da prefeitura se reúnem com cooperativa Recicoop', NULL, 'http://youtu.be/YcF9kCIrJDg', 'YcF9kCIrJDg', 'nao', 'STUDIOMAXTV', '2016-06-13', 'https://i.ytimg.com/vi/YcF9kCIrJDg/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-13 14:56:25', 2, NULL),
	(19, 'entrevista-implantacao-do-sinal-digital-sbt-rolim-de-moura', 'tecnologia', 'Entrevista:  Implantação do sinal digital SBT Rolim de Moura', NULL, 'http://youtu.be/JggkzV4GWC8', 'JggkzV4GWC8', 'nao', 'STUDIOMAXTV', '2016-06-13', 'https://i.ytimg.com/vi/JggkzV4GWC8/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-13 14:58:02', 2, NULL),
	(20, 'apos-incendio-apenados-sao-transferidos', 'policia', 'Apos incêndio apenados são transferidos ', NULL, 'http://youtu.be/XkkuEShj9so', 'XkkuEShj9so', 'nao', 'STUDIOMAXTV', '2016-06-13', 'https://i.ytimg.com/vi/XkkuEShj9so/mqdefault.jpg', '<p>Por voltas das 11:00 horas de desta segunda-feira, quatro alojamentos do presidio do Regime Semiaberto de Rolim de Moura foram totalmente consumidos pelo fogo. A unidade prisional fica localizada na Rua Bar&atilde;o de Melga&ccedil;o no bairro Planalto.</p>\r\n\r\n<p>O fogo teve in&iacute;cio simultaneamente nos quatro alojamentos, sendo que anteriormente, alguns dos apenados se queixaram aos Agentes Penitenci&aacute;rios que estavam sem &aacute;gua nas torneiras e logo ap&oacute;s a reivindica&ccedil;&atilde;o os alojamentos foram tomados pelo fogo, o que leva a crer que o ato seja provocado pelos pr&oacute;prios detentos. O Corpo de Bombeiros esteve presente no local e ap&oacute;s alguns minutos debelaram as chamas.</p>\r\n\r\n<p>O fogo destruiu parte da estrutura do teto, parte das paredes,colch&otilde;es e&nbsp;todas as camas&nbsp;. A unidade conta com aproximadamente 70 apenados, que segundo informa&ccedil;&otilde;es, a partir de agora alguns deles ser&atilde;o transferidos para a unidade prisional de Porto Velho e outros&nbsp;poder&atilde;o ser regredidos ao regime fechado da cidade. Ningu&eacute;m se feriu.</p>\r\n\r\n<p>No momento do inc&ecirc;ndio o Agentes Penitenci&aacute;rios de outras unidades de Rolim de Moura estiveram no local para refor&ccedil;ar o efetivo e evitar uma fuga em massa ou at&eacute; mesmo um confronto. Guarni&ccedil;&otilde;es da Pol&iacute;cia Militar tamb&eacute;m estiveram no local para refor&ccedil;ar a seguran&ccedil;a.&nbsp;</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-13 15:01:16', 2, NULL),
	(22, 'prestacao-de-contas-do-observatorio-social-de-rolim-de-moura', 'politica', 'Prestação de contas do Observatório Social de Rolim de Moura ', NULL, 'https://youtu.be/eDxV0Fna8jc', 'eDxV0Fna8jc', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/eDxV0Fna8jc/mqdefault.jpg', '<p>17&ordf; Presta&ccedil;&atilde;o de Contas do Observat&oacute;rio Social de Rolim de Moura<strong> </strong>realizada no Audit&oacute;rio da <strong>ACIRM</strong> - Associa&ccedil;&atilde;o Comercial e Empresarial de Rolim de Moura, <strong>dia 07 de Junho de 2016, &agrave;s 20:00 horas</strong>.</p>\r\n\r\n<p>Foi apresentado &agrave; sociedade rolimourense a Folha de Pagamento e Organograma da Prefeitura e C&acirc;mara Municipal, D&iacute;vidas da Prefeitura e propostas de altera&ccedil;&otilde;es na C&acirc;mara Municipal, al&eacute;m da apresenta&ccedil;&atilde;o das atividades do Observat&oacute;rio Social de Rolim de Moura.&nbsp;</p>\r\n\r\n<p>A Presta&ccedil;&atilde;o de Contas n&atilde;o teve a fala das autoridades, e o evento foi bastante interativo, com espa&ccedil;o aberto para questionamentos e discuss&atilde;o por parte da comunidade.&nbsp;</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 14:46:14', NULL, NULL),
	(23, 'rolim-previ-se-reune-com-comissao-da-camara-municipal', 'politica', 'Rolim Previ se reúne com comissão da Câmara Municipal ', NULL, 'https://youtu.be/EBGHo1Tz9jQ', 'EBGHo1Tz9jQ', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/EBGHo1Tz9jQ/mqdefault.jpg', '<p>Reportagem: S&acirc;mara Souza<br />\r\nImagens: Tayson Maximo<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior e Jheime de Paula<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 14:54:02', NULL, NULL),
	(24, '6-arraia-da-fsp', 'entretenimento', '6º Arraiá da FSP', NULL, 'http://youtu.be/rU9fVAWnmZk', 'rU9fVAWnmZk', 'nao', 'STUDIOMAX TV ', '2016-06-14', 'https://i.ytimg.com/vi/rU9fVAWnmZk/mqdefault.jpg', '<p>Reportagem: Gislaine Lima<br />\r\nImagens: Tayson Maximo<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior e Jheime de Paula<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 14:55:46', NULL, NULL),
	(25, 'colisao-entre-dois-carros-proximo-ao-corpo-de-bombeiros', 'policia', 'Colisão entre dois carros próximo ao corpo de bombeiros', NULL, 'http://youtu.be/TN5OHPZt7d0', 'TN5OHPZt7d0', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/TN5OHPZt7d0/mqdefault.jpg', '<p>Reportagem: S&acirc;mara Souza<br />\r\nImagens: Tayson Maximo<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior e Jheime de Paula<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 14:57:15', NULL, NULL),
	(26, 'acidente-de-transito-no-centro-da-cidade-deixa-uma-pessoa-ferida', 'policia', 'Acidente de trânsito no Centro da cidade deixa uma pessoa ferida', NULL, 'http://youtu.be/Uar85DJZYxY', 'Uar85DJZYxY', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/Uar85DJZYxY/mqdefault.jpg', '<p>Reportagem: S&acirc;mara Souza<br />\r\nImagens: Tayson Maximo<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior e Jheime de Paula<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 14:58:27', NULL, NULL),
	(27, 'jantar-beneficente-ong-mulheres-de-lenco', 'entretenimento', 'Jantar beneficente ONG Mulheres de Lenço', NULL, 'http://youtu.be/2lm477-oMbM', '2lm477', 'nao', 'STUDIOMAX TV', '2016-06-14', 'videos/2016/06/jantar-beneficente-ong-mulheres-de-lenco.jpg', '<p>Reportagem: Gislaine Lima<br />\r\nImagens: Tayson Maximo<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior e Jheime de Paula<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 14:59:23', 2, NULL),
	(28, 'apos-grave-acidente-de-transito-senhora-pede-ajuda-para-tratamento', 'saude', 'Após grave acidente de trânsito senhora pede ajuda para tratamento', NULL, 'http://youtu.be/cPNQjTQw2LE', 'cPNQjTQw2LE', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/cPNQjTQw2LE/mqdefault.jpg', '<p>Reportagem: Gislaine Lima<br />\r\nImagens: Tayson Maximo<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior e Jheime de Paula<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:00:38', NULL, NULL),
	(29, 'escola-priscila-tem-sala-com-mediacao-tecnologica', 'tecnologia', 'Escola Priscila tem sala com mediação tecnológica', NULL, 'http://youtu.be/qRwhSPt2blQ', 'qRwhSPt2blQ', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/qRwhSPt2blQ/mqdefault.jpg', '<p>Reportagem: S&acirc;mara Souza<br />\r\nImagens: Tayson Maximo<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior e Jheime de Paula<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:04:09', NULL, NULL),
	(30, 'programa-pinga-fogo-entrevista-com-o-prefeito-luizao-do-trento-06-02-2016', 'pinga-fogo', 'Programa Pinga Fogo entrevista com o prefeito Luizão do Trento 06/02/2016', NULL, 'http://youtu.be/mw_2o79CSQw', 'mw_2o79CSQw', 'nao', 'STUDIOMAX TV', '2016-06-14', 'videos/2016/06/programa-pinga-fogo-entrevista-com-o-prefeito-luizao-do-trento-06-02-2016-1466202546.png', '<p>Entrevistado: Prefeito Luiz&atilde;o do Trento<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:07:01', 2, NULL),
	(34, 'entrevista-bronca-livre-com-simone-paes-saiba-mais-sobre-a-coleta-do-lixo-e-taxas', 'bronca-livre', 'Entrevista Bronca Livre com Simone Paes : Saiba mais sobre a coleta do lixo e taxas..', NULL, 'http://youtu.be/hwHkpeT1w10', 'hwHkpeT1w10', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/hwHkpeT1w10/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:37:08', NULL, NULL),
	(35, 'entrevista-carreta-de-prevencao-contra-cancer-de-mama-em-rolim-de-moura', 'bronca-livre', 'Entrevista: Carreta de prevenção contra câncer de mama em Rolim de Moura ', NULL, 'https://youtu.be/zWjl59Xx4YA', 'zWjl59Xx4YA', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/zWjl59Xx4YA/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:38:37', NULL, NULL),
	(36, 'nutricionista-da-dicas-de-alimentacao-e-bem-estar-centermed', 'tribuna-livre', 'Nutricionista da dicas de alimentação e bem estar CENTERMED', NULL, 'http://youtu.be/yxSLf1Pmps8', 'yxSLf1Pmps8', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/yxSLf1Pmps8/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:40:42', NULL, NULL),
	(37, 'entrevista-com-otorrinolaringologista-da-centermed', 'tribuna-livre', 'Entrevista com otorrinolaringologista da CENTERMED', NULL, 'https://youtu.be/J3V0rwMOuxc', 'J3V0rwMOuxc', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/J3V0rwMOuxc/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:41:48', NULL, NULL),
	(38, 'entrevista-com-psicologa-da-centermed', 'tribuna-livre', 'Entrevista com psicóloga  da CENTERMED', NULL, 'http://youtu.be/S657TJ1n9ZU', 'S657TJ1n9ZU', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/S657TJ1n9ZU/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:42:46', NULL, NULL),
	(39, 'entrevista-com-fonoaudiologo-centermed', 'tribuna-livre', 'Entrevista com fonoaudiólogo CENTERMED', NULL, 'http://youtu.be/JWfIiVa1D0o', 'JWfIiVa1D0o', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/JWfIiVa1D0o/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:44:09', NULL, NULL),
	(40, '12-corrida-rustica-farmacia-bom-jesus', 'esporte', '12ª Corrida Rústica Farmácia Bom Jesus ', NULL, 'https://youtu.be/F0DfKsyObeU', 'F0DfKsyObeU', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/F0DfKsyObeU/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:45:12', NULL, NULL),
	(41, 'campeonato-estadual-de-corrida-de-kart', 'esporte', 'Campeonato Estadual de Corrida de Kart ', NULL, 'https://youtu.be/-hhcrETZarM', '', 'nao', 'STUDIOMAX TV', '2016-06-14', 'videos/2016/06/campeonato-estadual-de-corrida-de-kart.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:45:55', 2, NULL),
	(42, 'i-corrida-de-jeep-de-rolim-de-moura', 'esporte', 'I Corrida de Jeep de Rolim de Moura ', NULL, 'https://youtu.be/uvgFPK_EzqM', 'uvgFPK_EzqM', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/uvgFPK_EzqM/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:46:41', NULL, NULL),
	(43, '1-passeio-ciclistico-cobras-bike-em-rolim-de-moura', 'esporte', '1º Passeio Ciclistico Cobras Bike em Rolim de Moura ', NULL, 'https://youtu.be/ln1394jVE3o', 'ln1394jVE3o', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/ln1394jVE3o/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:47:51', NULL, NULL),
	(44, 'colombiana-tem-o-objetivo-de-atravessar-a-america-do-sul-de-bicicleta', 'esporte', 'Colombiana tem o objetivo de atravessar a América do Sul de bicicleta', NULL, 'http://youtu.be/yhZB02kL3hc', 'yhZB02kL3hc', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/yhZB02kL3hc/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:49:08', NULL, NULL),
	(45, 'reforma-do-teatro-municipal-ultrapassa-tempo-de-entrega', 'educacao', 'Reforma do Teatro Municipal ultrapassa tempo de entrega ', NULL, 'https://youtu.be/_qDdU46IXrg', '_qDdU46IXrg', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/_qDdU46IXrg/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:51:16', NULL, NULL),
	(46, 'teatro-municipal-passara-por-reforma', 'educacao', 'Teatro Municipal passará por reforma ', NULL, 'https://youtu.be/n9x-zLnvQxw', 'n9x', 'nao', 'STUDIOMAX TV', '2016-06-14', 'videos/2016/06/teatro-municipal-passara-por-reforma-1465930525.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:51:51', 2, NULL),
	(47, 'teatro-de-rolim-de-moura-tem-continuidade-da-reforma', 'educacao', 'Teatro de Rolim de Moura tem continuidade da reforma ', NULL, 'https://youtu.be/Kuw9L0Puw_I', 'Kuw9L0Puw_I', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/Kuw9L0Puw_I/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:52:51', NULL, NULL),
	(48, '5-rolim-gospel-com-show-de-damares', 'religiao', '5º Rolim Gospel com show de Damares', NULL, 'http://youtu.be/GvEf6CAuWUY', 'GvEf6CAuWUY', 'nao', 'STUDIOMAX TV', '2016-06-14', 'videos/2016/06/5-rolim-gospel-com-show-de-damares.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:58:09', NULL, NULL),
	(49, 'igreja-mundial-quinta-feira-da-sagrada-familia', 'religiao', 'Igreja Mundial - QUINTA-FEIRA DA SAGRADA FAMÍLIA ', NULL, 'https://youtu.be/lXJujPCfE6E', 'lXJujPCfE6E', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/lXJujPCfE6E/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 15:59:14', NULL, NULL),
	(51, 'primeira-igreja-batista-de-rolim-de-moura-realiza-cantata-de-pascoa', 'religiao', 'Primeira Igreja Batista de Rolim de Moura realiza cantata de Páscoa ', NULL, 'https://youtu.be/L3JAewKHwHs', 'L3JAewKHwHs', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/L3JAewKHwHs/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:00:48', NULL, NULL),
	(52, 'tapetes-coloridos-marcam-feriado-de-corpus-christi', 'religiao', 'Tapetes coloridos marcam feriado de Corpus Christi ', NULL, 'https://youtu.be/d1rrqF260WA', 'd1rrqF260WA', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/d1rrqF260WA/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:01:54', NULL, NULL),
	(53, 'proprograma-palavra-fato-igreja-batista-23-02-2016-grama-palavra-fato-igreja-batista-23-02-2016', 'palavra-fato', 'PROPROGRAMA PALAVRA FATO - IGREJA BATISTA 23/02/2016 GRAMA PALAVRA FATO - IGREJA BATISTA 23/02/2016 ', NULL, 'http://youtu.be/n2xsP34WGJQ', 'n2xsP34WGJQ', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/n2xsP34WGJQ/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:06:24', NULL, NULL),
	(54, 'programa-palavra-fato-igreja-batista', 'palavra-fato', 'Programa PALAVRA FATO - Igreja Batista ', NULL, 'http://youtu.be/2A5exIwvHG8', '2A5exIwvHG8', 'nao', 'STUDIOMAX TV', '2016-06-14', 'videos/2016/06/programa-palavra-fato-igreja-batista.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:07:45', NULL, NULL),
	(55, 'programa-palavra-fato-igreja-batista-23-01-2016', 'palavra-fato', 'Programa PALAVRA FATO - Igreja Batista 23/01/2016', NULL, 'http://youtu.be/JtfXGcOPbbE', 'JtfXGcOPbbE', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/JtfXGcOPbbE/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:08:57', NULL, NULL),
	(56, 'programa-palavra-fato-igreja-batista-16-01-2016', 'palavra-fato', 'Programa PALAVRA FATO - Igreja Batista 16/01/2016', NULL, 'http://youtu.be/F_pyvH-59eM', 'F_pyvH', 'nao', 'STUDIOMAX TV', '2016-06-14', 'videos/2016/06/programa-palavra-fato-igreja-batista-16-01-2016.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:10:12', 2, NULL),
	(57, 'cer-tem-objetos-furtados-no-final-de-semana', 'policia', 'CER tem objetos furtados no final de semana ', NULL, 'https://youtu.be/7G1mfy6Dhes', '7G1mfy6Dhes', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/7G1mfy6Dhes/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:15:51', NULL, NULL),
	(58, 'secretario-explica-motivo-do-recolhimento-dos-carros-da-saude', 'saude', 'Secretário explica motivo do recolhimento dos carros da saúde ', NULL, 'https://youtu.be/cRwYTTeIwMI', 'cRwYTTeIwMI', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/cRwYTTeIwMI/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:17:15', NULL, NULL),
	(59, 'agentes-penitenciarios-deflagram-greve-a-partir-de-quinta-feira', 'policia', 'Agentes penitenciários deflagram greve a partir de quinta-feira ', NULL, 'https://youtu.be/8LpizJwXN44', '8LpizJwXN44', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/8LpizJwXN44/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:17:58', NULL, NULL),
	(60, 'dia-mundial-do-doador-de-sangue', 'saude', 'Dia Mundial do Doador de Sangue ', NULL, 'https://youtu.be/lB90PJzAyGk', 'lB90PJzAyGk', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/lB90PJzAyGk/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:19:05', NULL, NULL),
	(61, '6-conferencia-nacional-das-cidades', 'politica', '6ª Conferencia Nacional das Cidades', NULL, 'http://youtu.be/lWtgI8EO6Tw', 'lWtgI8EO6Tw', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/lWtgI8EO6Tw/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:20:24', NULL, NULL),
	(62, 'professores-da-educacao-infantil-trocam-experiencia-em-oficinas', 'educacao', 'Professores da educação infantil trocam experiencia em oficinas', NULL, 'http://youtu.be/JfTsNsEz3V0', 'JfTsNsEz3V0', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/JfTsNsEz3V0/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:21:41', NULL, NULL),
	(63, 'unir-realiza-seminario-sobre-desenvolvimento-territorial', 'educacao', 'Unir realiza seminário sobre desenvolvimento territorial ', NULL, 'https://youtu.be/PBwPbT3J3H0', 'PBwPbT3J3H0', 'nao', 'STUDIOMAX TV', '2016-06-14', 'https://i.ytimg.com/vi/PBwPbT3J3H0/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-14 16:23:27', NULL, NULL),
	(67, 'academicos-auxiliam-catadores-na-separacao-de-lixo-reciclavel', 'educacao', 'Acadêmicos auxiliam catadores na separação de lixo reciclável ', NULL, 'https://www.youtube.com/watch?v=1Ch-xRVBN44', '1Ch-xRVBN44', 'nao', 'STUDIOMAX TV', '2016-06-15', 'https://i.ytimg.com/vi/1Ch-xRVBN44/mqdefault.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-15 17:04:49', 2, NULL),
	(68, 'camara-se-reune-com-rolimprevi-para-tratar-de-dividas-do-municipio', 'politica', 'Câmara se reúne com RolimPrevi para tratar de dívidas do município ', NULL, 'https://youtu.be/qGIyoog3vqg', 'qGIyoog3vqg', 'nao', 'STUDIOMAX TV', '2016-06-15', 'https://i.ytimg.com/vi/qGIyoog3vqg/mqdefault.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-15 17:05:51', NULL, NULL),
	(69, 'dia-mundial-do-doador-de-sangue', 'saude', 'Dia mundial do doador de sangue ', NULL, 'https://youtu.be/Pq0pItXa0QE', 'Pq0pItXa0QE', 'nao', 'STUDIOMAX TV', '2016-06-15', 'https://i.ytimg.com/vi/Pq0pItXa0QE/mqdefault.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-15 17:15:19', NULL, NULL),
	(70, 'ultimo-dia-para-pagar-iptu-com-desconto', 'politica', 'Último dia para pagar IPTU com desconto ', NULL, 'https://youtu.be/V0HFwqsWiX0', 'V0HFwqsWiX0', 'nao', 'STUDIOMAX TV', '2016-06-15', 'https://i.ytimg.com/vi/V0HFwqsWiX0/mqdefault.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-15 17:16:20', NULL, NULL),
	(71, 'entrevista-direito-do-trabalho-no-bronca-livre-15-06-2016', 'bronca-livre', 'Entrevista: Direito do Trabalho no Bronca Livre 15/06/2016 ', NULL, 'https://www.youtube.com/watch?v=-tb_Vun_vN4', '-tb_Vun_vN4', 'nao', 'STUDIOMAX TV', '2016-06-15', 'https://i.ytimg.com/vi/-tb_Vun_vN4/mqdefault.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-15 17:18:54', 2, NULL),
	(72, 'setor-de-endemias-paralisa-os-servicos-por-falta-de-condicoes', 'saude', 'Setor de endemias paralisa os serviços por falta de condições ', NULL, 'https://youtu.be/ompmElIxbYY', 'ompmElIxbYY', 'nao', 'STUDIOMAX TV', '2016-06-15', 'https://i.ytimg.com/vi/ompmElIxbYY/mqdefault.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-15 17:28:38', NULL, NULL),
	(73, 'escolinha-rolim-traz-bons-resultados-de-amistoso-contra-atletico-mineiro', 'esporte', 'Escolinha Rolim traz bons resultados de amistoso contra Atlético Mineiro ', NULL, 'https://youtu.be/3w6fBYee0gc', '3w6fBYee0gc', 'nao', 'STUDIOMAX TV', '2016-06-16', 'https://i.ytimg.com/vi/3w6fBYee0gc/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-16 20:03:24', NULL, NULL),
	(74, 'agentes-penitenciarios-iniciam-greve-nesta-quinta-feira', 'policia', 'Agentes penitenciários iniciam greve nesta quinta-feira ', NULL, 'https://youtu.be/MeNTrQv9NNA', 'MeNTrQv9NNA', 'nao', 'STUDIOMAX TV', '2016-06-16', 'https://i.ytimg.com/vi/MeNTrQv9NNA/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-16 20:04:08', NULL, NULL),
	(75, 'dia-internacional-da-crianca-africana', 'educacao', 'Dia Internacional da Criança Africana ', NULL, 'https://youtu.be/MPkOtrZVlZg', 'MPkOtrZVlZg', 'nao', 'STUDIOMAX TV', '2016-06-16', 'https://i.ytimg.com/vi/MPkOtrZVlZg/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-16 20:04:48', NULL, NULL),
	(76, 'populacao-reclama-do-projeto-rolim-cidade-limpa-veja-etapas-do-projeto', 'politica', 'População reclama do projeto Rolim Cidade Limpa: Veja etapas do projeto ', NULL, 'https://youtu.be/aLxzide_uF0', 'aLxzide_uF0', 'nao', 'STUDIOMAX TV', '2016-06-16', 'https://i.ytimg.com/vi/aLxzide_uF0/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-16 20:05:29', NULL, NULL),
	(77, 'resposta-do-prefeito-sobre-reuniao-com-recicoop', 'politica', 'Resposta do prefeito sobre Reunião com Recicoop ', NULL, 'https://youtu.be/LBIfdqspYdA', 'LBIfdqspYdA', 'nao', 'STUDIOMAX TV', '2016-06-16', 'https://i.ytimg.com/vi/LBIfdqspYdA/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-16 20:06:16', NULL, NULL),
	(79, 'entrevista-com-jaqueline-cassol-programa-tribuna-livre', 'tribuna-livre', 'Entrevista com Jaqueline Cassol programa Tribuna Livre ', NULL, 'https://youtu.be/WGvGmgUH4NY', 'WGvGmgUH4NY', 'nao', 'STUDIOMAX TV ', '2016-06-17', 'https://i.ytimg.com/vi/WGvGmgUH4NY/mqdefault.jpg', '<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 11:30:11', NULL, NULL),
	(80, 'festa-do-divino-espirito-santo-comemora-122-anos-de-tradicao-porto-murtinho-ro', 'religiao', 'Festa do Divino Espírito Santo Comemora 122 anos de tradição (Porto Murtinho-RO) ', NULL, 'https://youtu.be/nLec2QATPTY', 'nLec2QATPTY', 'nao', 'STUDIOMAX TV ', '2016-06-17', 'https://i.ytimg.com/vi/nLec2QATPTY/mqdefault.jpg', '<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 11:32:40', NULL, NULL),
	(81, 'tradicoes-e-cultura-da-festa-do-divino-espirito-santo-no-vale-do-guapore-porto-murtinho-ro', 'religiao', 'Tradições e cultura da Festa do Divino Espírito Santo no Vale do Guaporé (Porto Murtinho-RO) ', NULL, 'https://youtu.be/wwtRSKPfg3M', 'wwtRSKPfg3M', 'nao', 'STUDIOMAX TV ', '2016-06-17', 'https://i.ytimg.com/vi/wwtRSKPfg3M/mqdefault.jpg', '<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 11:33:25', NULL, NULL),
	(82, 'tradicoes-da-festa-do-divino-espirito-santo-do-vale-do-guapore-porto-murtinho-ro', 'religiao', 'Tradições da Festa do Divino Espirito Santo do Vale do Guaporé (Porto Murtinho-RO) ', NULL, 'https://youtu.be/Jq8TmkXkEt4', 'Jq8TmkXkEt4', 'nao', 'STUDIOMAX TV ', '2016-06-17', 'https://i.ytimg.com/vi/Jq8TmkXkEt4/mqdefault.jpg', '<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 11:34:07', NULL, NULL),
	(83, 'escolas-participam-de-seminario-de-tecnologia', 'tecnologia', 'Escolas participam de seminário de tecnologia', NULL, 'https://youtu.be/ki24hHZPEmM', 'ki24hHZPEmM', 'nao', 'STUDIOMAX TV ', '2016-06-17', 'https://i.ytimg.com/vi/ki24hHZPEmM/mqdefault.jpg', '<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 11:36:15', NULL, NULL),
	(84, 'semana-nacional-de-tecnologia-para-professores', 'tecnologia', 'Semana Nacional de Tecnologia para professores ', NULL, 'https://youtu.be/KNtSaaBlO28', 'KNtSaaBlO28', 'nao', 'STUDIOMAX TV ', '2016-06-17', 'https://i.ytimg.com/vi/KNtSaaBlO28/mqdefault.jpg', '<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 11:36:58', NULL, NULL),
	(85, '2-gincana-de-jeep-de-rolim-de-moura', 'entretenimento', '2ª Gincana de Jeep de Rolim de Moura', NULL, 'https://youtu.be/rPMzEHblbzw', 'rPMzEHblbzw', 'nao', 'STUDIOMAX TV ', '2016-06-17', 'https://i.ytimg.com/vi/rPMzEHblbzw/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 14:19:44', NULL, NULL),
	(86, 'i-corrida-de-jeep-de-rolim-de-moura', 'entretenimento', 'I Corrida de Jeep de Rolim de Moura ', NULL, 'https://youtu.be/uvgFPK_EzqM', 'uvgFPK_EzqM', 'nao', 'STUDIOMAX TV ', '2016-06-17', 'https://i.ytimg.com/vi/uvgFPK_EzqM/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 14:20:36', NULL, NULL),
	(87, '19-de-junho-dia-do-cinema-brasileiro', 'bronca-livre', '19 de Junho: Dia do Cinema Brasileiro', NULL, 'https://youtu.be/PfDjI5aj8n0', 'PfDjI5aj8n0', 'nao', 'STUDIOMAX TV ', '2016-06-17', 'https://i.ytimg.com/vi/PfDjI5aj8n0/mqdefault.jpg', '                                                <h2>Origem do Dia do Cinema Brasileiro</h2>\r\n\r\n<p>Esta data é comemorada em 19 de junho em homenagem ao dia em que ítalo-brasileiro <strong>Afonso Segreto</strong> – o primeiro cinegrafista e diretor do país – registrou as primeiras imagens em movimento no território brasileiro, em 1898.</p>\r\n\r\n<p>Afonso Segreto fez então imagens da entrada da baía de Guanabara, no Rio de Janeiro, a bordo do navio francês <em>Brésil </em>- a primeira filmagem em território nacional.</p>\r\n                                            ', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 14:37:05', 2, NULL),
	(88, 'escola-do-bairro-jardim-dos-lagos-nao-sai-do-papel', 'tribuna-livre', 'Escola do bairro jardim dos Lagos não sai do PAPEL ', NULL, 'https://youtu.be/CulMe2U9Bp0', 'CulMe2U9Bp0', 'nao', 'STUDIOMAX TV', '2016-06-17', 'https://i.ytimg.com/vi/CulMe2U9Bp0/mqdefault.jpg', '<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 15:01:43', NULL, NULL),
	(89, 'rolimourence-e-vice-campeao-mundial-no-jiu-jitsu', 'esporte', 'Rolimourence é vice-campeão mundial no jiu jitsu ', NULL, 'https://youtu.be/XlipC4xeMDI', 'XlipC4xeMDI', 'nao', 'STUDIOMAX TV', '2016-06-17', 'https://i.ytimg.com/vi/XlipC4xeMDI/mqdefault.jpg', '<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 17:17:18', NULL, NULL),
	(90, 'final-copa-rotary-de-futsal', 'esporte', 'Final Copa Rotary de Futsal ', NULL, 'https://youtu.be/8hhElZobS00', '8hhElZobS00', 'nao', 'STUDIOMAX TV', '2016-06-17', 'https://i.ytimg.com/vi/8hhElZobS00/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 17:18:04', NULL, NULL),
	(91, 'dia-do-cinema-brasileiro-e-celebrado-em-19-de-junho', 'entretenimento', 'Dia do cinema brasileiro é celebrado em 19 de junho ', NULL, 'https://youtu.be/y34pAo7LfcQ', 'y34pAo7LfcQ', 'nao', 'STUDIOMAX TV', '2016-06-17', 'https://i.ytimg.com/vi/y34pAo7LfcQ/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 17:18:42', NULL, NULL),
	(92, 'assista-o-programa-palavra-de-fato-todos-os-sabados-a-partir-das-13h', 'palavra-fato', 'Assista o programa Palavra de Fato todos os sábados à partir das 13h ', NULL, 'https://youtu.be/Mh8gXVWEajc', 'Mh8gXVWEajc', 'nao', 'STUDIOMAX TV', '2016-06-17', 'https://i.ytimg.com/vi/Mh8gXVWEajc/mqdefault.jpg', '<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 19:02:40', NULL, NULL),
	(93, 'entrevista-com-simone-paes-no-programa-pinga-fogo', 'pinga-fogo', 'Entrevista com  SIMONE PAES no programa Pinga Fogo', NULL, 'https://youtu.be/kMcx3AhWWps', 'kMcx3AhWWps', 'nao', 'STUDIOMAX TV', '2016-06-17', 'https://i.ytimg.com/vi/kMcx3AhWWps/mqdefault.jpg', '<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 19:06:33', NULL, NULL),
	(94, 'entrevista-com-francisco-venturini-no-pinga-fogo', 'pinga-fogo', 'Entrevista com Francisco Venturini no Pinga Fogo ', NULL, 'https://youtu.be/7jTcvzdAZ5s', '7jTcvzdAZ5s', 'nao', 'STUDIOMAX TV', '2016-06-17', 'videos/2016/06/entrevista-com-francisco-venturini-no-pinga-fogo.png', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 19:14:57', 2, NULL),
	(95, 'entrevista-com-marcelino-secretario-de-obras-no-pinga-fogo', 'pinga-fogo', 'Entrevista com  Marcelino secretário de Obras no Pinga Fogo', NULL, 'https://youtu.be/cwQCWpSx3Q4', 'cwQCWpSx3Q4', 'nao', 'STUDIOMAX TV', '2016-06-17', 'videos/2016/06/entrevista-com-marcelino-secretario-de-obras-no-pinga-fogo.png', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 19:17:18', 2, NULL),
	(96, 'pinga-fogo-falando-sobre-o-procon', 'pinga-fogo', 'Pinga Fogo falando sobre o PROCON', NULL, 'https://www.youtube.com/watch?v=FPJ-VdUiYxo&feature=youtu.be', 'FPJ-VdUiYxo', 'nao', 'STUDIOMAX TV', '2016-06-17', 'https://i.ytimg.com/vi/FPJ-VdUiYxo/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-17 19:21:04', 2, NULL),
	(101, '7-feira-do-conhecimento-da-escola-aluizio-pinheiro-ferreira', 'educacao', '7ª Feira do Conhecimento da Escola Aluízio Pinheiro Ferreira ', NULL, 'https://youtu.be/wyQ8vSPGaPE', 'wyQ8vSPGaPE', 'nao', 'STUDIOMAX TV', '2016-06-20', 'https://i.ytimg.com/vi/wyQ8vSPGaPE/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-20 16:46:18', NULL, NULL),
	(102, 'audiencia-publica-sobre-plano-de-desenvolvimento-estadual-sustentavel', 'politica', 'Audiência pública sobre Plano de Desenvolvimento Estadual Sustentável ', NULL, 'https://youtu.be/8gvUDWFoDm8', '8gvUDWFoDm8', 'nao', 'STUDIOMAX TV', '2016-06-20', 'https://i.ytimg.com/vi/8gvUDWFoDm8/mqdefault.jpg', '', 'video', NULL, NULL, 'gravada', 2, '2016-06-20 16:47:16', NULL, NULL),
	(103, 'festa-junina-do-colegio-clarice-lispector', 'entretenimento', 'Festa Junina do Colégio Clarice Lispector ', NULL, 'https://youtu.be/k72UWWYbpdU', 'k72UWWYbpdU', 'nao', 'STUDIOMAX TV', '2016-06-20', 'https://i.ytimg.com/vi/k72UWWYbpdU/mqdefault.jpg', '<p>Reportagem: Gislaine Lima<br />\r\nImagens: Tayson Maximo e Jheime de Paula<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior&nbsp;</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-20 16:48:28', NULL, NULL),
	(104, 'festa-junina-da-escola-maria-lira', 'entretenimento', 'Festa Junina da Escola Maria Lira ', NULL, 'https://youtu.be/A4Nkk_bWzLU', 'A4Nkk_bWzLU', 'nao', 'STUDIOMAX TV', '2016-06-20', 'https://i.ytimg.com/vi/A4Nkk_bWzLU/mqdefault.jpg', '<p>Reportagem: S&acirc;mara Souza<br />\r\nImagens: Tayson Maximo e Jheime de Paula<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior&nbsp;<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-20 16:49:23', NULL, NULL),
	(105, 'greve-dos-agentes-penitenciarios-no-estado-de-rondonia', 'policia', 'Greve dos agentes penitenciários no estado de Rondônia ', NULL, 'https://youtu.be/iNl4d_Mks1o', 'iNl4d_Mks1o', 'nao', 'STUDIOMAX TV', '2016-06-20', 'https://i.ytimg.com/vi/iNl4d_Mks1o/mqdefault.jpg', '<p>Reportagem: S&acirc;mara Souza<br />\r\nImagens: Tayson Maximo e Jheime de Paula<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior&nbsp;<br />\r\nProdu&ccedil;&atilde;o: StudioMax&nbsp;</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-20 16:50:36', NULL, NULL),
	(106, 'idosos-fazem-dia-de-lazer-no-balneario-sitio-do-ze', 'entretenimento', 'Idosos fazem dia de lazer no balneário Sitio do Zé ', NULL, 'https://youtu.be/7rx8wJmIqEw', '7rx8wJmIqEw', 'nao', 'STUDIOMAX TV', '2016-06-20', 'https://i.ytimg.com/vi/7rx8wJmIqEw/mqdefault.jpg', '<p>Reportagem: S&acirc;mara Souza<br />\r\nImagens: Edivan Ferreira<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior&nbsp;<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-20 16:51:58', NULL, NULL),
	(107, 'dois-veiculos-capotam-apos-colisao-na-linha-188', 'policia', 'Dois veículos capotam após colisão na linha 188 ', NULL, 'https://youtu.be/R3X9LdaA8xw', 'R3X9LdaA8xw', 'nao', 'STUDIOMAX TV', '2016-06-20', 'https://i.ytimg.com/vi/R3X9LdaA8xw/mqdefault.jpg', '<p>Reportagem: Gislaine Lima<br />\r\nImagens: Cinegrafista Amador<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior&nbsp;<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', NULL, NULL, 'gravada', 2, '2016-06-20 16:52:56', NULL, NULL),
	(109, 'transmissao-ao-vivo-studiomax-tv', 'ao-vivo', 'Transmissão AO VIVO - STUDIOMAX TV', 'https://iframe.dacast.com/b/20748/c/80130', NULL, NULL, 'sim', 'STUDIOMAX TV', '2016-06-27', NULL, '<p>Acompanhe o melhor da TV Online.</p>\r\n\r\n<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n\r\n<p>StudioMax Comunica&ccedil;&atilde;o desde de 2009 atuando no mercado de publicidade produzindo programas de TV, sempre cobrindo eventos importantes,&nbsp; trouxe em&nbsp; janeiro de 2011 em parceria com a TV ALLAMANDA afiliada ao SBT aliado a grade nacional, SBT CANAL 08 que foi ao ar com diversos programas locais feitos com o objetivo de deixar a popula&ccedil;&atilde;o bem informada e em 2015 ELEITA a melhor emissora local pesquisa feita pela associa&ccedil;&atilde;o comercial.</p>\r\n', 'tv', '2016-06-27 08:00:00', '2016-06-28 11:00:00', 'ao-vivo', 2, '2016-06-21 23:06:08', 2, NULL),
	(111, 'arroz-e-feijao-pressionam-a-inflacao', 'educacao', 'Arroz e feijão pressionam a inflação ', NULL, 'https://youtu.be/oWmLEUvBtdY', 'oWmLEUvBtdY', 'nao', 'STUDIOMA TV', '2016-06-21', 'https://i.ytimg.com/vi/oWmLEUvBtdY/mqdefault.jpg', '<p>Reportagem: Gislaine Lima<br />\r\nImagens: Tayson Maximo e Jheime de Paula<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior&nbsp;<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-21 23:36:38', NULL, NULL),
	(112, 'saude-e-sabatinada-na-camara-de-vereadores-de-rolim-de-moura', 'politica', 'Saúde é sabatinada na Câmara de Vereadores de Rolim de Moura ', NULL, 'https://youtu.be/egB78kIePJA', 'egB78kIePJA', 'nao', 'STUDIOMAX TV', '2016-06-21', 'https://i.ytimg.com/vi/egB78kIePJA/mqdefault.jpg', '<p>Reportagem: Gislaine Lima<br />\r\nImagens: Tayson Maximo e Jheime de Paula<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior&nbsp;<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-21 23:37:54', NULL, NULL),
	(113, 'greve-da-singeperon-suspensa-por-30-dias', 'policia', 'Greve da Singeperon suspensa por 30 dias ', NULL, 'https://youtu.be/KEGcLuujVHc', 'KEGcLuujVHc', 'nao', 'STUDIOMAX TV', '2016-06-21', 'https://i.ytimg.com/vi/KEGcLuujVHc/mqdefault.jpg', '<p>Reportagem: Gislaine Lima<br />\r\nImagens: Tayson Maximo e Jheime de Paula<br />\r\nEdi&ccedil;&atilde;o: Mayke J&uacute;nior&nbsp;<br />\r\nProdu&ccedil;&atilde;o: StudioMax Comunica&ccedil;&atilde;o e Marketing</p>\r\n', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-21 23:38:45', NULL, NULL),
	(114, 'comitiva-leva-1200-cabecas-de-gado-de-rolim-de-moura-a-chupinguaia', 'tribuna-livre', 'Comitiva leva 1200 cabeças de gado de Rolim de Moura à Chupinguaia ', NULL, 'https://youtu.be/6sj92l5POBg', '6sj92l5POBg', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/6sj92l5POBg/mqdefault.jpg', '', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 09:33:17', NULL, NULL),
	(115, 'eleicao-para-a-nova-diretoria-do-observatorio-social-de-rolim-de-moura', 'politica', 'Eleição para a nova diretoria do Observatório Social de Rolim de Moura ', NULL, 'https://youtu.be/4L_3t9EsWOY', '4L_3t9EsWOY', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/4L_3t9EsWOY/mqdefault.jpg', '', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 09:34:00', NULL, NULL),
	(116, 'populacao-reclama-de-dejetos-jogados-na-rua', 'politica', 'População reclama de dejetos jogados na rua ', NULL, 'https://youtu.be/D6nrbN1DhU4', 'D6nrbN1DhU4', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/D6nrbN1DhU4/mqdefault.jpg', '', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 09:35:00', NULL, NULL),
	(117, 'usina-de-asfalto-recebe-vistoria', 'politica', 'Usina de asfalto recebe vistoria ', NULL, 'https://youtu.be/OoUuljBwXjc', 'OoUuljBwXjc', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/OoUuljBwXjc/mqdefault.jpg', '', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 09:36:01', NULL, NULL),
	(118, 'eleicoes-2016-candidatos-devem-ficar-atentos-aos-gastos-na-campanha', 'politica', 'Eleições 2016: Candidatos devem ficar atentos aos gastos na campanha ', NULL, 'https://youtu.be/GLJ7hbFe80c', 'GLJ7hbFe80c', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/GLJ7hbFe80c/mqdefault.jpg', '', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 09:36:36', NULL, NULL),
	(119, 'comitiva-leva-1200-cabecas-de-gado-de-rolim-a-chupinguaia-parte-02', 'bronca-livre', 'Comitiva leva 1200 cabeças de gado de Rolim à Chupinguaia Parte 02 ', NULL, 'https://youtu.be/3b35ctUr4gs', '3b35ctUr4gs', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/3b35ctUr4gs/mqdefault.jpg', '', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 09:37:16', NULL, NULL),
	(120, 'entram-em-vigor-novas-regras-sobre-parto-cesariano-na-saude-suplementar', 'saude', 'Entram em vigor novas regras sobre parto cesariano na saúde suplementar ', NULL, 'https://youtu.be/tXIsidD82fA', 'tXIsidD82fA', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/tXIsidD82fA/mqdefault.jpg', '', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 09:37:58', NULL, NULL),
	(121, 'frei-explica-significado-de-festa-junina', 'religiao', 'Frei explica significado de festa junina ', NULL, 'https://youtu.be/a9nD8dG6wM4', 'a9nD8dG6wM4', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/a9nD8dG6wM4/mqdefault.jpg', '', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 09:38:59', NULL, NULL),
	(127, 'comitiva-leva-1200-cabecas-de-gado-de-rolim-a-chupinguaia-parte-02', 'ao-vivo', ' Comitiva leva 1200 cabeças de gado de Rolim à Chupinguaia Parte 02 ', NULL, 'https://youtu.be/3b35ctUr4gs', '3b35ctUr4gs', 'nao', 'STUDIOMAX TV  ', '2016-06-25', 'https://i.ytimg.com/vi/3b35ctUr4gs/mqdefault.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n\r\n<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n\r\n<p>StudioMax Comunica&ccedil;&atilde;o desde de 2009 atuando no mercado de publicidade produzindo programas de TV, sempre cobrindo eventos importantes,&nbsp; trouxe em&nbsp; janeiro de 2011 em parceria com a TV ALLAMANDA afiliada ao SBT aliado a grade nacional, SBT CANAL 08 que foi ao ar com diversos programas locais feitos com o objetivo de deixar a popula&ccedil;&atilde;o bem informada. S&oacute; not&iacute;cias, entrevistas, apresenta&ccedil;&otilde;es musicais, coberturas de eventos, tudo com a qualidade e a rapidez que voc&ecirc; necessita para estar sempre antenada com a realidade da regi&bdquo;o da Zona da Mata, em 2015 ELEITA a melhor emissora local pesquisa feita pela associa&ccedil;&atilde;o comercial.</p>\r\n', 'video', '2016-06-25 08:20:00', '2016-06-26 10:00:00', 'gravada', 2, '2016-06-25 09:40:26', 2, NULL),
	(128, 'especial-festa-junina-doce-do-japones', 'entretenimento', 'Especial Festa Junina: Doce do Japonês ', NULL, 'https://youtu.be/a7qlIf2Xfmg', 'a7qlIf2Xfmg', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/a7qlIf2Xfmg/mqdefault.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n\r\n<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n\r\n<p>StudioMax Comunica&ccedil;&atilde;o desde de 2009 atuando no mercado de publicidade produzindo programas de TV, sempre cobrindo eventos importantes,&nbsp; trouxe em&nbsp; janeiro de 2011 em parceria com a TV ALLAMANDA afiliada ao SBT aliado a grade nacional, SBT CANAL 08 que foi ao ar com diversos programas locais feitos com o objetivo de deixar a popula&ccedil;&atilde;o bem informada. S&oacute; not&iacute;cias, entrevistas, apresenta&ccedil;&otilde;es musicais, coberturas de eventos, tudo com a qualidade e a rapidez que voc&ecirc; necessita para estar sempre antenada com a realidade da regi&bdquo;o da Zona da Mata, em 2015 ELEITA a melhor emissora local pesquisa feita pela associa&ccedil;&atilde;o comercial.</p>\r\n', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 10:02:23', NULL, NULL),
	(129, 'especial-festa-junina-promocoes-do-santa-helena', 'entretenimento', 'Especial Festa Junina: Promoções do Santa Helena ', NULL, 'https://youtu.be/AFUZ7bNmQ0Y', 'AFUZ7bNmQ0Y', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/AFUZ7bNmQ0Y/mqdefault.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n\r\n<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n\r\n<p>StudioMax Comunica&ccedil;&atilde;o desde de 2009 atuando no mercado de publicidade produzindo programas de TV, sempre cobrindo eventos importantes,&nbsp; trouxe em&nbsp; janeiro de 2011 em parceria com a TV ALLAMANDA afiliada ao SBT aliado a grade nacional, SBT CANAL 08 que foi ao ar com diversos programas locais feitos com o objetivo de deixar a popula&ccedil;&atilde;o bem informada. S&oacute; not&iacute;cias, entrevistas, apresenta&ccedil;&otilde;es musicais, coberturas de eventos, tudo com a qualidade e a rapidez que voc&ecirc; necessita para estar sempre antenada com a realidade da regi&bdquo;o da Zona da Mata, em 2015 ELEITA a melhor emissora local pesquisa feita pela associa&ccedil;&atilde;o comercial.</p>\r\n', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 10:03:24', NULL, NULL),
	(131, 'especial-festa-junina-promocoes-o-panelao', 'entretenimento', 'Especial Festa Junina: Promoções O Panelão ', NULL, 'https://youtu.be/8lS4IQg7ozk', '8lS4IQg7ozk', 'nao', 'STUDIOMAX TV', '2016-06-25', 'videos/2016/06/especial-festa-junina-promocoes-o-panelao.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n\r\n<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n\r\n<p>StudioMax Comunica&ccedil;&atilde;o desde de 2009 atuando no mercado de publicidade produzindo programas de TV, sempre cobrindo eventos importantes,&nbsp; trouxe em&nbsp; janeiro de 2011 em parceria com a TV ALLAMANDA afiliada ao SBT aliado a grade nacional, SBT CANAL 08 que foi ao ar com diversos programas locais feitos com o objetivo de deixar a popula&ccedil;&atilde;o bem informada. S&oacute; not&iacute;cias, entrevistas, apresenta&ccedil;&otilde;es musicais, coberturas de eventos, tudo com a qualidade e a rapidez que voc&ecirc; necessita para estar sempre antenada com a realidade da regi&bdquo;o da Zona da Mata, em 2015 ELEITA a melhor emissora local pesquisa feita pela associa&ccedil;&atilde;o comercial.</p>\r\n', 'video', '2000-11-30 10:00:00', '2000-11-30 10:00:00', 'gravada', 2, '2016-06-25 10:16:46', 2, NULL),
	(132, 'especial-festa-junina-promocoes-laranjas-rolim', 'entretenimento', 'Especial Festa Junina: Promoções Laranjas Rolim', NULL, 'https://youtu.be/p2eybM8HA8I', 'p2eybM8HA8I', 'nao', 'STUDIOMAX TV', '2016-06-25', 'videos/2016/06/especial-festa-junina-promocoes-laranjas-rolim.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n\r\n<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n\r\n<p>StudioMax Comunica&ccedil;&atilde;o desde de 2009 atuando no mercado de publicidade produzindo programas de TV, sempre cobrindo eventos importantes,&nbsp; trouxe em&nbsp; janeiro de 2011 em parceria com a TV ALLAMANDA afiliada ao SBT aliado a grade nacional, SBT CANAL 08 que foi ao ar com diversos programas locais feitos com o objetivo de deixar a popula&ccedil;&atilde;o bem informada. S&oacute; not&iacute;cias, entrevistas, apresenta&ccedil;&otilde;es musicais, coberturas de eventos, tudo com a qualidade e a rapidez que voc&ecirc; necessita para estar sempre antenada com a realidade da regi&bdquo;o da Zona da Mata, em 2015 ELEITA a melhor emissora local pesquisa feita pela associa&ccedil;&atilde;o comercial.</p>\r\n', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 10:21:14', NULL, NULL),
	(133, 'programa-especial-de-sao-joao-24-06-2016', 'bronca-livre', 'Programa Especial de São João (24-06-2016) ', NULL, 'https://youtu.be/wq7nSkALFf0', 'wq7nSkALFf0', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/wq7nSkALFf0/mqdefault.jpg', '<p>Acompanhe o melhor da TV Online.</p>\r\n\r\n<p>ACOMPANHE NO CANAL 39 EM HD</p>\r\n\r\n<p>StudioMax Comunica&ccedil;&atilde;o desde de 2009 atuando no mercado de publicidade produzindo programas de TV, sempre cobrindo eventos importantes,&nbsp; trouxe em&nbsp; janeiro de 2011 em parceria com a TV ALLAMANDA afiliada ao SBT aliado a grade nacional, SBT CANAL 08 em 2015 ELEITA a melhor emissora local pesquisa feita pela associa&ccedil;&atilde;o comercial.</p>\r\n', 'video', '2016-06-25 16:00:00', '2016-06-27 09:55:00', 'ao-vivo', 2, '2016-06-25 17:30:36', 2, NULL),
	(134, 'plano-de-desenvolvimento-estadual-sustentavel-pdes-ro-2015-2030', 'politica', 'Plano de desenvolvimento Estadual sustentável - PDES/RO 2015-2030.', NULL, 'https://youtu.be/kuJEm3QoZLE', 'kuJEm3QoZLE', 'nao', 'STUDIOMAX TV', '2016-06-25', 'https://i.ytimg.com/vi/kuJEm3QoZLE/mqdefault.jpg', '', 'video', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'gravada', 2, '2016-06-25 21:26:53', NULL, NULL);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.videos_categoria
DROP TABLE IF EXISTS `videos_categoria`;
CREATE TABLE IF NOT EXISTS `videos_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_name` (`url_name`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Categorias de Videos';

-- Copiando dados para a tabela studioma_dbsite2016.videos_categoria: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `videos_categoria` DISABLE KEYS */;
REPLACE INTO `videos_categoria` (`id`, `url_name`, `categoria`, `color`) VALUES
	(1, 'educacao', 'Educação', 'blue2'),
	(2, 'entretenimento', 'Entretenimento', 'purple'),
	(3, 'esporte', 'Esporte', 'green2'),
	(4, 'policia', 'Policía', 'red'),
	(5, 'politica', 'Política', 'blue'),
	(6, 'bronca-livre', 'Bronca Livre', 'red2'),
	(7, 'tribuna-livre', 'Tribuna Livre', 'purple2'),
	(8, 'saude', 'Saúde', 'orange'),
	(9, 'ao-vivo', 'Ao Vivo', 'gray'),
	(10, 'pinga-fogo', 'Pinga Fogo', 'orange'),
	(11, 'palavra-fato', 'Palavra de Fato', 'red2'),
	(13, 'religiao', 'Religião', 'blue2'),
	(14, 'tecnologia', 'Tecnologia', 'green');
/*!40000 ALTER TABLE `videos_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.ws_siteviews
DROP TABLE IF EXISTS `ws_siteviews`;
CREATE TABLE IF NOT EXISTS `ws_siteviews` (
  `siteviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `siteviews_date` date NOT NULL,
  `siteviews_users` decimal(10,0) NOT NULL,
  `siteviews_views` decimal(10,0) NOT NULL,
  `siteviews_pages` decimal(10,0) NOT NULL,
  PRIMARY KEY (`siteviews_id`),
  KEY `idx_1` (`siteviews_date`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela studioma_dbsite2016.ws_siteviews: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews` DISABLE KEYS */;
REPLACE INTO `ws_siteviews` (`siteviews_id`, `siteviews_date`, `siteviews_users`, `siteviews_views`, `siteviews_pages`) VALUES
	(1, '2016-05-24', 1, 1, 3),
	(2, '2016-05-26', 1, 1, 11),
	(3, '2016-05-27', 1, 1, 3),
	(4, '2016-05-28', 1, 1, 30),
	(5, '2016-05-31', 1, 1, 173),
	(6, '2016-06-01', 1, 1, 145),
	(7, '2016-06-02', 1, 1, 1),
	(8, '2016-06-13', 40, 50, 144),
	(9, '2016-06-14', 234, 247, 478),
	(10, '2016-06-15', 123, 163, 443),
	(11, '2016-06-16', 213, 259, 833),
	(12, '2016-06-17', 76, 104, 260),
	(13, '2016-06-18', 69, 100, 149),
	(14, '2016-06-19', 50, 57, 101),
	(15, '2016-06-20', 49, 57, 196),
	(16, '2016-06-21', 50, 55, 152),
	(17, '2016-06-22', 37, 40, 76),
	(18, '2016-06-23', 48, 53, 88),
	(19, '2016-06-24', 22, 23, 40),
	(20, '2016-06-25', 32, 36, 89),
	(21, '2016-06-26', 42, 43, 84),
	(22, '2016-06-27', 33, 34, 80);
/*!40000 ALTER TABLE `ws_siteviews` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.ws_siteviews_agent
DROP TABLE IF EXISTS `ws_siteviews_agent`;
CREATE TABLE IF NOT EXISTS `ws_siteviews_agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `agent_views` decimal(10,0) NOT NULL,
  PRIMARY KEY (`agent_id`),
  KEY `idx_1` (`agent_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela studioma_dbsite2016.ws_siteviews_agent: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews_agent` DISABLE KEYS */;
REPLACE INTO `ws_siteviews_agent` (`agent_id`, `agent_name`, `agent_views`) VALUES
	(1, 'Chrome', 828),
	(2, 'IE', 14),
	(3, 'Firefox', 37),
	(4, 'Outros', 449);
/*!40000 ALTER TABLE `ws_siteviews_agent` ENABLE KEYS */;

-- Copiando estrutura para tabela studioma_dbsite2016.ws_siteviews_online
DROP TABLE IF EXISTS `ws_siteviews_online`;
CREATE TABLE IF NOT EXISTS `ws_siteviews_online` (
  `online_id` int(11) NOT NULL AUTO_INCREMENT,
  `online_session` varchar(255) CHARACTER SET latin1 NOT NULL,
  `online_startview` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `online_endview` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online_ip` varchar(255) CHARACTER SET latin1 NOT NULL,
  `online_url` varchar(255) CHARACTER SET latin1 NOT NULL,
  `online_agent` varchar(255) CHARACTER SET latin1 NOT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`online_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1404 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela studioma_dbsite2016.ws_siteviews_online: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews_online` DISABLE KEYS */;
REPLACE INTO `ws_siteviews_online` (`online_id`, `online_session`, `online_startview`, `online_endview`, `online_ip`, `online_url`, `online_agent`, `agent_name`) VALUES
	(1403, '45b036914ff974da4960d139b8a6b88d', '2016-06-27 19:18:52', '2016-06-27 19:38:53', '181.88.177.170', '/404', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'Chrome');
/*!40000 ALTER TABLE `ws_siteviews_online` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
