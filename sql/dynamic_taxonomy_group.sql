-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: pisosenm_inmobiliaria_dos
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `dynamic_taxonomy_group`
--

LOCK TABLES `dynamic_taxonomy_group` WRITE;
/*!40000 ALTER TABLE `dynamic_taxonomy_group` DISABLE KEYS */;
INSERT INTO `dynamic_taxonomy_group` VALUES (1,'en','Apartment',NULL,NULL,NULL,NULL,NULL,NULL,'apartment',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'es','Apartamento','aparamentos','Piso','<div style=','Piso','<p>piso</p>\r\n','','apartamento','','','','','','','ACTIVED',0),(1,'fr','Appartement',NULL,NULL,NULL,NULL,NULL,NULL,'appartement',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'ru','Апартаменты',NULL,NULL,NULL,NULL,NULL,NULL,'Апартаменты',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'en','Villa',NULL,NULL,NULL,NULL,NULL,NULL,'villa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'es','Villa','villas','casa','<div style=','casa','<p>casa</p>\r\n','','villa','','','','','','','ACTIVED',0),(2,'fr','Villa',NULL,NULL,NULL,NULL,NULL,NULL,'villa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'ru','Вилла',NULL,NULL,NULL,NULL,NULL,NULL,'Вилла',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'en','Hotel',NULL,NULL,NULL,NULL,NULL,NULL,'hotel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'es','Hotel','hoteles','Oficina','<div style=','Oficina','<p>Oficina</p>\r\n','','hotel','','','','','','','ACTIVED',0),(3,'fr','Hôtel',NULL,NULL,NULL,NULL,NULL,NULL,'hotel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'ru','Отель',NULL,NULL,NULL,NULL,NULL,NULL,'Отель',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'en','Aparthotel',NULL,NULL,NULL,NULL,NULL,NULL,'aparthotel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'es','Apartahotel','apartahoteles','Local','<div style=','Local','<p>Local</p>\r\n','','apartahotel','','','','','','','ACTIVED',0),(4,'fr','Aparthotel',NULL,NULL,NULL,NULL,NULL,NULL,'aparthotel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'ru','Апартотель',NULL,NULL,NULL,NULL,NULL,NULL,'Апартотель',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'es','Parking','Parkings','Parking','<div style=','Parking','<p>Parking</p>\r\n','','parking','','','','','','','ACTIVED',0),(6,'es','Terreno','Terrenos','Terreno','<div style=','Terreno','<p>Terreno</p>\r\n','','terreno','','','','','','','ACTIVED',0),(7,'es','Nave','Naves','Nave','<div style=','Nave','<p>Nave</p>\r\n','','nave','','','','','','','ACTIVED',0),(8,'es','Edificio','Edificios','Edificio','<div style=','Edificio','<p>Edificio</p>\r\n','','edificio','','','','','','','ACTIVED',0),(9,'en','Cottage',NULL,NULL,NULL,NULL,NULL,NULL,'cottage',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'es','Casa rural','casas rurales',NULL,NULL,NULL,NULL,NULL,'casa-rural',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'fr','Gîte Rural',NULL,NULL,NULL,NULL,NULL,NULL,'g-te-rural',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'ru','Коттедж',NULL,NULL,NULL,NULL,NULL,NULL,'Коттедж',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'es','Propiedad','Propiedades','Propiedad',NULL,NULL,NULL,NULL,'propiedad',NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVED',0),(11,'es','Habitación','Habitaciónes','Habitación',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVED',0),(14,'en','Studio',NULL,NULL,NULL,NULL,NULL,NULL,'studio',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'es','Estudio','estudios',NULL,NULL,NULL,NULL,NULL,'estudio',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'fr','Studio',NULL,NULL,NULL,NULL,NULL,NULL,'studio',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'ru','Квартира-студия',NULL,NULL,NULL,NULL,NULL,NULL,'Квартира-студия',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'en','Chalet',NULL,NULL,NULL,NULL,NULL,NULL,'chalet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'es','Chalet','chalets',NULL,NULL,NULL,NULL,NULL,'chalet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'fr','Chalet',NULL,NULL,NULL,NULL,NULL,NULL,'chalet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'ru','Шале',NULL,NULL,NULL,NULL,NULL,NULL,'Шале',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dynamic_taxonomy_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-13 22:08:11
