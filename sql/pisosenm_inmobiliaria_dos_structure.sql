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
-- Table structure for table `automatizacion`
--

DROP TABLE IF EXISTS `automatizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `automatizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `nombre` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='Automatización fichero';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations`
--

DROP TABLE IF EXISTS `avantio_accomodations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations` (
  `id` int(11) NOT NULL DEFAULT '0',
  `text_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) NOT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) NOT NULL DEFAULT '',
  `text_company` varchar(75) NOT NULL DEFAULT '',
  `number_companyid` int(10) unsigned NOT NULL DEFAULT '0',
  `text_numero_registro_turistico` varchar(255) NOT NULL DEFAULT '' COMMENT 'Número de registro turístico',
  `avantio_occupation_rules` int(11) unsigned DEFAULT NULL COMMENT 'Regla de ocupación',
  `avantio_pricemodifiers` int(11) unsigned DEFAULT NULL COMMENT 'Modificador de precio',
  `avantio_gallery` int(11) unsigned DEFAULT NULL COMMENT 'Galería',
  `dynamic_taxonomy` int(11) DEFAULT NULL COMMENT 'Taxonomía (Kinds)',
  `dynamic_geocountry` int(11) DEFAULT NULL COMMENT 'País',
  `dynamic_georegion` int(11) DEFAULT NULL COMMENT 'Región',
  `dynamic_geocity` int(11) DEFAULT NULL COMMENT 'Ciudad',
  `dynamic_geolocality` int(11) DEFAULT NULL COMMENT 'Localidad',
  `dynamic_geodistrict` int(11) DEFAULT NULL COMMENT 'Distrito',
  `text_geo_cp` text COMMENT 'Código Postal',
  `text_geo_tipo_calle` varchar(20) DEFAULT NULL COMMENT 'Tipo de calle',
  `text_geo_calle` varchar(255) DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) DEFAULT NULL COMMENT 'Bloque',
  `text_geo_puerta` varchar(20) DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) DEFAULT NULL COMMENT 'GPS Longitud',
  `number_geo_zoom` smallint(5) unsigned NOT NULL COMMENT 'Zoom Google Maps',
  `number_unidades` smallint(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de alojamientos',
  `number_capacidad_maxima` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Número máximo de personas',
  `number_capacidad_minima` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Número mínimo de personas',
  `number_habitaciones` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Número de habitaciones',
  `number_camas_doble` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de camas dobles',
  `number_camas_individual` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de camas individuales',
  `number_sofas_cama` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de sofás cama',
  `number_sofas_cama_doble` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de sofás cama doble',
  `number_literas` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de literas',
  `number_aseos` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de aseos',
  `number_banyos_banyera` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de baños con bañera',
  `number_banyos_ducha` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de baños con ducha',
  `number_metros_cuadrados` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de metros cuadrados',
  `number_metros_cuadrados_utiles` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Metros cuadrados, superfície útil',
  `number_metros_cuadrados_construidos` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Metros cuadrados, superfície construida',
  `number_metros_cuadrados_terraza` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Metros cuadrados, terraza',
  `number_cocinas` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número cocinas',
  `number_fan` int(11) NOT NULL DEFAULT '0' COMMENT 'Número de ventiladores',
  `checkbox_grups` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `checkbox_piscina` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene piscina?',
  `text_tipo_piscina` varchar(255) NOT NULL DEFAULT '',
  `checkbox_tv` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene tv?',
  `checkbox_jardin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene jardín?',
  `checkbox_muebles_jardin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene muebles de jardín?',
  `checkbox_plancha` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene plancha?',
  `checkbox_chimenea` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene chimenea?',
  `checkbox_barbacoa` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene barbacoa?',
  `checkbox_radio` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene radio?',
  `checkbox_minibar` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene mini-bar?',
  `checkbox_terraza` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene terraza?',
  `checkbox_parcela_vallada` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene parcela vallada?',
  `checkbox_caja_seguridad` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene caja de seguridad?',
  `checkbox_ascensor` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene ascensor?',
  `checkbox_dvd` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene reproductor de DVD?',
  `checkbox_balcon` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene balcón?',
  `checkbox_exprimidor` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene exprimidor?',
  `checkbox_hervidor_electrico` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene hervidor electrico?',
  `checkbox_secador_pelo` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene secador de pelo?',
  `checkbox_zona_ninos` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene zona para niños?',
  `checkbox_gimnasio` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene gimnasio?',
  `checkbox_alarma` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene alarma?',
  `checkbox_tennis` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene tennis?',
  `checkbox_squash` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene squash?',
  `checkbox_paddel` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene paddel?',
  `checkbox_sauna` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene sauna?',
  `checkbox_jacuzzi` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene jacuzzi?',
  `checkbox_apta_discapacitados` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Apta para discapacitados?',
  `checkbox_fumadores` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Permitido fumar?',
  `text_cocina_clase` varchar(75) NOT NULL DEFAULT '' COMMENT 'Clase de cocina',
  `text_cocina_tipo` varchar(75) NOT NULL DEFAULT '' COMMENT 'Tipo de cocina',
  `text_orientacion` varchar(75) DEFAULT NULL COMMENT 'Orientación',
  `checkbox_nevera` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene nevera?',
  `checkbox_congelador` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene congelador?',
  `checkbox_lavavajillas` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene lavavajillas?',
  `checkbox_lavadora` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene lavadora?',
  `checkbox_secadora` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene secadora?',
  `checkbox_cafetera` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene cafetera?',
  `checkbox_tostadora` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene tostadora?',
  `checkbox_microondas` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene microondas?',
  `checkbox_horno` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene horno?',
  `checkbox_vajilla` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene vajilla?',
  `checkbox_utensilios_cocina` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene utensilios de concina?',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Alojamientos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_descriptions`
--

DROP TABLE IF EXISTS `avantio_accomodations_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_descriptions` (
  `language` varchar(5) NOT NULL DEFAULT 'es',
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `booking_url` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`language`,`avantio_accomodations`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Descriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_descriptions_tmp`
--

DROP TABLE IF EXISTS `avantio_accomodations_descriptions_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_descriptions_tmp` (
  `language` varchar(5) NOT NULL DEFAULT 'es',
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `booking_url` varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY (`language`,`avantio_accomodations`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Descriptions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_extras`
--

DROP TABLE IF EXISTS `avantio_accomodations_extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_extras` (
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `dynamic_services` int(10) unsigned NOT NULL DEFAULT '0',
  `checkbox_included` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `price_unit` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `price_children` int(10) unsigned NOT NULL DEFAULT '0',
  `price_children_unit` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `checkbox_pago_en_reserva` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checkbox_opcional` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `text_type` varchar(75) NOT NULL DEFAULT '',
  `text_parking_location` varchar(45) NOT NULL DEFAULT '',
  `number_limit_weight` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`avantio_accomodations`,`dynamic_services`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Servicios extras';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_extras_tmp`
--

DROP TABLE IF EXISTS `avantio_accomodations_extras_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_extras_tmp` (
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `dynamic_services` int(10) unsigned NOT NULL DEFAULT '0',
  `checkbox_included` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `price_unit` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `price_children` int(10) unsigned NOT NULL DEFAULT '0',
  `price_children_unit` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `checkbox_pago_en_reserva` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checkbox_opcional` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `text_type` varchar(75) NOT NULL DEFAULT '',
  `text_parking_location` varchar(45) NOT NULL DEFAULT '',
  `number_limit_weight` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`avantio_accomodations`,`dynamic_services`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Servicios extras';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_locations`
--

DROP TABLE IF EXISTS `avantio_accomodations_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_locations` (
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `loc_where` varchar(255) NOT NULL DEFAULT '',
  `loc_howto` varchar(255) NOT NULL DEFAULT '',
  `loc_desc1` varchar(255) NOT NULL DEFAULT '',
  `loc_desc2` varchar(255) NOT NULL DEFAULT '',
  `beach_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `beach_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `golf_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `golf_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `city_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `city_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `super_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `super_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `airport_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `airport_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `train_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `train_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `bus_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `bus_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `view_to_beach` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_swimming_pool` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_golf` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_garden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_river` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_mountain` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_lake` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `first_line_beach` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `first_line_golf` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`avantio_accomodations`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Localizaciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_locations_tmp`
--

DROP TABLE IF EXISTS `avantio_accomodations_locations_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_locations_tmp` (
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `loc_where` varchar(255) NOT NULL DEFAULT '',
  `loc_howto` varchar(255) NOT NULL DEFAULT '',
  `loc_desc1` varchar(255) NOT NULL DEFAULT '',
  `loc_desc2` varchar(255) NOT NULL DEFAULT '',
  `beach_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `beach_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `golf_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `golf_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `city_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `city_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `super_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `super_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `airport_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `airport_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `train_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `train_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `bus_name` varchar(75) NOT NULL DEFAULT 'RESERVA',
  `bus_dist` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  `view_to_beach` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_swimming_pool` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_golf` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_garden` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_river` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_mountain` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `view_to_lake` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `first_line_beach` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `first_line_golf` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`avantio_accomodations`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Localizaciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_nearest_places`
--

DROP TABLE IF EXISTS `avantio_accomodations_nearest_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_nearest_places` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `place_type` varchar(75) NOT NULL DEFAULT '',
  `place_name` varchar(255) NOT NULL DEFAULT '',
  `distance` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  PRIMARY KEY (`id`),
  KEY `accomodation` (`avantio_accomodations`)
) ENGINE=MyISAM AUTO_INCREMENT=968 DEFAULT CHARSET=utf8 COMMENT='Nearest Places';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_nearest_places_tmp`
--

DROP TABLE IF EXISTS `avantio_accomodations_nearest_places_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_nearest_places_tmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `place_type` varchar(75) NOT NULL DEFAULT '',
  `place_name` varchar(255) NOT NULL DEFAULT '',
  `distance` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'metros',
  PRIMARY KEY (`id`),
  KEY `accomodation` (`avantio_accomodations`)
) ENGINE=MyISAM AUTO_INCREMENT=968 DEFAULT CHARSET=utf8 COMMENT='Nearest Places';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_pictures`
--

DROP TABLE IF EXISTS `avantio_accomodations_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_pictures` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `uri_900x600` varchar(255) NOT NULL DEFAULT '',
  `uri_650x450` varchar(255) NOT NULL DEFAULT '',
  `uri_99x66` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`avantio_accomodations`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Pictures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_pictures_tmp`
--

DROP TABLE IF EXISTS `avantio_accomodations_pictures_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_pictures_tmp` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `uri_900x600` varchar(255) NOT NULL DEFAULT '',
  `uri_650x450` varchar(255) NOT NULL DEFAULT '',
  `uri_99x66` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`avantio_accomodations`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Pictures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_accomodations_tmp`
--

DROP TABLE IF EXISTS `avantio_accomodations_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_accomodations_tmp` (
  `id` int(11) NOT NULL DEFAULT '0',
  `text_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) NOT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) NOT NULL DEFAULT '',
  `text_company` varchar(75) NOT NULL DEFAULT '',
  `number_companyid` int(10) unsigned NOT NULL DEFAULT '0',
  `text_numero_registro_turistico` varchar(255) NOT NULL DEFAULT '' COMMENT 'Número de registro turístico',
  `avantio_occupation_rules` int(11) unsigned DEFAULT NULL COMMENT 'Regla de ocupación',
  `avantio_pricemodifiers` int(11) unsigned DEFAULT NULL COMMENT 'Modificador de precio',
  `avantio_gallery` int(11) unsigned DEFAULT NULL COMMENT 'Galería',
  `dynamic_taxonomy` int(11) DEFAULT NULL COMMENT 'Taxonomía (Kinds)',
  `dynamic_geocountry` int(11) DEFAULT NULL COMMENT 'País',
  `dynamic_georegion` int(11) DEFAULT NULL COMMENT 'Región',
  `dynamic_geocity` int(11) DEFAULT NULL COMMENT 'Ciudad',
  `dynamic_geolocality` int(11) DEFAULT NULL COMMENT 'Localidad',
  `dynamic_geodistrict` int(11) DEFAULT NULL COMMENT 'Distrito',
  `text_geo_cp` text COMMENT 'Código Postal',
  `text_geo_tipo_calle` varchar(20) DEFAULT NULL COMMENT 'Tipo de calle',
  `text_geo_calle` varchar(255) DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) DEFAULT NULL COMMENT 'Bloque',
  `text_geo_puerta` varchar(20) DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) DEFAULT NULL COMMENT 'GPS Longitud',
  `number_geo_zoom` smallint(5) unsigned NOT NULL COMMENT 'Zoom Google Maps',
  `number_unidades` smallint(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de alojamientos',
  `number_capacidad_maxima` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Número máximo de personas',
  `number_capacidad_minima` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Número mínimo de personas',
  `number_habitaciones` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Número de habitaciones',
  `number_camas_doble` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de camas dobles',
  `number_camas_individual` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de camas individuales',
  `number_sofas_cama` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de sofás cama',
  `number_sofas_cama_doble` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de sofás cama doble',
  `number_literas` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de literas',
  `number_aseos` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de aseos',
  `number_banyos_banyera` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de baños con bañera',
  `number_banyos_ducha` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de baños con ducha',
  `number_metros_cuadrados` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de metros cuadrados',
  `number_metros_cuadrados_utiles` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Metros cuadrados, superfície útil',
  `number_metros_cuadrados_construidos` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Metros cuadrados, superfície construida',
  `number_metros_cuadrados_terraza` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Metros cuadrados, terraza',
  `number_cocinas` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número cocinas',
  `number_fan` int(11) NOT NULL DEFAULT '0' COMMENT 'Número de ventiladores',
  `checkbox_grups` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `checkbox_piscina` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene piscina?',
  `text_tipo_piscina` varchar(255) NOT NULL DEFAULT '',
  `checkbox_tv` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene tv?',
  `checkbox_jardin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene jardín?',
  `checkbox_muebles_jardin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene muebles de jardín?',
  `checkbox_plancha` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene plancha?',
  `checkbox_chimenea` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene chimenea?',
  `checkbox_barbacoa` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene barbacoa?',
  `checkbox_radio` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene radio?',
  `checkbox_minibar` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene mini-bar?',
  `checkbox_terraza` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene terraza?',
  `checkbox_parcela_vallada` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene parcela vallada?',
  `checkbox_caja_seguridad` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene caja de seguridad?',
  `checkbox_ascensor` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene ascensor?',
  `checkbox_dvd` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene reproductor de DVD?',
  `checkbox_balcon` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene balcón?',
  `checkbox_exprimidor` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene exprimidor?',
  `checkbox_hervidor_electrico` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene hervidor electrico?',
  `checkbox_secador_pelo` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene secador de pelo?',
  `checkbox_zona_ninos` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene zona para niños?',
  `checkbox_gimnasio` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene gimnasio?',
  `checkbox_alarma` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene alarma?',
  `checkbox_tennis` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene tennis?',
  `checkbox_squash` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene squash?',
  `checkbox_paddel` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene paddel?',
  `checkbox_sauna` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene sauna?',
  `checkbox_jacuzzi` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene jacuzzi?',
  `checkbox_apta_discapacitados` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Apta para discapacitados?',
  `checkbox_fumadores` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Permitido fumar?',
  `text_cocina_clase` varchar(75) NOT NULL DEFAULT '' COMMENT 'Clase de cocina',
  `text_cocina_tipo` varchar(75) NOT NULL DEFAULT '' COMMENT 'Tipo de cocina',
  `text_orientacion` varchar(75) DEFAULT NULL COMMENT 'Orientación',
  `checkbox_nevera` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene nevera?',
  `checkbox_congelador` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene congelador?',
  `checkbox_lavavajillas` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene lavavajillas?',
  `checkbox_lavadora` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene lavadora?',
  `checkbox_secadora` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene secadora?',
  `checkbox_cafetera` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene cafetera?',
  `checkbox_tostadora` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene tostadora?',
  `checkbox_microondas` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene microondas?',
  `checkbox_horno` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene horno?',
  `checkbox_vajilla` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene vajilla?',
  `checkbox_utensilios_cocina` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene utensilios de concina?',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Alojamientos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_availabilities`
--

DROP TABLE IF EXISTS `avantio_availabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_availabilities` (
  `accommodation_id` int(10) unsigned NOT NULL,
  `occupation_rule_id` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`accommodation_id`,`occupation_rule_id`,`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_availabilities_tmp`
--

DROP TABLE IF EXISTS `avantio_availabilities_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_availabilities_tmp` (
  `accommodation_id` int(10) unsigned NOT NULL,
  `occupation_rule_id` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`accommodation_id`,`occupation_rule_id`,`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_inmovilla`
--

DROP TABLE IF EXISTS `avantio_inmovilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_inmovilla` (
  `id` int(11) NOT NULL DEFAULT '0',
  `text_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) NOT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) NOT NULL DEFAULT '',
  `text_company` varchar(75) NOT NULL DEFAULT '',
  `number_companyid` int(10) unsigned NOT NULL DEFAULT '0',
  `text_numero_registro_turistico` varchar(255) NOT NULL DEFAULT '' COMMENT 'Número de registro turístico',
  `avantio_occupation_rules` int(11) unsigned DEFAULT NULL COMMENT 'Regla de ocupación',
  `avantio_pricemodifiers` int(11) unsigned DEFAULT NULL COMMENT 'Modificador de precio',
  `avantio_gallery` int(11) unsigned DEFAULT NULL COMMENT 'Galería',
  `dynamic_taxonomy` int(11) DEFAULT NULL COMMENT 'Taxonomía (Kinds)',
  `dynamic_geocountry` int(11) DEFAULT NULL COMMENT 'País',
  `dynamic_georegion` int(11) DEFAULT NULL COMMENT 'Región',
  `dynamic_geocity` int(11) DEFAULT NULL COMMENT 'Ciudad',
  `dynamic_geolocality` int(11) DEFAULT NULL COMMENT 'Localidad',
  `dynamic_geodistrict` int(11) DEFAULT NULL COMMENT 'Distrito',
  `text_geo_cp` text COMMENT 'Código Postal',
  `text_geo_tipo_calle` varchar(20) DEFAULT NULL COMMENT 'Tipo de calle',
  `text_geo_calle` varchar(255) DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) DEFAULT NULL COMMENT 'Bloque',
  `text_geo_puerta` varchar(20) DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) DEFAULT NULL COMMENT 'GPS Longitud',
  `number_geo_zoom` smallint(5) unsigned NOT NULL COMMENT 'Zoom Google Maps',
  `number_unidades` smallint(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de alojamientos',
  `number_capacidad_maxima` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Número máximo de personas',
  `number_capacidad_minima` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Número mínimo de personas',
  `number_habitaciones` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'Número de habitaciones',
  `number_camas_doble` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de camas dobles',
  `number_camas_individual` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de camas individuales',
  `number_sofas_cama` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de sofás cama',
  `number_sofas_cama_doble` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de sofás cama doble',
  `number_literas` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de literas',
  `number_aseos` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de aseos',
  `number_banyos_banyera` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de baños con bañera',
  `number_banyos_ducha` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de baños con ducha',
  `number_metros_cuadrados` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número de metros cuadrados',
  `number_metros_cuadrados_utiles` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Metros cuadrados, superfície útil',
  `number_metros_cuadrados_construidos` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Metros cuadrados, superfície construida',
  `number_metros_cuadrados_terraza` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Metros cuadrados, terraza',
  `number_cocinas` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Número cocinas',
  `number_fan` int(11) NOT NULL DEFAULT '0' COMMENT 'Número de ventiladores',
  `checkbox_grups` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `checkbox_piscina` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene piscina?',
  `text_tipo_piscina` varchar(255) NOT NULL DEFAULT '',
  `checkbox_tv` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene tv?',
  `checkbox_jardin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene jardín?',
  `checkbox_muebles_jardin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene muebles de jardín?',
  `checkbox_plancha` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene plancha?',
  `checkbox_chimenea` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene chimenea?',
  `checkbox_barbacoa` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene barbacoa?',
  `checkbox_radio` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene radio?',
  `checkbox_minibar` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene mini-bar?',
  `checkbox_terraza` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene terraza?',
  `checkbox_parcela_vallada` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene parcela vallada?',
  `checkbox_caja_seguridad` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene caja de seguridad?',
  `checkbox_ascensor` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene ascensor?',
  `checkbox_dvd` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene reproductor de DVD?',
  `checkbox_balcon` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene balcón?',
  `checkbox_exprimidor` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene exprimidor?',
  `checkbox_hervidor_electrico` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene hervidor electrico?',
  `checkbox_secador_pelo` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene secador de pelo?',
  `checkbox_zona_ninos` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene zona para niños?',
  `checkbox_gimnasio` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene gimnasio?',
  `checkbox_alarma` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene alarma?',
  `checkbox_tennis` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene tennis?',
  `checkbox_squash` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene squash?',
  `checkbox_paddel` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene paddel?',
  `checkbox_sauna` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene sauna?',
  `checkbox_jacuzzi` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene jacuzzi?',
  `checkbox_apta_discapacitados` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Apta para discapacitados?',
  `checkbox_fumadores` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Permitido fumar?',
  `text_cocina_clase` varchar(75) NOT NULL DEFAULT '' COMMENT 'Clase de cocina',
  `text_cocina_tipo` varchar(75) NOT NULL DEFAULT '' COMMENT 'Tipo de cocina',
  `text_orientacion` varchar(75) DEFAULT NULL COMMENT 'Orientación',
  `checkbox_nevera` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene nevera?',
  `checkbox_congelador` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene congelador?',
  `checkbox_lavavajillas` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene lavavajillas?',
  `checkbox_lavadora` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene lavadora?',
  `checkbox_secadora` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene secadora?',
  `checkbox_cafetera` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene cafetera?',
  `checkbox_tostadora` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene tostadora?',
  `checkbox_microondas` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene microondas?',
  `checkbox_horno` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene horno?',
  `checkbox_vajilla` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene vajilla?',
  `checkbox_utensilios_cocina` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '¿Tiene utensilios de concina?',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Alojamientos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_occupation_rules`
--

DROP TABLE IF EXISTS `avantio_occupation_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_occupation_rules` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `min_nights` smallint(5) unsigned NOT NULL DEFAULT '1',
  `min_nights_online` smallint(5) unsigned NOT NULL DEFAULT '1',
  `checkin` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `checkout` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reglas de ocupación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_occupation_rules_names`
--

DROP TABLE IF EXISTS `avantio_occupation_rules_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_occupation_rules_names` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_occupation_rules_tmp`
--

DROP TABLE IF EXISTS `avantio_occupation_rules_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_occupation_rules_tmp` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `min_nights` smallint(5) unsigned NOT NULL DEFAULT '1',
  `min_nights_online` smallint(5) unsigned NOT NULL DEFAULT '1',
  `checkin` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `checkout` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reglas de ocupación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_pricemodifiers`
--

DROP TABLE IF EXISTS `avantio_pricemodifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_pricemodifiers` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL DEFAULT '',
  `fecha` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `code` varchar(20) NOT NULL,
  `acumulative` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `min_nights` int(11) unsigned NOT NULL DEFAULT '0',
  `max_nights` int(11) unsigned NOT NULL DEFAULT '0',
  `type` enum('tpc','val') NOT NULL DEFAULT 'tpc',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`,`fecha`,`min_nights`,`max_nights`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_pricemodifiers_tmp`
--

DROP TABLE IF EXISTS `avantio_pricemodifiers_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_pricemodifiers_tmp` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL DEFAULT '',
  `fecha` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `code` varchar(20) NOT NULL,
  `acumulative` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `min_nights` int(11) unsigned NOT NULL DEFAULT '0',
  `max_nights` int(11) unsigned NOT NULL DEFAULT '0',
  `type` enum('tpc','val') NOT NULL DEFAULT 'tpc',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`,`fecha`,`min_nights`,`max_nights`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_pricemodifiers_tmp_vlad`
--

DROP TABLE IF EXISTS `avantio_pricemodifiers_tmp_vlad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_pricemodifiers_tmp_vlad` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(75) NOT NULL DEFAULT '',
  `fecha` date NOT NULL,
  `code` varchar(20) NOT NULL,
  `acumulative` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `min_nights` int(11) unsigned NOT NULL DEFAULT '0',
  `max_nights` int(11) unsigned NOT NULL DEFAULT '0',
  `type` enum('tpc','val') NOT NULL DEFAULT 'tpc',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`,`fecha`,`min_nights`,`max_nights`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_rates`
--

DROP TABLE IF EXISTS `avantio_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_rates` (
  `accommodation_id` int(10) unsigned NOT NULL,
  `capacity` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `price` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accommodation_id`,`capacity`,`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_rates_tmp`
--

DROP TABLE IF EXISTS `avantio_rates_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_rates_tmp` (
  `accommodation_id` int(10) unsigned NOT NULL,
  `capacity` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `price` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accommodation_id`,`capacity`,`fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_report`
--

DROP TABLE IF EXISTS `avantio_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parametro_report` varchar(255) NOT NULL DEFAULT 'es',
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Report Avantio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `avantio_report_historico`
--

DROP TABLE IF EXISTS `avantio_report_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avantio_report_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_avantio_report` int(11) NOT NULL,
  `fichero` varchar(255) DEFAULT 'fichero',
  PRIMARY KEY (`id`),
  KEY `fk_avantio_report_historico_y_avantio_report_constraint` (`id_avantio_report`),
  CONSTRAINT `fk_avantio_report_historico_y_avantio_report_constraint` FOREIGN KEY (`id_avantio_report`) REFERENCES `avantio_report` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Report Avantio historico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ci_sessions` (
  `id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Información de contacto',
  `name` varchar(75) DEFAULT 'Nombre' COMMENT 'Nombre',
  `email` varchar(75) DEFAULT NULL COMMENT 'Email',
  `phone` varchar(75) DEFAULT NULL COMMENT 'Telf',
  `subject` varchar(75) DEFAULT NULL COMMENT 'Titulo',
  `form_message` varchar(255) DEFAULT NULL COMMENT 'Mensaje',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Contacto';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_accion`
--

DROP TABLE IF EXISTS `dynamic_accion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_accion` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título Cabecera',
  `text_title_url` varchar(75) DEFAULT NULL COMMENT 'url',
  `textarea_description` text COMMENT 'Contenido de la página',
  `text_body_title_no_res` varchar(75) DEFAULT NULL COMMENT 'Título de la página cuando NO se encuentran resultados',
  `textarea_description_no_res` text COMMENT 'Contenido de la página cuando NO se encuentran resultados',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipos Aciones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_advantages`
--

DROP TABLE IF EXISTS `dynamic_advantages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_advantages` (
  `id` int(11) NOT NULL,
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `textarea_description` text COMMENT 'Descripción',
  `text_icon` varchar(45) DEFAULT NULL COMMENT 'Icon: ‘wifi’, ‘reloj’, ‘teleoperadora’, ‘dinero’, ‘bienvenido’, ‘llave’',
  `checkbox_destacada_home` varchar(45) DEFAULT NULL COMMENT 'Destacar en la home (si/no)',
  `checkbox_destacada_alojamiento` varchar(45) DEFAULT NULL COMMENT 'Destacar en la página de alojamiento',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ventajas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_agencia`
--

DROP TABLE IF EXISTS `dynamic_agencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_agencia` (
  `id` int(11) NOT NULL DEFAULT '0',
  `dynamic_user` int(11) NOT NULL DEFAULT '0' COMMENT 'User',
  `dynamic_gallery_agencia_principal` int(11) DEFAULT '0' COMMENT 'Galeria Franquicia',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título Cabecera',
  `number_telf` int(11) DEFAULT '0' COMMENT 'Número de teléfono',
  `number_mobile` int(11) DEFAULT '0' COMMENT 'Número de movil',
  `number_fax` int(11) DEFAULT '0' COMMENT 'Número de fax',
  `text_direccion` varchar(255) DEFAULT NULL COMMENT 'Dirección de la agencia',
  `text_email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `text_website` varchar(255) DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` text COMMENT 'Contenido de la página',
  `text_latitud` varchar(20) DEFAULT '0' COMMENT 'Latitud google maps',
  `text_longitud` varchar(20) DEFAULT '0' COMMENT 'Longitud google maps',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`),
  UNIQUE KEY `dynamic_user` (`dynamic_user`),
  UNIQUE KEY `dynamic_gallery_agencia_principal` (`dynamic_gallery_agencia_principal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Agencias Turísticas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_cron`
--

DROP TABLE IF EXISTS `dynamic_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_cron` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Identificador cron',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'Lenguaje cron',
  `text_title` varchar(255) DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `text_direccion` varchar(255) DEFAULT NULL COMMENT 'Dirección http cron ejemplo: http://mispisos.com/fichero.xml',
  `dynamic_agencia` int(11) DEFAULT NULL COMMENT 'Identificador de agencia',
  `dynamic_usuario` int(11) DEFAULT NULL COMMENT 'Identificador de usuario',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(75) DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'Short url (slug)',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description (max 255 characters) ',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters) ',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;) ',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;) ',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Inmobiliarias y usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_empresa`
--

DROP TABLE IF EXISTS `dynamic_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_empresa` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Identificador de la empresa',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) DEFAULT NULL COMMENT 'Titulo',
  `text_subtitle` varchar(255) DEFAULT NULL COMMENT 'Subtítulo',
  `number_telf` int(11) DEFAULT NULL COMMENT 'telf',
  `number_mobile` int(11) DEFAULT NULL COMMENT 'mobile',
  `number_fax` int(11) DEFAULT NULL COMMENT 'fax',
  `text_direccion` varchar(255) DEFAULT NULL COMMENT 'dirección',
  `text_email` varchar(255) DEFAULT NULL COMMENT 'email',
  `text_website` varchar(255) DEFAULT NULL COMMENT 'website',
  `dynamic_taxonomy_group` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Grupo tipo de inmueble piso, casa',
  `dynamic_geolocality` int(11) DEFAULT '0' COMMENT 'Población',
  `dynamic_accion` int(11) DEFAULT '0' COMMENT 'Comprar | Alquilar | Compartir',
  `dynamic_gallery_empresa` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Galería Fotos',
  `textarea_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción principal',
  `textarea_description_2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción secundaria',
  `textarea_interior` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción opcional (No visible)',
  `text_latitud` varchar(20) DEFAULT NULL COMMENT 'latitud',
  `text_longitud` varchar(20) DEFAULT NULL COMMENT 'longitud',
  `text_body_title` varchar(75) DEFAULT NULL COMMENT 'text_body_title',
  `text_facebook` varchar(255) DEFAULT NULL COMMENT 'facebook',
  `text_twitter` varchar(255) DEFAULT NULL COMMENT 'twitter',
  `text_instagram` varchar(255) DEFAULT NULL COMMENT 'instagram',
  `text_pinterest` varchar(255) DEFAULT NULL COMMENT 'pinterest',
  `text_google_plus` varchar(255) DEFAULT NULL COMMENT 'text_google_plus',
  `google_place_id` varchar(255) DEFAULT '' COMMENT 'id google places',
  `google_url` varchar(255) DEFAULT '' COMMENT 'url google maps',
  `checkbox_destacado_provincia` tinyint(4) DEFAULT '0' COMMENT 'Destacado página población',
  `checkbox_destacado_listado_inmobiliarias` tinyint(4) DEFAULT '0' COMMENT 'Destacado página listado inmobiliarias',
  `checkbox_destacado_detalle_inmobiliaria` tinyint(4) DEFAULT '0' COMMENT 'Destacado página detalle inmobiliaria',
  `checkbox_destacado_detalle_propiedad` tinyint(4) DEFAULT '0' COMMENT 'Destacado página detalle propiedad',
  `checkbox_destacado_buscador` int(11) DEFAULT NULL COMMENT 'checkbox destacado buscador',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` mediumtext CHARACTER SET utf8mb4 COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Listado Empresas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_faqsagentes`
--

DROP TABLE IF EXISTS `dynamic_faqsagentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_faqsagentes` (
  `id` int(11) NOT NULL COMMENT 'identificador',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `dynamic_faqsagentes_type` int(11) DEFAULT NULL COMMENT 'faq propietarios',
  `textarea_description` text COMMENT 'Descripción',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` text COMMENT 'Scripts header',
  `textarea_scripts_body` text COMMENT 'Scripts body',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Faq Agentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_faqsagentes_type`
--

DROP TABLE IF EXISTS `dynamic_faqsagentes_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_faqsagentes_type` (
  `id` int(11) NOT NULL COMMENT 'identificador',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` text COMMENT 'Scripts header',
  `textarea_scripts_body` text COMMENT 'Scripts body',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipos Faq Agentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_faqsinmobiliarias`
--

DROP TABLE IF EXISTS `dynamic_faqsinmobiliarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_faqsinmobiliarias` (
  `id` int(11) NOT NULL COMMENT 'identificador',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `dynamic_faqsinmobiliarias_type` int(11) DEFAULT NULL COMMENT 'faq propietarios',
  `textarea_description` text COMMENT 'Descripción',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` text COMMENT 'Scripts header',
  `textarea_scripts_body` text COMMENT 'Scripts body',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Faq Inmobiliarias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_faqsinmobiliarias_type`
--

DROP TABLE IF EXISTS `dynamic_faqsinmobiliarias_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_faqsinmobiliarias_type` (
  `id` int(11) NOT NULL COMMENT 'identificador',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` text COMMENT 'Scripts header',
  `textarea_scripts_body` text COMMENT 'Scripts body',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipos Faq Inmobiliarias';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_faqspropietarios`
--

DROP TABLE IF EXISTS `dynamic_faqspropietarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_faqspropietarios` (
  `id` int(11) NOT NULL COMMENT 'identificador',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `dynamic_faqspropietarios_type` int(11) DEFAULT NULL COMMENT 'faq propietarios',
  `textarea_description` text COMMENT 'Descripción',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` text COMMENT 'Scripts header',
  `textarea_scripts_body` text COMMENT 'Scripts body',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Faq Propietarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_faqspropietarios_type`
--

DROP TABLE IF EXISTS `dynamic_faqspropietarios_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_faqspropietarios_type` (
  `id` int(11) NOT NULL COMMENT 'identificador',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` text COMMENT 'Scripts header',
  `textarea_scripts_body` text COMMENT 'Scripts body',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipos Faq Propietarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_franquicia`
--

DROP TABLE IF EXISTS `dynamic_franquicia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_franquicia` (
  `id` int(11) NOT NULL COMMENT 'identificador',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'Lenguaje',
  `dynamic_gallery_franquicia_principal` varchar(45) DEFAULT '' COMMENT 'Galeria Franquicia',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Titulo',
  `text_firstname` varchar(75) DEFAULT NULL COMMENT 'Nombre',
  `text_lastname` varchar(75) DEFAULT NULL COMMENT 'Apellido',
  `number_telf` int(10) DEFAULT '0' COMMENT 'Telefono',
  `number_telf_mobil` int(10) DEFAULT '0' COMMENT 'Telefono mobil',
  `email` varchar(75) DEFAULT NULL COMMENT 'Email',
  `text_direccion` varchar(20) DEFAULT NULL COMMENT 'Dirección',
  `textarea_description` text COMMENT 'Descripción',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Page Title',
  `text_slug` varchar(255) DEFAULT NULL COMMENT 'Text slug',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Text Meta Keywords',
  `textarea_scripts_header` text COMMENT 'Text Meta Scripts header',
  `textarea_scripts_body` text COMMENT 'Text Meta Scripts body',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Text Meta Keywords',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Text Meta Robots',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datos Franquicia';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_gallery_agencia_principal`
--

DROP TABLE IF EXISTS `dynamic_gallery_agencia_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_gallery_agencia_principal` (
  `id` int(11) NOT NULL DEFAULT '0',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título Bloque',
  `zip_status` varchar(128) DEFAULT NULL,
  `text_alt` varchar(75) DEFAULT NULL COMMENT 'Alt imagen',
  `image_principal` varchar(255) DEFAULT NULL COMMENT 'Imagen principal',
  `text_importada` int(11) DEFAULT NULL COMMENT 'Text Importada',
  `imagethn_principal` varchar(255) DEFAULT NULL COMMENT 'Imagen principal oculta',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Galeria agencia principal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_gallery_empresa`
--

DROP TABLE IF EXISTS `dynamic_gallery_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_gallery_empresa` (
  `id` int(11) NOT NULL COMMENT 'identificador de las imágenes',
  `language` varchar(3) DEFAULT 'es' COMMENT 'Idioma',
  `zipstatus` varchar(128) DEFAULT NULL,
  `text_title` varchar(75) DEFAULT NULL COMMENT 'titulo',
  `dynamic_usuario` varchar(45) DEFAULT '' COMMENT 'Usuario',
  `text_title_image_1` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_1` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_1` varchar(255) DEFAULT NULL,
  `text_title_image_2` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_2` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_2` varchar(255) DEFAULT NULL,
  `text_alt_image_3` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `text_title_image_3` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `image_3` varchar(255) DEFAULT NULL,
  `text_title_image_4` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_4` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_4` varchar(255) DEFAULT NULL,
  `text_title_image_5` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_5` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_5` varchar(255) DEFAULT NULL,
  `text_title_image_6` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_6` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_6` varchar(255) DEFAULT NULL,
  `text_title_image_7` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_7` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_7` varchar(255) DEFAULT NULL,
  `text_title_image_8` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_8` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_8` varchar(255) DEFAULT NULL,
  `text_title_image_9` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_9` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_9` varchar(255) DEFAULT NULL,
  `text_title_image_10` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_10` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_10` varchar(255) DEFAULT NULL,
  `text_title_image_11` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_11` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_11` varchar(255) DEFAULT NULL,
  `text_title_image_12` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_12` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_12` varchar(255) DEFAULT NULL,
  `text_title_image_13` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_13` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_13` varchar(255) DEFAULT NULL,
  `text_title_image_14` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_14` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_14` varchar(255) DEFAULT NULL,
  `text_title_image_15` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_15` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_15` varchar(255) DEFAULT NULL,
  `text_alt_image_16` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `text_title_image_16` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `image_16` varchar(255) DEFAULT NULL,
  `text_title_image_17` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_17` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_17` varchar(255) DEFAULT NULL,
  `text_title_image_18` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_18` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_18` varchar(255) DEFAULT NULL,
  `text_title_image_19` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_19` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_19` varchar(255) DEFAULT NULL,
  `text_title_image_20` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_20` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_20` varchar(255) DEFAULT NULL,
  `text_title_image_21` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_21` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_21` varchar(255) DEFAULT NULL,
  `text_title_image_22` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_22` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_22` varchar(255) DEFAULT NULL,
  `text_title_image_23` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_23` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_23` varchar(255) DEFAULT NULL,
  `text_title_image_24` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_24` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_24` varchar(255) DEFAULT NULL,
  `text_title_image_25` varchar(75) DEFAULT NULL COMMENT 'titulo imagen',
  `text_alt_image_25` varchar(75) DEFAULT NULL COMMENT 'alt imagen',
  `image_25` varchar(255) DEFAULT NULL,
  `position` varchar(45) DEFAULT '' COMMENT 'Position',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Galerias Empresas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_gallery_empresa_banner`
--

DROP TABLE IF EXISTS `dynamic_gallery_empresa_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_gallery_empresa_banner` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Identificador de la galeria',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) DEFAULT NULL COMMENT 'Titulo',
  `zipstatus` varchar(255) DEFAULT NULL COMMENT 'Zip Status',
  `text_alt` varchar(255) DEFAULT NULL COMMENT 'Text alt',
  `image_principal` varchar(255) DEFAULT NULL COMMENT 'Image principal',
  `text_importada` varchar(255) DEFAULT NULL COMMENT 'Text importada',
  `imagethn_principal` varchar(255) DEFAULT NULL COMMENT 'Imageth principal',
  `status` varchar(128) DEFAULT 'ACTIVED',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Galería empresa baner';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_gallery_empresa_principal`
--

DROP TABLE IF EXISTS `dynamic_gallery_empresa_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_gallery_empresa_principal` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `zipstatus` varchar(128) DEFAULT NULL,
  `image_principal` varchar(255) DEFAULT NULL,
  `text_title` varchar(75) DEFAULT NULL,
  `text_alt` varchar(75) DEFAULT NULL,
  `imagethn_principal` varchar(255) DEFAULT NULL,
  `text_importada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gallery Empresa Principal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_gallery_franquicia_principal`
--

DROP TABLE IF EXISTS `dynamic_gallery_franquicia_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_gallery_franquicia_principal` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `zipstatus` varchar(128) DEFAULT NULL,
  `image_principal` varchar(255) DEFAULT NULL,
  `text_title` varchar(75) DEFAULT NULL,
  `text_alt` varchar(75) DEFAULT NULL,
  `imagethn_principal` varchar(255) DEFAULT NULL,
  `text_importada` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gallery Franquicia Principal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_gallery_inmo`
--

DROP TABLE IF EXISTS `dynamic_gallery_inmo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_gallery_inmo` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `avantio_accomodations` int(10) unsigned NOT NULL DEFAULT '0',
  `uri_900x600` varchar(255) NOT NULL DEFAULT '',
  `uri_650x450` varchar(255) NOT NULL DEFAULT '',
  `uri_99x66` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`avantio_accomodations`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Pictures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_gallery_inmo_principal`
--

DROP TABLE IF EXISTS `dynamic_gallery_inmo_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_gallery_inmo_principal` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(75) DEFAULT NULL,
  `zipstatus` varchar(128) DEFAULT NULL,
  `text_alt` varchar(75) DEFAULT NULL,
  `image_principal` varchar(255) DEFAULT NULL,
  `text_importada` int(11) DEFAULT NULL,
  `imagethn_principal` varchar(255) DEFAULT NULL,
  `dynamic_agencia` varchar(45) DEFAULT '' COMMENT 'Agencia',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Galeria Perfil';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_gallery_usuario`
--

DROP TABLE IF EXISTS `dynamic_gallery_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_gallery_usuario` (
  `id` int(11) NOT NULL COMMENT 'identificador de las imágenes',
  `zipstatus` varchar(128) DEFAULT NULL,
  `text_title` varchar(255) DEFAULT NULL COMMENT 'titulo de la galería del imueble',
  `text_title_image_1` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 1',
  `text_alt_image_1` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 1',
  `image_1` varchar(255) DEFAULT NULL COMMENT 'imagen 1',
  `text_title_image_2` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 2',
  `text_alt_image_2` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 2',
  `image_2` varchar(255) DEFAULT NULL COMMENT 'imagen 2',
  `text_title_image_3` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 3',
  `text_alt_image_3` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 3',
  `image_3` varchar(255) DEFAULT NULL COMMENT 'imagen 3',
  `text_title_image_4` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 4',
  `text_alt_image_4` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 4',
  `image_4` varchar(255) DEFAULT NULL COMMENT 'imagen 4',
  `text_title_image_5` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 5',
  `text_alt_image_5` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 5',
  `image_5` varchar(255) DEFAULT NULL COMMENT 'imagen 5',
  `text_title_image_6` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 6',
  `text_alt_image_6` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 6',
  `image_6` varchar(255) DEFAULT NULL COMMENT 'imagen 6',
  `text_title_image_7` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 7',
  `text_alt_image_7` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 7',
  `image_7` varchar(255) DEFAULT NULL COMMENT 'imagen 7',
  `text_title_image_8` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 8',
  `text_alt_image_8` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 8',
  `image_8` varchar(255) DEFAULT NULL COMMENT 'imagen 8',
  `text_title_image_9` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 9',
  `text_alt_image_9` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 9',
  `image_9` varchar(255) DEFAULT NULL COMMENT 'imagen 9',
  `text_title_image_10` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 10',
  `text_alt_image_10` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 10',
  `image_10` varchar(255) DEFAULT NULL COMMENT 'imagen 10',
  `text_title_image_11` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 11',
  `text_alt_image_11` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 11',
  `image_11` varchar(255) DEFAULT NULL COMMENT 'imagen 11',
  `text_title_image_12` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 12',
  `text_alt_image_12` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 12',
  `image_12` varchar(255) DEFAULT NULL COMMENT 'imagen 12',
  `text_title_image_13` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 13',
  `text_alt_image_13` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 13',
  `image_13` varchar(255) DEFAULT NULL COMMENT 'imagen 13',
  `text_title_image_14` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 14',
  `text_alt_image_14` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 14',
  `image_14` varchar(255) DEFAULT NULL COMMENT 'imagen 14',
  `text_title_image_15` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 15',
  `text_alt_image_15` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 15',
  `image_15` varchar(255) DEFAULT NULL COMMENT 'imagen 15',
  `text_title_image_16` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 16',
  `text_alt_image_16` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 16',
  `image_16` varchar(255) DEFAULT NULL COMMENT 'imagen 16',
  `text_title_image_17` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 17',
  `text_alt_image_17` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 17',
  `image_17` varchar(255) DEFAULT NULL COMMENT 'imagen 17',
  `text_title_image_18` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 18',
  `text_alt_image_18` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 18',
  `image_18` varchar(255) DEFAULT NULL COMMENT 'imagen 18',
  `text_title_image_19` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 19',
  `text_alt_image_19` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 19',
  `image_19` varchar(255) DEFAULT NULL COMMENT 'imagen 19',
  `text_title_image_20` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 20',
  `text_alt_image_20` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 20',
  `image_20` varchar(255) DEFAULT NULL COMMENT 'imagen 20',
  `text_title_image_21` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 21',
  `text_alt_image_21` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 21',
  `image_21` varchar(255) DEFAULT NULL COMMENT 'imagen 21',
  `text_title_image_22` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 22',
  `text_alt_image_22` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 22',
  `image_22` varchar(255) DEFAULT NULL COMMENT 'imagen 22',
  `text_title_image_23` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 23',
  `text_alt_image_23` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 23',
  `image_23` varchar(255) DEFAULT NULL COMMENT 'imagen 23',
  `text_title_image_24` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 24',
  `text_alt_image_24` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 24',
  `image_24` varchar(255) DEFAULT NULL COMMENT 'imagen 24',
  `text_title_image_25` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 25',
  `text_alt_image_25` varchar(255) DEFAULT NULL COMMENT 'titulo imagen 25',
  `image_25` varchar(255) DEFAULT NULL COMMENT 'imagen 25',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Galeria inmuebles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_geocity`
--

DROP TABLE IF EXISTS `dynamic_geocity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_geocity` (
  `id` int(11) NOT NULL COMMENT 'Título',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(255) DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `dynamic_georegion` int(11) NOT NULL DEFAULT '0' COMMENT 'Región',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Geografic - Ciudades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_geocountry`
--

DROP TABLE IF EXISTS `dynamic_geocountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_geocountry` (
  `id` int(11) NOT NULL COMMENT 'Título',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(255) DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Geografic - Países';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_geodistrict`
--

DROP TABLE IF EXISTS `dynamic_geodistrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_geodistrict` (
  `id` int(11) NOT NULL COMMENT 'Título',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` char(5) DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `text_postalcode` char(5) DEFAULT NULL COMMENT 'Código Postal',
  `dynamic_geolocality` int(11) NOT NULL DEFAULT '0' COMMENT 'Localidad',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Geografic - Distritos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_geolocality`
--

DROP TABLE IF EXISTS `dynamic_geolocality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_geolocality` (
  `id` int(11) NOT NULL COMMENT 'Título',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(255) DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `dynamic_geocity` int(11) NOT NULL DEFAULT '0' COMMENT 'Ciudad',
  `number_release` int(11) DEFAULT '2' COMMENT 'Días de Release',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `text_geo_latitud` varchar(45) NOT NULL DEFAULT '' COMMENT 'Latitud GPS',
  `text_geo_longitud` varchar(45) NOT NULL DEFAULT '' COMMENT 'Longitud GPS',
  `status_realstate` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Geografic - Localidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_georegion`
--

DROP TABLE IF EXISTS `dynamic_georegion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_georegion` (
  `id` int(11) NOT NULL COMMENT 'Título',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(255) DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `dynamic_geocountry` int(11) NOT NULL DEFAULT '0' COMMENT 'País',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Geografic - Regiones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_mail_empresa`
--

DROP TABLE IF EXISTS `dynamic_mail_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_mail_empresa` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `dynamic_mail_tipo_portal` int(11) NOT NULL DEFAULT '0' COMMENT 'Dynamic tipo portal',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título Empresa',
  `text_nombre_empresa` varchar(128) DEFAULT NULL COMMENT 'Nombre Empresa',
  `text_nombre_empresa_comercial` varchar(128) DEFAULT NULL COMMENT 'Nombre Empresa Comercial',
  `text_direccion` varchar(128) DEFAULT NULL COMMENT 'Nombre Dirección',
  `dynamic_geolocality` smallint(3) DEFAULT NULL COMMENT 'Nombre Localidad',
  `dynamic_geodistrict` smallint(3) DEFAULT NULL COMMENT 'Nombre código postal',
  `text_phone` varchar(75) DEFAULT NULL COMMENT 'Telf',
  `text_web` varchar(128) DEFAULT NULL COMMENT 'Web',
  `text_email` varchar(128) DEFAULT NULL COMMENT 'Email',
  `text_actividad` varchar(128) DEFAULT NULL COMMENT 'Nombre Actividad',
  `text_producto` varchar(128) DEFAULT NULL COMMENT 'Nombre Producto',
  `textarea_description` text COMMENT 'Contenido de la página',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mail empresa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_mail_tipo_portal`
--

DROP TABLE IF EXISTS `dynamic_mail_tipo_portal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_mail_tipo_portal` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título Tipo Empresa',
  `textarea_description` text COMMENT 'Contenido de la página',
  `text_body_title_no_res` varchar(75) DEFAULT NULL COMMENT 'Título de la página cuando NO se encuentran resultados',
  `textarea_description_no_res` text COMMENT 'Contenido de la página cuando NO se encuentran resultados',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipo portal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_offers`
--

DROP TABLE IF EXISTS `dynamic_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_offers` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Titulo Sobre Imagen',
  `dynamic_gallery` varchar(45) DEFAULT NULL COMMENT 'Imagen Principal',
  `text_body_title` varchar(75) DEFAULT NULL COMMENT 'Título de la oferta (en descripción)',
  `dynamic_offers_taxonomy` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Landing oferta',
  `textarea_summary` text COMMENT 'Resumen de la oferta para el home',
  `textarea_description` text COMMENT 'Contenido de la página',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `text_mensaje_home` varchar(45) DEFAULT NULL COMMENT 'Info a destacar en el menú actividades',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `auto_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `position_copy1` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Promociones y Ofertas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_offers_taxonomy`
--

DROP TABLE IF EXISTS `dynamic_offers_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_offers_taxonomy` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título Cabecera',
  `dynamic_accion` int(11) DEFAULT '0' COMMENT 'Identificador de accion | venta | alquiler | compra',
  `dynamic_taxonomy_group` int(11) DEFAULT '0' COMMENT 'Tipo propiedad | piso | casa | local',
  `dynamic_gallery` varchar(45) DEFAULT NULL COMMENT 'Imagen Principal',
  `dynamic_gallery_home` varchar(45) DEFAULT '0' COMMENT 'Galeria home',
  `text_body_title` varchar(75) DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` text COMMENT 'Contenido de la página',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Landings ofertas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_pages`
--

DROP TABLE IF EXISTS `dynamic_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_pages` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_section` varchar(75) NOT NULL DEFAULT '' COMMENT 'Nombre página estática (sólo para tabla admin)',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título Cabecera',
  `text_subtitle` varchar(100) DEFAULT NULL COMMENT 'Subtítulo Cabecera (máx 100 carácteres)',
  `dynamic_gallery_franquicia_principal` varchar(45) DEFAULT NULL COMMENT 'Imagen Principal',
  `text_body_title` varchar(120) DEFAULT NULL COMMENT 'Título de la página (H1)',
  `textarea_description` text COMMENT 'Contenido de la página',
  `text_dtitle_1` varchar(75) DEFAULT NULL COMMENT 'Título 1',
  `text_dsubtitle_1` varchar(75) DEFAULT NULL COMMENT 'Subtítulo 1',
  `dynamic_gallery_1` varchar(45) DEFAULT NULL COMMENT 'Imagen 1',
  `textarea_ddescription_1` text COMMENT 'Descripción 1',
  `text_dtitle_2` varchar(75) DEFAULT NULL COMMENT 'Título 2',
  `text_dsubtitle_2` varchar(75) DEFAULT NULL COMMENT 'Subtítulo 2',
  `dynamic_gallery_2` varchar(45) DEFAULT NULL COMMENT 'Imagen 2',
  `textarea_ddescription_2` text COMMENT 'Descripción 2',
  `text_dtitle_3` varchar(75) DEFAULT NULL COMMENT 'Título 3',
  `text_dsubtitle_3` varchar(75) DEFAULT NULL COMMENT 'Subtítulo 3',
  `dynamic_gallery_3` varchar(45) DEFAULT NULL COMMENT 'Imagen 3',
  `textarea_ddescription_3` text COMMENT 'Descripción 3',
  `textarea_description_inferior` text COMMENT 'Contenido de la página Inferior',
  `textarea_description_home` text COMMENT 'Descripción 2',
  `text_page_title` varchar(120) DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Páginas estáticas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_rooms`
--

DROP TABLE IF EXISTS `dynamic_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_rooms` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Identificador del inmueble',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` text COMMENT 'Titulo',
  `text_subtitle` varchar(255) DEFAULT NULL COMMENT 'Subtítulo',
  `text_ref` varchar(255) DEFAULT NULL COMMENT 'Referencia',
  `dynamic_agencia` int(11) DEFAULT '0' COMMENT 'Agencia',
  `dynamic_usuario` int(11) DEFAULT '0' COMMENT 'Usuario',
  `dynamic_taxonomy` int(11) DEFAULT '0' COMMENT 'Taxonomia',
  `dynamic_taxonomy_group` int(10) DEFAULT '0' COMMENT 'Grupo taxonomía',
  `dynamic_geocountry` int(11) DEFAULT '0' COMMENT 'Pais',
  `dynamic_georegion` int(11) DEFAULT '0' COMMENT 'Región',
  `dynamic_geocity` int(11) DEFAULT '0' COMMENT 'Ciudad',
  `dynamic_geolocality` int(11) DEFAULT '0' COMMENT 'Localidad',
  `dynamic_geodistrict` int(11) DEFAULT '0' COMMENT 'Código postal',
  `dynamic_accion` int(11) DEFAULT '0' COMMENT 'Acción',
  `dynamic_gallery_inmo` varchar(45) DEFAULT '0' COMMENT 'Galería inmo',
  `text_calle` varchar(255) DEFAULT NULL COMMENT 'calle',
  `text_numero_calle` varchar(64) DEFAULT NULL COMMENT 'número calle',
  `text_bloque_propiedad` varchar(255) DEFAULT NULL COMMENT 'bloque propiedad',
  `text_puerta_propiedad` varchar(255) DEFAULT NULL COMMENT 'puerta propiedad',
  `text_planta_propiedad` varchar(255) DEFAULT NULL COMMENT 'planta propiedad',
  `text_latitud` varchar(20) DEFAULT NULL COMMENT 'Google Maps Latitud',
  `text_altitud` varchar(20) DEFAULT NULL COMMENT 'Google Maps Longitud',
  `text_geo_zoom` varchar(255) DEFAULT NULL COMMENT 'geo zoom',
  `number_minprecio` int(11) DEFAULT NULL COMMENT 'Min precio',
  `number_precioinmo` decimal(9,2) DEFAULT NULL COMMENT 'Precio de venta ( Formato: 1000,00 )',
  `number_precioalq` decimal(9,2) DEFAULT '0.00' COMMENT 'Precio de alquiler  ( Formato: 1000,00 )',
  `textarea_description` text COMMENT 'Descripción principal',
  `textarea_description_2` text COMMENT 'Descripción secundaria',
  `textarea_interior` text COMMENT 'Descripción opcional (No visible)',
  `checkbox_destacado` tinyint(45) DEFAULT '0' COMMENT 'Destacado',
  `checkbox_destacado_home` tinyint(4) DEFAULT '0' COMMENT 'Destacado página  home',
  `checkbox_destacado_provincia` tinyint(4) DEFAULT '0' COMMENT 'Destacado página población',
  `checkbox_destacado_taxonomia` tinyint(4) DEFAULT '0' COMMENT 'Destacado página población por tipo inmueble',
  `checkbox_destacado_listado_inmobiliarias` tinyint(4) DEFAULT '0' COMMENT 'Destacado página listado inmobiliarias',
  `checkbox_destacado_detalle_inmobiliaria` tinyint(4) DEFAULT '0' COMMENT 'Destacado página detalle inmobiliaria',
  `checkbox_destacado_listado_blog` tinyint(4) DEFAULT '0' COMMENT 'Destacado página listado notícias blog',
  `checkbox_destacado_detalle_blog` tinyint(4) DEFAULT '0' COMMENT 'Destacado página detalle notícia blog',
  `checkbox_destacado_detalle_propiedad` tinyint(4) DEFAULT '0' COMMENT 'Destacado página detalle propiedad',
  `checkbox_destacado_detalle_inmobiliaria_lateral` int(11) DEFAULT '0' COMMENT 'Destacado página detalle propiedad lateral',
  `checkbox_destacado_oferta` tinyint(4) DEFAULT '0' COMMENT 'Página de destacado Oferta',
  `checkbox_oferta` tinyint(4) DEFAULT '0' COMMENT 'Página de Oferta en listados',
  `checkbox_destacado_newsletter` tinyint(4) DEFAULT '0' COMMENT 'Mostrar correo newsletter',
  `checkbox_destacado_agente` smallint(45) DEFAULT '0' COMMENT 'Destacado agente',
  `checkbox_destacado_home_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página  home agente',
  `checkbox_destacado_provincia_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página población agente',
  `checkbox_destacado_taxonomia_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página población por tipo inmueble agente',
  `checkbox_destacado_listado_inmobiliarias_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página listado inmobiliarias agente',
  `checkbox_destacado_detalle_inmobiliaria_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página detalle inmobiliaria agente',
  `checkbox_destacado_listado_blog_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página listado notícias blog agente',
  `checkbox_destacado_detalle_blog_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página detalle notícia blog agente',
  `checkbox_destacado_detalle_propiedad_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página detalle propiedad agente',
  `checkbox_destacado_oferta_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado en página de ofertas',
  `checkbox_oferta_agente` smallint(4) DEFAULT '0' COMMENT 'Página de Oferta en listados agente',
  `checkbox_destacado_newsletter_agente` smallint(4) DEFAULT '0' COMMENT 'Mostrar correo newsletter agente',
  `checkbox_vistos_recientemente_provincia` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página provincia',
  `checkbox_vistos_recientemente_taxonomia` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página por tipo piso',
  `checkbox_vistos_recientemente_listado_inmobiliarias` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página listado inmobiliarias',
  `checkbox_vistos_recientemente_detalle_inmobiliarias` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle inmobiliarias',
  `checkbox_vistos_recientemente_listado_blog` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página listado blog',
  `checkbox_vistos_recientemente_detalle_blog` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle blog',
  `checkbox_vistos_recientemente_detalle_propiedad` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle propiedad',
  `checkbox_vistos_recientemente_provincia_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página provincia agente',
  `checkbox_vistos_recientemente_taxonomia_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página por tipo piso agente',
  `checkbox_vistos_recientemente_listado_inmobiliarias_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página listado inmobiliarias agente',
  `checkbox_vistos_recientemente_detalle_inmobiliarias_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle inmobiliarias agente',
  `checkbox_vistos_recientemente_listado_blog_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página listado blog agente',
  `checkbox_vistos_recientemente_detalle_blog_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle blog agente',
  `checkbox_vistos_recientemente_detalle_propiedad_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle propiedad agente',
  `text_page_title` text COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` text COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` text COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `dynamic_gallery_usuario` int(10) DEFAULT NULL COMMENT 'usuario galeria',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8 COMMENT='Listado Inmuebles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_services`
--

DROP TABLE IF EXISTS `dynamic_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_services` (
  `id` int(11) NOT NULL COMMENT 'Título',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(45) DEFAULT NULL COMMENT 'Título (máximo 45 caracteres)',
  `image_icon` varchar(255) DEFAULT NULL COMMENT 'Imagen icono (extensión .svg)',
  `status` enum('ACTIVED','PAUSED') NOT NULL DEFAULT 'ACTIVED',
  `position` int(11) NOT NULL DEFAULT '0',
  `text_class_icon` varchar(75) DEFAULT NULL COMMENT 'Classe Icono',
  PRIMARY KEY (`id`,`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Servicios - Avantio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_taxonomy`
--

DROP TABLE IF EXISTS `dynamic_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_taxonomy` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(255) DEFAULT NULL COMMENT 'Título de la Taxonomía (en cabecera)',
  `text_title_plural` varchar(255) DEFAULT NULL COMMENT 'Título de la Taxonomía (plural, en cabecera)',
  `text_subtitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Subtítulo de la Cabecera',
  `dynamic_taxonomy_group` varchar(45) DEFAULT NULL COMMENT 'Grupos de taxonomias',
  `dynamic_gallery_inmo` varchar(45) DEFAULT NULL COMMENT 'Imagen Principal',
  `text_body_title` varchar(75) DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` text COMMENT 'Descripción principal',
  `text_page_title` varchar(45) DEFAULT NULL,
  `auto_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `status_realstate` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Taxonomías - Pisos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_taxonomy_city`
--

DROP TABLE IF EXISTS `dynamic_taxonomy_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_taxonomy_city` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título Cabecera',
  `dynamic_gallery` varchar(45) DEFAULT NULL COMMENT 'Imagen Principal',
  `dynamic_gallery_home` varchar(45) DEFAULT NULL COMMENT 'Miniatura landing home',
  `text_body_title` varchar(75) DEFAULT NULL COMMENT 'Título de la página',
  `dynamic_accion` int(11) DEFAULT '0' COMMENT 'Identificador de accion | venta | alquiler | compra',
  `dynamic_taxonomy_group` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Taxonomía Grupo',
  `dynamic_geolocality` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Avantio Localidad',
  `textarea_description` text COMMENT 'Contenido de la página',
  `text_body_title_no_res` varchar(75) DEFAULT NULL COMMENT 'Título de la página cuando NO se encuentran resultados',
  `textarea_description_no_res` text COMMENT 'Contenido de la página cuando NO se encuentran resultados',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Landings destino';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `dynamic_taxonomy_group` int(11) DEFAULT NULL COMMENT 'taxonomia',
  `dynamic_geocity` int(11) DEFAULT NULL COMMENT 'ciudad',
  `dynamic_geocountry` int(11) DEFAULT NULL COMMENT 'pais',
  `dynamic_geodistrict` int(11) DEFAULT NULL COMMENT 'distrito',
  `dynamic_geolocality` int(11) DEFAULT NULL COMMENT 'localidad',
  `dynamic_georegion` int(11) DEFAULT NULL COMMENT 'localidad',
  `dynamic_url_extra_parametro` int(11) DEFAULT NULL COMMENT 'localidad',
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
-- Table structure for table `dynamic_taxonomy_group`
--

DROP TABLE IF EXISTS `dynamic_taxonomy_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_taxonomy_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'Lenguage',
  `text_title` varchar(255) DEFAULT NULL COMMENT 'Título del grupo',
  `text_title_plural` varchar(255) DEFAULT NULL COMMENT 'Plurarl de la taxonomia',
  `text_subtitle` varchar(255) DEFAULT NULL COMMENT 'Título del grupo',
  `dynamic_gallery_inmo` varchar(45) DEFAULT NULL COMMENT 'Galeía de imágenes',
  `text_body_title` varchar(75) DEFAULT NULL COMMENT 'Título del cuerpo',
  `textarea_description` text COMMENT 'Descripción',
  `text_page_title` varchar(45) DEFAULT NULL COMMENT 'Título de página',
  `auto_slug` varchar(255) DEFAULT NULL COMMENT 'Auto Slug',
  `text_slug` varchar(255) DEFAULT NULL COMMENT 'Text Slug',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description',
  `textarea_scripts_header` text COMMENT 'Scripts Header',
  `textarea_scripts_body` text COMMENT 'Scripts Body',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) DEFAULT NULL COMMENT 'Posición',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Tax- Grupos - Pisos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_testimonials`
--

DROP TABLE IF EXISTS `dynamic_testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_testimonials` (
  `id` int(11) NOT NULL,
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `text_business` varchar(75) DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `textarea_description` text COMMENT 'Descripción',
  `dynamic_gallery_franquicia_principal` varchar(45) DEFAULT NULL COMMENT 'Imagen Principal',
  `checkbox_destacada_home` varchar(45) DEFAULT NULL COMMENT 'Destacar en la home (si/no)',
  `checkbox_destacada_alojamiento` varchar(45) DEFAULT NULL COMMENT 'Destacar en la página de alojamiento',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tesimonials';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dynamic_usuario`
--

DROP TABLE IF EXISTS `dynamic_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dynamic_usuario` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(3) NOT NULL DEFAULT 'es',
  `text_title` varchar(75) DEFAULT NULL COMMENT 'Titulo usuario',
  `text_firstname` varchar(75) DEFAULT NULL COMMENT 'Título Nombre',
  `text_lastname` varchar(20) DEFAULT '' COMMENT 'Apellido',
  `number_telf` varchar(20) DEFAULT '' COMMENT 'Telf',
  `number_telf_mobil` varchar(20) DEFAULT '' COMMENT 'Telf',
  `text_direccion` varchar(20) DEFAULT '' COMMENT 'Dirección',
  `textarea_description` text COMMENT 'Contenido de la página',
  `text_page_title` varchar(75) DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) NOT NULL DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `text_meta_robots` varchar(45) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Listado usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `languages` (
  `id` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(45) DEFAULT NULL,
  `actived` tinyint(4) NOT NULL DEFAULT '0',
  `default` tinyint(4) NOT NULL DEFAULT '0',
  `locale` varchar(45) NOT NULL DEFAULT '',
  `text_lang` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `id_indice` int(10) NOT NULL COMMENT 'Clave primaria',
  `id` bigint(20) NOT NULL,
  `id2` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `user1` bigint(20) NOT NULL,
  `user2` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `timestamp` int(10) NOT NULL,
  `user1read` varchar(3) NOT NULL,
  `user2read` varchar(3) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id_indice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del registro usuario de la newsletter',
  `email` varchar(250) NOT NULL COMMENT 'email del usuario',
  `language` varchar(250) NOT NULL COMMENT 'lenguage',
  `status` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_reset`
--

DROP TABLE IF EXISTS `password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_reset` (
  `email` varchar(250) NOT NULL,
  `key` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL,
  `id` int(10) NOT NULL COMMENT 'Clave primaria',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `preferences` (
  `id` int(11) NOT NULL DEFAULT '1',
  `scripts_body` text NOT NULL,
  `cache_time` int(11) NOT NULL DEFAULT '0',
  `with_thumbnail_high` int(11) NOT NULL DEFAULT '800',
  `with_thumbnail_low` int(11) DEFAULT '400',
  `with_thumbnail_mobile` int(11) DEFAULT '250',
  `text_mailform` varchar(255) DEFAULT NULL COMMENT 'Mail Formularios',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador rol',
  `role` varchar(50) DEFAULT NULL COMMENT 'rol usuariio',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Roles usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_dynamic_rooms`
--

DROP TABLE IF EXISTS `tmp_dynamic_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tmp_dynamic_rooms` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Identificador del inmueble',
  `language` varchar(3) NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` text COMMENT 'Titulo',
  `text_subtitle` varchar(255) DEFAULT NULL COMMENT 'Subtítulo',
  `text_ref` varchar(255) DEFAULT NULL COMMENT 'Referencia',
  `dynamic_agencia` int(11) DEFAULT '0' COMMENT 'Agencia',
  `dynamic_usuario` int(11) DEFAULT '0' COMMENT 'Usuario',
  `dynamic_taxonomy` int(11) DEFAULT '0' COMMENT 'Taxonomia',
  `dynamic_taxonomy_group` int(10) DEFAULT '0' COMMENT 'Grupo taxonomía',
  `dynamic_geocountry` int(11) DEFAULT '0' COMMENT 'Pais',
  `dynamic_georegion` int(11) DEFAULT '0' COMMENT 'Región',
  `dynamic_geocity` int(11) DEFAULT '0' COMMENT 'Ciudad',
  `dynamic_geolocality` int(11) DEFAULT '0' COMMENT 'Localidad',
  `dynamic_geodistrict` int(11) DEFAULT '0' COMMENT 'Código postal',
  `dynamic_accion` int(11) DEFAULT '0' COMMENT 'Acción',
  `dynamic_gallery_inmo` varchar(45) DEFAULT '0' COMMENT 'Galería inmo',
  `text_calle` varchar(255) DEFAULT NULL COMMENT 'calle',
  `text_numero_calle` varchar(64) DEFAULT NULL COMMENT 'número calle',
  `text_bloque_propiedad` varchar(255) DEFAULT NULL COMMENT 'bloque propiedad',
  `text_puerta_propiedad` varchar(255) DEFAULT NULL COMMENT 'puerta propiedad',
  `text_planta_propiedad` varchar(255) DEFAULT NULL COMMENT 'planta propiedad',
  `text_latitud` varchar(20) DEFAULT NULL COMMENT 'Google Maps Latitud',
  `text_altitud` varchar(20) DEFAULT NULL COMMENT 'Google Maps Longitud',
  `text_geo_zoom` varchar(255) DEFAULT NULL COMMENT 'geo zoom',
  `number_minprecio` int(11) DEFAULT NULL COMMENT 'Min precio',
  `number_precioinmo` decimal(9,2) DEFAULT NULL COMMENT 'Precio de venta ( Formato: 1000,00 )',
  `number_precioalq` decimal(9,2) DEFAULT '0.00' COMMENT 'Precio de alquiler  ( Formato: 1000,00 )',
  `textarea_description` text COMMENT 'Descripción principal',
  `textarea_description_2` text COMMENT 'Descripción secundaria',
  `textarea_interior` text COMMENT 'Descripción opcional (No visible)',
  `checkbox_destacado` tinyint(45) DEFAULT '0' COMMENT 'Destacado',
  `checkbox_destacado_home` tinyint(4) DEFAULT '0' COMMENT 'Destacado página  home',
  `checkbox_destacado_provincia` tinyint(4) DEFAULT '0' COMMENT 'Destacado página población',
  `checkbox_destacado_taxonomia` tinyint(4) DEFAULT '0' COMMENT 'Destacado página población por tipo inmueble',
  `checkbox_destacado_listado_inmobiliarias` tinyint(4) DEFAULT '0' COMMENT 'Destacado página listado inmobiliarias',
  `checkbox_destacado_detalle_inmobiliaria` tinyint(4) DEFAULT '0' COMMENT 'Destacado página detalle inmobiliaria',
  `checkbox_destacado_listado_blog` tinyint(4) DEFAULT '0' COMMENT 'Destacado página listado notícias blog',
  `checkbox_destacado_detalle_blog` tinyint(4) DEFAULT '0' COMMENT 'Destacado página detalle notícia blog',
  `checkbox_destacado_detalle_propiedad` tinyint(4) DEFAULT '0' COMMENT 'Destacado página detalle propiedad',
  `checkbox_destacado_detalle_inmobiliaria_lateral` int(11) DEFAULT '0' COMMENT 'Destacado página detalle propiedad lateral',
  `checkbox_destacado_oferta` tinyint(4) DEFAULT '0' COMMENT 'Página de destacado Oferta',
  `checkbox_oferta` tinyint(4) DEFAULT '0' COMMENT 'Página de Oferta en listados',
  `checkbox_destacado_newsletter` tinyint(4) DEFAULT '0' COMMENT 'Mostrar correo newsletter',
  `checkbox_destacado_agente` smallint(45) DEFAULT '0' COMMENT 'Destacado agente',
  `checkbox_destacado_home_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página  home agente',
  `checkbox_destacado_provincia_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página población agente',
  `checkbox_destacado_taxonomia_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página población por tipo inmueble agente',
  `checkbox_destacado_listado_inmobiliarias_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página listado inmobiliarias agente',
  `checkbox_destacado_detalle_inmobiliaria_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página detalle inmobiliaria agente',
  `checkbox_destacado_listado_blog_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página listado notícias blog agente',
  `checkbox_destacado_detalle_blog_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página detalle notícia blog agente',
  `checkbox_destacado_detalle_propiedad_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado página detalle propiedad agente',
  `checkbox_destacado_oferta_agente` smallint(4) DEFAULT '0' COMMENT 'Destacado en página de ofertas',
  `checkbox_oferta_agente` smallint(4) DEFAULT '0' COMMENT 'Página de Oferta en listados agente',
  `checkbox_destacado_newsletter_agente` smallint(4) DEFAULT '0' COMMENT 'Mostrar correo newsletter agente',
  `checkbox_vistos_recientemente_provincia` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página provincia',
  `checkbox_vistos_recientemente_taxonomia` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página por tipo piso',
  `checkbox_vistos_recientemente_listado_inmobiliarias` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página listado inmobiliarias',
  `checkbox_vistos_recientemente_detalle_inmobiliarias` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle inmobiliarias',
  `checkbox_vistos_recientemente_listado_blog` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página listado blog',
  `checkbox_vistos_recientemente_detalle_blog` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle blog',
  `checkbox_vistos_recientemente_detalle_propiedad` tinyint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle propiedad',
  `checkbox_vistos_recientemente_provincia_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página provincia agente',
  `checkbox_vistos_recientemente_taxonomia_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página por tipo piso agente',
  `checkbox_vistos_recientemente_listado_inmobiliarias_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página listado inmobiliarias agente',
  `checkbox_vistos_recientemente_detalle_inmobiliarias_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle inmobiliarias agente',
  `checkbox_vistos_recientemente_listado_blog_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página listado blog agente',
  `checkbox_vistos_recientemente_detalle_blog_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle blog agente',
  `checkbox_vistos_recientemente_detalle_propiedad_agente` smallint(4) DEFAULT '0' COMMENT 'Vistos recientemente página detalle propiedad agente',
  `text_page_title` text COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) DEFAULT '' COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) DEFAULT '' COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` text COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` text COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` text COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` text COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `dynamic_gallery_usuario` int(10) DEFAULT NULL COMMENT 'usuario galeria',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8 COMMENT='Listado Inmuebles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'password',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'info@pisosenmanresa.com' COMMENT 'Email usuario',
  `grupo` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'usuario',
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ACTIVED',
  `roleId` int(11) DEFAULT '8' COMMENT 'Rol usuario',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-13 19:14:57
