/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 10.4.24-MariaDB : Database - gogames_videojuegos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gogames_videojuegos` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `gogames_videojuegos`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `categorias` */

insert  into `categorias`(`id`,`tipo`) values 
(1,'Accion'),
(2,'Aventura'),
(3,'Deportes'),
(4,'Rol'),
(5,'Plataformas'),
(6,'Simulacion');

/*Table structure for table `comentarios_valoracion` */

DROP TABLE IF EXISTS `comentarios_valoracion`;

CREATE TABLE `comentarios_valoracion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `puntaje` int(11) NOT NULL,
  `fk_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK58ed9wfrh6t5bl2ulcoc6t1bn` (`fk_usuario`),
  CONSTRAINT `FK58ed9wfrh6t5bl2ulcoc6t1bn` FOREIGN KEY (`fk_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `comentarios_valoracion` */

insert  into `comentarios_valoracion`(`id`,`comentario`,`puntaje`,`fk_usuario`) values 
(1,'Un juego Increible!',10,1),
(2,'El juego corre mal en mi pc..',6,1),
(3,'Este juego es una obra de arte!',10,1),
(4,'El juego divertido pero muy dificil',8,4),
(5,'Guau que buen juego',9,4),
(6,'el juego no me gusto',2,2);

/*Table structure for table `compras` */

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_de_compra` datetime NOT NULL,
  `precio_total` int(11) NOT NULL,
  `merch` bigint(20) DEFAULT NULL,
  `fk_usuario` bigint(20) DEFAULT NULL,
  `videojuego` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs7h9lbsxm38jt82gg7e3s8x9n` (`merch`),
  KEY `FK9gcuvnmbv76t7xobioeo44dd5` (`fk_usuario`),
  KEY `FK800l00o97adhnceu2abx25c5` (`videojuego`),
  CONSTRAINT `FK800l00o97adhnceu2abx25c5` FOREIGN KEY (`videojuego`) REFERENCES `videojuegos` (`id`),
  CONSTRAINT `FK9gcuvnmbv76t7xobioeo44dd5` FOREIGN KEY (`fk_usuario`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKs7h9lbsxm38jt82gg7e3s8x9n` FOREIGN KEY (`merch`) REFERENCES `merchs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `compras` */

insert  into `compras`(`id`,`fecha_de_compra`,`precio_total`,`merch`,`fk_usuario`,`videojuego`) values 
(1,'2022-11-15 13:59:27',1650,NULL,1,21),
(2,'2022-11-15 13:59:58',384,NULL,1,2),
(3,'2022-11-15 14:00:18',1320,NULL,1,18),
(4,'2022-11-15 14:04:45',1237,1,1,NULL),
(5,'2022-11-15 14:35:29',1485,6,1,NULL),
(6,'2022-11-15 14:50:24',165,7,1,NULL),
(7,'2022-11-15 14:52:29',1650,NULL,4,16),
(8,'2022-11-15 14:52:35',495,2,4,NULL),
(9,'2022-11-15 14:52:42',1237,1,4,NULL),
(10,'2022-11-15 14:52:51',1320,NULL,4,20),
(11,'2022-11-15 14:54:30',1155,NULL,2,7);

/*Table structure for table `detalles_tarjeta` */

DROP TABLE IF EXISTS `detalles_tarjeta`;

CREATE TABLE `detalles_tarjeta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellido_titular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cvv` int(11) NOT NULL,
  `fecha_vencimiento` datetime NOT NULL,
  `nombre_titular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nro_tarjeta` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `detalles_tarjeta` */

insert  into `detalles_tarjeta`(`id`,`apellido_titular`,`cvv`,`fecha_vencimiento`,`nombre_titular`,`nro_tarjeta`) values 
(1,'sanchez',321,'2031-02-12 03:00:00','hugo',1123567891030064),
(2,'gonzales',213,'2034-03-12 03:00:00','juan',9999222188321678),
(3,'sanchez',431,'2034-02-03 03:00:00','candela',9997215572180000);

/*Table structure for table `direccion` */

DROP TABLE IF EXISTS `direccion`;

CREATE TABLE `direccion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `calle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `localidad` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_casa` int(11) NOT NULL,
  `pais` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `piso` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `direccion` */

insert  into `direccion`(`id`,`calle`,`localidad`,`num_casa`,`pais`,`piso`) values 
(1,'juan jose paso','mendoza',321,'argentina',0),
(2,'juan jose paso','mendoza',12,'argentina',0),
(3,'la prida','mendoza',21,'argentina',0);

/*Table structure for table `estudios` */

DROP TABLE IF EXISTS `estudios`;

CREATE TABLE `estudios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `estudios` */

insert  into `estudios`(`id`,`nombre`) values 
(1,'Santa Monica Studios'),
(2,'Rock Star Games'),
(3,'Naughty Dog'),
(4,'Sucker Punch Productions'),
(5,'Larian Studios'),
(6,'Kojima Productions'),
(7,'Electronic Arts');

/*Table structure for table `fabricantes` */

DROP TABLE IF EXISTS `fabricantes`;

CREATE TABLE `fabricantes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `fabricantes` */

insert  into `fabricantes`(`id`,`nombre`) values 
(1,'Nintendo'),
(2,'Xbox'),
(3,'League of legends'),
(4,'EA'),
(5,'Larian Srudios'),
(6,'Sony');

/*Table structure for table `imagenes` */

DROP TABLE IF EXISTS `imagenes`;

CREATE TABLE `imagenes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_merch` bigint(20) DEFAULT NULL,
  `fk_videojuego` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8cgt36u8l64y6p9sugjckf5vf` (`fk_merch`),
  KEY `FKdbpsdtf1mtb50ac9xyhdp1k3f` (`fk_videojuego`),
  CONSTRAINT `FK8cgt36u8l64y6p9sugjckf5vf` FOREIGN KEY (`fk_merch`) REFERENCES `merchs` (`id`),
  CONSTRAINT `FKdbpsdtf1mtb50ac9xyhdp1k3f` FOREIGN KEY (`fk_videojuego`) REFERENCES `videojuegos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `imagenes` */

insert  into `imagenes`(`id`,`link`,`fk_merch`,`fk_videojuego`) values 
(14,'https://i.blogs.es/fdaf60/baldurs/1366_2000.jpg',NULL,4),
(22,'https://i0.wp.com/waytoomany.games/wp-content/uploads/2017/06/crash-bandicoot-n_-sane-trilogy_20170628214204.jpg?fit=1920%2C1080&ssl=1',NULL,6),
(23,'https://venturebeat.com/wp-content/uploads/2020/09/Crash-Bandicoot%E2%84%A2-4_-Its-About-Time_20200928205415.jpg?fit=3840%2C2160&strip=all',NULL,7),
(24,'https://m.media-amazon.com/images/M/MV5BYzU5MzhiYjMtMWY5Mi00NzU5LWExMGUtZmRmZWM3Zjg3NTliXkEyXkFqcGdeQVRoaXJkUGFydHlJbmdlc3Rpb25Xb3JrZmxvdw@@._V1_.jpg',NULL,7),
(25,'https://gamingtrend.com/wp-content/uploads/2020/09/Crash-Bandicoot%E2%84%A2-4_-Its-About-Time_20200929110559.jpg',NULL,7),
(26,'https://1.bp.blogspot.com/-grq6h9TAJs8/YHdBpvUv4QI/AAAAAAAAhXc/qPETD-5AjpwDY2_hbLXENlkE3uqQbGVwgCLcBGAsYHQ/s2048/Uncharted_%2BThe%2BNathan%2BDrake%2BCollection%25E2%2584%25A2_20210404223750.png',NULL,8),
(27,'https://www.xgn.nl/images/articles/2015/201509/_1280x720_crop_center-center_82_line/asi-se-ve-uncharted-1-en-the-nathan-drake-collection-78334-3.jpg',NULL,8),
(28,'https://i.redd.it/os31w3lnuwt71.jpg',NULL,8),
(29,'https://www.gamesknit.com/wp-content/uploads/2015/08/CtxUiDKpz.jpg',NULL,8),
(31,'https://media2.fdncms.com/inlander/imager/uncharted-2-among-thieves/u/original/2130095/art14300.jpg',NULL,9),
(32,'https://cdn.vox-cdn.com/thumbor/OMMijH5MJwR7KX0g6Vw-FX5vxkg=/0x0:1920x1080/1200x800/filters:focal(807x387:1113x693)/cdn.vox-cdn.com/uploads/chorus_image/image/66750762/Uncharted_2_Among_Thieves_Chapter_17_treasure_1.0.jpg',NULL,9),
(33,'https://assets.reedpopcdn.com/take-a-look-at-uncharted-2-remastered-for-playstation-4-1437037016679.jpg/BROK/thumbnail/1600x900/quality/100/take-a-look-at-uncharted-2-remastered-for-playstation-4-1437037016679.jpg',NULL,9),
(34,'https://assets2.ignimgs.com/2015/04/06/uncharted-3jpg-f55394_160w.jpg?width=1280',NULL,10),
(35,'https://i.ytimg.com/vi/OqfSyriO4YA/maxresdefault.jpg',NULL,10),
(36,'https://m.media-amazon.com/images/M/MV5BMGYwMWY2MTItMTMwZi00YjI0LWE1NWQtZDI1ZDE3ODQ0ZGI5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMjYwNDA2MDE@._V1_.jpg',NULL,10),
(37,'https://www.greenscene.co.id/wp-content/uploads/2021/12/Uncharted-696x497.jpg',NULL,11),
(38,'https://i.ytimg.com/vi/Wz065FxckEE/maxresdefault.jpg',NULL,11),
(39,'https://cdn.atomix.vg/wp-content/uploads/2016/05/uncharted-4.jpg',NULL,11),
(40,'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2013/01/203299-juegos-2013-tomb-raider.jpg?itok=5lB6D1P_',NULL,12),
(41,'https://images.hdqwalls.com/wallpapers/shadow-of-the-tomb-raider-videogame-4k-xt.jpg',NULL,12),
(42,'https://images.hdqwalls.com/wallpapers/shadow-of-the-tomb-raider-z3.jpg',NULL,12),
(43,'https://www.muycomputer.com/wp-content/uploads/2019/11/Death-Stranding-1000x600.jpg',NULL,13),
(44,'https://i.blogs.es/cb8ec6/deathstranding1/1366_2000.jpeg',NULL,13),
(45,'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2019/11/death-stranding_15.jpg?itok=XJW5yPlr',NULL,13),
(46,'https://www.muycomputer.com/wp-content/uploads/2021/07/Red-Dead-Redemption-2-portada.jpg',NULL,15),
(47,'https://media.vandal.net/master/42943/red-dead-redemption-2-20181025130125_4.jpg',NULL,15),
(48,'https://i.blogs.es/448439/red-dead-redemption-2-mod/1366_2000.png',NULL,15),
(49,'https://as01.epimg.net/meristation/imagenes/2022/07/31/noticias/1659254749_603319_1659254833_noticia_normal.jpg',NULL,15),
(50,'https://images.pagina12.com.ar/styles/focal_3_2_470x313/public/2022-10/660440-46950-fifa-252023.jpg?itok=ZX0HSi08',NULL,16),
(51,'https://sm.ign.com/ign_es/screenshot/default/fifa-23-20220926193018_4286.jpg',NULL,16),
(52,'https://www.rionegro.com.ar/wp-content/uploads/2022/09/FIFA-23-1.jpg',NULL,16),
(53,'https://as01.epimg.net/meristation/imagenes/2022/09/06/noticias/1662487050_482320_1662487118_noticia_normal.jpg',NULL,17),
(54,'https://gmedia.playstation.com/is/image/SIEPDC/nba-2k23-the-jordan-challenge-video-01-ps4-ps5-en-07sep22-1?$native$',NULL,17),
(55,'https://media.revistagq.com/photos/632981b2262bda7cf9b56818/master/pass/NBA_2K23.jpg',NULL,17),
(56,'https://sm.ign.com/ign_es/gallery/e/ea-sports-/ea-sports-ufc-4-screenshots_hqck.jpg',NULL,18),
(57,'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2020/08/ufc-4-embargo-14-agosto-2027971.jpg?itok=HlRXPvc3',NULL,18),
(58,'https://media.contentapi.ea.com/content/dam/ufc/ufc-4/common/takedowns-overhaul-16x9.png',NULL,18),
(59,'https://diariodefriki.files.wordpress.com/2019/08/cuphead_screenshot_0003.png',NULL,19),
(60,'https://i.blogs.es/da169b/290917-cuphead/1366_2000.jpg',NULL,19),
(61,'https://i.blogs.es/fda142/cuphead-01/1366_2000.jpg',NULL,19),
(62,'https://i0.wp.com/rincondelsimmer.com/wp-content/uploads/2021/05/GP10_IMG_0.png?ssl=1',NULL,20),
(63,'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/IMZB4BGXUFEB5PPYU2TAJJF47I.webp',NULL,20),
(64,'https://www.somosxbox.com/wp-content/uploads/2022/05/los-sims-4-1-somosxbox.jpg',NULL,20),
(65,'https://cdn.cloudflare.steamstatic.com/steam/apps/1245620/ss_e80a907c2c43337e53316c71555c3c3035a1343e.1920x1080.jpg?t=1668042166',NULL,21),
(66,'https://p325k7wa.twic.pics/high/elden-ring/elden-ring/02-screenshots/ELDENRING_12_4K.jpg?twic=v1/resize=760/step=10/quality=80',NULL,21),
(67,'https://onlygames.com.ar/wp-content/uploads/2022/04/elden-ring.png',NULL,21),
(68,'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/KYEG3AQYQNAW7L3MF74GTK4J74.jpg',NULL,21),
(69,'https://store-images.s-microsoft.com/image/apps.47970.13995152356447586.3e46d8cd-8538-4377-826c-ab6ef69216af.d801f513-f201-45c6-9545-15769c8efbb1?mode=scale&q=90&h=720&w=1280&background=%23FFFFFF',NULL,21),
(71,'https://www.thewandcompany.com/wp-content/uploads/2021/09/Ultra-Ball-pack-shot-all-1166x1kpx-1024x878.jpg',1,NULL),
(72,'https://www.thewandcompany.com/wp-content/uploads/2021/02/master-ball-all-pack-shot-b-1405x1184px-1024x863.jpg',1,NULL),
(73,'https://www.thewandcompany.com/wp-content/uploads/2021/05/Great-Ball-with-pack-and-manual-3750x3kpx-1024x819.jpg',1,NULL),
(74,'https://http2.mlstatic.com/D_NQ_NP_874042-MLA50891389847_072022-O.jpg',2,NULL),
(75,'https://troopertoys.com/19453-large_default/funko-pop-pokemon-vaporeon-627.jpg',2,NULL),
(76,'https://troopertoys.com/24965-large_default/funko-pop-pokemon-flareon-629.jpg',2,NULL),
(77,'https://compass-ssl.xbox.com/assets/bf/cb/bfcbcbf4-59c2-45a7-8800-81b776775873.jpg?n=111101_Gallery-0_31_1350x759.jpg',3,NULL),
(78,'https://eu.aimcontrollers.com/wp-content/uploads/2021/04/6-Yellow-Matt-M.png',3,NULL),
(79,'https://assets.xboxservices.com/assets/98/7d/987db778-7c8c-483b-a811-0586802d9991.jpg?n=111101_Image-Hero-768_3_1920x831_02.jpg',3,NULL),
(80,'https://assets.xboxservices.com/assets/ba/40/ba40e598-da1c-4034-9117-bcc1c1086f6d.jpg?n=111101_Gallery-0_18_1350x759.jpg',3,NULL),
(84,'https://www.oxfordlibreria.com.ar/media/catalog/product/cache/5a38f6614905178fa07804facc7b33a0/6/9/6920082807516-1_20201228160112.jpg',4,NULL),
(87,'https://d3ugyf2ht6aenh.cloudfront.net/stores/001/837/971/products/plantas1-996661b5436507e6d416323168105645-1024-1024.jpg',4,NULL),
(89,'https://i.pinimg.com/474x/bb/c2/6d/bbc26dd07b503bbef30c540be6f82a58--funko-pop-vinyl-vinyl-toys.jpg',4,NULL),
(90,'https://eu.merch.larian.com/media/cache/product_listing_thumbnail/46/75/69725040f25fc6ff06077097f1f3.png',5,NULL),
(91,'https://eu.merch.larian.com/media/cache/sylius_shop_product_original/03/4f/59b0380c7ccae9894ed15e1aae62.jpeg',5,NULL),
(92,'https://www.geekgirlauthority.com/wp-content/uploads/2019/11/06_Divinity-Original-Sin-the-Board-Game.jpg',5,NULL),
(93,'https://m.media-amazon.com/images/I/61O9tWR6WDS.jpg',6,NULL),
(94,'https://www.gamespot.com/a/uploads/original/1595/15950357/4041294-godofwardualsense.png',6,NULL),
(95,'https://cdn.vox-cdn.com/thumbor/24ca4Cwl99-vr8fkDACSv6V1MTA=/0x0:1600x900/1400x1400/filters:focal(800x450:801x451)/cdn.vox-cdn.com/uploads/chorus_asset/file/22511516/51176194136_6b76edb34d_h.jpeg',6,NULL),
(96,'https://i.etsystatic.com/10078353/c/3000/2000/0/0/il/c32b6f/3552405920/il_340x270.3552405920_edwx.jpg',7,NULL),
(97,'https://cdn.shopify.com/s/files/1/0169/1130/2710/products/WhatsAppImage2022-07-04at2.12.28PM.jpg?v=1656940481',7,NULL),
(98,'https://www.zbrushcentral.com/uploads/default/original/4X/8/2/c/82cf12259c70b8fa25c96ae009a0faad7fb84b77.jpeg',7,NULL);

/*Table structure for table `merchs` */

DROP TABLE IF EXISTS `merchs`;

CREATE TABLE `merchs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` bit(1) NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_portada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `fk_fabricante` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj248chp0vufnigutu63t5lefn` (`fk_fabricante`),
  CONSTRAINT `FKj248chp0vufnigutu63t5lefn` FOREIGN KEY (`fk_fabricante`) REFERENCES `fabricantes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `merchs` */

insert  into `merchs`(`id`,`activo`,`descripcion`,`img_portada`,`nombre`,`precio`,`stock`,`fk_fabricante`) values 
(1,'','Pokeballs Edición coleccionista!','https://www.thewandcompany.com/wp-content/uploads/2021/11/Premier-Ball-packshot-3kx2687px-1024x917.jpg','Pokeball',750,80,1),
(2,'','Funko pop de Evee y sus evoluciones!','https://http2.mlstatic.com/D_NQ_NP_673725-MLA43506979283_092020-O.jpg','Funk de Evee',300,69,1),
(3,'','Control de Xbox original','https://media.accobrands.com/media/560-560/471502.jpg','Xbox controller',1500,30,2),
(4,'','Funkos de algunos personajes del juego plantas vs zombies','https://www.tiendafacil.com.ar/tienda/uploads/600x600/1664889212_764f618f.jpg','Funkos de Plantas vs Zombies',400,42,4),
(5,'','El famoso juego de mesa de divinity original sin 2 con set de dados incluidos!','https://www.gamereactor.eu/media/12/divinity_3021233.png','Dvinity 2 juego de mesa',1000,0,5),
(6,'','Control de ps5 original!','https://i5.walmartimages.com/asr/d2f5acf1-c4fe-4701-a33e-74e0e58194cf.d1d07f8210f04a0f6b15319f5c014a45.png','PS 5 Controller',900,100,6),
(7,'','martillo de thor en el juego de GOD OF WAR RAGNAROK','https://cdn.shopify.com/s/files/1/0478/9073/products/godofwar_thorshammer_1200x1200.png?v=1610085381','mjolnir (GOW RAGNAROK)',100,90,6);

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `rol` */

insert  into `rol`(`id`,`nombre`) values 
(1,'ROLE_SUPERADMIN'),
(2,'ROLE_ADMIN'),
(3,'ROLE_ADMIN'),
(4,'ROLE_USER');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin` bit(1) NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contrasenia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cumplanios` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_usuario` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_direccion` bigint(20) DEFAULT NULL,
  `fk_tarjeta` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdy1ht1hy8fspw1h4qnnavpq6k` (`fk_direccion`),
  KEY `FK654bdgq4dlthr1aahalqnggcc` (`fk_tarjeta`),
  CONSTRAINT `FK654bdgq4dlthr1aahalqnggcc` FOREIGN KEY (`fk_tarjeta`) REFERENCES `detalles_tarjeta` (`id`),
  CONSTRAINT `FKdy1ht1hy8fspw1h4qnnavpq6k` FOREIGN KEY (`fk_direccion`) REFERENCES `direccion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`admin`,`apellido`,`contrasenia`,`cumplanios`,`email`,`nombre`,`nombre_usuario`,`fk_direccion`,`fk_tarjeta`) values 
(1,'\0','Admin','$2a$10$KBJlNpRmbqxoNKJfNq7nnO509I1OXD5FbF4O0gI2CiDaSy/3IPFWe','2001-03-12 03:00:00','superAdmin@gmail.com','Super','superAdmin',1,1),
(2,'','admin','$2a$10$/I3QOCHkhPs.wC.mduXLxOcFbT1baFIeObyYZzXmeOMj2URGwmB1.','2003-09-01 03:00:00','admin@gmail.com','Admin','admin',3,3),
(3,'','admin2','$2a$10$xG9QhkkBKkOqhNaQaOPdJew7QgUlFP3an97DpcDWlZAWmm2w.LvIS','2001-07-12 03:00:00','admin2@gmail.com','Admin2','admin2',NULL,NULL),
(4,'\0','user','$2a$10$d/IBhMxRBdhcYQbHcsamOu.nzL5bffM43PM0dXiAzy8u4x4QgETfO','2000-09-02 03:00:00','user@gmail.com','user','usuario',2,2);

/*Table structure for table `usuarios_roles` */

DROP TABLE IF EXISTS `usuarios_roles`;

CREATE TABLE `usuarios_roles` (
  `usuario_id` bigint(20) NOT NULL,
  `rol_id` bigint(20) NOT NULL,
  KEY `FK6yxg1lhuv5nievqea7rvn6afm` (`rol_id`),
  KEY `FKqcxu02bqipxpr7cjyj9dmhwec` (`usuario_id`),
  CONSTRAINT `FK6yxg1lhuv5nievqea7rvn6afm` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  CONSTRAINT `FKqcxu02bqipxpr7cjyj9dmhwec` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `usuarios_roles` */

insert  into `usuarios_roles`(`usuario_id`,`rol_id`) values 
(1,1),
(2,2),
(3,3),
(4,4);

/*Table structure for table `videojuegos` */

DROP TABLE IF EXISTS `videojuegos`;

CREATE TABLE `videojuegos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` bit(1) NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img_portada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `pg` bit(1) NOT NULL,
  `fecha_lanzamiento` datetime NOT NULL,
  `fk_categoria` bigint(20) NOT NULL,
  `fk_estudio` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK54ev8cdsfhbdfxufd9wc8g23x` (`fk_categoria`),
  KEY `FKev9v8m1hnvqlpne73pgko027c` (`fk_estudio`),
  CONSTRAINT `FK54ev8cdsfhbdfxufd9wc8g23x` FOREIGN KEY (`fk_categoria`) REFERENCES `categorias` (`id`),
  CONSTRAINT `FKev9v8m1hnvqlpne73pgko027c` FOREIGN KEY (`fk_estudio`) REFERENCES `estudios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `videojuegos` */

insert  into `videojuegos`(`id`,`activo`,`descripcion`,`img_portada`,`nombre`,`precio`,`pg`,`fecha_lanzamiento`,`fk_categoria`,`fk_estudio`) values 
(1,'','el Fimbulvetr está llegando a su fin y se profetiza que este dará paso al temido Ragnarök. Atreus, ahora adolescente, aún busca respuestas sobre su identidad como Loki, así como una forma de evitar que suceda el Ragnarök. Para descubrir la verdad, Kratos y Atreus buscarán al dios nórdico de la guerra, Tyr, que se creía muerto.','https://i.blogs.es/4c3cf2/godofwarragnarok/1366_2000.jpeg','GOD OF WAR RAGNAROK',750,'','2022-11-10 03:00:00',1,1),
(2,'','En 1274, la isla japonesa de Tsushima es invadida por los mongoles. Un samurái superviviente a una masacre de los suyos se recupera dificultosamente y decide contraatacar con ayuda de su tío, secuestrado por los invasores.','https://as01.epimg.net/meristation/imagenes/2020/07/14/analisis/1594715877_842875_1594727940_portada_normal.jpg','Sucker Punch Productions',233,'\0','2019-03-12 03:00:00',1,4),
(3,'','un mundo de espada y brujería que no le resultará ajeno a cualquiera que conozca el universo de Advanced Dungeons and Dragons. Es en este lugar, ambientado por criaturas mágicas en que nos hacemos con nuestro personaje; un hechicero de la fuente. Bien podemos crear a nuestro propio héroe o, mejor aún, seleccionar alguno de los que aparecen predefinidos y que ya cuentan con una historia que se irá desplegando a medida que jugamos','https://generacionxbox.com/wp-content/uploads/2018/09/divinity-original-sin-2-definitive-edition-analisis.jpg','divinity original sin 2',500,'\0','2015-07-12 03:00:00',4,5),
(4,'','Una presencia malvada ha regresado a Baldur\'s Gate, en un intento de devorarlo todo desde dentro y de corromper los vestigios de los Reinos Olvidados. Sin ayuda, puede que resistas. Juntos, podremos triunfar.','https://www.gameprotv.com/archivos/202009/baldur-s-gate-iii-principal.jpg','baldur\'s gate',750,'\0','2021-10-29 03:00:00',4,5),
(5,'','Han pasado años desde que Kratos tomó su venganza contra los Dioses Olímpicos. Habiendo sobrevivido la pelea final contra su padre Zeus, Kratos vive ahora con su joven hijo Atreus en el mundo de los Dioses Nórdicos, una tierra hostil habitada por feroces monstruos y guerreros','https://culturageek.com.ar/wp-content/uploads/2018/04/Culturageek.com_.ar-Review-God-of-War-1.jpg','GOD OF WAR (2018)',600,'','2018-07-12 03:00:00',1,1),
(6,'','El videojuego es una colección nueva y mejorada de los tres primeros títulos de la serie Crash Bandicoot: Crash Bandicoot, Crash Bandicoot 2: Cortex Strikes Back y Crash Bandicoot 3: Warped','https://areajugones.sport.es/wp-content/uploads/2017/05/Crash-Bandicoot-N.-Sane-Trilogy-arte.jpg','crash bandicoot n sane trilogy',400,'\0','2017-02-28 03:00:00',5,3),
(7,'','Crash Bandicoot y su hermana Coco, ayudados por su antiguo enemigo Dingodile y una contraparte de una dimensión alternativa de la antigua novia de Crash, Tawna, mientras recuperan las todopoderosas máscaras cuánticas en un intento por prevenir al Doctor Neo Cortex y al Doctor Nefarious Tropy. de esclavizar el multiverso.','https://image.api.playstation.com/vulcan/ap/rnd/202102/2418/nOYZabSx4faHIlurfiUC0HVl.jpg','crash bandicoot 4 it\'s about time',700,'\0','2020-11-20 03:00:00',5,3),
(8,'','Nathan Drake es un cazarrecompensas que acaba de encontrar algo que llevaba años buscando: el ataúd de su antepasado Sir Francis Drake. Le acompaña la periodista Elena Fisher, quién ha decidido grabar un documental de la expedición','https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2020/01/uncharted-collection_0.jpg?itok=VcrQecvg','uncharted drake\'s fortune',99,'\0','2008-01-12 02:00:00',2,3),
(9,'','Nathan Drake está dentro de un tren destrozado, a punto de caer por un acantilado, en China. ¿Cómo ha llegado hasta allí? Cinco meses antes, junto a Harry Flynn y Chloe Frazer, planeó el robo de una lámpara en un museo de Estambul. Allí, escondido, estaba un mapa realizado por Marco Polo que señalaba la ruta hacia la mítica ciudad de Shambala. Tras ser traicionado por uno de ellos, Nathan se embarca en una aventura para encontrar la ciudad antes que sus enemigos.','https://i0.wp.com/www.gamerfocus.co/wp-content/uploads/2016/07/Uncharted2_01.jpg?fit=1920%2C1200&ssl=1','uncharted among thieves',130,'\0','2010-08-12 03:00:00',2,3),
(10,'','Nathan Drake y Sully negocian la compra del anillo de Nathan (que perteneció a Sir Francis Drake) por parte de Talbot. Pero, este les tiende una emboscada y los cazarrecompensas descubren que está a las órdenes de Katherine Marlowe, una vieja conocida. Al parecer, el anillo funciona como un descodificador del astrolabio que marca la ruta a la ciudad perdida de Ubar, también conocida como la Atlántida de las Arenas. ','https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2015/01/438886-guia-uncharted-3.jpg?itok=h2xcZ8hR','uncharted 3 drake\'s deception',275,'\0','2016-09-12 03:00:00',2,3),
(11,'',' El retirado cazafortunas Nathan Drake vive felizmente su vida junto con su esposa Elena Fisher, pero todo se derrumba cuando aparece su hermano Sam, el que Nathan pensaba que estaba muerto. Sam necesita su ayuda para desenmascarar una conspiración histórica del famoso pirata aventurero Henry Avery y su legendario tesoro. Además, no son los únicos que buscan el tesoro, ya que Rafe Adler, multimillonario y exsocio de los hermanos Drake mientras estuvieron en una prisión, está buscándolo también','https://i.blogs.es/53a886/uncharted4/1366_2000.jpeg','uncharted a thief\'s end',350,'\0','2019-09-01 03:00:00',2,3),
(12,'','Lara Croft se une a la expedición del doctor James Whitman, que tiene como objetivo encontrar e investigar los restos del reino perdido de Yamatai. A bordo del Endurance, parten hacia el este de Japón, donde Whitman confía en que se halle la isla de Yamatai.','https://uvejuegos.com/img/destacados/guias/3016/tomb_raider.jpg','tomb raider',430,'\0','2017-05-12 03:00:00',2,4),
(13,'','un mundo postapocalíptico en el que un evento conocido como \"Death Stranding\" fusionó el mundo de los vivos y el de los muertos. Esta fusión provocó tres cosas. La primera son los Entes Varados (o EV), almas de los muertos atrapadas en el mundo de los vivos que intentan arrastrar a los humanos al más allá. La segunda es El Declive (o Cronolluvia), una lluvia que acelera el paso del tiempo de todo lo que toca','https://cdn1.epicgames.com/f4a904fcef2447439c35c4e6457f3027/offer/DS_wide-2560x1440-c3d7bbf8ee36dd025610088381a5235a.jpg','Death Stranding',600,'\0','2018-06-12 03:00:00',2,6),
(14,'','En el año 2004, Michael Townley, Trevor Philips y Brad Snider eran ladrones de bancos que vivían en Ludendorff, en el estado de North Yankton (basado en Dakota del Norte). Michael, queriendo huir de esa vida, planea un atraco falso junto al agente federal corrupto Dave Norton. Dave tenía que matar a Trevor y arrestar a Brad mientras Michael fingía su muerte.','https://as01.epimg.net/meristation/imagenes/2020/05/14/noticias/1589454136_132592_1590065418_noticia_normal.jpg','grand theft auto v',800,'\0','2015-08-27 03:00:00',1,2),
(15,'','Tras un asalto fallido en el pueblo de Blackwater, Arthur Morgan y la pandilla de Van der Linde se ven forzados a huir. Con agentes federales y los mejores cazarrecompensas pisando sus talones, la pandilla deberá asaltar, robar y hacerse camino a través de una América despiadada para poder sobrevivir.','https://i.blogs.es/169695/red0/1366_2000.jpg','red redemption 2',800,'\0','2021-07-06 03:00:00',1,2),
(16,'','un videojuego de simulación de fútbol','https://cloudfront-us-east-1.images.arcpublishing.com/infobae/2SRVZDMIEBDFRAS4WDAEPEZ7OI.jpeg','FIFA 23',1000,'\0','2022-10-12 03:00:00',3,7),
(17,'','Jugo de simulacion de basket. En NBA 2K23 se rinde tributo a Mickel Jordan con el Desafío Jordan.','https://liputanpopuler.app/es/wp-content/uploads/2022/10/NBA-2K23-Apple-Arcade.jpeg','NBA 2K23',1000,'\0','2022-10-08 03:00:00',3,7),
(18,'','Un videojuego de artes marciales','https://media.vandal.net/m/87660/ufc-4-20208181122583_11.jpg','UFC 4',800,'\0','2022-10-30 03:00:00',3,7),
(19,'','La historia trata acerca de dos hermanos, los protagonistas Cuphead y Mugman, que deben derrotar a varios enemigos y jefes para poder saldar una deuda que tenían pendiente con el diablo.','https://fs-prod-cdn.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_Cuphead.jpg','Cuphead',450,'\0','2020-04-13 03:00:00',5,3),
(20,'','Los Sims 4 es un videojuego de simulación social y de vida. Crea tu familia, consigue trabajo, haz nuevos amigos. Todo es posible en los sims 4!','https://cloudfront-us-east-1.images.arcpublishing.com/infobae/VPVHXR6WRJAVNC5DW3BZXT33VU.png','SIMS 4',800,'\0','2014-02-12 03:00:00',6,7),
(21,'','EL NUEVO RPG DE ACCIÓN DE FANTASÍA. Levántate, tiznado, y déjate guiar por la gracia para esgrimir el poder del Anillo de Elden y convertirte en un Señor de Elden en las Tierras Intermedias.','https://e00-us-marca.uecdn.es/assets/multimedia/imagenes/2022/03/26/16483264681954.jpg','Elden Ring',1000,'','2022-01-30 03:00:00',1,1);

/*Table structure for table `videojuegos_comentarios_valoraciones` */

DROP TABLE IF EXISTS `videojuegos_comentarios_valoraciones`;

CREATE TABLE `videojuegos_comentarios_valoraciones` (
  `videojuego_id` bigint(20) NOT NULL,
  `comentario_valoracion_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_qq3sibic1h2nyjdy11yy088wr` (`comentario_valoracion_id`),
  KEY `FK8tn2kh3o3140877upadupyssn` (`videojuego_id`),
  CONSTRAINT `FK8tn2kh3o3140877upadupyssn` FOREIGN KEY (`videojuego_id`) REFERENCES `videojuegos` (`id`),
  CONSTRAINT `FKe2bn6v6jq4dqjq5ga4p5g39wn` FOREIGN KEY (`comentario_valoracion_id`) REFERENCES `comentarios_valoracion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `videojuegos_comentarios_valoraciones` */

insert  into `videojuegos_comentarios_valoraciones`(`videojuego_id`,`comentario_valoracion_id`) values 
(1,5),
(3,1),
(18,2),
(21,3),
(21,4),
(21,6);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
