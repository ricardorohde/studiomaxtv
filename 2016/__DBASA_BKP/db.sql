-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.1.8-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.5086
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela _studiomaxtv_2016.banco_fotos
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

-- Copiando dados para a tabela _studiomaxtv_2016.banco_fotos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `banco_fotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco_fotos` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.banners
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Armazena informações sobre banners de publicidade';

-- Copiando dados para a tabela _studiomaxtv_2016.banners: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
REPLACE INTO `banners` (`id`, `titulo`, `banner`, `tipo`, `link`, `data_inicial`, `data_final`, `data_atual`, `qm_cadastr`, `qm_alterou`) VALUES
	(1, 'Slide 1', 'banners/2016/05/slide-1.jpg', 1, '#', '2016-05-23', '2016-12-31', '2016-05-23 23:55:32', 1, NULL),
	(2, 'Slide 2', 'banners/2016/05/slide-2.jpg', 1, '#', '2016-05-23', '2016-12-31', '2016-05-23 23:58:36', 1, NULL),
	(3, 'Slide 3', 'banners/2016/05/slide-3.jpg', 1, '#', '2016-05-23', '2016-12-31', '2016-05-23 23:59:00', 1, NULL);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.banners_tipo
DROP TABLE IF EXISTS `banners_tipo`;
CREATE TABLE IF NOT EXISTS `banners_tipo` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `dimens_w` varchar(50) NOT NULL,
  `dimens_h` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tipos de banners';

-- Copiando dados para a tabela _studiomaxtv_2016.banners_tipo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `banners_tipo` DISABLE KEYS */;
REPLACE INTO `banners_tipo` (`id_tipo`, `tipo`, `dimens_w`, `dimens_h`) VALUES
	(1, 'slide', '1920', '480');
/*!40000 ALTER TABLE `banners_tipo` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.colunistas
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

-- Copiando dados para a tabela _studiomaxtv_2016.colunistas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `colunistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `colunistas` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.cotacao
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

-- Copiando dados para a tabela _studiomaxtv_2016.cotacao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cotacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotacao` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.enquete
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

-- Copiando dados para a tabela _studiomaxtv_2016.enquete: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.enquete_usuario
DROP TABLE IF EXISTS `enquete_usuario`;
CREATE TABLE IF NOT EXISTS `enquete_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_enquete` int(11) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registrar os usuários que votaram';

-- Copiando dados para a tabela _studiomaxtv_2016.enquete_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete_usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.enquete_votos
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

-- Copiando dados para a tabela _studiomaxtv_2016.enquete_votos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `enquete_votos` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquete_votos` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.eventos
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

-- Copiando dados para a tabela _studiomaxtv_2016.eventos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.menu
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

-- Copiando dados para a tabela _studiomaxtv_2016.menu: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
REPLACE INTO `menu` (`id_menu`, `id_menu_tipo`, `titulo`, `case`, `pagina`, `ico_menu`, `ativo`) VALUES
	(1, 1, 'Usuários', 'usuarios', '#', 'fa-users', 'true'),
	(2, 1, 'TV', 'tvs', '#', 'fa-desktop', 'false'),
	(5, 1, 'Videos', 'videos', '#', 'fa-video-camera', 'true'),
	(14, 1, 'Banners', 'banners', '#', 'fa-photo', 'true');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.menu_sub
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

-- Copiando dados para a tabela _studiomaxtv_2016.menu_sub: ~8 rows (aproximadamente)
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

-- Copiando estrutura para tabela _studiomaxtv_2016.menu_sub_nav
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

-- Copiando dados para a tabela _studiomaxtv_2016.menu_sub_nav: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_sub_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_sub_nav` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.menu_tipo
DROP TABLE IF EXISTS `menu_tipo`;
CREATE TABLE IF NOT EXISTS `menu_tipo` (
  `id_menu_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_menu_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Menu Tipo';

-- Copiando dados para a tabela _studiomaxtv_2016.menu_tipo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `menu_tipo` DISABLE KEYS */;
REPLACE INTO `menu_tipo` (`id_menu_tipo`, `tipo`) VALUES
	(1, 'painel_adm_sidebar'),
	(2, 'painel_est_sidebar');
/*!40000 ALTER TABLE `menu_tipo` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.newsletter_usuario
DROP TABLE IF EXISTS `newsletter_usuario`;
CREATE TABLE IF NOT EXISTS `newsletter_usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `e-mail` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Usuários cadastrados na newsletter';

-- Copiando dados para a tabela _studiomaxtv_2016.newsletter_usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `newsletter_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletter_usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.noticias
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

-- Copiando dados para a tabela _studiomaxtv_2016.noticias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.noticias_categoria
DROP TABLE IF EXISTS `noticias_categoria`;
CREATE TABLE IF NOT EXISTS `noticias_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  `cat_url` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `cat_url` (`cat_url`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Categorias das Noticias';

-- Copiando dados para a tabela _studiomaxtv_2016.noticias_categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `noticias_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.tv
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

-- Copiando dados para a tabela _studiomaxtv_2016.tv: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.usuarios
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Armazena informações dos usuarios do painel';

-- Copiando dados para a tabela _studiomaxtv_2016.usuarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
REPLACE INTO `usuarios` (`id`, `url_name`, `nome`, `email`, `data_nasc`, `sexo`, `login`, `senha`, `foto`, `ativo`, `nivel`, `cont_acesso`, `ip`, `ultimo_acesso`, `qm_cadastr`, `dt_cadastr`, `qm_alterou`, `dt_alterou`) VALUES
	(1, 'creative-websites', 'Creative Websites', 'suporte@creativewebsites.com.br', '2015-02-14', 1, 'creative', '19d910ef608e4947aa0c6dcee352a3e8', 'usuarios/2015/03/creative.jpeg', 's', 1, 58, '::1', '2015-02-13 22:33:25', 1, NULL, 1, '2015-03-25 21:57:12');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.videos
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
  `transmissao` varchar(10) NOT NULL,
  `qm_cadastr` int(9) NOT NULL,
  `dt_cadastr` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qm_alterou` int(9) DEFAULT NULL,
  `dt_alterou` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `url_name` (`url_name`),
  KEY `titulo` (`titulo`),
  KEY `fk_videos_qm_cadastr` (`qm_cadastr`),
  KEY `fk_videos_qm_alterou` (`qm_alterou`),
  KEY `fk_videos_categoria` (`categoria`),
  CONSTRAINT `fk_videos_categoria` FOREIGN KEY (`categoria`) REFERENCES `videos_categoria` (`url_name`),
  CONSTRAINT `fk_videos_qm_alterou` FOREIGN KEY (`qm_alterou`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_videos_qm_cadastr` FOREIGN KEY (`qm_cadastr`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Armazena informações de cadastro de videos.';

-- Copiando dados para a tabela _studiomaxtv_2016.videos: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
REPLACE INTO `videos` (`id`, `url_name`, `categoria`, `titulo`, `iframe`, `youtube`, `link`, `destaque`, `autor`, `data`, `foto`, `descricao`, `tipo`, `transmissao`, `qm_cadastr`, `dt_cadastr`, `qm_alterou`, `dt_alterou`) VALUES
	(3, 'historia-de-superacao-de-daniel-neumann-parte-01', 'saude', 'História de superação de Daniel Neumann Parte 01', NULL, 'https://www.youtube.com/watch?v=CxyYwzdRl18', 'CxyYwzdRl18', 'nao', 'Studio Max TV', '2016-06-03', 'https://i.ytimg.com/vi/CxyYwzdRl18/mqdefault.jpg', '<p>Conhe&ccedil;a a hist&oacute;ria de supera&ccedil;&atilde;o de Daniel&nbsp;</p>\r\n', 'video', 'gravada', 1, '2016-06-03 13:28:40', 1, '2016-06-04 00:20:41'),
	(13, 'rotary-clube-lanca-campanha-vote-certo-em-rolim-de-moura', 'politica', 'Rotary Clube lança campanha Vote Certo em Rolim de Moura', NULL, 'https://www.youtube.com/watch?v=oGt1MavqMYA', 'oGt1MavqMYA', 'nao', 'Studio Max TV', '2016-06-03', 'https://i.ytimg.com/vi/oGt1MavqMYA/mqdefault.jpg', '<p>teste de video 2</p>\r\n', 'video', 'gravada', 1, '2016-06-03 14:11:03', 1, '2016-06-04 01:16:07'),
	(14, 'transmissao-ao-vivo-studio-max-tv', 'ao-vivo', 'Transmissão AO VIVO - Studio Max TV', 'https://iframe.dacast.com/b/20748/c/219949', NULL, NULL, 'sim', 'Studio Max TV', '2016-06-03', 'videos/2016/06/transmissao-ao-vivo-studio-max-tv-1465015517.png', '<p>Acompanhe o melhor da TV Online.</p>\r\n', 'tv', 'ao-vivo', 1, '2016-06-03 19:45:35', 1, '2016-06-04 00:45:17'),
	(15, 'setor-de-epidemiologia-alerta-populacao-da-falta-de-soro-antiofidico', 'saude', 'Setor de epidemiologia alerta população da falta de soro antiofídico', NULL, 'https://youtu.be/OiR1j8KlfX8', 'OiR1j8KlfX8', 'nao', 'SBT ROLIM DE MOURA', '2016-06-03', 'https://i.ytimg.com/vi/OiR1j8KlfX8/mqdefault.jpg', '<p>Video Cadastrado</p>\r\n', 'video', 'gravada', 1, '2016-06-03 23:03:18', 1, '2016-06-04 01:13:38');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.videos_categoria
DROP TABLE IF EXISTS `videos_categoria`;
CREATE TABLE IF NOT EXISTS `videos_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_name` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_name` (`url_name`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Categorias de Videos';

-- Copiando dados para a tabela _studiomaxtv_2016.videos_categoria: ~9 rows (aproximadamente)
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
	(9, 'ao-vivo', 'Ao Vivo', 'gray');
/*!40000 ALTER TABLE `videos_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.ws_siteviews
DROP TABLE IF EXISTS `ws_siteviews`;
CREATE TABLE IF NOT EXISTS `ws_siteviews` (
  `siteviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `siteviews_date` date NOT NULL,
  `siteviews_users` decimal(10,0) NOT NULL,
  `siteviews_views` decimal(10,0) NOT NULL,
  `siteviews_pages` decimal(10,0) NOT NULL,
  PRIMARY KEY (`siteviews_id`),
  KEY `idx_1` (`siteviews_date`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _studiomaxtv_2016.ws_siteviews: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews` DISABLE KEYS */;
REPLACE INTO `ws_siteviews` (`siteviews_id`, `siteviews_date`, `siteviews_users`, `siteviews_views`, `siteviews_pages`) VALUES
	(1, '2016-05-24', 1, 1, 3),
	(2, '2016-05-26', 1, 1, 11),
	(3, '2016-05-27', 1, 1, 3),
	(4, '2016-05-28', 1, 1, 30),
	(5, '2016-05-31', 1, 1, 173),
	(6, '2016-06-01', 1, 1, 145),
	(7, '2016-06-02', 1, 1, 1);
/*!40000 ALTER TABLE `ws_siteviews` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.ws_siteviews_agent
DROP TABLE IF EXISTS `ws_siteviews_agent`;
CREATE TABLE IF NOT EXISTS `ws_siteviews_agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `agent_views` decimal(10,0) NOT NULL,
  PRIMARY KEY (`agent_id`),
  KEY `idx_1` (`agent_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _studiomaxtv_2016.ws_siteviews_agent: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews_agent` DISABLE KEYS */;
REPLACE INTO `ws_siteviews_agent` (`agent_id`, `agent_name`, `agent_views`) VALUES
	(1, 'Chrome', 6),
	(2, 'IE', 1);
/*!40000 ALTER TABLE `ws_siteviews_agent` ENABLE KEYS */;

-- Copiando estrutura para tabela _studiomaxtv_2016.ws_siteviews_online
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela _studiomaxtv_2016.ws_siteviews_online: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `ws_siteviews_online` DISABLE KEYS */;
REPLACE INTO `ws_siteviews_online` (`online_id`, `online_session`, `online_startview`, `online_endview`, `online_ip`, `online_url`, `online_agent`, `agent_name`) VALUES
	(12, '7uc7teata01te5muehtsee1346', '2016-06-03 17:58:29', '2016-06-04 01:36:57', '::1', '/servidor/studiomaxtv/2016/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2751.0 Safari/537.36', 'Chrome');
/*!40000 ALTER TABLE `ws_siteviews_online` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
