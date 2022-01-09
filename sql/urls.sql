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
-- Table structure for table `dynamic_taxonomy_geographic_language`
--

DROP TABLE IF EXISTS `dynamic_taxonomy_geographic_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_taxonomy_geographic_language` (
  `id` int(11) NOT NULL COMMENT 'identificador pagina',
  `language` varchar(3) NOT NULL COMMENT 'lenguage',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'titulo',
  `text_subtitle` varchar(75) DEFAULT NULL COMMENT 'subtitulo',
  `dynamic_accion` int(11) DEFAULT NULL COMMENT 'accion',
  `dynamic_taxonomy_group` int(10) DEFAULT NULL COMMENT 'taxonomia',
  `dynamic_geocity` int(10) DEFAULT NULL COMMENT 'ciudad',
  `dynamic_geocountry` int(10) DEFAULT NULL COMMENT 'pais',
  `dynamic_geodistrict` int(10) DEFAULT NULL COMMENT 'distrito',
  `dynamic_geolocality` int(10) DEFAULT NULL COMMENT 'localidad',
  `dynamic_georegion` int(10) DEFAULT NULL COMMENT 'localidad',
  `dynamic_url_extra_parametro` int(10) DEFAULT NULL COMMENT 'localidad',
  `textarea_description` text COMMENT 'descripcion',
  `text_page_title` varchar(255) DEFAULT NULL COMMENT 'titulo pagina',
  `text_slug` varchar(255) DEFAULT NULL COMMENT 'slug',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'auto slug',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'keywords',
  `text_meta_description` text COMMENT 'meta descripcion',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'robots',
  `textarea_scripts_header` text COMMENT 'scripts header',
  `textarea_scripts_body` text COMMENT 'scripts body',
  `status` varchar(128) DEFAULT NULL COMMENT 'status',
  `position` int(11) DEFAULT NULL COMMENT 'position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sistema urls dinámicas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_taxonomy_geographic_language`
--

LOCK TABLES `dynamic_taxonomy_geographic_language` WRITE;
/*!40000 ALTER TABLE `dynamic_taxonomy_geographic_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_taxonomy_geographic_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_taxonomy_geographic_language_extra`
--

DROP TABLE IF EXISTS `dynamic_taxonomy_geographic_language_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_taxonomy_geographic_language_extra` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '1' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título Cabecera',
  `text_page_title` varchar(255) DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` text COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Parametro extra';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_taxonomy_geographic_language_extra`
--

LOCK TABLES `dynamic_taxonomy_geographic_language_extra` WRITE;
/*!40000 ALTER TABLE `dynamic_taxonomy_geographic_language_extra` DISABLE KEYS */;
INSERT INTO `dynamic_taxonomy_geographic_language_extra` VALUES (1,'en','cheaps','cheaps','','cheaps','cheaps','cheaps',NULL,NULL,NULL,'ACTIVED',0),(1,'es','baratas','baratas','','baratas','baratas','baratas',NULL,NULL,NULL,'ACTIVED',0),(2,'en','for weddings and christenings','for weddings and christenings','','for-weddings-and-christenings','for-weddings-and-christenings','for weddings and christenings',NULL,NULL,NULL,'ACTIVED',0),(2,'es','para bodas y bautizos','para bodas y bautizos','','para-bodas-y-bautizos','para-bodas-y-bautizos','para bodas y bautizos',NULL,NULL,NULL,'ACTIVED',0);
/*!40000 ALTER TABLE `dynamic_taxonomy_geographic_language_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_taxonomy_geographic_language_fields_customitzation`
--

DROP TABLE IF EXISTS `dynamic_taxonomy_geographic_language_fields_customitzation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_taxonomy_geographic_language_fields_customitzation` (
  `id` int(11) NOT NULL COMMENT 'identificador pagina',
  `language` varchar(3) DEFAULT NULL COMMENT 'lenguage',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'titulo',
  `text_subtitle` varchar(75) DEFAULT NULL COMMENT 'subtitulo',
  `textarea_description` text COMMENT 'descripcion',
  `text_page_title` varchar(255) DEFAULT NULL,
  `text_slug` varchar(255) DEFAULT NULL COMMENT 'slug',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'auto slug',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'keywords',
  `text_meta_description` text COMMENT 'meta descripcion',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'robots',
  `textarea_scripts_header` text COMMENT 'scripts header',
  `textarea_scripts_body` text COMMENT 'scripts body',
  `status` varchar(128) DEFAULT NULL COMMENT 'status',
  `position` int(11) DEFAULT NULL COMMENT 'position',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customitzation taxonomia';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_taxonomy_geographic_language_fields_customitzation`
--

LOCK TABLES `dynamic_taxonomy_geographic_language_fields_customitzation` WRITE;
/*!40000 ALTER TABLE `dynamic_taxonomy_geographic_language_fields_customitzation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_taxonomy_geographic_language_fields_customitzation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-13 13:01:42
