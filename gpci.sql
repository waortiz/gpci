-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: gpci
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actasproyectos`
--

DROP TABLE IF EXISTS `actasproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actasproyectos` (
  `idActa` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `observaciones` varchar(3000) CHARACTER SET utf8 NOT NULL,
  `idTipoActa` int(11) NOT NULL,
  `numero` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idActa`),
  KEY `actasproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `actasproyectos_tiposacta_idtipoacta_idx` (`idTipoActa`),
  CONSTRAINT `actasproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `actasproyectos_tiposacta_idtipoacta` FOREIGN KEY (`idTipoActa`) REFERENCES `tiposacta` (`idTipoActa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actasproyectos`
--

LOCK TABLES `actasproyectos` WRITE;
/*!40000 ALTER TABLE `actasproyectos` DISABLE KEYS */;
INSERT INTO `actasproyectos` VALUES (4,18,'2017-08-07 00:00:00','Acta de inicio',4,'67'),(5,15,'2017-08-10 00:00:00','333',3,'23'),(6,5,'2017-08-28 00:00:00','',5,'46785');
/*!40000 ALTER TABLE `actasproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adendascambioproyectos`
--

DROP TABLE IF EXISTS `adendascambioproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adendascambioproyectos` (
  `idAdenda` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) DEFAULT NULL,
  `idTipoPersona` int(11) NOT NULL,
  `idPersonaAnterior` bigint(20) NOT NULL,
  `idPersona` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `fechaCambio` datetime NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `idRol` int(11) NOT NULL,
  `observaciones` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idAdenda`),
  KEY `adendasproyectocambio_tipospersona_idtipopersona_idx` (`idTipoPersona`),
  KEY `adendasproyectocambio_roles_idrol_idx` (`idRol`),
  KEY `adendascambioproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `adendascambioproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adendascambioproyectos_roles_idrol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adendascambioproyectos_tipospersona_idtipopersona` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipospersona` (`idTipoPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adendascambioproyectos`
--

LOCK TABLES `adendascambioproyectos` WRITE;
/*!40000 ALTER TABLE `adendascambioproyectos` DISABLE KEYS */;
INSERT INTO `adendascambioproyectos` VALUES (1,25,3,1,2,'2017-08-11 17:15:47','2017-08-11 00:00:00','2017-08-11 00:00:00','5678',1,'Ninguna');
/*!40000 ALTER TABLE `adendascambioproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adendasingresoproyectos`
--

DROP TABLE IF EXISTS `adendasingresoproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adendasingresoproyectos` (
  `idAdenda` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `idTipoPersona` int(11) NOT NULL,
  `idPersona` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `fechaIngreso` datetime NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idAdenda`),
  KEY `adendasingresoproyectos_tipospersona_idtipopersona_idx` (`idTipoPersona`),
  KEY `adendasingresoproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `adendasingresoproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adendasingresoproyectos_tipospersona_idtipopersona` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipospersona` (`idTipoPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adendasingresoproyectos`
--

LOCK TABLES `adendasingresoproyectos` WRITE;
/*!40000 ALTER TABLE `adendasingresoproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `adendasingresoproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adendasretiroproyectos`
--

DROP TABLE IF EXISTS `adendasretiroproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adendasretiroproyectos` (
  `idAdenda` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `idTipoPersona` int(11) NOT NULL,
  `idPersona` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `fechaRetiro` datetime NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `motivo` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idAdenda`),
  KEY `adendasretiroproyectos_tipospersona_idtipopersona_idx` (`idTipoPersona`),
  KEY `adendasretiroproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `adendasretiroproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adendasretiroproyectos_tipospersona_idtipopersona` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipospersona` (`idTipoPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adendasretiroproyectos`
--

LOCK TABLES `adendasretiroproyectos` WRITE;
/*!40000 ALTER TABLE `adendasretiroproyectos` DISABLE KEYS */;
INSERT INTO `adendasretiroproyectos` VALUES (2,18,1,1,'2017-08-07 22:40:41','2017-08-07 00:00:00','2017-08-07 00:00:00','1','1');
/*!40000 ALTER TABLE `adendasretiroproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adicionesproyectos`
--

DROP TABLE IF EXISTS `adicionesproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adicionesproyectos` (
  `idAdicion` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `monto` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fechaActaCODI` datetime NOT NULL,
  `numeroActaCODI` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idAdicion`),
  KEY `adiciones_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `adiciones_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adicionesproyectos`
--

LOCK TABLES `adicionesproyectos` WRITE;
/*!40000 ALTER TABLE `adicionesproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `adicionesproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alertasavalproyectos`
--

DROP TABLE IF EXISTS `alertasavalproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alertasavalproyectos` (
  `idAlertaAvalProyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `idTipoAval` int(11) NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idAlertaAvalProyecto`),
  KEY `alertasaval_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `alertasaval_tiposaval_idtipoaval_idx` (`idTipoAval`),
  CONSTRAINT `alertasaval_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `alertasaval_tiposaval_idtipoaval` FOREIGN KEY (`idTipoAval`) REFERENCES `tiposaval` (`idTipoAval`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertasavalproyectos`
--

LOCK TABLES `alertasavalproyectos` WRITE;
/*!40000 ALTER TABLE `alertasavalproyectos` DISABLE KEYS */;
INSERT INTO `alertasavalproyectos` VALUES (1,18,'2017-08-07 14:07:02',2,'2017-08-07 00:00:00','456','Cumplimiento Total'),(2,25,'2017-08-11 12:43:17',2,'2017-08-11 00:00:00','456778','NUEVA ALERTA');
/*!40000 ALTER TABLE `alertasavalproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areastematicas`
--

DROP TABLE IF EXISTS `areastematicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areastematicas` (
  `idAreaTematica` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idAreaTematica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areastematicas`
--

LOCK TABLES `areastematicas` WRITE;
/*!40000 ALTER TABLE `areastematicas` DISABLE KEYS */;
INSERT INTO `areastematicas` VALUES (1,'Salud'),(2,'EnergÃ­a'),(3,'TecnologÃ­a'),(4,'Gases'),(5,'NUEVAS TECNOLOGÃAS');
/*!40000 ALTER TABLE `areastematicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compromisoshomologadosproyectos`
--

DROP TABLE IF EXISTS `compromisoshomologadosproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compromisoshomologadosproyectos` (
  `idcompromisoHomologadoProyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCompromisoProyecto` bigint(20) NOT NULL,
  `idCompromisoProyectoHomologado` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `fechaActa` datetime NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `numeroActa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcompromisoHomologadoProyecto`),
  KEY `compromisoshomologados_compromisosproyectos_idcompromiso_idx` (`idCompromisoProyecto`),
  KEY `compromisoshomologados_compromisosproyectos_idcompromisohom_idx` (`idCompromisoProyectoHomologado`),
  CONSTRAINT `compromisoshomologados_compromisosproyectos_idcompromiso` FOREIGN KEY (`idCompromisoProyecto`) REFERENCES `compromisosproyectos` (`idCompromisoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `compromisoshomologados_compromisosproyectos_idcompromisohomo` FOREIGN KEY (`idCompromisoProyectoHomologado`) REFERENCES `compromisosproyectos` (`idCompromisoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromisoshomologadosproyectos`
--

LOCK TABLES `compromisoshomologadosproyectos` WRITE;
/*!40000 ALTER TABLE `compromisoshomologadosproyectos` DISABLE KEYS */;
INSERT INTO `compromisoshomologadosproyectos` VALUES (3,4,5,'2017-08-12 11:42:22','2017-08-12 00:00:00','Se homologa el compromiso','5356','Ninguna');
/*!40000 ALTER TABLE `compromisoshomologadosproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compromisosproyectos`
--

DROP TABLE IF EXISTS `compromisosproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compromisosproyectos` (
  `idCompromisoProyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `idTipoCompromiso` int(11) NOT NULL,
  `soporte` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idCompromisoProyecto`),
  KEY `compromisosproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `compromisosproyectos_tiposcompromiso_idtipocompromiso_idx` (`idTipoCompromiso`),
  CONSTRAINT `compromisosproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `compromisosproyectos_tiposcompromiso_idtipocompromiso` FOREIGN KEY (`idTipoCompromiso`) REFERENCES `tiposcompromiso` (`idTipoCompromiso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromisosproyectos`
--

LOCK TABLES `compromisosproyectos` WRITE;
/*!40000 ALTER TABLE `compromisosproyectos` DISABLE KEYS */;
INSERT INTO `compromisosproyectos` VALUES (1,18,'2017-08-07 14:07:02','Entrega de Documentos',256,'null'),(4,25,'2017-08-11 12:43:17','ENTREGA DE FORMATOS AL DÃA',153,'DOCUMENTOS'),(5,25,'2017-08-11 13:59:00','ENVÃO DE INFORMACIÃ“N',151,'DOCUMENTOS'),(6,2,'2017-08-27 22:28:27','Entrega de referencias',256,'Ninguno'),(7,8,'2017-08-27 22:30:10','Documentos',307,NULL);
/*!40000 ALTER TABLE `compromisosproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convocatorias`
--

DROP TABLE IF EXISTS `convocatorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `convocatorias` (
  `idConvocatoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`idConvocatoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convocatorias`
--

LOCK TABLES `convocatorias` WRITE;
/*!40000 ALTER TABLE `convocatorias` DISABLE KEYS */;
INSERT INTO `convocatorias` VALUES (1,'Ruta N','2017-05-27 00:00:00'),(2,'Municipio de MedellÃ­n','2017-05-27 00:00:00'),(4,'Otra convocatoria','2017-08-11 12:13:59'),(5,'Nueva Convocatoria U de A','2017-08-11 12:18:35'),(7,'Nueva Convocatoria Colciencias','2017-08-11 12:20:12');
/*!40000 ALTER TABLE `convocatorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cumplimientoalertasavalproyectos`
--

DROP TABLE IF EXISTS `cumplimientoalertasavalproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cumplimientoalertasavalproyectos` (
  `idcumplimientoalertaavalproyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `idAlertaAvalProyecto` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcumplimientoalertaavalproyecto`),
  KEY `cumpliemientoalertasaval_alertasaval_idalertaaval_idx` (`idAlertaAvalProyecto`),
  CONSTRAINT `cumplimientoalertasaval_alertasaval_idalertaaval` FOREIGN KEY (`idAlertaAvalProyecto`) REFERENCES `alertasavalproyectos` (`idAlertaAvalProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cumplimientoalertasavalproyectos`
--

LOCK TABLES `cumplimientoalertasavalproyectos` WRITE;
/*!40000 ALTER TABLE `cumplimientoalertasavalproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cumplimientoalertasavalproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cumplimientocompromisosproyectos`
--

DROP TABLE IF EXISTS `cumplimientocompromisosproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cumplimientocompromisosproyectos` (
  `idcumplimientocompromisoproyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCompromisoProyecto` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcumplimientocompromisoproyecto`),
  KEY `cumplimientocompromisos_compromisosproyectos_idcompromiso_idx` (`idCompromisoProyecto`),
  CONSTRAINT `cumplimientocompromisos_compromisosproyectos_idcompromiso` FOREIGN KEY (`idCompromisoProyecto`) REFERENCES `compromisosproyectos` (`idCompromisoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cumplimientocompromisosproyectos`
--

LOCK TABLES `cumplimientocompromisosproyectos` WRITE;
/*!40000 ALTER TABLE `cumplimientocompromisosproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cumplimientocompromisosproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentoactasproyectos`
--

DROP TABLE IF EXISTS `documentoactasproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentoactasproyectos` (
  `idActa` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  KEY `documentosactasproyectos_actasproyectos_idactaproyecto_idx` (`idActa`),
  CONSTRAINT `documentosactasproyectos_actasproyectos_idactaproyecto` FOREIGN KEY (`idActa`) REFERENCES `actasproyectos` (`idActa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentoactasproyectos`
--

LOCK TABLES `documentoactasproyectos` WRITE;
/*!40000 ALTER TABLE `documentoactasproyectos` DISABLE KEYS */;
INSERT INTO `documentoactasproyectos` VALUES (4,'20264562_1739789179654250_7471240034847116774_n.jpg','image/jpeg','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\í\0œPhotoshop 3.0\08BIM\0\0\0\0\0€g\0GEOGtpuoN04_KuSTAVRD(\0bFBMD01000ac0030000bf2900002d60000019660000f56b00002a96000061e70000f9ef0000dbf900005f0401009b960100ÿ\âICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0\Ì\0\0\0@gTRC\0\0\Ì\0\0\0@bTRC\0\0\Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïcurv\0\0\0\0\0\0\0\Z\0\0\0\Ë\Éc’kö?Q4!ñ)2;’FQw]\íkpz‰±š|¬i¿}\Ó\Ã\é0ÿÿÿ\Û\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9ÿ\Û\0C\n\n\n9& &99999999999999999999999999999999999999999999999999ÿ\Â\0 \0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\0\î\0\0\0\0“X\01¶@\Èa´\æ\ÎmNqNˆÉ¤tdfÙ“¢Js{\Ã/@\Ê\ÕdˆÍ°hãºj,™(kœ\æ±t9ó 3¢5ŒºFf\Æk\"4r\é¬e\Ğ:2¾)\Ñ\çF~aÑ™•M\Ó*±¼s›%–\àZ6\ë%ƒ/P\Ü\ã£+S5Lj§FfH_3$/œ\æÁlg>te\à\0\0\0\0\0\0\0y\è~`z~LÙ…\êœ=\Ã¤g2z\Ï\Øñ\Â\ç;«<ó©åºƒ3g\Z©£…\Üd—±³´N’\êyrÛ›¬cu¼5ó\Õ8{†H\Îdõ?®\ä\Ç\à\èq\ça\Ò`¡A¬ys«\å:¡\Şo\éœy¯\ÏW°>hf6ü\ë\Ñ1½×°ÆŠ°\Æ\ØÊ¤_\Ç\í8³¢\í8¾\È\ãóô3Î›‚\ï1Kö8\ïF8>û\Ş8\í¬XÌ­K&g y?¬5\ê9…¤\Ü\Ã\"¿Bù§\Äv\ÔJZœ?px¦†\ÎF™\ÌúWšúPğ\0\0\0\0\0\0\0\Ã\Ü[\Z@f\éRkJ\èD÷\Z\í†u\ÉC>µºä—¤^\Èghši›¤M\×0\×l‰¼\á\Ò=`\Ü]À¢\ÍÎ©¸\ïºWº\Ú g\\”3ª\í†Ó‚•\rÀÏ«´\×d\n)|#©|3oHº@Q³(f;D2\ë\î|¶\Ã:ZwıK\0\Ì=ğ§p\0\0\0\0\0\0\0\0\07ôD©³\É[\"NóŒ4+·<·\ßyWªœ|O\Ç)zOŸö\Ç\'\Ğqv—®\ä\ßCŸ\è[\'.\Ò<û¹\â\Í;¸\Ä\Øù°‘ÀvüIb\î^‰\Ûc\ìc¯E\Îu§%¬\ìs\Òø\îÅ§+KÔ‰|\Ë\Ó|\Ä}ú\×N“\ê91È•ÎWr%ş\Ó\Í=(\à:œY\çÍ½\'\Ï\è78B–¦N\Ù\Ù\ækñ†N®\î‘\ÉgÁ\è\ç\r^\Ú\ç:±˜T+Ÿ\Åv¼I\Ø\êñb¯}\çæœµh’ú—zˆ\0\0\0\0\0\0\0\0\0\0q} p\İ]\à\à4z\àÂ¿x8\Î\Ì\r[A\Î\Ç\ÓvON\Ş\'~¶-7T9«¡G¦nş¨sX€FL±\Ô¯\Ô½°\0¯T\Êõ@T¶³Ó‡+«ª\ÒtÁ™—Ó‡­Ó\ÆöAÁu\×Ã„Nğ\"\ÈpWºğ\Å\æ=9ú½Pegô¡\Ì\é\é‡+\èa\Ãô\ÚA\çúıHs»ƒŒ\ìÀ\0\0\0\0\0T\íÇª9U:“–¤\å–:ƒ—+¨9r:ƒ—S§9€\é\Î`:s˜œ\æ§9\\\Ù{\ÃÎ™zA\æ–\ìôŒµ¬õ\'21Ì‡Ls!\Ó\Èt\Ç2\Å\êNfn]:\éN%+·8\Ë\'Ts–\å\Ø+\ZÍ’°Y+\Ù+…‚¸X 	\Èr˜„&!	ˆBb˜„& \Ë6Ê“‘„„bH000000009…_”PP,rù\ÔU!“\Ë\élô\ì\ÍL·f\Îñ§³Ÿ¾z›GYÛ°¹ \n\"F\ä\å\ÖÎ¥M.\â\çw33q\ät½1fvX\Íså¶±ˆo\n\"€\0ª *µ@E@p€¢ˆ\n\0…V¬\î\î\×/:w–|ª\á\ê†\î²ñQDDDDˆ§6)\éó\"€ˆ \0@H(\0J\0ˆœ·Uœ\ë÷¥ò{3º*÷±\Ù+f›‡µ\Ï\ÙP\ÙõøS·TQ£,E\Ï\ŞY\ÏóŞµÇ’]§¡\ÓZŠ\Şu4\è\å¬!¼(\0¨B (¨ \0\0(€¢*\n\ÕPDQ9\íş>9–±³Va,#£\'\ê¸ûÇ¨É‘­¼( \n *\0*ˆ\n sÂü\à\0(¨ €-¨)\0\0\n  \0…;\ã¤s\Ç\'‹\è\È\×™P¼\Â%ƒG3C\Ñ\ây^¼o™±\çz\Ì\Ènu\ÑY«5\Ï\å\Ş\Ğ\ç\Û›\Ù;¨\ã/t\á\İ^‚\à±\ÉQAY\0¥‘\ÃUTEA\Än¬QÈ¨\0\n\0¼¿Q‘ka:}®Ze\Î~N™7Ë˜¯\è\Ük:·\r\Üõ\à¢(€¢ˆ\n (€ †¸ŠŠ\0€\0\0‚\n\0(\ØgoŸ\Ù^V;\Ï\é”&\ÔÏ­§O©¡I+Y-ò\çg…Óœ\Ê\Çg¥º­^¦­œŞ™Y™//Nn]¾oŞ©¬wW3tzqfuœòø\Óyp\Ğr°‡ŒŒ#C&÷\'=\ÏU73\Ò\Ê\åh®V(\áª9£\ÓÌ¶\î\åñõ\é]\Ênzk¥l£¬†\Ôn–6¯_4¨†ù(‚¸h9\0QDA\ÃT\Â\":ò”ˆ&\"	V%\"	H‚R$\' d¶ŠQ\çZ+›)z8\İ4¨ò{Ÿ,k,,¯wD\Ì\Ò\Ì/±ğkd—¡™’;4ùtF×ƒS¤«+x–ş}œ÷³N\Ì0±\Î\Å\×\ÑÀ\Ô\ïâ†œ°\\\İ1hu\ç\Õa¨g0\Õ2_.¡\Z\æCUÊŒÈ–w¤}?=:\í.\"¦Ùˆ†\êó¶e\Ù\\T³*Zóğ÷h@\Ü\Üt\ëh\Ñm\Îó2ov¹¾ÒŠõó\İZ*\\ZAu*)lªŠÁd¬§>´WX\Ñmd–\Ú\ÑK4\n‰©p¢±ui\İJoX£²\Ï\'¶$‘¨\Ò,û5\í\ä\íú|Å„w›\Ö\á3\ìºM#ÌºTô§g_,ñ\ÇWŸ{µ\ân7j\Ù\ë¡ªõó\\}D\å\ë¿G6ö$è–©euñ\î$oØ§:ñ\×G(2Dr°Ìˆ¯bÆ‘\"’DTPjK€\äDU\\\êúYü}qCw7Ÿ]üÛ–¬\Í\ÚÌŸº™\Ñz<z©úqQÑV8jŠ Š\r0O?¡\Ä&uiµ‡[‡µm8ôQ(Ù¸É¸\êÙ«\çõ$3\Çq^¶¬\Û\Å“N\×^|\Ü\Ñ\Øóú£G2i_i!’M`­\Ñ7\Ñ\ä\är»<¼t\ÂKuñ\ÖÄ¹ñ¦\í\ÌÛ8\Ç,•ñ\Ù\Ía\Ã\Õb\Åf\\\Ğ\Êt~¯\nH\ÙÙ½‰¾R,HLE$ªF£\ÄÆª\n\å#r(¨Ö¤\é•\Ë‰¨®Ç½‡Xu\\=šº|\ë\å¿N¦]\Ã\è\\§\ß\Ï_Ÿ}\ÏMs•:³V\Ë.k\äk%AD+\0jy}m\Zw76¹^\Ãx®L·ÙÔ±¾\Â\Ë\r;\ìZ\×4¯\ÍgZ°›\ÃH\ì™QLú»8Ü»:)Wª2\Ë\Ä\ÙC¿•°Ù‚\âf¹™Ú­8z~^k–WGÃ­œºw\ã\î4\ë\Ñó\ãeHÜ›\æ\è\Û:\ç\Â\İò‘IS$\nŠ³«\\=ˆ\èQŠ=\0p\Ä{EX˜\\Jõ—C7-«\Ñù\ÕÉ«3.²S¤b\ëˆ•\0Zs¢BU®ó²›×¼\ì,£j\ÚB%\ä\â¹—\×N	Y\Ó\r#“Y»c*K65p\æ\Îû8Yz-¬»	\Zş¼\ĞPceœ\n\ÖH\ÆY¡\å\é]H\ìt\â1XsUFµ\Å,rG ­bò¸›8|º\Ãğö\âõ­\Ğk±¯h\ß*n\åYH\Ññ\Ør×’\Z­	°\ÈÜ„°\ÅSÀ“\nG\ZX\âúş&mÑ¹“l‘’\Ä\n\æ\ĞÍ¶X…Jr Šˆ\Õk\Ù$M,/²m\Îz\íš\í|®k–i%ÀÏ†×“ß•}%Ô£^z½9\ZÙ›’=X\ìtL=\ÎXô*|\×u¬\ë>7k* 8jŠ\×(\ÅsFÕ·²#¤±ª¨5 \äQ#’;±†3\ÛğÒ¢;Yƒ	mÓŸ=©=\×šV¯^1\Ë	£’Bœ³>+Au•\r¸P´Td[’¬Fœu\Z·¢‰\Ã\ØùŠ<‡O\Ë\ÍÏ›¥j\ÄcdMYº,\ÙÄ›z‘ï‹‘¤=\Èğz õagKo›Ø¸˜†\ÂB\ËHb\Í\äúõe‹|\â»=²µ¶.k\Ú\á‘b¿NrzŸ\è\Z\ÃÁƒ\ÕUG\äQ@#r<\0TT¼Ô‰,d>w\èÜ•œ\Ìğ\ËN|rB2X\ÄEh­|GB,İ¸@ø\ÙJ\êXš°·R«‹#\Z“8…QƒÚ®²½¸h¥L¬\ë.˜g­™#uª\Ç*J\ÇS\Ñ@•¯B•„–\'¤\ËZrik©l¨ú³·\Ï\ßg l\ËqQò8ÀòûiXclĞ«`šEV­\\\\}ó±\è\\ô\İ]{\Z\Ã\ÄI\Z\0PTQ®E\0\0Z\r•ˆl0¯\r\ÈO)±\Z\Ø÷µAcBj\Ò\Æu\n\ä\ë\ÆG5ğÇµ£\Øú\Õ-e²=Ğ¬¶Y©v\n‹W§\Í|ZJ²’r­­:5‹:´ú©b–{Q¥–\×iuÔ´Š\ÕúlÉªQ$÷5	ÃªIY-lGMoœØ¼\ìº	S›½\Ï\éùıv¨İ¡.\åv®jÑŸ7Q9:sNß‹ôß‘¯±c{p\Ù*(\0\"*C„ZDsÑ¨4„…¥r²Z\çœ\çôÜšhQN\åJˆnŠ\ê ¼8\çKf–\ÆXº\Ã(\Ç\ÄÄ±6kMS2Êº9¤J1\İiT½ƒ5š6\Ö:\ÅZóJO×›;\È~\Şü\×%6ôx\é…[³œó\Äô\Ê÷œ™[\å{R-J)v!\Z\Ô\î`9ñvp:\Í;™\ã¥#\ã\é\Öd\Õ9õeºv\îc¨úúˆ#®]\ëo\Ş.ª\ÑTº”#²ó uNƒs\n\0@ \Ğ¢\r†HFC>w\ÔIŠü\ëZ½Dó^¿\Ş4Q²\\EYY \ÕATµ†”}8İ“>B\ìQ¶Ÿ\Ğ|\ÔKNò”Ÿa\åg¾1\ã$\"£§¸2D¼û:\Õ+Y\×m(øúåµ›yd–H\â;Nˆ\ÔZŠ–¸³š\×<¤®4\Ä,,5­>8‘¬°X\é¨\Ø\×29«\Üó\Ò2ÏŸ\×z¼’s\İi§­dyW[¼Ò²\ÛF¯EŸ\\\Å%«—³šo\èP¿\Û\Î\éa–\åTX)@„@” µĞ•²5ò&ôe\Ê\Ô\ã\İ\èæ”¼ó\Ñø=ó%«?N5ctv*¢Ò |z1o•ı8\îsFÙ\ëA«8#\âibJ\ÓB\Ç;ml\Ç%®‹#=)½‰ô\ÓsiÏ¿I{ˆ\Ğ]­N\Îu¿ñ\Óiù—W,Nœ\\;ù”B	c’˜–\î%N#X´–^™¦„c\ßtš¨û	r¢ˆ\å,	.ƒóˆ”…¶KRR\è[©dªU¢²%…®…´¬\Ò\áMÅ”¬Ú´µT¹6R®\ãs,gRÚ‚\Æt$\âÖ¥¬&2\ì!¶V\"\í	Šmi!Ÿ£[³m¡Y¶\Ò*hA©Yuö(,	ad¨—ª–Ô¨[*±hŒ³P\\¥\Õ#(\ÕZÈ³jñ˜hT\á\Õ[1w&:k†Qª¦R\êk´³WDL\ëE`ğ\Îj§N`¨\nÒ”h8iDF¥8\Ô+Tz52r\"\èŠ\× \É,K\É_)È•„‰ôôG¹SKóR^‚Nve\Ü2…\Õ3/K(\n\0f1‰\Î*\0Š\ÒÏ»O\Î\Ó\ËQr…E¦-t0ò«º‡Ša\ß\Í\ç\Ökº^:\Ôt—¹\í\Èp ®i\næ‚‚€\0+©¤¨Â:Bš\å-\ÂsQ\ÔyR©+¤ŒG\Ódca\íš¨°ò%\ÊV\"T–¥U³^¦zKB4š{Un7\ÎE®û™–5Î‰\Õ*\ÄØ•b£\ÛB±6»§‚²ô\ÆuŠœ¨\0\" \Êvª\ÖV¶H*.B¢\Ñ\ÔNV\ë\ÚÂœ#\á«+Ysk›š=\ZÇ›uq¾2Iw•\ß)Mz­­¬\rU\0\0¹¥E¼”GCUPT\ĞG\Ç5´\á­4r=ñ\ÅÃ¶\n9\\û\íCFI\Òå¼¨+£›•×¼ô\ëJº\çY\î^¾f9’5\ÑSš\Ç\ê6D!\ÈĞ™aIetIHÚº@ch¢*\0 Y­=^\Ë\Õ\Ì#T\\•P§fiT®\n	\â\Õn\Å“kØ™yõ†;j¹Y½5Mc˜72úrY¦–Î¶şn–suE\Ú8\æi \0\0\0\0\0\0s*\×\ŞND)X\ÃG£Rœødc‰¦H |„(óŸh\Ù>/NZİ±\Ò6‚Á¥È£¤—2}\Z3#–7õò9!]bFUT!ª-0\Ù+\ÑF©Z¨©\Ï`\n\"‚\0$\ÑIZ9\ÚYöWT\\\Õ\0‡c­VŞ~~…V.k”U ™,¯£›¬]’=\rò\ßp³Uu\Z\ä\0\0\0\0\0\0\Ìnm\ä\è\æR´\Ïh1\ÊF’¸„•£Uª9! \êhÛ\Ü\Å\Øg?N%—Å­G•–\ÌhÅ·nüGF†¸\n\Öú<\Ïb…ˆF\å:D±\"± –’\Æ2%uya\Î]Tl@\Zö†µ+\Ôô¤\árE$±„\ÙmOœ¦;0mY\ÑğW}—\'£ucª£.\Öù6YYy\n‹%\Ç1û¨\0 P\0\0\0\0\0\Ì+—9Œ‘RtÔ…e’THaµ\Ña‰#hcÁ¢<]°Õ«6=NÎºÉ§Ô´ú“F–„\á\"o„	`¨f\Ò\nØ¶#Ô\\¤K+¢6YdB³EJ\è\İœº \n \äj½\ÄQ[¦»u-\×Úƒ\Ù.dsÁb\Éõ\Ü\Ä\ê\Ù\èhs\íy‘ª%\Ú\ê\İ-&D{5iÚ™\Ú\ÚÆ–^®¹\í*;<¬\É*\n” \0\0\0\0\0\0(”¢†ƒ•…9Z¢ˆ¢*(9«D«\éÌµb:\åoÕ±©\ËYu=®\ëñ\ï¦\Ìú:Å»\Ø\ì\ë\çí´¼\çS7±µşV\ÛX¤·=šks”º©nT[e¦©&[5›Y\í\Ò\"¬\ÓGG@ «nª\ìÆ®\ér¦d¸Y‚z“g5r\äjòõ65ª±G«nÍ1©‘k96¶yı\Íb\í[\×%Tvq<±KÒˆ©J\0\0\0\0\0\0\0rzyôˆ\å‘‹#UÍ”UI^ƒG7;KŸõ@Á\Øô\çRµ¬ıKw0e-s—qù\ê\ìU\İ\Ïl{µÙ¸®k’N“—$\ï\È\çğé£’Ršô-zÄ¤„hZš‚5¨f¢¨\î\ØEGR9…DY­¨­¿={[¹rE6d\Ã*IN\ÕJ£R\Şw/IZhgJ6+Ã¬iMJr\Şm;õ{w#R/¼5Às\\“MÛ¢*R€\0\0\0\0\0\0¨\Çùö‘=\Ğ\×	H\\Àc¡\Ìs†<jV\å·ó}Ü±º]-Y¹E«q\êf\ãDr35£X Yˆ#×¯\ÑÁ\İğ\Õ1\\4ZX£AUE@\0­\'\Ç\'¦5\ìu1\Ít*	°øJ±s\ì\Ø\r\Ëj75{¬bK5\ìsúX\ív49öb\Ø)¶*ZYii\Æ\Ì\Ú\ã\ëŸb\ÎC{\\tœ‰&†m„Tµ@\0\0\0\0\0\0.h]Ë­\È\Øş8cÚš\Ó²R\\A&cZw”1fo³•Mş{n5£t=$5œ\Ì\Ø!¤ì˜4»Ef¯Tk†¹®M“Š\í|ú§\r8jSœ\ÂZ£\Zˆ\ê\Zöš’µŞq½’ªE¤¹”y«zœ\nhH‘!3b@4FË­g÷>Ú²\ç7;Ó·ƒl\è¤ZÆ!§G·¹\âYzmN*\ÚzjY\Ù%ò¨\n\0\0\0\0\0\0q.Ë´¶ WB¼¹\Ã:\×Ş¬,o\Ì{U-n~\'~us£Nu·0u—J•©:g:µªyE4e“\Ã\r\0Epˆ\ä‚Y_\Ùñw;qñ/\r¸5\ÅW\r‘\ÌXÇˆ¶£‘‹\Ô\ÕÏ³ß‹¥†t¯F÷1Yt_«ª\n¨¨€  ‚ˆ¢5È®±T\Í\Ñvd\ËqY\Ş.Ö–½\ÍF½¹Ü“C-–\'‚K4u9ùS¸·\Ëu9\Ğ€\0\0\0\0qÛ©Ç³Ÿ^\ãU¦\'±c±˜%¶h\á4^g¦\ä;q†3yS/¦¨¬\ìeö\Ã!B\"‚\ÅYj\Å#1PH\äŠ\"¼ò¯]\Éu¼õyœz9\è\ä\\²ÄŠ\Í¯d9+N:h–\ÕW2\â}®[C¦kñoƒys\ZB*(\Ğ\0‚‚\n\rQ£‘A\È2\Ëšx¥Ô’¼\Ù\Ò\É¬¹+d\ÖU’i÷>\ÜMXh\0\0\0\0\Ï\ÓO/\\ù[®®ÖÒ²x˜Y’q\ç§¯½Y\äz	º¸¸mS\ëÁ{[¶éš±¾¯\\PeŠœ\ê\ÒX³^\É+\0QP‰â”²ŒñII\Ú\á\îò\è\âFó\Ø\ÉYœµ\ÍMl•©bµ	Š¤3\nNÉ¢éŒ¼h`\ŞX5,TT´dP)D\Â\n€Š\r$Št„z\İ]lz\"ª8l‹!bHX–%„\Ğ\è0n\êuk\Ë\ïòİ¥¨™·V‚V‰š±¤gñøúA°÷\ëˆ-$õá¶­H“#\Ë\ÛÌ©\Æurz5\Ïux6}i\é>‰FJœ\ê ’ª€Bˆ£\åö3L\é8õSI?ZŠf¤N%F¤Â²\ÂEI\ßª6\Ä\Í\îjŒ^p \İEb¤8c”s‚¢\Ğ\0‚€\0¢(\" \Écx\n‚ª•¡5ª:1m7R\ÓH÷¦š\ËúNN]öGÌ´\ìE„eŠ.¡\Ë-C‡I)\Ş~õE5™¤QÙ…Jö e\Ër¾tª\Ô\Ï7T°oYõt#õùñ]¦Fy¸	½$¼\é·’k=q—m\æ›+e~—+†\àƒW3=Qd§šH	\Øõµ‘\Ùu”%|rJ­­kÙšNsûñ¬\ËaM-¢\ÔY\ÜVu¦fJ&œu@\Ò\ÕÑ’2\'.Z_²¸²\\n¥T\èS;\çÍ¢1—bÎšhÔ¦c½ù*µdª]ZÖ‹±\Ñ:=ş\n\Öu×§>…~rs^|;\ä5om¸l\Ê÷=lTAbd\éeª\ÕLY\Ø\çu\ÌD‡\\1\Ä):\æ?:\Ó\\Z¸½üİœ\ëf<wo:QP²\ìµMys\îi2\×rÚ\Ìå©¡–>z¸\Ö\İ\é3Ù³¹kb¤²\İSB­’Ú£’8\ï/<dÃ¸ü\Îb\îâ˜—\îÑ«¤ŞbN®MıY\ÎKĞ²¹§n\â\Ù3jĞº¸±Ï¸ƒ\à\'\ĞÉ­Ï§@œÖ†ww:\Ô1ZzVzr•®ó‘“Eˆ\Ø\æ…X	š­\Z\åkUU³Á:¹Ö®\ë7•®\Æâ½˜E£\İ\Ä\É«!³Cr…Ø”‹#M<J\ÊN\ÖB[vs‹‰Eå‚³	 \ZN@È³s0³¢\Ø\âµ7:8X¥¯\Ëv-\âhú3yj\Ësfj\Î\Íu\î\ÍÃ‡¡‹Ç–\İioE1Ãœs\Æı\Ç5\"\İrE\ÜHI™\ä‰ù:&r}fö-#¼|C³·Jj´6)f\Øm6—šK\n:,\ËJJš	’Ä‚õ]\åöó%‹U§—*K#1\Z=“R\ÔH‰Ö¾\Ì\Î\í™#c7G\'›¼6jZ‡µ\ÉHªU§©§‚s8J²æ¶¦Š>o÷Sk=9\Ë;,\Îğ\"\è9İ•Ms\áb\é²\îr\ÕY®o|A\Ù\\\å·õT%vy½<œ\Édnz\ÏE’\ë?\ZL\İh\êE.\r\ì³\ÏÓ¢±\ÍÛ“f:²\ê5\è\ÙeSIat”¹\Ïf z2¤cĞ«w7‰bTV\éMg¯Cz^Eı“\Î=:z78“\ÅÎµX­\ØW³£$®¶]eu„k\ÛÈ­{ˆu2µv‘ñ·®‘‹«,2ùûÁf­‘\ãA\ÃA@	\ã—mš\Ôú¶X»]‡7\Òãº¤ dìš¯\rˆ3b­f¾Uâ™aS\Ş\Ê\ï\Ã>;o\î‹z!e‘j­‘+”¯e²\ï7Qç£•x.E-H\ìÇ‹’\ÕoŸ¼„K:Xº¨\É\"Iš\×Ó\Ôg\Å?F£Yš\èK\î­k\Z£\ë\r\ì0:lu»\"+md‘«QÍ¹\Î\âıŸg”X¥¼\í¾\ŞA\rFÙ¨ø²\Õ^q‰bK°\Ù\è’\'Á¼½©¹,Rğ\ï^\Õ[B€€\nŠŠ$rD6\Äğz®pk¦°\Ö\Ö\æ~†;½öF\×\Ç+Xôj8¤‡2œW+óg\ãmbt\çQc\Ñ\ë\Çru3QP\0pˆ,°\å\êtsWº\ã¥~=\İGÀ\æ&3›»˜0u\Ü\ë‡DÖ²fÃ£ŸF\ç\ßÀ\ÖrØ¬\ï\Î\ÍkÚ]{Z[ºy\\¦\ÍÅ®I±ªÑ‘ˆ\Ú÷a¹\á3ú¾a‚{n\rV\ëœOd²\Ü|IŒ¶H\Ö\'µR\ßh‘\ÈjQ|°f\î\Í¼zÁfµ \Ñaªö†h`ƒ#]+’\é©õ¹\í3‡N”\é\íP!·•vY\Ú\ìõ(k¹35,$£¤\É0ôtc\íÀA$PJP$\0T\Ä\ÛÇ³\ny,\Öd®Dš\Öckm·s¹õtd:\Ì\Ú\Ù\Z\éª\"µŠ!\Öq½9±:a°\ËC»‡\İsô­—hcT™¢\İr\Íu\ÈZ\æ_u˜\ëJ‘~\æi\Õ;™·sg\ë9ûj¹‹:\Â×··’ –j\Ë&d\Ìm’<[\Ö\ë\Ù\ï„k\ÛdpØŠ]yb—XlÖ²*¡¢ˆ\ĞC\æ†a\\\ÙVM\í.^§Ef:\Ì\ÍŞ­\Öü\Z¹Õs£\ç,Ó§j[9ú›\Ö3q®L\ÜÉ²uùŞ˜\Ñ}×š¢¥Êˆ²(\Ü=Ì2\îÁt\Î[S\×Ù§JxytŠ´´õ=\ËQ\Ø+¼¹\\•W\éù\á\ŞR)Y›/m\Â÷œ½\Ó\È\ÙÆ‘kŒq\Ï\n\æCw/=£\ÏØg>=¤0\'}´‡/o#|±Ş‹×ˆ‚\Õi\Z\ÌkQ¹ö™‘\Ê\Ì\ËóF\îùsX±–”\ĞMÏ´v+Z…T~\ã\Í‚Ö’)fš)Q\ÓA+S]¯c—®Êµû\åE–³±\Úk¹:\×,\Å\Û\ÃÍ¥»\Í\Ú\Í\ÛmŠ{Q‰\"\Ä\Ó\çz\İò†\ìR° \\¨Š\0	…½‹¬Ğ²\ËI\ÎTl‘K¹r8\Û\Ëo\ÍÔ­ExuıõÉ¤\ê¯\Ô\Â\Å\Ó\Í\ë\Î$rj5IizO›uœ»t·ª\Ü\ÏV¢­\Ìq\È\Èei3\æ\à}-y«°-{œ;µ\ïJ\ÌƒŸ\Ö1\Ú\Ô\ß5 „²Ù£+:qbòJ³’¬·Û•½4°;[4-\Ë*Ö‚\ÍV#7“\n\ç9\Ïw¬d;.ª\ç\'\ÔjX}K[—\å^\Ùæ®º\Ä\\®\ç/½5Û\éÎ¿/½‰™\ĞÈœ\çL\ìM½±\"#\Îv\æ¥c§8˜¨\ÂXª‹\0„{˜[•*\ã­J\İòd±\è\Ü\ä²x³¸dR\ÔÔ›.ş—|\î›‹\ÎS±_\ÑÁŒ’*V¶<«ô<\çKÛš™\êá¤­‰\ÑEl=L\\İ‡Æ¶ÁJ\Ì\×\Ò\Í\ĞSŸ\Ú\æµÆ³\\y69\"Îœ\èÔ‘ƒ’åš–XµRWô\Îu—\Ï5µZkRLn;Œ›&W¶,i*õN‚¦u–i™\ÖwK‹\Ğt\ç^ü2k6µ¹Îƒ—¦\Û]`\ç\î\âc]U~+¦\ß7\æ\ï\Ô\Îù¨Œ©:mø,\×+^\Å|MI ^Ü•Z³\n‚Rˆ°ª‰*\áicnz^\ìªóG\×\ÈÇ¶}s„y\ÔrE%’IÅ—Ö³]¾«µ\ïÂ‘~”2nu>½)u;\Ô\Ê\Ó\á\èd\ÒBE-,-K†=»Ì¨°/\É3=‰)KSœ»C¯EK‘\çC™5…\ÌZ,\ÅÖ«÷\ÌzÅ¥-L\ëR\ÊF¼º]š¼Š\çF²¶dm\Õ\Ë\\ô\Ól\r\å\ÓB÷?±\éó\Ùk\Å\ÔÂ;gV“=\Îo¢È‡İ²\İ\Ã=`\Î\èBbv¹ódo8¤3\ã7ó™S¯ô­\æ9X\áQ¨µhX¨\êùj&:F\Ö|¤‘OexŸfXu5“¿,Ë5,@±¢1,j\Ê\Ùb’7Kvj\Ókz\î&\Æzv‰Z~>†Ab´T¶\çTT¯T»ª÷,\ÂaI®(Ç³¦Z\×6YwIŸ<sZŠ©©\Õ0\ÒGEyÎŒn\Ë<\n+\â\×‰R\×n\\*Ö’j\Åi¤jH¥Vj[cu8³\ì\Ù%I\á®\ÃOÏ»n~‹±H³R¬¦¦=mŠ¸\é‡j\Æveşq±0«…	:ñ\Ñ\ÑÀy¼d\Ï-õ¯4(\"\ä\Ñ\Õnw‘`’\å\ÑlV\ÍË±Qzó»«û\Ë\İN\Ï~0g\êecSµY+#zB\"¶Q®kPdZ¬÷2´K$\êø\Æó\ë\ßG“{—w¾µb\ä9³¯›N°F²u\ç¨\ÕL[·\é\ì±\Ë\É\ÚÔ‚³Yl\ÙÆ¬s²\Û2j\Ór\ä\Ô\ï‰üºŞ«b‘M—$*\ÚsuFŠˆ€‚\Ì\ÇR\"¶«\\­5\èVx¿ôZµ²Ô§›>bG9\È\ØjÜ¼U\ß1\í[‚\n\"–4\í\á¿6\å¬\éq\Ö\ä-ƒ\Z°ú\ÂRX\İ\è\ã\Ñ2S\Ñ\çŒbÔ™·©\æ¢›\\‚#’V#Ú±\Ç,2¾z²¥¥b\ê$SG\íb¦ztQW¡Ù‚Œ—¢I¼V‘l\×t¶g¶õ\ê\Æ\ÖWG—%s¥u\ß+\æ±\Ê\ZM\rªyšM™‹ŸGB\r\çZ-d\áÚ•\r{rf+:dA…j´”™4F¹•mA+®\ç¾^\æC¨\Çj™»üš$Ic\\¡™K–±\Ík @’Æ¸)DHs\ãR\ÄL~t·j\Í\Ï\Ó=|¾œ:G{<qQ½•_‹>ô¬VKŠ€\0\Ôz+ µµ\äj\Ë<µg¹s\\‰s1i\ËZl\îG#{b8uU±Yòõòcnrõ\ÇS:^k_%Š;y—õ\Å*[­\Z,m„‹#¢\ç6\ë\Ó2^ \È\Ğ\Î\ï™Ú­\ÖU®h\ĞHVªğ\ÏJ‚RB1\É-[:$k£¨\æ,h\á\"4Z°²6J†he¤¡¡NT!\Ó\ÕV¯\æÚ©#\Ğõyi\çX§\Ïl(ó»wsu5š¬–4Aö­f\Íu\"±j\ÉŒ­[eEi\ÙT.è–2K@@RKùÎš\èªR›\Ï\ê‡\İóØµLE\Ûe‹t\Ö,\ãh\çntğú5\çúI^v\ßF:OF+ÍI#\Í\Ó\ÒC\Î\è\çiè¥r/œ§£‘\ælôğóVzhy¬¾Šp\ßI5=(<\ÌôÀó5ô°óuôpóGú@yºzHyªzXy£½$<\İ=$<\ÕŞw¥‡%hov\ÏG3|\â/L6½İ‡\Ï@,ó\åô\0óôô|ù=“Î¢ô¡|\Ñ}(_5w¤	\æô\Ñ|\Å=<<\Ñ}(<\Éş”\'œ/£ˆ\'œ¯¢‹\çnô ó»=Ùysı8¯=OC$ó“ÑƒÏ£ôPó\è}\Ô\0š\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0aJµ0`\ë\ã\ï_\ÂöxôNzƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ì®O‘\Ì\ßN‹6‚wÕ‰i›»¼\Şÿ\0‡ËŸ\ån}H\ä\é\ê+Y\Ïj	³Ë”\Í²Ø _£;tLz7Œ\Íq\à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\ãyu;¿x´¶ú¾»\çµ\ï.|\Ğ\å\ìÖ“\Ï\í\èi\ã\Ó\Ç\Ñ\ìùyw{/+\éûğ\ì\è\Üw.\Ùò\\\n\Ğhf\\\Í\Ó\Û\Òf‹ƒ#Q\à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ìªğ=W	\ä\ìşŸ\'\Ğ}\ŞÉ”\'\Í\0\0\0œ\ßOO|\Î}~Ñ¾\ï{†\îo@\Çp\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\05\0\0\0\0!1 \"023A#4@B$5P`%6pCÿ\Ú\0\0\0ÿ\0¤´‡ø\Zjø*e\Ú=JšJ…U¨\ÓÒºŸS¥Ê®®*FjE4r\Ç\çTiº\Å#W_#ÆµF¡•“2§T¥§}6¡MRd‘±1\Ú\Õ 4õ1T¶®¾\ZG1Áí¾	*Tz•4•\n«Q§¥u>©K;¶—X¤ÔµôõJ®ª:FC+f‰õğ6ª¯P‚’O:£Tµ1\ÕF¥\Õ\é#}5lIõğ6ª®¾\ZGy\Õ\Z†¶©\é+\à«uLñ\ÓEIW[N³H\r6£MP\êºøi5ª5\Ñ\Î\ÇkwQ\íWW#|\êRWCVj5ZXK_OTeÕ©b“Î¨\Õ<ì©‹XŒ‡L‚iª\ë\"¤\Ê\É\â5Ğ¶­U\Ö\ÃF¼\êA<u¾	*ju*zi|\êx\è|%%\\Um«®†\Ô\ÕGMQ¨*\"¨kœ\×\ë4u-\\C\æ\Ğ?\Ü§Q\á¨úCOM0E©\ÒÅ¦OR¾¤ü0\ĞĞ»Oú}\Î\ËM4ô\ŞS4\ßRUSG¦ˆ>œ/To‚ôø4÷Tk2>£Pf‘F\Ø\Èv—ª}Iù´Š·R\ÍCşı©\ÔxjN„\ÓSL* ydZ¥,Zdõ\ê\Z‡2-?I€Sê´‚†]f^¾›¥ÿ\0·\Ôÿ\0ô?Pÿ\0_\Ô\ÑU!l¡Î¤Ó¤£b\Ó ¢kªú©?0“F¶0\r*\Ò@\íJ±Ú„ŸMş\"gªÕ¢‚š§\ê—\ËG¦ø¦Ëº´Æ˜V\Ç\äòÈ¾¤ü4\ï\ÒzM¦0Ğ¾)´\è4ó=fJc\Ğ\é ªPC\ÎªjOTeÔ¿f•X\ê)¥ÿ\0\è—\Ô\ËÁ\é¾\é\Ò|]ûö³šõ4U¨²&h\ÔS\ËG&¿+f\Zÿ\0û~Ÿ§R\ÏBö»IÔ¾¡\ÆJ}\"™‘WBtºÖœ›ò\éU1\Ò\Ö3V£{µ©SZı?Rt?OTq&¡AS-XµK\êO\ÃM¢u¡¦£Š\r7Á\çO&‘\ßRU©if=&JqA\ã´\ê\Ãº®µ”õ\Ñ\ë4ŒeªjŸR~mjƒ®\Í—jzÜ©¬vŸ©:§ªº…Lµµ#·\Ô4\î’uH\ä t¯1\êP‡húf©O$ñ\Ú\×\Ô?\×ÿ\0\è\ÕIDÍ‚¦V\r\'Z§ÿ\0¡ú“ó$·Rú^‰j(™A\àôß¦ÿ\0\r\r¨¥\Ñb†O©?5~–\êX4G@h\é¼7ú,o¯©?\r?”t(§¢l>7M¬TÁÕªÿ\0¥úejõŠ†¿¦Ş¶›_õ\'1\ÔPø½3N.:’ú™ViF\n]Àihßµœ|\×ÿ\0Fµ	\"“F\Ò\é™U¥TG$\×ÿ\0\ÛôıN–\n\"_«j_PÓ»:}f™\ÑU\Ê\íV¹£ü¾SDStº69”4ñÎ™CN\É\ê4újƒM§SS¹T\Ò\ÃR#cca\åyE\n\ZUME=K¤cde=\Æm2’cMCOJ\Æ\ÈÓ£Ñ—Cp6¦Š¤¨\èi£™”4\ì2†™“\Ôiô\ÕŸN¥§v\Ò\é4r»Ê¨úa 5úE\İOM\r3j(iª_\å*©˜yRi4r\ZjXiƒ¨©\İQSEOR|¢…EGQSR\ÃL$cde5,4Âê¦Š¤¹s)\è©\éœtª\'(¡C…SK\rHòŠMG*›K¤™\Ô\ÔTô©\Ím5$ª¦’\Z¤Æ†6¦’\n¥-<Ñ±‚6x*ªi ªX7\nz\Zzg²Š9ç ¦¨”P¯†§‚*fT\ÑSÔ™é¢¨\Ê(T0\ÇH\Ò(\Ü\êzhi‡÷µ’¾(4óVaÿ\0\Ôf8©zı\íjä–»R‡M­¦¨\Õ\ë0\é•u¬¢«J©ú\ß\é4:õ^O/¨\É\èU\×n¥Zjªh¢\×*-^‡S×¤×ªd‚(ôª‡CBÙ™Lµú•6ƒ;£©\Ô?¡Ò«M5N½[\ÏÓ¤šmz§¥K¡N\è\êu\èh(%­õ4:—Ô„‡Áøu\Î4\ê=2j¨4\í6JI\Ş\éu*úM>¶š©kÔ®-‡U[¡Ó¾Ys6¯QKY¦N \Ôiz_ô$ÿ\0\äPãŸ¤\Õ\Â\Í\n®JˆõÚ&‡;¢ª­”ÁKII.¤´ªjºw-T:MZM:º‘š=y«gAõZ§‘Î£³S«ğt\ĞP\Õ\êM £®¥«\Ö5	\'’\Õ9º]|\ÑTı@O~“W4*¹*#\×jz4šîŠª¦3,Ñ¥cha–¢¯Y¯u+c\Ò*\êKWQ§\Õ}HHf‰_\Õk\Éÿ\0\È?²®\ÒâªÎ­Ò¥ú†\î}$¬šŸ\ê9X\é5––i“\Ğÿ\0\ë\ÙP\êE}Iøk¨Kiµ\n1GIÂŸJ¡¬Ti5\"\nıJ\n˜§\Ój¨[£U¾ªW\Õ6mFª°K[U ›K£¢ñZu5ú¦ÿ\0¥\Ô*›6£WX&¬ªM¥\é\ÔUFøß¥VıIË ü:\ïûuSQO¥\Ñ\ÍHªô¨ªfViu€\á5 n§j¹\Ò7Y™šz\Õ\éü>—¤8;O˜\çõ\Ô?\×\Õ\Öj-nF) \Õ*DÚ…m`©®‘ú1+H¬¨j»ıúiO4š¾„•\Z¬ZM[%_R4ô´©Y-QJ£\áõÀA.\Z\ß\Ô?\×\Õ\Öj-nH)©õJ‘6¡[X\'ª§˜O£VıBz\ZFQÃ¯\ÍB7¶Vk\ÏlÕ¿QC]F\èb¥˜\Ôjÿ\0\ÙUhòu£\Ñ\ç–Zªh\êaòz\È]C£¤Õ¨ä¬†\r)\Ñ\Ü\Ê\å«QIY<f:}^†J\Ö\ÖP\ÔMEGJ\ÚzmWM5n¬ÓY”×‘AH\Ú8*[# Ò´\ãH\ÚúAUMMEQ¤\Ñ\ÉG\rdFzZ**ŠZ-+N4‚¾T\ÓSQTG§³G®`‡D‘\Òjú|µ‡\Éë—€œ\é\Ò+\Ø4\ê*¸\'›F™²\Ó\èó:m¥Ó¦~«³´é¨ª`eL>OY\Ó4¯ıONš®«P¤”ô4µ”\Ô\ÚVšiu+ji©4ù[E\å3Kğ²-CK¨¨¬òZ©\r%,t‘M¤UšŸ+\ÔT`†O\'‰\Ú5TO¡\Òú†Ÿk|¢¸\r;Le\Z\Ôô\éª\êµ\nAYOCKYMM¥i¦‘WR¶¦š\n\n˜ôöhµ±–iš€}m$u‘yElKN\ÒNı^†J\Ö\Ç©\á\Ñ\ßÿ\0³¹\á¢Z\Ö5\n×•\ã&^a\"euĞ¨jkƒ¾\' …Z\É\å8¦ğö€$j±0‡vM‡‹À\Ç,r\Å\Ìü#—\ŞH±½ˆ‘{\\M±»‚¥\Ì¯r†^ õ„À£j• ‰n\ä\à	j6\ë\Ã\Æ\ï\î\ê\ê:\r\ëKZ\êmL´º¶ ¨fÿ\0\Ã\×\ÈL¥\Åe\í±QB\ç¦Qh””Ò±;\íZ{‹™\ê=š¢p$r“•Œ| šš\İa©\Ôõ]Å…²{¤’\ë%O;¢|\ZœR8ø]Dc0k\×7†!0ÀF\Ä\ÜUCun|”ñt£õw-	²t–OryNMA4&\îõ	\\\Ç\Ìs}ı§…~8¿\ìCY3œ\Â\â\ßøJ\æe+c]\0TQ\àU÷{SYG¨¦„Æ§½±µõ\Ì5—Bv½3—54&?ºu\í¨\Ét\î\àğ2\'¢ôE\áK3£}X—şa\ï±Y„\Î\ì}}\Ësºl«˜¸Œ‘\Ê\ÙC£T\Ó6f´&œºÖš\\,©\á2˜!daã‰›gôLŒğ®°L\r‘\ßğ’l7{£H\Ëÿ\0‰³ƒºA0İ0HF¡\È\Í\"\ëÈ„ò^ıHª\İÀa‘Í‹‡\Ä–j\ÍÊŠBÉ˜\ÚCó‡~-Q™S*vu*¢‹ª¨\è‹\âim]9‰\Ú@&¯ş­/lZ,@Bq\ÜA&”\Ñü`§8¸©¢lŠ@š?\Ó\ÖûÑµU\ì\îöC…Nr‰8§ŸŸ\ÅFÊ¡Ql¬yø\Ñ#$¥{*Àk¤jl¢\î—–E\Ù=¡\â\Ä\á³,FÁY8&ŸrwLü\èmruN\Z)\rË‚\êhı¬\ÂGD\Òe‡§ÿ\0H¤)\ç\çªş³õOù¾\0µiú¶Q\ÏSwfdªØµ…\Æ¬;)f|Lc²gü!î‚º™ö‡5½W,\×,7§ù\'\ÍúLz´\Zš`¼\\EDe\ØH28\Ü±RŒ™§ô\î)\åYYYYYp®Â¸SóPF\Ó\İ]]]_\Ò^]+CE,A³©\Æ=V\æ³‘k¯\Æ/š\ê\ê\ê\ê\êş««««®£B\ë\×]r„Áeuu{‚*NdºvI\ïnmm™w\Ä×¡\Ù)c^i\ÈP\Ëv{Xñ\íxG`\å7v\ÆÃƒÓ¼\Æ\Ï\ä9\ä\Õv¬‚\Éet\r\É6Y.“IÀ ÀqYw+¹rš\ç4ƒur²)\â\Ò\ÆüT\Ó{<A•oµc]jyrh*\ë«e\Õ+¬WYu—Yu—Yu‚\ê…\ÕªU«ª\Õ\ÕjÍ¨8²\n\ã\ÓEÓ¯\êŠO}\Ó=\Ç\ÖtP†µ\ÂFªf“$§\Ú~\Ô\èÃ‘c¬\ÈN\"?lB\Íw/‘©‰\Å®­sºd\ÆTƒ)ºp\Ìt\"\nÍ·\ÙY«„\0V\r¹\ÛŠ\r\à\0\ÜJ;_kª¹N1Q\ŞEs´TU;*F¦ğ¯¹ô[\á\áu}¹Y™Y•’\É\\« W6\áp¿nq\nG9Ê„{˜\Ì\İ\èh÷9³Ÿ\î6Yb<Jñ$/“›#c\\¤\'4¹2GH¹aº\'f%8EMVb\r¨T/İ¶\ã~U\Â\ì²E\Ï{‡(‹¬P\'`¸\\medZÒ±j\Ä)[v)\Ì6g;\n4Ğ¨Ah\ÉK8ˆŠøšö=]Yr‡e÷°ì®®²+2ƒ\ÖK%’\Ş\ä¡tBl˜…ú(¢¨\ÚJŠ\'¶6›ÁØ¢°ş;§™­Edš\Õ\×—^\é…”€\ß\0»\"€M\åVË“¶8..¹\ß÷Â°\Ş\ë„VYv\Ş\ë$oat]e~6²™½2\ßré’£¥r\â÷M+bOqqw\ß…‡Æ¦U°¦½V(]X®\Âì®¸Võ­u`ƒZ›Ovô2\×E¡D\×H\Ò\Óú*\Ë\Â\Ì\å#Œ\Çlº})¬ \İCy\ÂÍ *>)I\Ò\Ü\Õ-4± B8\ß\'\Æ\\\Ät\Ñq\ÄNt(9U3tXœ\Åb\Ø8¬\\­µ\×9\\««\î6\ár†\ÖC…r®QÊ«P\È5\× µx\Õâ¥‘IR9%wpWWA\ÖM«pP\Î\ÙE\Õ\Õö»vµı$\ÙI*p²¼j\ìWºo77^‹lZ÷51‘xVØ˜\Í\ÆÕ\àlZ‹J÷zÁÉö²’)UF™#Tp–¼£pi­­.le\áR„5\î/rÿ\0\'!\ØI²%«Û·d\n  ­\È\áw\áZ\ë#\Â/j°X”µ‚³B¹¡OQ$\ÈwmÀ\Í	.^òP\Ù\æÁ£\Ğ‰L=7E ’;¬¹\î‹\Ú\0›¯1HŠrt\Å9\ä¡\İ[v\Æ\Ò:+.œˆ\Æà¢†2-\èö\"\ã³œ¢Œ½ß¡t}VR@Ç‚\à\Ñ,†Rx5Å…ò:W/\ßù9~¹Nk•Ü¬V4£\ÓA\Í+…\Ö(\'\0‡µr…\Ö%bP²ÿ\0\'®¡\'ªŠ¦B*j\ß2(¦ö†£¦3÷;~ÓŸd\Z\ç.‹U¢ %BF\n6X´¬Z°	\År\ÜH\æ¦\ÔH«zJ*¨ˆF¹¹5d\Õ+º’0Y›ù\Úfd\Ğvkykl6Øµ\Û»I÷\Õ:\ïûl\Åûr=¬\äb%tP‰¡Ú°F WA«¤Ğ±*\Ë‡\n\ëÜ¬õ\ïV)\Ù#\ÕG€r\Å\ÊG™$GcÀÙ‡l\ãtı~ö\r²5\Ö,=F\Ü12RW6nd¦¹\×\é•(²*\Û‚¦EeŠ†¥¯~L\å\Íû}=—}\çf%F\ÌB\Éú\Å1T_,f\æC\Øwı—f·²(\ï“Bº34°AÁ]¨¯×´#\ÛÜWÄ«”z‹ùb±+¦\å‹À·\rº±\×C\Ò\r€®\ÊûS¾\Ï\Ä&…av\È\æH\ä\ÉT•8™d}J\åE\Ô*Vb÷wT\ì°Ø…‘¢¨ñR³9\Û\Û\ÕmÊ,\\]eb\å\Û\ÖS~ù\n«eŸ!»Ü‚ÿ\0${¹4\\øWûEÏ¿¸¬J²÷§+ºù’\Õ+§)A®¸¸W(X«3\ØrrOq^å“‚\ê¼\İ\à\"6\ì\0VX¦@^Nh\Ø\ì{¯qX+oLş£rxW–®‹®\ÖX8(\æ““E\Ë‹vqöª\Z=(o\Ãm¯tÖğ¹3ò8óPÌ£/³;û;»]‹K—\î\ë\0\Æ\Ë\rº‚\ÍÁ\ëB1\İ6 \Ôì•¤]#|\ZWIˆ1¬G¿X\Ù{\ÕÊ¯‘­ˆ!·ù»\ÑLö\Ä3q®®®¯\Æk%r²WÚB\É1‘`ô3İ¸”÷\'<\"nœ™ñ\ÂÁc¼¯ö&77F\Üúø^­ñLl\Ø\Â(ªøz5Ù»\0¿vEşM”‘+ªSj\0]h\Êö•\Ó74	º¸E·X€ƒB,º³–‹!+\ZD‘”D\ØTK\Õx\î6o\Ş~\â\n‹+.Pk–6\Û;!3P{\n\á[jg¸´rˆz³\ĞC„ÿ\0\äi…\Å1.ğ†7\ÎH°\ÚY,»‘ua\×øO„©6(µ¦]3f÷\Ø+\íeşK£W@.ŠkKUšWL.™] °bÁˆ\"SšŒ+«9ª\×XF™+P‘\ÖM\î6gs\ŞŞ±*\árË¨U\ÚV\r]%‹Â»•$\Øm{¬šJKT<—œ–û+)Šqº‹BÑ©ñh\Ú\ß\ï\árw2ˆO`s\\0”&\ít\ŞÛ\å­¶;Ğ³m²E\Ò\ÂÕ›mYµ.Cšã±²Éª\ì*©\ÙT9Ó°_´ß¹da½=¯\0+\'6Ş€†A¬‚pº¥“ª\Â\Ó{d\röxT\Îö\î.¨\â£6sb2\ËC¬d?°(¦ş]\İÚ©¸T7³v\ì/aY \ë£\Übƒ\Ø\Ô$nØ‚°+}‹$mñ`±X\Ùr°d{–NMy=ªI*³W\é²ºj?q\Ø\ì\nw5u£™³D	\å¤§&÷½\Ğ.\èµr\r,¸?Ä¡3\nl­&\'lñ\Ã=³\Ã‘8bë§¹=\Û\è¬!¹\Ü|§gl\Ï\Ë}®‰Z¯õq”NN\ï°6M\å\å¡Ç¦—X„\n «l	6Û¨hV	Ë²(9ÁM#[\r\îƒn°Vİ©‘I+ÆŸPO•T#¦\Í\Óğ5A>f(\ØJ¸\ÂE4!À´‚o`İƒ¶²÷+ñ±‘Ñ›ôP„\':).\Òx	®WO>\Ş\è\ìVNo\İ~şzŠ	\ÛE÷lBpZ\Ô>\Ö}Á\rŸ\ßv±F\á8¹X«”\×9{‘xE\ÍW¾\Ù&\Ë\ÆM;´,\ãC¨Ê†ñ\ĞM2:L¡C@£`WH\Ã¡\Ów‹Å“4¦\È¦¥ŠeS¦>Û´™^WtB\Å\Ê\ïJšö£\Âgq‰·\n\á9Sº\Î\'‹µ0–+’Ø\Ôm\Íñ3ü\ä	û2V6p\àv)Ê·¦ø?a\ÙûO>›\Ù—X\ÙZU\Â.j\ê9]6P‹‚/ºp(l\Õ\Õx•\â2d¦\á]]Ss3]a$«+¦¹ø‰ˆ=V½:7(é®€\r\Úê±‚*K\"³Y#b‹S]d\áp\×¢G\Ù\É]…#H‹\Êöqt\×YÌ©sZ÷±A¤ª&;Ä²w\â‰bñq\'V\Ä\Õ•½ù¡\Üÿ\0T6°NhZ„WGö§wôQi\n\å¶²8\"n «+\Ù‡#\×L,bÁŠ_Æ\Ô\æ\Ò\äQW±r\êh\åM‚\ns\âZG\"L–k5©\Û%r®»+\Ü+¢»(˜dt4\â%k+•n_”¦&\È™bØ‹‰‚\å\íÀ9Ydm¥¶û•#n¹\ËOü|‡\ĞóuZzoiÜ©›“\\,bûS»ú_\r\0)]Š7;rurÈ®š…Â±(\Âö¯b³cUM6#f›:\'\\#\Ú\'ˆZj$q>¼š\è\Æ\Ö\å’\ÉWHº¾\×]•\ï¼Lq\Ç²,\à±\ÈF\ë{¸šl§³!¸pŒJd*Z-Ü÷Q~Ÿöô;\ê‚ô´Rõ!Ø§*\Æ\ãQ`S\Ï>—»¤×½’µ\Ì`2!5b—µd]0ºnG0„…Ò½©\İ5\ìG•\î*h‹6)•j}LL•\ìF¹\îkkSglˆ\Êò²%5\Ö][)k€O‘\Ò;\Ñe€X…A6~\ç”0z\é¹Ã¦S›Ï¦¿ƒ§\Ë\ÃB…<+¡N…-!FšŒ¯B›GD…)BŒh€ñ§†#.\ÒXŞ£—UË¬õ\Öz\ëHºò.¼‹®õ\×z\ë½u„\Î]W®³\×Y\èLŒ‘¦¶2¤§ŠFEG+¤\Å\Òb\é1tcRiô²;\Ê\è×–Q¯*¢^UD¼ª‰yUòª%\åTKÁÁsCLT°\Ä\Z`‰t#\ÃÄº1¯\èD¼$\nZ8D1…\Òb\èF¼4+\ÂÂº¯\r\nğ\Ñ/\r\èDO‡—Ò¯/¥^]J¼º•yu*ò\êU\åô«\Ë(×ƒx:u\à©\ÑÓ©\\¼²ye\"ò\ÚEå´‹Ë©—R/.¤^_J…0>\nx\Ze\àiĞ¡§Á\Z\Ä,A«\î\n$•’¾\×Wõ_oÚ²·À\É\Å\âMüCSdk¾y_‘ô»°\í/\Ùı‹½GûÀŠ]\\/\ß}®¿^±\é‚\Ù\ßqR\\ñf\ä\\O­İ™öIö|.‘­^!ˆ\ÎÀ¼\\HOA\í;¿\íş\Ç°X…a¿_kz¯\éº\Êíµ—r\"qR0°«\İÊ¿WWôşÁ!6wµ\n®\rK©M‘®,?‰\ßo®Y\Ù\Zš°¹>g9fº…dSd!\n—…\ã™XS*sx{~;‚ÁXz,­\ê¾\ä\î}\Ş\èôG\Ó\Z\äÖ†ª§\ÙN\×ßM½%]_fJ\æ¨\åkşJ\ÇúõJ\ìY4$•U\ÖI¯r¦«ÁG3$¬JÁb6¾\ÖVõ]_c\è¾\Çk‹^Ş›\í\ÆÁAD§\ÎÆ§N\ä\ç]{W\Ù¹Avººº\É\rÏ¢9œ\ÒÉšóğ\Ó}«÷\é¬v0½\Ü\ß\Ğ\ZJ\é‰V\Ú\è¦HXi*º‰¦û`¬\Õö·\ÊVV\à„\Zw\ÉV\âü_n\èo\İv^,1’L÷§KŠ\ë±\nˆ\ÓfŒ¦¹§b2„P\àw6\æÁV\Ûõut9V\ã²ş:}÷zuŞœ¢š.c¦2tÚ°\Â\éÂ’\"\ÒD\\CpiŸ“wı\Â?\ä¶\×C{!\Î\Å_¬¿{\İtT²\'N\ç\Åedæ®©E7\Ü?\Ò\n%4H\nÈ…úº\ì+€¸MW]\Õ\ÈE_\â§ûÔŸ¦©¹S¿º„{š8‹\'µ:0D‘\âce\ÄQ\Ş:6Ù†vù\nP\áµ\î¯eoPºı\ÙYY\äø†:{=¬\É\×Nu‘6‹#u‹J\ì@]\Ç]][‹!\Ê\å•k\Ê\ì¯\í>(?*›òzª\á0Ê o#\Ô\ä©´b \à,7)¿(\ç\Ôwºº^ëk®s½ X*™j7]¥·Rƒ\ïi/»r(&±5I+$\îSv\î¸\Z‰M•’·²=ş¿2Ÿ\ïõjPuiŠdafĞ²¹N°EÙ¿Ÿ³\Øv\Ø|¼u}ÀV¶Ç”D ®9œ‚‹«ÇºûU‘\ïeûhL\nÈ»k£·\é\r¸º· +!µ\×p>(ÿ\0*¨\ï\ê¨\ìv)\Ñ1Ë¡Š\É]d¿™Ç£)P\Òb\\€¶\ã·\Ïú\Æ\ë`¸W\æ\å4”l²@\íÁX«‘uŠ#nn\×)\Z\Öğ×¢P\å\"jk€c‰*\Û\ßcu\Ù_cµ\Õ\Õø\É][\ã‘T!½•¸ªŸ¢\Ö\Ê\éQW²|FYBmA:\îob\ä\Ù\Ú±\Êü1~öo\Ûó›ƒr²\ç.n\×\èrˆVÛ¶\Îu•\×\êü{+®\n\êWrfõs\ÉÖ\' °\ãk\"€º#ˆº¶ç¯\èº*÷øH!~\ÕG\Úİ‚j<\Í\îm\ÑkÕ£e‹{K,—c\"T\í²b¤›«»;|ù¬–K…\íVj³U›k[ue‚é®š\é¬\rºebBé•‰V!H\âÁ\Év\Ø\İZ\ê\Ê_\İ]]]¬¬Š±VYnÕ—û–6VV²·¦\Ê\Û?\íweQö7ºı·²¯oò\Òò\âŠ\Å»TjP¨P<iÍ¶\ì\íóğ¸\\|WWWY,Y:W\Ö\äù\0t|\Ã6H¬\ÖaI `l®/ŠºV*b™t\ÊÁb±X¬W¹\åD\Ù9\Än.œJ;\ĞPô;³¾\Öı³ş6÷_¶öUŒÉ‹4\ì\â¤}”?vMP8TÇ“\"’\ê3u\nw\â¦m£Ù¾~\n\ß1!‰ò§8Q}\Ï<U70Ç›Œj”÷f\à¯\Í\Ô²Æ ¬\ê.«—UfÕ”kØ½«V¦VŠ\Åb°X¬E\ä\ßA\ì\î\Ñ~)9`¯\Û{)Û˜\rs%<¯¹øñ…”y\'5\Øöt=\âGñn\Î\ß8®Q\Û\ÜU—;ò¬¬UŠ\å{•L–kjŒ€?\'‰zŒœë§€T²\Ùı~—Ù–¸…KYš¸ô\İ]fWU\ë¬õ\Ör\ê”×…\íA™\'2À\"šœ›\éwj\Â~Ñ±\îİ÷T~DS•ğQ¹ò,&\n1*ñ¦Os\à\î\ÄÛ»?°\è¢qW•\Æ\Ül\n¾öGW3Xqu º=\Ş\Å\\\Å[\ÓMù§ü5\Ó{”\Ô\î\Íô–\\SŒc_´SW\é\İ\ê•\Ñ)\É\í\ÉE}L@OT\àş¬²F\ÕL\î;n\Ï\ì\Z\à‹&•Ã—!^ë°º\î»+«ª‡\Û$d/\İ1\r†ä«¬šTH\Ì›½½M\ïAı7\Î\Ş\îMG³}#”\Ã\ËM\Ñ\îŠuL1\'\êTÁ²j™\éfºº%5[%BG9tš\ÈÚ£GÇ¥Ÿ\Ø7„\Ó\î ‚¹\ád¬¹i¸VB\åB©+-²¥Š\Ì\0\'€S¢‹)\ÔD\Ç\Ğ!qc›»{i\ã{üwM\îSS»7s\ÉYY>²œ/3€¨4“©OW$ªûu™\r€V]2¢aò›,jª\Ôp|z¼Š\n\Øfİ½ş~Tk„\ád7Ckd¬ƒö¾!\êI]3¤n*\Ü\0‰².¸\â\éµ\É\Ü\'ú\"˜1˜=¨\í§:Ó—,¸ıp6ı\ïuA_f÷)½\Ï`‚&\È\ÔDTÚˆR\ÎùM\ÖK2‹¨\Ó™+¦½dƒ\ÔoB\Ö§É‚­e¦Mu•5{\Ú^à¡¨ÿ\0\Ø2Á\àğ\×\'…•\×(È‚\0(v·»\Û9|ÏŠq\'‹˜\Ê~\ÓûiF\Ï\ï\ë=ÁQ;ş\×ï…\ÑWW ]p\0\ä.\ê\á\Æ6%\ç°A\Üj3J¿\È\r‹%º\Érré¼©ª„iU<\î\\S$P\Ô=ª\n–\ËóXÜ¢I7M}Óy)¤««\"»*“w=â±¢n¨]h¤«Àº°•\âBšgL†\Ïû½½¡u\á\ãk ,y(]Z\èZ\ÖF\ê\Ü#Û¹\î\n\Ï`ª\ä	d28ü\á\Ä&?\"	\ÄTY:¢G¦&ö—pš‚k“¼da<=@\Â\Z¯ÈŒe\Â\äpK‚\Ï\"J\êüTòb¹{¤v\ÔW-\Ä¾ÜŸNŒ£û^/!ô\Ù~†ô‡ı8\á][b¯cv\ì<X\r®nH{“gx]\\\åÁj\Ïi™\ìF\í\Ùû„\îNw\ZCşL\ns\Ûv‹ºø\\µœ}ª\×µE\ÃKNA\Èİ¦¤«\ØmD\Çs9.ee#\ZSE”¿“\Òû;*şœ®\é\ã\İ\Ê\'\Û\í¹‚\Óû\\.Qr»A@ªw.*¾±°\'8’ö`‚;\Ğí³¾\İ-\Ö\Ç{,£jºŒIC€\Óek§\0õö0=¨‹—œT\Æ\ç}*lC\ãj‘–%\ÈópMƒş\ïHO\ì‡eI‹iH%8”2\Ç.{¬AEË£eƒ\È\0l\Û\åŒõõ\İœQş\Ì\Ù3`‰Nô\Í\ßö\é½\âvMøŸ\ÊÁ¦N‰‰0\âœZ\ç[3°@«d:a2EuY	†Sc³OğÌ‰ÁÅ©\Å?¸\á9\Ş\×\ï»\Õ&\Í\ì#Å…€,İı\Ùµ7ª\ÊØ§;—XµõGU\ÉÖ’ÿ\0Ú·‚¯è²²7wı´lrb\á#WQ«6¬Ú²\n\ã\Ò\ÙnO$ºf=\ïjŠ\å¢\Èõ/p\ä\Óbû5JYŠV©\át*‘¹T=ZÈ”S“¶\î÷zBw\Ú{\Ôrn¹W6 ,J9_tlU†D9d¯ƒ	ºc\0V\ÚB\Z%”\É*?\Ú\Ù=VA]]]J}”œ5®÷O+¡q\å\î\\\ï\Æ\×W\Ä›¹®%\îh\\\çÈ²\ì\çw.+>\\C¤•¹6bjaG,n‰\Úhÿ\0P|n\á\ä\ç|!~œ7\\\Û÷ll\à5\Ü9\Å”‰¡\íK\"[no1–E|\\÷¶6\ÏPé¿¶ız›\É-¶\ÖôIÊŒ\â\Öp§P@lüš@,Šh°2FZ\êó,¬\Ñ!8¢\Ğ\Ö90t‡\ía,ph-—>\Ä=\ì¨.H£™”°º	“dº%<üaSSø‡‘ƒZòš\à\å#JfEwX®»Ã—\ë\îE\Æ\â\×7E\Ï\0g5\ïsÜö£·¨&H\n\ÇlV(„\ĞL£\Üe}•<x&:\ÄLŞ›ª˜\à\×L\ä\"”¯\Ä\Ö5»\Ü\"\æ„sp|\Î\r¬\àn$e‹‰hv]H£Q†J,OÁi	Ÿi–jüI\ßã¡“§=\îŸ\í‰¦\Îw÷#À·)Ü–\İ\â\ÎNw¸ºÁ§%\Å\Ü\Ù\Åö?Ú··®\Ø\Î\Ñ\íµ\ãkl±NŠ\ë\Ç\ß\Ç“Ša\æ7d\àğö7Œ\ìk|{Hñ\Î)\Ó\Ô9tjŸ\"25u\È#hS´\Ânc-Dñv(÷\â\ÙY]d™j4\Í+Á‹ø5\åù¯.^^¼±:‚\ËÁ¯‚À\å\Ë\ËĞ QĞ€ş›H\é\İ6<cf\Ç\ï>\Õ\Ó\É0p2\Â\Ü>6¹¢;7ŸòbŒ.šl9.Š\é\Ó]%‚\é.Š\é„#\0B—ƒN…(#Â…áš…+\n}6)”\Íxt-im\ÓNˆ§µx\à‚4m^¡\Ú\ã°d\×x–\Ë\Äâ—ŠO›\'¶k.º5ø¥ã¬™ªYG\\#LªŒ\ÖF\Æ53V\0I#£\Æ‘µ\Ó^Bs¯µ¹ğ·c\İ¬\n1®š±\"hU‚±27qLû¤g´DlZBººº¾ÿ\0å°§jğ­	Ô—.¤L¦q{¨PÑ†» \Ôaj’™¤x7^hY\rŞ0W(9@+\İ59\ÍY\â\Ş\ë¦\äÇ˜‹Œ¡+¯t\àœ,›\ß\îM\á\è\ìN\×Wô\Şÿ\0\ätyá½÷7k+++le±ê¬VVV\Ù\ï\Å2­\n¶§Ôº\íšV‘4¥fÀI*\ê=­¼/a\æ\n\ë–M\Ö²+$\Ş\å7»˜ş8)\Ñ4§S¢×µd®®›\ßk¬•\ÓU‡¡\ÈlY5©\Ñ(\àhO§m\ä0€\âÛºd\\\\Y]0Qö§ \á s±bBFy2\'¼e4‡#\Æ\ïV]Õ‘\îPE7»¾\àqšÆµ?³{;¿¢\êû:0S˜lw’fF›.n\à8cpğ{Sf\r`˜”&²3ñ\Õ\â÷9.mŒUO`eu\Ü\ÌdbŒr\ä\Ş\ïp¸\Ö*\å\ìbc“©‘ÁrH9§6\Ä6º%#¸E5ªZ\Ğ“¹\ç$J*8\îœCPŸ—œ\\Š¯±\È:\êV®\Äğ£–\Ë\Ú\ä\æûúd\rµ®\\\Ë!Ü‚\ç\Å*\ê\éı›\Ø÷“	\ï°uCŠs‹\ÈD\åbVtœºe`V*Ë²;]4ö~Y1‰ûfğA\ä!\"¹WVF4\èB1(\ìE_k\ì6šNœOyq¿¡Œ\Éqg0\'u\Úc’.Y+¦öÿ\0\î\Ì\İ\á\ßr	¥5ë‡¢\Û»§vº‚\"òÆµˆ•}¤\ìß´÷¹u\Ó6­—\ßu\Ûnn\ÔJ\rq-‚B™GÁ¥	Ô«Â¯¥†\É\Í>€Pq½<™\Ç‘~ †\ÅYb¬ƒˆBTÒ¸V\Û˜òg)’ ‰G\ÒZƒ‡I;¾ñl)³8#%ı«\Z\åú¿·$\×Y{¤]\'46§7 SŸ\Ã\Õ\×\ïvğÛ««\í\'aöŸ¸z\å\ì\ÄÍª\råµƒ.²X’i\è.J\Æ+\r¬ˆ\Şf5>\0¤§Nn\'z9Kf²t ¦8 ö¬‚¸D®û[`ò©Bp¤\Û]&LB‚¯±ô\Ö\Ö)\é»7“ú\"\ê\×DYwQS9\é”	´\r^\r«\Ã5IF\n4jH\Ìnº]{\0ò\äşû_Œ¸CòœP*D>\Ó÷[…\Æ6\rÚ«\ÛQÅ‡\rı\é\Ñ{†\ÖÜ¢‰N;ªb\Ù\áL?Ÿ\0ºat—Mb\å\ï)•\áC)qØ…Š²#{ Q*dC¶Áj6\ê\"‡ri±c\î\Ò\ßgdB—u;ƒU½U4\âF\Ê\Ã®®£qjq¹Ø¨¬S»£±ûß™\íş^³\ØöfÚ€şVr]\Âªm†\åQ	\ÍV\Úapµnÿ\0‚\è²>›«ªS\îGa±u„¯\ÍçŠ\î\Õ}\×_¼rTñó·Á_O›Sl‰ô\rVV²\îG.(/óyAH¿_\å\ë=fmWq@‹l=Ô¡U¶z;JSÍ¶\î†1>œyA\ïM\äbœ\ÔGª\ßÈŠ²²*¥øÄˆV¶\Ì\íû¦‡¨¤§-¥\Î\Æ\æ¦_\Òv²xU±t\æC\ĞJhºj<\"û¦ù~\Ï„8Rwı~ıg±\ì\Í\Ş:2¼…y§oQD„CSÂ‘ªam©Yy>\Z™k++\Z›PÒü“owz/wRşDJa\Ú\×U\Î÷«¢Šg\ÜV”\ß\ás.¼i\ZM¡YYY_\Òõ¨²\ìpQ\Ó8±\Í-;„\Î\Î@+¨;\îF\Òwış²Ù›\×1r\ãA	rh¶\Î\Í8\Ì^\ä\ÓtU\Ô\Îrğò¹1V²*H\îN©™ƒ>\Z\Õen.P•Á6¥\á6±Á~\Õ\Ñ*U\åY4\ì\Î\ÊM\Ê\ßOBùÀÿ\0EM]\Ã¤YYu\Zª\ê†M¦•Ë¡ \"Zˆ\ÌSµ\æ\ë+’AUŒ\Ê(˜_&C\Z«:4P\Ø7%uuO\ÛrŠ“\î=›\ß\ÓmŠwfn@!´ÿ\0\ËCZ‚=¤]K2pŒœ°\'<$­L\Òx#­o„ª¥`‹}…‹¦‹”\àZû8¨>\Ê2­°M	ü\ßw(˜_9şIq‚Âª}œ\éù5l¬œ\ÚÚ‰DQ\É4Ñ²\Åt¥js\0\\\Ø\Èò\Ô{\Ş\êÈ¶\ë\0önv\Ü\î\Íø\nfn\×O7g\Ëd÷T¹T\n¤*¥¾Röq´Ò¹\Ë\Ã\ÊS¨šA·ds1¬\ÅW;£{›=eU9\Ûr¯°	Ï¼h§”\Î#¥6VVX«ª“h÷%Bm[³ú\Ö\ërªBqpO!ÀFÛ¸UGŒt\ï\rˆÔ¸(ªz„~Q\ß~\Älğfö\í\Ù\ÆÈ¹\ï½İ›ğ9=7v*b\çF	Á9\å<¸®‹É†<ûTu4¹5÷F\"\ä\ÈZ\Õ!\ä\ÕYÌ”gøıeN\à\ÅÍ± ,vE¨‚Š\'–ı°Ÿl/\Ê>Pµj´«\ìT\Z‚1Lh°n\å#rC\ÉÏª\ãYq\Ò~r\é\ä¦oMş‡wWM“€‹\Ó~Û¢\äI)¬A©\ß{»5YOMİ©[h\Z‚w)\Í\Ø›Y9T(ß‹\Ç\"\É\ÊN\á7µHşjQüK.ğ\ßtª\êû7¹Eu½\ïÅ¬}–/¹¿Z‰\ç\ĞSŠ¦ˆ†Ašhö\ìU®»\')Dj 6r\æ)[4h\ËUÒ›\æ³Y¢ó»mv6\ÄöknU–+±pı\ï\ì\Õú¢S\Ş?º>\"b\n\É\ÊW\ÙR»¨S»NŸ¢©Ä¹<©\nLûj™i#³à¨–\Ò\\¾\ÊÁY\0šÛ–?$\ç¨\äaU6\î‡x\î\r,®{\nWş_AOZ-F(8e¹\Ù\ÅHû+˜\åhk%c”’\0¥8H,E˜¥÷n}\ryršl‡!9\íjuKB5.(ş\ì\Í\Ú\íŠs¬%©7\ë¹\n…¡À »/\ÓPWR»Š¹UK uLQ§\Ëv\Ô\Ígu\×sE7VT¥FyŒğ\ë\îğLÛ½³¤•Êºk\ì¹k$¦¬Œ&¹S?ù	@ª\Ãy\ÑÜ§­ú±\é*B¤vocx-\\°¼\È\â\ä;«\äø 7D(Š–W\"{Ğ§X1©ó!ù&6Q½\"\î#>ì‚º«}˜®®©ü—\â\'Ü¿°±»Ô¾Í½z\Ğ\Ğ\å#n§£À\à±!Q¼\Ç<\Ê^\íP#ˆD\Üúÿ\0OqÉ¶»ˆE\\mHÖ—;b‚½•Ê¹Tó:7µÙ´Qù‘E]œ´†\ã7¤©–Aa{‘\ëY\Ò\Ùuš\äy`§vRú\ì¢mœş\nÉ¡	L\nW\Ü\ÅWşI\Å\ÔmVVMü£{N\ç+m÷‚KcueGTIn\ÅW}šgõCA«bt\êj”jS%Bo4\í\â¸(S\Ï\Ã~$B\åX¢*\Å4¸òw²\0 Ö Ğ¨B›ò¬K—D®›B&0¡ŒH\æ»}\î‰EJTğD\r–5TÑ¸\ÖS€\ã×¨†+\'ğ§~\îw\n\Û¢~{Ğœl\ØşğQ?\È\ç&+úd„9:;,,ºWP³ùmÀm•\Ñ\á0 Š,—\áSÔ½\ÒR\ÖS¸g\Û)§\ËPÂš’PÓˆ[PT\ßp\î\Ş\×øduƒ”@bZ,÷óš\É0‹”v\n\ÍX8.œ\Î-‚EM8§ˆÖ¹I«§¹\0M6WTg\ÅJ“—E\Ãn\Å+c\ÔB\Ã15ƒ°{•L™»\Ô²<m[i>\ÖWù¹G\Û\ĞJ\ÈX»’Vj\×\Øö¤“(†\ÏU}\ã¦k© \ÅÌ– D2\ÓDÒ¢±\ì<T»‡º\åò\ÄC7 \Üz\äNji²sø-º\Å¦F\\Š*(]* SÄ€E\Ê\ê\ê\ê\ë$\\³PAG!ğ\ÊÙ™±Eò\Îˆ½9\×LOu…DŞ˜›“\åÜ¦P+$Jh\Ø}\ÎQvº¾\ÒKŠt¤’JÜ’¿PÉ‹ƒï¼¯³hf\é\Ô®Š{.øû=¬Nu“\äI%\ĞPá¯“„\ÅQ\'µŠ\Æ÷\Ú\ëõ1Y,—tIYr£—¢§tkCR\×\\l}\'`šP\Ú\İã•²5\ä\Å8]‚\ér\ïj©š\Ã\ÓM÷Õƒ“}1‹¼ ¬±V!’ß¹\Ê>\ÛK&(º\å½\ß\Ù1\Â\Ïu\Ğk“2j\ë‹unœnŸÂ¢Ÿ­öÇ8\"\éğ”aN§)‘60ù±R\É\Ôrsñ.!G&(;/Eö*g#}˜WL”\æ\Ûhš\nŠŸ\Ü=ˆ:\è§ö;\ÖQA7\Ñ\îğ\ÎÙ›tUìºˆÈº‹ªó\'\İ\Ç\ÓK÷U\Ä=0şB‡r\Û.\Ê\ê\á7¹)“\ä²{¯³J³œ„aBº%_fğûA3¢t6V ‚\ìSŠqSLü¶&\É\ÎÈ ®šò\Ô*…@M‘¥\r*H\Ö#91–¨\Ï¢º\Ï\î>\Ò\rÃ”œ9Y\Ø!¹L{¢u5P™¹\"S‚va{\Ñ!ªW¹¦\Ê\×G\ÑB\à$‘™Æ›½\Ôs\Í\ÓG¼&›:£t6oi]dMölD Ö·\Ö\Î\çsÃ©ªNø¥lA\å¨È\"t¡MP²¾\Å\ÖNvHz\î›!jdé¯ºsM±X€du\Ó\\±¸y\å¤\'‹¸…÷!\Æ\Ó\ì}g`šw(¦¹Ñº92nnFTj\Â5*\é\ã`¯pö[zsie}£h¹µ‘EO`M\ärË‰O\r\î\Şé½§M†\à5­ø[\Ûw¦ªy\İ¢²7$ö\İ>)S\à™:2İœû\"IA¿\ÈY]0‹øAœ9k7	®\È)¾\Öv>²Šz\n)to™¦\Í[`mÁO\èªh$sü5\Ó(\ãhğ¬S\Ò\Ù;º…œ\Ãx’Ë„ö\Ø\ãÏƒ!\r\Ä.´–Dü#¿ ®\ÅS\ÎbtdL\×\ä\Äú‹\'\Ô8§IurV(\0>znA\î7Q…R\Ë&»w\'»\×‰>Ø¾\Ã\ë!;vŸAVN6=şTQFùZÖ·rSÜª…Á“\íd\ä? V \É\Ëú\×F\'\Î\ß\ág©É§h\æ’S\êmx¨©¥´\Ò8PAPø®€M*~c\Ó\Óƒ\Ë`D|\ÈÜ¢™\Û\áRÏ³Š{“œªÿ\0q\åv]\äº>\Â/\Ùe—H*–µ¨÷øG©Ş‹\Ùr˜Í»£\ëöş \å!¼cyJr*\'(M¥r>²\à\Ø\ï)A¨pÿ\0EıACR\è‰uÓŠ‘\ÖR?7B\Ïm“\Í\Ó>÷wŒª§\î\ê\Â\äÊ±j‡‡“\ß\àıe1›±]¾\ß\Ö7üo³»Hv+±½Ÿú?½;»“Ï¢\êş¡·q‡TôÑ“‡”\ä\Ó\î‘FUG¹¡ymB:]JòÊ¤tº\Å\å•k\Ë*×–U¯,«^WX¼®±y]bòº\Ä\İ.­yeZòÊµ\å•k\Ë*×–U¯,«^WV¥V4ªĞ¼ª±yUbn•V¼²­\r.­y]bòº\Å\åu‹Ê«•V/*¬^UX¼®­.²\ÃJ¬^WV¼®­y]bòº\Å\åu‹Ê«•\Ö/,¬^WX¼®±y]b\Ze]“X¼\êJ*’¦Õ”4Êµ\å•h\éuˆ\éu… ª\ÇËªW—U/.ª^]T¼º©yuRò\ê¥\åµK\Ëj\Ñ\Ò\ë•\Ö/+¬^WX¼ºµ6¹\ËÊ«•V/*­CK¬^WX¼®±y]bòÊµ\å•k\Ëj×–Õ¯,«^[V¼¶­ymZnVhj“´ª\ç:=*°-«^YV¼²­7L«úuQM\Ó*\Ñ\Ój­\åuş#WQ\Ğd:ƒš\à\áÿ\0`‘\â6M)šE\äk¢\Ï\r®2ÿ\0ª—€ª58bR\êó9:¶¥Ë¯*mT\íQ\ê•\rO/ªñ>4&’”B6–Q\ZoU¯ŠF\Ê×¸1¢Y¢½I\'OgNKº\îfÍ’ò¦O4··ı›*ª¶\ÂÚš\ÙgõQA‘B\\E=L,™®E\ÍR\ÚÚt»Uw˜–\ÃL\Ğ\ØQ›\Ó\ÇıZ¥3ôE\íÿ\0Es±Uµb\È÷Hğ	PQ¾c“L¤‹§\Z­m<Q\Ì\Åe\İY3\æ<°\ÒU\ÔolŒR±\âN»\Ô1¹¦hú\ëH\Õ¤r¨iqM\êS§>Yƒ\Z\Â\çGR|Q´\Ü\Ñ	°ª¨\Ç#\İ#\ã%EC\Ô\rhcwšL*4ù#T´-cj\éB\èßƒ¨\êzN\ãş§!¹¯¨\ë\Ír:}/Y\ß€p©€)c1>ü\é³\\ÔÚµÅ”Ø¨\Ù\ÄL\ÇğÔ´:*\èÃ¢\Ê?şOÿ\Ä\0*\0\0\0\0\0 !01@AQ\"2Paq3pÿ\Ú\0?ÿ\0÷¯”ùO”ùO”ùO”ùO”ùO”Z–[ıŸ\èù?\áòŸ)òŸ(µ/•–_,²\Ë,¼Ye–Ye–Yeøâ­‰	Yñ1ÀœR\á,? ±_SOØ ER\ÃH\Õ\é\×¬? ±O\ê\é‘\\?‘È´\ä\Åüy\Ğ\ìªdtl\çFœm\ãj²Qı\é\Z«²ş¢dD»¹‰-Ä´šñ_-/X¬jA®ü\Ö{63c4µ61;\ïgıHÁ¬=Æœ­\á!ş‰*x²\Ë\Íğ²ñfŸ¬.Š5ŸT^,¾M†\ÓiF\Ò1ş\Æ\ÔmÆ¢¶iõQTk\ËğiN\Ñk’R±vE\Õ÷\çÑ—C¿Á\İ÷oòğQD\ãú;6±Á‡xcg\æÅ™J†¬‹¢\ìr$™£/\Ã\'*$\íù\á*b\Ù9×¬QEq\Ú:D\áa: \İ\çN_Œ7H”¯‚—\ïöFm\Z“\İ\ç¬FD¦ù>‚‰HU\Å:#+\';\å/ñ\åEb¼ñ5Ã¶F4L‚Ä‹\äŸ6úá§²¿·\ZÍ–Yx\r(©J™­§?\ë\É\åK¡É‰Wy—\Ş]ù\Z\átX•³QQøûW‹\Â\\\éUòxLxcú÷›\áŒ•û’>\é\rW)có„7¬\ÚÍ¯\Åg\Æ|d£^eˆ{\Êe\Z‘\ë“xX¢„…—\ïÂºÎ¢\ãX¯X‘\ÔCÔ¿BeššŠ«…VQE³s7³{7³{7³{,²\Ë,²\Ë,\Ün-–ø\ÑEŠ)QE\"¸\îe¾4R+\Í\\\ì\Ün/ı:B‹>1\é1ªğ&_–Ÿ×†“~ÊŒD42Q²¾œD°\â™(\×\Ô\ÒKØŠ¬62‰ÿ\0—\ÒJÈª\á/©	Q\Ùe>‰\êş¾’W\Ò\"«a“‹i´\Úm6›JeP¤\Ñh—bF¼¯¬Q_CEÿ\0b^òÄ¬˜—Mù\ï99‰M/X²\Ñ\ÑH\Úm6\r¦\ß3\Ş/\Ô/ªú2\à‘|h¢Š(¬_‹O\Öf\æ\"Cñ3ş£\Ùÿ\0¼\ì|’lª\Â\ÅWŠ4\ß\ã4±7\äª=şÍ¿¡ÿ\0\Ò],>JN>‰I\Ë\Ş\"QEŠòFe–>\Öó~\Z+ô\'f\ßĞû5aúğ\Äk^{6ø÷3{e¯È¥c“\Ãğ\Äk\ryW\Ê<\Z®Ğ¥d•”K\â1*Í´\"¬\ìcx¿%fğ‡\ìOŒzy÷†¿DdJ6Kß‚1²\ë‘\Ù¿ ü_“q¹Ñ½‰mö-D~|•#z-\ÜnE¡\ÈÜ¨²\Ë,²\Ñh´^l\Ø\Ùñ\È\ØÊ£~“¾³B\ë_\ZÄŠF\Û´£¼¬Y¸\è\Úm\ÍV(\Úm(OFt|¬sD¥~ş‹DK¢\Ë,R/—…Š\å\\œ¼qŠ\ÔlCˆ\á•\Ñd\æ\Ë/—‡•…Ù±›\ãÆ²üh¢\Ë\á5ÂŠ$Š\Â\Ëù\Ç,«\Ã\âük‹&¹2Š\à\Ä1ğE‹%\ï‹ñÁ_x]”%e1øeOƒ%--ÌœhÚ™ñ¡*+³Ó²_\ÈN5\Åø¢·:6\í\èöQ\è‰FÑ¢?\äMSğJN]¾2Îƒéšµ•\\\'e\æ¹\ßi¿\ìK·…\Ù\"%ˆd=’÷\ä¢^óDV+ôQXk)^kü\á«HÜ›¬\"G¦>lzCC\âó\ëŠc7…—‹?÷Š›ˆ;Xö:7ÁÈ±Œ]1jôjOs\ãhŞ†,6,QC¯\Ê,o‹\Ë\â®/±±\ãM÷„1EaœW¶6Ÿ®!mæ…˜J²™cd\å›\ì~:f¬·JÑ»„ex±1–Iò¢˜ã‰Œ‚¡w‹¸~G†V+Ä	\ÙE\\“#,±\Êğ¸¡\æ2¡\Ìr\áf\Æ=6\ÇŠ6Š\'¢‡\áN…;%!¿\ãN¨\Ô]\á\Åaø¢2Oô!‘$Xş²uè”¯›B\æ\nV‰<6E\ílFÒŠ6›M¦ÒŠ(¬QF\Ói´\Ú.¸Q_^Z\îú4õ7ÿ\0¬J\Å†“56\İÒ´È¤—_\êâ¬„\"r†—K¶KRL…nş\Çò4ôw@ƒ‹[X\Ó\Òuøÿ\0V‘ªş\r:^\ß#ÿ\0¬)š2µ_kÿ\Ä\0*\0\0\0\0\0\0\0 !01A@Q2P\"apqrÿ\Ú\0?ÿ\0\Ï_ñññññ\á_e/ÙªıŸıŸññ§Y]ñeŠÿ\0R¤7\Å\"wÃ¨Ç…\ëğ¯ñ:†\ït½_	<%øğ\ï‡Sú—Ã¢\Ç4š#\ê¢\ìs¬¿À“¬X˜¿­…›\î<·\Û°§\â®R\Å\â/\ë\ÃEQEÑº\'\r\Õ=/\ìO¹¢4‰ªK	ù¨–lé¢¹\î|‡\Ènn|ƒŸcbñÈŸw…’û:‘§šµ\Â·k¸³\Óõ\à²\Ä\ËE–7„$}Pğ„¬N‡Ü¢ˆ\ÉEö°•‰WJ\Ê\Äa~$„FŠl]1*\Ì\ÑBBUÁ¬G\Ğ\ãdc\\«\ÆĞ£\âLYr\Ã\ä\Ñ\\¡ı¿>’,‰,D¯*]ø;ú\ãy¬V_	vD$ß¿BI•şŒO¿Ê¬W;,¿B\ÂüŠ\Ípo;!ÎÙ¹¸”W¬1,l‹Eø›£sr.ü\Ïô!\â\Ë!.\åølLly^¼/0\ã~&†j\ÍMh¢ˆ\Ã\ï…‹\Å#TjQH¤PŠ+ŠÎ¦¦¥\"¸\ØÙ³6b“fÌ¶lÍ™l²\Ë/6Ye–\Ëe²\Ë/›\áµp\îY±Ø¢Š\æ‡ÆŠ(¢¹\ÑEfŠ5a£\Ö\Z,\ÜRG±¢†V±EqC\à³y¯–lY\ïŒú”\ÊF¥a3kà¯Š2ğ¤\'š+›(¢‡›6¢rf¢\Ë\Âôjz\Ïqx²³\Z-W‹e\æ\Ñ%xE–K¹—\ì¬$QC±&4_\'–>1‹h›D\Ú&\È\Ø\Ø\ìv;lj„1Í±eE–†¼—$?—›,²6ı\é~\Å±8\áFñ¯\èr¯f\è\Üùùò¡uò.+(|ÈÁx¼YeŸ\Ç_bx²n\Ê\á$Ÿ±û\á\Ü\ï\ÜR\Ê\Ã\ÍC\ÂğI}—ö\Ò\îığ„*$sX®UR(¬w6e²óBY¢±5Á‰…\áqqv\Òôm^\Í>\âôt\ãn†\È{\Í\å«¬u£\Ş\ÍJ\Z(÷\Åxr»•K5\âp§hN\ÍkÑµ«±²\Êc¾}_CBe\Ä\Å\Üî¯\ÃF¨KÈZûD\'°\ãgK\Ö#\ì®OOYY¬\Ç\ÊøµË¦ûW	Æ»¢3LN‹:h~	²¿e~…ÿ\0x\î2\Ó\ÂUøK\Ğ\ÕYe>Î¸¾Ÿ{D&ş\Ä\Èz.£ıŠ\Â\î1Jı‰y\×¬kƒ‡qj\ÍZ\Ã\é9wDzsû>«-\×¤[}MMJe3CV(J¼WŠe›\"\ÑeHR_e£dl‰Sğ6QX\İ¡L}İ››\"\Ö(˜y;6f\Ì\Ù\á2\Ël\ĞôXÕš\Zˆ\ã\àPoğc#ªE¹F†ƒO2-1\á±2\ØI.\ÍÀ®…x\ì²Íó.\äP©bŠ\Å\"‘®^ ©e\á²\Ë\ÊÌ³ül¢†‡ˆf\Ë6!.øhk,N\Ê(^¸¾…—ˆ~CDyG±±|R\ÄW~\à‹Ye]¹\×‡\ØR¬6/w\Æ.U™¸İ–Yxø\İ\Ş%ˆúğ1f‹&Y\ïĞ¼	WfB\ãXˆ»e»\Âô7•Áˆy}„MÌ½‡\×;\Är\Å\Í{,¾-£l\"\Ë±2]\ÙTH£\èGµ\Ç\èR,\\£\ëÁy‡¼>5Éº7‰{Ç¦l2Š¥®/\Ön:³F!–!\â\Å\ï„U,1eap²]\Ä\"Æ°\Ê¡rea	U\ÎK)f+‚\Ê\äÄ8<¼Y‡\Ãb\Å.\â:hL—‚QÅ–%|V,¼¢¹<^R\ä\ãc…\Z\Ã\âÅ–…U\ÆÍ…+,\ÛGÀ\Ê\ÂExu$¨$_\à5E‘}\Éd\nd}q\\’ñµeVój\É\"+,¢±e\æ\Ë,¼ß—\äfÅ››Ye–llll>ø¬\ß\ã¨v%\Zÿ\03©\ÖQuöG¥Ô—yºJ+\Èë¸ºü\äO©\ÚH\åÿ\0#¬\ãÿ\0ûgC ºJß±È¼K§}	\Çúzd£\å7J\Ï\áG\ä“\ëHnøõcj\Ñ\Ğ\êo&»şWÿ\Ä\0C\0\0\0\0!1 \"023AQa@q‘¡¢#Br±PRb’‚Á\Ñ\á`4Sñps“ğò²ÿ\Ú\0\0\0?ÿ\0„\ÄG/È™v #1P\×q….\Ãh\ì\ï\Ò¾;+š\ëXÁ\Ü\Öwñ]e›ƒ›\Ä*¿ø \Ğ_ûPm©tHŒ‚\Öpş”f\à\æòEqs…CB\Ãfü\ï\Òd‹\Ş\àÖ\åB/<ğ¬VO	­µ&\'€A\Í1i¡G£´»¬Šp»¨k8Â’»\r£³¸„?\çJü8‹ş¡fü\ï\Òjƒ­ca ›h\ÍWQ~—u‘ˆ2Ôº$FAUÿ\0\Åu–q\ÃN\ì8œ\ï¤/„ø\×\á‰wY(š\ÛRb\îUÿ\0\Å>İ„\àdc$[f\ãˆNaKC§:\Ê0o¡ÿ\0…–™\Ü“[jL]À-g\ÉÁ\Í\ä‹I|G\íUñ¹®µŒÀ*¿ø§\"sk‹‹œ+„,6o\Îı&I\Ön.\Ä\Ó%Wÿ\0-,ã„®¥\Ö\ÆË¬\à\Ø\É4Ø’\àù\â;\ÓM¬s©\0›ifbÒ¿c\Öw\\Ş¶9Ô€Z\Ïş+“ÃšGiwX	àº»B\ì\\‚«ÿ\0ŠüTOWÜ‹¬*›Ö“H--#„˜Ik;ø¬VO¹\Ä\07•\0\\\î`/„øñôö¿Aû‹ñ¬d\Şõc\ÒÄ¢\érLµpV§¥Ù—·ˆL´±0xŸVn±ú“hIdK±.ß—Sÿ\0\"\ØI5–L\Ï\İUgô\'œ\ÆJ¡\ë¤H4\ï\ÆY9ÿ\0Ø®»£;8\rN	½¦BÄ¬&\ÏıD\Í\0\×ñj±úQ\è}\"B2\â­>·ÿ\0t÷ü\ÆM\ïV],J.’e¨ù‚´=.Ì½¸ŒBe¥‰ƒ\Äú³¾\æX´\Ã²k­™\î\ågm\Ñ\É\ru\'Bº5¯\ê1ôVJ[>ÁYÆXû•©\è\ä\ßÃ¶n\Î\n\Ø3X°Á8t«\"\è\ĞğOµ\è¯\Åj[>ÁXı(E“\î*\Üôa71\Ç\Ñ7¤3\åt`õlla÷V\ßRµ\Í¿½3ğ\Æ¤.MpMp6UV\Ãå‚´üPœ\ÓX\Ög8ÀH\İcõ&u­øÎ‘V–	°\Å(§—d]»¹nŒ\èº\Z¿¥[[/‰\è\â5V\İs1a„&y¡gd0´nV½]\Z\Óş\ê¶mV\å;iYZ@÷sC\êo\Ú\îı_\Ùü\rÍ™Æ­@\ÔÁıÕ§\Öÿ\0\î†=LØ­OG\'‹3<\Âe¸†Gš\èÖŒ1kV_Xûf÷\ÙE\ÎŠ]W½©´†#\ÍhÎ±û\Êc\ìI\ÃQşpß¦´}©€-\"œ\Ğhy‰\Í)\Îx~\åuEÀÙ—´\è\Îİœ?ºs:E–h“^Bo\à\\\ãşn±ú•©·†!`Nmú“½?ñš°•²k\ìŒ-7k+?¡F¿wÊ‹˜Ã‡_½\Ä\Ù`;\Ç\ÉYˆ\ç9˜\Ä	õM\ém¡0±9Å®ı0AÁ°`ôj±úW_f>#k\Ì&“2b¬ú-œğı\Êê‹³.%iÑ»8t\ë>‘eš$Bo\àœ\ãşT\Ó-›>®½Ë©´µ66¡¸C\á,‹\âÆ™c\Õm³ˆM³¶qk™Ê¨Z°8±xg\Zuc\îWÿ\0´?cf\ÜĞjú5b\é}U¦ÿ\0ş„&\Îs<ú\Ùö\n\Ç\éB5şµn:)øl³p\ßÃš\éO£Š\é8 m\Ó\É[}JÑfN‘Aö6¤RP\n\Ç\éM¶kñ·\æ•\ê›|ı\ê\Óñ{9ñ¯‚k\Ø`æ˜{¬~¤Î»i\íj«AÑc3\"\âl°;ş˜\ès™¼·«o ®“ı?\İ>9ù­]oG8ù«7\ÛT\Ì\Ãx]\Åtw7j\Ë&Ãœ¨¬qF!Ğ\İú¿²m»Œ|\Â_\r°´\Z\ê\Ó\ë÷C¦n.\åÿ\0\í<Ø˜\Ù\È0fÿ\0\Ö`x#ciòeõ±Vvoq\Ä\ÑH C`Á\è\ÔÎ’\ÚC	\ä‡\\\â\Ç\ïLm“N\ZòƒE›c\î(9¶3#8®½¶ŒM\İ{l\ái\Æ%b´²¸‰,L³\Î\âgp\Ì\Ä&š\Æ5¢í‡¸ EŒ\Ç\î(:\Ú\Ï©Ei¨DØ³kœV\'Y@ş\Ù(\ÙYÁ\Üw¢×´9§qQÀG,K\r“G$\rµ\")3w\\\Ë8ZqŠ\ë\Ûgñ+›ºö\Ù\Â\Ò1ŒJ\Åid1qX™gÄ˜ß‹«\Âi‚Á\Õx\ïX@\à£\Õ\á\î*L\rX\í¬ñ:©[qX,›…µ­\Ñê°Ÿ\Ú`¡bÀ\Ø\Õ~ \ÙüX\Æ1(k<DRel=\Å>ÉŒƒ¬\"ˆ±fk4\æ<E®(‹a³EöL\Â\ãY›¶³\ÄE&Qc„ZD ‹¬Y„š\çI±™ı\Ål=\Æ\à-™ˆ\nMl=\Å;©fUš\Äl l”l¬\àx¢\ÓC\"Ô³*\Í¹˜°\Òe´A @&õ\ÌÅ†“L³}œZ\ÍY™&±²kD\ëú¿‹\Æ77®f,4šÁ\ØB•Mb»l\áhbcº\Ë[<NúŠ\Ø{Šü>…úbV&\ámj¶³\ÄG8!gj\ÌM„V\Ã\ÜV&JD¬\â¡dÀ\Ş\Ü]gfm¸\0£Ò°\â\İ\Ç\Çóøtk7>\Ñ\ÛÀ¢ˆ\Ã\Ö~\Ş\Ì\î\Öõl-2’gWmğ\ã2?\Â›GÓ’\ë­maŠcvÄºÏ„wrVNi‘wö_†µ?A?eb\"u™uŒÌG´u&\ÒQ-\'«lšº?ş\Û~Ë©³Œ,\Æ\î+9\ÖrğVl³8z\ÈÄ„\Û{v¹\äFGû¦wb´\ßp²iÎ´û\'ôkH\çR<U¿\ĞV{¾\ä\îHtk7sy\n\Ò\'\çBÍ§:\Ó\ì\Ñ\í#ŸHñVÿ\0AN{m°À\ÂiÖ¸ÁpFSV;Š³úBxû¡j-ğƒ¹uµ„¬¶\ÄÀ\Z&B\Û\à\ïş\×~&\Î1n²6¯1µfl8”z]©&y¼\ÏŸd\×@¹\ĞôMµÒŒ3J\è\Ö\Ô.t\à¬>”L1·\ì˜}\Êu£m\Â#\"S\ÙjqP¬\0\çZKÁHüA¿Š´µh’}¡\é;\ê-\í\"Áª#º¶º°„mYm5\Â\â‹-6¬õVöM´Ã\ïºÿ\0©©­\à1®d\Õ\×ZZ\æšbA½gÁß¼øn`ï˜Š÷,fÕ½gW\á:LLğˆ\Ôf‡\Ãrh\Û`pˆÈ”öZœE”+\09Ö’ğF\Â\Ò?o\â­,Áp„QsºS@(6\ÍÄ†˜—rB\Î\Ëh\íü\ëm-`\ã<\ã5\Ôt’Mø\î\æ„ò¿hsÛªx…˜cn\Æ÷YZ†\Úü\ÍM|ZwF «_•\ÌL{ ¬¬\Ä\Ü\Ø\ÅtVº¢\0ù+—c¬Ÿº\èÖ\Ö\ÄÀ|\î±ú—G\éCYŒGh\âK•©ùl›öO·´gX\çsR•¦l8pMm³ğæ»š6\ÖV±kjZ`Q\ë5\Øa7u„c³a€B&Í˜ k½ZZ6³Šµ-—9Q[ô«A<9‘û«O­cp\Åf\Ãqt›6unß½ZZ6³Šs¬íº°ü»\×G\î*\Ï\é	ı\ã\î›ign\ZÓº%Zu¶¸ñBV\èö\Ísy¦²\Ñø›\Â1\\A˜+ğ æ—\àSXÁ´@\\÷Y\ÚK\É;K2\Z8ˆaf\'\ÓõV04CóÚ¬\áÿ\0l}\Ê\ê\í\É`\í„V<AÎµœGgfpÃŠoH³gV\á\r\ë‡Vö\Íuİ®n\ïü¯\Â[’\ê‰\Ô¬ş¶d\ç¼Á¡Z<j†«{;7\àv7O\Å1Ç¤M\Ö.\Ü	\n\Ë\Ê\Ü%ux†8F¦®0TEz©\ç´G¹Y\Ãş\Øû•\ÕÛ’Àÿ\0\Û¬xƒ¬\åÁD\çYÙœ0\â›\Ò,\ÙÕ¸Cze¨£„P\è\ZlšÀ\Úü\Î\â˜ó6–„\Ãº‰Œ³\ÎsFŞº0\ác\Ó,%š\Ò\èn<U•©.p\ìfÛ£\ÛÁ\Ä\Ç8ÿ\0t\Ò\í±Ì’º§‰n\äQn0Ÿ\ÜZ…¯Hp{„\à(˜\Ë2\ĞC£œ¬\ìŸZ `™md\æ ğ\è\Z\Ü\ÆÙ–Œ\'\æVVn„X\Ğ˜³-c¬¬:;f0&°L²€$	i±À\×	«>²\Ò\ÌµJ\ê\ÏH_f«i‰©<S\Ûd@y§›\\{¸pN³CªÒ­z+\Ü\ÂLp@§2Ğ´’\è\æ«K&ÀM[YYõ\Õ1O6¸÷p\àfC·jÛ¢½\Ögp@¨2İ\îyAı*\Ø;ºqV]Y`\Ãe·gó(ôg=¦Ğº1‰‚ƒzC\Z8•\Ş\Ü=¸aD£iÑ­\ày˜4-:]®8nŒcx\éA\ÌÁˆFwş+0bŒ#;dúE•³pŸ\ÜB\ëmiº	–¬sZ\Ğ3Š,£„\Úy«KvF_fE=\Ö\Ø\çR	ö@\0M5i\Ñm\Ş0º……£¤fòqj6¶¯´\åº\ãmfû6\Ò&+\ãtò\å‚\Ìw*\Ö\Ö\Î\ÖÍ¸œH\Î1_õCÿ\0‘É \Ô\ë;A”OG·\ï\ÂP··µ‹\ÄóJ8mº±nŞ¯\ë0X\É\ÇkÇ‚e«ÀÖ´\â‹(\á6j\Ò\Ç‘—Ã™‘Ou®9\ÒO²\0hy«nŒ_gjOŠ‹-¬\Úy8¦“\ÒDÿ\0¸\åò\"\à‹l­\ÆÁ\Ä!kj\ìv‚œ³e£u“lŸ›„¦Ú±\Ì\êš\èÀ\×ÿ\0Z&Vnr\ÔRhZ¡g]-$²\"Uf·ù-`¤A\í™\í8?W˜ö»¸şV\\«\çt®Ş¦\"µa¦\ÍjÃ»µƒ\Å`\Æw\"ß˜,6 ‘\Çz {s(Ã¸)-ñºK9H©MN¢\ã\ÃM\İ\ÎŠ\Ä#7J\ìÒƒNa<T&—Ì¨¦$ /‚‹jƒ7¬:(ûû{lÁ\Â¼®`A+¤”\Öõ\Õòü–Ïº\êeµú,\ãH™ÜµU`Txv\éh\0<\èQ\Ã+¤µJ…\á\ÍÜ€\';òV\ä\×\"º¬\ã¥%½QH)Wx\íÍ—rŠ\à„\î\ä\n0»	$8M§òQ‘5P³MÓ¢€„P*±\îP\r*T-oE­\è±\Z¢±\å5Dv2\Ø\ÌWFO4/ƒjal\ÈÅ§Š‚¤…gù)&™:G\n\n{– NeØoqwË¹\Ùv;\âœ”ª˜\î#±Zµ\ÆùV¸PkĞ¹†„\'Y»\å5R[\Ş1@q»9ğ\ä\Ğ!Zü\Ğü–JzG<‰˜w\î‚119‘\n.Q‡5gØ­~«™ß¢\'ˆ\n@“\ÉI–c½\È\0xE5Â«>\Ò\Ğòl–k\í\É\Æ+Š\ÄÁ(;ˆüª;Ê›`¹\Ê.tøE\rı\Ëz“}œ|E€ı\Êj@¬?¤\äT*…PªUUUBªªªªªª´?¸\İg\Ì\è­bhò [«\ê \İ\È\"\Ø@\ßûHM»uVõEE\Ã,FI¤­E„Œ\ë‰QuTp\Åj‚¤\Óæµ”Cšš\ÓP7\'4º14Xpø\ä÷§FTAˆ¿\â…oªŞ«v©Z¥BTr\Õ>H˜>j@\á2TZªP]e\ÅV\ïö­9˜\İ½5¤Q\0\Æ\â)¶’\Å\Êù©QQQQQQQQQS*ª·\×E<¢\Ê\ÂT\æ¥i\æ‹\í3»&\"N\âqš‘SQò¸rÉ‰1X7¬Vgu-9\îA¼j°¹²Z­P\ÂÕ»#yº¥q[\Õ#Ş¨B¡_\íMUoQ07P®\n¡T\İsJø`Ä£­œJD±ñ\Ş\ŞÁUU]<w_hªœ¡\æ„²	\È\åud¤ \"¦z8):òGsx.Y.w%„\ç5WÀ¬P\Í>ŠŠ‹}ôT[®ÿ\0J‘T†DÁ\È\ãuT\ÔÀT\ÈZH<\Öx{¹9\è\Ñ[‘¹€\ï¯rÃ;Â‹[®Ü¥?·_/[ø\än\\2d2#ˆ\'7q\ÊtÀV…\Ë¹.ja^7\ÅBh‘\ã…UE¾*y=[h\Û\àV©T¿uÛ–\ë·*\İU¼øª]Kª«~\ë·\ßûJ‚¢×‚¬TŠ\â\î¹Õº*l\nq6¹…X\ßE«Kõ²¡}Tq*€µ\ÔD|\Õ,B³ Ğ \Æ\Â\ç·\Äej\İ¢3%›hxY\Ì0\â/\Í0U‰SSŞ |\" /\Â5Ï¥Ğ¿‚™>jN_)_\î\íoE[¤ª¸\İU[µ•n¢\áu¤·ª©\Â²Í óQY\ÊJ4qXl\æx¨“;NtŞ¸…õX]ş”ò`+Yo+PªÁIS\ÕnóºEl‡z‚\Íh\"\Ğ|µ\îÉ¢\ÅiOÒ 2³›>!F\Ì\âp…ó¢Áe«¼©-h¸nQ5\Üq©\ÉÖº\\.œB‘P)·\ÑnòUŠ S‚ª\Ö\n¡Ty-\Ë\\*­eUSv\à¡g\Ígº\\.k· \Ñ¡‹\ËAA\ÜU\ÕhğUyğD\î\áóE\Õ\ÊZ«UnQt ƒ\Ãk¡Á\å‘E-	$O\Ñ+•ø˜Xt2(ªB\×\nn[\Öõ½A¶ªqŠª U\neT­\ê§\ÉUnº—r—ÿ\0Ê†j˜r¡/;”$\ÑÀd9…\ìuQ0\æ \ß\Ç@\Ù\Æ™\Ì/˜ø*ùª\İA‘\\bµŠœ\n›P‚\Öj¡T.[4<\Å/•ıúw¨pÉ•\Ç#pZ\åUM\Ëw•û—\éñZñ\ïUZŞŠªjP[\îRªL—zœ\Z³\\<–±Ny\ì\ïˆQh\'Œ\ÖpJ\nDª‡-X÷*9Q¹\Ö\é\ÕZWqTRª\Z,b›\î\çt”Mt©P(\é*ªª«·­\Ëw’\İ\à¸):\ïğ§\ÇÁJJ¡L5o\n«ü#8\ËC[\ÊóSÈ©ª•™Z°_2ƒ!©f\Ê °\îC•Á“w¨_ˆ\ïÈˆª\æ\Z\Ë\é:\Şxnºt\Ñ\â\âXj3\È)ªª Z!\à¢’˜!f•7z­q\â¾_\0¹-şD?\Õk\İ1u;\ÔA‡(,\ï0¶¤\'BrA#r¥\Ã\"MÊ™\Î[Ô‹‚ùŠ\Õ#½o96(¸\İ\0¡y¸”È«G\r\î\ÒKJx£–D\Ü|\Önr‡‚™U*d)ATª¨š|”\è©-\êP;¬SkVk¼.˜P\Z\Ç$†’[S½‰¹±:\ndV\0Èªù©9L¯š\ér\\21Ta\\‡ƒEJ\rá£†¼£{†\ã1£\Îo¢¢\ÜqZÊóQñR>ªnTõ[\Õb¨B\Ör’Ş¥%15ÀªµH¢c$^|4õRTº¹O5\"¿¢\Úz-gy (1¿2ƒ\ÓX­¸dûı\"=½\êAV\æ?\Ã(\äšõş/“b·ø*•´‚\×Y\Î[Š\Ş·š\Ö>Jo+X¨T„T\ì\Ô\Öjê„·»F2%‘Kª¤\å6Ç¹Cq‘¾°Sp¿ñXü”\Ôwd‘q¶5t‡gnAH¢8h©\')ª*·*z,\Ù*5\ËW\n\ÖZ\Ë_\ÕnóZ¾ª`\ß5TóF\n:\Zª¬\ĞOpZ§/\æUôT¸¯Ò¾\ÅgCdT¾\ëü*Bø\"\İ\à\ä@\ÑHŒWµ©A£p\ì\ã&\Ğ~\í²—\ÙT-eşT°\İRy\0¨#êµ—ú¿6\Ğ-f©ú-Tc!\ÉE\Ä÷F\í]Š‰\îŒ$r¸\İ0R‘\á¹%EYğŠ­ı\è\ât ˆ\á”m>hÃ¶¹CCòy­hª9P©¶\ê*ú]/EP|Td¦n“ıúS>anòUôNµ\Õ\Ê\"Í…\ÊC{Ü¥\İ\ÅFû\ÛÁl]à³¬<\0¢\Õ\ÍF\ê)ª-RªB\Ö7M4ó»qQ\Ã5\ãúP \Ürb~s\Ñ\á’\ÛQºGE5½R*¸T}NE\"¨¤\Ğc\ê¤DTÇ‘Z\îŠ˜+Š A¢uÑ¾2`æ¶–j6®\Å\È)¨\â8…½FŠ¡H\Åg6|D‘u™\Æ\ÏP£tn“•\Ût¤ et“k]2.‡¦ˆ¨Q‚‚€¼\r\åğ\í¤\ÂKXd={DGûPLŸ+§5! «æ £…K#xR#\ÉL‚¨¨£C!±Éªƒ† £e3Ê‹\ã¶\ÍĞ¦ \îh¥Bª•ôSRS»ˆMj’\ÎzŒTJozˆRS$#f57\è¬\áºjp+UoU>K\æòX›N\Æ\Îc$˜Rz-\åN\Åky…8-\Ê\å\n·UN«qZ¥p\\r7\'\Ëw%5ñ\Ä¯™\Ç÷ w\Òù\åÁ­š¬OR|.Š\ä›8\İù \æÙ—7\ì£\æ¤\æ‡¿\Ã&rñ\ìPV.\à\èd‘\ÅCCó(ÂŠDB±Uó»U«P«¬¥h¼\Ô\ÍÛ•U\Æ\Êo/¾D©b)\Ù\íƒ\åv\å;o µ‰\ï\È\ï\Ğş–ñXY¬¶Š¥D˜(FI­¯“‹y„\è\Ûb…^`¡2T‚‹²ŠıŒ@\ïß’ôtLb4a}›±|¨A\â|U\Åô\nmY®‚œ\ÒÂ·)€V¬</Ş¤T\×‘X,\×(5jz©Dt\Í\Ó*š‹ƒ†jÌ„\ÄóHC6*X;‰REL-Ÿ©Xº¹÷•©\ê¶~¥l}\ÅN\Ë\ÜV\Äù•²õ*LeI¥@6½S\ÕC«h\æO½I«UA²\nª«YUUW\ÑW\ÑUUUUUUUULE	)\"Ç¶ óYŒ‡‰TTTZª/²‰\ï+c\î+c\î+c\î+c\î+c\î+c\î+c\î+c\î(®³ªŸª\ÕõZ«Ujú­Uªµ}V\Ï\ÕJ\Íj­Uªµ\ÔõZ¾«S\Õjz­OUª Y¶^¥l½J\Ù{Š\Ù{Š\Ù{Š\Ù{Š\ê+c\î+SÔ­Ÿª\Ôõ*vQş¢¶>\â¶>\â¶^\â¶^\â¶^\â¶^\â¶^\â¶^\â£\Õz•³õ+g\êV\ÏÔ­Ÿ©ZªŠcjª½šJH)?,£\Ù<<¬TÂ‘Šªg,¡ÜŠeUUUI\ÊG¶S²\È-Ã½OM).+VjL)3Q\ĞCz¬n­ò7VD~Y‰\ÔPn°ª\ÍÈŸˆ\\d%PŠ“‡\åXĞŒ{”šz›£Ü·ù­şk4ù¨\Z\ée“\Ä(o\Ñı~šŸ<Š~IT\Z\ÆÇ™Y\ÎSt\Ì|ñš\å#t\rr%\Ú\ßq\Ê<²&¨©u2ü2Ge®’Wsà¡‹ä¥‘0¦{Ò¨Q…\ÑÉ¦Iº\n\ZG\Ür9i‰\à¼{}r`¹^\\NµÀH•6İªJ¢r¹ÃšFõš©i\Ïu\Ç,·\ËFZ 7¹Cò­\êW8ğ\\\Z\0‹”Ô–°òZÁ\ŞHœ…Ó¹Ç}€w]\á–\Â+E;õ†_r\Äw\ç»Ã´OK\ÉC…\Ì(/°\İˆ<˜]5\\Šö\Ü2\Ùİ“œ‰3qş\Í]\áu.„ò*¢ş\ëğU»\Ô\Ä\rñUŠ‰¸.SB2O=;\înP\âVqŒ)uk\n\Ô+8h\Ç`¢¦ŠwK$]EP{\×1y€c»ÑGlG5 \ã!\Â\é\å‘.\Î\Şû‡~SG$FL\á|Öª˜Rqñ¹ñ\Ü{-/ªÖºªº¬<Aw®D	•õÊ˜È¥\Ñ*+vU49Ve<\é\n´ò\í\ÔËª–õ:Qš,&dSš\åtî‹¼–(©\Â\ĞÔ°ê»Z¦ú_K·\åKLPG+¸\åg)\\\ã\Zd?¹Gõ\"ñ‚\æŠ\'’‚e\Ü\Åaõ\nG\Â\ï\Ò7•ˆb0Rt¹j…ª·ª­e¬ûT[òw-ÊƒF\Ş\ärˆPpÊ•\Ğ\ÄNC÷\ÉÇ¬µ•e}A[®¢¦M\Û\Ék½qQ¿\á÷w­X­P4m+\ÇAU[·y-P¦.‘Qˆ†¹&ÿ\0ˆ•˜¸ p\Õa´J—g\çw%Áq¾·S&*}n\Å\Îò fB\êÇ’\Ï\é\Ó\×ET\É7´òÈ‚8µqE²\Ê\à³\Ìa\Ú\0QF2R»€S\\”Ç’”\Öñ~n±¢\çsx\İ02œQ¢l\ãÚ¹\ä\çZ¶+\\Ÿ\é_\ÏùwBY8‚ª„@\\\ï‰\ìò\ÕQQ@‚¤¥E\Î\è).*J.BEÒº·x…< D\'\ÍLd=¾7\ï¾=‡ó´&¤|Z\Ã\æ¥f\ß³.™<ò©\ë+6‚õ\ÆE\áw\Ø\ç5U\ÅD]\ÍN=\Â\î7IgÍ£õB€\\\Ğ%\Ñ%L­Ê¡†QEM˜Oz ‡R\"B\áw<˜]º÷h1‰(1¾%EÎŠ\"ø¬#Y7\Îü\İÄ¬\æ5Ã‘Rt;û\Ñ\â©pÃ‘E\ãE5„y,\r¡©\àƒ|\Ór\Îÿ\0\rpÜ¹*]¡¾\ÉsUŞ !÷º™&\áf;Îš!s\Ê\ÂÉ¿\ì¢k—\'(;M\ÉbŒ¡E‰\nQUD(*©\Òş*FAI@m¢6\İwŠ‡U\ê[?U³õB2vš\Ì\×5JQB0â‚—ª\r\"%@qRPDQoŠ®QX·š\"\çöoEÛ‚¤T#„r\ÑÈ‰qX‡“;\îª.õƒ\æ¿\ÒPPŠ‚$]„P\\ñ¸ \\µ|”†A\Z;9	#()‚¥ »\ÕO\Õx£I•ÁH,\æÁ~T\ï(\0f\ÑùDq\ÒCvõX #ˆpUSšy\îR’\ãÜ‚\ßâ£‰MK~\ë /qŠ\â o¥\ÎÑ·”n”†ô\Ö\á\'‰G’õ\ÉVHô®je¹wN*kÂ‚÷0\Ğ\ÍP£gdY¼şŸÈ†¨¹\Ñ‘ ;”\Â3*N!\nÎª{‚‹¦J†óq\î\Éu“µj¢FIÑ²$\ä\0l¡ı”Â­\Ğ\Ä\"%†[\Ö#.\\Q\ä¾a\â„ùh‰J¨~›Øƒ´xò\ì£LI\\Æ„gW%™\noXœD[„\Å\ëG+\0°ºNR„T\Ä\Ê;\Ü(¸\ïSª\Ê\ê^[˜Arº¨i™f\èJ\ï´\îQ0‚„V\îJp*G9Ê†óG3Q\Ã\á&\Ë\Éaœ9_fV(BPüˆ¢oªª¨U\n¹2ª\İ\â…0\ÑE˜K9¢Öœ.>*eqC2\\” \àPŒ—|\É(@	¨;4\ïN³vpPu77Yq^7ø/\r(¶p\ÕC\ì7®(nSB@¦—I™\îUğD‹\Å@T!‹}+U/5\Â»¨ù#[ıF\æ\Û0\êœ\æñ\n ˆ¹P-@µ\ÕT+\æUrY²ñBp°[\"÷ñX\àH\çUƒŒTpŸ2T”T\à £ó•º²GÏ\åG}<‘k„\×sT/ğ\Ò^\í˜õT$©\ÍoŠ¡%g4\"W\Ërÿ\0*1Nş\nL9¢2Ä x¨jYŠ*\Æ+Œ‘Œ†\áù#Ä§;õ\å,›W!e»•Ur&\à³X÷x*1ªa\ÅPX.a:C’ÿ\0h’\Ì\ÑNb&Ş£œ†Tğá‡’\Z°DqTš\\\0à°»\ÂSš\î\n\"ó¤™\ÍmP\Â)ºg74 Mw­Ë¹D\Ö\è|°‚\á9!\Ä,\å\ÍnŠª ¤œuIù¸AE\Æ\'·\Ï*\ÎR\Õ\n«\Ö*;\Ñ/ Af6\Ñı\ÍR²k~·)\ÛC\èj\'w¹I ^ 3¸¬B$\Ê$aQ\êÄ¸”\\YºHGw #>c\Í\Ü\Ñ\Å\ÍŠ\Öynõ&º!b\ÃñM”D{–\å\Z«N\0\0¡¼4£÷$Qq+š\ÂVa!C\\e J™€S\Í\î*²E‘\nÃŒŞ·F\èc?24ŒÑƒD[¹b‚\ç,!D\Ö\è\îX·«\ä]ÀF«5³„F),\ØO’p?tq\0\ZxºJq¾P\n=g¢ÅŠ\'¹1\ä„\ä\'.jŠ7\Ò÷\Î%\Æ*«_\Ñkú-¯µm}«i\í[_j\×ôZŞ‹_\Ñm=«k\í[_j\Úz-§µ5\Â\Úm1\ÕPŒTq*\ÄÆ¨\ât{„œ\Z7tc‡¹kS’3ôP\Ğ+#j[–,E	ú-e½V\íl\ëz©Z\Ë[\ÑG¢\ÖZ\ë_\Ñm=\ÛÚµ\ãà¶‡ø¨b>J=w„·¢\ÖQ\ë#TRyò[OE´ö­¯¢\Úz-xø*¢\ì5\İ‡\n\ÕõZ«S\Õb„%ª¨µ}T0z­Ÿª\Ùû“¾hA˜P\êü\ÖÀy­Cü–\Ï\ÕC©õ~i+¤¦%tò¡t‚Š¥Ó¾—È­\êF\êª\İ\É`\æ¬\æŸğ\Ü`µŠ†ş*ª\ÊkpS‚•œVuœ<Ua *—QEVj*WMU@(ˆù©\ÄUUf59_ÁË±MD¢\î%Nşwó»9rS0¨6œ\Ô&\ÓGE.\Å2b™Ê.ˆQ¿¦û°»\Ï\"7p\ÑÀ(º½†(\ÂAEJ\é\äSE\Ï5‘\r$¹DœJ•oŠ•\Ğ\È+r†G=w)v \Îj\Ê\át‚B:99´³ü¨\İE£“’Î’#Dcwzš¤—„U\í<8\é\å¥1\Ê<”T2&r$Š\ÕË‡irTTQ\ì\rÉ®Dû<² Š\ïSĞ•„\è&¡; <B‡c\ÅÃ²œ²NP^GDH®jHvC\Ä\"¢T‡`\0(h¥\ØO<˜^` ¡¸*h¹<{Û¹¡£\Ö\É´R¾ªª¹G¹¬<2ñq7R\êhƒ¸\\)¨	ì­´ª¢±:şYO#5Lª\äIs:jª\å8¢rœyä…Œ\Æq+õÃ‚‹À‰Z­óZªm#Áwr]]\"5¸ \çÚ–\Ò\Õ+wD(9­p\äT(x\ês9\'Ğ\ËE•C&y5º½•\ÎL2J9,`ùŒR%f\Å\Õ\Ã&Š\ÌaŒ_%¨ÿ\0\â§.ñq\à±b$p‚h\ä\í\\¥mûš‰\İÅª!\Ñ\ë	2\í\Ğ\È\ÍiqR³Ô†sŠ\ÏHwF\àš\Ö6$£\Ø~•hJ\ÍyZ\ÍS»Pw`sa2rFK,«©Z94B§*\Ìş—\ÅqS5\ïvhA0\0I‚Ù•\"¡\Ä\è%tû1<‘\Å9\Ë&‹sW;\àj/¦Cû\Ñ\ï\ìÀ\äC‰Ê²<§z\Äk•P~­\ÊNiñSp\î­t¿H¸~\Ù]+CÂš\Ü;+»‘\ì6ƒ²\Â\ì\×!£.\Î\ØTŒ\å$#—6·\ÉD0\ÜX1P¦\ì\'ƒ¤µ\Ùæ€†iº¾ò‰\Ü2#\ÕZSq\É\ê@ha—\ÍMUbi­ñPuoğ\Ë6˜@q\ĞEMHƒs\\>j®*M	šY•!u4R\Ò@!\Îk8\Ã ¨fK$Dh\\FL\Í\Â÷e·\é:7\ÉpS¼r\Z_\İ2¨ \İ(\È\r\È(5@]\ë\ÇH\äˆhTô\0\î@÷?¿-;\ä4r“@\ß4\ÖpP¢€½\ÇIE+ N”d7—J%In»V\à\İ9Ê–UKû\îS )¹P• 54”\è#H®\æDV¡4Z\ÂÑœ[T\ìG	<Be £q;÷h\àr:\ä\ÄU4º8F\à€e›¥ûTH½U”RiR’\\{V²”Öª›€X0\â<TšĞ¢µrğ\Z·*\n	ÃŠŠ-`\Ît&°‹\à(4dv8\ä÷K&À\Æ\Õ]\ÊFHa¼Saq¾\'rŸc’™Šš\ÍÒ‡6¡bnƒr¥øGL2Æº&Êš®C{”/ÁÆ½ŒpX[NÃˆSxâƒšdrc“*œ±Ã³\ÍIQW û›\\ª\ß\Z›£|Mñ\Z:dE\Ù$iñ6›\Â\ÄÓ ‰E\Õ\Ê(ñ\Ğ¦4“*š\0ö\Ô ö\è% ‘ºaWK:\äÁ‰†\î\â*/‘»‚™‰Q7K$Ç‚.\å—$.\ä¹\è\'%-$E\rBiˆÊ––ªjªwFø\ß¹ö@\æ\Õba–öŸ—ı*_%<ˆK\Â#(\Ü412R\Ó\ÄP\Ô(´\İ\'AI\áMÁO°OG\Î\â‡a\ÄÚ©;a~\ßò°´ag=ú·\Ê\à@’š¥Ù¹#&½›“»\ÚTÁ\ÍIO²G&J\"\á\ÛAt”Lx /‘¨¦É‰‚…¨\ÂT\Úy´4p’\nZWÛ°»\Ï*9N7R\á\Ë+§Û°¢8ö8i0ºl>Š9bøqºŠRCòÓ k´\Ğ\ìP;®‚,]²õe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îc\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\î\nv~\à¶^\àµ=T¬ıB\Ù{‚\Ù{‚\Ù{‚\Øû‚‡S\îF\ÊP[?p[/p[/p[/p[/p[/p[/p[/p[/p[p[p[p[/p[p[p[p[p[p[p[p[p[p[/p[/p[/p[/p[/p[/p[/p[/p[/p[/pQ\ê}ÁD\Ù{‚\Ô÷³÷²÷²÷²÷²÷²÷±÷ı–±¢… \Âx¨´\Ä\ÈK@‹\Í\ß˜òC¬†.Wáˆø¼#ˆğ0ú©\Û?À­­§òRµš›¢›ŸÒ³‚€™X7ı¯.4h©Nµü<K¿|\Ö&ÿ\0\á8ÀXfş÷A\æ92Q\Ä\ì7\Ù31€\ãY\áo\ê\"\ç\Ù\ÃTv&\Ø7Ö„Düj/0\à7•\rVp]c¨)v~ª/k3Nõ˜‹í‰«`\Ñ\İq‡\ÌÈ•`Ãª]\á}‡ş\àOp¨iLD‚›¾\n\Û\éo÷¸ae™5w>\ä#_ø?š\\óT”\Z\"¾! ¥dÕ¨\ß$\\\ë6\Çr\ÍtG…\í òX Z\Ñê¤¢Ù·{Psiw[e7Q\Í?2€\èö¸¹Á9ö†6¬7rPB\ÒÁñ\âÉ‚‰{0\r\Â3VP|M\ØpK/–\ë0j÷ \Ö\ĞI=\İS\ÜÑ«\ãvakM!\Å9ø1´w€E\î1%Nˆ9ò³û¨4@dA\â*6y\íõQ´yôPpˆ\ÜTé¸¨¨üªˆÿ\0Š\ËQ²’\Ä\íFú\è`Qc¦Ò‹JÂº£ºŸñKB+K€A \ÑSX·µF)ü\Óÿ\Ä\0,\0\0\0\0\0!1AQaq‘ ¡±ğ0Á\Ñ@\áñP`pÿ\Ú\0\0\0?!ÿ\0ñ[ƒ^´«ş®)`\Å\×÷\ÖğIÁO=.\Õ\ím!\æ\ê]”d‰i*\êº\ÊZQ1I’!§\ÊT^\ë˜\Â,*{L\Û?\ì\ÙSC\ì\Â5\Z\ßsÔ6dƒü¶\Ë\Ú\08^\İ,h\äO=.\Õ\í\í!g¢Ë¢€«A\ÌHsqóö\â¡f™#d\Ñv »M\r3¯\ÌŠ¼˜ı:RÆ®³\Ñõé…°ùš¤K^´i¡¦uùd\éNA\Ë²›\Ã\n,”‡\Zò±PiN±\\b\çtv`@…™\"\ZGÊ ®b\Ğ\"ª:(\ÉÒ¢\ÑÀ‰Œ(]SÙZ\\\ê(\çÒRD,¨%­¶üŠ†\Ìı#hK ¶\Æ_,\áZd½ô\Ìg=Wû4G\n\Î%\í\0/h\ÈÀ^Ş”\nx½·Z‰e½¤…¥B\äG\ÜRóWıA\Z§Í¥Q\í\×Ğ µ©A><w÷Šf\Üoø?¯¥|\Óö\åòC\é\ÃO\Ùøœšª\ìòOñ\á±ó/xú?\×O¾~ .íos0s?·=…ß´u·‰\Ö©ú~YŸ «2ı/3!¹™B¾;ò!ø	ùÓ˜\Û#\ç\ŞÆ²‹E¶Üÿ\0xŸ|ü\Ë@\ÅûW£\Ñjy¢÷Ÿ·5\ÑZ~\Ï\Ä\Õ}\Õ\Ù\äu“<>e¼®ÁoGú\è\Î\Úv8ı\í2Nåš·\å¥ì«³0%&½m}a\Å=P\è3\ÉN}`Ä z–ş.\ï\Âa9\Õ.Gnÿ\0=}óó;Hf8eÿ\0yls\év²8¾Ï©,§\×zdş?ö}³ñóRÕ˜4\Æl\r\â šx<ÁY¹\î\rz\æU}o\ÜW\ÌcN\ï\Äv\Ë\ÓïŸˆa¼r\Ìt\'q“\×\Ö\n¿\îód¡±ƒ}\Í9—h^0z\ÏlõU\å¯IÂ…Y2\Ò]\çÆŸ/\æ^Œ¾Ó¿¿\æ~\×Ä³ d\î1\è™ş\Æ=Bášˆ\Ñ\Zõ…I\ØúÒ¿¾‹\"¹\Ó\Ù\ç (sZ\"+\Ò\àòK=~:~¸\ÒYc¶\\:V\\›ö&#ºñøû\Ëû†uûKk›ß•P3_1KfŸ\äC÷;„Î¹U~\Üpp ª+\Z¡w~É\ã\Él“†^·‹â¡¬Ï¾~!8ƒ¯O{€z¢÷£ÿ\0PqT¡§Ox\ç\Ö~Ÿ–,\Ë\é\á\á*…;i¶;z\äg)Œ\Óp…¶ñSù½~LD\æQwÁ\ß÷™÷\Ï\Ì\ãWûYt\r^pÌ¥°«\ßı_\Ü8h*ŠÄ¨E8/\Ù2\Úyg\ÆIF\ëI¼_-N\\Á\"»Ÿ\Şñ¥\\oˆšxII^MKòÁXÕ»N5UF\\g\àù”õC ø†CŠõ–iU´e— ]Ï›\Û\Şú\Êóö\è\ãïŸ™\éFc)š?”l§¦7\rø¶|	ö\Ï\Ä\à–\ßv}c\áïŸ˜ ½#=J’&\ç\Êz«ó=\Ó+@+ 	¦}óñ=5şv¦,}Z~}%•“\Ãœf(0T·ÿ\0…\Ï\Ñö\è\Ê>ñ¿´©÷QH7\Ûj»7ƒ\"ÿ\0X w\ÊEÃ¤\îUu\É@\àQ\æ)	µ\áôè·¢\ß\Ø\è\ÔøO\Ì\æy;Š3-¬R3\É\ë\Óõ¢ò\Ãyb¤g‹¿\ŞUE6NW‡\ïA›(¾*`\Üh\åA\Ğ\n?™R¹¹ı\Ù]\Ë\Ç?\ÌiA«vË½½\Ú\Õ\â\ê%°m¬ün\Æ\é\ìt±\å±cñ0´ô@t\Ï\Ñşò¢©cÿ\0|¯¦£V=˜*KI\É\ë5‘,vÚ˜av\ãq@wb©\é{Û”<µ…øz#++E\Îñu\Ğkke\ŞŞˆl*\Îñu\Ø6\Ö~7\r\ãuxtK\Ü`®o\âi\rX\äı\Ğ D¬1S4\í±\Ã\â8:\í\Úû\Ã*\Z±\ìùŸ£ı\æ\Ó\Ì,\ç\Ş\0\"Xñ»ÁñrCk\ï2¤v5‹©C\ËX_†~÷™;ü–\ì®òÇ–ÅŸ\Ì\Â\Ğ\Ù,ylYü\Ê]šW_\ËÒ‡–°¿–…\É	+\"şYqTµÿ\0¾~÷€\0h–<¶,~\'\èÿ\0x’·C+,h\'ÚŸ³Q„K…¶Â\Í¶;ku­úÌ”Í¥_¯ñbwl*ı%r½öB†€;_Ğ­úk§|vÒ¯zôœ\Ùv‹\å›1\î\Ë\Ë$\ç;\Å\Ô\×\ËWGáŸ£ı\à(\çû«\İ\Ş\æ\Ó\Ì,\ç\Ş\Ñ\Ğ\Ûi~‡K\ë‰ú?\Şxm\â90)öt¸E\']¦W\ßşv…Vû=\ßK@¯\èÿ\0\ï“Å¢\É\ç>Gpÿ\0\ßøÊ’ £ı¦÷\ÙMT ]W\á\Ë÷ƒU;øˆo0÷E\êòDvZ;Yÿ\0¹ıCˆ\rç¥€k\ÒV+œrBšÀı\æH\ïú3%Y\à·\àş\åM§¿\áş{Gg%Ec\ï0¥Gş\Ña\×v\ãÇ‰P?\rÿ\0Qq±À\×\â4Q§ú!«\Ã\ìgl™ƒûø—ù>	ŠG¬p7ıG|R\Çÿ\0_ˆ\ÑFŸ\è•\Ğ\ãÛ´e™Qø2\Ğ\Ë\é?Q\Ú%\"\ä%¯†=²4\\?UŒÀ<rÁm\Ëx+µºs€2¼2‹\Ú{0w\Ö\Éõ:*_ÖŒ&b¼‹‡\È\Ï\ÏL\ÄJ\Ëlxhw¥·$€f*\Új\íÿ\0E•\Ç/ó\Ş;€Àp¥Ÿo\ê	¶\×\Õ;3“_ú¯a`¹Û£\Æ&9Áa9\éB\åzs)ö‹Sx\Û\"ûV°º)\\m\å \n\Ô÷\ïTLšß¡\Ú9p–\î—`\á…Xµ\ÜTrÍ…ù\ëû+\ä—KnH=\0\ÌU´\Õ\Ú=ş&‹>Ÿ/ó\Ş? Àp\ØûKY\Ø\ì‡Y\í/½aE\Ğ\Çz\â,pÏ»´tU—N\çiheô•øöO‹Ô”İ‚¿ømœşÿ\0cœa|ú@u??\ÜK:\ã\ÄCAªñuG\Úa»ß’”$@\ÜÁ®õ·O¾~\"_C\'!Ÿ\İ\Ã(°|ÑiªwWv”E\æG³.\Ø\'6<˜˜·\Ï2™bĞ«\Ò#\çeù:9¤öt?\ÜQ\×µ‰¾n>\'&\Ë\ÅK„¿d\İ§\àŒ¨y¾‡?9*Á»X\çñ6ı\Ç\Ä\Ì\ÔFs‰“\Ğ\Ë\Ç>ñX4¿\â~£·F”#4‹Ÿ¸\Ä\Õ_Xm^CúDM…øÃ·B.…#\Ì~ğÚ‡û˜\ÒÒ„QZ»i,©/\îÌ¶Ô¥yEù™z\ÈğŒ*‰n\ã‚+J9\Ìb\Î÷‹ÆA\Ï\Îb«òÌš`Q\Ñ\×]ş \ÃVn\Óğˆ{Ø¼ûuxK†Õ…õ$}Ò´ª«;)Ë´ óFòú4÷tõL~a\Ì\Ù\'\Ècš\ïƒY{Vı¿¨dI\'\Îı¾\Ò\İ\Æ;V”s˜\á–-©Àû\Å\æˆ \ç\ç1UùfM3~\ÅÜ\Ês\ï\è@¹\ŞhË€\r€ör~÷‡t–‰„!£¹\×\ïx¶Ğ¾Äµh\" ;\Õ\Ã[¤¨‚>‰\Ï5GkuùQµÜˆ\è\îµ9×™b,œzDë˜–\Ò34Í¡®U²~	sõ«	d¾›&\ë±*>$™\n\Æ5ZZ\ß(²\ä–q£\ÖjöW$\æ6{\Ş_…@\ÌfÙ´±U†ƒ\Ìu+p÷\ë\Û˜¤$¢ûã¼¡L–^=#\ÏGp—VEvº€l\â/\ç–5\Ì%\ß\â \îh¿\Ô)±+\ÂØŒy\r“·b‚¿×ˆ\ç÷‹R\ïu*¼ğg\â.ATg{‘Ñ£yƒÙ¸\ìÁ^¦m€vñ\ÔI\Ãdp®\İ–½›ñ\ïf>¤Ğ…Á@ğ¯o1óYOˆ_XV3^\Ú\æ$\Êc`\äuk„½^¶\ì\îd\×ı\Êá‹¸>¡‘”p\î|ô%\ã¡<ø\æ\ÇŞ¥\ÓV\ÓkÌ±³\à(¾	û\çõ›\0²¤‡0Y7û\é6‚eò\ÆN\ì\Ë{G\0|*nV8ôG\0KÂ½¼\Ç\Íe>!=aX\Í{k™ei¶@÷ \ë«\\\'kù‘z8ı¸‚†«?õ¼\np|L\ë\È-©x™}H³³¿™d¾›&\ë±+ „xqLHª„q\í¯ÿ\0´YŒ&+\í2\à¯Yzû\Z‡%°´\Ñ\Ü\"\Õ\Âm\Ù\ßø»!¸b9ø\Ë`•+*f”¼•–Z ?\ìŸ\ï§Û±ÿ\0—r‚\Å{yÏº~Siü®\å\"¥}\Çq-k\Ò\å°5?\ï\ËZÔ¹vEZeôS¨\r–*ıÿ\0ƒ&\åì ™>ûÂ¨\Í,¾f\Z+¤4¬\ŞJ\ï‡ó_òƒ]\äL\Ş\Ô\ÅÈ‹ƒñ¨s\İ`?¸	\ä@Q£\ß\Ñÿ\0\ä=³¬% ´§¢œTJ‚\Êü\'¯C.U*ğÔ»®_¯\ïK=\åµ\Ô\æQßˆl÷\à‚•Gü¢E£1Átk÷ˆ\ØQ(\Ç.–ù\ç\Ã+‡\ìX\×y–&n\ç\â\Ğq\0c¯ş2\ã`\\µˆ5ûB@˜WB¦`J\î<ˆš€C½ıoC\İ1\r]aº7\Ä=J¿\åi®\n\èX\Ú\èô*RA»6qQ¿52\Ğ÷¸¯šs\ä\îY\n9¸O¿¯ş.‰t¦3E¹Mv \×3\Ó\Æ6\Ø\Ãõª:\Õ\à™Û²ğ\"«\Ç\Şc½)\Û`A\Ô\rGşIO\Ä5q\ØJı1ƒ[°»s\â,;ohóÂŒ[*\è\ÜÀjø\Ä’šMÿ\0ñmÁÒ©„î‰ F2Š¶ D\r7õº;tM™ox\Ç6û\ÕpE‰)\ŞQµqÁJä—¬G±ôUG\Ó\Ã\Éf+\å#Rõts\å)uZ\Ü\\Ü¦\é.\"iR¦}\æi;ü_\Ï\å\Ê7÷\Äb>‘Z,9z†W{’\à\í09 \ÎK\ÌN†vG¡\Â9SR°º\ÇÁ–\\v†ú”—4^m­\ÓGş\éÛ·Kú£O–0\í“	†7(”1S)*œ\ÇD=˜z\ÅL²ó›\'úñĞˆM5\Ğf:‰d.†/C.\âe\ŞË‹¨\íA®¸\Z•#\Ú^L¢\Äu-½‚\Î\è4H<@­U\Ûpl4L@e\äV\å\Ì9M±\Í½(>¶ş›ú(\Ğ\Û;\ç\Ş/‹Ù—Bx—.\\¿ g)K®\ã†`\n¸\"[ø/\rr\Í&\n³Xó²EH«ºD`\ÕO\Ò_ğ\ßügQ(\ßQ\Ä\Ø\ë,Je”­\Ç:\"\ã\Ã4M§xñR‡Pk‚dfñ*~¹mw^ı6ˆmb?pÜª\æ\rVL‚’_7gó\ÃĞ¹r\åË—.\\¹r\åô¾€8D\ît\éMË‹¢ˆ\Ó\ÛqQ@ñ”N@fé‚›\éKa^\rùˆ\ì\Ã;#!\í(­]\Öş‹ş;\é}.\\¹r\åË–K%Ë—/¦o=¯¨®¥š\ËB¶#/4w(]ó\Z\Æ\ê|BU\ê\ÜÂ³¹Hl\ïÜˆ1òf™`g\Ù\ä®h¢\Æ&¯\Ë1”d!†	P\êù•oi\í,S\ÄÀğ%M\ç¯wşôÿ\0Ö\Ìğ¾gó?ô\'ó</™\â|\Ï\æxŸ3\Äùœ[ÖoŠ\Æ\åf4\îJw\êR\\¾ƒ,)§˜`6‰Z“³„`08&\rKfˆi›„\ÌÇŒVb*ƒjx\è_K\éUı`\\¹~e\Ëú”w´x\ÅÁ÷a\Úü\Ç\ì`¢\Æ\È1‹Kú§†f\å‰ø\Ô\íõ÷qŸõ8M\Ä\ÄA\Èfk\é’Aq\Â`;\Ê®	H›—*\ËKŞªb/3j*C•	º%u\'\'I”\Ğ\Z•Ú™}£À\È\ä\Ä\Ïd”öe†ğŠ%^¼L\ÌlÀ\Êÿ\0\ĞÃ‚y7*\é\ê\\p\ÌK­ª\àz–Hª\Ëgaù\'…ó?ö\'ş\ÄV!G›‰H\Ö\ìVgı&§™ù´_5T\Ò™”À¨ùg¬X\Ô\áØµ\âS#•Ó™u@\ì4ğ%»!\àùŸµ\Êÿ\0\êSÿ\0sÈdñ3\Æ\Ï=i\êOi„¸\'0nGMı\ï/¥\ÊVó/r¿¨²Lf¥»\Åp„Xv\ÈU\âQŒŒ[\ßW|£ùb\Ù\í+¤J+\Òi¹±$5‹\Â\Æ(« \æd^‘Â•˜w,zs,ŒP\ë®§3œ\Ş\Ïi²\Ó	{½\Ğ\n\âá\ï\n7V˜³•…\Z”Oúœ„<\ËuŠñ1\Ä\ë19\ÃÅ®½\ÄK\Ë\è%O\Ì_\ï\Ğß¼ä“|;K¼Åš¸ñ/\Â/™Kª¢•ˆŠ\Ú\ë,\ĞÒ¯¢\ÒG­l Ue¡¾\Æ)i%)\Ì\ãc\ë›üO\'\â\0\ä=\ç5v\Âıe£\áû\Ì\Ş\æe3\í7\á+Ÿ\Ê_d \ØC	iP£\É\0ózv\Ã-Ü—s[—º•¡\ê™:‰´)‹\åŠeC™€µJ}\Ø•\âYÀ:\êô†d·y`ñ¢Ø¥÷\".¾I\Ú&1¹\ÌP\äA\rœ—)\êA\á\İ³gf}\ãÎ¾ş\ĞU\Şf—}\0-\Ü¸¼%\êX2e\Í5Å¦4ûaWT<¤ h¸*\è¯Xy\Ğ\íà¯œZ\İ3+¡Pª¾#B\ì\í\Z\ÜEu^nZÆ‹<\Ë(o\æmKŸY÷@ÖŸº\'\"^2¯\å‚d\rVû%\íl\ÌU	L\Ñ˜\0—TœZ>.:°Wˆh÷–¸(]¬v‹2\Ïf\Üi¦kRÑ‡7²\rm+¼§wÌ¤\í‰O?iN\ÏTQÍÚ\Ş£º–\ßÁÿ\0È·´·yO,Å¨GAóqñ”qQ½‘Oû#fq\ÒX\Ğ[¶ˆd(*hX\ÆcÓ…\Ì\rÜ¨\ËB«´\Z®¬!\ÌR¥\ëA\à´A;Ê˜%µæ’§{ˆ2Â—»ğ\n…\í¼$ì•‰O–\å…\äÌš\âm\n\r!Xw¼±Ápƒ 2\äzJ\ä‘{	\Æ(õe^şªÄ¬ \àø¥OGq)\ä\ÄyA‚\ï1ñ2[\îZ_|\Îv	—7÷Z+\Ö[Zx€\ÕqÂ¦„\î¼`\Çrg–~~%/N<G´1şGn÷R\İe}\æ5Ÿ¹±r\Æ/4	\Ü\Ô\'¹š^jHX-½\ÌJPı\Ò~P¢¾(UY’\ÕGÌ½0ú\Ë.‡¤\ì*|’Q)\é Û–v¬©R¥L2“&[œ³r¸®\Ø,\rˆ²¤ª^^±j£j·…»‰\Z·‘5‚\Ü°\Èóˆüœ\Û)?¹\å†Y\æ{†\ÏŒ	Ñ¦S\ë;\å—Z¿1!\Î2\ËTòp—\Õ ¯\İBØ†Q·fnmmš\É =.-.ƒ´+x¾ ,ÍˆV¸~\î;¨Ä†f\Ü(\ä|”­ló˜\í!À\æ£õ\âc›÷–\ê‘Q\\ºo\áˆ\äY\\şS\ĞyT¸\éö%\ÎŞŒ+ŸºcŠ#\È&7}Jô#İ¬&0_«]ıªC\è#\Ş÷D·ò}-¹ ‚\Î\ßõƒL\×.cM¡óC\Äi\æ\×\æZ­¬uˆ5\r¡\n„Q\înƒw\Úb\Úsş`@»Š_.D‚sL»X;Kóö‹¢W¦}>€Ù‚Ì­h\ÂÊ¸N\Ù\é:/®!¡-x&B•Á@\Ó9…y\Ø\Õ3°¦K\Ë\\µ\Û\í\0Jñ<A‰\Ì\Ã‘‰c3\ë\á:¦>L4Â´?¸5\0C‰„TH–\ÒzZys\Í$pô	”Á›xˆ0i\Ê\ËA\Ã,‹e)\Ù\âS\ä\äs†¡¤Ó¡ş1.L/£QÍ²\ír\íJ®\Î`/\ïoYxˆ\Ì@µi\r‘û°\"\Ïö³8±<¯úP<aÄ‡¥ÇŠ¢)ùBpÁ;\Şò\Î\Ì#m|5(ºùe\ÇyBğn>‚N&\Ã\Îİ¢¢¯\ÉúEIQu\Ğª\áË£t\Òm˜@š¶v!\ËP»u)T3˜i\Ïöˆ\à°F‡¤{—>jlC\İ\0À>\Ã\â•ğ+€´7Ùˆ?ö7Kh·3 	»öTrU]€ö\êÀ\äÂºû§l|Å\Z.nXvyŠ•*\'0K¦\á·\â\àM)<w”ğ\\ÃšfQ)†º±…wCJ<bY\Ú%7\\H\Ê \nW?—~(F±\Äc\ÇØ¸ŠOVqL1;B\ß\é6\nö”c‡¬Rƒ\ây\İ;=¥y÷H\Z£bü\ÃO\í\Ø\Ğù¤ó£\ÈÓ´°ª¹yzFV\Åñ±Æ™S—\à‚»\á÷a#\îG\Ğ>RÍªÃ³Ñšlsˆw°ôƒ\Ş\Z‹E\Æ\î†=ˆ\èó9=¥ã¹–È \ìKxe-œ¿Y²\èöÿ\0s\Î{\n—”n\Åø¸mû\Ì8«\Ú{‘—¤lJG£X\ÖrW¬.’7g³y ôxÿ\0ÚŸûQ_84%wÂ¾ 0}g£\æM\ŞR\ã8{D¹}atC\Ë50\ÊNGM\Z´n\Æ*.gP\Ë\é+\Ê^ñ{NHm\Ôfs\énr$ªf\Ğ\n‡Wgj›“§Šª	\Âz+\n ‘~“ºa\nŸ²5\Ø62„´v”¸®ù€n¿0yœ\Î\\„\"\ïF—7•\ä†Û£ĞŠõ«\ÔÅ„\Üe©\è. “‰r¸•>™\ŞcöCQvû1ù0ñ’CÀƒ«)\Øş##ÂŸ™oóQjB\'\âb¬~lH${L´«\İTz‘=fQ]¢\Ş%\è\np\å€j\â2\çs\â54 h\Ø\â_&\ë?K2\ì—Ltf\0\Ëô\Ã:™‡nŠZ6÷”;;º¬\è\Ù\"´\íšDi™?=#~ˆ\æhM%\r0“™\ÂvJy~&½\ãºmóo—´L6E5aŞ¢¦w3ö[ÿ\0erz‚\ì‰\ã0À\ÍË¯ŒvNKa—>\è°\Ó\Õ\ïd‹\ÓÃ–,aû\Ë9=aî™„\è¬g3%ñˆbfT;#¼ \áw\Äy—D\Ò\ßd(\åu.8œ\07\âa¶±\Ãû!‚¯ñ)–k\Îeµ3v*`\Õ\Şû\Ş\\®B©¸PiH”\0Ukı–ı“:t¢\0/buÄ‡\Ğ#¡Å\Ïğ]\Æ%öOH¤—G\"\r½§ˆ\ì€\n#\Ñ\êô¼\'\ãv\Ò;\Ç\rB9™F²ºjå‹ 	ŠG\Ô\Ä(\Ğñ(\àò³¼7\Şm\èRı\"ÿ\0@†úx\ÌAÿ\0D±i\êkÀ²W\àC¸É²>\âp‹;Àµ\Ñ=	e]Ü¥Wx)ô\Ì KÁ\Ç\æ6-\èEµF¾¼\0„%¤q›Ä»\Ó.\çRqr„Z‹/t••ˆÙ•Q/«+sP\Ë0¤÷ d§>#^úÔª²ıñ8´Á;\İ\ï!ğS*¥[\á‹N)\İscK\ÄMınn)dYG{¨2\ç\Å\Çqx\ßúw§¿E\Ë\érşŠD¬\Ë:À\ï4{õz0\êy\Ä\ân!v3\0N3°\ßW˜g5SA\\\Ô\n®\Ğn\Ñ\È\'ö¦‘ò—\ç÷dUª>°º˜:‰Ë¯LJ\rVüM‹;\ë	r\Øû\Æ ş¤n%ª/¤uR|B.VjÁ\0F—)+\Õ\np@?¢[ú¤\Èr\Ê^fIóJ\Ó\ÌÍ…\ÓP\Ô\ïñ/j¹z¢S\ÈYÉ–¦\ï´`Sp\í:\r.¥;M\è!Hjn@\rañPí›·¤w¶%qög\n0F^*\Û\ÔVÑ¢>©\nM\Ò\n‡F\Û\0!Â¡Œ%\ËúN¹s)ô=*Tc+€”(ô!­Mkq\İ\è[b\ÏB9l;¦\İxpJ¥‰´…‹y¨©J“S{OYòLkurI”\ÚÚmj>\'r½H=`ğ#ŒúFh\"ve.p2›ı\à†‡\åfe	mn,”S\Ö€%¯h\Ï7ğ#\Şñ\ç\Ä\ÊÒ…¸†·;|\Â\Úó\Ëy†u+Y&kDG2\Ã0*X¸=§$\áğŒúJnºZ\İ0‘~O\Ä;eN\Ñk¥v¬\n[A\ŞÉ¸£\Ì?\ÊkóxG\r\ÙÁ¨M“\ÚB€8Ä»†\à\Z\æ#\Şa\Ü6©\ZG@<ı5ôhş)`AFƒÌ§,zj-1B\Ó^e“g^Hø2–\Ö3¤ö‰¾ü¢4_™\á‰^L\Ú\å3\Ûs.} ú’\Â\Ó\æXAÀ¦G\à€=!V¾Ã±ü—öø\Ş9<JL/üô;£Û´\Úô\n9n^C¼[¿‰\ß\Ä\ZK¥–°ŒUcPmƒ(\æo,e8ƒe|2C¼·\Ê¾rXhûËªG\İ~O@\ÔDW§$O•´ZvvƒK\Ğ\è¡+5¸®\Ö?”•1\íz\çqñ7Ä§‰¬“}n_ò¥‹\æi¸‡k\È¤alÄ&\İ(g \î0•¸K¸\\b\Ùõnk\ìJ³²dˆ½C³h†w…QDx¨™¢ğ\ÊÛ®\Õ2†#šû0F²bƒŸ¬İ‹ú\é;%rñfü\Âóš÷«ˆpe+|Ex1á˜« \ë\îÇ˜\Ê\â,\'o™ƒL°¶\nh{ŒÊ‚\"¹YLEó:‚\è}¥\Ãb/ôB0\Û^JƒF\é\áœX´\Şû3t=\Ô;Ey½\ĞBUBmi™Epa;¥­C¼\ÆS¼@\ÖÖ¦±ª!i†ú*\ëRº›úŞ§l\åtcP\å]Š+,Û -¨‘• Á¹¥r|¬¶·\Ä/z\Â\ŞóÁ\ë_tÂ³a©ó26·\á•\ìø¡B”ñJ³ë˜…¢û\Ãl:ô\ÆıX4£\Ì\Ï\â y\Î-\Í|Ÿ\äeµ4\ÇÆ‚\'¿\ÌhT«¼¼\Ê\"°\ï6›f™m¹R¦W®Whb\í\n†\Æ%6—Àù¢ó=\rY\í8½BV×¼\Ú%\0v{\Ô\í\Şóÿ\0%cG÷¨ò\ëvš|‘R/\ÊiPœüK1£¢bø$9‡K<Ê½tP~Aú´„\Ò;–\Ğ\â§¤|!Sduƒñ\Ño6\è}V¥E\Ê\ì\ÛÍ™\Í\ÄK˜ôƒ™–[ ,Á!++1\ZaØ‹œk¼\Å`UGª¯˜Ï²¯‡d¾ú\ÎOF!ø2¸\"Z†ü-\Ş\Z¢B>\âŠ\ÅÜ¶˜;³o/IJ¡~b&oPc¶)Á/8£K©\ÄJ`9·ü¦c\Ô\Ü7Üc ƒ£¿?¿¾iª¶N[ø±\í5\Íô¦\Ï0Dû‰~!†TB6T\Ë‡BÙ¢J\î\ÚOR(§f-.#“}@²»L\èF\0II½nDÀ\è\"Ô¦EJ\è}ş\è—ı@—OÕ—P\é\Ú=fnV\Ê\î~\Ó-\nez\"X\àO™V‹õ–Ì¬\î^ø²\îû\Åh?0i²\Ç1“tÙ¦{\rÀ™®O:‹c¾‘nd|C\Ö\é\×É{š\Âù–\ïu\Îb{§õ\Z\È{0E \Ô\ÃûSpˆ\â)[.!w÷\æ«ô0v‘yÒ®\Ö\Êÿ\0\ÒX\"`ª©J³˜;\Éş\Èğ¤c‚£\Ûü\"†tsº%\"\äs\æR7GsR\ß|\ÇR_)pÌ·ZCP‘«1õ±\ç´(	\İ\ÄnIS\ä”\rGm(!\ètúÁ¾ñu\Ú(œKÉœ&‰=\àùè¡´œLE\ÍF±£L3¹¸\í}„ßŸ˜+@>³Q&³\ä‹\é\éH\è\ÒQmË¼c!|Ê˜}`\n\ßÒˆ‡2\Æõ”™«<\Ú[Ù†‰‘\ZI\Ù¬<\0¯˜”\îòƒ™‰ˆÁ	fğ\îXn\núJS¨1M–Cşõ|#\çt\ÕC\å T`©rM\í^QN-À2òƒHwn..\ÅGA›ys.‚´§h>!˜–P”H+pq1\ÎĞ™ô\î\0¶\Å)\éT·n=b\âªk\Õ@2-{&‰\0ò½™\Ü´\ÏY#m6e\ÌE\Ğş©‹\Ø\Çf+İ•©ˆ§² ”Lv#¨ºu\Î×«só\æ\n*Áª»5sı¿\ïø…iXQ\Ü÷Y\Új,\"n;Š\î¹lƒ,´‡\Şe¯¶¯D»_r°	\ë;ñ5ª:Ts8t¹Âˆ—pD\ÇrÁ˜H¯ŒAû«ş\Ò\îecu^IH\á\Z©Á=ŒşûK>„£´UXM«–O„\Ú‘\Ü^pzÁ”ºK/²¤k\×É¨\ì\"÷s2õGW*\"óQËšW\å.øa‡¶\ĞÛ±ó\ÍE™\ØC ‚\";–dL®1\Ó_\Äõq9%\ĞNÑ¢÷&0™B\á\ÂDe\ÃSOL~¦\à\n]<Bª!‚\ÔcW	†R\ÊŸI\Øû0Í‡b&¬|Äš}´¥·\èflW\Ö0 N\Í\èŠ\Ó_yy™Kl\Òir\î~·6D<ÀmX¥‚S\Ì€l2–´\Óu1-.õ\ÒC¥‹\ê2›ˆ¬K¡^&\âûO8·-TÁ´¦øš\ÇKò÷Y óy}f\\½¢rz\\S„`»F™¤v\\1\àõ—q•\"Á\Ô\\Á\Ü\'gd¯\êe¨\ìñ/K\é¬\Ç\Öt!\á~ƒ¢§„YZb\á&²‘İ¸ñv˜s,U\"€¥XT³m\İÌ´40¯ \Ğbe\à”qq-\"y–\áO§7’\ZÅ‡1w•ùC\Éq\rşó\ÔMp|ô9]¡\0\İ_‰|b\ËO¤°qœbeOşôÀ¸\rÀk‰ga{ …\ÜsOhJT‹µ·V±\å¶\å\àó\rBıø€\î?M˜Xf`\È²±C\Ó(@®‰Šö‚qQ\îfˆ<¿nU\Û	\0Ë°õ¥G¬\Å_Û˜\Èÿ\0\İ\ãò\âş\İ\æ‹ı9—mUún\Z·0~\Ï_÷€Ò¯\Ûp»ö\ïƒ\ÔOÚ¥\íò&ğÒŠ¢¬g1|«\r5O\Ü@\ë;?d¿_i?hO\Ö\'wD?ñ“/ù\í0\ß\âE\áû\"_õ‡şŸdq²¢[p[~g*Z•\İ\æş\ç\ég\ég\éb\Ûû™\ÛĞ¿û zı>³~Ÿyû\Ş~ÿ\0÷Ÿ·ı\ç\íÿ\0yú\Ö~Ÿ÷Š\ĞZ¶[š•÷KN\Ø6Š\Å~XZ­ü³%şi›ı3ÁùbY\ï\î˜4ùK0\î\Í1=\Ù~\Ã\ï<–-¿™‡ş¤ş\É\â|§\êS\ÂùCµùeKv-\í\æ)\Ãöó<\Ó\Ìñÿ\0O3\Ãı<\ÏôóqUÑ\è?¸\Zÿ\0\ÚxŸ)ú\Ún¯Wû\Ï\Ùş“>?G¬ı?\é?OúCöŸ\Üı¿\é?oú@µú=e,\ïş\Ñrœ?n`\\o3\nşÛ™#õzÅR›)H{®cXxËz\\¼A\í;¥\Ü\\k3e3z¸-¨¥»Oy\ê†QInE]Ëš*PƒŒ\î*\Í\Ô{‚œTpbZ°K\É0\æh•(’*¨B«ŸW¯ó-eš\r>½f\ïøZaùS¦\Çü\'4E©tfñ\n]F¡g\Ì0FØe	\ÙÀy\è{‹¾£·ñ\İ^\"4t\\³l˜50\î{M\"ªm\Ån_\nÏ \Ë\Ú\Æi¯\â\În_\ÕöQ\ÛøA~ñp\ÏI[_X“S©&€}%úlcÔ—\Òÿ\0ˆ–q\Ë4£‚8;J	–È…\ÜvÅ…Œµ-5˜®¢°óq¨öL\Ô<Ä•R/\ŞZ¬tV\ày\Ì.‹<Lcg”,Q¾H¯j,\Å\ì˜F{šbVY,%“s\Ú\ì\Ä\n¬xS‰@¨7ø\Ë ÿ\0+©Ÿ¡3ô¿ƒ(W°\âa\n;¯˜(¹L\\\îr\ÇPt\è[o‡i[\Ü?n ¹j›e<\És3\Õ)\ã£S5¸\Ö\Ö\å7.^‰Á5\\N7-.÷,2K··A\á˜)q^q\îfû/Á9iÀ\å–)x¹š(X\ÔXw&\Ã\Ã\Ãˆg.ù²˜jb«\Ã-f\åªh—\ÍK+Q\Î]\Ç÷\à`›ğ?É¤\íqú\Õ~\ë#n\'@\æ=\Ú_¼7†\ÓF_˜ö¹H^ˆ7\îe<K	è™–\ï\ÑG\Ò\áĞ·¼TVZB¼‘f[(§,¦TM\æ§5R\ïuQ¡¹c»–¬mÏŠ.\ïE†Wl¦\ßù\İ\Î\Â‡\Í+\Å\î\ã´Ğ­ªs\\’/1f^÷-\ĞJ7\Ìß¥±\r\åu*ù…j(9%Ş¥\ã3˜\"\×EJ¡N\Çø´»8j8^¿Q%\í-]7. ˜m\"F¢„\êó0u!\ÙVP\ìö„+Ê²å”•üVJj}\Ğw†‚$D¬X\æV54\Ü\á…,¾#:š\æfpó†!)F\Åy™\èM¨´@4c´·o¹‡hùÑ¥\ÄhaGXV=»]\Ê99ór·òÁ39–Uxy&EM²\Â\×oÄ¬\ĞË¡©¦\á\Ú\ÅL\æ”k)lú?\Å\Çûÿ\0¨\à‡BU\è@\Z1N\"a&ºM31*w*\í¼)\ï	R¢a*:\Õş—‡õÁÆ»\ÍJT\ÕD~ò\Ü7£3ti\Úz Ÿ	w\ÄK<td‡™¢º—\Ìôÿ\0¨ón_0\\\í¡?O3œ\\;ˆˆ¦×«ä‚Œ¸TA´ó\â`ƒ¼<Qs	4\Å)bò§)X\Ş]\âLropm¨Ù©c5*¢¤˜]\ç\Z…\İÿ\0‡£~«İ§Ä®’¦¨M:\Ô`\æ…5\\Ìƒ\à˜\ß*È·U\nO\ß^‡GdÆ¾_\å\r]&ı Vk1R`™!\Ü\Èg´3‚\Ä\Ôf!)l\Ç/¶™(8\á{ÿ\0\Ôğƒ»G,L#v8\"k\ÌU„\×\ß”&\á\â/Á1\Ê/¼WW*¼¢a¶¡\â!l\æ!’\ÉX/\Ş!Àß‚0/ÁY§˜80÷—527(4\âVµˆ?\ÑF\Ë\è\Ñ=ÿ\0Å£\Ü\ÃpW\Ôl¨†\Ö\×rn=q4*WF©†!lÖŸˆ}|C!\ÇC]8N^¯òü\ØE\Üõ\É¸\î\ï¡{M<M\'lCY…Y–óŠMM\ÚY\ÆQ§1@r$ p#•\Ã7\ÚU{\Z”-q\Ì`Q\ä¼\í\'l&\ã…ò¢\nC\İ\ÃEL×‡‰cYˆCœ=ºE©\æ^¯\Ìj_0=‹İ¸BÇ¹”°óöûK­us&\èˆ\ÕÔ¶üÁB\Å{B\Ö\Ú*\Ïñ|\Å9˜}cq\ëPM\Ì`\ÌX\í@\ÔFÔ‘º#\İXŠt9%y \ê\ÑÑœ½—±\ãÑ˜\Æ\Z¯3\Ğn\\[\ÄÀ\Æ0+¼\Ğ:—§\ÆGPf-X¸1Ikqeo`7‰ƒ”6km¯\ÄÁH÷\Æb-x†¸˜\ÕOHÀk,ğ\ÌØ¿\â-\0h\í\r¥™|Lw(´­\àú\Ç\rG\ØKišFö\Î|\Ë.Û•\Ü\î(u¾‰W¾N`\Ï\ã\é¨BDÁ\ĞbMñ2Ø¨,g0LVe*Š\Òf’\Çr€{ \Z\n‡M}mşZ­ ¼!M\ÂMo\ÌÁ¼FÑŸ˜†-\êÈ•UQ ¼€Æ‹ \ÉVDø•¼ùawz–s© ¨)¥\ã:ğ—\ÆA\å\É\ŞZ¥G7\ÌY¢T,\Z{Æ®\ëRZs\Ë\Ïcso\è…¼Ñª-u¹ƒ%ATnÜ«\æ\r\ÇU<G»P¡Rf÷Œ£¹gšYAÏ»ø*$\Å#™\Í\ë\ÑP„l€\â^*\ã¡\îŸi®¯,\Ü|ód˜X\àl\ÂYL¸\Æ\å+_K·C¬g/ò\è7ªY¥1%*]²!ÁU*Cd1\Ş-\Ç1ò»ª¸\Ø\Û‰Cƒ\Ì,9–m8Lw¾%@\í+\Û16\äi“ş…?2\ì¨À—qm•´\ÅvS¶”M\àJ(–”5‚P\ì6÷ù\Ïi\Åp\ÔPŸqPM\é~`xT_š–\Ö Wx°¶\ã›\Ü\Ó1y\Ì\×@ö˜ÿ\0MLt¦iR\é»\Ú±´f\ÓRV\í$AOcP4Q‚pŒ\âÁ\Ğd5N\Ğ\Z![Cß˜¦–pgb\×Kz®\×\×OGSŸ\åy~BS²[š\è\Ï¢‚úL S˜*Ü „\èz‘IWxÁW+he»¢ngc\ÙdVpFk9¯?ôŒ[*#Á˜¬1K\ÈQu\Ş.o‚mp(\é} ˜nÿ\0Pµ\Ñ\â\Ó^’\Ê*5÷0E\r$¤r_ˆ:ªSœ%’\è©JT©\î\Å+ª˜3¸\è\Ã\éz„«„\ä\ìŒ4Añ\è˜F/Uğÿ\0\Üø)4™ja•ˆ#‹X™\â\Í\Í»÷wùC\éùş[›‹î¬¿3\ç<\Ë|\Ìùö–Ç¢z\'ngº{§’zÀ\ÛyB\Æ\ÔF[/Ü—æ¯·˜s@´\ã\Ï\Ï\ä…\Ë\ßt\\Œ\Ã \Ú\Ìøi\İ´/n&\íğ=[~Œ£‡\Ú+µ{LsıÍ¯hù°÷úÄ«„\Ò\ËWˆ<S\"³~Iˆ²g\\ô®`·„\æj4\Õ\Äk_uFa\Ã_OdûI“xƒ¥0\ë+¦@”\Ít˜\ã‚v\î\Ë6 a/!•3²iJP\Ìó\Öe²ÊŸ\êõü\İyş[òø§õ)\ŞU˜\ï=\æ\ÇÔ\ä”ø”ö&jff7\Ú`À”\Ñ{™‚‰ìˆT¯Å³2\êÌ¯Q\Ë%89wô`9­\îœófƒ\Ëöˆ¹\×1‹MM®Å†){¦w­\êC¹}¥û¯£;–ùÒ»\Ğ_y~‡¸‹\íğ”\í;eûı¥¼>\Ó\Ñğ–\íğ·}\Z\ÍO¥ºm¾\ÑZøAOÄ¯h’ˆ\Ù\ë\Ñ\éYs\Ò»Qø	V•,\ì\æ<ƒÌ· wpšŒŠœ%\0®»¿\àc¹÷\'b ]^\ê”\Ølñ’X>0ğ\Â7Ø¿X\İ0\Ó\Ú[´;†¥iW*\ß\êX˜¾\è\ËRû¢œ\âS„Ïœ.M§ˆFjªƒ$\'Ü€ˆ¸„wĞˆØ¤*7¬M2\ÏIea\Ïh\'ygyJ\Ã>)\ØS\Í~\ĞÒŠ-`½\ç£-\éa‹\Ó\Ş-\Ï\"nõ5&‘œttô\İúu3^“b=\r=]7z\Ìm\ÜE\ÇR‰ÀAT[c™öD\àP\ZX\ã´UDº5¯£Ÿüògr€Ú©f~Dp †—}\ã\\…w»€(=Œ´-‡IGrL.-¯™D¥\Öj\"JT^v¾ˆ\ÖsS&¦Şª>\æQf^?#Û¦¦—ôŠ•¾&{G§™cöú=\æzZL\ËwMc:\Æ8—‡\ŞF¥Y\Ú:„3~‚Õ¦øk\ÍI¯ALµ®®\\\Z99¨\\*\í\Ù\ëË‚š€jg¾€¯£\Ïş\0.š|A|\é\ÇxùU6\Ï\ë/!š[0\ç\Ìm¯ğ”\ì=\È\Ş\Ïa„ \àx™J¾¦§±|Jj\ê\ã_\Ë|¢Ue\áÉ—=£¹aM:\Õ2\åùé‡„Ç¯J\è‡Qp*\ì‹\í™a¸bbs5*Ó‰Šÿ\0>ŒJuÒ¡\íônù¯W1¹R5\ÂS˜?X\ÍñBv~\Ñ%+° ~©\í2šA\Ğôbò\î5,\äj¤8¨%\r\é˜\Ş\\Áš•(\ê#®¤Û«ü·\Êdb\É}\Éf¢«\ØvJ\äa5\ÊQ^c\\\ĞñXZ\Â\İN\éøLÍ•\ã¶\È4m\î°^«\æ.;	–5³\æ,®\Ñ{C\ÚW»51G	G|\Ç5º\Ô+Z\Ç\ËM\İqJ\Ô<ôa÷E“÷\âk\êc#Ár»Xˆ\×yûSãƒ¼ı—\Ì>òÿ\0\ÉÆº7\æ\ã‡fógJË¨€..¡m¨\Ø\Âw§ùAÏ°#d­æ‘ª·•bM¾\Ã\á\Şc¢Xn\áx›ƒ³[‚]È–\ßGGg¤Ó”/¿3‚>-J€›õ¿ª–şÚšAúT\Zhx”\ß>e*8âºP¬Y‰cWGyf¾¯ƒºË†N#kÎ“:¨\ØV³Z<Ê\×\0\ÕùC§\Å\Ô\Ğ$ \Õ>e\à\ÑQ#õ-Ä·¦Œ3\àŸ\ÜÁ\Å}Ò˜\Ò=Z€:g\æ`P>\ær›¹FU–¥¦!T\í(¢‚\ÑEúK¤\ÊYX¦Á\ÄÁ\Üì‰¼\Â\Ãvv‚ú&³tt/if˜aT*\ËZÿ\0l¥–Ÿ½DŠğt{K÷–¨†,«—\Ö\ã9Á_<“)T+(ƒ¨¦LjF_h\Zdˆ‘£uõER¿!\ã¯ò£¤—\Ş&²°\àŠø¦Á\Ô@K<\ãpĞ•\Ì\Ô_¤2œ<\ÌÁÅ©U‰TYx\È\Ìhhö•\Ñ\ß0ß°8‰Wÿ\0\'œ™õL\Ï2\ÌxO1¬ò\Ïy\ßş¥™\Şj<>ƒ©\àe„\Ú\çª\Ö}¢W¾Š‰–\æ¦\ÈP\ÙrbY]ğ÷‡\0A˜‚¢\Ğ16ñx\rÁF\0-=\â­k¶‘´Œ\Ø7òŠ>Gª\İ4Šv\Ü\0Œ\'«Ø¹¤¹q‰aL<E¼šUó©zMö¡–³lv¾„pÁN¥\rğ\Äs\Ç¬ôÿ\0\Ìİ¡A‚—R\Ô\ï!q‹Ü ¿(#‘{\í\r\Ğó\ÚcO„ƒ6»½ N=½á€—W¶W-S\Ş[\Ò–\î\nğb;½ƒ[yåŒ•mw3\ÕuI~l«¿üN¿Ş ]\ÓXp\"¤`b\æÿ\0Cñô\rK;\Â0m³p–À*)´¿9‹f\ŞX¼	0›C-¸\Èh\à\nVØ \ÌÔ ùJ7mj\åù\íyo\Z>˜[|Æ«¢T)‡¡’\é]YÀG/ıK¹.\İ7õ\ß\Òô\ç\ìˆ#R\í\ÃU½ûJ[Ağ`GP\î0\éQñ(¦q_’h{\íbt;&ERE/™j‡p”\08b.\Ê^k¼º)\íp) \ÉY&D\â\0¼\ï±³\Ò±¿T®]L<üK»™§´V\ÙFV†T¢©\Ôh_¢\n<ÌY\Ó/C41ÿ\0‘¶\Ó\Ï\ÑPW\Ósy‰m€¬úÀ«ø\n…Ü³\Ì\ä^£y”aE{bj¸dj§P÷¦¼s-Kš\ZÁp#¶Z;²™ôq^ı\áQ]\ä`\0ÿ\0¢?\Ìó˜§\ÄfCcSñD\ä\Ôx9—\Ó\ÏñEMN\Î @˜Á\Äw¤IP37N?\ápnTÙ„A\ä‹0³Z¹x \ÍZñ\Å\é\ëÁ…_öŠ!\Å\æ¡\à§wl9Öe\ZS\Í\Æ7¸ú ¸‰\î;c¾\ÓWf\Ò2\ÂVi¾ğ\É\\\ç3/R*Õ«õp~½Aˆ”•–Ç™W¿´\ßş\ÂBÕ¶\Òõ\'ena\nOh9U\äKÑ¹n9„7Cò˜Áºg8Šn•\â‹˜«l„+ƒ™œr\í¢$¡‚\\i\×\ŞQ\çõj_7Coÿ\0R\à²\âœÿ\0Ài™A\Óqf0!Na¨\ãz\Åÿ\0&¥­Ipü<\Íu\å\Ü\Ü\ÉK±bŒ¤\â]	_´C±\ç5…²°LSö¥¬\Ñ^€ŠJcÁ(—U¹dF1‰¥\Ã\r Ø¾\ĞR\å§h~\ÏÖ´\è.c\â\Üú\ÊÑ\ÛL\'t\Ü4/\Å\"Õ§\Ï¦\Öİ \n\å\Â\Ô)n‹{©t’’ü\ËEMKfóH7\İ\ÌRp·\ÖE\î¯D\r	Ø°\æ$,û‰\r%nö÷õ–=Oü˜\Ù^H\î\Èt`šÑ¼8IX•™²W\ÆT1\Í\àŒT\ÄØœ\nTı\å‡…g^‘ =~!›/Am\ê$1mûJ\æ1\ÇFK\'2dzce\ç¼&\è\Å0³t±ƒ™ÿ\0R…˜ñ\á0”\Ü¦\è&*\î½B¾”\î8ƒIi7}F Á\ÓtÍ†eP‡\Õã´¡&l‘Z‰L7‰;4b(U8¨µ 4«†\Ï\"¥‹(÷\â\"–s½Ê bax€\Âò\Ëª}Ñ¿\ÅL®}Šu,º¶¥\êÀA\é¸\Â?É®‹\"­ƒ‰™w8Bı1_D\Å\Zxú‘E\Ûñ\Ğxóÿ\0J\ëO\æY\ß\è†õ\ë\æn\Ğ\å‰\æ¾·*\0šqÌ¾$ºz\\À_Y\Ï>²Œ\×)’£\ÂÌ »q\ì4&P›\Ğ \æ\ê\ë^=¥Rm\Òo\Î\Ã3\éQ\ZK¾ğó\Ì*HVGR„¥Ó³“\éX™¨*\rS¼v\Â\Øw{ú…\î€\æ\Ñ\Ü()ˆ­œ·bw0ºÀ\Ê_†YôS%u]9¹–ÁD\È\Ù£W”\Êbd¬ñ\Êö3%l‰zğE˜2ú¿\ËQ\'(Ë\ÜW¾œÀ„*\é\Öm3|\â{\Ù\â_ë‹—Gÿ\0p) ±©sX\Ş\å÷™ÿ\0ºb\ë\íevP\Çlôp.`\Õ8Ÿœc}zø…«¢;Ö¾·ˆ\àt…Ö‰Az¯ˆ\0U]h|EiGbB\ß\æS	Ö¡\\\Ğ\×-7\r#&#ì‚œ‡),%©\îK\Ód*ËˆA\ìÍ\Ú+£\Ó<¿K©µ3Û´[	·¿6…J—Jõ˜s,¢òh\ê\ÒLƒ‚HÆ·G™|*\Ì.QB\Ê\Ï#DJô\æT½Í£\Ğ+ûD¢¥‚lÁ32›3\n†\ãu\âÛ‹F«u¸®·\å\é\Ğû\é‹.j\å¨\ÃOO¢úš\Ô*-)\Ü\â^`jnAMøF&z\ÅÈ™I\Å~É‚4\Ò*\æŸyÁYõ‰˜“}e>{;\å´x•sœ\Ün;Ú–Yù)fV¹\äö…½\Ì\î(U]ó\ï}\'–)K£ú‚rX8\Åx†Ï³Oñ+h\æ	w\æQII¥\í0\Ş\æ`]‹r\îUw\ÈdŠ]S’ÿ\0\ê$¶\'/=§}\Ä^ğ)€n›e-\Şö!3U‡\ïˆ\í<¨\é\á³\ÖU*˜ùš¹]s\ŞQ\nP\ÎUœ\ßhş\Û\rrğ%P(\\Vx½dõª\Ò\İ\ÉŒû„\ßm™ª‚ÛŒ_?š\\\Û\é¸ÿ\034ıWXÁCmø•2\Ñ©af¡}<\Âƒ;®h\í\ï@d<…,¬ú\í_,\Ôo{>\Äû\ï\r\Íü\Ì[â‰™ƒi+Ë–%\âQİ¬\àn\ã7™\Üc¦\Ãnù„¥6\ìMvM\İD\æİ²|¼AB^®\äN9\æ\Óü”iZ\Û\n<¥	u =\'i;\Ä\Âm¥!ùUÂ‘b\ŞÓ‹‚½Lšıú\ÈJR°ç´¯¡P\"=ŒND\ËQÑ—´I\Ûj¡Hv\ŞÉ˜\Ø\Øl%\n™\Õ28×‹÷ŠÁ¯n	©]?\ìª\á\æG.\Í\àb/Q›ª\Ñ{Tqq\Z³Bÿ\0\Å=\ëÕ¬·gE\æˆç™Œ\Ï0Ä±[”†Z\Ü\Ä\ï_¹!{ø\å\í6\î\"ŠÆ¿3q´_\Ñ!\ÈT4KUS¨P&Ÿ>%=Š\åœ–mƒ†¢n\ê¬a\Åu\Ú\\\âİ®7›?™Ã’•\ÚWwiö\n@Sº\è`•Ja¨i+vV£z#]¡vxe\rqñ(3\Ş\\f{L\Í\ÆmZó”+±úó\İúõ•º¿\ë\Ö\'öÿ\0b:»ûó\Zm\É\Üşı`üÿ\0^°~_¯YO\Óı˜óıúÀ\åş½g\è ÀR\Ø\"m÷¾›Ô¾Šø0ƒ´\Ñj1\âp„­\ábXª[QWh\èb\"\Ç~eøn\'¼¨-f \×jƒd1·—\ŞP+\àE—O\Â(±üE_‰\ä_¤|ßˆù?·VüAñöE\Õ\ß\ÂTD\çŸ\Ë\\ \r_\Ú\\¾5J\Â\ZO\ï\Ìz¶ıw‡ªñ	6?öˆ\Ç\ï™W‘\îÿ\0¼\"ƒ|\Æ!_(\Çş\Ò\Æ1\æÒ§/ß¬5\Üıy‚\îıùŒS\Ô(\ÅÌš­µ=\áša\ë<›¢)M\ÅÀ¸f…}\î\Ü\ï¬&³\Ô±û\â>¯õ\é§&\ÈÌ¥\îöø&€yöK»}¿óÿ\0w€U‡?ù—˜_h1\Î!™ó-\Ş(t\Ô\Äc7\èHuÕö˜ı;‘\çöô\Æ\Ä;úÚ†ƒD¹šÁ\0™©›¢aº\ÈÃªªQ˜Y¥\\m†6%@0Tt\å9\êvdsAp^\ÒwE£\n”&ON‘\äˆ\"#L\ã\Ê\"\İ1.\îV\Ân6bXF¹ L\Ñôš\'	y†K–\ÍqÅ©\Ã]*\æmD¬\â*+\Ş\îb!4\è0ñ*Ì¢º-\ÆT§^\ÑÁ0L¢\æ\Z“.¥@\Æ¹\Çi\ÇÏ—\ã!šMK\á“±®rˆq{E6±\Ë\Ş71¯Å¸¶tw‹8*\Ê\äó-\Ã\Ò	Ìªtõ\é0a\àœ-F%¼SÈ©^…#}0€Œ‹\ÜÉ®—.8¦;B©™p½M%:¢S¨Áİ±\ÚTTn¥¸š„Hˆ4]¡`±‚PE\êZ\í\îO+\ŞWƒ\Õ‘\ç2cIˆf/º|Àˆ\ÌBª…\"ZR\à‹\\ó™=B\âu]Ì­Å½Ş®	5\Ò\å\Â)\ZfJS‚\Zt\Ç3\å\Z‹\Ø\\O\×V\É,Š5P—ƒ#\îTÀ.&\äÛ®_37S\È8‡‡2•µ¹™\Í»—«Ó”k¸\ÄGKR“GE‚TS\0\Ó\âY,L\Ã2!sgp\Ü\r“A\Ğ\Â2’ŒÀeWP²YÖ–!÷e\ÑØ¾òØ£+F¦Rµ/¯¹\Úf62óo‰A¦´£²œ³jšƒ-%§\ç\Ì\Ä]j¬\ËÜ†©Á)i¨\Ø9<Ã¹h\ÌÁ\Ô\áÕ°…\Ä(ºzB¬2d–¡>±\ër\å\Å\ÄÑŒ­\ÇDMÌ¸4v”1÷\Ë\É\ÌU@{G/€\Û<)»T@©“R\ÇFe¨\ï×ˆ­i”b1\ï\Z°`§7cƒB\ÌˆĞƒ’rP;0¤òˆa<Dq©œ–SL\à¨ØŒK\ÏJ\ÎõqXY½tc[ƒ¶^ œÆ¹\ËÌ¹§|j»¨öw\Ù\Şg‡£\æ÷l\ë\Ì\Ê\×$U7c\ârûJf¬§{\Ü\ÙPB\ÔC™[¨†¡ƒÒ¬KK®„\Ósß¢\Âı\ë©\"Í¡,&£MÃ“Ÿ&\àE^\Ä[4\Ä+İ—©ù\ÇX\×$]ŒtP%ûK&LubdJ—1>`ĞšƒW§g«\ÊòeJDE\Z\é}\Ù\ÊB\Úa\å\Zbñ}\Ã\ã\ä³C)Ì¢5]Àd\ê$\Â\Òñ\Ór«½‰”×¡\Ûp$Jq‰¸Y¨u\âºœı\æ¾ğÀ™jk\Ø\Z\âR¬gP\ä€j\å\Ó\ã%\ä™\ä\æX™r‰R˜\ÌcRó)ƒQš¦®†²ú¿I\Ú‰\ÜZ‡¶\ãg\İy–l¹œ\Ùm°qW(À:Š˜ªHˆ\ÉFbd”\Ã\ÏNS ”\åb\\°\Å	\æy!„\Z\\H\Ê$\äõ\Ã¸H´w“’¹¶\ÇEEPºœ\Î ¤Xğ\ÔW‘\Üa¬9”h\ï=\Ì\ÏI¡X‚Z\Ôï°›\Ìñ\Êø™±A˜¢\ç3¾Ã±¿Xõñ7½\Æd\Ü	W¾£(õ™(\è•5&®†¿Eı\0xA“\Ş\àZ\Ê\çò\ê9¦b\\Q+¡#Eø\æ\ZjT\Ø@£Y”ö‹5\n“œ\ÅFT\ï/İ”iKÔ±\ÔÂµ= ˜\Ò[/¡\Ğ L²ZL¥!3\rA—)}3§1.\ï\Ì³ö\âU\r\Æ;\å¢\0^¥U	J‰TD:¬÷ˆE \\Lpü\Ë\Ö\íc\Ñ\æ<\Şl‡‚ ¨]\Ô@%Ì£’sQ´šg¦0kê¿¤\×\Ä+sF®3ˆ\ç²zªb\Z\è\Ä\ÇH‚\'IˆÖœcm;Ê…]Fª\Z\ÜÄ¨‘\é:’ğœCt\'{F}w3f\\\ï\í472Qv(e\Û\ìE\à\×y‰˜\éqc\Ò\å•L\êd\Ã,L!\Ö\æÓƒ\æ)Ô¦B\å2/hûÁ¥p\Îb¿Y¹\rz\r·¨+”™˜\æ…0jbó¹Ptç‹.\ã¢\á+/A\ÒE¶>Àµ\0óü¦\æ[—\0Ô¶H†Q;E‹’Q\ë‹\Ğa£¢y†.\"¢\ãË²0‰Aešˆõ)X6(i¯\Ò7ˆr3„zdˆ­œ\ÃsJ %›\è+=-i\Z\î=9š§I¯\ä ¶IÀ<0|\Å^:7q¨“Ñ˜Z‰ª\rfXEL\Ìfwğº„Z©ºn1¥Rh%ˆ\ä8‹2\âÅ‡ A¹,H\ÉÑ…•\èG¬\'9”´fG¦\ã\Ù„\É\Õ\Ã@G\Âfb4•\ÕÅ–Na8JœAƒ\Ø%Y¦q‹¸»b=\æP	I³Ñœt“3\\zs\ëÓ¡§V(öE±f\ÅW\Òo§\Ù\ZÂ®‡œEMB\×ˆµ’¶sœP\â»+WøGR\é-r\å\å\\õ\07‘rŒz€³·\ÇF(e\â*\'‘”fõe•\É\èDÑ4n³yŸ\Ôyj? —\è¦O’È°\åz„óaWûŠˆu<©*¿3(=¦Ÿû˜N 2¤v€¨Á–`>3–ˆ:\r³\ÇHC_?HM@\Ô%}\Z\ë´\ê\è-l˜d€\0®¢C3’8ú@K\Şªd„\åf.\ÊüL*8Nf.a²\é_Ã¤E—q\ni—š§‰\èY‚`ò‘\î–e0=¢»ƒ\ÙO¼\èøz6(0P\Â(\Ò\Ş\Åb\ZÌ©Px€\å}!j¸b¾uNq\ê	\ÃeU«\Ås¶\ìzˆ\Ìq\Ô\è0}	\Åş3sku\êlˆ=D#)‹Ä¨rb\è­\æ“W\Ğræ†\Ğ\Ô:’\åõš@˜—¸0Y„R!ö$R½j¿´½m+\0„jø\ÅlÀ÷!\Ì\ÓW2—DÍ´-{\Ë\Ö\r\Õ\ÅÁ(h|™£/E0»\Şÿ\0„\ãQˆ¶³¹\å¼C=RV%E0LZ~`jV\0\Ç\Òê¨–Yüavf¥	»Eö&ã•	2d \Ã\Ñ?,\Zı\È+Ü”£ı–şß˜\n5;(”õğ\ê\ÚbV©}!\Éã—•*!\n¡¸Š1…\rÀŠ\Ç@\Æm5u#Ô•8M&²¥Ki1	P\É\Ól¥\Æ ÿ\0\ê†\Âÿ\0˜ \İ÷L¥\Ì	Kƒ÷—s¦tXP. ­L—hÀvş¸\ËX\ÎD\ãF16úk†£3w\Â\rs’İ¢&`–B\ï\0E£g•÷ˆ	¿\Æµ­J«*Tz.»¥R«kü„|P™\Ûd~%p¥\àó\å–\0fffÒ¢ğ!¬É¤Â“úÊ®¡7ô±\Ëƒ\ÎQ1ô:(š™‚g>–•G}\Ía\ÓR2.[™½\0$\Ô\Å\\!‘)t\Ã\Ì\á›\Ò\ÄÀ\é`‘\á(ò\îT\Ş\ïJúHÅ¶1KÁù—r b¶>Œ\Ê<0(\í\ê\Z\èRÉ‚.7¯1\ÏJ•k\ÄÀœ\ç˜ $@¡–s\ÔÁ®\è•X”ş€!¨nU\Çÿ\0¯1xPB-/kI¼\îú\ÄözV\ìDb\\¸°3\ä”+\ÔTó€@\í\r\Îş¬„q\Ò\âÃ½\Çi5!\Ñ\Ğó‰—\èM:.\ê\Ü>qŠ»ªû\ËX1eŒ•½É®ÏˆIT\Ï	j,\Ğ\×t\Ğ\à%!x\\±ˆ™&\à—\äMöq\Ö\åS;A„¤t\Z†4È™Š,N\İ\\¦3\0­¾&³\nAµ]ô-t\ëNIF¥\ÌûNb°…˜©fÀ÷	G\Ñc*TÛ®f\'‰\åŒ\ÊN\ÓD\Î@š‚¦˜Â£‚!­u¬\ÆIfX–\\\rLS)V¹‡Á\É6!F{%†rŠÀS\Ş\0\Ò#1\ëòA°óg‘\ä\âhÌ½\Æ€†À\×ğw—€\Ë0\ê²*Cnz@\á…ôÈ9’› \êzUDÉ™À\Ú\âË—ˆ±Ô¦8s*‹8ŠŠ\Ó6\0L\èWQô¸=]Ã­ø••.””\Æ\0„kO¼3ñ’½\å\ë3A^r„5‚ô»gš%„ \æ,!‡\æ7\éVq\Ü{\ë£}Yl_|\Â:oö›´fe½â¸¦\r\É1ST\"—W.\ÕV.e‚óôG(^,ŒC+waSúfÁ_\Şyf`<ˆ±\Çr*3‹¡°‚\ß#.,\Õ\Å\ê[6\æ’”\áZ„g\Ên¶]0\Ç,\ìM\ã«ôÌ§¼-“Q*YG7y‡­\Ìhç¬¬¤Ğˆ0qU\ÑXvT¤+S= \"$a	œ\Æ\Ã\Z\"Yµ¨z\é¤I\ÄÎ“*Œ\ç#\á¬O:\î.ôs\Ğ\n\æ$²¾³¦\n`¿0d:X\"ˆC`G$qs\Ã\ŞÀÁ;\Ä\àL©À\Ë\ÌÏ¾Ëœ¡Œ\æ>„ü eG=\çeCñ\0\äÓ’,¸\Æ¡\ÊY\Æ¹¹÷\Ô\n y\\\r¸uVM\Æ\ãN\å1ğ\Z\"<\Í/\'0\ÃD2¹~‡w¢¤*TÓ¡a]U\Â\ê4\İEÁ\Ñ„(¤¢9\r\Ë\á\Ï@\Ä˜\ß?36(òKS‡C¼°\É8Ô §ß‹`¥ZoñyÁ¨u]\ëø.\"Ô¿+1P	„2%\âo¦\Ì}¨4œ~&‰¸€?²†]&ò©kû\ÈŒ­\îQ¡\Zœ‘oq\Üs™JŒ#2qúœE\êt\ÌR\ÒXòŒò:zK¬\Í\Ğ\ëÌ£Ì\Ô$¯x$sOo8õz\èƒ\Å\ÜL\ÂÒ¦nnAb\Ü*Šú/2\åÁ\'yƒb=J¹q‹\éS—h¥Ìˆ,T5˜f\æ9ª®\\Š0\Ò-™‚œTR\Îr¼\ÍòP’\Å\ètbY[n‡\Ğ}\ZT»˜i’Å²½-d[\èkrº›\0Œv^\Ä\n€x–sz%eñE\è}—öx‚[º=:¤Û®b’.î˜£\Ê+ \Ø9¡+—h\Æ1sQ÷XÍ ©™\ë\rJ\åx”ôT¡•¾§hÀÀÀ˜¤9´]ƒ[C«ˆ\Æ\\º„¡¶f\n\Å\ï\ÇHò™“6\Ê”±¯$%CI\Ş¸˜&n\"\î\0¥\Ë\Ó\Ê\è\ßØ’&¹rú/‹\è1‰ŒAµÔ‘j;„N90\è\0†\ÉNK¾\'ªE\ÌX£\Ò\åô;Š`Š\\\Üû¼Ë»Júpa3—(#=!\È\ÄÇ…=ZpB#˜J\è\ä•\Ä8›L\å¸\é¸É³¡K¸3Ds3è†›ƒ`\İ#\ØQ¥Ëºğ¬ /ş\á\Ğ\Úh‡8o\ì\Ë\î^\ä\0—UxBñE2ô\ßÎ˜\Ë!\×HT\Ô\å¦[;ód…Ü˜ˆf¢Á¨0C!…i\Îb\Çqc\Ñ\ß\ÒW\èÍ‘^›\nú¡\Ø\Ì\æd§Q»\Ç\Î%\Ì upw–£”#\Ñ\éz‚\Ö«(„©]ã‰§\Ì\ŞQ(ºL\ìŒ\n)»¦°7yr¦]\Õ<iz7­\ĞZŒ\Çw\"1‡gi¸ó™§@_B°5\Â:\ßAµ\Ç\Ä1C\Ú ¶wÓ˜†\\Á\r\ËL«QJ”ˆG\Æ8\ÆvùL\Ù\Ó“58›tz;\èôT]i\å¨\í\êŠIñ\ï>“>e±¤\ãS-òz¦_\ÄN8\Z\"©L\Å= M‘\èÊ™¸.\á\ÇŠ#\Õ\Ô$Fx²h\Âû†_®\â^ö\Í\å\ç§N>Ss7ƒ\Ì\Ô-\î\Å~£v\êgÊ›\"\Æ\Ã1Œ\Z\Ü+\Ùl›…!lw\â\n\èuY}\Z¥-şğ†\ìJ·\ÓD€œ \Ø\é-\Î«k“S˜¶d¾\Ğl&\İ8úF*ƒ\Ğt©tf¹ú\Ğó?h¶…\à·\Ä\â+5*‚[Vô*:`hn?7ğ\èÂ·¨\ã¼GñBŠƒ¢#\Ş\'= ª™¥´\è=vDC=Ø±eı+A¹†È¬¦oìŸˆIT¦r¨şû&UŸy°Ÿ2\àB9ˆnWC«¾¥Ê†ƒ0Ô›Œ’ø»\Üu˜2\Zœ¢Yô¾Fx\ÎDXe—¥\ÔÊ•Òº7‹1S¨‚z†Orø‡\Ş1\Üo,ù.aÑ”$b<\É\ĞÀõ\Ë\nÓœ¥õd”,Q\âo\ÌÔ‡\ÜJ$ma”•\áĞM\ÍArZD¢\\_¬\Ù\ê\Æeì…ª½ôÍA\â\èú7/ˆ›.8\â´\ÎVbıap\è:n	qSÃ±+Q 55dR;„8ˆ‡c¢m³8oô¤®€†\á1WV\ÃPq/¿S¥fWB!\é\r \è\Êe¥C¡peX\Ä{ˆ¸™\"¼\Ïc6¾CÅ–dº\ÄJ}b\Çø=Xô3‰‰!G˜š`\íØ°]\ì@\ÂË¯¤t\Îaƒé¾ó[d…_@\áWQ€\ÇlO3qhc¿31újT\É+0—Yˆ²_G\Ò`EjÇ§S u®‰”}\éq‰L\Ã\Ò$CÇ¨\Ø2¶(1©q.M\ÔšF›¨o+5u¨ıB±8\Äcœ\×M!†‘.#¢¦rüfµ\Ñv\Ôh\èKWôÏ´^—\ÒúXƒ‹\Ü,¼\å†	c]¢·§½ºƒ\ëÃ§¦?EEw– s38]u:?HŠGB9Œt\Ì\Û\ÄK8„\ÛR*0Ü¦f±š¡\ÖsÑÑŸS=z¹›Íª.Ò ¶k£N¯\Ğ¬!´\nô¸órú@Š“)¹–¡«3\Û\èŒ]y.¼D³\ni™—\Óihf\ç¨\è˜#¹\ØE\åš=ñÀš‹\Ôe\Ù0–	„§lb‡#6%¦G\í\æ%ıxÕ\Ñ\ë‰ú=g\èÿ\0I\ã~gúymúyŸ³ı\'ƒûyŸ§ı\'‹ûysú=f\r?O3Àı<\Çõ\Üqı\Ï\İş“ö¤ğ¿O3X_1\ï\×÷é¿¸öÿ\0¿˜Ÿ\Ó\Ì{o\Ó\Ì\ÙG\é\æ=\í\æ~\ß÷Ÿ·ı§‡ûù?\ï\æx¿™ú\Ú¬ş\â?C\ï	¿\İ\ë?WúO\İş“\Åı<\Ï\İş\Ó÷ÿ\0¼ğo0¦¿W¼%?nóöÿ\0´ı¿\í\0?G\Ş\\\ß\é¹côó?Iÿ\0ag\í\Ş~üÁ¿¿\ïı¿™oõı\ç ?~e\nŠgÿ\0H¯\ìü\Çõ\Üı\ß\é\Üs÷¤ı\ß\é?wúGõ\Ükı\Î\ëõŸ«ı\ç\èÿ\0yú\Şsıû\ÌcS÷\æ~\ï÷Ÿ»ı\ãû\îQ\Ï\ëõ˜_\Ş~\ï÷‡\ìÿ\0¸~÷ûŸ¯ıg\íÿ\0Iû\Ö~¿õ‡\ï¹û?\Ò~ônÿ\0FS\îı9ÿ\0¾\æ>^ñı§÷?WúEo\æ\\^f¾ß§yg4ı;\ÌoÓ¼\Éú~ÿ\0ÿ\0\r\'Q”\É9ÿ\0BñT9¡\Ñ\Ø\èN«u\Êl\Şq²¥\åšÿ\0òÛ½\ÄQG\Ë0G÷rš•\ì~&[û‰ùe<MòJ¼™Â£C¿‘¨\Ğôu¯&·xRº¹;¯¼´\é•\Ù \Ô5«\Ä\Ó/µ?yû¢`y—‹\Ñû]»k1v¾ş’ù\Æ?\ëÛ§“\Ş\ïü\éqD µ\Ó]¢LHd¯ÿ\0f\ãg-0°·\ígè³¿LY\ÚwzZ\à¬\ãg´*D\Òu‹—ù~\İ\0+|\ïhy\èS\ïŸn¿¢\ìÍª¡ñ8?[\ï\æ`)c\r\\\nò\ncª\ÇÕQ\Ú.ª\È6øbe\é¯ı\Ü\\¼\æ;B\åğwV\Ş\Z6=‰ùn\\\ÅXı@\Ş\rmš\\y	\ï¢À;‹‡¸\ï\Z\Í\ÑÓµ\ĞUTXP8\Ïr]\ìJ›„Ğ€Ğ•\ã°a\âÿ\0ƒ\ŞU×“{¸™v¯ÀS÷\ÔM>\È\ìš#J\"z\á\íGBU·\"<Ÿ1X4mL€¦\Şe™d¾Cÿ\0Â•\Ì\Ì#®\ã9\İ(™a‹´s\Z£O\í<‘`\á*{õj4û¥%#\'\îD¡®IF\Ôş\àX\äÿ\0ò˜\ÃD¹\İ{³m¦\àQx» V¿HX\ÃR\à3Û­\îJ­Ó©hù\Ë\Ó\Ûÿ\0Éªl~ô\Ë\Öz wLÄ \ï¼¶aˆ‘5€Gÿ\0©ÿ\Ú\0\0\0\0\0ó\Ï<ó\Î<óO0\ã4ó\Ï<\ã\Í0ó\r<\ãM4\ãN0óM0ÃŒ4ó\r<ó\Ï<ò‰4Á\0I\0¡H\á\Ë°(CEƒO“\0SˆP…0ó\Ï<ó\Ï<ò\Ë<p\Ç0\Ï³\Ï0\Ç,²\Ïó\Ã³\Çr\Ï°\Ï(2\Ç<ó\Ï<ó\ÏÒ£À\Î4#8BGa\n€‹(ró\Ï<ó\Ï<ñ\Ëñ\Ï²\Ë<q\Ã3\Ã<r\Ëq\Çó\Ë<3\Ë,±\Ç,ó\Ï<óÁ ( Š<B	\"8Á›\İ\r÷,¿\Ìl²#\Å ÿ\0ÿ\0ÿ\0½\Ó\èp±\Ôc¶¦Y0@H@‚r?\ÑJ9p#\0\Éÿ\0\Ñm\Ñ\ß<Q„e&\Ùõë£¢s\\\è¬ò“»\ë®n4$\Ã\Â9£B3#»SCL´¯!#šÀWdV\Ö\ÛZ\ìœ\Ù£\í!…\0\Å<R?\æo¶”s<óA(0G6;/ŠşS}ò+§B\äGr\í°\é\ãÂ†1ù\×M\ß@3\å¨š–\ãx´®‰\Ña·(ƒÁ®°*\nI¹—&\æ\0Ú¾ô‡	<—K\Î.\æÅºuõg7c¾\Õ\ĞEh.¯/²l)ıô\rf\Â3\æmó\Ò9\ÇÚ˜±ûwş‡\éñÀG\\\ÑÕ€wj\ëgS\Íx\"=vd9‰÷|«g¦¨™¶Pµs\Z*!‘†\áKA}¦|û½¦xi–[`$¦“¾ë®… …øƒ«¿\Z\Ãû†\Z)‚qŞ‘$ö^\Î%O­—\0\ÆÒ˜3%¸‹3s¤MŒ\"`\0\Ê\ã©w‘š¸„©\Ó\Ö\è\áyø’Œd‰M‚l¦”7E«ˆ@Nˆ«\0\0!„\"\0…¤¾z\Ñö\Ë	ö™ZwKy¨º¤su!C\Ì|$|B….q\Â\Ó)cš.ŸºX»\ÔJ<€Uù…‹À‚É³$\î\Â0\'¤\È\0H‡°š ¼\Şš\ï\ÂÚ±\Ôõ|Š\ÚY\Z°\Ïx‚}dn\ì‚\é\Ñ8 \0\Ñ\rR\Èc;\0LW?\Ñ\0b\Ë(1\ä¡ Y…´O8r\ê òstš`^„©<ƒ_t9„i\ê\Ù&\Ìy­Ñµ[]t\è¸B\Üõ&c?’»=û†N7O4·¢\ÙNò\Ó@]\Ö\â\Ö{}\"\áü“-6× _=Ex€RØ³&(VÃ¨™Ş°ñ\âƒF\Ë/¤–I,M·iš9c~N±##ôZ[‡\ÙÜ¥ƒB:Ò·\êbÖ©s,»3‡\ÊşwYl\Ù\È\Ó\ã¼I7Bim!z¬úOK*3gÎ’34–\ZÈ^öj\0I\Ãû(s\Ï<óÀ\'\ÒhBûw‡ª\'2\Ë\è\İ?‰—)\" W…®\Æ¾$h\Ñ\Ùo<ó\Ï<\î{ilƒ€1¹\n\â¢ˆ¬\İ\íz‚¢\ê¤ô\Õ<Wªó\Ï<ó\Í7\Ù-¾WÜ¬­‚JšŒGsˆğú[—(>Êƒ\á\Å:\ÓO<ó\Ï<nÁ\Í\äb®¶Ñ°S{Y8’€\æ%‚b4gºò…A\â÷Y/\0ó\Ï<ó\Ç97Á,å©5^ó\á•d8ñ:–m\é€n\é\áÈ¿\ËøTr¼¢\Ï<ó\Ï<\é\çM­W*­d\è\Û*%úeL\ìG\í\ë\ê:H#×¦ˆ|ó\Ï<ó\ÅA}€‚G”\Ôb\ß\Õ:\ï\í\áİ‚Ù”,\Ò_:´•u›\Ä/N,\n\å]<ó\Ï<d\Êe\ì;\ã\rN\Ú\Ä:0_uÁ\ÂIP+ô[TŸfcS\\\êG\Ï<ó\ÇZSk¾}\ïjŒ®Á•wÃº¥İ€E›\äaS\ãT¹üó\Ì<È“ğú4Zs\ï	³·»2ú\ä{\Ù\Î\ÇAµM\çV|D\İùµ\é\Í\íu\í|~Ü–ÿ\0­»x\ÔvŞ½G¢\ß*PÖ‹¤\ŞTd\İt\Ç\ZœpJùú{ıd,\Ò9¬ÍCvÈ£Á“»úrÂ‘G\Òòğv¢Mÿ\0û\Ø\ëôô\\nø\Ì\è‰°ß£\íZ\è\ëcj …ş0\Ã\ÆZHmdRİ‡{\rH¸’Ÿşš 5—Á³ò\\\ÈR_~\ÓN0\Ö+#{bun–NQV\ìJ\ë§C\r–œ8	K-³Í­|u…¢]}\ÚB1û7ş=T}W[áŒ¥øL°C¬A\Õúzõø]®š\×-‰j\î«\ä\Şp\Ã[ù\Íù\Üq¹p<qDšİ¼-o¨‘\àfı8/\Ã¹ÁF\èZú\ä\ê1pıwthR0\é\ë\ÏI&ı3K\Ù{\ÉOğ\íkRn4i3B=¯\è89\ïc d•©DS5W9a_EÙ—H4F9Z]e5@²LaLŠÿ\0¼?€ù\n<R]£.”¢ù4´W´ö¥ ‡(\î\á&i\n<|ô\"¹¸´\á\ÛÇˆÁ{§\í\ËX V\ìğ\ë \ç.ı\È\0\Ò©^Ğ°&bÕŒ\Æ\Ğ»;5/w\ïZ1Ò€¢0@	§|G\ë\ê@ó’\Ñq±\é]jc•Á£¿\ÜAşBbø” \Ä\à±\Ú0ˆ–}\ç‚£ÿ\0¹­x\â±\İ\ÛC•G‰\âŸ;ú\Ú ½a¦øK—wBŸUTk\êvµ\Ó’\0z\Î\åm“›õxAh\'ó\\RµT\Z™û+X9Í…ú@¸T§hU1O\æö\Ñ#\Ğj]O724ôŸ‚T‘ºµSC¯$_\ĞÍ*•;Õ¬¥<»7\É\Ï\Ï\Ô\Şh\Ãö2\Z°˜Ø‘\Ñ\çôA\Ü<yfJÎ°Œ\ZöS\ÛÖ¥NHúØ¥¶¥$R&†/|V¢¨ƒ—\áÁ¼ø\å¡p\ç¹\ã,ğs\ãŒ\Ñ\è¡I\Ôp?7\Ó!J8²\Å\Â[¸<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï\Ï4ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ğ»$œpBò\Ç²ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ã-—µ¬<°\Ï,q\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï·G<ó\Å\0\×\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ïÿ\Ä\0&\0\0\0\0\0\0\0!1AQ 0aq@P‘Áp\Ñÿ\Ú\0?ÿ\0\ç¯ñ‹ü_\âÿ\0ø¿\Åş/ñ‹üI\à\ã#Oñ‹ü_\âÕ™\nÄ¹o\â6\Û@_\Ø\02\Ï\Ç?š\0\Â_N\Ù\Zq—\Í\Ã%\ß\á¶\Ûùû`ûe‘=ı9e–Yeœ\ä4œ!óbÈ¿R\Ë \ÖÀ\Î\è\ß\Ğ\ÂÌ\É3õgeœe\ë\Zƒ#Y4“©\ß\'\Ô&\Çd¼™†°ú~õŒ>H\Z{³E\ïôe–Ye–Ye‘Ó®\à\\\î\Ó4†7GÄ‰\'?È‹½²\âdg\Zyú\Ç\Z£%4³/\àWôiiiiiibñ%ñ¯Ÿ1œx\ÎZ·\á\ã‘<\Ë\ä]½;º¯²\Ü8Õ»P¶ğ×ƒ®Mº\È\ÆG^\ÃX³‹ıX´±b\ÛKHş¬}\ÍQ\ìwú·\æÇ‘\Ô\á\Å$	:\â€ü^Î¼’µ´\Ã	¯\Äi8t\Ú’Of4\ê\Ş\í»\äw®2\Ë$»±ö\Û?\\\é—n“õ={\r\ß\à\Â\Ç\Écß‹ †p0\Î\İ,»\Ø\'#$d\Ãm\Z\Å\Ôò`\Âú\Ñÿ\0„qee†\Ø[m.˜º³•¶\î\Òm5~a\ê]u\Ï\Ö\Ñ\Âlq³\ä¿\Ñ$\Èp\êC\É}<õj!Ñ‘\ëÉ§—tŞ¶C¢De\ÎV\Û[x\Öñã¿«ı´\á#~ÀŒ‡ñK£–’/0N\ä\ß&\r“\ÖÀ\î‰÷ğE¤fxyù±ø³«‹\"\\‡}—\'»Xzş/\ã´\ävw\ÂÀû‘½]š\ÏŸ’‘+ŸÃµóœŞ£x\Â\×Ä—–­Zµd_^XaÖ\â\İ-‘„\Ä\Ï	F¾l>%\Élş\×ò\ïn\Ë_›mx\Ë,»-,ƒÕ–ÅxÏ†Vd\Ù<]ÿ\0#¹\ï\éøımÕ“\Õ\ì.J¶1Õ»e\ß\àYeó]ı~Y¨Ş¯·\Õ\ÖK%­¹Áo\è9\Ï\É8\"ñ\Òö\Ë-6\éòn\İ!{y\ÙO_v\Ûø˜\È\Ë:¿\ËcKù\ß\ÆO\ĞFñŸ\î>\í·?\î\Ş6\Ù »»·§\Î\Ë\æ_3§3m:-A·\ëñ|¶z²¶N<v\Éñ-•\Ë\Ú,‰\ëmx\ê\Å2]¬²\Ï\Ãmze\İ‰€\ã\Æ\é\îE ;ğ<o\î\Øü\ß\Ò>\Ëû7õŸµµ÷k\îÕ¯»_v¾[_v¾\á\Ç\ŞƒiO^r\ËR>¬}_\ÂG\Ô}>¬}Xú¿„\ãğ,<Yo^2\Îú_\Ê\áaûDÉó¼ˆµˆ\è9\Şr\Ë?_\\\ï;\Æs¿l	i\Ü:6\Û\Î\Ù\Â^wò\'Œo\åfF2~\Ìü3–\íz ù€ùkó‹&N\î§x\Ëm#õ\Ìl?R\"ö8O\Øq¼\ä\çS\×	S»³Ë£¨|üÎ»‰¬¶ö\ê\Ë\æx\ïõ7‹§ú\Ë\ÏS\åœ÷o\Ç\Ë–\èw\0=²5„2.ºğ¶\Ûoú™ü“õd7…‡\Ö]õ\'õbÿ\0V¾\íZµÅ¿«_Vş¯	»\ÆiGV‹8t²K,³ƒ\r\ã8l\Ñ\Â\ØH\ÈÀ\×|~­-.®­±ói`¾‰m¶7\Ù;]ŒzB|X\ç\â³÷\ÇV­\í®^–Ámpq2xf\Ş\'\íú‚\Ç\â\Ï\å›ñe–<	3œ»mıŞ—“g\Éı_\î\ßİ¿»_p§¼…\ã\ã#\Îö]o =Y^ò{-oHGN\0;ÛŸûqŸV–Ÿ€+m·@–1\r,–­]‘·s\Ç\Ï]¬Y\Z\à\'\è‡\áÎ§õ&õi\é\0t°\èG\É\ß\Â]ƒ:\à\îòşğ\Æ\Å6|@\Îk\Ô+{\êQ\"rY\Æ~@ôûÁÑ™/L­8zt´;ùƒó3C°:N]\Ğw2\Ì\êO¨I\ç¦\Î·gQ\Ù\Ók;´õ÷½H	D\Ä~€>föõ\Ë½C¿—cX’A\ÄC¿b\íóA‚ñ\Èò{€\Ì`,\ë¦\\°\\º8\Ûøm‹wö0\å‰wŸ“//gmÑ‚Ÿ2‡|rò\Î=^\È\ZH\Ç\ÄË®\Ë\è\æ\Ë\å!O«g_µ’òõ,Õ¡oñ\Ø\'\ê$w^K»:{öô\Ë\ÄYg)0\Ø~!g¹v[^\Î\í>\'\éÜ»ûõoI¬9\ä#\ÆÄ¦°uó&{\Ò\ß\ÚA\ÃÜ£¶QÕ¤u\ìå¥¼$øB\Ùü\È\Í\İı\í\ßc\Ç\É÷bÁbÅ‰â¿µˆ\ï»,ybC\Ò~›]™66tx\íüµmB@º[u¶ßˆl¢Ûœ.†OkM\Ïa\'>FV¯I©²Cb\×İ‰—FHØ“¨\ß(›¡6\Å\Ô6\ÛÀœ|q¶\Û\ÆXe¶\Ó\\:\"8˜~/-‹%\Ëg˜\á\×»\áƒugxk#\Ñù‡\à!ù€\ë%!\\”ò\Ì\ë”Š\îÔXHø²\êğ»\ï›\Ä„ÁòHY\'\Äõ&\Äz†]~¾\ĞÈ² \ÂOpğq‹0‡\r\ÉwÏ‹½\ï…\ïƒØ¼–\Ù\"NH\çWû.¿Y\î<¼ˆo´\Ş\ß?ˆÓ‹0Qøº²\Âù‡c¦YX…\×\Ë1†1\ÍA/XX¼z\ã\ŞW‡x\Ş1\êÁ`¶.\Ä;ü	\çğVot½\Â3ˆ}Œ\0$|2e®ÁnHÜ›3\ã¨öm†÷Áo%¶o\Ú{~‹oòLe\Ô\ËOVK#†Á\ç]”Ó—x_p\ĞÁ!±›w˜Yw:a,Ó¹D?Sg,\Í\à\á€³\Ñû”š´9a:˜¶ó,\Üõ?ƒ\ï.‡\à›t\à\Æ\Üm€\à\á½`B\Ë:\Ò=¬@›BLó„|¾\Ëft@ş \Ë\Ğ\ÛU§²\"|ÎŞ²]\ÚBí·‘`AjH8\İ;„\áoyY	¶\È%\Â»ìŒº³“yz™\çs?‰=!O\Ù?e½\Î£¸a‘wc´¾g®\Û\ÏÅ‚\É\Ù.\Ã\'\ÎI(\Ùj²Ş ùdQƒ·°ÿ\0\Ü!\í<œ\Ï’\Û-¾e¿€oDqNˆwe,@za²²:”û\ã,\ã\×Á\"Ÿg\Ép\ÖRõ>–,ˆ„\îİ‘\ße­§L\Î-:#È…\ÖVŞğ~&+Œ\ä÷l˜û\É2\Ælü!	\î\Û`\ØiOWF\È\Í†v_K\Ë7¸\ê\'²L²Õ’;d\ç«\â–8~Wõ\r\ãõ\Z\å?4ZFx\èø“{€ò]÷ñ\Â\Æ\ÒEºLµ¶Xğ;\×?HKŞ‚\è\êF\Ş\í\ÛR\äª!\Ã+\Ü\ë©\Ä	°\ë,À<»ı´‹\ådt\ÊûúV\Ú=ˆ\éÁ\'W\ëxÙ·I!ÀüIÕ¼.[¶Í\êwf\è@±{\ã9ıö\'v\È]$<\Èì³€\ìùø	Ã½.úu\ËC\ËBÈ¶şyÿ\0\ÄKfÍ‹0KlYbn6,\Íó=\Ùa\0³ÿ\0@\Ö\ìü_K\ÏúÅ€{\0ø½B\ÏO˜€_üX¯õz»‰ÿ\0\İ\Ñÿ\0\í\ê¿ø–O›ovüX+-›·\çòúŸ\äA–/÷_\ÇCOIô›W\Çü¯ÿ\Ä\0&\0\0\0\0\0\0\0!1 AQaq0@P‘¡\Ñpÿ\Ú\0?ÿ\0÷¯\îşÿ\0õwõwõWõwõpú\à…|Ÿ\Õı_\ÕıXµd¹r\ìø¬\á–Ye–Ye–Ae–|3\á¼m¶ñ¶\Ûm\ÙHº\Ê°7%§am¶Û§%op\Èò÷?-ø®¶\å¨\Çm\çy\Ûxõ™³»^\Ùcm—­´v\í´rgŒ–\Ë\Ç\npt\Ãşm¶\Ûo\r¶\Ùv½]7E¤—¬\È~gN\ZYôO\ê\'¯ş’¡V\Òu>\ãxÿ\0\r¶\Ûm¶\Ûm¶n‡\×\0}³\êK\ï±\Æo\ÜK5˜;r<\ã&\Ë8\Ë/|Ov¡°¶_\Äo\íş\Úá¯€s\Ó#÷\ã\'D\Ëdc\ïD„ƒ‘\ä¬}\Ë9E\ç’V»`\ã.­.®­-º°°³€w\Ù\ï²~–ŠÚ²\Ë,±·öJú >Àgô¿ˆt\Ë^\ìGs;f*p´Ÿ,ûK8\åKÀ™vÙ»OVq„ud™\Çó‹«©X\Îî½—¸…q;+P>\î¶8/\â6yÂ¶X0‹Ù´{ü\Ü\ã™a\Âö\Î2Ë¾;ùe‹Gµòè\È\Äi0\ë¨ı\àÁ\ëƒŸ¼\à‹„C/¨,·:±Ü‚ˆYû÷œ²\Â\ém\ç\Ç,·-\ÖûÈ\Ş·|‚Ë¢RË¤[=ZıI3~)¦6X¾\ÃRğŸ\Ë[¶\ÖïŒ²\Î\0™bÈƒ‡\ß\Ôw\Âvu;ŸYËºm–|û\ãÏ-øw\Â\êË²\Ä%\ï\áœ-²ú\áºÀ¸\Ém\ä`\ãm´d½\ì\Èü\Ûğ\Û8^H—Ya\Ãe‡Õ¶\Ûdõo|1<6–\Û6òš@K\İÍ¾c\âq¿\æ„&fK¶\Û.ñ®\Z\ÜÏÁ¿V¶\Ë\ê{„G\Í\ßõ\Û³3\Î6Àı’\ìÍˆu÷,zƒö_B\İ\ê\ŞWÔ­\Ó=‚ù7\İı°†û±ùña¤~EüX7ƒ°³\æ4\ï„\ê\Ç:Õ€Hl‰\Ãm\ã`\á\ß!´°A÷-xz¼¿\Äi–gVO´\à\äƒñx\Û,;†œKŞ­öIš˜u\É\n1o\Ën°¶ú°úœ#ñ_ªO\Ù<ƒ\í\Äg\â`òú°\Ü\É­\êG\Ù~ˆœí­¯Ì»\Ó~\Éüƒ\Ö\Õ\ë~\Æı\íûö7\îµùµkók=°º<µkókókó~\ë÷_²\×\æ\Æl¶ı~[Üûa\è°\ß`û´û±5[¿¸¥²:\âZ®\Ş[”r¯\Ì…\Ì\İ|±aq™wõ	·÷+:°\ëƒG»Ä¨u\'°Cm}d\Éú¾\Ñ„¤ö\î\×Õ§»\Ö\î:\Î>>¡o4 <¼\È,\å@\êQİ»Y›n\Åk/\æ\è½\êr„=ŸW\ít;l\0»0ô¶!Ô‰\Üy¸J†l³o>£ÕœL8Jµ$-xN\ìGošN£Qˆ°_.\Â\ï\îÔ©ƒ82{²\éÕ³P¼\Û–»+ø—¶‰\Ï[M\ãy=¼pq\î\Ñj\Ë-n\Ë\ÔGø]`¼“\Ähwd`Zzn³¸M:½…ŸM‚t\ÌX\ÂÛ¿s«Ã»\ì¶BŠ°Bv\Ïlød{¬‚\é\Û1z‹\rú»\Şx<ÿ\0¬còG\Ğ\Ï\ĞÀûl6\'V\ìôÇ \àv\è¶e\ê\Æ[(aİ¸{Ñ¸wb!ş:´`ô8\Éag\ÎG«7¾Mµ:··\Ô\àóüXü\Ú[g`¹:õ\ŞÕ“¤¨õ\'«\0\É\Ô×ƒ8±xÄ‚ú”±\äi\ÆIÀ¾ ºGIë¨²X\ì;Û¥\ãxñş\ÔOø»M\r±ø—\ï/\âqõc<\ßø\Ûu1Û»F!Ç‚‘Ÿˆ\ß\Ì?•S\Ò\Öö_Vu2lü\r\Õ\à\î\Ã+\àÛŸH\Ñÿ\0œ“\èQëŸ»&Ÿ’ûò\ê\Ë!Œ\Ï\îqga#¢0³¦DûºHCCû¾¯©OM¨˜}\ßa\Æ\Æ]­»•e\ãü=öú‡ö]:±”0\È{3eOòLzĞ™\ëë—­»r<[\ÜWgK÷±e}Iô±©¢\Ì;\ã\Ìum¿\Ù\Î\Ë8B\0û~¶g\Ìó„ÿ\0Ìì–µ@\èû~–Ê¿’ ³ïŒ–!£­\î\ìpòĞ´\Êt]yÁ‰\ßrQoüR\Å\ä½pD\ã\ì™òd†Åûo¹£gc:ZNOÀY\ë&\â7K\ç\Ï\ÙüÀu9ug@\Î™f‘\à‹.ù…\ì™\åšNp?s+	}œ¥³\ïœÓ†z#_´gÕ¯\ê1\'=’\Î\Òp0lCı6{²ÈŸ!¸mŸ\íı£œ\ØMÚ“ş6~\ÃÀ¸\Ûx%:õ,q:‡|’»:Z\\l\à“†K\á\Ôg\í¶,²\Ëp±÷b\çq\é¿‹pH5/e>\ÂúĞ‹\í\ê·vY\îO¹A\Üò\Ø\ì7\Õú¥>“\Ûbaİ¥¥¶–ñŒ[b¾\ì’{~\Î$=.“òŸ©±¿tƒ\Û#x\Ë\îq‘1º1À€kÅ‚õ6LHooÁù0\Å^’\'··|‰¥Ÿl·^\Ã\Öğ\è„ğ€=€J…kf\ĞÀ{\'Ô‰ğöH»N2ÌmHW\Û,\ç,aIG˜e“8—\ÙR\á{vXtŞ…ƒ €üBu}³wğ¼BYyiÁ\r£\0ô\ßa(÷‚pƒÔ¼œ»\Z¿«[€Ã¦ğ²q-2\Ãä¯©”;–u Ù³\àwû›Õ°Xƒl­†Zs‘\Ş\ÎrÇ‘Ç¨,!Ó\á«Rtº´ø\rŠ3¤P7\ß¢\Øf¹Àğ\'œ\ã>,Á²YÀ„\çÏŠ\Ö\Ù`¿s6I¥„€™\É\ì–\Écg‘ä¶\Øö÷\Ã¶LY1\"\Édw&\n\ä¥\ÂF]\ßPY<Â—¿ˆµfl]C\ŞÀJ?œDè‘€6pÃ»\ÊN3€‘’p\\6U\îÜ€\Ïm—{6\íX\Ór\Ò\'ƒ\Î€ƒ\Ä\Ôp=m˜\â6\ßxg\Ùµ—Q£Œ™ö.G¶C`³8]p=6xGdI\Ü\î\è°8É–w¥\ã\àa„²7ƒCx\á6c•\È÷»Hös_R¸şÇ°u\Û?S\æ\È\È\Ë!\'w8\Ä\Ø\äèµa˜;{\'„Y\Æ]›‡\È\Õ\Ù\Ã\áœ“-\î\Ûl²\ë$\ì†ò\r\í‰„³z-3 \'\Ş>ôi†šC\à\'\ÒP˜ôO¹B\Ş_‹;\È\â;xbƒ •![33¬³\îKØ‹·™õ—\Õ\Ö^z]:C¼ŸS6\îò\ï\Z:a¾²ã„ \×`\ÒL³€›˜B\Ş\âõ\"\á;€³%¶\Ùa‹S©ıÍ‡’¤®÷o\Û<\'ÁÀ\Ë\r:œ1€;u \Èp¤\É:»YÂ‡²6M®/Všğz\ŞxÓ²DôŒ]¦ş#®¦}–sxˆg_\Øa=Z%\Û-lÏ†q:»µ±Ø‡V\åÜ¾¸\ÎK„/\ËA=\É#r	\0\ê J\á\Ş\Ëv\Û3Ï\ïE¤\'œ‰½$6‹\ÌK.\Äv|¾SL‘w1\"\ÛEµ‚PÁş‡$\à~,pú/©kn3\Ó\à\Ù\ß+9€zrÀ\Ö{uˆ\Æb\êÕ«m„[µk…m¼\ì6ñ¶\Û,¡–­°‹V\íÛµjİ«V­Zµj\Ô}<b\Ë61ÿ\0L¯o\Éÿ\0¶&¯òCğ÷ÿ\0—–o÷»\"Ø¶\ç„ôñ’ºÿ\0\Úñ{ü¯¿Y_-H>\Ä:7ó\é‡ş\ì\Z{ÿ\0j\Øü/¹›‡\ê\Ùñúi;—¾6Züÿ\0\Õÿ\Ä\0+\0\0\0!1AQaq‘¡±Á\Ñ \áğñ0`@Pÿ\Ú\0\0\0?ÿ\0ñ\0PrÁTv ;ÿ\0ğšŠŸq\ê	\Ñ\È\\]iš\Ç~˜¡\â\Ó\Ï|\Ë\ËS\ét:¿~‰7™À!\İ\ÑVÀ\Ê\"Ùª2&\ÇÃ™ÿ\0³ş\ã\è\ä´s+\ìIEZo\â\îˆú·ñ0â±®“c\á\ÌN—±}-…ø¼CAD{+Ç°XP:\ê/\0kó™Gñ(\Ì,^’“\ä\Ìl[½44\İC€l’)‚‘26ø}²$¢\Â\ÃÊš\ï\Ó.×›‹\àöY™\Ñ\Z\\’ü]ú\0Zš?§\è\éÜ¸\Ü	-U\\ \ï\áe\Ù\éXº_\Ğ\Ä·P×’\n@\Û\Ë\Ø@(@Qe7\î§ş\ÏûŒLmP$q-põ÷ û—	Jô\é;¶\Ï%R\0†Ø^\Â6(Şš\Z\Ìÿ\0\Ùÿ\0q\Ür\n\ê9\ÂE­²½²”\î±~\äPE`Z\Z\0\åş\â0\Şd—/\ĞÏ˜9M\Ã\àRøŠ7¦†³‡z#\ê\Øøz®\Ó\Ò9a\è.¤–4ó?öß¢C\r\æAsÿ\0gı\Â6\î«\éWT6*…øJi\Â\í)\àpü,1%J4\Ó?ö\Üa†0£ˆb\Ú\Ôn\ÊÀl/œÅ°òe\'Âš£U›s\Ø3*\ï\ì‚™a;„\ÒC–r‡˜¢zy\Êzû/\é+£\ê¼­h®‘¤|!ÁH™|0ğEˆ)\Ögş\Ïû—xö·:şdƒ\rã²±Nü=KH8•wöF\ÓGj\Èc\ÙCˆ\Ï*¨­VÒºVO’S\Èj\ê,,aO\ì\Ä—`C\åf¼\ë\Ïÿ\0\Â\'~r{ğü61»\Ëÿ\0ªP\Ø\Ş\â^Œ\0¢Ú¦)J¦®©ñ%Q2<‰ºUz\Ü¸ûL\Åg¨2¥th|aúxŠ–†¶Õ³õ\î	µ5†Öµ>…:.f“Fª\Ë_\ÜK€e\ë\0¯rşˆOŒ²Í¬Ø—üt\ÄÀf\Ï\'	]¦qÄ¿ ]±\rı€x§¶8\\I\Ş=ˆ¬6\Êi)…3\Ã\éõú4ËŸ—fGVŞ•Ÿ÷{€÷\\<€\Åü\"\è\Ã-\Ìı.\ån…a¾/\â[\'\Ê\ÒH\Å*°ª˜„\Ñ\02<©ºUŒ¨T©k¯b¿ò\å?´\"À	K[Îª#FR•\ì\ÅŞ™{\0)¡P>n~/öú@|\Ç\ÑfŸ÷ş\è-µò\ĞM†©lX©\Ê@\äB\'v[\í’ş\Â\0µğß¬V\ç\Öy˜\Ï0 iY¡ñ ëš–ø¬<\ç¨\0\Úh‰n4üpô¸q¨(.\Ä\á`\Ğ\"–ª‹º\\QÜ¶½,û•\ã³.\à0W\Å7\Ôñõ¥\Ç\Øü&&ŠY\ëí«„<¤¦‚\×·VõV7\\\é­õ›\Ø$¬\ß\Ë\ÌOx Š›°–şN³0\'¥\î\Ø\íWi–·-B%]\Ö\âª\è\Ç .é¾¥R\àªÛ”»„•²«*@{ÿ\0ğŒ›….n\Ã\ã)ÿ\0•Ôƒ]y\ÖO\ÈKÿ\0U‘±a9õ\ìu“Fmr¾)öˆ.—B¾iü§ı\Ş\àŒ¡s~/Sşÿ\0\İ\rI3\Â\ã9\Í\Å/á‚¯±:\Ä§·½‡¤lNô\0^1‡\rh8…{*R\Ä\àYN{\Zˆ$‘5b\à\Ë\ß\Â\0\è\Ùv(;ß˜C^@ºg\'ğö\\¶\Ê÷n’\Ïş\ËÀ +(P<(.\Æ´\Ğ]v\Ì^UM\roE3\Ä\0õ¡ \Ç*O,>šò\Ìø\Ê\r\çîƒÓˆfJ¼m¨h/¼òñja|Ö½.Q+¬6.¿–£šV\àÕ§´\Z·•gµ_›ú\î[\î1R\ZPLˆ\Ï~…\'/}{v«p\êû®\à»\Î$\ÂÓ–\Â\Ï5( \ÑÚ‰\Äk†Ã¶!h\rªš«÷Tªp(€x>s\Ô\Èa\çxTø†>\ËË·8\ï\Âı>²¿²]wÁÙ£7­K*ö²\îX1B†ı©.	LG\n\ÄTe»\Ã!ğ4×–ZjT\Ğ\ÏtÓˆ\Ùğ\Ğ^7y\å\ã„ba«\æ¢i¡KJ>‚g\å\Ä(¢…:­Œv\ÒEU\Ûlƒºò\ã,Z\Z]À{z¦ô\Æ\ê#ƒrÒ4†kP5¤S\'¥\Ñ\ïù’\Í\èx]#€\Æ\"Ğ™fG¼®\à\0\íP\ë¸]\Ê\"\ÕĞ²ö|1pQ¢›Ô~†k½`}\í\Óß¬\êÛ™E¬-\å\Î\æxy\È\Ób\ì°Eğ\íò\×¥ßˆ‰UJ\ßp¦Qäƒ…-Z\Ç5\Øú|À\r¾‚\Ø[/\İw(aÈ³®\Ë\Âd\à\É\Ã>2~¯Á~%H2\ÛCcHŸdR¬{=.ÿ\0\Ï%\ìo¬F\Î(J”Ë¸Ğ½D¸¸^®\Ëu\×\ØdM5\èÁ\È\'üş—\Ğ šl6ø³}\Ô\0¥kp\Èšòe®\Â8b!%g¸Æ¬ÂŸ<tô,°B3B‚½PŠõµ¡\\C¶{\î\Z†W;\'b\è\Ğß»ÿ\0w¸ı\ä9tÎ¯^†?ù”Yƒ½e§@ş¹\ænC…t|\0ô\0MF\æË€j´œ\Ç}\rµ…U«W\Ú\Î\àˆ\ĞM	n†\Åø;†P£WYPpô\Öş`qs[}c:\è\r²ı\Üæ‚ş\×\×E;Ù¢\rX(64÷#Ok–Ô…¶ñÏ¥¸Bª\É\î\âª6\âWjµÁ\Î\î ¶‡\È_¥Œƒ©N\Ç\æUƒ-š0ªüÁ*Á³\Ñz\éÂ‘±–Q£V\ËT±.PŸö\ÉV*\0À\Ùbw¼½\Ì\Ö^\İ{A«óR\ê€:®…Z<\0\ÑÀò1¸a´\ß\Şş˜^ò´È»W+\åYb\0lm0z;4wÁv\è–-yKR\Û\Ç>ŠŒ1²İ‹qU˜\Ø‰]ª>\×.¼<‚\Ú!~€Xğ\Ä Ë´Ÿ¡ğ$´\Û\Í]°t‡\î™CB\È*«ª\â:ºV³ûPx*\'`¿r•~\åO…B€\Úûô]\ÅÍ­Ê…´¼K	X2\ì\Û\ÇÁ£\à#ùi•÷iZñ¨v†U°¦€8– Á\Ó¢õ¹\n\ØÊ’\Ìa”2Î…?‰v¶,\ÂX‰ñ(d\n6…mRQJCa¯K`‹i‚5g)>¦1\Z†.\Ëù®û—\Ò\n…«k\é\\J \0½\ÆA‰Ô§có\è½%\Âp\Å\Ö\ÊÛ¨‚N\í×º9|CPö\':µh\Ö\n\Ôrw –ŠK<3ö1Y\È\Ö\Ú\îWHÀ«j½£p~:ƒè˜¤²oà¼£tn «®h «\à®¦J¤\ë@Ü¸\rÁ•CÖ®]\ã<ú~†+9ºo©»\Ì\ÙµM\ì¬f7\"€NÔˆ:8™(9\×m­²\Ş#›`z³Eøô^¯o\"¿\Ç6·*\ÒğDhƒ¨MÒ¢óŞ­\í•Bœ.6‡K\Ï>ƒ\æ[F\Ş\×k\åŒ#ƒ\äGdT/¶´|[_9\é\Ì÷iW\åÿ\0û—l\Î3thoñ\Ì\Ğ9kÓœ6\Öß£ÿ\0÷— áŸ•e_\0ù]f\æ\Ë\É(9\íX\ëÿ\0\æiƒ`2/!Uöw¿Ş“e†ó\Ö\åğAaV\\€=ø¨\"AÉ»T\àñúª”Ce\Í^\é3Œy4\Ì|\Zb\Äk¯!—•¿ógDr&ğƒ^=“oR\\T«x]\Ùz\Ù\âú—÷\Æ‡+\ÊÏµD T\ÊÁ•\ä\ÖÜ8Ú¡6/-ª\Ëú¸;Ä£¤xº\ä\ë\Ë	\è³.‹i¦ê»™[E¾šlròòú!š•T\Ò}–\Ó\ÉqV[b´\Ïv~ˆˆ\ÒejœñıÏ…ñd\Ü\Ûô¿£“*(\ÉnJ¦’¾Z{,]†Ø®¾môŒ@F“(	lˆ•£x|Á(7L\0ƒÑ®G9=\îÁy…hÚ¹¾h´*t„:E´°\Øø‰T\Õ6Q¼ûBHÑ¢‹w\ç<.ß‘‹;zV]]\ß‚\ä\Ç\åñC‘iğ£k*j\é~!:@YptZW¯E®•Yš—QB€\Z{1&h6†ğ©\"0Cj\Ú\å‚!Q¢¯b`\ê˜ai\\xM¡–š3È³!\ßar\Î[ñ]}*B—ú\Æ\Â\ÖÃ‘«O¼²\ÂYÀ_Œ,5é¡º¾J§„%.•œ€\Åb\Õ\Æ3»ú„ µ\Æb¥,;-€\É\ãLÀ B\ãH\á¬d­\ĞÛ˜n‰ÿ\0“ı¥¢­\ì€_\âuTö¸¶ğı\Ë\"\Öp5`\rœx!ŠÀ¯Ab9\Å¦y\Şx-\"¦rUf6`#\ÒG>\×\ï\Ìö˜…r\Z\rì¦¦©†•ÇD\Úi£8\ì‹2\İö(\ì\å¿­UûR\n_\êS[“VŸ|Bø®rJG\ÓJ˜ª\ÜüpX,^Ú ó\î‚1¦\Ë\ÉV*!\ìø€{6\í‘YéŒ§5©Y\Õ\')¤gµkxge…\â25›r/ıfR+N?ş0²Á\Ôm0´\á¼\ßY“\0¡€\åd\Í¡ R¿\r\Ø÷¡õ\0q•LÀp*n\ë0w95\ä\î\Í8ğşH¼ PZ5\ÉEü<0T-0>\Å>÷\ëvAó\È\0\åO˜aC]5‚^ƒ^\êó+*º‘C\æ·ò\0¶\Ö7eŸ,¬\Ê\Ût\Øy¦‹\éfS8‰ ò­sP$SL\r®‰\â\ßhªPˆ\Õ\ìk«\ç\Ñ{ˆ•3Y\Îº\ÓzP\áÀa\0Oqı¼iy“O’	\Ê\Ìş`\Ù\äòÃ¢2\Ì\ìò>=\nr‡Rú[t’“\ä²N0^#ßƒ/%\ä>F\Ç\Ún~dÚ\áóub•T\Ò\ÍVô\äü\ÃÊ„{\\ÿ\0\Ú\é?\ãt„‹\àVR~{l®œ\Ó]Kf·;2ª7{º§7­DrEi\Õ\ÙXx2d­\Ã\n¡\Ö\ÇB\Ê@÷BRSÀ>}Z3¿A\\\Ê]\î19,rÕ¸/z„ş}\Z´\rp)û\" [>Pë¿’fE]\'?\nh\Ê\ä~F8ı“K\Ú\0\ç4\Ş|\Æ Ä‚‚\í\Éuø¼^ùmZ¨±6.ı\0|\Í\Ñ(¯²üL¹\Ï\Äx°_4BÖ•aŠ¦öR2¼S\Üÿ\0±\Ü:f©¿kª\æ9\Z÷Ug²~%Q\Âò…d÷ˆ\nd\ä=@0\\5)rjlóWó,ö\ï¬7WÌ¢/X1C¿dU²±8G¨—@Ì£\Øt\'\Ê\ä~F8ı“K\Ú\0\ç4\Ş|\ÇM”‚‚ƒy_\×¼€¼[j\Õu¶&\Åß \à‚= È½û<6|K\Å\ÆU´ñ™óWœC¨\ÊQß€\Ğq\î¬q\â\Â\'ö|!š+XGùñ*h*„÷–|\Ò{¬ ¬7\0$S„¯Ï¾2\Ì\Å\nO\n]qÿ\0\Z¨J«ZÕ‹¾O–vt\n?3yÁGÿ\0PAl\ÊÁ?,¤ˆE\ìE+\Å\îZIp	c…œË„:NS«3\É)& LbÓÕ±œq€‰X²\\“[´1KYŒD“Rq¥*Î˜\n;µ¹­š\à·6­.­k\ÅK\ìÌ†Ë¥™\í\âo¶ñ¨-H\"¦Ï¦ˆp\nŠ \â¿W\æ!\Òë‚€\Ï¡.\Ø*caŠ\Ä\Z°Ê­\ã‚8´”@ûCIf¹‡*D\ä±@³\Û/¼¨\0¡›\ÄZPT…¾h_\Ä]F\äğYs”¡\â!•†U\ëƒ2ŒA\\	²\Ğ\ÒY­,`\rO%`v\Ç\ÆV½¡)À„\éˆC\áş`5´¶•gOP\0 P’&()¢­¡\â¸){Á \á‚Á%4|\ÅH,úr\àv\å-&mÀ\×ñ\ê\èkƒW±…Ú¬ú\ÒG²\Ã\n\Æg~\Ó\ÂA\äa\ï6T\0Ÿ–SB@¹0¢Ò©eÑ…\ÄyB•ª‘T9\î4\rpni\Ó÷Á[\ÌD»÷´\ä{²÷¤š^\\†V¾ˆ*(Š€İ\ÓTøY«h\ë¹J6³wh©ßŸ†~X™w\ÍÈ‚h¬\îñ±$\ËY.\ÆZh\'°?hn\à\Û\ßymB-\éK/\Ò.MºKh\Û0ua¤\äG„r300^š#÷ğFmb\ç‘\éN\ÊÎ•0¹\0Ö‘º1g>‘\nf\Îı\ç\î2Š\ì>{rø\É\ŞP¥j¤U{\\›štığEùˆ—}\Ús}\Ø\íù——!•®8 ¨¢*vCMS\áeñ\ÔXªp7kX\Å7Vkƒ\ê_…¤XE)\Ï=\ïq\Øòs\á*\Í°+Ø©fùÌ®”+ut‰&¤\ãJU0·¼\â²\Ø\çs°f§º»\Í^?ıw\ÌùŸ3\æ_™~}1/\Òü\Ëó.\\ù—.\\¿2üÏŸK%Ï™ó\ëgr\åù—\æ_™~eù—\æ_™~}/\Òÿ\0Áÿ\0ıœ\ÌúgÌ·¸\\Ï¡r\å\Â}úg\Ó33=\Ì\Æ\ÆYU–½³’,\ß\ë\Õ\r6µ\ïpKpp	^ñ¢E\Üf4\ÌTª\á‹X¦½~}~ı3è®»\å”!g™½\ï·ñ®G¸¶£«,hy\Ë¤š§¨)i_ê¬’~\ã¥…ÿ\0\Ğ~fH7.,\Z—õ/O¸_ø\İKe§LW\î˜ˆ£pH\å\nI;­‚ºô7<%²ñÜ¿¸3Ÿ2óüK—/Ï¥Ë—/\ê\\¼Ëƒ._¥J•\èJş!\éR¥Jõ¨†\0]®£½#v\å\Íôx\" \æ\rık\ÆnT¢\Î\Âd›ÀK³\ÜSœüBT€Yë®½¿™M^÷‡\ì‡Ş‹³¸zT¯J•F\æ_mJ	SR‰²8¼<2\á¹a5ÑµV\â²˜ñzA\æ¬ù*¿^\'R\á™e\Ëô¹\î—›—\êzó5\ép‘)\êÃ¯“1ö-ª+¬Vò‰Uˆ \×K‘v\ßVSt“i\ä44\çvfø–^R¬\Å\ß¨\0•k€›\"A¾¾%Ë—/2\åÿ\0©©¶_\Ø\Ëj\Ì\Ñ.^¥\ËÌ¹R½*T©^•*T©R½kÖ¥\\\' €qu—\Ş€†RWEF¨¢nh\â\n¾qKP\ë\'\Â2€T¾\á‹\Â6r\Â²’ªcÁL\Û5\ÚU«£Ò¥\\¯WH0\àAF®š—±¹ŒF’¢l~„ó\Ó\à?\İúzeõ\0#7.\ZõZõjµ5^·~œú\å/pe\Ôq~ \âaPTõ\rÊ­¾SWğ\Ì\æ%$¤¤\"V)F\ÆÖ›¤Qé§‰\\’´\äº\Î?6ò«\Ë°-hc\ç\Ş_‘E\\#…\ìtû\Ç%MR\ä\çUx;¹R%h\Èü\Ëo$Üº\ã`\ï‰\Æ\àúX\çÒ½/2\ËuT¯Jô¯yR½+Ò½\×\êW«§	\ï?¨!±7W5+)‚\'7•eŠš…]BÌƒ˜y\îf¹÷–#:ôvÌ©6Ol©R½*Tø&	rc1Àı“©¸bQ\Ã[–^w6\åŠ\í\î†U=;’cPœzÜ¹w/2ò\Ïô´·¨\Îj7{\ï_\ãvN3\0\ÜI\0i/‰^].\İ$«ÅŒ(e/Í¿\Ï\ÜdS!Ld\ã\ßÄ¶´VÊ¯ç¨¢Æ½ª‘·À\rÂª(Kj³8UA€G\Ó	Qeµ\Ö	ó5\Ùx\İ0`\ßß™tyƒ\Ëe\ß›ø˜3Ô¼Àõ¯ó¨•ş\ëR\Ñk!Œ+ªö‹\Ì\"®_s\æ5¢­ü¢ƒù‚\ruk\í0\Êÿ\0+·\ÔÜ²¢ƒj \åyVk›F\×?QÅ–\ë\á\"X5YCgg—rš&RR‰lf]µş¼C$/\âu\éuÇ¥MÀS\Òñ,ö˜˜ô´\r€\È\î#8\0‚\"²óğ2Œñ\\ƒ‹%|+¤‰­=\ĞÜ£Z)—T\Í|ùX˜t/dó\ZV\í\ÜÂ ‹\"\È]o>|LJQ§fV½\åœf_ \ÂgŸS\Ìş=8ş=F½jW¥zT¢W­J•*T©R½0F*¿’˜…G,À+rù¨\"\êw2^\Ø\ÄY+(ğT™¼šrz\ÔHU¨¾™‡”d\Æ_lq\ï\n\ÉeàµTŒ\ĞH\'µ³<\nÑ±^i¸¾¥aö^}o\Ñrı	¿xc\ÑkŸMÜ¸2\ï\ŞVeIú†\ï\Ğ.´^C‡>ük\ŞTvüÙ²\Í#\Ò,µù†€-?Æ˜_\ß\Äj”Vª\'ªq\ç¹^dam_=@Y\Å;\r¢ikñpº\r½Ë—.\\¹r\å\â_Ô¿yó/™rÿ\0\È?Â¥J•şu—Hû&$¢ .s_(ŠÊ·C¾n\Â@5XR(KsW‡Ã”¹”¯Œ–\Â\à_\çQJ‡_‰Eó¶\Ï\áGù†5| Šº@Â¥FŒj]_&~e¦SœCª5Q\Éo+ñ( W1²\0q¤\ê^ÀKx¦X€¨–)\Ä‰G\Ò\àÜºe\ÜX²\ê=8¡sr\ìy\ï0`\Ëõ\ÔW.\rÊ™T5¼ş\ã[(<AphŒƒÄµ\0¿\ê¬#×ˆ\á=²\Ã!§šòÁ\"‰×ˆ¢Tû÷.¢ª¾Jş%\Ü^e\ßû†}k\Óm_§ˆ?\àzT¯Põ¯RWø\ÔV> -\Æd;¾\å.\ÛG}\ÄVh‡^\'z%.\"\íJV±&\ß\ÎğA0`T³ V£Ş¹Š…­\ì¿3B\rg„\Ç\æ&õCœ˜„\ï%>1ƒñ-…quT\'o?z\ß\ãz™)6“‚\åo5Pï¡•\å\0	b¦©ÿ\0¸–£]N\â\Ú@°\î\á@6>x™Í§uŸ\Íú³3™peË¹~%Ë—\ï\èX·\è-y,PuG¬\Ãv<…ı’\Ğ~Aeû\èt”0‹¹s˜2-˜®¬«ø„Í€\r\î7h€¾\Øh>&¯\á—İqi’\ê\Ôc\İnT¤ğ·o¼~J-F¨px\Í\Îe\ËüE³\Õ/õ†,(–Ÿ>e\Åù–^!ş§2 zW¥J+\Ğ%J•¨QüEl´\Û\Ì©¡n]´¤—\Â­Š\n”\å\ê}5€\×öN3/csG’˜™.VZ‘¼SJ‹–›ywq‡/Ô¨[óQ\Â\Ãì‹«4ÏŠ;`A\r<÷%È®\èöµED¯mKVm)\è+\é}3\Öıı+p¤YoŸ\Î	ô„­eWa\ìKûô~—.k¼\Â,•¾,_t\'ñ<g\êıº tŒşXğüJGv#H÷\ïp–Î€›ÇŸÜ¿\Ğejû[Ÿ˜˜ğŸ	È«-B\\\ÃL/¾qó½\0Y¨5.2üË”—\ç\Ò\å—Ô¿2\áù—.]@K”–vJJDJ\Ê\Ê÷+\é\ÔúOL¼2vD\Ôß´v6s\Äñ\én¨?;`	y\ß\Â+…·\ê¥\Ó	XP1SP¹s­-Ê·˜¹œª$9V–üT\"mmü«X—Œ½3ø¸vX\ç/\İÍ¤°,D\Â\ÓUó©È³dóƒ$¡‹\îxaI\ÄMF\\\Ë(Ã‘®n-À†\\ \â_Ø¶\Ï\Û,%«™lfşh¸_B5\ëS„?Õ¥ÕŸù9ÿ\0†ƒÿ\0J\ä \ßÒ”´A\\\æ”€Š£Dpd…Ñ¹˜q\'Ì¡\Òı\àGgÜ©¿\ÜÅ¼wp±¿E\Ê\Ò\ÇqÕ•—Aôb\ç \ã\çˆ\Âö\ß~—\é\Ğ0VÒ¹‹c¾B±¹ ı¼Ã«J\ÃagˆKˆ¦\Óù¯‰aa\"_Ü¹~…ô\Ü\Ê-\ËÄº¬Kƒ–m+>s>ı\Ñ\æ{\ç¾V=òµ¹I\á-1.\Û7‰\ë/\Ô\Ú{,Uhrœğ¢¹®Ü@I¤e\è”8\0(&\Ä4–„·r‹\â\æ¾hDP\å3@g0´Pw!(¶„¯Zt\ì„K)=<\×õ*¨Ø½~ ’˜}$0(0o\Ì_‚K¥ö#³`‚R\Ù\Òr|ó\r¬\"m¶\ä‚\Äô$\ã\Ìj\Å¦¡\Úû—-1\ÛLA8Y>_h*…‘\à\Íjq§	d\İZ´WˆÄ³)²n	Dù¶\â\Ó4+ó\ÖE\é…ƒV‹Æ®›~\Ô\Øzv^\Õ\\Q*ß‚*Ô¤w\í)m\Â\Ö%\Î\0¸Dyy™¹oy’Au™}oñ	¥Õ»ÿ\0RøªêŒªõ\æü\0×˜®ù\×(*İ¿\İ-¬\Ø\Ç\æ8›‹\ÅÔ™ÁV\â \é@M>\ßÄ­\Ò\Ù\n\Ù\n\Ù\Ş\ÅU>\à<\Â÷2\Ö)\Şñ©PEóf#\0üÃ¥\áX\ä9¯Ô­!iQŠ¿2™£YP|Vb\ÕB¬^\ï~\æxl§²d7Pe\0œ/ğKF…–Iÿ\0C«1¼\Ïı†Z\ÉQ\É=7(.¤x›‘ù˜\çÿ\0I1iø™4~!\Ş}É‚yChK\08\İ\ËJJ\Şfö2\åÅ‚:Jv}Áˆ6„nP¡r\ÙO\Ôø•\Ä£\è\Ğ[ˆœ{,2Eİ¾\ã^\ÕN\à\É\Å.’¤ºo‰JxYN¸eXMñ‹/ó)\Ş h8CoCTö\æ%*\Ì÷še^5\ÄFÁ˜j_~\Ş0\ÊW\çQ\nZ>e’\"?¤lM\ÖM‡ıú™N\ÕXü\Âua*PY\ÌN¸„)\Ô_!\Ò@qe¢) /Lµ\Ío\â9Ç´\È/zD#J¿“™C,l8ÿ\0}}\ÆÓ‚\ÑJ;\ÅB\\\"©+ñšnÖ˜µ b²)\í\0¶\ŞBV)8\\\ß\æ9]Ô¯ a\á\ìTv³(\ÇòAµ\ÑF©?U+R\âk(h§J³\Æb\nc\È\ê Dr+ü¿<Šp·µ\ÌÓ’Rh-F\Ãq=3*\Î\Ù@ ó¸1aŒ—\ï_¨*f²\ã\ß›¥)?õÁ\Ú\Z\0ˆP\ËÍ–œGa‡\0§ó\0\ÆP¡`US›´üÀh­ñtE\ßr\Õ@¥¨pºøüÅ¸\Ök³’½{‘\0\äDÚ¯ ¥nq9uqˆ­\×1\êQ½Â…O©A†\n \ãí†…°\Şş%j^©r‹\Ø/$j\Ù\İ\ÔI³[N\ãn¨=ŸYŠ¢\Ğ<8W\ßS\ÚÙ¶£eM,L·\\²’\ÔÍ \"\Ã_ú\î\È|ˆ†ù•d;b¹E\rïŠ–n†áµ“¹“»u/`Ó¸¯ª.\Ïh\É\ÕNS\êR$cš(\ÔrM\Ò-E1ˆ‘QZ«(<°8J~H­Ÿ¡ƒ\êYšhŸ™Yj\ÏC”Z…x!\íyebı\â3p\Ñr\Û<Œ%[_sW\å÷Š«¼<\êh\Õ,\Ë+.…Cp›¡\"™XUyc·¼’\Çß¨l==N%\rû\íŒ(#”Š·lbO6\ã\ÚPR}\rø¤¤·Á”\Õ\ç3Å¸¦{f+\É)G\îm\Ê1\á\ë\Äh\Z_áœ@{Oõ6Vl\ÚL48§ñ\Z\È”\æX\"\Úñÿ\0“D6\Øş	@Ø®\\±\Ê¥?\ê¢Á¤ÿ\0\Ã+-f\×S÷q¡.\åHÿ\00¥G(¿\Û<°­¤}ùŠ<\È#Wt}KÂŒ!b¼\î^¦\å?^Jß”‘Ek\î\0Zj¶}L……t\×\í\0G·õ¼¦\Ô\Å\È\ìü\â(ğ„¹\Ë\Å\\\ï½D¸~0¿½L>©g>®0!’¨¢n\È\ãz\ÙdA?3XR¯a\ï>£@u†ù^`\"±qQ¿ˆ\Ğ]Cz,óuô\Åt?_\Äó~bSV\Óù`\Ú|F=¡zk\İ=\ÍÀ\Íø|\ÓsŠğ1ó\ì£`>™X34»ı\Æ\ë[\Ç)h€òÀÇ•#J¡\Û#ñ(\Ş6\ÕWÁq^€¦‡?D@¦\0=ö\'D<\í}Á\Z¾a…c\İ\'\ê@\áÍ\Ï\Æù\â+ŠıÆŠ-‹ –^LW\İb\ÏxN\î\0†V¥¶/\êSGV\Ï-ıEù&`ˆhq)R‰<E¶Ñº_@G.«°\Û-…ª\èjø†1*yŒŒh|u\ÔwKe\Ö\Äs m\Û 9üB\ßP¹«\ß,H²Œ\Ü^ù‡Ÿ‘hq.\0F›\ß\â]H\Ò¾L;\æ4÷8ñ9{•° ˆ\rQª|\Ëg*F\0º>`]€\Ùn>ı\ÜEl\\/QÙ„-˜C0M„¶k—\àş\æ„M\\%Htû‘Q¤­òú—ö;Wó\0t¸¬}\ÅPü™aFÜ‰r\éG\â\ÉaG\'5Ï½NcÙ’*ƒ?‘‰U­\Å’ô4J\æ\Âÿ\07«-+\'³9š÷FhÂ»W\ÔP†¸\×28\É?(ˆ‘û—‹42c`)‘g(’\íTb!?³ıÀ¶ d¡¨xK\ÕüªZ§*øò#\ÎKĞ¯dr6V°;§úœ\Ê÷\ì+·,£y\â=eğı\ÅU\Ğ|M0²:=\çC÷w\ï¢#\ÛÀ\è:qtÿ\0Ä¥––¯\ì\æE•so\Ü\İ\Ïz\Éõ\rmƒ(\Ùğ\Ò}@4—Ç¾ˆ$j²Ÿp\é˜jÿ\0\ZŠ\0¤iÿ\0C(°a\íù¨vu¨|Sğ	›ó|\Â2‡\â\0ıG\Ğtù·\Ğ\Ã\îôŠT£\ÏÈ¶\Z\Øéš´;˜\nõJ\êÀ\çW„‚‹W\Ş]4\Ô]5GWÌ«60i´\×şL­\r²=\æD6\Ñù‚\Ä\"„ÀYd¡¥Ÿ³3˜m˜™Q!~U\æ`¤eÔ´o9_ÓˆeSË„s†S¬=\ç	}I n”|x˜¸â—¸\ÃGe\ã¨\á\×(\nøuñ.Œ´\ÂşK‹\Z‡\æ5\r¾¼\ÌB¼Ìª\Ğ‡\Ì\Î¯\ÚWö\Ù\0;G®©!hQ\êTJÚ¬%ï¨’4‚	¤›\ì÷\ë\îYª\ærŒ¹ƒ	\Ô\È\Ë\"²8_\Ü<	\î\Õª.\ZSŒµ»f‚½ \àCQ—\ÉKDW~#\ïLVgrg„V\"<“LwW\à-w«£ó(-~o\â ¾\0aNG\åúŠ½\Æw\0\è£\âQy,¯\É;‰\â“û†lC¥¥`ˆ7ŠC\ê\Z\\a¿\Æ`³¨\è~Nfeb‰aºô\Ô¤<¬‰ ŠôË„ª\Ê=Sõ0\"ñeÿ\03†©NjS2®SZ&\×”9fÍ‹”òø‹L·‘÷Q\Ò\â.–ñ\ìb5\\³{@\Ñ\æ\Â\á{TL+ÀI‡iWó–1³´ÿ\0\é\0(¶\èƒ\ØRñµø%ˆ\\\èÁ®‡\ÔÄ°,\Û?1M\Ğ:w÷ˆ ¡v\àQ€rT}üx¹rı²#6Zµf‰ŒÀˆ4Vş\â¼\İ\íş\á»\È+;Â¡\Ñ”q\â4p:ªıı£Q°óVÈŠ\â³,\é\É¤9¬ŸLÎŸ€¯¿?ˆZ,(0~7\Ëv÷¹Z‚(0}¥·\ÆÃµ¿¬?\\®&dî´›`y±ˆW\èb½ŠW\n\æ\á@“\0Q,•Óˆ\á\è©nEK\îo\æ*I\çCü0\Èf)RB)1Q\Ôv*(P‘SG\à:<\îZf¹\Æ$o#“\æ^a\Æ\Óş»e€å¬¸g9—ˆ*\İ\Ê\Åo,¿²+B\İk?˜r¡lLü\â(6¸\ä0Œ*§SV«o\ĞjT8Uc6†{¾\×,]\Ê~.081|÷,rE\Ëò±q›\ìş\â^\Â3mß›†õ¶ ¿š©ew\ÏP\æ\Âc9K\Û\àÌ¿\à™X qŠC\äş\"%tE×µ\Üñ\'Vc\áQúŒ\çg\â¿R´Ÿ†\Êe5\Í\î-\âŠ\Äµ¼{\ÇIX^À\Ë\î\Ñ2@\0>\rü\Ü\0¸®§ƒ‘÷--I]™&rudóÁ\ç‚hO\æ!\ß<ccL\Ù\rw\Ätb<N(¶mvŠ!÷eˆË£™\È-Àu(˜ˆ2L~°@PKú\ãÀ\á\Zü\Ê\ZÉ˜ş!ClÂ®?””W^\á)¼\á{S?ˆE\Õ-\0=\İg\ÛX\Üa\ÆAÿ\0¿e®//e¨.\Ñ\ÓYk\'´¿1{ta\r\069O\Â0”\Ö\ë\âW•–pU`\æ/\ÊRƒ¿ôŠŒB°P\0ZÁñ0@‹­k€\Z˜z\\¢]q5„1¯¸\é\îj\ß\ÜÄ€k*\è2°€Ù¾ë‰<\Å\ê$\İVL‰\á™^#²\Çr±	\rŒp\êfrùª+(}¾Ò³vşYÊˆØ±,\Øe™*\0fwlvº\n\é\Ü\Ët»9o=Ş£@gû„((Pp)/\à\×\ã€\0\È¯v*R;\0¨1›CEK\"û	l¨8mü\\«JÜ ¯\â\îŸˆı‹¡\ß\â\\S\Şr‘øŒ¡\ä¾3]\Z\Úú\Ô.\ØV¬u0¨–ğ\n\ë\Ì+¢˜qmf%F¼§›9†}\ê\nª\ÂsDĞ‡¿8ü’„¢\\Á\Ú^8\Æó\ï\ÙZ‹~\ÕßƒQ\"¢P\ŞW\â2D1e§\\:%\åk\\\r8º\æ7(”\î|xó\ÏJ\ÍkvCeŠ7”p<uŞ¿$«ƒÂ¥Ti|¡\ÈÖªU ˜l¾ñ1‹c˜†\É	@\nL\âş\â™AWFŸy@sWÿ\01¸=†¯ú³Rş\Ó\àòÀq¹3_\ÌfJÿ\0Q|Wl*¼Å‚~#\0…tø„\rEk³Áô\npB‰\Õ\Ü\0<¥SøšibŠo²0Â©@\Ê Ü”\ÅlL`j\0>\n•*$\ê(º\Çh\Ï\nö)\ÅNX~s™\ÕSÀz|3.(i[d¿ˆ¶\æV†?0Ä´ª¼\Ä` Y¬\"L\ï0Š†m…5‰¸\Òp•šy„\ëqy¯¥(=ø\æc¥\ä\ë\ß\Ã\âRVK¨>F£\Í\æd“Tn¢®V6dš¶\ê_õuL\ØÁóıÜ¨\Ö.R\Ëø©Š¾Ec÷‰as\ä\ÇÔ JĞ¦\ï-–<\\¥4]lı•p\éF\ÓGr¥\ä]~\æQC°Ìª]¡şªY\r\æ\Û\ë€h\êW\Ïú†b‡fß¶J€\Ğ<\î¼9‚[\Éş©¨É³x§»ıAmAoğ»ø!L«\Î_\Ô ¬\Öú§\îc$\ÃTŠ\r`\"\Å2eF\Æ	[±H±–‹hùXagUÜ±¥u.²«˜»;•<QQ{\Î,:1\ÚyX\íYV,)°Á\àó\Ù\Îw–#\à\Ù\âQ`\Ï1\Ã\í(ˆdg‹Ï¿PË‡‹Zö\Öß¨ŸeK \í?±.‚¿–\\5d\Ñ\é¢_\Ä[<ş9†h¹¥\Å_\Ô\n§]›®\á¨ˆ”Ô¤¢k-G\î_6À\ÄTT.\Õ`†ú\"ø¨ò€eSA[\Èù¼ôÀfT\Ö]\Ô\r˜g»¢\Çu™÷şI[ \ì€\Ì÷=’×€ñı¥©µ\è‡A\Êøñ‰\æz\àA°ó¸ö\æŒLUÌ«Ñ˜\Ç}_1ña†Y\Ï\âaN_Ea Š\ZŠ™[\Ä\Ä\0RŸ35El¨S\'}‡0¾†”G0r\Ûú—C¡ü¢(\Ş>\n>\ãR\á3\ç2ñA\Ü~Bş É±\á\ÔË©-şet\Å\Õ\Ò|¸!‡ şYXöcøş\ã5k\é/\á™ÀP\à\×\åbÔ‹v-c\â˜J[\É\ãDB\Ñ\âõL\n„õ‹_d\Â%\Ûş\âV\ç´{n\\IøX=±k\0	4b€\ÓÉ›Œ>U^†R°÷Œm<Ê”\Èñğs¸\Ê3\Ø\ãıÀp\á\Ít\ËaÁqXû™C\nº^: Z\04|JÚšóV\Æúl?r¥…sKn¾\Øò(\î·,\n¿	»ø²]Ó‡õõ*¹œ\äò+£\ã\Ú*÷\Â\Ñ\Î_¨õ M	E©iVõÄ¯\åh\Õy\ÙR“\É[W~P@Tof,´-9Wñ	c%9<E~\Ğ ¸.\Ç3‚1jp¢}KÁ»\nDlb5\ï;ö¹ªl˜®9˜‹\ëR®9\Ùisy5(v\îÀ”TÇ\éöŸ\r\Ã)ø›}\å`¢i*l\nôª}\ã\Ükif•‚úOõjJ5Ä©\ç˜\ï\á.\'bw:´Ô¼I¯|‘2ö\Ø5l?×¾rk\â-\à4xú\Ò\âa«^\Ã:0i|\ê)S9\Ë÷3\'-£mù¨&3\È?R*\ÄU-\rú/ó*µ\åW¶a\"ş¨û?˜\Ä.¥1R\ÕhÎŸ7rƒEÚ¿zˆ\ÉV\Ö~KK\Ü\àşbn\á«üÄ¬–Š»öMLZôX¿\Ór¶\ÈÖ‘Œ­#ñ˜“\'ºğ“q°´”•\à–\à]D»E^`+0›‰`s‰\\&¨&7r³´r@âœ‹\\³Fµ\İU\ïO1¯ùv6`\ßX©‰w–c‚dV\ï3Ë©QVË³™TK\Ø\Ê•`ƒ!X˜3\ä‰e±Y\"£%Yò\Ï\È\ÌAA´o\Ú\à>	›W\ãú—y\ÜûŞ¦*“6¬ûŒ½ğ‚˜=±_r \ËJVñó¥5¬\ÒS/7\ÔsUÌª“²/[JüT®\ÜÂ¢\Å\åY“\Ğt¢»v\Ç„_G\Üs÷3¨\0+\'‹X\îü™S)uô©\Ì\í6Ç˜-\Û\ç\Ú\'y[•\è±½1\ÜÁ\á§Ê˜mK\ÉB½	.½\É\æ	À\İÂ‚¼B\ZÔ²MÌ¾s\r\Ê;««”T\0¶\ëVüFeE«ˆ…œ·®UYBù…ºş2E\Ú{˜¿d&7_‹e·¯Œ\İ}#s,‹=Å†õ!l²>†¹Ö‹\Ç\äŠr:>#ğ)h`O d˜\n9fPÚ±€\årÁ­\É\Øx²0E¹JıL\\ÿ\0pXD\Í$P\0”µgÍ³ \0Á({iù0Z\åw­ATq™h¯l¯\ál€\Ó/|¿©{œ¨2h\Å_˜\àAC½¸–Ï—Q\Ä\n­%À\Õ\æ7G\rF¾A_pk\nAz¡\0\Ãö/³€R‚\Ï\å\"{¥\Ú\\ÁUˆ¶\Õ¸%\ë\â ¸‚´j\ä\Ä\æ\á›Ù¨V	Î–_ ¯§zš\éøkóNf´g¸C~j¯\æ\çN{3ü\Í<Œ\İö\Æf”+ó\0[ŸyÜ´£V’¦š\æ)šA2uò½\ÅoK\ZÀyü\Ì\Í\Ókt_–LZ!™\È\Â\r\Ö5\åkù™Mı¡—\æ\0¹2\Ğ\Â\r\ÍB\ØEˆN%„\Æ\'\Ú€£¢kür²…LETşC1Rü]°ö\Ê\\\ä\îdlğºølD½7ÿ\0\È\Î}M¿¸¨Š“‚W•o¤«p.\äQu„zöø—S22\Æ\æu‚lö\î^X\àP?!‰}\ç\â\ÉrÆ…dJ~ ^\à©™… yğ¯(>\âñQú”Õƒ†™û%òÃ€³\ì¨‘\êÔ®\0µó¸\æû«ö¸úˆ)\ÜZş\â9\Û\áÛ¨ —oæ•¥T-şĞ¦bliª1\Û\0\0Û†\'«X<¯\Í\Ë\0õµ_…´C›Ê°\ê´\\ª€‚\å¿ı¹HUsø‹N\rL[2Òªµ\n´h;böüœA¾œ\Ñ\\b«f5`6\Ç\×\å%‚ø\ä\ÔÂ…~\ÈN\ç¸1\r«…—›\r\ßœ3£°\é’\×\î\ç\áI\0*¼\Ú\ÃCÅ›´\ÃñQ)@\Ğ50-Z©ø‹²*\Í\rõ-:\Ím¯b \êLo\Ïq\é!B5L!Ptˆ¥¹_ˆ*	:0÷£ò\Â\Úxx–t¤\Î22\ÅX|À¼™ T z\Óp_‹ü_K‹¤=FR„\\\ìÇ´M§\Ì\Z¼HÁ¤^³p<ËŒ6ôsÁ1Á\n¡–ñU>Ik¨9yŠ ªª\Òz¨‡)\Ê-|#j­\Ş_Ì©u=\å[¨M|?\Ü^°ü€óøº~?˜¥29?–~#GòÀ4°yøª‡R\é[¯¨o\È\ç\Ø\Û9ş \æ/ˆü¹…¨;ù1¤6\İÜ·Ex«#óTB-_ üq3W¯%?ˆ¥İ¥‘¨Í…\Ç\Ş\Z±s“\Æ\êY3†\Z±Æ¡Â°…Üµ™7‰u\Şñ_Œ\Î+\0Ïƒşú\Êæ„°ü\ÒU>*\'e[•G.	yÀKeU\âR@\ÕpG·rü”\"½\ë\ÂCâ¦ˆx¨ns\È\Ã>‘H\âJ\Óô\ÆB¢„D\áM\ï0¨\ä\ìIEL|aü\Ê[‹\0ø~¦Ô‡7(.&\áY\ÂUk‘‹ˆ\Ús\\şb\ËaE+\æ,‚ª<\Âı\ÄvÀøA\Z^\\\Ï¸wİ•4C|ü“\Óa\åJ¿ˆ¨\Ø	ñ:\î•‰u@a*ÿ\0\Ä\Æ8‹ˆ¥$!\Ë(şbyb)\Ã]±¢ji–#4\ÉKğ \Ì:Cœ?ˆPo\Ş}-¢\Ğ\Ço™‡)r?It›GÓˆ\"\Én-+ó5\Ëp18\Óy¿b\0`-*\ìeğ–}L@u`:ûO\â)\ÓòHV\Æ\î=“…EŸ%7)*>õ\ni}ˆş¡” \éO£,kb7H+ú!\0¼@şŠÂ—…~\Õ´ö75üD¯kŒ>%T­‚Ó¼ñ(\Ñc—æ«…*ÁŸ™aF°,}Nj\\}\æl\ä-b\Õ\ÛşˆB£¢t\\¡g5/e\ĞÁø-Kv‹¸›¢Œ2™^´@÷¢8°we0\ßF©.\Ô\Î—×¼JŸŒˆ\Í?\0¯\Ì6\ÄóOû&9‚şš˜ªÓ¸{^¢—½³­NP±b%üŒ¥\İ3?,Z\Ú\Û6fóuÇœŸˆ/8ct¤˜j¶Py\'¼~†\ÊJEµ\æ®Z–¶ø÷\"½\Ë!¥†,S€q\Úø\Ã\rQÀTÀ\Ì6ıJ‘\Ëq°·X˜\ÇFU\ÂĞŠô\Ùş+ñ\â¢bc\ì\n\'Éš~%Ul»f	¸\Ğø[?s\ËD¶\r1\Å\ÛTA\â\â\\Ü­\î3ˆ¸¦BW_zúº\åÀ~£9o‡\ÒÀ*.‚k\ç0\Ë[n\×\è\ê1=\áTƒlx\ï,¥(\Ú\ï?_0M…M\î\\¶r…¸ª€pb{G†‚#ù—,şÊ•Ô®\Â+\æ\å´r\æ³ö\ÊH„o\í\Ô\ÉPı\Â\æ±È€}\Åş`®³»óµßœ\Ähm\Zµ·%|\Å\í\ŞEd\Ğ\ãjj\Õ	\à%\ËL¯0]\"\Ö\"ó\è\Ñ\É0,Ü¶\Å;u31*/d÷Ê•3X…ß„TúZ\Î?\îû ¡\É\r¶Zı\Ï\â28ÁXO&‚f\É\ÙøCó0;¯ûJp_S\çd	9§7³\Ôjh¡\İ>YL½)’Šz\ß€…¿”´\Z1œÏ²\Â	€4»—˜$\Z\Éy37J\Øÿ\0»%TAW‚¦R\à]U\Å\ĞKIHğ¿sH e!‡\äv\0\ã\Şÿ\0\ËVö\\5Áˆ\Ó4<G\'HSr\ïñZ\\·Ä¿Eôc‡0Qg2˜mBtk¹K«óPb\0û>|39>\ã\é«^ó\"£`¬Yr¥—[,¯\0Z/¼\Î?Ì‚×µ\í´¿–>Szqõ¬<\ÛµQ\â¯V‹•©._–X\n&B.¦\n8øc…bQBwœ\Ëc›h\ë\Û\âQ„\Ï\í\ÇÌ²µ\ß\ÔJ‚X~`·\nô)÷-]\ï±	p\æ &\ê€\ß\ÄBw”ğÏ±oS?Â‰IK\è?16*œ ùÒ·G™Ák\ê³+\Äú\É`N`÷tN\\\Æğ¬j66 O°ˆ°)p=º{\Ä\"Á<?U‚\ÖC)º‚Ñ‚¨¥8©m^q~?\í\ÌLŸ\Ü\Z\nrÑ¿ûøP,8»ö+Í±	XOjXô{¢”}M\ä‚ÿ\0r¹c¡GŞ \æ\ç(\ÌA.ŒC,€]SŠ}¯qB\Ó\Ş	ø–4N\í\ê^Å°R|\ËcN‘ƒfiñ•\Â\á•X·\Ù\Ï\âZˆ²Ä§ñ\r\Ëó<d–ôË¿4\Â#i¨Ë«˜]A™T€¥šúg0\áQ)W\"#\"ŒVzñ”\Ã,\ê\î\0hô\\\Æ\"<\Ë\Ø\îõ,…ù`	\ÜZ\n\î\Ã/7+\árŸ›>g1\Ü\\\ÎH-VP~Š [\Ä\Åq\Z\Ş\Ö\Ê_\î4fû™\Ñxù]J….Šı,ƒµW\â]ƒğqó+i²¿\ÅF\ánÁ`\ËË¯ûŸV/\Ú)]„öÿ\0R\Ç	ôKú‹©…¤¾½¢3SYg\ÏR jÀVV/\Übı³V\Ú\Ö5Vk\á-„T¶%\Ş{\0>\å“@\Ñ\Äu\ÍXBYt)\ã¨\ê\Ì;•\ÚùHˆxƒ¤OñP*‹C\â6D\äI¯5’c&“\æ\0,\ä-q]Lt\ÑÁ—8\Íæ¯¨~jŠı©‡\äc:µ´\Ğ9O©l\ê\îş¡©\0Y\\\İò\Å3[¬¿\ë\â)W¸LGe‘öş¦À¼·ı\Ìz],¾\Ğ^¶÷?’\n\0v\áöe\×#D±\àş‘2\Î4(+~q\ÌH³lÏ„\ÇÜ¿`8ûJ\ÛvÀu®V®Z\Ê}¡ˆ£\×mU\\d’°\çÜN\È\Ñ?mEPK\Üv¢\ÃÈ„²\ä?3P‚¥S\ê \Î ¤6X`†a\Äxÿ\0à¹‚\âã‘˜)n%…9Ü¬{¥\ZO}w¿h€L\Úô\n\í.\ë\ã°\É\Ïd,=\ã²ø¸\Ê\ĞY‹ÃœTU^ŠÚ•ˆ©–8*ós\ãN—\à©eB»?²Pñ%\èš•®»`œ=ğ¾k?q\íJ­7?1`\\”iö6¾\Ğ*Õ€>!,;0¿š\ÜmA\Ôü‡r\ÏW\ÛG\Äe˜5K\Ú|=_\ä3ò\äd8?†¥A\Ó¸•–Nğú\Ã@Ÿ˜Ú‰T\Ê\Î~¥‹‰b·¼±½{33‰C¬jşa*\àš¦Ÿ¹xf£´ˆ©VüD¦˜\å¾ \ŞH!w\ÊşfÀ\Ù £\Ê^›˜Ç„>ˆ\Ù*%jœkÙ³Ú¦\Ğ/W\Z©Y› @ø_hÛŠye(üL\Ì\Ğk„–$§œ>@X„|4\ìöa\'jñ\Årü+J\0 )÷.ò¾.\ß<GÌ‹}‡µÀa…\'QQ~ -¯\'úOdf\Î!¤Q¿¤E\ÔG8Ø¤½£\Ë\â\à9€\ÕcFö\ÏÔ ÷™ÿ\0ÉœGd‚\Ùx\Õ\Ğ \ÈÀ0‰Ÿ´M˜ğŸh¢\Zv´gRf\"x!3sü\×\Ğ6EQ5º\ê6m@F\ê;\r\äû?\î\\,K‰ş\Ñ2\í½Ë•R1Gÿ\0›w5L\Ş\ÇT¸ \Ì}\ëkJ¹\íQ4ÁÙ÷ş .¬n_ˆ\ÈQóBı’¸,yK}†b ğ\ãô\ï\æ#\r9hú.WF\ÛHk\âZ»˜±\Â${ô§\Ä\ÇGa\íˆ\é\Ì\è´¿f\Ébš¶œ\Ê\×k6&c\Ç\Õ\ÔßXˆX\Ï\nƒ\ì.\Zmÿ\0+şb\'¸ˆ \Ö[ô\â‹\Â\Ë\\\áôÑ‡½w¬ \ZŸGŠ(^ô\ç\æW\Ó1BgeñpJ¸ƒœ›£0±	9”`}¥ôø\ÌEZµ)`{q\ã\İ,vÀd\Â\Ë y!”\'‰[’\ß1]/—\Ìb\Ê\ì\înH—\í: €:\Ñ\Ğ_\î\×[\î2˜o6>\çSpW6ş\rŸD^1\n‚9dšº—\ß7dz6%!øö†<¹]0HG4\n}®6R‘¾şmx\"/6\èU\Æt\ï*Ü¨‚€\ÄAMj|mş\"%Àc\Û%€\Z\Ç0{§ıAw<I›\r‹‰~¦+cÒ¦7(sJ\Ç\Ñ ¯\æ‘A”Ÿ%LF,¾Ç‚¬‰bCl\\C-\Ã\Ò\êp\ÑË9¤h‹\Ò(\0|®/œ\Ële8n°;\ç)ı\Ã{j°|CXx\n\Ô5ö€}n$°œ\Ú~\åü[Ş“\îZa˜\"É„S+‰zºƒ\á˜\é¾5\è*\Æxœ£2\Âƒò\ÇE§›³ñšG\r°¡\âªó 2‚°p¿Üº‹­{5cÖ½¥eu‰U*–7‰O3.&f\'\ÛtSZ\Îk\î/JäŒ›­Æ·YG6r#\İLSq´\æ\ÃV?€€bœÌœ¤WöFlÕ€,²©7±á—¸E.\Ì1R\ì„\â-§>B\à9‹w§Soõ0P´\Â{/\à\æ›\ï³,\ZdUY¬czŠù;\Åw\ï)\ì•j\Zÿ\0ˆ\ã\ÒT®\ís/XoŒK«\Ï*3-\È\Ç\ĞPA’½\ë)q\nX\ß|P×¼v\nY)¿/P\à£_À\Z%B\Û}J€&©x”®bÀ.\ìTñ2\à\Èõ“Oò\\Ë‹e\Üc9,ñJ\èçº»?™{,~cş#¡fM½\Ì7E?g2–^W7°³pjEJ_ieÙ¤‡v.óÃ›³™‚†\09¦^½÷ˆ¬\0TŞ˜lò6W2Œu2w\Õ<üÌ¡vlI²\î\ÕXP£\Ü\ï\'\ÄUö&\'€6}\æ£\î†_LQ|#\æn]÷w\îQy–\êSñ[¹\Ì\çcì»öQo\Ì+\rMxhx\ï;7ù5g\"rL\ä«Bdğ8bTm\r)\Û0i1FŸ¹>I‘óO0\Ç`¢—\\\Õ\Ç‘»cø°E‚n_¥\"Ë £ˆÁSğ\Âq¥\æ5\Ğ<ª\'”3ÀşXÕ®\ÇG€^¥_ªRğ°\âQ\æ2Æ¾ x=SdiI\ç%\ÖûKTV\Îv\Ì7+€¡¯’{\Ô\"dU¡¤Ø¡]–Î«™p][Xt\ä~šŒ\í\Í)ûôº”\ãÎ‹ğ¶Y\0*<(\ÖFøÿ\0r¦ÿ\0\äq\æ-š2¡‹F[À˜\rCÍše‰e\ïƒı\Ã!\Å]ó0R\Âûd±\ÃÀh\ïqA\0÷\0lSy–ª&\ß÷B9j¨5y\æU‡°\'\ê¨fÁ@sõ\Ø\ë\ØıOÿ\0\Êu^·ÿ\0„.\Z?\á\ÄBj:ÿ\0\ÊeÁ\Éş¥]ƒu\Ç\â]@¯ú\â,üÿ\0R\Ú\Æuõ9U\ëÿ\0)€…u_\ê3Ft6&\ê\Ù-óŒ…u÷1HøË¬™m62•1ù?¹ÿ\0ı\Å÷ù?¹ÿ\09~e*×£\ÇÀ—4–S/ˆKo|X|8|(|I|HPB½··\rh|1ÀC¥ÉŒw\×0Uk€µöf8v¶ı²°óµoş¹”+™ÿ\0­\Â|÷1q¡\ßş°\Ëj[ş\éIˆ\ÕóĞiş`?«\Õ\Ä\î\Ó\Ğ0\Z¯·÷Á¨u\Òÿ\0\ÌQ¼\ßñ\Ìğ?\ã\Ìÿ\0ƒ\î\n«¿öˆ\Ô6ª}óu{R\Ä\ÄD —\Ü0[ª \Ú-@ŒœópÅ§\í´\É\Í\ãû\àÇ¶G-\"Qr386®f\Ö!p\ÌX´‰\èE«HğŠø`\ÙP\İ~H\0\0Z\êB.\Ù \ã\"\"hª\ÊĞ¥y­ü\Íg•`\Ö\â`®*r\ZıË³f8r*wQ¥›oD[oQEÚe\í¤ü²†Gˆ›–\Ó2Š8\\\Â\Ğl°¦bôŠ\Ò\Şı\å™\ZgaE»=AVk\æ!m¯™S¦\"N_\Ä\Z«ñ¯3.`\ï\Ìj\æ6Ü©\n\â\"ÿ\0bV×•)]‡¼V¢¬\ÅQ¶2\î\Í\æ\ZÁ†ˆò\ßR\Øn¹—›7\Å\Ç=\ç\Z$9G¶?#x\ÔbzŸ¯Zÿ\0\æ%J\r¬¢WŸ1sş?H¿¨¼°0_Ï¡	^§¦\áşPõÇ¼p\Ç\ÑXB~G£¸BT=j\\ª9K\Z\ZüJ¥\í:|Atü\"°P\å\î*l\Ì4\Åx\Öc‹ÅµO0y Tñ(\Ì\Û-Yvs*¹q¾ h‘\àŠ\æ7\ã2Á€˜\Ølbº†ü\ÍÃ·<\Æ*¨HÅ<\×€ö‹[\\¸yˆ2ƒwb\'	2´µñ(\Zlh\'™B\ÔNS\ÔxJ¨9\\T Ç¶7,šWcI…p?\îP\İ[#u\ï/ğ˜i\×ÿ\0!\è«\ÎgÓŠ\â6›õ«ô_©\ÉŸ‰\í+zß¡[£8<\Ì4u\\Â˜7\Óuø”8Fı¡û)\æ \íª\ËeBlö\ê\Ğ\ê}\Î/\æ=j~’gqôU\Ó\Ş8z\äz\Ñ~\Ğ\Ğg—\Zb\à6¨iÀ\Ûuü&\ÇX\ØX¥\Â	P+ø˜\ÜıF±>L\\d®mˆö½‘;Y1‘9•al\Ä]\È\é´\ç‰AY\Ô.3t\Ó\â! b(wÛŠ¢utF‚Ô•)\â\İ÷.‰Tº<Á%\èZ\É\Ğ-G9j.;\Èl\Ñ\í˜ô2\Ï\æ›¬1\ì\Õ\Ôu†˜±–Usu\ÜH-^ğ«¯h/†®:­±\n\\™\ÊÄª\ë\rÀ–ƒ\Ú#zL•0½¥³kóZ\é0ò\å¸$	½ª¡&M\"\ÒKÿ\0Ï£¯ñ`´xc½í‚‡oõC\ÔôE-§}E^&_v8³ee2•[UŒ\ÃlE\ÌI~Ç›\n»ˆb­\ĞLÖ¶R\î!2‹ø0#–ÿ\0šM´Y²2¡\ÂT=BõŸi¦g¾\"ô~P;@Õ…Züî‰œ³µz`$G¼J\æX\æU¼\Ñ?!·2ª\Z|\Ê.—QE“m2Ì­œ‘°¸\Ø ]QM\ë÷{.¥k\é\î/\È:ó9ƒ\â«Xª1r¬\ã;v\çˆkÁqEp`?‚!a\å\ä»`õ\Ïj\Ü(°»6?Mq+6>&F;CDöÕ¶ %\à#jÀu,\ÔNj \à:¨ƒÁ˜Ôªa’P)^\â\ë›2\ÅN\"\Z²-\Ï¸\İa*dP°\Û1w\æ	a\Ì;¸¶|3Y¯®\àß£¿ğ\æ1ô\æ;\ï\å†\Ù\ÙP‡ø\\P§º46²­\ÚÌ­\×L\ZU\êP½›\âS\ã\Êap·Fj+‘>€\Zqxø “8Z±<Ân\Ã\á€M—\ï\ëX„M‡ØPò\Ï\éBÇ»\r =‰–”\ÏÄ³p\Ì‰_\à\'º&‹¹x\Ìã¹Ÿ34kO±\n\Ãr:&£œ\â †ı ’´3Ä·pŒBÍ„\Ì€05d¥†o\0q$ï @7úŒ<³kËˆJ”\Ã\î:+|µ 8M5¯”Š´®\Ëõı¢²\à÷rò”\È~˜5\íbğg1M\å\è%\'\Ó6§c\É¬+@K\rG7/»\É\ïr•\Ø\áŠİ±\Çó«J\é…B\í,\']F¶nõ1c‘9Døe7v\\\Ä	¦(°\ä\ÜÀ\Ï™vJ5	ŒRM\Ñ\ã\ÌPE¡«öŒ}5/\Ñõ^\Ü~ne‡‘\rz%A¿¡.[ö©b3˜¿ıYw\Ş\é—A’mõ8$Ìºs+q¸\Ø\á\ÂK\Ãe(\Å¹×Ÿc\'\Í\ËL Ò¶0Z\ËS“¼š1ó˜\Õ\\\Å~ş¤ù 	_üVº~&/\æ`\Úøw-¶–\ï1m}\åYpüX~/\Ú	m\Å\ád\ÎÍ`\æ\ÑÌ»@ø\Ô#š¦f„U—+-œÁ\ß¢X\rÀ&­BŒc¹{¦)\ÒG~«\Ì:Ë²£\î]\ĞC„^Sg7º‹{úMü\Ü#ÀW¯ \Ìw\Å\Ü 0š~–…L™‡R\Ô.«OÄ±\Ğ÷2”\äm\r\'c\ÜK¾ÀşN^49ó-y²]B4	\ãº º-Vw\0Z\Ñ\Æ%¡Ut¼\ÇVÄºğ:?”h,	~\Ói\Ö\Ùk}3¾M²‚\Şõ1,°¡b¬«–t\Ö:–\ãw½\Ê*\Ô\É9Œ_òcø¯ö~\á óı\Â‡¥\ÄE \î\êŸüG]9›0I\îBµx”.O™­>j	Uú™ª\\\Ğ	l•#4¢x•¯Q)”\Ü÷EW\ãø”J&ÇŸ&`[\Ó_–\È,\r”\nÿ\0\è\ÜK\ÉPTTğLŒÙµ÷\ÄBØ¥a¢¢8¤\ç¾ \î\áa \Í# 8oqU\çƒS=\à÷”‰³1®®\Z€\n-\â]¥8ñ\0¯,qy‰ vj«0ATQK°ÿ\0/\ã\ßR\Û»\Éÿ\0^\Ä\Ë6ÀS¼\èò\Ê{\å÷Y¯i]g¹¬¿œ\ÊÚ¡wj\'%I„ù•m§ó\Ï\ÌÄ\Ë\ÇO9–Qw’Ñ¯o¸fÃ¥Zsòı„\0\0J!,+V¢….º\Ü%\rš‹@™\ÄT\Ô%œŸƒÀ\Û\ï(h\ÃuLF–y¯idc³\íR0_‚4\É\Ù-¨Q\İlŠ\Æ\ÔYü\Æ\àªU#JSgi¼xœ\Æ_«\ëQ\×`üOõ6}\å\"‡¥Ê¦\×	Ú‡ø\Òõs|\Ãz\×U‰X ¨\ç”\Ôa2‹:¸ÂŒ)\Ó\Õö‰ıKò\Ä}?\Ëñ­ˆğ…\ã\å	¡\èsùş ö_¹ÿ\0ê•…\Ò\ænº^7@\àJ\ß~#§6…­\ê2•½‰\0Qm\æ\\\Z\ãp\Ôx{’\æ(Ü¢ô<\î\n ñÆ‹\Ãp(Ğ§½Lzk2¼g®¨\ÔsŸ³r\æC¥G)‘¡¿!\à\ã\Ë|@¸Hˆ!hN>¿S\ÂTõ~Vlu—n\n”#pU\ç\ßÄ¡\0uEó\Ì. ‘\Í^ò\Ø)ŠÜ¿˜r\ëtöL±®“\Ã\Ñ\à9?r°«\Z—EFšIo\ÌCHQdAvF²QPÃ²\æ\å-ıEX\Zv:‰\Òr\"Hm5¤8˜´—A\r\Æ\ÜM¯d\0‚¿\é¡N[¹‚\ä\æ^U’U\ß1\Ü}oü8Š»\é¹²{€\Ä!2\â´\î¹µŒ#\ë\â\rs”(O\èW\ŞX\Ä\"\Ã(Tsl^¥¡\rµu‰‡‰O?¿\Ä\n7t+Zk¬²¯h†&¦¯oO\Ùş¯ÿ\0¨¶ZY¸\ê\ËK—ø”X¬ò\îY—¨2¿ƒ]›iŠİ³Iòól/~#pbğP\ê(É¦÷µ¦M\ÑdFQ\\†¥d´%¦u\ÅÄ”ƒ]Jp\"\nJW\0œF–\Ê\"@!ª\ê\ÕG\æ]1£ö–\Ïx!K÷\ã`$\'#\í˜ {‹W\Şc«Œ¢x^ObQ$\Ó\äBVQ[Á\ÜP\Z¶s=\âC!¿,jš§\ZıÜ¶\ë\0U\Äh\æ n)ª¦y…\äYÒªT\Ê\Çj°uY½Œ`-\å3\å›ğ”T\Ã\Ú\Z†\Z€\Ã\'‹¸\Øh\Ú\×Ç´\ÖgH+8»\êTZ9ğ{\Ç\Ñÿ\0\nõu\à_I\r½¡¥\ì~\Øz	P	U­\r\Åa»>a‘¦\ê\n°BÀ<²”\å‡}crÃ¸`’·Q\Ö-~%p\Ø\Ñ\×\êb²õyOö}E9[™\í_ŒÀ†ª;N\ÃÓ¼\ßÿ\0­`\æ<ù‚\Ê\ïr\Ì\ÌUS5x\ÌY\Ó¸\ÑYƒNÇÀ¼£\Ù0px¸\Ãfa\"\n\Æ\Ín®E¯Qª\æ^¨^£xh–E_Šp4¨š:\Şõs9@>)˜\ÔÅ%k\ÉO½Äµagö¢\à\'ºLŸ¶#JA\Ú\Æ\" `G$\ìe\ã¨AK[\ÒLG‰f\ÔYß’\Õ2œ—Y3\Ä\Ç.\Ï2\Æ\Ù\âvş¦\n\0 JN\İ\Ê#F½¢¼¸#FvZ»¾b\ßt\İJ;:Û\Ä\âƒ´E©– ]\ĞT+]\Ç<@‚İ\Ü\rg\ÛbƒM’\ëƒÉª‰.\ËÆª¾#8=£Il)N¿\Íõ°ö~!ş a\í=\é_\ÌPz&Xa\É^\åC\ì?ˆu™Vù\æPV\Æc˜<§s€^F¢ø–t±‚\Ø\á|[øÿ\0¼AA€3¯û©ŒAÇ ıŸM~f>\ïñÿ\0\ÔI²…hÚ­”ª\Ë5P\"\ã(E`,o\êV \Ğq¨\ÅD\â\Ñy·^c©Pp÷\Ü`TW	j^Æ¥\è\"¿\Äk£š¶;4q[Š4LĞ™„A£,\Ä\0 ²V°o˜9w¦\ÈKBÀvO:xaE…À÷|L1V‹PÅ‡ıP‰XqZî¯ˆ!£\Õ\à¸r¼ª£\Ø6h5c,ğ¼\ë\ŞR+T0\ÄZ²ı|ÁÍ‹2<¿Ô«zX,\Ï\Ò¶q\â`®\\JüË°™Š«’£‚°«O÷1\Ú\ØÍšıJ\Ûm©r6£€\ækA|ñ\ÔDŸ+\Ê9ú‡f\Öy™¨\rB»“/ñú?\áL¢{J¿c+˜q\ä\\´‚\Õ\êğ’ô\Å¶œF¸[mšk\Ì-J¼®­*\Ã@Û˜…\ÕğA¤¸Qü\Ì\Óf\ÉpJM\Ì7\è`”\"eÈ‡WY)RŠÃœd¸sµ~\'\æ?¸z?\ÓHõ¦5Bw¢şb…g0fš\âa j\"Ø¹·QP\Ûı\ÍLS,\ÃV+qİ\à§«S\nm\ÆsõšI3Vo6°\å›\Ï>ğ»Ë®bX»¡š–aœ¥\Í;HÊ¡¾e2@b\Õ\ècñ¨ 2ŒYu\Ù\n\ßeõ)Zƒ&\Öd\ÕEşmö*¹5^Xhº#gAıJÁ\Z´(:S¤Xl­Ä´ş¥¬1YÀJ}Š\Í\Ê[_H\Ë\ÙÔ™Ò¸7\\33¶®1\ÈáŒ½\æk©jµ™ˆe’˜\ÛJ.<DÌ™\é\ÂEX;U\ÔE1}\å)—E ù¶«\ë\Äw._§ºP× \Ê\â\ã\ägó_\Ì\Ó\î—u?„\àƒpdA~@Ğ…\È\ĞG\ÊÅ˜5\ÑÑ¯\Ü\Ï1Ê†a	Å•.´+\Å\Î\nş(†ğ’ \â-¡÷ƒZ“Nl—Jƒ\Ù%\\ G‹•gÎ˜)‚•!tp†ı^\Èmÿ\0\Ô&(>e\ÕcÜƒ]\İ\á‰2>È§ş&[·\Éq{\Z^ğ’\ä\à9`(û§\é!+\É\ç0]­Î¥7“²¥\Ê\ís\åT­Jg4	Ÿ©o\Ô‡’÷K\ãRš 2\èùe\r6¶±uù\Æe¯²\Ç\æ‡\â\'œTT¶w+’¹C/ó©AA\Ô>\Å9§D5±uZ ¾\"s\Ì\Ê\ÊÅ¦%€X¡\Ú\rC\"¼}@,5…:Ü·@]7)0ƒ\0\Û+e^x¿¸ş\î+i¥@r¦ˆf,»\ã\ê5e·\Ã-#—e\İ \Ñ\æa¬µğF\ßOln¾€\äÒ¸\ÔYœbU¬@=)˜‰\çf¦1—!°#¡ÿ\0¤&I\í7z—\ÂC?‰Q%\îŸ\Ä¬ùWøŒN0Y•\àƒ9û†#l*»\\´™t@\Ä\äu­,Ÿ‰Æ^\âş „\Èû¾§ğÿ\0\ë`)XÁ\Ô\Âe£¸QB\Îb;q£\"]8û\Ü\Z\Õ7W¸)µ½\å</œ\ËO‡q\É\ë.\Ú\â^\ßÔ˜K\Ğ\Ã-\ë0\Ï.˜\Ğòó(\ÛN\ËSõ s/owÏ–?[k—7\Ü8¡\ZQ ğ$lb\ä^a\r\Æ,B³\Ø05Gb e\à\İA\Ä\åôCµšW€®¢Š\Ñ¨ke?w(ˆgÈ«ö\Ã3‡3&u\0%\ÅVYùŠX*\0hö»b4[Z^&:yp¹º‚Œ\Ç\0‡-´}\ã@\î\ÔE\ÃD\é\Ïp\Ö\í3S’û÷ƒª\0\ÉUòK\Ú4®—qË€µSÀ¹cu\Ğhó7€]T7|\Ä\rzjDö9›zcö˜º„2\Ï\r?’i&±P÷š\ë…?0\Ù(‚\ÜW¿ö**\Ğ\Üv{L3Ï Ce\\™Ÿ”YÄ ¡y®º”q(bÿ\0‰€¹ùa\Ò‘Ù \Ê0cs]+<Š¯\Ç\î¿Ápöÿ\0\ëCy•ô”(£‡0\ZP3\âc†vqdK]Â˜˜º‹\nU&s‰–\Ô\ê\å8\Ùs\è.\îjw\Şå‹±\ÆBó@ª]\Å[o}Õ€_Ÿp´WJ\äÿ\0P@§óğam\×,B\àRê´”†uÿ\0{L£Œb\Şı©‚%\\§\Ùo†Î¬¤\\˜ò<˜½‰©ªC\0\Û\Ñ~øˆµ,_hyó\İb:\\D=Ÿ0m_UÀt¹<CH\àå³Ï¶\à[	À\æõ…%,Ë›	w)\ì\Ë\Ô{¯÷˜,¤\í%õ=Px6ı-Á44e|’\Ø\éƒ§\Ò-ü†6üVeZø!cÜ›Æ¬4L‰YÌ©ˆGj0\Ò~\'›?Tó’•0u¸n,Â–‘z¢Š¡z^7¸ê¢­›qbR=M†\â´9\Ó\å†8<r\ÌÏ\"\Ñn%…mñc‹ibS¨ø>em¢§ŠüÊ¢¡ÁP„_g¯\'\Ïÿ\0[dQe¾d¡¢‰IL&M¯[\ÔeZ\Z\"\Z)kŒBgg-Ã‰Ş­ MÁ9¯\Ş\çhUr’‹7x\âe\â\Ş=\áFyS·j¯f¥šÂ¶\ç3ªaMß½0<\Ø:s{Cw¸!\rX\Ü1r(0\Ö¨9§$<ZVˆ\éD2®‚Q\Ê8 ôœ˜\çú…È—˜‡\âVŠ¬&c¦Mn¸™n\ã‰J\Ó\Ûª	PdFªbZGkÊ‡0‘©X —´?pÄ±B+‡7u½\âó\r\"8†¹\Õ`J‹„Î™G˜±\ÉvÅ‹G\Â|\ÊÁe«\Çù†©²öb6 {52‹=\Ãp8fG\Ä5/\Õü\Ì\êã±¨73ö¦\é\ìI\Z=³ño0ï¹€ŸğxEQ:;?\ÙüK­W%‚£+-H–µ\â9L‚\ÛøŒZ`zƒ\Ø°–±\â2™J#¬©\Ã\ÄrÊ„\ÒOGgÿ\0Qª€¶#¿˜\è2^C¹†cWV|õ.;\r«ù„	\ÆiüE*D¥3÷=l²¶Êƒ!]…±6\Ö\Ö~%\ÊÀ\Í\İC…÷\Ãuù \0¡Šw_;ˆ=¿ƒT\Ñdk‰™·Š2M©¨PŒšaUqQp”´ş\")SaAjep\×\âc8-ğ8şÿ\0]\Æ\n¸ĞŸl?,K`\ØL$û\Æ!¨f„$œ±ü¢÷w\ÇõDKQ\Ü \'š%R]×´±hW=J\\+z¬Í·\Îbu\Ã9\Å\â6\\´w\Í\Å\Êj\å7Z\ã2­`\á\\MOn~÷,OLóù˜5\Ü3\"\áPÕµø‹W{*\à¶x©€÷¨`©\Ó\Ü?‰ªj6\ä¥u.p§\Ñÿ\0q¼YÔ¸j\ÌJòEÉ¬˜{_\ÄoO·ôÙ¾eD6Š8m^`01\0\0{sÚŒJGh\ìtJ¡«r\ÎH@ôGş·3­¤|\Û¬\å–2Ì&ş\æ\éQ\\_Â‰x\n\Ù\æ¢Qƒ°\ã\Ãœ¢7k\ÖeY„\Ï¯7-\0g´•\ÉË™…\ä \n¶™¦¬U\ÕüÌ¶\\–c\Úr+¾\Ú\n\ËQ—~¯•‰c\nK\Ê*€\Ş\ÚıLğVp\é¤\Ø\Ğ´\"Z„\ÇdV‹Y\"]şbB\\{`ú\Ëñ´§ŸPÊ\â:{@u„š”\ç\æQ,\',Tqj\Å}\êôA|vF•\Ğù\æ5—=±BÕ\â‹x®*.\nodKª¤\ÖnP*\ÛıF\Ç\0\Í17L\Î7™e\\šŸšL«\æ~$y\Ã(\\n<B*“«c\êŸ\Ó\É\r.Ÿ\ï\Ò|»\È\Ì\ê\êÒ¨Y\Î?`~eHE@Q}\Óû@”¸p\ÛÁ|·™WÌ#…\Ê\Èm@2l<LBrP[KSXŠ‡C–\Õ\å{œFgp/\Û\\\Ã\Â\íNÿ\0ıU1GÌµ,\çY\ã¨O²*¿Ô¾”0	b=ÁE\0pCT8¡c\ã¹_Z)´PÀÀ±X\ÜFd\r£ŸqBb¯!\â\'nt\á€\á\\\à	Ë ƒPl4 (ò8\â;| ]E­\æ×›¦l(Ásg¢\îyT& ¶÷0°1h‚\ĞTm$!tK¾lN£&tõß’b{—\Æ\æeJ.Ç§D½daü(\É*b3š\Ú\èmj\ì~ÿ\0H ½7u6‘‡¿š…W°„\ëbæ±Ì»¶\Åxh:Yş> UQ¡Y%B’ú,)XR!mÿ\0\ÌT¼\"/(^Œl%ÀU m\"ŠMW_Ü¢ºj\î,>fjaO?\Än\Ìó\î¿€‡4z8eğDt\ÜK@uˆ¤ˆZñ\ìqT4\Ê§9eº!ıb…4C\àû—§\È?T\ß\Ê\ËFş òšj\ãP¢f\àµkşeı\ÊP\Ã\Ì\äƒh\Äf^q¨óP\ãĞ¯˜&%£~¢€~}½@!‚û$\à\èh{\Ûúš[²Ş‡ğÀ­ì†§\êõ\á\îõªP*°7{T.²WQ¬\æz®HHKslûW\r2­\0n	ˆ¹Xqp#d*ûñı“lµ\ÔPÈ£m²s˜¦.\Ë\ÕT\Zjwºkš]M\0½9½|J2±‰Ê´Z\ÇyZ¬\ßÄĞ®k\Ô#ik\ï\ä(\ÓCÔ¤¹R\àÆ M%\n\Ûğ1\İE\äŸ\r¸•3\å¬\Î\"Q y–°”+¬¶?×ˆZDQ|mF\Ş\åJü\Ì±bB˜,6\Ş~fV‹Š!H—­$&*í…•\â\r‰]J\ÊO\Ó÷‘\ÉÀ\Ğ9€-8ª‚Póæ¡˜(dGö\â\í\Òÿ\0¿iRUjº¡yÎŸ\'rÙ‚‚7©`šk\ßõSzQSz,\æj[5z\Ü\İ\Şâ¼Š<V1Q´&\æm\ë\Ä	UEb®ø¨+Şš1e\ï3\ïŒq{f!N†`P 9W¨\È6©z¶ó¢-h.\ï†ı\Ôö`ôú4>¦/)B§r…Dµuqi8ƒP•pJPüø…\ÃCgš2\ßqV\Ì!W,-Å‚\İnTœ·+^û•V>=¾^>\à\éI\Úgóo\Ìi)k¨.’W\Ä\ï)óg˜i\Ê^\à\Øş\"\ì17¯®¿0D±³³\ÓOş¹\é\rjŸ\\AxS\ßó*fH2\äó\æT\rSŒb\î¡ô³mÃ¡6r\Z¦°ø„€-\á÷™\È^V{¨¸Ák¹\ÆõP+Cw}\Å0—L—?¹d\0Samœ\Îµƒ]p\ÄÀ\Â\ãI‚š\à†5iû\"\ZT\×ò\âü‹#f\ï\Å-M\Ş}\åV)Dv¡cD7_[?ˆN\ÌE\Ë9Š±0eÿ\03ŸyS¨\ì}\ß@ñ)gr\àlÏ .´ió˜nÂºkÿ\0\"+¥4V\Î\à;R\ÉaÀj¡’¯\ã 4u«qõ1‹r\àû@\Û]Ü±\'%\Şr\ê3Ü³aó\0„9 ^(÷` ñ.;\î,\ì\rĞ­­°T€FŸ©}K±Z¢„÷€„K½şb½\Ø\ÂC‰Š÷–ø!»˜IBEnH\â‹\á\ä\Æø‚[6\Ã\î1¯¡qõ¼Ë‹4ƒ\Ê\Êz¸}¥\\\Çq½ó³2¢\ÕùD) e²h.ış\ßrİ¬²Z¼Ü«®LD\Ìqè¥¢‚“+.\ë$)ƒi8ö=ø‹ˆôRY:šü„°­1|Š:\Öba\ÑV\è4\Ë\Æ\Şõ…¢G\á\Ä7T\ï${•\É-k\"ƒ?–€¥·û\\Ê‰8YUeñ­Tq\í°dº[ÜªÕÒ©\Ê<°ˆn]Jµ¯\ÌpYp\ÔÇ‚jo¿\Şeğ8Ş‡\ç/´`\ÈTó,*²‡\Ãü\Ì‚\Ê\ãdd\Ób\å\ÍwEO\Ôi[WRùW—õ<\Ë\è¤[!@x?\ÂV¥\Ç2\Ëz`\Ü\"¿1TV9`WGš\æa$¤¯ğÌ´Š	½)v\Ìu\ê0,À)E¶şIR²%\Ç[”0\r¥Õ\ïp\\<QY\"‹Q`Ó˜‚5¬t¼÷D0\îw²\é…o-/«\éø\Ä)Š\Z\"\Ş,z\Ä&TC‹ ‰Mlˆ¯ã½xşx–\É\ív\rLW\Ã3©‹\ì–*˜µÏ‡/òÁÉ…\0hˆ\éjK‹.\å\Æ_¡e\Í\Æ˜˜CÀeq`¡z·P[	¨Go‚\áX;‹hŠlV”\évÊ¯i…\ÕjQ\Ì56ŠP\ÔdyDd\é¦ ¢\Ï1jy\Ç6³\Üö„eM\Ûúÿ\0\é€\Ç(¸8ğb	y\'nV\":e»|P¸\"\Ùdd8€Au\0¦œy‹\ëJN\Ä`¦\0Z^kÙ¹”)3ş£ù-T€F\ß\àˆdçƒz*›A3[/|n2\Ñ+Rn<\\©¥ƒœöÇ©\È\ßC\ç1»«µc\Û\á\í\Ë\Ë4P…\Çñ3ş\Ô-gù‹–\'9k\âSm¥_¸*\Ã\ëg¹*`ALh\å\è\ÔtÁ²†š©Y”fCG\Z•¹R=F\Èi\É~^m…ñ\Ô­‹\n4\Ş\Ï\Ôl\ZO\Îûƒ6”‰Fò\ê$:H+;z\æ_V¯c”™-W\Èu)€K…c\í\êoÉœkó\r• ¹Z\Útn ğ‰„km\æ»\Ì,	d£\á\ÆwñFM¶\à\ß\ê\á K`8»–\äE66<T=­Á\â6ÛÅƒ	¤\æ·,ö·¹0«n\Ít¼¶{sq¼yƒ\éS˜\î>©[ŒI^+K¨Ğ¸;•\É2+¥\ê\\§(Cˆ\Øf®˜n\É\ÜC#	qºÀ&¿Ÿş”©\í \Ç%E\â40\ç\rš\Í\àŒRX¸ª½§_‰\Ç%¤+®\Î.X\r˜\rgª\Æ\Ö¦ğ\â	Rû+9®s\r+;ò_\Ô„L‡/¼ Q\Ïa¼™€3»V­ÀR\Ú\ë©{©€,,\Î\Û/ú,“¨±°P%jv.»Ä¥b7n\È\Ö\Ì\Ù\Ì \ÅÌš¨¾Vş%ü[[\áƒq=ˆ0Õºôc\Ì	ˆ\ßSQ\Èôi×´\Í\â=K ¶Œ\êR¼°y¹j9 ƒ\"Sx\Ï\Ü\İ1c;_*P\Øh§¼\ÊK\ér[%\Z\â.Á±,š˜r^\Â+À»³\ÄcÔ­…\ì»ÀòÁ\Ï\Ñ\Å \æ\ÉLpQeñ\ç\æUYN<c¢²¾+uU\\\î%2¾Rµ(2‹ò¼»§Í½\Üz.aé°\é\èJ”\ëˆ	°\ß\ë\ÏQß¿Ÿ,q–\Ä\ÛÑ„\ç\Ñ%JôpÁ²\'®•¬\ÌM	,`¬G{òEw2ER\ë.5i†Ù˜mV+9”§šHch\Ã\'ÿ\02\Ê]\ZÛ¥°¨6¡^Ô¿O¼^H\Û¸qªˆ6YEÚ¼’¶É©€\àª\ÜX9Ò‹|^­Àouhbš{\è¢0#ú·ó\â5\n\0~i3\ÇU\ÔDÆ¥\"«»} hc<ñGvicVõû”§\nÁ2­Œen3‘¨D\é¢^P¼¦\å\á‰Z„¦	­Á–ö\×0G¿QZ{~Zß¼s\rÁœ¸¸©×¼…P\Î2ªüj¢[‚_÷3\Ï2\ËÆ£Ä³–[Rª‡,[­BªTcœš–4Pµ\íqe«©­Z\ë0Ø€]	C\ïPuZµ¬{1=$\nˆ\çŒı\\§[lK\ë&X^U¢\Õsò\â\Â\ÅP\çÎ ù\ÔÑ»jµˆmbFe¢\×ñl^6À¸mÚšû\â_>í­«\ÜW=‚]\Å\É\ëS™¦oÖ½\âJ§\ÃzrFxµd¬<6{Cğ\ÅE2ª^X¬\Ë\éR\à–§©«„e…\Å\Òœ2§ ‘ÿ\0;\Ïø3(\r÷İŒp}\r1M\í_p\Ğ;	İ¾WÃŠpƒ<(\'ÁKbõ%4\İâº‚`¹n¼±\äÀ\×Ñ¬»\ç!\Ì$¸\Z\ß\æ-¹\ÃP}/\\\îZŒ‹.\Êj¸„î‚»·\'†`ü“«xG@²\ì›\Êò~ª</·HÀó¼¤\èA|`¢¡‘s–W«\É	°-w/T\ÛF£(S“½\Æf«üL bûO\Ñp\ËÜ½\ÃpP—±ß£»ø©‰B«@mz€\æ\"4oº`r©”9«vpCŒu$y\à¨\Ú\ì³1Vßœj•A{—‘ş%Q.Ö¬\×[–\0z&,Qo7ø•jV\×=Â¿T7«\æ1@/±J\ë\â¦\ä%\"¯7¸^$öD\çyU%·¿µ´*¥X(¯k€r\ÊL\r\í_*}´¥tÌ¤Fk¹ctio;bW8\â7ô.\"¤÷õÌ¸>•\ê\"\åty\Ì\İô×\Ä$=\ê\"ş˜—Mó\Ñ-÷%²P¾M\Ë\é\ê=¦\æ<GOĞ°ğ\ékó*\ì\'P]AòÇ‰\ìı\Æ\r2\ï\èA46ƒó/\Ö\É\ì£M\Óñ¥\Ë´(\\Bkh\Z—\ÙW\ï\Õ,³/6fRrY`Âš~Ë ¥­òZ¾\è\Ä	e»WŠx<\â0<’†\Ì\î­\×óhP\Ó\çş\Ì\ŞX‹öSw\â4\æ\ĞNqWf½¥\â\í<ßˆ\Ñyh9ñrµUK`\Âr\×d£¸ó\Ù\ÄUq¹W9\ë\'\à˜(Š¿œ~&s\\­í¹œT„ûJÁ”¶X\Ãz1¸òö—TJ\Úğö®)©§&\ë\è—;ô;ó.{2ÿ\02ğù‰\ä-ˆY‹\Êmqg\Û\í+[\Ê·ƒ˜\"\Ë\"Jª—ŒKÿ\0¹›@\È\Ği\ç‡\Ú¨¨gš<\æ=µ˜hU¹Ô¿(n\êE¼Wu¯x1,7‹ª\Åsu\æ\à&‘Rá¬§rôÖ¨KEy¿ˆ\ŞM{¼\n\İW‡¥CphñZ!\ÉH\Ğ6%f±hÖ‰r­\â[iµl›¿¹e¦\ç9s\ìv\Æmm\è\Ğx\ëklµœ0ùK¹Ï£põ \ÃÒ½*$|½\rŸh‘\'L¥(\r\È\ì—\\Ja%\'\Ì(Ã™–ôJ¾`hu\Í\Ü\Õ÷+\í@ûŸ\áÕ¨|¹ö©œ8u \\·)³£‘\Şa\Ï8%\Ó,r/‰\Ø?\ïh«_\0ş¢*²ò\İÂŒ^ğ¿\Ü¬öm€yY{\Îo³\Õø‹N\ÅòŠ;ï©”|´Z\Ş\0˜\æ\â\í\å¦cºRh\âf8Oû–\æ6Œø\ÂôYx\Ë2¡&°*¶øÄ«›\Ø\0ù\Æ&fÈ„(5\Ã\Ï™•“H\Ö\Î\\j\ÚÜªˆJ\Ş]{=õ1! ”i \Õ\â\ß\Ï ­\ä€8»}\á™,)_†ö¸”xº/iÀŞ­ÅœË‰š|!ªX“ğ2Æ\'<œ±a„q-X\ØQ¹\ì+Q—4<Å·\Ì\åÛ¼÷\"‹\å—/\Ğ\Ì\åMN\Èô\Ù÷»0¼x»x \êD›5À~q\Ö•Â¾/ˆd#Df®¯·¸-«y[\Î<½GFò\nRúmÂ¤<#©w\Úø˜Š\Üj\\)\ßŞ¥ú=ù¯—˜\n¤Û©y\ë#ö\é*\î(\Ş*a»¿Ô·VËT¹º\É\\–V1³ˆ\æ³/E\ÕD>gƒ8\ä®wŠ\Ìß›\n£šÎŒ`¨tE\åô9c¢\ã\É\íó‘<GË·ˆ„Œ¡•™Y\æ$>„«•!\ÜW2B\\\"\àÁC–V\ZE]\î™‘\à°ù…\"ˆ÷˜-\Ëğõø‰]©OùlU\Æ\æŒ\ÃÜğ€7\Ü_\æ\Å\n\Ï²k\ì\èş%²…Ê¸Ê¡g\è‡\Ò\Ç\å1\äö\ßY‰Y|`é„¿_©~\ÑZ>\ÙA2Y´¼Ë¹U*2\â\Ö<Ev]n)’\îÌWM’\Ô\Î/–&\í\Ğ\ägµ_Ä¹ˆ[s€Wxƒ Ê°\ìƒY™WÀ5¶í¨¹¦6\Ê;£*±e\×kvts¼pµÒ1£\Z(‚g\nw)0f#\ÚW¸‡5n³lñŒš¯2›	U„œ˜Ñ•„\Ù\Ú(l)ŒCO{F\ØDX¹š?\â0s¦!\è8¬€ñfX`Á+hº\ì§>\ìi«(+¯dm—b3uƒˆòE\ÎnY¥i…BÍ…n\×\ÇÄºY”\Ò\è9C»wL\äEAöÇ¼-67o» ù £$.\Ö\Äm?1!\Ü(NW\É\ìg\Ş]‰(B´\Ö/4·	R\Ä&/\ß¸ ))<ø†â’Œ£²!eM…M\ïlR\Ü	\Å\é´\ÜM\Û@”›¶¼±\Ó+•kÀp{K·ná¨¾ã¨—†\æF´!şB„_B¿œK—dº \ã\Ğ‡|À\å\æfÊ±-w\nƒX\ç\Ä3œ\è\Äf0[[¡Y^Ó‰MN\Z/³\Ô\à‚‡C˜@†u‘†¥-\ê¸Ù3úÀ‹ü\Ğ>‰Å—˜­—ûy#\è¨jğ\äo\îR\î£`2ZM”Y¨ü•®9œµ\êÁº»¾üf—d¹«i\ÑıJH\Z•@¢¼\ßA\ÉÑª\îb‡«¡\Û\ÜT6 ˆ®o»6uğ€\ï-±‰šy¦“E(co9)ˆ\\A\Ú·L·6$k0%&\n´¶8c@š\Ñ@\æ\Åv\ïLÌªV\ç,…R¼”°\Ê^¶k\Ì\Ö´¬\ç#g\ÄzŠZ\Ö\Ú\ÎyŒ$@]13°¦’¿Ã¯G’¥\ÆTÕ„}Ÿ˜! \Ëw¡ó«\Ô& d©iğs\Ó{¨6]£\Ñz7\Ìª L_6\Õ>\ä\Òb\é\Ê!IW¨‡1“¼y?.Vºš´«h\"Z¡e/=\Ä@\'n9¾<Dõ\àKœ¥\ÄK“\í»Lyx€¬±§%ò\íúh\"­\rÒ‹UŒo8€l»\0 X7”_vkLF`ù\ã\ÚX®’›\Â\ÓA^ ¥\ÌR¹´´ö9ó\Z¢&º\ZÁ­j\àwÄ‰p \ã\ĞÄ¸2\à\Ü&¡GSI•z`©\Ä56BUõÀ96,|0ZE\ÈPiûA\ëgšQ\Â)š\É\èµt\Ù\ïÿ\0w5¦V³\05h¹¤o\àXA\É\Ü¥·oOÁ]G¾@Ë¹uº7šR§Pt{âµ®\Ï\Ë\0‡š-@z\"±;\è¶·Ì»8Te©€˜«[%\èF€\Ş\î\İÂ±ˆ\ê„l¬oA*õ»@€_,\0±\Z6 #_)wUN#A­òw<ƒ\ß¤\É[æ“¦/÷)	(¦³\Ø^!“¹·=¶˜\Ñ U^\ÛÜ¥PaO#\İ\Í-@lñk©[\ÌÛ‚¡½E…L¢øò\Ëú@o•\Ì\n,8\rød\ëP‚×¦{ˆb…)Âƒz\ÜK%6}B\æF??x2Šÿ\0—>e\\i_0 Sq:B‡8Gü\Û÷²‡|#‰ q&ˆ8˜^õ\Ç\Ö	\áªßˆ\è]iKE®rY\rP³‚/Vqóe $ps˜!\0\n¥{WŸo:º\ÆAÙ¸\Ğ8Àlo«\Æ\åš\æ‚\ìŸx0\Ğ\Õ\í\æó\ÌS Q@µgÁñ\Ìd–)X¥\Õus\æ\Z\Æ\ÈF\Ç0j›\Îvó¸†\âÅ¬\Z\Öq©¤R%\í\áqDn\é>®+d[™rªq_\î\Ã\ãÿ\0psGDÿ\0pxO0\0¿‰ıË…—¢\Ò\Ğ$õ&¿û™¿÷\n/\Çûóûƒƒşs8ñ\Ï_\ÌpN:o÷z=\íù†	KYA+‡Áh\Ïò4«õs-\"¦k\Ç(²z(Sjk@$h\äü\Åp+”8ø¹X49\n¨¬\ê\âmÒ…}\Ù4®’[3\Ì±RNS—·û—f|?˜}¹¯1k\ËV²!Ó”_Ÿ˜i5¶­s\ï\æ!M”\È\ëš\'\Ïù\â\0ajøKÊ‘z\ÍŞ§»€ÿ\0YilŸõ”Ö…R\âW\Ø\ß\âWu\n®p\İ\áœW‹Cr­ \Ø]b¡­Mkq\r ı«ù– ª\0üEj-·\Û\à”ˆ”ª_Å¢\".l¶n\æ\"³›\Ğ3iZ\Ù±¹K\à2¶\ÜCxÊ™\"B\Æ/A£|¸\Úip\"\r•¨d.òC>\âˆ#u„ƒhlÅ¸§0—¡”;!™\Í7=ˆ\Û\î¸øK\rò\ÎX–¢t¯\ÄÍ›\"Wû†•w,\Ó\Ã85ˆ¥µQZ#¤\0ƒÁ¨€+\æ6`_¹’\Ã8RÕ¦¢NtÌ°\èö\Ş\ØL²¢[\r¸\Ü32s,G„ª…\é¾\é¨\Å\Õo[P!\ÓSœ€$3†£†¼\Ìc›]÷AE™!\Éõp\å\æ–6û”C<%\í\ç§9I~iö†˜pqÃ—˜\í7J®¥–C\ârK¤öq·\æ/r\ŞB¬\Ó\Ü‹`¥€•o0\Ú\æ\0\ìË¿\ë\Ù)‹ô¨\æPı\ãu•\Ô\Åó¬EMK\rDº–¨—öT}q?„\İ\0\Ùq\æ^\âš+~\ï´[™\å¾ˆ²%UOlóU‘QW#^\æb´‹PX›LÁ\Ók\ÍS…\ä÷ƒ­KÄ½Xm\É\å½µtC±6òGŒÀš–\ãPw6‰õ\\òõƒªö\âú¹FQ8¦\ág3­<\Í\íZ­GP÷\äa‘BÇ…ñ\æÓ³;&r\Îi›\ØwS‘y‚y—4\Ä\Í9JH\Âø¯3>%%`C7*5°\ÓÄ«v‰Hù#h+¼Áq\ÒJ\ÍÁU™Î£Z–\Ã0”ã¤±\0ó+ŠU\î\áøs	¤6dıA \ä\Ü!U\ÉCõ@\ãU`‚\ÓR±U\Û\n\ë\Şg8q:w™m›4\à>.p²mıFÀÀE59D¸lHf\ß\\Wk$V\Ê!–\èN”¾2@\É\Ò\Şe˜˜„s©£´V\Ô,\àûcjı‘\í¤\ãü\å+\Z\æ\á)EG\Ãp¬ »ƒT@§s\ÔV\æW\î—\ĞyX‚+jŠ\Ò¿\Æb¯Ü¶@¹“Á¨\ÂÀ_Ÿxñ2\äOû¨&¡\É\Ê\ïğBª\0Ù§8¯¨­|*f§&#„\án\â„X\á\â\Øb\éº\é|~şeœ#\ÇfPT\å\ì^ò†kQšº?¸6#†\éN«˜s“CÀº<B\ØAC\Ï,§Œ\ãg¼°c\"\á£\â2\\@\ÔŠ¹‹™\Ç\Ä4\æ8°½C\Ú\'¦_…#y\É©\å™vD¸iˆÀ¦ Q)B›•p\Æ%Ûˆ¨÷\Ş‚–‹˜]ªc‹\ê*½\è¼ş\Õ\Ùb$-\ç®!\í\0k ÷‡uoZ[ˆ$\Äø§~\ŞI7g§‘%…÷òŸS\Í?÷ˆ‹Px/‡Ïˆ8uÌ®¼²¦)À\é›AM9®#\í]	\Ü\æ37¦\Æ.w. Ç¶@\Óú¡4ñT{\ÄÊŸ,\ß\å”*ø\ê/&4—ƒB\ÕÊº¬<7dd[\Ğ\Z•ñP\× –»\æS\ï¯\Ùˆ*$\Í\æ4!`\ÚØ®¦Ú™)W0RŒG\Û\í\r\ém«\ÄvPœ¥u\Öê‘›b\î\0\Í3û¾Jf–À\×8\ëõ**­=ÿ\0\ÕQ\Â\ê\\©¡·©\ØWs\n3\æx2\È\àQ\×T\á\à\Ô\Ç!\æÌ»(€\n\rn»e>$|#¾\éğzq™-\é\Ä\Ì	Sm¨ú\Å5BØ–\Ép\Ü\è©\Ó\Äõg)&\çd‚=0\íUKˆ&\ÆeÀE‹r¢ñ.Ã1xÁ^è‚™j\ËdW«‹\Ç3_\ê @ À«ye‘\à\Ì>#Q`a‚\à½ûDu½l\Óûˆe\ÃÏ“¸•l2y\ç\î\r#\Ó\Ô	\Ì\É^Mÿ\0r´o©¹Ø¿LÅ•\í­ö|Jø\ÊkÀó,o\Å%¢µµT¤ü\"¢\Ó\Ãø$\Ó}C±\Ñ.WP-8%„RW\îccjü¾!»\r­²–³-&S\Ş2¾ó!\í\å0YL\ÍK#\'¤Q±6‡N\ê.\í‘éŠ \r\Ê\êSZ¬«÷–\n\Ø`	Mu\æv©o|õ.:\Ñ6ÿ\0\Ø-\ÍP©\Îÿ\0ò/\İ\Ö\Ë\Ù$\ÙUüÁ\ì±ß™s’\Ô#XV‘_r\áKgOS63õ\Å>\ÈKi\Ä\0¸À4”ß¼·\Ü\åù±Wm¹”x‹\'œòn[%IXõa\ï(s9Ab\\2¦1#(\ì\æQ:0CGq\Ò-HôÃU2´ô\àX\ËË‰™+jf‰•\æ\åÏ¨—*l\"¯¼F@ƒOñ\ÆÀ£Ìµ¶b/˜a½j\rOb™W\Ì‰²_\Ã,\à-~cµ§¢Š†X\Ø‹slY‹@8!\\,bb!\r€¥_ŸHlc3ı“	Æ†>¥ó™hS–\Z\î\å4\ÄXø\'¼x{aOb~è±\Ì%%C\Óö™Û™³\Ì\×\ï,ÿ\0*c¡•\Û\Ú¥EA»\ïÄº\Â\\°y…ÈD²½\æV´ÿ\0 µ[\Ïs\0\èø%Ğ«7ƒ3J\rPñ\01‹–%@7\Äv\ÔÅ®’–ÿ\0dwW…\Ó/Ôv\éSó\r|	Áûƒp›‘\n”°@x\Ì\Ò\\ÈŠ»1\í°:¡s3c\æ1\â1H\Âj\ã¦.\Î%P\Î\àR+¨•1€#\Äğ\n7\ÄU\Ë*\'X¢ªP­[Y ı“[l3Às3û(¯\ß\Ìm\Ü(el2õ™u­½Q),Š¬‘:¬‚®¥Ë®z!\ÎM\Øv%˜M”i¬M¬\Şe\Z{!\å3UwL\Ñ26NN¦ñ\Éu9‰hRY˜­ğ\â(ó¹‚^\Ñ ‘ÀCY\Ä2»\âPOyíŸ…ñQö—.]F6Ê¨)}Eò÷›\\\Z\ìi÷\ê2\Ø6|[¬\rğf%À¸„“ğ¦¿–5u).¡¹g¼TË—\İ7M)œD¿w\ËÁ]\Ór€\Ö]M\Å\ç @a\Ô\\\ÂJ1\Ò%M—\å\ïdBfM¥A*şf9p\Í\é\Âe\Ü\æ7¹v\Æ ,œ\\µ\ÍŠù‰›FbÀ—‚\ÆV¢^fCC¬ ¨\Õ!-’\Ô\çS€T_ÀÂ³\ßmu\Ñ)MV®\Ï2Ë¥«•ºÄ¸€El%•Š*†`i&f\à?1aûŠ´¯?Ü¶\ì-Ss(bRH2[u+²\àbp¢V\ĞeHx„ª\r1œ`,R–½§\ÃÚÇ¼\Õˆ>·P\Â<½¢\Îü\Ã\ĞÀÅ˜Œ½Ø¾\Ø®A\ï\â&•¶°%\Î\ã±\ËR½F»Šœp	Ç¥š0ómH.ñ’\Z6ƒƒc\æp2’	¸´\í`e•*%N Y)˜\"}—òˆ\î_7Jó*be‰LB7/¹Gu(\å(e N÷*p«\"X\è8\"z\ÌnoõM\äJ¾f«2\áñŸhR\áú¿\á\"U|Us\âe´ø<@8ƒop\n!«\Üz+Å¨\åƒ\Ñú™\ÒF!“¾ ¸V<s\â\Ô\Ò;\'S\n\ÙYP·(¨\æQ*\'>ğ±\n¶Ÿ‚„´\Ò(°\Î%@F€ZF(ş£Tf¦\ç\ât¯“Öˆ£óù\'$AW\É\ìw+A6ºøş¢\Ğ	²\×\ïzŒpP`ö†‹—qEü%R\n\\ö“¼,4GFHWšgqf—¼Š‡™Aµmõ\ÔÏ¡.¢\Ê\\X>cŠ7\ïRóº•\Õó.R“Ÿh){Å™tJYG´³\è\Ô:•IqôÇ¶ \×\ÑITû\Âb3»#s:`Ú±\Èö˜|§ñ\\\Ç72—¸@\rq$~•òùƒ|˜%#®\ã£-ûÊ‰ˆ`H\î)%£f&6µÆ»#‚=zŠ\Å~\ÑEˆ9}½ˆ\ì\è*+l`òAK-g†;\ê6\Â%1a¸\Ëe f(\ëØœóø¢ÿ\0‡0›<\Íşó_D±Dp\ËYi·§1\×±·\æ/\\¼—›ˆ‰C‚b\n„…LYıÇ¾*<\åñ2\\\0˜Sò‹Ø©us­ ¶3P!´‰j\Ô\Ùğ%ÿ\0;ôy{K{W*1<\Å\Õi†{\Ã?b\"¥Ä³\İ^ñŒ‡‰T¼IUĞ³\Éb¿K:¹YØ½\âLœK.J†øqb¹U\ã\Ø\Úğûˆ\İd^«ó‘ù‰‹Å—\0Wˆ&\n\Ğ{Jİ_0U¢\Í\æ\Å–% \æ\ÖX]‹\Ô>Š\Ú4\Ë[–ğ‚¡d°\\j4JÙŠè¸…]\ÅFªU±ª=§\Ì\Ú!·R“\İú´\Û5ÿ\0?\ß1pú³š«ƒG\ÜmBu˜6Î··\â˜i¡>S\ÛË\ÛT°oìªk\âJ\0f·XŒ‚\Ìfm¶» \ï@¶3R\äpaÁ>U‘ñÅ—\ë~•€0\îS¤øT5\Ö)\È\Ú\î0`\Æp;™‚v^&_0O)\Ù`Bª7\Â\n¼Ç¹¿\äT­NZ\Ì6CW9¬F\ä*	Vo!*C\Ëhóq‚\ëˆd6\ì\é>\ÙN€s„~\Éf®õ¨’‹·\ä¸ø¡R¿lFl#`Âk.\\\ÊÆ«\"y-pk‚\n²@t{ıÁ\Ğ~\éı \0«NE\âÿ\0I]°Ï˜nS†&F‡´G>ğA¯’Š\âY)n6^\Æ,EC\í-WPl\Ü\ÙXÀ	j\Ïs\î”DÆ¡\\\ÎWrˆLO´\Û%@¶dFEÑ†\Ì	PŸ–“˜#‚\Â=\åfX \Ñ|\Åp0şH—Á{vª%§«r„²\à˜ù\Û\n°eúŒ“\Åx_œ¦:\î(+ÀD5¬Å¤Eº–T¹¹^—\è7?dYrX@£\Ú\n’gb\æ\"]3…L\ê¬t\Æ\Û`—2¯ˆ\á\Üò•a‘˜™ˆ\ç´+„F˜\Ê;÷¹H\Ë\rğ\â/c¸¨b‰Å´¿`¤\Ë2J»z	Ä²)ML£R_‚\Ä\å‡c$P\Íe\0\Í\âkE¶‚ÿ\0™¿z°ùH\n\ÉMs.8\Ö\Æ\Èdª\Ù\n	®\Ö\ì&\Ì\Æ\Îê²µ‹µ÷šqmş%\Zk±º´0À±Juš¿!+›P«#“\äˆ\ì¡o&µ˜W)#¢0¨%„\Ä\r8Sş\Ğv©òLÀ¸ˆ\ãÑ¢…s3‡\é›=cˆ¢q*B¾\Ñ	‰ª`Dœ\Úh•GtWP\r­Dfr’Øµ ö\Ì\ØQ9Uq“Kµ¿Qd\í\è¬ı\Ã^5˜À7SX\0;x€“\rT½-\Ô5c•s÷·]…Á\Å^\ìc…\Ä\íÁa\Íb_VkŠ‚Ê³@4›Ÿ—+ü\È*¶¶2|&1\ë*…3)x\ØT£+½M.Xxf¡\Üc†8Á]g\ĞM\×(­·Ï¢`fü€«û³ùŒšK\æ4!\î\Û°ÀË¸\Ìc#¸M²š¶\è/€Ä£•‹ªc\ÃS\Ë\ìòõ-(/¡Ÿ\ÅşDtÚ”ğ™‚2\Ç\ì\nµ¹\ìn[Pr2\ËN\"[=¦.¶Å¶ÁŒ+-„¨4RıLÊª0M(;q•\"ñ8/döfD±œF¢û™ø\'ˆišz”\Â\àXÑ…0\ã\í\ÅB#£\×\È\íµ\Íü\Êˆ ûÄ»WDA/Œ£?¨)»­üD#o;q	)œ\Ü<a£†qT¹–/,·M\ÓPÄ LMs,¡Ñ¦0œ€ğ\ë\É/2\åÁ‹N#»,¢\Ãp\ĞRª$\ÒE)\Ş!X9Bi¨\Ùj\È\àeº\èE©DÅ¸>ğ\Ğ1\Ö\à!ù”ƒ_\Ü\Ç<j\"\Äo¸&‡\Öö¤\Ë\Æw\á‡÷*Nhu˜[®Ls\è`\îl`\'\İ>\Ú\ÊğË¼ªşn×¶zl°n\Û7m|Œ¾ÁÄ©\êd®\"kTR\"\ï\á†i‰l·™Ô‘\Ô-N\ÈÑŸ•ñ4V¸©iq˜¡g0\Óû \ã\ß\Ñe\Í\Í`\È\Ø\"wr³R\ì¶b\ÒU€Š\Äı³Hef6‚ŒÁ\Ç	¢\Z1\âa –®¦n\Ú³¯\ÄÀ\ê*BQ/0G\åˆbB\ê\ålüAl@fİ°\à\0d¡`ş¢Áx¬\Ïú#z‘=\Ì\î*\\}T3sŸR³(E\Ì	U.)uøœ¹D=z¸\Ê*”\â\Öv£4J7/=\å$¨Ù¸\æa\×epĞ°^\n7³¨	\Ä@\Ì/V\à,bj7Äš˜ .‘k\ÑYª`?%ü\Î™8•<BŠ·¸”‚‹—3¾bj¨|Kú¯\r•`c)xIT\×¥:q\"\Å\0µ·û7 v)}\ãó\n„r9À«ñ* w9‹o»&ºùEò°{79f|\ÆY¡\ç¨H†\Ñ\"¬Ñˆ­°@0Q¹–ó¬\Z\Â±”v|1SöŠ\îF0\Û±.#jƒó ©\Z—R”\êß„\Î0‹ò˜v`´”c9…@”„\ìñ\í\ât¦®Um\ÒŞ¥0¼\Ñ\ÄÀJp¸^:`Œ\ä3û•õ¨«e–òLFÚƒKHSs\ÒË‹‰Ìºƒ>bÍ‹Á4\è(*¤7G˜‚«b \Å`\0 G7š7\Z?A*5pW˜)q„®a\ÍDÂ\Ë\î1Š»ö#·t~\á¨i›—L‚\Òò€°º0>¿r1\rE¯E*<\Ò%\Ì7\Ín\áÊ…á•¨§H+Q¬† \ÖCR\İITşa:\ä\È,™¥Œ€c\Èü¤!\Ä\Ê0½q¤­Y]ñh©\×\é\Äk³oxpKA«\ÌÁTâ †Z\ÄÎ°ŠË°\èƒhôl‰m\Ìc%@F=g7–°\Ì4\É\Õ\Ïq„s]™—M0\Üj=>f†a·	k®\ã¯a¬:†¨\Ù<\\yl£,ş#U‰Ï™}˜6¥:°ñ+\Ş\ã¶P\"\ÛV_Xø›Œ\Ôe<\ë2—ß˜\é±ñV8ñ\è\Ç\è5\\·\é<ü\Ô@ğÂµ2\Ö`ƒ˜Qªe¶\ãœ×¼Af\0sr­%\Ì\ãŞ ¸™%f&P\Í™\'ğd¡—DB\Z\Ç\n\"²)õ019¸Û˜\Û.%÷\ã\Ñegˆ¬ašş¥	W!ø•ƒ\ìT`\\9B\ØT\Å\å+(5\Ôß˜v7Mø¶\á”\Å\â;Šø•¨\Óp|$8M²q\0k\æR†\ï	¬/Ü† G*!\\\Ø(Q¼ ‰s\Í	C’©\ÜFnf\Ù2ŒE\ï\Ş0\ÇtÀò¥Ì¦a¨*t\Ô+1X#±0µ×™‰R“\ãCD(,strıB2€`”ø˜Í¦`¥\ê\Õ.ÁKv%lu#S,oS25°º\Î‡÷+x¦R¦Q\Æ&d\ÛpTö\ãm‰[.,[ô>ºRh)ù€\Ğô\Ğ2G]J\è¨Th¸+\Ú\Ø\Ğ3\ê\ËÛŠ(W\æˆ16b,••\\³{?H€n	Ì»Q˜Ú¥Ç†\Æ.\Ö•ŸE\ä\\Œº\î-Y±E\åz%PŒV¬\ëÉ°Å·Ÿ\ê>±\æ	Q5#\Ã\Ì}\Ë\ËaOš„3j¾\Ã.3y²\rAPæ¤¸w64).£Ìµ†š—4«7\ÄA\ŞUZË…•¦¥­p4Ác1\Åñ\ÍEe\î\ãÒˆ\ÂıÀ2n£š\ÇE\Ë\ê?DoI»‹ UÓ˜º£XD\é8¹È…:•]Ê€óL3\n‚\ÆKb\ÈO,Ä·p.Ÿn\å\È){\ÄÍ±mk¤\Ã.%Xªqq,l£õ	ø\ÔI\ßu=Ì¶\\;c“\Ğj.b\Äq˜L-ªm\n”9—\ÑÄ¾\Ü}\å\Ä%`øŸq\0%¨fƒ\È\ÄK¯­À\n\Ù.	\ÈHšÖ¬=£1„wÿ\0ff?\Ô\ÑcÁˆ\Ø]KupºşøKL?\ç†É«U\Ñr†…`\Ë_W*Z\ÂÃ‘\Éøõ”\æG§PW,\äID\Ó]Mnôn£Gô…¡@\r¤Zis©xµv\ì\0,sx¹^]\æşh”¯,¨¸”\îŸy¢\Øó\ï\ÅW\Ë%Ÿ5,*B+¶\Ï/…¾`C\êd\r—ó\Â2o˜}6G¿c7¶ “L\0> \×\âY\Ñ\Ü1Ha^\"ª¢«1\Ó\ï\0¼…>e`°\ßr9‹Ãˆ`Z†À¼û¸—h\æ\Çqó\â\â¼BªSŒ9‚\Ñ.“c\Ç,Q\éz–d®\Ã\0ttC´5Ó\ÂG¿¥¨2@A¹xô¸eô1\ÊHó±o2Ô®† ¸Áˆ%aä•®“rXCyˆ(\Ñ\Ë_º¿\Ä.‚9ûf\İ\n¡¹a:\Ûz§÷€Ö\Ù\"\éT­maü¥.=¡R\Æ\ìE\ç\0m”$-0\æ:^ù^k\'\ÔÁ,™L\Ä\Íö”\á¡`\áÅ’R’#7K\É\\\Å!Àgbm÷– [7j«Œu\Üs\Ímß”­	z·\Ì![Æ»yb¢\á36‰—G1SGWS`µ\06Ë·ˆPñf‡d¸[Ì½˜\ÙÄ¢`Æ”\Ù\Ên\Z‰,f,@|EeQ,ŠNf …™Ef¼\Â\Ûğ\ês\Ş&F…öŒ—ˆ7•P2^löŠ“[­„\ÒW tdhG\Ş\ç©OˆE(j¿\Æ[Bù\Ìj¤–££˜\Î.\\˜¤nŸ®†ul© Ë e\Å\Üb“W+&õ/I³¹y\Ù\"™%\ê\\ğ\Ë=Ò“xk\0|\ÌJğ \\Ö‡\æ\ê\ï\í6—\Ìg:\\\Êô\Ã=²¶I_–¬k\ÄUL«˜\Z\è”\\]:¯\Èa…rÍŒ÷\ç»\ÌwC1\êôÚ¥ß’¢ğ¹¼\Äú.*\è2\Ê|¸‡\Ç\Ò\\\Ô:ñjmE\0oX\Ó\ì‚\é(Q.0•û™H\î]Kª\Ä\\\rJ¥iv3S©L^\îZ£º÷¡¯Œ\'á‡»\"q\'Ì¶´1•\Ù}‘\'\Æ^\Îl,$|Ì‰Q²87‹\âR\ÕW\Î·ñ0\ÔP‡eT§2\Ó\0´\Äf\à\ĞN¡l=\áÁ™b¹3\æ6®M…«\rRoû†\Ş\ß÷Ã§\ÌÌŒL­a¦5ô¥˜?\àr—L\ÅK¨\Æ\\\Ê$fxX£“\Ğ¬2\Ü¯o¨ş\áùZª\ç·\ÌşB-Ñ”ë‡\ÓWd s7\ÚY¸\â“\"c\á\èğ\"\×w!£\Ğ;ğ8a¶&;<\'	Ô«Y”«ú÷ag2­\ZqÜ¬\Ğ\ìV÷J§QØ…`ŠEx\ÄUr¹Wl\Ö>—pP¸\Î\êT·\r’\Ñ\á¸a¤\ê\×\ÄxõeJW¸ˆa˜¯\ä™\'¼¢[”¹Ì­ƒ#¦\å;¢	`IJ\Ø9®¦Íœ\â&x\Ü\n»\Úû˜\É\Äk@\'‚N£”õò\æ]Ì¾e;DP¾\"\î1ÁÁ\Ï|$\'TöÁ¤x\0;\0ñ<\ã·X0võ,–¾’¬\Ş\ï­€Šû—.:¥n;:—@¬Q\íJÔŒ\ÜM\êq•x‰N3˜–A¸~ğS†\ã·7¹x¡Iª,¦\â+øi\ìŠB\æ“X•Ÿ3ˆÔƒŒf:[\ÔÙ£‘¡ş™mCX$”\Ü\á#L·0\ç&¹A\Z\ÜNRõÌ \Ê\ì\â<Eqô;		ZRø•>‘T¥9Bû&	ÀH—¯¼]õ¦V\î\'Ô­ x¸<´bf¹”\Ü%ˆ«7‰•Î£\Ñ|\"ü£H„\ç\â$|‡j.ˆ¦3\Û§\Ò)\ç\î*\n€Ûˆ>NØ·r™[…\áÊµ\Ì0µ!W\åò3?”‰+µ\ĞV\âs(KW9‰m?1\Öw\0\Ëó¤4•s4\Ü]px¸\íIH³²7«‰t\âdDOÅ¨\Z‚\åŞ§4B\rv.\"š4\ÔT‡K¨óp\Éi\Z5\\Àw\n‡\ë\Ú\á -ğO$[<\Ñ2°°bg\ÂZ\âZ\ÜØ‡¸Á!\Ğ\ä\0Ceƒ§»9‰\Ú\Û:€]\Çˆ,°xs9™W\rXÚ·\èŠ,¸‚c¢0\íp>}ı\\°<J\ÕBW°A\Ê×‰ˆ¨\î\ç˜%\Æ@´š`\îyA‚g\Ø\É9o¼\ê¾\â\Î8\"\ÇZˆ\Üf(§3>OR‡ö,Ø¶^\"«\â\â:Ì¤\é0~ ñ+L<Cr\Ä-\Âvy„Hb#§§\ÌQÅ‘•\Ã ùZ\"‹Á\Û-¾\Æ6\æ*Š“\Ép4zqE©y™V\ÔZ\É\\K C\Â-P\è\æ\\9¡¬I˜5FK2\ç‰J½À&!n\ì1R\ÑU0ùó\0<8–(ó}£_3\Şa,/x\ê$\ZY\Ë+	11¸¬	b9”WÄ»\ĞK\Ø>\ç\ZÕ‰T‰È˜G	8\íY°Sµp\æ´ğ§x«%0³x¯s]\Í£Û¹wˆ\í–7[…\Zc…2¬\Şşá™Ÿ)\Ì.}[0\Ìf†\ÓH®P\èqé€¾%…F&T,Ï¶\Ú\" 2K )\Ó-V]wqZ—°†\İ^c\â\çD\Ş\ï<ŸRÍ¬É¸\Â\æ,¸¶Ì¹O†ö\Å|ÁN\â\ZL½d–š\ç“§\Ì$Ì­ñ¦Dx‚[œ‘·tua!¼8\Şgµ¢M`˜C,Î›À\ë\ï1a¨ª-Ë¸­z…\Ñ1\ß\ÙqZy>N#P9cu¬\Ëü #¥Eƒ8\Ûy\âOaD .ĞJ?ôuÔ±|b…\â\â\ï\Ä\ÒY#F˜™f“I„Y\ï¬2\ï¨\Õw/#²‰}2X8C‘0Œ0µš\åWœ¯ş¨¨6O°ü\Zg•OEC(\Ì\ĞÁ{GØo\Úa\â· Ö…\\k\Å\nedvU±ÃŠù%²Z¼B¬	²&(2¼’]GöVB\nc:W«\Ó\Z\ÉFà¥³\á…C­”J‰\"¼\\Ppq,7˜¹‹š\ÔXÅeq\È6\Ë\Ñ.\"¼Å–`y—Å¹ayŠVqFÇ‘ş:ŒÄ–V$;\ä[s…Ağ\ÈDS8A\Ù+-)ó¸\è<FX¶\ÂšôR\'	^ó\n\"\ß^e\Ó8™\Ëˆ?“™™P\á\áŒ©²	ƒ…0Ái³\Ã½®}È‚}ø`\ZNG’Q¿¦dñaLÁ^beôº¨\å›¤ =¦]Lc!öó\Ã3œ=\Ãó<7P¡óq€qK•D% \â6‚\ÜJ¨£˜i I\ÉóaŠ*\\TJ\ÏK*f6÷ŒQ{”k‰BÁ½Ä¾¬Ç£\é,NzE¿h\ÈÃƒ,Ã½sd\ÌE»IfgNr\Ölsœ\Ñg7Š£‚^#0ß–¢å‹˜ˆª-gV\ç x–ùùu\'$\ã\ä¡\ÕÓ–_vZƒb\Ä=\ÖZÓ±ƒ\Óñ†¢¼5µŸL#¨”D\Ìós;©ua³Å¦ÌŸ\Ä²¼@\\§$­;¹`Y	’™?0¾33¡ŒöK\É\Ö|w`VA6õûñs”\âq\r\Ä\Æ#LÌ¦A\ZC«– \Ã<³]Dİ³¼w·@[<\Ø\ÆR\á¸P‚\ZœŒ¢\Ãõ™WG™€4©ŸE\ê\é½#	U“\"*nd\Ç+Wñ\Ëúˆ\Üøœ2¾ce\\”pÆ˜÷•	¹™yu+P+a\ÑqS/&p\Üw(L=)1+$¤e‚]öbÁ@²-\î,\Çv^5	Yú€\Òı”{¦D¬±ª\Î-\Z…L	®aU`Š\âñB·\éW%³\Ü-÷1ÅÁ¸\Òy”2\ß\â*\İø‹™“>%/Wª\æ+\ÜE#8w\0\ÂÊ´\ëPb\Ü54q\ÑÄ²\ß?\Òtğ³Ü•§™¼D\ÅJ•ŸG^—7¸¦\ÉÁ-K%x•e§oh s™Œd,Š¹øƒ3eUJšƒ	wm+c‰z—\ã\Ä@¬’Õ®\â Z\Å	K`š\Ğm—g©¤Q\åû‹Š³-JóB¨øˆ‹/0e\îc\âó[°Œùªq\àw\éU‰rì‹‰€p¹•Ÿ\æsCDÀ9_\ß2\Ôñ/LiÄ¯ƒ1V‘¦`\ä†\Ñf°\Êr\î-ó9˜³^fn\ÉMù™ó.´™‡\æqùŠ¥LÖ¥\âd=ÁşüN–€²ñ\Z\ï»Ÿ\É0\Ç\Û2\Ü\ß\çk\ï)\ÄLS:Ö–ğ\Ê\\\ä\Ü\æ%zd\Çx˜©¼²ã·¼®\Û\íG5´X\æ\'\Z\Ã(7¶\íeı1…µ\n‰ƒ\ÌL119 Ë§\Éù–£3”z³\ÌF—+i¸…˜aELcú\'5\ÜoL^\åÌ²‚*³D\Z\à\nˆµ%¹ˆ\n\Ì×6ibvD²¾šÔ™F	R&1\ß\èFi\æšÆ©7\0Ì¹¬\ØõôÍ–‚i\æ\ZD™˜bX\n“\Ä\É`±\é~‘-\é!@\Â!šL€\rÌ–\n‰\é\Ík“SşIª\ã\ï\Í\Òı -\Ì,>Y–\ÃĞ‰®’³8h¾7¼Lsó¸,?\Ü\\V´\\x†\á\ÚU\áhn9!Ç‘‚\Ü\ÅÔ¥œ¢oœÓVv3¬Klœ»Š®HOHQk\Æp„\\\Ğ\Î0ß¡—\Ò¹…\Z‚rR¡†P—·$,\ÔÜ‘J#«è¦‚ivZO¾^’\ÔÁ‚m8€3§‡x½¢\ÛZZ`ZK\é\ã‹K‡¿&8ck·ÿ\0Áoÿ\0\å¯ş•ş9ÿ\0ó5\èi\Ğõ¼¯‚\\òÙš\Z\á‘ùÿ\0ô\Z”,vùğy‰p\â-ı¿@Z\\f¿“O\Ìöš¨z¤€A¦Á¥­Õ¦üµÀ¬pn\0?+î¸\ËÀ\è\Äel8£úElg¿÷\Ç\Í>ı±\0Nj\Ş1¼\Ê÷Yt»\Íq\Å\ÏÁ\Êù%.DXdÁË°tş\ã¯@\Ùü°›£@T\à(ª^‰2Ñ’¹`\nA>hÈ1µ™z\Ì\Â.§ö>‚(\â”Ä¦\éd¬„5•š\È[óı½-x\ê;#\ì¹¨\ä\Ä2Ázx´®\Ó\Ğ,õı•xı½2\Ü\ZÈ–«Ö»‡Íar]\ï_ş\ÊW^f9Šxñ\æ8-´û÷mıxšô²xr\Î\å—\Ìc»\Øı\Ë\Íó\Èm\\odP^× õ¿\Ôh±õ\ÖVz.½\Òû§^•\Úû¡øu¸¸4I~?Á¬Â²?\"O\É2ª3¥«µU_1Ğ\Ë„e\Æ\ÊkW\Î\Ïøú@\n\Ù{¼}±°œ]\È4Y\æÿ\0\rir´w1\Äü\ÛÁù˜³ÀtR\ÖW=\ê3o²_©Ø\nû9s \ä\ß\Ûpúş©ˆ’?á¡©Gƒ\Ç\Ôu&!_?2Ù\'I\Û\ã¢[\ì;5™yø\éó\Ì¿|yŸCB¦©*Óƒ-.G„H©\Äù¸¯%ûJ\Æ_“²8-mÚ®4]AZZk“(œŠs\ã\äbÑ·@®\İ\Ä\é`¯6³\Æ®úJSN\àüf\ê\Ñt˜(Ğ\Õ	‹V°\Íj½ƒyÔ­\ïô€¢“®‚\ì4tŠ\âùrù©!A\Zğ‘\ÕBT”¿Ÿÿ\0\n\ãQ<\İ\ï\Ú?•÷–\æv¸:ƒA>\Æy}£2\î<IùaOú\r¦eü0ˆE¸­\éŒ,\êğsñ‡wÓ¥\ßl¼†Á”ı_ü0·]L¼>!\ë\ãûŒ\ÛR¯\Ó\É\n@\Ä‡ÿ\0\Êe\ï\ím¢—ò?€™\Ûs»ñ6—WNcŸı€\0\0pğÃ¤cFù¼#\Ùÿ\0nfB³VI/–ü<“9azü¾Ïˆù%+`²¶LE~™‡³Ä¥…\Ëk•Ü¯E#·µòÿ\0òÄ Y\ÒK%DÁÂ‚~o\âRA,k¨…\Õ#»\Ùò)ÿ\0ôÿ\0ÿ\Ù'),(5,'BD_modificaciones_CI25072017_wili.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','PK\0\0\0\0\0!\07‡Q£\0\0G\0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´–MK\Ã@†\ï‚ÿ!\ìUš­D¤©?À‹\nVğºİ´‹û\Åî´µÿ\ŞI\Ò‘jŠm.dg÷Él2ºù´&[BLÚ»‚\çC–“^i7+\Ø\Û\äapÅ²„\Â)a¼ƒ‚­!±›ñ\é\Éh²2\êv©`s\Äp\Íy’s°\"\å>€£•\ÒG+N\ãŒ!?\Äø\ÅpxÉ¥wX1\Øxt¥X\Ì\î?\ércÁ$–\İ6…UVÁDFK´Î—NıHlr\ê¬k\Ò\\‡tFŒ\ïL¨V~\Øô=\Óh¢V½ˆˆO\ÂR_ù¨¸òra©3ÿ³\ÃÓ—¥–\ĞöW´½„”h\æ\Ö\ä\íŠ\Úmıwy\ÈEBoß­\á\ZÁ¾D\ÒùÁ:-´\âAD\r\í…[\Ø)D²?ş0Zt§DÂµt|ƒ†\Ûˆ\ÔĞ‡À†Ü©°‚\éko\ß\à\"\Ò\Û\nÒƒÅ–¼·Bı¾+Pı©löVzT=†\à\"%\åN\Ä\ÔÀñ5Zt§D\0ú0h¸ñH*h‡\ï™5\æ¯Hª¬·gz\â?\îyûe«ºa¯}¹M$ôÁ÷›G|G6¯\Æ_\0\0\0ÿÿ\0PK\0\0\0\0\0!\0‘\Z·\ï\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’Áj\Ã0@\ïƒıƒÑ½Q\ÚÁ£N/c\Ğ\Û\Ù[IL\Û\Øj\×şı<\Ø\Ø]\éaG\Ë\ÒÓ“\ĞzsœFu\à”]ğ\Z–U\rŠ½	\Öù^\Ã[û¼x\0•…¼¥1x\Öp\â›\æöfı\Ê#I)Êƒ‹YŠ\Ï\Z‘øˆ˜\ÍÀ\å*Dö\å§i\")\Ï\Ôc$³£qU\×÷˜~3 ™1\Õ\ÖjH[{ª=E¾†º\Î~\nf?±—3-\ÂŞ²]\ÄTê“¸2j)õ,\Zl0/%œ‘b¬\n\Zğ¼\Ñ\êz£¿§Å‰…,	¡	‰/û|f\\Zş\çŠ\æ?6\ï!Y´_\áoœ]Aó\0\0ÿÿ\0PK\0\0\0\0\0!\01§i\0\0@\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬”_O\Â0\Å\ßMüK\ß]7T\Ã\àEMxUL|-\İ\İX\\ÿ¤½(|{‹(41öñ®\çş\îi\×ñt-\Ú\äŒm”,Hf$\ÉU\ÙÈº oó\ç«{’Xd²d­’P\rX2\\^Œ_ e\è6\Ùe£m\â\\¤-\ÈQ?Pjù³©\Ò \İJ¥Œ`\èJSS\Íø«²lH\ïA&GÉ¬,ˆ™•®ÿ|£¡\ç-\Zn”U¦\\	ªªª\á[\×|H³Ñ±1uhg¥uf\ÌÔ€ñ\Ä\Ô1zºıõ™ö\'F\ë_mOLH-nZğº:\Ôş\î\Ó\çgFZ#\È\Êşü»•\Å fr%`\Üı:°\ì¥D‚¯,*ñ\îº\í!\Òô \ÒA\ä!šaTšß³\èŸN0¨‰ \Û€Ÿ²ƒ9\Ü\Ædø‚\Å+ º‹\àE\á‰Á4²ş*\Z”n½º:\Ôò&\ê\Û\Ğ|§„F1*%q\Î~{iA\Şı\É7\0\0\0ÿÿ\0PK\0\0\0\0\0!\0«¯Ù¤2?\0\0%N\0\0\0\0word/document.xml\ì}\İr\ã8’\îı‰8ï ¨\ë\í)ü\ìØ®\rü31\İ]\Ñ\Õ3{¹AK,—¶e\É#\Éå®¹\ÛG\ÙØ«s··ıb‡ eY¢)‹R™(gwDÑ¦)H~_\"3‘	ü\ë¿ı~3|\É\ç‹ñlú\Ãü\'ôfO‡³\ÑxzıÃ›¿ı\ê¿So‹e6e“\Ù4ÿ\á\Í\×|ñ\æ\ß\Şı\ßÿó¯÷ßfÃ»›|ºML\ß\ß\ßxóy¹¼ış\í\Û\Åğs~“-şt3\Îg‹Ù§åŸ†³›·³OŸ\Æ\Ãü\íıl>zKF\åO·ó\Ù0_,Š\ï³\ÙôK¶x³jnø{»\ÖFó\ì¾øph½~\Î\æ\Ëü÷\Ç6ğÁğ·\É[õ´!rDC\Å	~\Ú=¸)ñ6ô\êICì¨†Š^=i‰\×R\Ã\à\Äq-‘§-\É\ãZ¢O[RÇµôN7O>»Í§\Å?\Í\æ7Ù²øu~ıö&›ÿvwû]\Ñğm¶_\'\ã\å×¢M$š\É\Æ\Óß\èQñ©u7ttpò\í\Íl”O\èè¡•\Ùo\î\æ\Ó\ïWŸÿnıù\Ğõ\ï«Ï¯.Ÿ˜·õ·R\å\È\ß\ÎóI!‹\Ùtñy|»føÍ±­üü\ĞÈ—\çñ\åfòğ\Üı-nI—]\ê\ÉU¢|l°M÷Wò¿™T=¾EŒZ¼‘\Ğ\Äúmº°ı=¹)Pøø\ÅG‰fC¸¸¥yh€<i@\Ç-!ı\ĞF%\Íb<\Å\'7\ÚY\ä‡5\ÃšY|½y¤úı\íõ·¡\å\Ïó\Ù\İ\íck\ãok\íı#÷\ï\Ã,|@[+\Ôm2añmùø9»-T\Â\Íğû÷\×\Ó\Ù<»š=*04(`0(\ß@ø·x+ƒ@º7\ï\nS\áj6ú\Z®·\Å_\Ø÷·\Ù<{_¼mB4—^§oÊ»…¢]†»Èˆ\Ô1Y\Ø÷\ßf\É\è—\âRHz\ÎÖ·>\Ì\ÃM®$I\äú¦\Ë?ew“\åÓ¿|\Øh¡\ìÅ‡y¸,n³a1œ\â¡\ì\Ó2-†L\ÆAÀ„­ù\å.Œ/»[\ÎŞ¼\r›WŸû\Ùt¹^\Ç\Å\ëıu|“/?\å÷ƒ_f7\Ù4|ú³.šÿ2\\<½]6~Uüûvõo\×=7û¤¹ÿ~ù.-Á\Å`1›&Åµ˜M\ÆN\n†\ábğ»|P¼ùQ~•OŸ³a>/\É\âÁÁUV\ŞŒ²\ål\Ú[V­V|Š\nF°÷\Ä\ëmT\È\Õß‚Š\í\Ç{ƒŠ:šÅ†˜\à„\ßBl˜\n\éÊ‘´\Ûö\ã&6*9¢		¨\0±µ6\ÚzÎƒ’±µ\çÌ¦.\Ûbc+i\İg\Èû¤&6+©0¸IlÛ÷Vl÷õ¹n5\âu#LN¿\ÎF\Å\ìf¸\é\ìK>\ÊF\Å\ÃÕ¬6\'w\ãb^›“\à\í¬p\r_·wù¨øÛ¢˜\ï¾dóñ,L“,8+ù ¼öÁ¤¸œÁù\ìf¼˜-şeP´xó\Ç\×-f\ÊOy\ápM\íOÿøß›|>+™²\á2ûS‹‰;N1—\á5n€K¡±K‚‘õ.fXº·}\à\Ú~ü\Ò8i}šr”Ñ†Øˆ£\Ü1¬£Å¦\Î8¹\0NØ}JçšË¯·E?·ùdòq™Í—«Şœ›´%u~É¯Ç‹\å|¶Å•]½O§£Z\ß÷½\á\çûAT\ĞJ#\Æó|5´R!,Š·­N@”}\ç5\Ğ8OC1~ôºö{ûñ\Ó	\ÌJ¥2\Ûb+4‚P6y\Ç1bs\ÌR{:\á\ì”ÿµFó-?÷VN\×\Çq)_fñšn\çya#|\Éß¼Ë®\nf·\ÒQM\Z6Ñ½»dÿ¬¹ôµF¢N?\Ìg_ó\áò ‰\áA1,¯&«Ëªµ«\âµ|\äÅ‡¾d“\â«\Ã\ëÎ¦Ã»l4\ŞM²\ê}ı{ñ\Èıo#¥&¨¾bôû\ãÍ¾\Î\î–\ë?}\Zÿ¯\æ¤â¶\èÊYù•“üSx\ê~¥j\r\Í\Ç×Ÿwş9x«­ğµ³\Ùo½GL—ú4/–¿ÌŠ6Ê¾\Öoõ\Û\ã\ílrw–şşp£|d:û‹É¦aÂ©~û{õ~\ì\ÃZzG\á\Ç\ë\âZ´Qõœ3Ufë®¢Mw1Â¬ı\ÃXÒ†Û²°Ë\Ş\å	oş¾¦&\Ö\Ô‰\Ä\ã˜†º\Ü\"÷8•!N\Ó8clZ¦‰ñDûZ|´>yÿZ~>õ„\ÓjY«W®pDü=‹Ï£,\'y6/5›\Ìæ«‰¥|ı“â¯„ÿ\Ë>\ç7¹/o^e\Ãß®ç³»é¨‚ø\Ã_>~.œœğ™Y¬:S›e¥\Ô^—ó\é>\ã\äy™=™e·/gYGE*\Ğ\æ,[W>\ÃE\Ùÿ\ŞÜŒ§³ù_‚Â©dtUI\êŸ‚\Â\å+wlø\ÜÆ½NM\ç\ì_Pƒ\ïG‚ş>\\\'–\ïó \"\Æ4NS#¤mR u´£\ç\ß}X+ç‚¸À†”O5­M‘!\Ø&k\Ëÿ°5\Ä\0l5°ùc}\ÕmB*¤„®…¯@·n._\ç\ãÛ°Úr¶k\\hc\Ê\è\ÂfkO´½8\Ú~\ÌùBı»\ÊFO\ï\0\\ğŠ\â\Âµ‰\Ä8À\Û\Ù&S=\\f/µ\àj\Ç5‘\â\ÂOH\0jg\Út>\ëheô&.¤1„\Ø\Ğ-@\ÚÉ‘V®©¬ÙŸ\İû—\Ç[F7’Z›–~2À\í\\Š­°…hs\\`\ÃX\ëÄ›6iˆ½\Ûpvò{~É¦\×y	±\â\ãù93\Ô>VII5˜mö¶\0×¡}\İZ\ìú%ÿ4Ê‹‹öB®ÓªV\Ãy\ì\èC‡òOù<ŸC\ã\ëU\Ş¸T\\wv?z6ƒ¿FHG\ä»\î[VQv“§˜\Ø}_}22¼xrøqj§Úš\"m;-µdŠ«X´N¯\İB\ß)iA)ÓºL>\0Iw\ni!R\Ërô¡n\nœ\î”t\á },ô^Iº)b¸{:\Ô2¡šÇ²\Ş\ß+A7\Å\Ëv\nšJ\ã‘B±D\éû6 ;¨\ĞD;–uA\ÒJº)R²[w$)u\Z…wŒ’nˆ\ì4ç´˜E(%A7:\\*	\ÏÛ‹cÓ´Cš±\ÂFy^Äx¤4A\Ä+¶N\×\æ;\Ã\Ş(dbI9»dT)A]’\î\Z\ÒyAM\é	<R®˜§ÁµIj\ì\â‘Rš’4E \è®=RBNX½ğİGª©ó…L@Ò‡Kú ´&FC4«k”q‘P\Å\Ñ{=\Òp©\Ê\ë&² ˜\ÈV&ò7o;²ºµ!Á\ŞnrÃ…±\ÎÔªÀ‘\ä‘¯_µ\Ğ+±\İCx‹>^zø|6ŸÏ®3(\ßS^Lb¥®­ekA!øVı4‘\Õhjµİ«yq»›7?\Ût·pÀ›*¾1&M-\Ë\Æ\ns.\Z[F“öv7”jj‚•MT’h.—\Z%\å:G\ãT²9«{Ç½ò{VùÚ†‘ƒ\àŸb\ê¬	ù\Ô\"ªNTk´! v\ßk¬\Ú-û\á\Êre•\î\ÄZ sdXC,a‡ˆ`\í<X\ë¨B<LqaMJœzC\ëY¡\0½¨:{,\Ö\Z\n\Äk5¬u^ \Üt’0\Ô\Îù\Õö\Òp\ëº@<¶‚]Á˜Q	¨\0´m?v\\ ^ºKq!§˜µUi„(\æ\ØGt8«%w\0¸gwS4[ŸE×\Ù\'óô\ï/O…\"ˆŒ	;gÀ‡9£]\Ù\Ñ^	\"6›’p¡®¯Œ\0\ÔNµ.÷JˆmzG\Ø{“°Ó¬²\ÒjH\ëx¯„#nLK¢ŸIp;©b\ëla\é%.°k‹Yô²#3»öJ(\ÏµCöJh\İ×“\í•ğ°œºõ\Zü\áR\rp\İ\Ù\Ğ\Õ\ÖKŠ\ÄpÁ\r\ß\ãB|Ë’\âN2\È\ÔX\Ä\Øi*\éö“¡giüOÍ¶\İ•óÎ±2ñ}  ›“v\nš;KqªNS/qqˆ>@\ĞK‘0KÌ¹o…)\ÔKpG\'\î4õ\'\é†\ØùnIs¥qz¢ş“tShv·òHµ³¶¾];ú\ØÀ\änD[¥¸D§\Ù\ë\ÒtGS`n§¤%WHğV‡¾¤k’n\nI\í†tbL\Â@ú\İ\Ñ\Ù)hd™¶\à³<\'\èp©$<\ßGk×Ÿ\n¬½)\ÕÌ©]ÿqU)%\Æ¹®¿Hˆ3i4\É9—\ëúcR4LG!úÕ‘$Ò©²®}  sı\æZ*0ß»wı™0Vømôš]&°DÂ€ò8\Æ|?\Äõ—V$’jˆ„£;sı™%`\ácx\âúB¹!c\é\Üõg‰\Äó\Ó–\Ók\×?\\švÿ`{j\İi’5W·6$\Ø\×\İ?¤©\Ğõ…„±B=Š\ã±5\ìş\ÑG±\İG¾û\Çso\åt}\ìj÷8F÷n8»)ú}3^<)7\Ú\ê-\ìÿQ\è\á¤a§\Şò\Øÿcc7\rtÀ \É*5o»	\"Ÿ\Ù¤\êDó\Ö–œ”o\Ò\ã›S*Ê™}\'U°|\Õhùm»L|ô\Ô º?oÚ½÷Y\\‹A0j‹{iˆµÚ“\Éoûñjò³ˆJ³9ù\Õ\ÕÁ+Ëƒ¨}P«‡«ª•U¸n\î¾\á¨A\Ú\×l|\ìUaúó²³€¶.\Ñ\Ö\á\î\Õ>y1i6‡}\êD\rk\\k©([\ïX\ëkeAQw»o”S\\x£\ŞP\éhÍ4Mq\â@·u®\Û~\ßÎºMcC¶)1¤4)7G­\ÃÄ¦Û@Ü‹#nô¾„K\Õ\Üz‡¹\'Vp•\ì[«ı&÷d\'úD=¦[\í\Úw\nô]p2M¹õº\ÍAM èš ›\ÌÒ‚f’[¥Q›ø9º®;š²’F\Âj\ëRôQº\ãE5F”–b5m<\Z¥N%LŸ\ŞD\èQ>m\ë9Xzi9µÚ‰\æ\à”I\Å9L\r]\ÏÁL9ªc§\ë9¸\ĞU\Òh\×fo+ô7\ÍÁX\n4$\0Iw9#)¤ eÀ† ‰cšS¦\rôj—¦\Ä\î\ç\ÚÔ«‚8IŒĞc”\ã‡Ä–Çœy\ÇSªqx˜\ïÒ—fø†i\Ó±İŸ=±¥9i¤\Ì08<k\ät\İ~7¼»¹Œo\Æùt9³µ[¦\ï3UÎ›\"\äÓƒ\Ë \r\ä%\Ó@dc\Íg¸¬\îV=k\Î\rI¨¾|qMªp\ÓùB\Ôc»¯VµrüV–\ßÖ›\ÜLR…\Ò\Æ^hO\æ\í\Ç\ËùƒjÁm%!X_\Ú\êõ\å†\à„S²\'hƒÜ8*\Ã\'J\â}\Û\ß\Öz™ì¸\àVX‚‰ú\Ñ\0·\ÓÀ\íUm\Ø.”z\å`=\Ô:Û°=> ±T8­[\í\Ø[ \rGõ›]›+¯N:=[?\Ø[¹uWO¶·ò¾W¯|M\Âp©Æ·\î\ì~oº\Í<õXù=+\ßØ­ş\Ñ2y\è\Ñ\ÙYy¹\ÂD)#¨e½\Üa$”¤)m“\â\0‚®	º\É\Ú=¡cŒlJ\Ú\ìû‚®	ú MR¨µD\êrİ¥ ‘q\Ê2\Ö&\Ëğµ\nú[mN”\ÆN\íÁr7¶F‰\ã”º¶udªeª\nºS[‡RÉŒˆÅ§¾\\[G¤J¦µ\É}A\Ë,R\ì£±D¾/WĞ’\ÚTr\Öû^[\'\\š’±L´f­\Í×™-W	ó‰\Ø\Âö!µ‰8iN{¼µOlÛ_Xn&R6M½­¯…Ì“T¦[b{nK¥±5l:¶j¡Wb»`Ó±\áW\ê‹\êşV§ö½™\Óõ³9‡ô\Û6‹d¯M\Ç\ÒSş2»™Mf\×\Ù\è\É>d§\É\ê”	i:²:\Î\ê\ÄÓ¦‡YS²\çjs¯z´\ĞYOoK¶Zu\Ú\Î\"E\êqß˜\ÊMav1¹\'\ÄT\Å?¤#T’’>‡\Ä?\îÏ»‹wˆzqš\Zœ“\\\Ó¯-”`\ì\æÚœ\rh\ë\0m\İå€–J>.°I«8&¦m^›Dø\Ç2\0[çª­°\é:\Ğn\ìi\äõ\Ìsi(\×w¸£J†R\Ğ\Çp\0®Àuœu\ßö`Hh$E«=\0n/·—\Øl\'\ØJ\'.´1I±}’\Õ@R¡NJ\Ğ\Ö\Ú~ªu\Ñ\Ã\â5v‚¹\àL\Ç9œH\'8¯`’„1\ëxùU\0¹\î WÎ§\İd»‡M\\Pc\Îy\êlmÁ&µ-\ëz\0jB\í\ç«\Ôş6½.Us\ëa\ì[›Ş¢bL–fºŠô\íVtšK\áN´¸ûš\Ï\Í%[d’=/\İ\é¦\Ï3\n•	%\Ê&@Ò‡Bº!²±S\Ğ2ñB1Y_hV\ÄĞ¤ëƒ Ÿ\Ñ‡dcFµğm!@\Ğu\İ\Ñ\ä\Ï\î\Ö\Ò4\ÄhK€¤”t“·[Icz™\ÆA\êW\âoƒ³[Ğ„¥TóXVY/±R1)±”{–»±\ß%uÈŠ$–e\Í¶ß@”\×O3A¿¼ı^¨^X< \é# }ˆı^\Ì8\åI\ÍQ\"\ÜP\ä\íc†ºQwb¿\'”HTß¦İı\îsÖ´9»$]“ôAö» B#\ì \ÈÒµı.5e\Ì \Ğ{\í÷piª¾‘&q\ë0\Ò}\Ä\Z#õ¹\Ú\Öö_ªB-¹»ˆŠlR™`T“–\Ê\ÏfKB«A·\ÅXC\ÅH\Åvù1õÏ½•\Óõ±«c\ê\ãİ»l4Ë„ù\âøTÖµ†ú†\"Q\Ü\ë+\ØP$²UA¨A˜5>Ü¸\É7izV6¶Ğ¼MxñuM½PJ55ÁöŸ7ÿ¬B\ŞZD\Ô\Ê}†\Ä\ê0©Gr\í2Il9‰\ØŠuR\Ğp§…‘\"]\èˆIlûqÈ£¨÷/hÁñHW\êñp¥¸²\âvB-¾Zi0¢\ÊPm@\âP\çÍ¶-J€ZPë°–$Lq*\î\nÿ¥^K\ÂN¤X›\ÖÇ€M%œ=&3ØšÀV\îğüªRû)Fš›6ñ\Ğm/7\×ej0^\ã\ç\ÖJS†6ÀÆ¼K-©V2ú¶³a\é¦hv[eµƒIğf\â‚	AZIƒÚ¬½‚N\êf\n|5‡h\Å<Á5P;\r\Ô:;ä ŒºÄ…40)C\ë,H[—ÙŸ\İû—\Ç[\ç\Å7B\âŒn³/%À­+\Å\Ö\r\ØB”8.°I‰0Á´\ÍŞœ½Û®ƒSVN\rj89¥u_OvrJÙ£ª\Ó[\à—j€\ë\Î\îG\Ï&\"9#ù=[p~\Ë\ê\ÇN2\ã¤c,\Í{¹)º{)‹@Ğ‡º1ğ½S\Ò\Øqæ…\Å!¿\Ü\ÌQ\î•TR´\Ú9½-\è¦p\çn‹%µ	&ª¶¤‚>6`¸SĞˆ¸\Ä%	Ì†\Ç ú mÛµ´…n“¡‚~:`w‰Ó¾M‰Hº>6Jv\nšJœ\Ğ\')> \ècƒ»\Í—j„[¾VA‡K%\áy{qlb¹pRÙ‚§vH	#T\n\Ñ&!hT\×Wn\åv\"£²s‡”R\ì…a\à\'u\îJAµG`Uv\í\n£UŠm,Ëƒ—\ë2•\Zš\Ø ô¡ˆ>\è\ÌTŠ¹Œ\Ê\ÎRaRJl«\í™A\Òõ\Ùğ‡qœò\0‡´k‡T&H¦\Ãl¸\×!\r—¦*\è\Â@¶\\–gt/ÁÕ­\r	öµ4ZHk\Ëk™\Ì#\é\ÛŞÓ«+NĞû]e\Çe!\íñu\Çg\ZË»l”OG\ÙbG…Óº{¡s\ÈR^3|\Ş\Û\ì\æj|¦Z\è\æ4;¨…\Ş*NF%Ë‰j¸‹\ã\r·\Úx7i:Oñ\Æ\ãòH\Òp—Ó¦»;­ª©«7—B?\ì¦Ë‡•Ñ©m{]5Z~\ÛoEWVƒ©MŠI¸>>D´IBŒ¬­ÌLZ\r\çB®gM!†R\è \ÄW‰+Kn7Ò’Ø²Š±QFbf¡}V% ­¤uY	\ÍÊ½¡\"›TNoj±g.<VH®\ë˜l]\ÍÍ†w!g·´#.°1¯42ze9<€\rQ\ÆHJc\0[\'`\ëøD½`º\Æ7\ÄÕ¤~hIqB\Ü:†[Y\âz¬#»lÁ#ŠlB\ÄKO`\ÓjK\n‹¤a}À\Ö!\Øf/p\ä\ÔN°\ç92°))¨MÛ¬¯Øº\Ñl\ï\ÓØ F\r²‚–\ÖÙ…@\íşû\Ï\ã\ëÏ“U²ü\Ã\×\â=\Í\îû€\ÃV¨\ì¬\ì?>mˆ¹*€#j¡9\áRjh\í \î\Şj\Ã]•±«8ô\é@Z¾Ô‡\ŞzŠÿF\Ñ~\\“?\İ\å_f¿\Ì&5„6\Õ>;\Ì|7¹ñ¢öû\Û\ËpGµ£\0·\ì}5À–\Ó@t{¸Î¸5õEL”1ºLÆ½\0T‘oRañ6É¾Z1:[?¨‚o\İÕ“UÁ—=j a¸T\ã\ÛR\í¾ˆb){¸\Û\Å\Â\×NRalªJ%ƒmÖ¯|Ö†uŸ‚¦Š0—¨6©R èš =vJZzg¼\ÑA\" \é%\İğ\ß-he´a¦¶\ÊHR†W\Õã€ w\nº!Ô½[wXl¡\á€\è\İ\æ\İ)h\î´2¾<$yC\Ğ,A)¦\îôK™ıš\rœúİ‚ö\n{\êAG!\è¦\0\ßNAc)\ê\É+7;Š\×u\0wÊ¹°Â€•}\Ü)f\"¸€»²õõZ\é…\\Y\ë¯^\Ğ\áRIx\Ş^›XNOì¾šNœUé™ º<5ht¨¾:\ÄYeŒZ\å\Ó6gı‚ k‚>\ÌY%–J\Ê\ndô’>\ÈYD(‡\ê…3!ºTf \èİ‚>\ÄYEŒ)‡\Ë\ä(@ô‚>\ÈYeR§]}6´V+8«/\è¬\êBq\ÙftM\Ğ9«\Ò\Z\íh= ø\Ú}ng9fs{V£\0\îp?\ÈY\\¹\'~q‡±\Å\å\æ \èp©\î5V\Ï\ã\ÔYv5	z)µ\'!ğ(Á\íº\î½¼2ğJ˜Oô¬ 4µ&\0dSl	§6U\Û\ÕóÛ‡\î[\ÃÙ…«[½\Û=TÏ¿\àX\ê\Õó¿\ä\Ëñ1\å#k%ğ\r¥\é„4•˜@iz|¥é¢©Í‡w¿dºL\\j|}J©[?ı-Bg9œúX¬;(B\ß\İ\á¡“‚E)+õ- \íH{UE\èB f\reŠ\Ğ_mñ¡\äµHë¹œ\\xiz\ÜjÀ\Ö	\Ø^]º°\\&–\Öö$\Ö\î<À\í4p;\Îe\İ¶øŠ\Ğq‚Bª–A#r‰H.¤ılXúq¶9\êğw›‰¹\Ç)\"µTY0¸N¤\×uø»¡X™4–õW¨?wıx|\ÅV+\"\ê\ÛR]–6<›²k[Ûºj\ìlı< ¶µuWOVÛºM„\áRo\İ\Ùı(\Ş\Ì&ğÓ¤İZ\Ç\Å\Ów\ÏX`\ï\Èb\İ\"r;{Pºp\áº/š	ú‚Ó…™²)w’+ôA\é\Â\Ä;\æ‰eB¿\àt\á\Ô`«ZŠ‚®	ú taa\ÓN\×gC…¼±¤dz\çl\Ø~Ù­:°\rˆ>\\\Ğ\åO2§#\åÓ¯X\Ğ¤ô„tŞ¦\Ñ/²\äi$R²Ç‘\éÄ‡*8†Sğv»ö¡HB\rò®\Í	® èš ó¡x\â\Âv¤PEÜµ%…\ãV#ğ¡ºö¡ˆOh\á€\ÅÙµE•§\Ø\Õ%\æœ3‹\Øñ\ê\å|(­\á\"©•F¢_\Üz\ç\Èr‘\ÊW®£\Ï\íC\áT+\\X\0÷‚—\ê^s% \×\Î{^_‚H…(töö\Æ?¯³¤­\æ=«<£Œ\Õ\Ä\Æ\Ñ	)\×s¢Û¸\\G\r•XÁ›-\ß\î\çlz]´Tı~j\Ù\Ş÷©\\ğj6û\í&›ÿ¶¹r^*ˆiÿ\ã\Ï3“\r«dØ»\Ò\Â÷\Ó\ëbôõDÍ‡!?®¿¯ª\ÈNSt((:”@\Ñá¹Š%J\Z\î\n\Ôuy!GJ1g÷,•÷·¼P\Z%&&å…»;\Üóò\ÂÂ¶\Ó\ãX²{ ¼ğ’\ËyŠö\Ñ\ä\İ@y\áË¡-¾òB\n+e},n©–˜]\ÈA9P^\r\ÜDš:¤|-\Ö*<aXBy\áI\à\Öì¶¾„Ù†¢;iOH§(³\í,h\ë°n,ø\ÎqAM(‚g4–¨:ÔA\İX¢2¥Šhºdmx6e×¶n\ìaÁ\à\\ı< n¬uWOV7Vö¨\êô	Ã¥\Zßº³ûQ¼©¼=Î•û\Öv(\İm¢(l\ì•oC\\\'r;{XÎ£´.Mœ‰x„ <f+«……4\Ş#$}Xİ˜I¥)œ\çqŒ \Éyä‚¤\Æ+P\Ò\Ç(é†¨ÀnAk)˜r\ÌúHŸx§ ‘LI\êœ~p\ÖT<’Rë„T¼İ‚—J\Âóö\â\Ø\n8kB\Óz\ÒY]\Ä\İl	Á¹\çI}+=x»/n\Ú:¥$pwn\Ú“3Cƒ¤»6\íVHà²Š}¨ 1\íBS	‚\îÚ´\'.ITŠ}  2\í¥d\Òô\ÊÍ³›ö\Î\ä9{Mûpiª²aøT¥ml\Õø\ÛJpûñ«²A.ÁŞ‹6½+,¹r³¼M±q%IòxsClÛ—b[\İ\ê•\Ø\î\ë+Z«Ÿ¨\Úß¹»Q¶½`\Øü.)ó^S®\á]D†¤¼L\'\Û\"LW+4Ó‚n\ŞÚ«{·/Å¶º\Õ7\nœ\í?/\ç\Ù`v;ÿñÿ¦ƒ¼¾P^#\ã3+á§¬fŒ§\Ã\É\İx>\È\'ƒavs;\ë\ßAx\Ëñ\í\ì§Ù—|”Zõ}•\İA\Ïÿ\ÔB5\nÊˆõ\Z\\\â™$Ò‡¥Ç\ÖÁk1²Šò\ÒŞ7Æ¤¶\\3ûig\Í\å\Ê\âW‰lªD*0³ù(Ÿ/\Ê\ßf…\Ü+£wQx’‡O,ş²U\Â•f)Ç»JôB\åe»!\ÆVw\Ã*\×˜/\Ù\ä\Õl¹œİ¼p£µ /\Ù\æ¸x©£ü/´ú÷m5\è¨m ¼¶2Z*\Ô\ÊókqÆ¦Mw^e™mÌ²Æ»ß†)®:\Ü\\1û¼~ÛœUUØ«=¥W\Õj\ÑÆ¼¸|˜º\æ\ÉW/ös¥\Øòß³\á2|®|q„¬‹{>\Ñj(%û5\'\È\r8ø÷yv[şøEO\Æ\×Ó‡¯¬tHõ\Ğ\ç‚N8[¦1\ÂHRøği›< oŸ€†@:Ÿ€ò‚Oz1\Î^fvz«”\ïóA\ä+T½üVQ¯IVù±où\â;ûs\Óôw\"¶§R*Dò\î§\Ù\Í\Õ<÷wùôI\ÆlŸ\ãzAŠ\",\×I›¤J ø9(ş\Êœ\Şd\ãIƒ7¹›ÁX\é;7e\Ø<0)·En7£\ã¦-—\Õ÷th9u\â3mò’\Ö1\ç\Ü$¤\Í:\r\Ğóô\ëøyşş:¾ue‡\0Àú\ã=%8b\Ú\Z‚\Û$÷Á\ÏAğW\ÎßŸ\ç\ã\ë|z\Ä\ì+/ 6%M43mj¡œ@Î““ó§ly7\Ï&ù?·w&hG\Ğ2$\Şw†ŠT\"4¸¯`÷\×>N§\Ëñù[—ª¹µ0÷~“D.–%{–`Î¶õrÎ´\Å^\Û&‹”¨‰ó\Ë\'\è=f“\Ñø ½‡^¯¸v\ä\éòA:ı2¾\ÎFG\×\à^\Î\Ë`†!¯a<>µôjµ\ÎOû\ë_`JóŠØ‹1…j«“,¦ô)Í‹S/7§PlQ+C˜L9;SšM³ô÷\Ól0\Ø.hG¢\æ .Q\ã“}y@\" Ñ™IôS”\Ù4›G¢nƒ.È¥\ØñòÀ; (^}ø\ã¯&\ã\á‘SÑÕ”£1NS©Áõ\Z\ÅM£\ï¦\ã\áø¶˜Œv³(\\ª6Ö²\Û\ÜMÃŒ\â„\Ø\ã\İ\\Â‚\Â\"IÀ‹‹ô°`\İ)Ñ°`\ÑJ~\0¸\å»÷\Ë\ìún|\ÜÚ™t/ûGÁ¢`\ÑEC¥8—}ˆ 41\Ì `Jß™\Òñ²õ\ØI©À”\È\rÜ¨—}\n!!\Û/$Á²O‰#y¹¶@¢¸I÷²¶\ÎzcÁõ\Z\ÅM£S,û‚´d|a\ÖÿeŸ°s;5\æN }Ü¤¯–zşøŸ,¬Wü˜ò\É\äÿ™¾ƒµ‹¶a¤ó\å|¶È¯\ï\æ\ßT¸SUu¼†Á\"\ãğ ©@SEA©HKWk\ØJ˜\Òw¦t¾†Q€W¶:\Î˜L5Œ&al–`\ØH7‰b^Ã1Ï‘‰¢&Q\ÜkŒ\Ò\Ä+Û¿\â¦\Ñ)\Ö0¨^\é¤v\"Yı_\Ã@§©s\à\Å\é\ã&½,3X¯h2²³\é\"ÿ\Ï|\å=\ßT\Ş´\ä`’\r~É‡³\ép<gÕ¹§°r\Ö\Z‰\nió\Ğtx\Û\Ä]ş˜D*&`G˜\Z£aS¤…?©ñ\Òğ)}gJÇ‹fˆR\ì‡s‚€)q›¾1/š‘\Êş\0‰\â&QÌ‹fTKB5ş€D‘“(òE3\ÃT\ÂÀ \Zõ\Åõ	—\êÁµ€ö£sñX©\â\Ù\ç\ßÿ•1ÁKi\n9óÀ\ìh˜ı\Ç\ÍólP£\Ü\Î&\ãe6\r%=“Áß³\É$\Å=ú\ên>ÿã¿˜(»><E›—{\ÖÓMÀ¦X\æÉL\é8˜5wN?¦ôŸ)\Ó	¦\Â´À”X˜Ò¿`:\ç‚{\"`{S Q\Ü$Š9˜\Î(&YX‘\ÅM¢¸ƒ\é”Ë”+8Gh9N²‹\"Œ$Àş\Â+P˜U’‚¤…ô\ïôb6|\Èõ·\Å\Ş\\«Pû@g£Y¡o´uÚ¾9b\Z\íz³\'”ZL\ì)\0„Š†P‘nöd’i9PÀ”¾3¥\ësÊ­\çF±=\Æ(0˜r2¦ô/\Ô.m„O!J$Š›DQ‡Ú‘Ç©-‰\n$\ÅK¢óñ—l\íyˆp¢`›[`QO<Ÿp©\\h?:7/ \íü#÷úN\'œy£-f³£m>]\Îgƒ÷\Ó\Òa[œ\å†;ùd\àòE6Ÿ\Ï&“±}€\n}?ı’/–ı;c[¦Æ¦N\Ò¥\Õsd\'Sº^²À\Ä:Ur˜L\é3Sº®@2A\ÖCb30%nC8\ê\ê€\Ô3n)L7@¢¸Ió’÷Š$Áº¨\ï6[\×\ë\Ä”€@\0P¥\'T	—\êÁµ€ö£ssrp3,÷d\ëö]\á§{\Ö_€\ÙÀ\ì\Ó1\Ûş\ì\Ş1	v\ÇFFa\ßy`J\ï\ÍÅƒ\áLi¤P\éL\é=S:†cf¯R`\n0%¦4\ÇñV\é QÃ©S\ÎR\ØwH9‰b†#¢<–2Dq“(ò}\çE‚µ\æN\Zõ\Äõ	—\êÁµ€ö£sÓ…IhÊ¤¾ü~#•\ÆN”\0fG\Ãlûó_\íûô\'û^<b.\ìz¿—r&\ì\â„\é\ÉT¸“)\Ç\Ë\Ãn\Ù6`4SúÎ”\ã\åT)\é\rƒ<$`J,L\éaò85agş\0‰\â&Q\ÌñraHjSjD@¢¨Iw¼\\:­Ä°\ì4\ê‰\ë.Õƒk\íG\ç\æ\Ä\áö”­\î^ğşñœ#*”(³£a¶\Íogó¬\Ú@¾\ã¨\Ü\Æ\æ\Ã<ÿ’O«›g“#¦É®÷aÁ\ÜƒKÀ¥Ì’;™\Òu(].\ä_\0SzÏ”®S\Ï}š\Ê\ÔB(˜SúJ\ÇFa¯-$‰\â&QÔ¡t&SF QH9‰\â¥sm—Ê €F=q}Â¥zp- ı\è\Ü‹yc¼ {úJ\çŠ\ï5\ìÌ†\Ù[¡ô\Ùüwù ıı¶ø\æìˆ¹±\ãø9\ÇF0¤!YÔ“©q\'S:ŸséŒ“6¤\0¦ô)]\ïc.sXB-0%¦ô/~¨IR8¿H;‰¢Şº%\ÅHÙ‡\àH)‰âŸ\ã	2.|\Ğh\Ô\×\'\\ª\×Ú\ÎMgŸ¸PÂ´§ø¢ÿñs¡œWNƒ«Ì†\Ù[ñówó\ëñüˆ9±ã¸¹ LK® GˆÓ“)q\'Sº>ÿS‡\Ã0$SúÎ”\ã\æ\È$‰ô\Z\Îÿ¦\ÄÂ”\æk\Ë#`˜‰\â&Q\Ôy\ç\Öy¥<H7‰\"\Ï;	÷¦$\Ğh\Ô\×\'\\ª\×Ú\Î\r\Ä3«Rœğ=\é¤ı›KµF–\Ù\Ñ0\Û\å:—\ÙM>]–›·\è\ér<û\Ç\İ8ûnğ\ç|¶q\É\Â\íùõ\İ|<\ÊF}Ä”\ÙqX\Z%51°\éğª\'3\æN¦t\îd\"±€`!0¥\ïL\éz;‰°N0˜SúV§\Ü&HK0Ì€Dq“(æ°º´Á·ñ5\0\ÅM¢¸\Ã\êH¹” I«@£h\\Ÿ\à\Ûs\Û$‡Kõ‰µ¤ö\ÃtsÁ©0r\ßyh°E:\ŞJ\ÈŠ\Ç;S\îºÌ‡ó|™\Í\ÇÙ øqe”O1¡vtÇœ%>Q`–Ù¢™O#\rºcÏ¥\ÅÀ`Jß™\ÒqĞcÍ¥“\Z˜L‰Ú€‹9\èÎ™5\Zs(\ÅM¢˜ƒ\î„ø„y3(nEËU2ó€Fñ¸>\'\nºc\ÉRŠy0õ.:\èN\r–\Â\ØL(¹\Ïö1İ\"9\Íg³O\é<ô§¢\Ç\â6ŸL>.ı°‚\É+•\à»ó\å|¶\È&w£V\"K§£U\ç_˜@\'ŒpX\è…\r\â\\˜Ào\İ˜L‰)/LH+u’¤`\äS\"7rcŞœ^ˆ4\å	ƒ€Dq“(\êMv¤HRjÁ»\ÅM¢¸&\ãL\n¾h4Š—F?\ŞM\Ç\Ãñm1\ífQ¸Tm¬e·¸›‹\İ6\Õ\É=#ı_ª \ÎJ›`˜;ô±ş]1¬QUp;û:dƒ\Él1øu]eÿYüP\Üÿ0Ï¯\ç\Ùhv\Ä$\ÚõnöLje\Ğ	\è\r\â´3+R. ö˜\Ò{¦th§\Şs‡\ä]S\âö\Ë\ŞOc®\0`)\"dO½7Htf\Åhg\ŞDö\æ$™Dq\Ú1K˜h4Š\ÆõIGwÃ¬<)r7aÂ¥z|-¦ı\İ\Ì’	5\Ì\îY`º€˜ºV‚úlM\àw4ü®b\ê\ï§_ò\År|]1}\àfÃ¼ğÙ˜\";£KÃˆgv\ZEÃ H7\Ò!†1’8`\n0¥\çL\é8Œ^}VV0%¦ô/ŒN÷R%°j$Š›DQ‡Ñ©&L$EM¢¸\Ã\èŒ\Ê4M(@\ZE\ãúœ\"Œ\ÎK}\Â÷Lp4¬R\Zsğ;\Z~?F|„R\ã¢\ã\Ï\Ò\'ŸºOM§H—À:¢ Sœ1ub¹\ÃV§À`JÏ™\ÒqLB°†\Í\é)\Ñ0¥1u*x*…\ÃH7‰¢\Ş#®‰\â&Q\Ü1uZø=ˆ©¢q}NS\Ø\n™\â=itı©‹\Äx0(=‰ß°ñú.ğ\ç\ÙUpŞ‚ñ¹¥v\Élµóú\ë•X³\å±uª\î¶G\×9ÿ\Ê:\æ$dÅ€\é\æ‰s}BJ‚1CÀ`Jß™\Òñú3(QÆ;L‰\Û6‰#±®O0\Å\çZEN¢¨sş•\Ö!$EM¢¸\×\'$²[8\Èh\ës¢\ÃsgŒ¦lu÷r—(°H‘7–(€\â\ÑPüıO.ı\åˆ\é°\ãy\á”Y+\Ó\0i \nP%\nªDz¬+\ç3¾gò¦\0S¢gJ×»\Í+©x1«\0S€)‘0¥!si•ñ)‡º Q\Ü$Š9dN°NlªÀ»\ÅM¢¸C\æH\Æ<\ßs’%\Ğht2\Z*d.-5zoyòdõÌ±c(…\âï§‹\åxY¼\ì-¾\î\æjœM\Ë3]\Í8Ÿ\æ‹e6ø\ìf<?|7xo?b\ê\ì:¼N1öC-\Ğ*\ZZEš‘ÎˆN\×¦ô)]\ï˜CkÓ’À`JL\é_xbp\é\\D@¢xIuFºJ´¦ò\ì€Dq“(\îğºğRI‹Àõ\Zõ\Äõ	—\êÁµ€ö£s\Óú²‘\äò£\êX!…\\ùÀl`v\Ì~ŒªòÁùh\\@$ü5¿~nm\'ƒ:Ÿ#é¢\â\ç@ L;™\Òõ)®\"•$£Œ€)½gJ\Çñs\é(Å„Bü˜Sú?\'†¥V\"$EM¢˜\ã\çHQ)\ÖÁ (R\Å?\çHª”Jz\âú„Kõ\àZ@ûÑ¹i}\É\Ôh³/,\Öÿø9G¤‚½š€\Ù\Ñ0ûı‡ƒ¿M\Ç_òbô\Ël\ã>\è3œ¢v\n\ÚôdB\ÜÉ”®\Ïi•<UDA\Ô˜\Òw¦t5\ŞbN0%¦ôpS/¨3fDq“(\æ¨9eN $a\é	H\Ôw›­\ë\È8F\ÎY‹Áhªô„*\áR=¸\Ğ~tn\"\Ş¢4}ñY.1·¬tù€\ÙÀ\ì(˜ı\ãx:^h—©\å“lğa>[\æ\Ãò\Ü\åÁ\Ç\Ùpc†9M0’šA6 ©\ï\ÖdÇ±r¦ˆ7\Z9`\n0¥\çL\é:V®–\ÈDS€)10¥±r\Î\Â\Ù4\n\Â|@¢¸Is¬;Ÿ&‰€Dq“(\îsf)3\\€FÑ¸>Ñ¶İ„	—\êñµ˜öct3_Áji¨Ø³\ÉD\Ó1¢–$°Oğ;~\ßM\Ç\ÃñmLO\'›\Íoòiø\å\ï\ã«ÿ\ÏŞ¹-·#aøU|¹7»‹q¸™*‚\0&Sµ“¤Æ“¹§%%Ñ®\"¦(yªv\Ş)/°·y±%%Y‘3Tœ\Ği\ÊÿEŠ¶\Ì\è\Ğ\ê\İø»T5E-=³ª\È]€–Œ\È`Dô0Q\Æ+±°	¤Œ”¡e1†°–	¤P!e„Zº.·}ç€ˆ6D”µt¤TL£ªˆhCD[K\ç…\ÌyTˆEÀˆ6F;®	F\İµ—\ís\ìm\×ï¸‡…%—b\æxOaiü{{RˆL\ĞÓƒş}]U¯cİ¾\Úö\Û_½Ÿ-\×\ë²^\ï¬p\ïWqù£B“Œ®7\É\èş]‹\Ë\é\Ó6\×ıƒ\èñ\Ø	o\ëö¶|µj—H´.‡ƒ\Ã\r\ïp\Õkøülx?+\Ş\ÖU“I\Ã\Ù\àl\Ã;[˜¯š;fp68\Ûc8[=›¬«zwû^\îö\Ïój\Î\Ãö1ifs+4öe§\â<­W\ì>\İe‡h“,¼Í™CH;)÷1q²$C\0) …t>F¹IH\ç¸6H\Ì\0™p\ÓğR—\Ë\Ï\ê‡`.»Šs\í\ÍÁ^^\Öó?\Ë\éC`º3IFe„Àby\Ğ2–\ÉL{\ÙŞ¸7P¿wNJò\Üp\ã{ZZ\Ç\ß~$C¢6ˆƒô\ÈFu¡}´}…¹:Š\Ål\Ù‡’Ö¹N÷ºª\áo\ß\ào¿\İÖ§\r\Ãp·nw{6+\ë·ğ8T\ëc\âY½­VMLE½ş[\îoÏ‹ßu\ÏI:“ü¡7‘:&¯{vşGÿhô)\Ç²CÍ¢½–¹h\Û\×\0) eÌ¤\\´g\Î\ÃœŸRh\'e”‹öJ’ù¬GdD€\èñ\Â\rå¢½(œ6\\\àh/ğB†ºE{!L*T–0\Ğ2’\ÉL{\ÙŞ¸7P¿w\í…g}\Å\ìK8\âRe,“h\Ç\Ùd\È~Q¿)—ó¿\Êí™–\í\ÆÜ«u9­VWù»Y=Ÿ”\Ë\æ\Ç1@œXW!\Z–,\ÔL#	“¤½¤M+4 ¤Œœ”\Õq\á¤\Ç=€2¤ŒO—\Ö®™\Î\"@D%\ÜPV\ÇuOE\0/\à…\n/„—´	£¢ÁP\Ğ2–\ÉL{\ÙŞ¸7P¿w¶\n©Œ=\Ó÷PÇ­³™\Ç~\" ›\Ù\Ç\êø\ËrY\îTñ²•\Ê\å\Õu¹¸^ıı\ê\Å\Ë\ëË%ra™\r^¢\ïD$Vv’2°Dnt½\â\è\è)c\'e`‰Üˆ4\ç\èN)THŸDn¢ó…5X…ˆÈ„\Ê¹tZGnÁx!\Ãa‰<F2\åAh¡BË°¹ô¦]atù‡N\n)²d±#\È&CöõlR\Ï\Öeıñ\ÃFÿ¹º™7ó®ªùyqµ;pv\Şşvõ\ë¬yhññ\Ãò!sh¡œ[›+Q\\$bv’2°P\Î÷\Î´_€”±“2°PŞ„o]†õI …\n)\ãÊµ4,ºˆ	 ¢\r\Ñó\ÆQÚ­­Ñ°ª	…—‘¡±Ñ†\è\å\Çÿ\İ,\æ“†¢¡eu\ã¸5E€H\0Œhc´S\İNwm?¢¨½lŸco»~\Ç=T\Ì|HR†\Ö\Ò8gÅ›,\ä‹=\è÷Šû|#¸o;\Ği\ë\ëR*)-‘¡ˆ\èN\æE¦B±a¤€”1“2ôN\æ\Ñ\å^n¦| ¤ĞQ\Ö×³´u[ƒ\"\ÚQ\Ö×•\Ò!‹³@D\"\Úúº!FÅ°\È\Ñ\Æ\è1ôumTt\îò\Ï1EP9\Ï% ôD ÿ\éºZ­g\Ëù\Í|1Ÿ–Ó«_\Úó¶›ùÛ›úö}u|\Ğ\êys`q\İ(\å|th\ÉBd¢)®«Bpe%‚\rH;)‹\ëR\ïR,@\nH!B\Êıs±»äŒ¢¸Î¼“Œ%ˆë€ˆ6D”\ÅuÁeŒcvˆhCD[\\Ï’2\É%=Œ\ÈL}\âôv²\İY¹˜ö²½}o¦~=\ÌÁ´aLú‹\ïSWA{k9¤\rğM;L¾ò\×W/Ş¯\ç\ïnW\Çq²±W]U¯cİ¾¯-&«÷³\Å\âz]\Öë»<QKş”ª\Û\å´\\7IúY&‹\Ë\é\î´şóŒñ†``¢ƒ\Ñ\ÖÇŒı/ e\ì¤\\hH\ÑV\Ä\0R@\n\éd—r\ë¿tÁ\å\én¾ˆ\0\Ñ‡ˆö1­If!(‰ƒ2¼\Ğİƒµ“~“\ã\è9\Ğ2’\ÉL{\ÙŞ¸7P¿wÆ‡\ÜI/¿cŸ\å3—A¦ G6ô.ô_Mgùú=\Òù\Ó5\ÕıÙ«\ØXg2Ÿ= \Ó¸¾ S\\3‘\Åp„Dc‰F\')\×d\ÌM$öR)c\'e\è­ûµq¶@%¤O\Ë(¯~PŒ\Û\ÜœBˆhCDyõ+O\"\â\Ñ^ı ‹d´\Ó-ªÀ‘˜ú<\Æ\ê\Î\Ú=R\Ù\Å\×$d\Æò˜\'¬~\0ß´\Ã\ä«\åü\ÏYkr³eÿù¨\ßt–¡\\¼­n\ç«\ãDO\ç¼\Üc\èİ™bTRF4B`h\"CÑ£…ened\ík€2fR†Ş\ÉfI,ö)\Ä\Ó]\Ò\ë¬×…-°k; \"n(¯ÈŒ\â.\×(Šƒ2¼^ÿÁ«¾}g@hy<Z†]ÿÀ‚KRØõq°şÁ¡¢A-d“!û¤¬ğË¢qjNğ¬©¸-\n\åğŒ$,v’2t·¾\ÖE\ÒòH;)CO\Ì ¦€*¤ŒP\rÏ¼\Çn@€ˆL¸¡¬†³”ñ¬\Ø\r¼á…®\Z.“rE’\Ğ\Ì@\ËH&3\íe{\ã\Ş@ı\Şyx\á¤\Ë\Û[/Z\rI‹…\0²A6²O\Ôğ_\Ë\å|]\İ<$.\İ¼Ì¸À€g$a±“”¡÷Æ—2*\Æ O€”±“2ô\ŞøZ\ä*:Lµ@\nRÆ§†·\ÒC\İDd\Â\r\é\Şğ\ÈD¡<ù/dx¡«†¯¸’šh\Éd¦½lo\Ü¨\ß;º´Ï„ì™¾_@oxò*ú“/M†\ìS5|>y;S.‡V\Ãó‚%\É{Jf€ğP	‹¤¬†gF\æ*\ík€2fRVÃ\ÈT’	H¡B\Êø\ÔpÅ¸Ï´\Ã;€ˆL¸¡¬†›&\à$\î°÷x!\Ã]5œ›”š\éR4\Ğ2’\ÉL{\ÙŞ¸7P¿wz¼b6¹Ô“O_\r7\\)shÚ£G6v\Z\ïBÿùdV\Ï&\ëªşø\á8\\vY\rG\Æ\Şd\ìtvª\Él9™l½Wyùˆ#şuŒ%\ë\è$e\èbƒt\Â7ÿ@\nH9)Co\ËR*²O‚B75£|l,·21ñ‡ˆò±±J1m™C‡1 ¢\r\ícc•µ,jõùÀˆ\Ì\Ô\ç+m/7‹\Ï\İ:“\ÆñYÅ3Sè¼nıe¶.S™xTş\êo\éÔ“¶v;µÎ¹W\é¬õŸ‚Ie\ÛR\Îy\à\ß>z³\íü«¹\ìüófq½ş\ïbv\çÛ¿—7‹rR-\'·å´\Ü.v#ts\Ûİ”Ü‰û2¡\æ†U\Õö0©|ó©_\Ï\ë\Õú·ªú7F(w¿}úcQ-n\ß-ş~÷À\æ–eõÌ—\Ë\éş·?¶¿ñ\İG<ü?\×óiû\ã›\æ\Ú<\Çö\İ\n+7÷÷°Z}z\æ»\'<.\ZÊ¨YŞ®›<tŸİ°u\è’.e’‹³–\Ğ\ìşÿö\ÕvŸ\èS\Ñp;\è4³¸\İ[»»\ãş»ùl§_PgÄ”\Ò–§	D\ÉB\Ú\È[œ\ÎıäŸsü—\r8ó.*ü°±ÿ\æ;F€\Íc\Í\à¯\ß\éö¡s\Â\áe˜IÚø¢¿™}!<~\'_\çLxm\ãI	I1‘œô\ín\ÔğuøúĞ¾ş¼\\\ß\Ö\åbö\×Cj¬›\0u¶¿\ëB+§ó“¤H%&¥4\Çi#üş>Œ¿ÿ>_yú}ú<\ïiš¬£;\ãKF\ÜMR¨‹MgW³\åº]/\Û=¤nò\æ\Í\í÷{\ßÁ°É¸ò&/v\éü—÷\İÿ\ß<ñ÷HQ„I\ÑqrˆŒt™‹,k—\ï9d¼ù?d«\Íu¾»bğ¦cœ\Î1‰ŸJŸõÛ½©\Ëw÷5)ù¸½÷Åªsüy?#\Ì\Ûc\Ş\Ü)>›.\nÎ‚\Ühcq\æS0R~üXü€¯\à\Ëblü–±Q`l\nŞ¥„‡wyôw\ÊsY(b‘™“<Wk—Œ\Í\Ûò-ò\\\ä¹\Ès/¨¹\ë\'ÁHş\Ãò\\‘;\æ\Ãi	[²\"}\Zc‘\ç>qgºŒ<÷ÿ\0\0\0ÿÿ\ì›\İn£8†o%\Êù¶`c0\Ñ6`³\êAg£v¥=v¦H\"pš\Î\Ü\Ö^\Â\Ş\ØbC¦@iCÙ¦I;\ÎA~>›¿~óø³bò-\ÚN®³K§“\í,(.¦Å«¨h„\Ï\ç¿og·^!?\ãú3È’,/7x`\É\ÅT“¯ªbñc\Õ\Í]\Ä+º±„¥\Ë],*~£7\â\à+¸S\Äl*kogù\"[ğù\"X\ÈDŒW%\"¾Î³\ì\æ\â\\ø÷ut1]\ælEÓ°:\çE^‹“„\Ô\Ô$$C‹\\	µ04¦²ru¤\Ü\ÏR.Î˜A?×£u¦=…÷NZôov\Ê\êutU\Ê\rS\î6¯\Ê÷µ|\çÔ´~¯ş.wµ½˜B`\Zb¯•[\ÃGV\ïoWq=\Ù\ê\Æl\Írv–MpMWó-m*£<z\ä\"\ncC\è\Ï\Ù\×I» ‰\î\Ø&\á\ÏK=È³¨{ôhûÁ)ú®n«ry&«dV¬YPzvGE”?DÓ¹>B\ã\Îr®xü6\Óp° ş÷ŸT\rxgè³¶¡+¢w™t)²a›É¦A‘¡£˜ü^½¤˜<\Æ\Â@1ù@z\Ï\éJÈ¬f \'dl¿L‰\Û@¶\êW\È@ƒö²·®,¨Ø«Üº×­p/{‹u”$\n¾#\àûgº$\îg#\ï§\"­niPó±ğ\Ğ -Â§›\àï‹¤İ—ú¶«+ü*ü¾\İ\Â\Æ\è\ÔW‰\ÛD\í\Õ&ƒxÍ’q™®‚\ë8¸š\ïz®\ßYW’\Æ*¸¾¥—\\\ÇX)¸¾\\ITş\ß9[E)ÿ€ı\Ô\ë \Í3=\Ğ.4©‰!}š,\ì›?\ì‚j!W÷-lª…\Ü\é\İdp6ÁJ\â1–8\á*N\ã‚\çŒ\Ç\Ù H#J‘iCÚ¢\Ä\Ç\È¹òW…ô‘;QA{Œ\Ã-\í\é=¿’\äˆòX!û\Ôi\à[º\éÛ‚¥\rF\ë˜„­ö²°J¤“?\Ø\ÂX1ù@z\Ï/Ó‚\Ç|£²\èÍ¢\Ãhr™>D¥ô\Ë\êÁA\Ö¦n\êmH#[ºOé¶µ]5¤Dÿ\él\Ñ\é­ zˆ’¨¢”\ç,‰°0;\ë!¨ˆ\ÕGã·‰\ì˜W-B|\ß@Ud\r›´ıˆõ\êGh»D\"\ÛH\ìU°jŠhD,\Û\Ï\îÊ‰PYIl\Äi\Ù2`üüq½I\Ê\0+\rU;\å\Ô\È\Û?>!\n¨ \×\ÖšTGá–»7tl—ü’:ZÄ†\Ä&\âr\ï¾\ËÈ½\ØP\â¾&®\çY.0\Í\âz\È\Ôm\Ù\Ş:>Ï—®\ã‰Í…7»@Q¶:‰\Æ\áş\ÅÜ®¡\ï\Ç\Âöˆx\ÜqñÙƒ‹Ï¬	„P\Îš\ã\Z™\ä\Õù\Â\ëw(«¿·Õ•\"uûVš(K;÷Tô[º\Ä:\é<0P&a–-k¿üÀ€²¶²öYûª´\\œ÷70°­A\Üyj\Ü t\ìÎ”Dù[ùû\èş~ù¸~\ë\ëP[>k\Ûô·=ƒ§”[ù[ùûDø\İwC}¿·M\èÔ‚n\ÛÛ½3\Ì\ÎrÒ¾\é»Zcš¸Tw¬¸MW\\Aù*\â“\rt–8•l{dƒ†¦—†ò\\²’­\á6ß…¾&ó\Ô\æ\İ$P\Ï\ÃOrH…É•\Îa²µ«K\Ù× ~	·ù&†Uóö.MşÒ²QÀùP=d—7bÚ–.\ÔmM,ş\Î\î\ÅÀƒ!®Z±^^1±G­Ë¸¡Wr\Ç\ËûR?\İÒ¤ª·\ç\Ù\ê©8‰\î\Z¥÷…j–&/u\Üe™±ş¹\ÜğZ\Ó]^#´ª/j‰:2fÁy\ÖJ/bÜ‹(r£ó]»\å\×\Û,ü.¿”›lD\Ú=ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0§%ò\Ú\0\0\Ë \0\0\0\0\0word/theme/theme1.xml\ìY[‹7~/ô?ˆyw|›ñ%\Ä)ö\Øn.»I\È:)}\Ô\ÚòŒb\Í\ÈHònL	”ô©/…BZú\Ğ@\ßúPJ-4ô¥?&Ğ¦?¢G\Z\Û3²\å¦I6Ê®a­\Ëw>stt<s\éƒû	C\'DH\ÊÓW½PñI\Ç|BÓ¨\ã\İ\rK-I…\Ó	f<%oI¤÷Á\å÷ß»„/ª˜$|*/\â+5¿X.\Ë1cy\ÏI\nsS.¬ +¢òD\àSĞ›°r­Ri”LS¥8µ#A‚nN§tL¼\ËkõÿR%õÀ˜‰#­œ¬d\n\ØÉ¬ª¿\äR†L \Ì:¬4\á§#r_yˆa©`¢\ãUÌŸW¾|©¼bjlAnhşVr+É¬f\äDt¼ôıÀot7ú\r€©]Ü 9h\Z}€\Çc\Øi\Æ\Å\ÖÙ¬…ş\n[\0eM‡\î~³_¯Zø‚şú¾è…7 ¬\é\ï\à‡\Ã0·a”5ƒ|\Ğk÷ú¶~Êš|³\Ò\íûMo@1£\él]	\Zõp½\Û\rd\Ê\Ù\'¼ø\Ãfm\ÏQ\åBteò©\Úk	¾\Ç\Å\0Æ¹X\Ñ©\åœLñp!fôXPt@£oS.a¸R«+uø¯?¾i\â‹¤³¡±\Ü\Ò|:W\ï\Zhõ\ngO<}ø\ëÓ‡¿=ıì³§Z­½+w§QQ\î\Å÷_şıøSô\×/ß½xô•/‹ø\ç?~şü÷?şM½²h}ıóó_~ö\Íşğ\È\ï\n|\\„hB$ºAN\ÑmÀcñj£Ó¢D7$N±–q *¶\Ğ7–˜a®Gl;\Ş.\\À÷,\ÂG±X(\ê\0^x\È9\ëq\á\Ü\Óu½V\Ñ\n‹4r/.E\ÜmŒO\\k‡[^,\æ÷Ô¥2Œ‰Eó—ãˆ¤D!=\Çg„8\Ä>¦Ô²\ë!.ùT¡)\êa\ê4Éˆ[Ñ”]¡	øe\é\"ş¶lsxõ8s©\ï“	g3—J\Â,3~ˆ\n\'N\Æ8aE\äV±‹\ä\ÑRŒ-ƒK\ãh0!RºdnŠ¥E÷:¤·\Û\Ù2±‘BÑ™y€9/\"û|\Æ8™;9\Ó4.b¯\Ê„(F·¸r’\àö	\Ñ}ğN÷ºû.%–»_~¶\ï@\ZrˆY×‘ \Ü>K6\ÅÄ¥¼++\ÅvuFGoY¡}@Ã§xBºsÕ…\çs\Ë\æ9\ék1d•+\Äe›kØU\İO‰$\È7\ÇRi…\ì‰ø>‡Ë­Ä³\Äi‚\Å>\Í7fv\È\àªKœñ\Ê\Æ3+•R¡­›\ÄM™XûÛ«õVŒ­°\Ò}\é×¥°ü÷_\Î\È\Ü{\rò\Ê2\Øÿ³mF˜Y\ä3\ÂPe¸\Ò-ˆX\î\ÏEôq2b§\Ü\Ô>´¹\Ê[EOBÓ—V@[µOğöj¨0}ûØ=›z\Ç\r|“Jg_2Ù®oöá¶«š‹	}÷‹š>^¤·\Ü#\èyMs^\Óü\ïkš}\çù¼’9¯d\Î+·\È[¨dò\â\Å<Z?\è1Z’½O}¦”±#µd\ä@š²G\ÂÙŸa\ĞtŒ\Ğ\æ!\Ó<†\æj9	l\ÚHpõUñQŒ\ç°LÕ¬É•\êH¢9—P8™a§n=Á\É!Ÿd£\Õ\êú¹&`•C\áµ‡2Me£fş\0o£\Şô\"ó uM@Ë¾\n‰\Âb6‰ºƒDs=øfggÂ¢\í`\Ñ\Ò\ê÷²0_+¯Àå„°~(ø#7\é‰öS&¿ö\î™{zŸ1\ím\×\Ûkk®g\ãi‹D!\Ül…0Œ\áò\Ø>c_·s—Zô´)vi4[o\Ã\×:‰l\å–\Ú=t\ng®€š1w¼)üd‚f2}Rg*Ì¢´\ã\Õ\ÊĞ¯“Y\æBª>–q3S\Ùşªˆ@Œ&\ëE7°4\çV­5õ\ßQr\íÊ»g9óUt2™N\ÉX\íÉ»0—)qÎ¾!XwøHÅ“St\Ì\â6CÍª6\à„Jµ±æ„ŠBp\çV\ÜJW«£h½oÉ(fó¯n”b2\Ïà¦½¡SØ‡aº½+»¿\Ú\Ìq¤ôÆ·\îË…ôD!i\î¹@ô­\é\Îo\ï’/°\Êó¾\Å*K\İÛ¹®½\Îuûn‰7¿\n\Ôò\Å,jš±ƒZ>jS;Ã‚ °\Ü&4÷\İg}lG­¾ \Öu¥\é\í¼\Ø\æ\Ç÷ òûP­.˜’†*üj8\\¿’\Ì2]g—û\n-\íxŸT‚®Ö‚°Tiƒ’_÷+¥VĞ­—ºAP¯‚j¥ß«=\0£¨8©\Ù\ÚCø±Ï–«7÷f|\ç\í}².µ/ŒyR\æ¦.aóö¾Z³\Ş\Şgu2\Z\éyQ°\Ì\'Ú°]o÷\Z¥v½;,ùı^«\Ô½R¿6û\Ã~´\Ú\Ã:1`¿[ıÆ UjTÃ°\ä7*š~«]júµZ\×ov[¿û`ek\Øùú{m^\Ã\ëò?\0\0\0ÿÿ\0PK\0\0\0\0\0!\0€[	^\0\0˜\0\0\0\0\0word/comments.xmlÜ–Mo£0†\ï+\í@\ÜS\Ìw@Mª’Uo«6{Ù›Nb0²\ĞşûHZ\Ñ\í\Êa•€Ø\Ç\ãygl_ß¼ä™¶\'\\PV\Ìtó\n\é\Z)–\Òb3\Ó­–“©®	‰‹g¬ 3ı•ıfşı\Ûu&,\ÏI!…ˆB„U™\Ìô­”eh\"Ù’‹«œ&œ	¶–W0\Ø`\ë5MˆQ1\Z2QıUr–!`¾{,ô—¼ô£¥W`¬€‘l1—\ä\å\Ä0Ï†¸F`L» k\0Vh™]”}6\Ê3”W3^uH\î0\Ò‹ó†‘¬.\ÉF²»¤\é0R\'òn‚³’Ğ¹f<\Çşò‘cş¼+\'\0.±¤O4£ò˜\Èk1˜\Ï<«#!·Ó³	¾‘³”dv\ÚR\ØL\ßñ\"l\ì\'G{\åzx°o^­\ï³şƒIÌ’\Ú\ê•œdVˆ--¥Aç¶…\ì?[\Ä>\Ï\ÚqUiö,—¿mOñ!”\'`÷›ø\ç\ÙÁóÏ‰&ê¡ˆB-ú¸ğ~\ÎÖ“²ğ4ñ Ğ¼	®\ÙsiV\à%´gJ·ŒC4a=`ù†#\Èy·Åˆ\×üT\êU¹ùZ¶ü\àlWhôk´ûS\íW\ê>ƒ\Õd\İ\ÛJ_s\æq‹K\Øò$¼\ßŒ\ã§<‚\Ò \r´ZõU4UtúütUĞªP©wŒ*\Ä;¹e°¡$p¹\Ø`Õ’b	 µSM?±\ì\nB;ú­ziA%\Åø\Ô\È&q\Âs|Hß\Ş\Ù\Ï\Ô\ëVØ³e\İ\Úü”=\Üp\Ò˜-––k;Ç¦˜¬ñ.“İŸª)¶½…‡ş\äõ\ëQ¾f°\Âp³™¾‚™¬‡9eº1¿6C\æû\ÙY§¤c\Ö\ÅEÁd½]Â°¦çˆ“ó[l\éi)\Ñ+Pğ\ÎhB\å.Ucek¡©ŸMô»B¨p,„!?üÛ±…p—\æ\Â_^ª\ÖøBXVp»ğ\ïT­ıKˆÀöü¥û‘\ï{j!\"\×3ƒ‹­{|!LEÁ2V\äQ+\"ºõ\İøb+¢^k!L/´Í,s\éG\Ñ{!¨Ã£®ÀşBüOQ_Á	ŒU\Ì9Ëˆ83\Îuq| d»q¤\Â7j\Â\ß\ÅNdG—šğ\ŞøB\ØA¼ğ©\nù¨BL\×q­Kb:¾nd\çŒ~)º,!N\ßbş\0\0ÿÿ\0PK\0\0\0\0\0!\0TWZ´\0\0\\\0\0\0\0\0word/settings.xml´XYo\ÛF~/\Ğÿ è¹Š\È=¸$§\à\Ù$ˆ›\"r_ú¶\"W’K,)\ËJ\Ñÿ\Ş\á\Ù\Î8p\Z\ä%Y\Í7\×Î±œñ\Ë\ß\îªrq«L[\èúji¿°–Ug:/\êı\Õò¯›t\å.m\'\ë\\–ºVWË³j—¿½úù§—\'¿U]l\íTÔ­_eW\ËC\×5şz\İfU\Éö…nT\r\àN›Jvğ\Ó\ì×•4\Í*\ÓU#»b[”Ew^\Ër–“\Z}µ<šÚŸT¬ª\"3ºÕ»®ñõnWdjúo–0Ï±;Š\Ä:;Vª\î‹k£JğA\×\í¡h\ÚY[õµx˜•\Ü~\í·U9ól\ë\×=i“–x{½@ct¦\ÚT•³ƒE}1Ì¾Pô\Ùö°=]qP\â¶5œ\î{Î¿MùB“ù·\ép&k¼§§Uß¦†\Ïj\Ús¥\îfEmùœĞĞ»bk¤wŠk•ùoöµ6r[‚;\ß„h1x\×ÿ\Û{ü\nš\æ“\Ö\Õ\â\ä7\ÊdP9\Ğq\ÌZ®{\0ò¥w›NvÀî·*Ë¡³RI\Ğ~ò÷FV\Ğ<3e\É\ÕN\Ë\îFn7n€\éV\Â%„\åğ\á\ÜT=”ø\ßĞ¼3\Îñ\ì \Ì:e6\ÌÀZ¤\ë\Î\èr\æ\Ëõº‹ Q\r\Ô\Ñ$1´\í\å´Ÿ\0¨e\×~\Ğ\Ö\×:W½\çGS<??½À`İD\rix²L‘«›>Ü›\î\\ªœ\ßŸTP\çomW€\Æ\á\æ\ß\áÁ\×€¸‚\å÷P 7\çF¥JvG\Ó26d\"-‹\æº0F›7uµóÃŒ»2` €Z¼†ò*Œ>\rq~­d_Šï´»¾_Fğ\İ\É\ÛùğA\ënfµ,\×)g£§=zA,\ÛN£©<!œ“T ˆ#l£ˆK]†#\åğaB›:\"\Z÷\ÂD˜Nñ}„¶\å†O ^ˆz`\Ü\ÅoJ,\Ê\ÜEq8\Z\Â,—yB©$ Ğ”0ŠzÀ\Â=4,dILq„{1\ê\'4&¨Î¬4\Åe˜\íD\ÉH`¡÷\á® \Z7YT ™\ã\ä·\Û\Ü#(’Ğˆ\á¤v\"Ğ›:l´\Şaqµ\ãT´ªœH¤!\êµD¸h„Ëˆ›ğl\Âpm\åY\è}DLÀ9a±…\æT¤‚\è}\0‰ñ›>ı†¸ĞŒ\ZQ\×qş¸gõÚ…\Ì\èK\áÁK‘¢qóRB\Ú…ºFµ”81ª-\à4Œ\Ñ\Ì4¢A\"l­\ë\Ğ¡ \á\î[\È)Å³†Ô¶§™\ä³ˆF(’R\ËA«*\âí¡™‹uBôİ‰\\›q\\[ xŒ\ÖhlQ\â¢^Ç¶ ø[S\ŞK‰lN\ÑüÄ±4q\"\\ŠVo\âR¯\Ñ\ÄcvŒf.			\ĞzKRÂŸ°“2‘ \ÙN-AB\Ôk¡6\Z\Ñ4 Œ¡¾¥	,h]§ğZºCD\×#\ÓB\å÷»ÖŸf>õ£ß¢\Z%\"YmM!\×ı6¶\î9¶\æcX\Ô3¾U0Í«û\Èæ¸Á\Õj\ÚJ–e\n³ñT~^´M¬vÃ¹¼–f\Ñ;q”\nsú\ÛÏºú¹_™ß>6#z2²Gº™\Åf\ãVPùEİ½+ª™\Ş·›Yª†ı\ãt¬ó÷·fˆ\Ó%<\'¿ƒ\Ñl\ß\Éa\ÄxU»J6c°³\ÒlúñM]Ë¦§À\íŞ¾Z–\Åş\Ğ\Ùı\à\ÖÁ¯–ö\á\ÇvO&Œ±\á‡\Ìú›÷t¸\Ğ\ÈL»\ÇGg\Z½\Ğ\ØLc\ZŸiüBsfš\Ó\Ó`\ËQ–¥0\ÎÇ¾\Óe©O*}Á¿ Ah²Qñ¸KAy\é‘0-W\í\â\ÖWw°©©¼è–‹¶)òJ\ŞA,24\Æ\Ä]Ê³>vx{¬gnj\Èe\'\çQøğP\â|\éw¼¬€rÜœ«\íe5ûet¼,Z\ß\Ø\â:mf\ì\×³™Ÿ\ë\ì\rtœ:|\ØO_C›\Û_wEşòşA\íBÙª|\ÂfQ>Šş#‹\âz+J¬dÅ˜\ÃW^‡«¦,\àyµûwj\Òù\ÏB¯ş\0\0ÿÿ\0PK\0\0\0\0\0!\0\ØO’Mó\r\0\0lˆ\0\0\0\0\0word/styles.xml\äKs\Û8\Ç\ï[µß¥\Ó\î!±eù‘¤Æ™²x\íš<<‘39C$daMZ>b{>ı Hj‚bƒˆS;;‡‰E±ğ\ïn !‰ü\å\×\Ç$¾\Ó,g<=L_\îOš†<b\é\İ\é\ä\ë\í\å‹W“ /H\Z‘˜§ôtòDóÉ¯oÿş·_\Ş\ä\ÅSLó@\0\ÒüMNVE±~³·—‡+šü%_\ÓT¼¹\äYB\nñ2»\ÛKHv_®_„<Y“‚-XÌŠ§½ƒıı\ã‰\ÆdC(|¹d!}\Ç\Ã2¡i¡\ì÷2\Z\"Oó[\ç5\ía\íg\Ñ:\ã!\Ís\Ñ\é$®x	aiƒ™P\ÂÂŒ\ç|Y¼\Ñ-R(a>\İW%ñp„\0Àq\È\"\ãX3ö„¥Á\É)sTcò§„>N‚$|s}—òŒ,bACˆ\Ş\n,ÿ//öV8G\Ä\ÃwtIÊ¸\È\å\Ë\ì&\Ó/õ+õ\Ï%O‹<xxCò±[\ÑAL˜€_¥9›ˆw(É‹³œ‘\Î7Wò\ÎwÂ¼0Ÿ³ˆMö\äó?Å›\ßI|:98¨\\\È´\Å$½«\Ñü\Åû¹\Ùq(}ñUZ\î\é„d/\æg\ÒpOw¬ú\×\è\îzû•ºğš„L]‡,*ü~z¼/¡1“avpôº~ñ¥”MÊ‚\ë‹(@õoƒ\İ#.\ÂAÇ¼ŠQñ.]~\à\á=\æ…x\ãt¢®%~½¾\É\ÏDN^«kŠƒsš°+E45NLW,¢\ßV4ıš\Óhsü÷KKú@\È\ËTü=;9R^\ç\ÑûÇ®edŠwS\"5ù$\rbyv\É6W\æÿ©aS­D—ıŠ™‚\é6B5…8¹\Ñ\Ûnf¹\Õwu\êB³\çº\Ğ\ás]\è\è¹.tü\\:y®½z®)Ì¼K#úX\"¼ \î\âX¢Í±šc‰%4\Ç*h%\Ğ‹££9?Fs,nŠ\à<´y¡\á\ì3‹·÷sw\Ïn\Ü\İS‚w÷\à\Æİğİ¸»ó»ww:w\ã\î\Î\Şn\Ü\İ\É\ZÏ­–ZÁµ³´eKÎ‹”4(\è\ãx\ZIK\Õl~xrÒ£™—NzÀT™MOÄ£i!Q¯w{ˆ\nR÷ù¼U]À—Á’İ•™(õ\Ç6œ¦\ßi,Š\î€D‘\àyf´(3Ëˆ¸øtF—4£iH}:¶?¨¬ƒ´L|sMî¼±h\Zy¾š\è%)4-\ê\ç•\æÁ©f||\Ó8ñ–>°|üXIHp^\Æ1õ\Äú\ä\Ç\Åk|m 0\ãK…_(\Ìø\ÂÀ\Ğ\Ì\×iš§‘\Ò4O¦iÆ­òO_\ã¦i\ÆM\Ó<›¦·[V\Ä*Å›«\éğ½»‹˜\Ë]ö\Ñí˜³»”ˆÀø\éF\ï™7$#wY¯¹+İ5ûŒ½\Î9‚[sZCòµ®W.r!z\Í\Òrü€¶h¾‚«\áy\n¯†\ç)À\Z\Şøû(–\Érvå§™—‹¢3hiP\Ğ\ÎI\\V\Úñ\ÑFŠñ¶	€K–\å\ŞÂ \ëÁƒ?\Éå¬”\ÓG\æÛ´r|\Ã6¬ñaµ•¼6O#=´2\æá½Ÿ4|õ´¦™(\Ë\îG“.yó\Zù#Î‹ŒW¾f†ü’dPÈ¿O\Ö+’3U+µÃ§úúóù\à#Y\î\ĞMLX\êG·÷/\Â\âÀ\ß\n\â\êö\ã‡\à–¯e™)\ÆğœO¼1õN\à?¾\Ñ\Å?ı4ğLÁé“§Şy\ÚR°\æa’©H<òD\ËL–2/s¨\âıFŸœd‘\ÚMF«¯\Ä\ÔqN’uµ\èğ[\"/>ˆü\ãa5¤xŒ\É}!_Au\ëfl\æ\å\â\ß4Ÿ\ê>ñÀ\Ë\Î\Ğ\ç²Pûj©«¬ı\á\Æ/Z¸ñK¥¦˜¤ÿz\èl7¾³-œ¯\Î^\Ä$Ï™õ#Tg¯\î\Ö<\ßı_üiy¶,cX½`\rô6„<.“4÷\Ùc\Åó\Øa\Åó\İ_.£x¶\ä\ï_‹¼‰¡`¾”P0_2(˜/\rÌ«\0ã¿¡cÀ\ÆMÇ€ÿ®Nó´0`¾ü\Ì\ëô\ï\éS\æ\Ë\ÏÌ—Ÿ)˜/?S0_~6{\Ğ\åR,‚ıM1Ò—\ÏHMZ\Ğd\Í3’=yB¾\éñ°AZ\Ñn2¾”¿•\àiõ%nH¹G{\\lW8_\"£oM“,Ÿ\íò°#J\â˜sO{k›	GY¶¿»¶\ËLı’ctnb\Ò#šYúd·õò¼úY\ÆvóU3m{~`w«\"˜¯š\İ~s¼¿Ó².\Ø[f»/\Ø5\æ\Çõ\ïYº\Ì>Òˆ•I\İPøcŠ\ã\Ùpc\å\Ñ-\ã\Ã\İÆ›•D\Ëòh %¼\æñn\Ë\Í*¹ey2\Ğ^ó\Õ@K§-Ë¾xxG²ûNG8\éóŸ¦Æ³8\ßIŸ5Æ—\ís¤Æ²\ËOú¼¨*ÁY\ÊO :\Ãb\Æn?,x\ìö˜(²S0\ád§+;¢/À¾\Ğ\ïL\Îì˜¤©®\×|{\ä}µˆ”9/yµo\ßúÀiøº®\Å\Â)\Íi\ĞÉ™\rÿàª•e\ì\ã88\İ\Øƒó18\Ùƒ2‘\Õ•’\ì”Á¹Éœ¤\ìt¶‚3.[A{\\¶‚ö.\Ù\nR\\²ÕˆU€1x9`G \"Ğ:b¥`G ˜;*¤ \"Ğ\n\è@…0\\ B{\\ B{—@…—@…t B:P!¨Tˆ@ª\ã\Ú\Şj\î¨‚Tˆ@*D U­G*´\Ç*´w	THq	THA*D \"Ğ\n\è@…t B*P¹S B\n:P!¨\Ôê§†\î\n\íq\n\í]R\\RĞ\n\è@…t B:P!¨\nT`\î¨‚Tˆ@*D U}X8\"P¡=.P¡½K BŠK B\n:P!¨Tˆ@*D \"P\nÌRĞ\n\è@…ˆ>ÿ\ÔQÚ¾f?\Å\ïzZ¿±?ü£+İ¨/\æO¹M\Ôl8ªn•5ü·\çœ\ß?<œ©zc„-b\Æ\Õµ\åcu“«¾ú\àóóEÿ/|LúÈ›.\é\ßB¨\ÏLüp¨%\ØS9\ìsy\Óy‡}nZ‚U\ça_ö5-Á4xØ—tU\\\Ö_J\Ó0\îK3†ñ\ÔbŞ—­\rs8\Ä}9\Ú0„#Ü—™\rC8À}ù\Ø0<\ndrŞ¶>\Z8N\Ç\Í÷K¡\Ï\rÂ‰\Ğ\ç–P«:\ÃÀ*š0T=;a¨ŒvJO+/¬…VØr“\Z†Vj÷@µ°RC‚“\Ô\0\ã.5D9K\rQnR\ÃÄˆ•\Z°R»\'g;ÁIj€q—\Z¢œ¥†(7©\áT†•\Z°RCV\ê‘²\ã.5D9K\rQnR\Ã\ÅVjHÀJ\r	X©!ÁIj€q—\Z¢œ¥†(7©A•Œ–\Z°RCVjHp’\Z`Ü¥†(g©!ªOjµ‹Ò’\Z¥°a[„†¸	\Ù0\Ä%g\ÃĞ¡Z2¬«%ƒ\àX-A­j\ÍqÕ’)š0T=;a¨ŒvJO+/¬…VØr“\ZW-uI\í¨vVj\\µd•\ZW-õJ«–z¥\ÆUKv©q\ÕR—Ô¸j©Kj÷\äl\'8I«–z¥\ÆUK½R\ãª%»Ô¸j©Kj\\µ\Ô%5®Z\ê’z\ä„lÅ¸K«–z¥\ÆUKv©q\ÕR—Ô¸j©Kj\\µ\Ô%5®Z²J«–z¥\ÆUK½R\ãª%»Ô¸j©Kj\\µ\Ô%5®Z\ê’\ZW-Y¥\ÆUK½Rãª¥^©q\Õ\ÒGa\Â<\Üj¬ü\İ/\îŠä«‚Œ¿9\á\×4£9¿\Ó(@wu\ï¡õ\Ì*y\rõ„9q~!:*o[nü\Æ(ªnÛª\ê\Ä\ë¨y¶”4–-\nôS¼ôa\Õpı«ú;\ËE!¬\Ï\Ù\ßµry¤?‘\Ü~DY×ƒ\È\Ş\ëcz@\ÚO\r»ø¬;U?Lµö*\\‰n…ú\ŞV–^]–bXhD\×YF–|‰?¥Áv/-·²U­Û¸h}¶\Öq#Nu^Kšª––2$zZ-C†¤}‚TQek\àk&vµP´gWr‰?®S©\èƒ~ X\Õ\Ò\èQk$Ş¿ qü‘TgóµıÔ˜.‹\ê\İé¾º©Á\Öû‹\êş|VûL%r+`¯İ˜\êe¿§Tw\ì\×\ß0°Œùœ¥±HW¤cÀ\Õ^Æõ\0oh\ëò4,I”…eU%U¹¥Ç”ˆ«|–\é¤y»v K»ëŸ•·ùødÿh_\ça\Û\ãöÌ‡\í6/º¶\×ö°sE4S	ªò uUy[k=\0Š)Nı!®I›\ã‰ycCnü\ËÉ¶ñ=\'\ë\Ú3ŒY*Fš^3ÿ\ÃÍ¼\n’fø‡\ÄL+»†e.†MM/\Ûq³‰rz8Z\ïrOKV\îğ\Çó£\Ù\ì\à]÷Ä¢})|%4>Ñ‡\àOˆš6\Õ\ã-;\ß	ón&Ÿ½¨3ƒnr\Óızó´K}„Uÿ¿È«ø/2v\ßô^ŸuU\âlú(ÿ\Ó9dóM=™¶²©•õ”§z\n¨n¥²}9…\îùu·Æ¯ÿ\Òo¿gü\åeŸN-±=ı¾–ûçˆ¬\ËÀ–\Èú\Ø\Ïù\È\"r]\ŞıŸF·¯Õ³µ\İf\İf™à¬•ùø²m#\ßºŒh\È\å}Ş‰Xš;Ÿ…†\ÕtLi¸\å\ç³\éT\')\í›œ\ê\Í5s «c»G§µ7±©€\ècÁ‡z\ÚY\×À˜[r¯§>¾Å¾ ?t°@5¸r\Ã|\Ğx°\á¯ê˜¿¬\Ò18\Ûc¯N	6\ç\Í\"<³G¤\Z;ı±5d¬÷«º=ı,/Ó‚G4\æ\íõ\rÎ»Æ»sSù¾L%:\Zóƒ\ÃCk´¨ú£Ò¼?g¶tg{x«\Óq\Ş¯¶¥\ãø½\ÚÜŸ\â\ãj\È\"zót\î\Öm»¼7k\ês\'q§­0\Ë:jN\ï8\r¾^(ó\\95¯·¬\Û×šx\Õ1\Ï3‚1\Ì\ÛúU\ÓADu†ŸÉ ö•3#\ßF>•[õ_ù\Ûÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0v	¤uw\0\0\å\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’QO\Â0…\ßMüK\ßG7¢\Ë65<Ib\"\ã[m/£²vM[ü{»\rgxğ\í\Ş{N¿Ü6™E\á@^\Ê…£\0y iÉ¸\ÌSô¾Zø÷\È3–HFŠRBŠN`\Ğ<»½I¨Ši©\áU—\n´\å`<G’&¦*E[kUŒ±¡[ÄŒœC:qSjA¬ku¡;’Á`	#–\à\Zè«ˆ\ÎHF{¤\Ú\ë¢0Š¡\0\Ò\ZB|ñZ\Ğ\Â\\=\Ğ(¿œ‚Û“‚«\ÖN\ì\İG\Ã{cUU£*j¬nÿ,_Şš«ú\\\ÖYQ@Y\Âhl¹- Kğ¥t•\Ù}µ\í¸o\\M5[\êŒ:BNt£w³:\íœªR3\ãN:gc`¨\æÊº7l¹ƒs\ÄØ¥{\Ô\röx\ÊÖ¼(8\r\èT»5xı²I\ã\è\Û\än»0Ï…·v\Ê:zz^-P6Â™\ÌüñtFq4ƒ\à³\Şlpş\çşC|XQ<‰ \rgø1³\0\0\0ÿÿ\0PK\0\0\0\0\0!\0+^\è\0\0\ä\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œSÁn\Û0½\Ø?º7r²4+EÅb\èa[\ÄmÏšL\'\ÂdI˜ \Ù?\í+öc£\ì\Æs¶\æ\Ó\ã#M==R\âö¥µ\Åb2Ş­\ØtR²œöµq»{¬>^İ°\"¡rµ²\ŞÁŠ ±[ùö\ØD ¢TP—Vl–œ\'½‡V¥	¥e\Z[…\Æ÷Mc4\Üy}hÁ!Ÿ•\å‚\Ã‚«¡¾\nCC\Öw\\ñ›\Ö^g}\é©:\ê\'Em°\nA~\É\ÚI\í±|`E\åQ\ÙÊ´ \ç\åœC(6jIN\ïxö±NòfZ\n\ŞC±Ş«¨4’‡r>¿^>\"Ä‡¬\Ñ\n\É^ù\Ù\è\è“o°x\è4¹\à\ãA÷Ø‚>Dƒ\'IGŒCñ\É8Rğ\î½\à=\"mQ\í¢\n{Xf…C(¶ZYX“²Q6\à¿	q*\Ïw£LVx\Ä\å4úX$ó&<c\ÅW• ;·bGr\Èú²>\è°\r	£¬~şÀƒõ‚LÇ…cl\æ\Ù\È\\vA§‚ğ¥¾Ê …ô\Ğ\Ğ\íğr§c¹†^\ìH\ÎX\ÙùŒ?º®}”#ù€\È\ão\é1Tş.oÈ«‹—\ähô\Ï÷Û 4\åzv¹£”\Ø5Mu\Ë@ˆ{ºB´ù\0ú\×\í >\×ü\Èkõ\Ô?Z9]LJúº=:s´\Ãk’¿\0\0\0ÿÿ\0PK\0\0\0\0\0!\0±\n¥½\à\0\0\0U\0\0\0(\0customXml/itemProps1.xml ¢$\0(  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œÁJ\Ä0†\ï‚\ïP\æM\ÚÆº,Mµö*\n{Í¦ih2%IE\ß\İO\ë\Ñ\Óğ\Í0óıL}ü°sö®}0\è\ä;™v\n{\ãFo¯\ÙC¢t½œ\Ñi\á\Ø\Ü\Ş\Ô}8ô2\Ê\Ñ\ëS\Ô6K\r“\ê©ğ\Å;^\æ+H[°G\Âó‡’\ìï»–0\Æ\Ù3¯Š§ª¼û†,©]:L1.Jƒš´•a‡‹vi8 ·2&ô#\Åa0J·¨V«]¤cUk\ÒÛ³¡\Ùòün¿\è!\\\ãmõæ¿–‹¹\ÌG/—\éhS\Ó?ª¯^\Ñü\0\0\0ÿÿ\0PK\0\0\0\0\0!\0t?9z\Â\0\0\0(\0\0\0customXml/_rels/item1.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ŒÏ±Š\Ã0\àı\à\ŞÁhoœ\ÜP\Ê§K)t;Jº\ZGILc\ËXjiß¾\æ¦+t\è(‰ÿûQ»½…E]1³§h ©jP\r>N~ûıjŠ\Å\ÆÁ.\ÑÀ¶\İ\çG{\Ä\ÅJ	ñ\ì«¢D60‹¤o­\Ù\Í,W”0–\ËH9X)ct²\îl\'\Ô_u½\Öù¿İ“©ƒ|\ZPı=\á;6£w¸#w	\åE…v\n§°üd*ª·yB1\à\Ãßª©Š	ºkõ\Ó\İ\0\0ÿÿ\0PK\0\0\0\0\0!\0ZuD\Ç\0\0\ë!\0\0\0\0\0word/numbering.xml\ì—\Ín\Û8\Ç\ïô\İYş¨§Hx‘Å¢(\Ğ=\Ó2m\á‡@Jv¼Ç¾\Ì>\Â>V_a‡”(\ÛQ*\Èr:\èbZœ™‡’\ç\æ\Ó%\Ös6µ\İ\ëmañe\Ì\ÖSûû\Óüjb[2El‰gxjï±´?\İ~ø\ãf²Œ.°\0GL†»$šÚ›4MBÇ‘\ÑS$¯i	.ù*½8uøjG\Ø\Ùq±t¼;\ĞÿÁ#,%pfˆm‘´\\ôÒŒ¶hÁ\n8\Ñ‰¿\îÙ¡óÑ™TA^\Ì\Ğs«(ÿl\Ô\ÈQYU@A+dU!\rÛ‘Ş˜Ü¨É«’\Æ\íH~•4iGªl\'Z\İ\à<ÁŒ+.(J\áQ¬Š\Äs–\\8Ai¼ˆIœ\î9Š\Ùs‹Œ ª$Py6a\ìP¾\Ä\Ä_\Z\nŸÚ™`aUÆ«\Ô\Ã<¾hL„h2ÿ<\äG\Å,\Õ3w& gr\'\å	§mi`\ÜÈ¶n[JŒ\ß.q—ß½\îs)À&\éúS’g^Ot\rVD!Êˆ&)œi2¡°·’\æH\\·\á\Ä\0¼\n`\Å\r·´a\äj\Â| òˆ#ñy˜¡Á\È==õ]²¾l·ü)x–hñe´\Ç\Ã\Ùß©\Ïğ¬b\×ŸyY2\ß6(W\Â\Ç5\ã-d{È‚m`\éP¿°*–:tö-\Ü\ĞB¦Eé—ŒZ\'O°\èp\ç€\ÈP`¸hÕ™_+\îV)ŸF\Ï\ÊEQ˜T\Ìp‹\È\Ôö?\Î?‚ñ\Ìv”…f$ÿ\Æ[Lö	6>º—¨\Ş\Ü+¥	1¶¡{7›¹÷“\ÜB¶\ÊCc\ÆÒ¹g7÷‚Ïœ–‹Œœ–ñOø¥4ıúù_\ÙÿWdz	^\î\ÉW¡ó!Š\ÖøÀ F˜pX£±7P\î\ÎÁ1fjşŠ“[\áaƒ\ØZ_\Öü‘ñ.\è¢hæœ¥R©.£¶\á·=]p¢C\ï@Ğ“˜x‰W„\Ë3•ÿ˜\Ì\Êd4\×\Ñs{-«()¼§\áe¿\Å\êùb)ù;\éA’\Ú\ÜF\Ê\ÏDŒ…õ\ïô|\İ{©¨\Şû‹ú\ë\ç¿\ï «\ç–:½%«6·‘õx«D‰z\Úw©¤~g%Lj%U\ænJ\ZtUR¨NRmî¦¤Ã®J\Zøµ_&mî¦¤£®J:\Ô~¢´¹›’;+\é¸öó¤\Íİ”t\ÒUIGA\í\çI›»\"©sRg¨ˆ\Ú\"D]]\Ï.B\Æs\ßùzü6EÈƒşıƒW.M¹ú\"¤/Bú\"¤¬}\Ò!¥¤}\Ò!}\Ò!}\Ò!-B˜.>˜):T\×I%bx\Ç\Şó~¦—Ä„\åm^\È\Üş\0\0ÿÿ\0PK\0\0\0\0\0!\0ŒyA\Z\0\0\Û\0\0\0\0\0word/people.xml¤–Ï\Ú0\Æ\ï•ú‘\ï\à–FÀºjÅ¥—¶\àubm\ì±\ì„À\ÛwòŸ*\í*	 ±¿Ÿ¿\Ï\ï_®*õ.\Â:	ú@‚¥O<¡9DRŸ\ä÷¯o‹ñ\\\Æt\ÄR\Ğ\â@nÂ‘—\ã\çOû\"Ø„F€I…‡\í\Â\ÂğI²Ì„”:\Å\ÜRInÁAœ-9(\nq,¹ Øˆ®üÀ¯~\\8‡\ë}eú\Âipü:YV ¸>Q0›‰k\Ï&C6ô\İ\rA« ŒpQ\ëÉ¨--]\r@O³@\èj@\Ú\Ì#ı#¸\í<\ÒjHzGZI»y¤A9©aƒ\Zc°Šeøh\ÏT1û›‚\r\Ë\ä›LevC¦¿m1L\ê÷P\Õ\Ô:šLx¦\n\"‘®£–’[6úE§/­‡µ¾ùjvLüµ\äx®„ÎªÈ©)\æ´K¤\é:\\Í¥\á`\ÒB.qQi;¯0Á\Èvù\ßñôZ§²±\ß\ä_¥µó‰?bGJD§c\á\ï5[\'\n«°_xVj\î’Œ<@ZÀj\0\Ør9²¤[FMŒ•w\'¦a6-\Æ\İT\ß\ê…9?V-\ß-ä¦§\É\Çh§¾÷‹ò_x«©ºûNp™ù™0ƒG‚\â\á\é¬Á²·a\ryX^µ\å\'\îŠW696W\ë@—SB–g	\àQ\ÂñZqf\í¸/\â¤c¨f\áz	{Â²øWR½\Í]ı¦\Ñ\Ò\ãöôî¡¼•ÿ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0öˆI7D\0\0¶	\0\0\0\0\0word/fontTable.xmlÜ”[k\Û0€\ßûB\ï/q.\rMÊš%P{X[ö¬È²-fIFG‰›¿\ãK\ÖfNF\Ìha³pbIŸ\ästsû¬r²¤\Ñs\Z|J„\æ&–:Ó§\ÇõÕ”pL\Ç,7Z\Ì\é^\0½]|üpS\Î£œ¯a¦øœf\Î3\Ï	\Å``\n¡±31V1‡¯6õ³?¶\Å7ª`Nnd.\İ\Ş}L[Œ½„b’Drñ\Ùğ­\Ú\Õó=+r$\Z\r™,\à@+/¡•\ÆÆ…5\\\0\à7«¼\á)&õ/Lu@JrkÀ$n€\Ó\î¨F\áôÀ¯ŸTşõ„À˜Ë¸c\Ü2<œùŠ¢ftÀÀ^‰gJŸİ§\ÚX¶É‘„j~©Á\ÕoµØ¢\Í\rR\Î4S8\êa¯6&¯\ã\ÓD€];–Ï©?\Âø•³‰?\Æÿ‘?¡^5gÌ‚¨\ÍÀ°	\'L\É|ˆZ£˜n:\n\éxvˆï˜•\Õ›.)vla\ã#§½h	0\å#ag\Ìğ8\Âk\Îô8¼\Zƒkz€ˆG©¯¢$\ßêŸ2bûC4\á\âSt\ÚH½\Ò\ßY\á\Ã\Õzıbd‰‘\Étt\×1rı\'#õk\Ğp.7²4[+…­œœ±1A×µ•\ÊF\ÔË†2±°§t$òYÄ—»ˆ†\ï\á\â;?Õ¹g*¥sõ¨¶u\æ*”%\Ë\å\Æ\Ê3)±®S¡j&G\Ø+% ”\0ı\ä\Ó\ïIF“w)‘\ZA\îÏ¨¸k«¢¹ñ´x[Ñ©úXE“C\ämÏŠ&)\È™f\îljT	ñŸ¦Fû\0‹Ÿ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0óŸ\àk\0\0Á\n\0\0\0\0\0word/commentsIds.xml¤\Ö[“š0\0\à÷\Îô?0¼»¹€\Üfug\ìø\Üöd!*³$a÷\ß7¨¨-\Ë6â‹—	\ç\ã\ä\ä$ğür`¥µ§R‚\Ïlôm‹òL\ä\ß\Ì\ìß¿–“À¶TMxNJÁ\é\Ìş \Ê~™ÿö\Ü /+ò(ŒQ^«U®,Mq5U6³·u]E\0¨lKQO¬È¤Pb]?\é\ëX¯‹Œ‚F\È`ˆ\àñW%EF•\Ò÷	\ßeŸ¹\ì`¦\å’4:¸]m‰¬\é\áj »‘)AĞ‡ğH\Ï£>\å\ÜMy Íª¹£ UOš“>™œ7N\Â}\É\'9})\'õÚ‰õ\\T”\ëÁµŒ\Ôú¯\Ü\0F\äû®šh¸\"uñV”Eı¡M\èu)øûˆŒt\ÔE`N~·\à&rZ:y§ˆ™½“<:\ÇO.ñm\ê\Ñ)şü\ÕEH“ùŸB‘\í\Ú\â8s i©k!¸\Ú\Õe‡³±š\Üv\Èş«I\ìY\Ù]\×T\Èp»OÉ©”W\Ğ$ısıYy\ÊükAƒi‰K„I\nß³Ë„\é.¼\ŞxTinŠ‹À= }¨\Ügœª©\ç£#oE\ïc¦£>\Øu«7\Õ\æ±nù!Å®ºj\Åc\Ú\êº÷›öi|‡u\îºÛ K\æ\ç–TúH`Y´\Úp!\É[©3\Ò=d\é6°+\Ğ~\êU±\ÚMg\ÏÿyeX\å\ç\á¨\"’¬ôªû\Ó`\á¤²»|wT\Û1” 4Mœ\Ôÿw\ÜúI\è¿8KxK\ãğ5õğs#?Á‰ƒ|‡\Ë\Ä\Êû\Ğ1\Êb´ô\ãx\Èq“\Z\ÕBgš\Ä\î`>š8N˜¤¾øƒù8(6q¦1C\Ï\\/\×	uıw\Îù\0\0\0ÿÿ\0PK\0\0\0\0\0!\0\ÒÕˆf>\0\0\n\0\0\0\0\0word/commentsExtended.xml¤–Û’¢0†\ï·jßÊ½&œD¨Ñ©\Ğ-¯wö2!\n5\äP	Š¾ıqŠ]ğ†óÿ\å\ïNw\È\Ë\ë‘Ö*¾\0ö‹r\"Òœ\ï\à\Ï\Çz2–.1Oq!8]€\Õ\àuùó\ÇKeûŒQ^\ê\Õ\Ñ2®£J’\È\ÊRFj’Q†õ”\åD	-¶\å\Ô|\Åv›\n+¡R\è ¯¤„jmÆŒ1?`\r®8r\ìGK®Œ¸zdX•ô\Ø2\ìÁ†p\Ş9#@&B\Ç\î¢\ÜÁ¨¬]u@\Ş(q\Õ!ù\ãHÿn6\ätIÁ8’\Û%\ÍÇ‘:\åÄº.$\å\æ\åV(†Ks«vaõµ—–¸\Ì?ó\"/O†‰f\r\çük„#£º˜›&‰”n\ÚP\Ä\ì®ú\ÉM_[.ú\ë©Q¨>ñ_$‰ ûz}8G-L.\×Y.o\Î\Æ\Ò\ÌË¬q`Eó]%\í\íò¿\å)¹¤²ö±\Í?+.\Îm\ÔcFj\ÄM\Ñ\Ç\Â÷1\'\ÌTa;ğ¨\Ô\Ü%\×î¹€4\0§˜‘¼gI7ŒK6M<Fy\Ç\Ñt\Æo0ú\Ä\ÚV¯\ä\î¹jù¥\Ä^¶´ü9Ú¦\íıªş`]«\î¾ôsf~gXš%‘h³\ãB\á\Ï\Â825d™2°\Î3PÍ¬XuÓ\åıvÁ\ì\ê;‰Ş˜ùüù»»š\Ù\àü4=\ï2€$^Œ‚$\ŞH\'|[\ïh€\ÄP®w\È(È±\×A‰!\×Obo€\Ä\r“U\àÍƒ?v\Âp\æu3¿\ï\ã–\0\0ÿÿ\0PK\0\0\0\0\0!\0‚)¦]\Ô\0\0\ì\0\0\0\0\0word/webSettings.xml\ì–Mo\Û0†\ïö\İ4£I \è0 ÛŠ­\ë]–\åD˜$\Z’\×ıõ£?Ò¤Kõi=\Ä‹¢ô>\"Mò\Õõ“’Ş+@/H8	ˆ\Ç5ƒB\èõ‚ü~¸½H‰g\Õ• ù‚4Ü’\ë\å\çOWuVóüwwZ)\ÚfŠ-\ÈÆ¹*ó}\Ë6\\Q;Šk\\,Á(\êpjÖ¾¢\æÏ¶º` *\êD.¤pÁŒó\n”¥`ü\ØVq\í:½o¸D\"h»•\İ\Ó\ê÷\Ğj0Ee€qk1%{¢B¿`\Â\é	H	fÀB\é&˜\ÌQ‡Byt–’@<\0fL\ã³\á£òˆcù8L¼\Ç\ØFñ\'\â)–}]k04—H\ÂO\ãav^n\ß\íaK\ìB\ì\ì0zu\Ö\ÆEóŸğ²[Ï¡hnºµ•\Ø}\Äo½\Øw¼t{oğ\âı)Ö›7\ÜP:W\à¨üÇª0­\å\Z}MpbŸ\Û}­QQ\Æ›lGºu\Ğ#\äQd\ã”ù«ˆ\Æi\Íq\æc¤ş!\é\Ş|]\Ë$œFq&\çr|„r„\é4\n\ãi:\Ïõøõ˜§i’¤ñ,8\×\ãÕ£»k*\'”x\æ·`Vj\ËM\Z—\Íıøí®›Q)¡¾ÿş¥§ı£,ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0¿WgC\Ç\0\0\02\0\0\0(\0customXml/item1.xml ¢$\0(  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬Áj\Ã0†_\Å\è¾8ë¡Œ¤\Ú\ÛA¶vq%1\ØR°Õ‘¾ı¼•\í	vúşıªwkğ\êcrL\r<%($Ëƒ£©÷·\Ó\Ó¨$†ã™°bØµu_u|‹“\ÊqJU\ßÀ,²TZ\';c0©\à)\ïFÁH\ã¤y\Å\Û[@½)Ë­\î]\ïO\Ñ,ó²ÿQu\è\Ñ\n\Ü}>ûcÿº\ï\Ü*óqp’«^~ò°X“ÏoğlB†3\êúû“-´µş+\Ü~\0\0ÿÿ\0PK-\0\0\0\0\0\0!\07‡Q£\0\0G\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0‘\Z·\ï\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ü\0\0_rels/.relsPK-\0\0\0\0\0\0!\01§i\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ü\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0«¯Ù¤2?\0\0%N\0\0\0\0\0\0\0\0\0\0\0\0\0\0§	\0\0word/document.xmlPK-\0\0\0\0\0\0!\0§%ò\Ú\0\0\Ë \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0I\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0€[	^\0\0˜\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\0\0word/comments.xmlPK-\0\0\0\0\0\0!\0TWZ´\0\0\\\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¢S\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0\ØO’Mó\r\0\0lˆ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0…Y\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0v	¤uw\0\0\å\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¥g\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0+^\è\0\0\ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Sj\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0±\n¥½\à\0\0\0U\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0qm\0\0customXml/itemProps1.xmlPK-\0\0\0\0\0\0!\0t?9z\Â\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¯n\0\0customXml/_rels/item1.xml.relsPK-\0\0\0\0\0\0!\0ZuD\Ç\0\0\ë!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0µp\0\0word/numbering.xmlPK-\0\0\0\0\0\0!\0ŒyA\Z\0\0\Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬t\0\0word/people.xmlPK-\0\0\0\0\0\0!\0öˆI7D\0\0¶	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0óv\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0óŸ\àk\0\0Á\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0gy\0\0word/commentsIds.xmlPK-\0\0\0\0\0\0!\0\ÒÕˆf>\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0word/commentsExtended.xmlPK-\0\0\0\0\0\0!\0‚)¦]\Ô\0\0\ì\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0y~\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0¿WgC\Ç\0\0\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€\0\0customXml/item1.xmlPK\0\0\0\0\0\0\Ù\0\0Ÿ\0\0\0\0'),(6,'Activity 2.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','PK\0\0\0\0\0!\0Z}q\0\0\×\0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0´”\Ëj\Ã0E÷…şƒÑ¶\ØJº(¥\ÄÉ¢ehúŠ4vDõBR^\ßQœ˜’ò\Ø¬™{\ï\Ù\Ì`´\Ò*[€Òš’ô‹\ÉÀp+¤©Kò3ùÈŸI\"3‚)k $kd4¼¿L\ÖB†jJ2‹Ñ½P\Zø4…u`°RY¯Y\ÄW_S\Çø/«>özO”[Á\Ä<&2¼A\Å\æ*f\ï+<nH<¨@²×¦1e•„9§$g\ëta\Ä^J¾M(P¹\é	3\é\Â6z0!U\×Õ²\Ú\ÓI&K\ç¨ø\Â\ËôR@6f>~2uº´^Paù\\£¦8|`2[U’C«On\Î[!\àWÒªh+šI³›ø(‡™\ë)xT^¤µ\î„q­ \\Ÿ ñí‡Qp€­s\'\Â¦\ß7£øg\Ş	Ra\î„M\\£µî„ˆ¸8 yö/\æ\ØØœŠ\ÄÎ±·.\à\"ògŒ½\Û4I\ãÀ|”§ÿº6­/\Ò2 d\Ó\ÍZş\0\0ÿÿ\0PK\0\0\0\0\0!\0‘\Z·\ï\0\0\0N\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’Áj\Ã0@\ïƒıƒÑ½Q\ÚÁ£N/c\Ğ\Û\Ù[IL\Û\Øj\×şı<\Ø\Ø]\éaG\Ë\ÒÓ“\ĞzsœFu\à”]ğ\Z–U\rŠ½	\Öù^\Ã[û¼x\0•…¼¥1x\Öp\â›\æöfı\Ê#I)Êƒ‹YŠ\Ï\Z‘øˆ˜\ÍÀ\å*Dö\å§i\")\Ï\Ôc$³£qU\×÷˜~3 ™1\Õ\ÖjH[{ª=E¾†º\Î~\nf?±—3-\ÂŞ²]\ÄTê“¸2j)õ,\Zl0/%œ‘b¬\n\Zğ¼\Ñ\êz£¿§Å‰…,	¡	‰/û|f\\Zş\çŠ\æ?6\ï!Y´_\áoœ]Aó\0\0ÿÿ\0PK\0\0\0\0\0!\0³¾‹\0\0¶\0\0\0word/_rels/document.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬“\Íj\Ã0„ï…¾ƒ\Ø{-;mC	‘s)\\[÷d{ıCõc¤MZ¿}EJ‡Óƒ3bg¾…\Õzó­; ó½5²$†¦²uoZ\Åö\á˜\'ij©¬A#z\Ø\ä÷w\ë7T’Â\ïúÁ³b¼€hXq\î«µô‰Ğ„—\Æ:-)H\×òAVŸ²E¾H\Ó%w\ÓÈ¯2Ù®\àvõ#°bğ?Ù¶iú\n_mµ\×h\èF÷H6ó!SºIÀ\ÉIBğ\Û‹¨4*œõ\\}³\Ş\ìu‰.l|!8[sË˜fñp”¿f6\Çğ“¡±†\nYª	\ÇÙšƒxŠ	ñ…\åûŸ“œ˜\'~õ\Ûò\0\0\0ÿÿ\0PK\0\0\0\0\0!\0.òª\'\0\06¬\0\0\0\0\0word/document.xml\ì]ınã¸µÿÿ÷X\İ<ñw\ì\É4^8‰³\Ív·w0Ù¢\è_-\Ñ\'’¨’R<\îÅ¾F\Ş¸¯\ÑG\Ù\'\é9‡’-\Æq\âL\ìh3c‘\ây>~\ç<¢~÷İ—Àg÷B©\ÂóR\í¤Zb\"t”+\Ã\Ñy\éO?_¿ë”˜‰y\èr_…\â¼4¦ô]÷¿ÿ\ëw\ã3W9I Â˜‰Ğœ#\ç¼\ä\ÅqtV©\Ç7\'t´2jŸ8*¨¨\áP:¢2VÚ­Ô«µ*ıŠ´r„1ğ¼K\ŞsSJ\É9_¶£\æj>†\ÆH°Yq<®cñeF£öh\"­\ÊûJg™P}B0\Âzm™T\ãÑ¤N+Ø«%BÍA¯–(µv£´bp§»Qª/Sj\ïF©±L©³¥%u\n–\\E\"„Ê¡\Ò\áR*\×wIôG<–\é\Ëx4«§.Ã»z­¦‚†ûh\n\íJ \\\á7ÜŒŠ:/%:<KÛ¿›¶Ç®Ÿ\Ùö\é?Y½\Íøm“«h\ä-|\à…\n\'£©…»RƒJ/#r¿i÷Ÿ\İ7j[š\Ë:xº²¬œÜ¦û)ÿ\ßö|3\ÅZu‰ ‰i‹mº0ÿÌ¬\'h\á\ìÁ;±&\Ç\ÜÚ–\0’¨/8u\ä–*Ñ°Ü„ñ@\Ë#G¦•‘1“`f\ê\ãhô4mù^«$šQ“O£v3³ı1z\áG\ĞJµ.o	\æi¹õx8g7£Pi>ğ¡G CÔ€‘ğo\nC£+u!T(w‚ÿFl|¡†û\é¼T­^µOë§—¥¬\èJy\â\Ç\Ë5sEDä£¦n\ã‰:»\çşy\é£\Ö|ˆø&!Z)Uğ†0	\ìÒ¿÷³ûªÓº7+«cY%\×ÀDÜB=\ÆBc+ø\íKd}½9½ø”\à\Èy+KT\Û\ÖúZ…±Á\ÆÆ‘ ø\ßÿ^\Ä\Ò\á\ì\"\ØXp÷Œ\ä?÷B ı´\ë½^hV6tLœkr!]iŸ,†\'/ñùùGùJge:şo+\Ìß§lhf%³\ÖY™\'G\â¬b\"|_m¥Ï‰WÙ¨\ÎKŸù»>b\ĞC\à~w\ÛKyL<ªL…hÿúj|·\Ægq·\ç\Äò	V\Ç\â\ØV¾˜\â\ë\ÉÀa0‘F\è{Qê±9¾¢‚\âİ›ğ\ê#\âBµ\Óh¶¯Ow±‘F†^¾Â“\Z§)§-x$ü¼v)=4rxpØ½ôÔ¢KÉ›Cı}«zyM\Ê\\°õl]bjÁÁGr¦*„?CCb\àª\ï¥J3±\ÒR\ÆCw\Ş\ÎavÁ÷çˆ˜¯\ÔK\"Š1\Ãé ™˜\n&FÇŠD\Ì8ˆB–„®Ğ´\0\Ä	~…\å%\ÖŠÿ€q\Í#Os#\n\Õ\Ş†j»µ•q¡®…º6¯\Ò\rıISì…»\ßp­ `\êÿd\á4\Ä\Ğ#rŸ\Â\éÉ·MC\ÄÁ´\à\î„AR\èş^¦4\×EpQ õóZ\ÆPï…±Js…,Tyo\Ë\Øc•h\æøÜ˜€\Ç\Â0Ú«“\Ço\n\í¾30C¥¡oµFÛ¤µz\Ê\Î\ÏNÆˆŠ=[¶µø7ˆ÷¼ôc\âH—³\ï5\Ä\0\ÂØ¿/\ÍJY\ÏI¶Iÿm/\ÙL\"\È\Ì\ìß‡˜jõşÕ¤\Ô\Òq¬Hxy!®”\Ğ.‚XÂ™Y\ÑĞ€ÿÀ}1`¾¼\ã†\àö\'\íß°½©¾8¾\àš˜€\ãI7ø\àr(}¨½¦ÿ\ÒQL\É\î\r\â\Önz‘\î\r\Æ?\"\è­×¦X|‰{€›!%\æf\Õ\Ü¤±g\Ô\ØE|SŸ_–³Y={\íöUµ±_õ\ÜËˆ\Öú¢O\Â¡ù“2»ağ]˜”1$˜rEó³@6ÛŠ9*Ä”mJ©d\äÂ‚	3*,³±§`7‚–wWG˜À\ZÂ”O\Z65,3…W‚™dğY81\ÎE´¸üÓ„µ\Ş\á]\ï<\è‘\å”\Ñ\Ê@¸ø˜Û±…\ÆVŒ†„\Õ\î\Ä]~V“\Ñ\Äw2v<\è\İÀµ;V\ÊeC_)\röG\Ğf\èK—0¸6ºc­‚\'&øHhŒğ™@\Ñ6.\ã\ãL\âº\"„*ñ%\íc™ıúË¿n~ı\åŸûœ\0q´z\Æ\ÙgJ˜\êş\æ\×_şõ€©x#öÈ¨@Œ=Ğ‘–P\Î\àG{*øc˜øŒry¡9r\ÃL\0\İD\é\à3:}\è_ô	b	“<ûXb´\ã)\åg\Ïg?\év¡Gœ`On`à®„ ¥\Î\Ù@S\ÄC`¢öeª2e1i\Ï\'¹«\İƒ®»‚n@ŸDf=º%²İ™6n%@eŒ²F&\ÇÈ…€O‚˜\âò	J\îG¢D {rr`5±ô°g\rØƒ\ÂóP-¤%ühö(’òÁ\n\r™k9r\Âş)$Œ1\ãÓ‰õF•±p‘1SİªŸ1%úd{1°\Ü\ÇD¸?\ë„ñõ˜OŒ\Ô]ğT.Us%Vò¤\Úp›µ:u\ÌF«±¢aOÓ±N»ôWd\Æôhhg €…–9sE•‘_©¥%f£%\æm‡l\ÇE„é¸©ŸÀŠ)\ß-\'P|€#*	…;w€.we\ç6\å\ØA»v7U„ôA9nw -‘-$Q\ä\ã\Ş*\Ü‚Š\Ùq“ş\å{iY*\Ç\rşh”¢›r\ÑÀ]p\nCXÂ»õˆ/ k´&Xš\àDZ©a_#²Æ“0\ÑD\ì\ß\ÆÀ‡\Ôeôwƒ…\àc\İğû¡{|ƒÿ\Ü\Ø8\è.\à)\é\İ\r\Ób¨9D(`<ZZq@^\Ò[\ÅÆ©Y… ö1Á€C\èn\ĞñVk§\06\"\ïiq,T¦i[¢BO­;V \Ë\äğPs!P\âš\\‡\í\ÍX\ZO ¡  *Œ¤\Ğ	Ï•\É`NL¡Ç¹bQÁ\ØŒ\á€\áN\ØENmj\ÈS€öe¼\ĞM´\Z³$‚\äqw\n»ru3œ\ZC\à¸fSw“]™ú\"-\Ö\àA\ã\ß\"	~O\èˆOp2C™¹$n¯h9 \ê3\0÷ ›\'\ìÿşV¯V[\ì-.&Z…ÿx8®¾¬¶[­\ëUquZCj4×¤w\İ\îô›«š¤5E“¯Ò¤_ovš\ï§M,>-\æ\è\Ì\×Ğ¼)%M”-F\Ì&5ı\È9Ë³/t\rV\â³/w=%\åq%ÿ®­^ô\á\ŞO\Ã,\á~„iÅ…üˆ\Å\İ?Š1û3\æ6=Œbı\ë\æû÷‹+T…›U?½9§úÏ·B\ÕH\Ç<mğª\"…İ—¤r<\Ûó’\ÔŞ–¢h\î¹\0~…Q\îk|\ëŞ®À\É\Æi†ğ&4´t“‰o0\æYÚ·,òÁ9†pAŒñôÊ•TQ\ÃC»¾@‹ P\ãxBhœ <…\Şf½~µ\Ïzš\á\æ\ß\ÆhW;–M…\É}ue\ìö¿ğ\0\Ô\êŒİ¢\ÚÑªi\à(É©±¡.üO\æ§\è\Ïÿ«V£}QÀÿ‹[oü9sÅ½th\İÚ€>\ã\Ì ŸŒ\ÒÜ§ÀmW-¹_\Æe\ÎL¤Â‘(Ã”—¾\Ğf”z0\0\ßN¡É…yó;\Î\r-dk\Ê›\ï¼=>ùN\àœ\0h®\ì§\ë%Š\áŞœ]ñ\Ô=?ô÷\ëõN³Q@ı}\Ü\Ä:^ğœ÷ø=A»f\ÆSx²	3±(ø7RS\Ä.1°‡\à\ëó¡o‘tL-İ®c\ÎCfw˜ü\Úk.ú\í«şl­ôY°¦ğS¯\İOı\Ş.ü‡v\Ûl(qÁ<ö\àš\æj\n\×ôŠ•n°_\ÕûÁ&\'¯sZ?3‰`ÖI4B£`j“»\Ø\Ä#®cÊ¤¢\è°\Ì\ì\ÉHlH\ß\Ç,O÷\ÂEìœ”1 ¼\Ân\ÄE\ÉÀ—\æ‚ÀœÆ†™”¡­•3Ü®—\Ú|`Ü‚\ã[-_]5N›W+¢\ØÊšğ\í\àÂœ—»8?NS†­t&&V®\ä¡)³@-C\Ğ\áTù\Ì4«#õ™º%V)•Y+\Ğ\Ş-–ˆ\è\ãO\ÜX\ëzW\Õ\ÚeoÁ±T;Z}V˜\ß0œ»T1½9§Š…cyH¡s<;T\Çre“\Ñ6;–—\çK;–À~l7+\Ğ|`ğ\ã\Ã\Ú;V˜\Óá³¦\ëq\Ì\Æ<a6ƒIZDDÑ¯‘%Lı\Úf\ÈIôğôü&=±\ÃÚ¼+¸\Ş5\ÍÃµ	m\Ól\æ`\Â\à‡\ïj\ÒË¶\è„%&w©»mÌ¤}U\ïU§3ü”y…9Û™¯!\ÛI‹r¶S8\âe\\\Éà½h°_\íg	¹›\íğ%FúÒ®x“Ó½¨µ\ê\Ål€CfB†M/PjjšgQ†É¨M`5å®«ğxõ`›…\Õõ\á\Æ\n\È|[\Ó\èãƒ€c\ãD‚Ÿq¦oa\ßJ\Â\àƒ‡´V*\Ü¥½ó\Ï\êNlx\\\Ö\êõ\Şl\İÉ²g¡0Ÿ\Ê=WCV”å¬¨<²\Å\Ï5ğød\ß\ì\Ø\ìn^bœ/vdkÁ\n—\êü¡¸ônò‰}¿%1N¶Yûİ‡\r³\';d­š9­K\0í±°Ù±x@™\ÓükR\ß\á–\á\Â+T\ÜĞ‹<œ°¿a¶#~|eœ?mWû•o\ç\Ì×:¥E9u* ı!¥\Ìñ\ì@!}M•½˜÷\ĞR\ÏK0`oV	 ş\Ã1xŠÕ·l Ào05\ÓÛƒI\×UÅ˜ŸNs-|Q×Ÿz¦\è!Í­ dN\êY\ácq\å˜\İ\ÔADê¦¾¾\É\r\Ì;j¨»\Å\éc\ê\Â\à«\Ø\0c\Ò_\Ø/>T$\Û\éÁƒ(®\Ğ\Ş\Ão\rs4M?fò\Å\ã+4\Ã$`8[€|»Um\Î\ŞN—K\æó«js5v#\Â\å\Ã\r÷;kFsG§\×\Ü}p£ğ%\ÆşBÑ£gI\Øp“\Ã\Å{y/]{1dô\Ø-Lqı\nÀVVw\Ôk\Ù¬-OX\Ënö\ê½ƒuSG\0ø\ê©\"d®F#\Ç#a(\Õ\Ô\È\Ò\ç=ğGZƒ.9wÿXğ\à!i\ÍñcAÁ\'³\Ç\Z\\ó²\Ñ;]y\Ë\n=ûy./·¤\âœc•=\èeR\ê¸6Ÿ‰r_fÀ¸-£M‰d2\ÍZ£ój_…Ø‚ë¦…-Œ3¶ğK\ïtJÃ¯W\Óa­!\Çópşú½º\à\Î]\Ú\åô\Ş>á‡½ÓšÁ\n\æ\Í\ë\Ö\ást§\ÃwW\"\ÑE³YoµW!\Ñe»z\İ\ë\Ï!Q³ßºluòH´\â”\æ:I,wJ3\ËN\ŞmvşUÎ—\0ü\İQ+\å\æ\áh­•ö6Å§Vµ¿ø\Îÿñ1!w€\ï\æ@ú‡\Ş\Å#h\î\ã1¼^(\Ó~“ø/jÕ«\×øv\ĞV\Ãk?u‰C»\ê\0\Ü-&ŸfOÏ”\Şh\å½vób1\ë Uæ†…ğ»\Ù)\âoJökXÁñ\Ğ[:\Ìy\î0õBKºYToS?şL‡Ó¡ñtB8\ÅAG¹sYo\Õ\êkB\îƒ\ä´Mşbzú|™~b\ì°üÙ€c\Ö`mdó\å9·V¬ø(\Ä	\ë\á—r&³ü…‡·«oJ=Ö°\ã\á¯yl\âR³U­53¢Kÿû\à\'-–¿_\0\äMO›\ßì¢\Ï\Î6|iõ\r)N´\â\Ó%öS÷\ÓOŠ\Èõ\Ë‡®¨¹/\é09L¿\ÔRh\Æú|¬W\èô• £µv0õBÆ´˜·‰\rµ\Î\ëü\Ê\ÑF<HÖƒƒ#îœ¶\ë×­·\è‡,õ®·id½‹\Æe­sD\Ò\ín†±B›Q\ævy¤{w\İG\ç\Üp:†_\Ã\Û4À\ëF»yT›]ü(\ßÑŠ´ü¦dù\Æ\æ—\İ4«x˜Ä‰Ş¨\ÃoD\Òå¢nµª\ï\ÛW*\ê\Í	oÅ’ñQÔ“9~U\ÒD#œø\ã\ë¶\ÈB¼…F¹[‘N4º\Å1£°Ş¤4B~·:Í”\Ñ\è\'Ï‰Uåµ†}¾4»¨8VÁ\ì\Ú&gW\à®Ğ˜„N\Û\ÙC¥(ƒ1½%1]\Îø\ÌL96\Í[w•ó½–”\Ğ.Cñ\Ó+\ÎKSjTÉ¸A?Ê\Ğh’\ài¦\İÿ\0\0\0ÿÿ\0PK\n\0\0\0\0\0\0\0!\0¶§\Ë4—\0\0—\0\0\0\0\0word/media/image1.gifGIF89a\0\0w\0\0!ÿMSOFFICE9.0\r\0\0\0sRGB\0®\Î\é\0!ÿMSOFFICE9.0\0\0\0msOPMSOFFICE9.0Dn&P3\0!ÿMSOFFICE9.0\0\0\0cmPPJCmp0712Šº\Î\0!ù\0\0\0,\0\0\0\0\0\0†ÿ÷\ØÀÀÀÿ\Ğÿ\Ô\'ÿ\Ø;ÿ\ßb\0\0\0RQÿxxÿŒ‹ÿŸÿ\Å\Åÿÿğ°ÿó\Äÿ,+ÿÿô\Äÿø\Øÿ\ï°ÿó\Åÿ\è‰ÿğ±ÿ\Ú\Úÿ¿¿ÿ±±ÿ££ÿ‡‡ÿyyÿ\×;ÿ\àbÿ\Ï\Ïÿ³³ÿ¦¦ÿ˜—ÿ\Ä\Äÿ¨§ÿššÿŒŒÿqpÿbbÿ­­ÿ‘’ÿ„ƒÿuvÿZZÿLLÿ¢¢ÿ††ÿxwÿjjÿNNÿA@ÿ––ÿzzÿmmÿ^_ÿ\ĞŸŸÿ\Æ\Åÿywÿ‹‹ÿÿ\èŠÿ\ç‰yxÿxwÿRRÿ,*ÿ++ÿ‡€‚ƒ„…†‚‡ƒ\r\0†8>“†Œ›—¤…– œ”4567–™=./0123<9:()*+,-B\Æ@	\n\"#$%&\'\Ó\Æ\×\Ù !\ê\ë\ì\ZC\Æ?\×Ë†\ÄA;<\ØHT(\0;PK\0\0\0\0\0!\0·UBŠ,\0\0‘\Z\0\0\0\0\0word/theme/theme1.xml\ìYM‹7¾ú\Ä\Ü\í,ñ{l\'mv“uRr”g\äe5#3’w×„@IN½\nié¡\Şz(¥\Zz\éYHh\ÓQI3cl¹Kº„\Ò5¬õñ¼¯½¯ôH\ã¹z\í,&\à¥Ó¤kÕ®\Ø@‰Oœ„]\ë\ŞxTi[€q˜\Ğu­bÖµı?º\n÷x„b„}\Âö`×Š8Ÿ\íU«\ÌÍ]¡3”ˆ¾)Mc\ÈE5\r«A\nO…ß˜T\ë¶İ¬\Æ\'H`,Ü…\r¸=bYû…û!ÿ\ÎdƒO\Ò#\é\å6%lp\\“_lÁ<’‚Hº–) §ct\Æ-@ ã¢£k\Ù\êÏª\î_­.\ßb[²©¿\Ü.7\ë\Ê.\r\'KC\Çqfo\é_\ß\Ä\r[\Ãæ°¹ô§\0\Ğ÷\ÅL3.º\ÏV\İsrl	”\r¾­A£¦\áKşø+?\Z^²¢³¼UK ¬\èn\à\İ~§?\Ğı+PVln\à[vo\à´4¼E\'\Çh\Ûm6¼b¶KÈ”’Fx\ÇuF­z_¡ª¥Õ•\Ù\'|\ÛZ‹\áCš@%rœ\0¾˜¡)ôÎƒORp‰…7ƒ	e¢Ù®\Û#»!şË£J*£pÁ’u\Öä³&\É0?\Å3Şµ>^­\äõ«W\çO^?ùõü\é\Óó\'?\çco\Úİ€IX¶{û\ÃW=ÿüù\Ë÷oŸ}mÆ³2ş\ÍO_¼ù\í÷r\Ï5Zß¼xóò\Å\ëo¿ü\ã\Çgx/…“2|Œc\ÄÀ-t\n\î\ÒXL\Ğ0\0š¤\ïf1 .[ô’ÁJz\È#\r}k	4\àúH\ãıTÈ…	x}şP#|¥s\rÀ›Q¬)%}š\Z\çtSU\Â<	Íƒ§ó2\î.„\'¦±½µ,\ç3±\î±É¥!\æ\"RC” d=F\È`ö\0c-®‡\ØO)£S`Ğ‡\Ø’1h«iet\Ç\"/A‘o-6‡÷AŸ“û:Ñ‘bo@br‰ˆ\Æ\ëp\ÎaldcRF@™H-R_8\ã\"\Ó!\"Ä˜\É\ævº\Ğ\è\Ş2cNû!Y\Ä:2\åøØ„<€”–‘z\ìE09\ã$*c?a\Çb‰Bp‡r#	ª\ïYy€\É\Öt\ß\ÇHK÷\Å{û!ó‘=óÔ´%\Õ÷\ã‚L!RÎ«kº\ã\äB‘_“w÷ıÉ»\Ñ\×\ß=7k\î$\İ¼Œ˜÷Rl\ÜM\ë¾\r·.\ÜMü\á\ëö\0Î“;Hlô\Ùş_¶ÿó²½m?\ï^¬Wú¬.ò\Åu]¹‰·\Şİ§˜#¾ \è€)egbzÁH4ªŠ2Z>*\Ì\"QÌ‡\Ópa\nU¤”†ytÁ™¦¦FY\î:d`F™8T³Ñ·\ì óøYk­V<\n\ÈW\í\âl)\Ú\ÅIÄ³\Öfkõ¶t¯j¡z\\.H\Ûw!Q\ZL\'\Ñ0hP3\Û	‹E[º\ß\ÊB}\åYû@ùÓ†\ëdŒ\Äzƒ2O™}‘İgz[0õi\×\r\Ó\ëH®»É´F¢´\Üt¥eÁ\0­7\ï8×UJ5z2›4Z\í÷‘k)\"k\Ú@½NÅk¸Âg]k*n…¢Ï„?&u’0\éZ>\Ïıo”e–2>€,\Ê`ª+›Œ9JÁ±X\ë\å4dÅ­Vo\É9~ \ä:ö‡9õUN2šN‘Ï·´¬ª¢/sb\ì½$XV\è\\>Š‚S0!óô.r[5À\03¾Œf€\Ó\Ò\â^EqM®ò­¨ıj¶Ú¢\Ì\"˜Ÿ(e1\Ïàª¼¤Sš‡bº>+½Of\Ê$]úÔ½\ØHv”Ds\Ë\"OM³~¼¿C¾\Äj¥û\Z«Lº×µ®Shİ¶S\âòB‰\Új0šdl ¶jÕ©\íğBP\Zn¹4·»>\r\ÖW­< Š{¥ªm¼ “‡b\å\ÄuuN8STÑ™xFğŠ–3%P­…ºœq0Oq\×zd»=Ç«»^\Ån»ÃŠ\Óp\ìJ\Û\í5*=\×mÔ†n\Íô\ëEPx\×\Ül\ì‘x!‹üı‹j\ßx\×\ì+>«Tİƒ«\ÊX½ƒ©Õµw0\Ù=Œe¿°ˆÌ£f}\Ôitú\ÍJ§\ÑUœA¿]\éx\Í~e\ĞôZƒ\ÑÀsÛ\Ñcœ(°\ÓkxNsØ®4kWqš¶¤\ß\îTZN½\ŞsZ½ö\Ğ\é=\Îc-f^|\áU¼öÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0r\æœF\ë\0\0´\0\0\0\0\0word/settings.xml´W\İo\Û6°ÿÁğóS”()Z“B–¬5E²uö²7Z¢m\"’(´·\Øÿ¾%\ÖI\ËéŠ¾$\Ôı\î‹÷Á;¿zı\ØÔ““Š‹öj\ê] é„µ¥¨x»½šş}_\Ì\â\éDi\ÚV´-»š˜š¾¾şõ—W\ÇD1­MM@E«’¦¼š\î´\î’ù\\•;\ÖPu!:\Ö¸²¡\Z>\åv\ŞPù°\ïf¥h:ªùš\×\\Ÿ\æ¡p:ªWÓ½l“QÅ¬\á¥Jlt/’ˆÍ†—lüg%\äK\ì\"¹(÷\rkµ±8—¬D«v¼SV[óµ¸³JßºÄ¡©-\ß\ÑC/¸\îQ\È\ê“\ÄK\Ü\ë:)J¦$¨©­ƒ¼=¾Pô\Éö\Ø¯hT¸‡\Ì\é©\ç\äû\à/„%¯¾OG8ê˜ƒ\ä=Š}Ÿ\ZbÕ¨S\Ã­\"U¿$´t\Ë×’Ê¡pÇ¸6er³m…¤\ë\ZÜøN D\ã]ÿ·÷ø\Zš\æƒ\Í\ä˜tL–P9\ĞqM\ç=\0ù›•¦\Z\ØÕ±º6-XÖŒ‚öc²•´\æ±#S±\r\İ\×ú®WZtÀt p‰\Å¼;u;Öšÿš\×\â&^î¨¤¥fr\Õ\Ñ¬e¢\ÕRÔ–¯\nA£J¨£QÂ´\íù´\Z\0hi\×~\Ö\Öw¢b½\ç{\É_Ÿ^ÀX÷¬“NC,\É+vß‡{¥O5+ÀùÿÀÒ¶z»WšƒFsóğ\à[@\\Áò;(ûS\Ç\nFõ\Âô“Œ™L5\ïî¸”BŞ´\Ô\ÎO3\Æ7&Á\0‡Z¼ƒò\âRMœ\ß0ZÁ¤øA»ó§es§Röğ^mYÊ£‡\Ù\àiûN]ˆG9ò]\ÆA–‡Nä’ ¬p!~ˆ<\ßi\ÇÏ‰-\\H@8µ)^¤n$ó\ÓğÒ‰,IF\Æn~‚.£Ü…„>AK§oa„–¾Óƒ0‚…Óƒ0Ã¤pf!\n<?v#‘0p\"9N\İù‰‘§¶8Œp1>Ï‘”Dù\åXËŸ!?óœqKs\äeÎœ¦E/^/<”_:}[xûÎ¸-xf#\'²Œò¥3D¸\ã\ÔY½;½\Î\"T¤K\'’‘eî¬\Üw—|½ó\êÔ™\Ó%\Æñ× œq[†\"n$&»‘\"¸t\ç§ğ£À\íA‘Bs™\Ì^¡&\éw¸¿¤=õ#e\ÒmÖ’\Ó\É]¿\å\Í{µ|Xğ\Ö\âk[{Š¬ök\Îf \ZZ\×\Ì\\˜\Ù\ß$W]\Î6\æ\\\ßQ¹=\ë9¤“\nóÿ\í\']ı>Á\äR\ì»=J\Ú\r£Â²xA0JòV\ßò\Æ\Ò\Õ~½²R-\ì5O }[½;H§sx‰†\'ßŒ\Ü[jF‡\áej–½‚]\ÖrÕvG»n˜.\ë­w5­ùv§½~ høª\àÇ€ùXoñˆaƒ\á3´\ìo\Ü\ã\áLÃ–ö„Ï·4ÿL,-8Óˆ¥‘3-´´°§Áö\Ä$,a0\èì±§oD]‹#«Şœñ/HCÔv,v4(/1Æ¥MM	{„\rU\\\Ão¬W\r}\ìBl\Zp\ä®\éI\ìõ3\Şë™»\ç\Z*ª©±Ï„M‰\æK¿;–\Êquj\Ö\ç•\ï·Áñš+X:\Øµû\İ`^T¢¼N‚“¡GhOM:¼©1[¥¾‡\"€¼¿g›U¬\Z1+JÑK/a\"Ä³\"_f³ \Èğl\áE\Ù,,‚Œ\"bü\ïØ¤ö\ç\æõ\0\0\0ÿÿ\0PK\0\0\0\0\0!\0µ\ï ~¹\0\0\0!\0\0\0\0\0word/_rels/numbering.xml.relsŒÏ¿\n\Â0ğ]ğ\Â\í6­ƒˆ4\í\"BW\Ñ8’k\ZlşD±ooÀEÁÁñ\îø~\×öO;³\Åd¼\ĞT50r\Ò+ã´€\ë\å´\ÙK\Â\Ù;°P‚¾[¯\Ú3Í˜K(M&$V—L9‡\çINd1U>+—\ÑG‹¹ŒQó€ò†šø¶®w<~\Z\Ğ}™lP\â \Z`—%\Ğ?¶G#\é\è\åİ’\Ë?*¸±¥»€5e–”Á÷²©´w-ÿz¬{\0\0ÿÿ\0PK\0\0\0\0\0!\0’NH¢\0\0fy\0\0\0\0\0word/styles.xmlÌ\ßW\Û:\Ç\ß÷œı|ò´û@\0¡\í¹ôš\Â\Â\Ù\Òrº}Ü£\Ø\n\Ñb[¹²]`ÿú•d\'±\Ëñ\ÈSÎ¾@\âd>–4óiü#ş\í÷§$~r•	™\ßŒ†2\éı\Ù\èû\İ\å\Ş\ÛQ\å,X,S~6z\æ\Ù\è÷ı\Ëo\ï³ü9\æY iö>	\ÏF\Ë<_½\ß\ß\Ï\Â%OXöF®xª?\\H•°\\¿U÷û	S\Åj/”ÉŠ\åb.b‘?\ï&£\n£úP\äb!BşI†E\Â\Ó\Ü\Ú\ï+k¢L³¥Xek\ÚcÚ£T\ÑJÉg™\ît—¼„‰tƒ9< D„Jfr‘¿Ñ©ZdQ\ÚüğÀ¾J\â-\àÀ$1©ûÚ²\Æ\É8s²\Æd\Ï	\ZIøşú>•Š\ÍcM\ÒC\è\Şlşš}\ĞÁ\Éğ_°\"\Î3óVİª\êmõ\Îş»”i\ïY\nq§£‰‰\Ğğ«ó4#ı	gY~	\Öú\áÒ¼hı$\Ìò\Ú\æ\"£}³\Ç\ì¿úÃŸ,>\Ç\ë-SÓ‚Æ¶˜¥÷\ëm<Û›~­·DoJ÷¾\ÏÌ¦¹æ˜Ú›\Ãıªc\åÿZwW/\ß\Ù¯X(\ì~\Ø\"\ç:\î\'\Z#³ñÉ»õ›o…hV\ä²Ú‰”ÿ7\Ø}0\âZZ³R£úS¾ø,\Ã\ÍrıÁ\Ù\È\îKoü~}«„TZ‡g£wvŸz\ãŒ\'\âJDOk_L—\"\â?–<ıñh»ıK«¥jC(‹T¿>:=±Qg\Ñ\ÅS\ÈWF™úÓ”Ÿ|1±ùv!¶;·\æ®a‡•\'\Úì—œ™ô¾D\Ø\æ£cc‘\Õz\Û\Î,^ô\İ~µ££\×\Ú\Ññk\í\è\äµv4y­¾ÖŞ¾Ö,\æW\îH¤*…w¨»85¢9±¡9-¡9© 9% 9@GsqŒ\æ8\ÂÁ\Ée\èŠ\ÂZ°9¢½›»{ğ\ã\îü¸»g\0?\î\î„\ï\Çİ\ßı¸»Ó¹wwöö\ã\îN\Öxn¹\Ô\n®µ\Ì\Ò|°\ÊR\æ©\Ìyó§\á4–j–­\Ùhxf\ÒãŠ¤“˜2³Uñ`Z\È\ìû\İbE\ê?Ÿç¦ª\ä\"XˆûB\éRh\Ãyú“Çº\èXi!Pñ¼Pñ‰i\Å\\ñ4ä”M5•`Éœ 6WìŒ\ÅÓˆxø\ÖD’¤°	h]?/HAP\',Trx\Ó$#\ËŸE6|¬$øX\Ä1\'b}¡	1\Ë\Z^X\Ìğ\ÒÀb†W3¼0¨ùŒjˆ*\Z\ÑHU4¢«hD\ãV\Æ\'Õ¸U4¢q«hD\ãVÑ†Û\Èc›\âë«\Ãş\Çî¦±4G\Ù·c&\îS¦\0Ã§›\ê˜ip\Ë»Wlµ\ÌQ\évl½\Ï\Øı|”\ÑspG1§mHT\ëz\"S\İk‘\Ã´A£×†G$¯\rH`\Şp‰\İ\èe²Y ]\Ñ\Ô3³b·ŠÖ’z‰v\Æ\â¢\\\ĞWË‡G\ØV\0—Bed2h\ÇDğ³œ5\î¤\È|\ÛVoØ–5\\V/³ió*$A+c>Ğ¤\á«\çWº,{Lº”q,yDGœ\åJ–±V—üØº¤—\ä/’Õ’e\Â\ÖJ\rDÿ©~}~>¸a«Áº™Hiüv±—0t+ˆ«»›\ÏÁ\\™2\Ó\rğ£\Ìs™1«#ûÁ\ç§i\à¹.‚\Óg¢Ş²°© ˜dJ’ŒˆHz™)RA2‡Z\Ş?ùó\\2\Ñ\Ğn//‰\É9qÆ’U¹\è Ğ–Î‹:ÿ¬†,\ï_L	s\\ˆJTw$°\ÚaÃ¬˜ÿ‡‡\ÃS\İúZ\äöø£]\êZk:\ÜğeB7|‰`½©§¿m\à†w¶£\ê\ì4fY&œ§P½yT\İ]ó¨û;¼ø«x2–jQ\Ät¸’\à\ZH6„2.’4£\ì±\åv\Øò¨ûK2–GpH\Îòş¡DD\æ£ò„…Q¹ÁÂ¨|`a¤~…N\r6ü2\Zløµ:%Œh	PƒQ\Å\éôOt–§£Š3£Š3£Š3£Š³£O_,ô\"˜nŠ©!©b®†¤›hÒœ\'+©˜z&B^\Äü -i·J.Ì½2-/\â&@šc\Ô1\áb»\ÄQ9ùŸ“5Í°(\ÛEpD”Å±”D\ÇÖ¶µl^»¶\Ë\Ì\Ş\É1¸	·1ùR\ÆW>¹mu½<+o\Ëx\Ù|ÛŒ^‡=?‹ûeÌ–›£ıu\Ì\ä`§\åº`o˜\í\ŞaÛ˜O\Ö÷³´™\İğHÉº¡ğfŠ\ÉQc\Ñ\r\ã\ã\İ\ÆÛ•D\Ãò¤§%\Ü\çd·\åv•Ü°<\íi	÷ù¶§¥\ÕiÃ²KŸ˜zh\r„Ó®ø\Ù\Ôx\à;íŠ¢q\ën»ic\Ù‚§]QÔJp†\ælôN?Í¸\íû‰\ÇmQ‘›‚‘“›\Ò[WnD—À¾ñŸ\Â\Ìì˜¤i÷·¹z\ä}»ˆ\î•9ÿ(dyÜ¾qÂ©ÿM]\×z\á”f<h\åõ?q\Õ\È2\îq\ìnÜˆ\ŞyÇè€Üˆ^™\ÈiJInJ\ï\Ü\äFôNRn:[Á—­ =.[A{Ÿl)>\ÙjÀ*À\è½p#\ĞB…´P¬\Ü”P¹—P!-Tˆ@\"\ĞB…0œP¡=N¨\Ğ\ŞG¨\â#THA\"\ĞB…´P!-Tˆ@\Õsm\ï4÷*¤ …\nh¡BZ¨v½8@¨\Ğ\'Th\ï#THñ*¤ …\nh¡BZ¨*D …\n(¡s/¡B\nZ¨*D …Z\Şj\è/Th*´÷*¤øR\ĞB…´P!-Tˆ@\"\ĞB…”P¹—P!-Tˆ@\"\ĞBµ\'\Ú\ã„\n\í}„\n)>B…´P!-Tˆ@\"\ĞB…´P!%T`\î%THA\"\ĞB…ˆ®ø¬NQº.³?\Äõt^±\ßÿ\ÔUÕ¨oõ[¹ë¨£ş¨u«Ü¬ş÷\"|”ò!h½ñğ\È\Öı biQ;N«×¹ö’Ô‰Ï¯\Ó\î;|\êô?ºT\İaÏ™øq_KpL\å¸+\äë– \È;\îŠôº%Xuweßº%˜»’®\Õ\åú¢=\ã®4S3>t˜we\ëš9\â®]3„#Ü•™k†p€»òq\Íğ$0\Éù¥õI\Ïqšl®/„®p¬Nİ„®°„¾Z§c(Œ¾Nsúz\ÏM\è\ëF7\åO\'\ïX7\n\ía7\Ê\Ï\ÕPfXWû\ÕMÀº\Z¼\\\r0ş®†(oWC”Ÿ«abÄº\Z°®öO\În‚—«\Æ\ß\Õ\å\íjˆòs5œÊ°®†¬«!\ë\ê²\ã\ïjˆòv5Dù¹\Z.î°®†¬«!\ëjHğr5Àø»\Z¢¼]\rQ~®U2\ÚÕ€u5$`]\r	^®WC”·«!ª\Ë\Õö(J\Ã\Õ(\×\Ìq‹°š!nB®\â’s\ÍĞ£ZªY{VK5‚gµ}µö9®Zª;\ÍM\è\ë=7¡¯\İ”?¼c\İ(´‡\İ(?Wãª¥6Wû\ÕMÀº\ZW-9]«–:]«–:]«–Ü®\ÆUKm®\ÆUKm®öO\În‚—«q\ÕR§«q\ÕR§«qÕ’\ÛÕ¸j©\ÍÕ¸j©\ÍÕ¸j©\Í\Õ\'d\'\Æ\ßÕ¸j©\ÓÕ¸j\É\íj\\µ\Ô\æj\\µ\Ô\æj\\µ\Ô\æj\\µ\ät5®Z\êt5®Z\êt5®Zr»\ZW-µ¹\ZW-µ¹\ZW-µ¹\ZW-9]«–:]«–:]«–n´‰ ø	¨Y\ÂT\Ğı^\ÜË–9ş\ã„\ßS\Å3ÿ\äQ€\î\êşc\ã™Ufö	súû¹\î¨ù\Ùò\Ú=FQù³­\Ğ~ñ:\Ú<[\Ê›\ÕS¼ªÍ¶\á\Õ9VûZeº®¾spğ\ét2L\Ëo¹\Ò5>¨?¥ë­½\İ\İı”.Ç£\Î\ÎFS‹¹j<\â\ìlt\'_øcğM&\Ì}\ÄY\ã\ëa¿h[,Ê¿\Ó\Ìş¯=é¬’I\ãIgk\éÔŸt\Ö|¬Yù¶\ì\Ëú±fv˜¡cÂ¥öLXı<—\Ã1—…ö,øJ)¶+¥_\Zƒ—rü\Z¯m\ìVe\ëoW¡¸¯ò{\è*{\àhynT\İ\Ñj£z–v\ÅT™\\\r|Weº]-\Ô\í™\Çe¤\è×©	\Ê\Ç\ê™heK£\'V¢ô\çS\Ç7¬ü¶\\¹¿\ZóE^~zx`õ\Å\çóò\'ö\Ê\ÎENÀ~³1\å\Û\îH):P]$\áó™HcqYË€\Ûkv†µ»u³iÏ­Øˆ·7\ÊNÛ»\ËqezO_MV\É6û¨º•–„\ã_s©R%\æ\Ğür\ÄS^°¸º‰½–ˆzŠ7,26¿t‹Zò\'\Ğ{µü·\Ş\Ú\Öi‡\Ş[ºw1¿-¯ ¡hd\Ì\æm­4›‡5sz8Ÿ\Û\åE3ó§¼­™fóÿS3\Ş\ÖÊ¤\ÊwŞœœ\\]\"\Z¹iRº°×¸½l\Ô\æ\â7l» \×jr\ëq\Ûú\Íô^Ÿ{‘óe\çø¯tló€\İş\Ê>\èn¨„N1\í”x—ü\Êf:†ó×Œ\æúUö\á\0\0\0ÿÿ\0PK\0\0\0\0\0!\0˜ws\0\0\æ\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’_Oƒ0\Å\ßMü¤\ïPº?º\Æ5{r‰‰33¾\Õön«£¥i»!\ß\ŞƒIÜƒo÷öœû\ãr\Útñ-ó\àÆŠB\Í‰b€bj7Go\ëe8CuTqš\n\æ¨‹\Ù\íM\Êt\Â\n/¦\Ğ`œ\0x’²	\Ós´wN\'[¶Im\äÊ‹\Û\ÂH\ê|kvXSv ;À£8¾\Ã\å\ÔQ\\C\İ\Ñ\ÉY\ÔG“7\0\Î0\ä A9‹IDğ\Å\ëÀH{u Q~9¥p•†«\ÖN\ì\İ\ßVôÆ²,£r\ÜXış¿¯_›_\r…ª³b€²”³\Ä	—C–\âK\é+{üü\æ\Ú\ã¾ñ53@]a²\ÈsAe£wgu\Ú¨\Ê\Âp\ë\'·q°\Ì\íü¶\ÜÁw\çÔº•¿Ô­\0şP]>ñWª\İN¢~Ù˜4–¾O\Ï\é¶{|*I›a§lÆO\ë%\ÊF1¹\ãY8š¬\É4Ï’8ş¨W\Ì_€ò¼Áˆ\Óõˆ$\ÓÉ\Ø\Út†/3û\0\0ÿÿ\0PK\0\0\0\0\0!\0÷,_\É\0\0\ß@\0\0\0\0\0word/numbering.xml\ì[\Ûn\Û6¾°w4\ìnÎ–­\Õiœƒ·]W zY\Èms‘D•¢O»\Ü\Ë\ìöX{…ı$%b[¶;\Í\05…-‘ü?ş\ß ¾\Î\ë7ó8R¦ˆf˜$]Õ¸\ĞU%	q2êª¿\ì¿j«J\Æü$ô#’ ®º@™ú\æò\Ûo^Ï¼d……\n`$™7Kƒ®:f,õ4-\Æ(ö³‹”dd\È.kd8\Ä\Òf„†š©º¸J)	P–ÎŸLıL\Í\á‚ùqh!õg`\Ìm-û”¡ù\nÃ¨\âh­½\rd\Ö\0†¦±\reU†jiÜ«- »xµ…\ä\ÔC\ÚA®U\É\ÜFr\ë!Y\ÛH\ízH[\åo8IQ“CBcŸÁ-i±O&\é+\0N}†8\Âl˜z«€ñqòP\Ã#°Z\"\ÄVXÁ\Õb¢\È\n\ÒU\'4ñrûWK{\îº\'\íó·Â‚\Ã_šÜ’`£„	\æ\ZEÄ‚$\Ù§\Ë\ë¢Á\ä¸\0™–‘˜\ÆQ±n–\ZG¶Ë¾\ã\éV†rxŒûyü\ãHz^h\èGd„C,-qas\ÏÂ“ªpµq­Ğ¬\×8ò\0)\0\Ì-€V€,\éCFø€\å\ZN†ªÁ8L¶ˆW­>KGO«–Ÿ(™¤+4ü4´ûU\ï\Ïøc¸V^uë=Í™c?…#!¼ûQB¨?ˆÀ#¨!\Ê@à¯…7z)µ\Â{\\O¢1eóöÒ®‹E)\Ø\åë©—q|¶H‘\ÂK\âó\\‡Ÿ™\ë¨J@À‘ÿ	û™FK\×¯ªB¼,e]•/!^J\ÑQy\âLa%S8ˆ\Ç]5¾²¯œ^\ãª#_œ9bğv\Zr©CÉƒ¼ˆ[\å‚“Œ-8\Í3DUOò›D~&®ôô*N\ï\ëDIñEo\áö\ÙX\Ñs+¹2›\ÄÊ•®;†uø¹26†!ö¡re\ÂrsÇ¸¥ˆ0\È\r\Åf‡ıŒğh\Ìv9.\í0n\í\Ù\Ù-\ßY`¶ó5›Dw\Ø\ïs\Ê\Ğ\×´\ÍÀó\ÌB\ÎÑœ\Ñ	×°\äA\äqDı\ÃóB”c¼2’$(`¼´º*…+H¼ˆÊ”ctUbX\êg)\ÌRş\È\â¦r\ÛeY.kt½>±¡›®ªH\ì\ïÖ‹6¯œg¦“²Ç‚lqËˆn\à\Ûq|û#ú\ÌW¨\Çw¡÷¡ÁW1\Ì8\Ø\'\è^”>òö³a:F»\ívD–\ng\áª\è*m³\éx»ù(o?`\ï \Èw²#y7{ø§|PJı\Ş\Êÿš\"ÿ¡h\Ú$\ã}\îMı~}°\înZı[—û0ó G¿ES}ä½œ¯£•«XœF\Å\ÜM§g›½¾\à0ó¢)ŸÀğV\ì%|Yn&W«~¼”A\\\Ú„œSÿşõ\Ïrü— \Ğ0_¾§\ÂDş^¬- \Z^J\à\ÜtMY…«…8\áü9œ…›±ŸŒ\Ä/PV«X£\Óü­O 6yÔ³\0Ã£\á\Ã\"H˜ö  8\à\r}\\&P4Á\äq nÃ òó\Ã\Ï82p!\n \äòœ<Š\Ü÷\æ\Å	\"g\ØvY\è\ÄtI\ìv\Ó5\ÏA\×:]~d•\ĞÓ•\éZ\ç kŸ„n»]J—OW¦kŸƒ®s\nº—û\éŠ\é\Êts\Ğm‚®m•{bº2\İ\Ö9èº§ \ë\è¥G•˜®L\×=\İöIèº¥G•˜®L·}ºS\ĞmÙ¥G•˜>‚®¶¡™8J© \â\æÊ‚\ÊqoúN\ëÖ’ôª*G\ï\ßõL÷	‚ª4\Æ)\Òñ$EÕˆ ¨AªL·AjDP#‚Yñ\'Ue\ä:ömõ¯%½\İ\"h¼PşZ\"…úöu«\Ó6{\Ë\Ø-“$ˆ²4\n\àòF\ï\éº~lšşi\ÓKüğh=uŸµ%‘!U\ãrH\í\r\Ì\r™PŒ¨ò\ÍÖ¢óh4È¶V‹š”_\ëQ«û+­§¿«\Æíº\Ú·O°š$[‹\Ú\æXµ\0\É\"\Úl°3¨r\Ã\Òc\Ï\ĞqRÜ½´;¤Ü¾v\Ç\ÉşzywH>[\ÇIUùò:\îh|†“\nô¥u\Ü!yùµ;N\nÙ—\×q‡t\ê;®¢ô\åUVCú:=şKşµ¥¯Ñ±\Ó\Úù)\àã´º§=Ö¾\åQL‹üT\Éq£‹wÇ¥\Ñ\ÅõÎŒF7º¸^\Ç5º¸^\Ç5º¸\Ñ\Åõ:®\Ñ\Åõ:\îÿ£‹ùI_]·úw¶£w$ÿºº¸gšwv\Û>\ê#a\ë+]\áûLµß¨\âF7ª¸QÅ*®\×q*nTq½kTq½{Qª8j8)¾Ê‡6¤qÁ\È\Î\á’f\æ~3ñ\Ñ=fR\Ì\î4“?´\ÛLş)\ßN³<y@õ·)¢ »¹/´ô2\Õks++¡bj\ï\æ\ÎşÍ‹\n3ù.‰¸ü\0\0ÿÿ\0PK\0\0\0\0\0!\0°\Z\Ö|\0\0”\n\0\0\0\0\0word/fontTable.xmlÜ–]o\Ú0†\ï\'\í?D¹/ù @…ŠR\Ø&U½X;\í\Ú‡XóGd;¤ù÷;NB\rTD\Ó*m±€\äûµ\Ï\Ãk\Ãõ\Í3gÎ(M¥˜ºA\Ïw\"°\ÜP±º?VW#\×\Ñ‰\rbR©[\í\Ş\Ì>º.&‰F;0^\è	\ÇS75&›x\Æ)\áH÷dF$©82ğ¨¶G\êW]a\É3d\èš2jJ/ôı¡\ÛÈ¨KTd’PL\î$\Î9¦\Z\ï)\Â@Q\n\ÒL\ïÕŠK\Ô\n©6™’˜h\r5sV\ëqDÅ‹Lµ„8\ÅJj™˜Ó¬¨’‚\á_\İqö*0\è&¶†˜nºi\rF\èh\ÒMf°—\Ñ%\'Ï®\Ãñ\ä\ÛVH…\Ö”\0\Õ9•°}·“\Í\Zo8\ÅD ½K¾–¬ŠgHHMH\í›ºş\0Z\à[f±?„Ï»\íˆS¤4±\ZuÇ°\'ˆSV\î£Jr$\êDF\rN÷ñR\Ô.°Niº…D®\×>\è4—[G°üq$lõ\éGp¥3:}`N¯\ĞñD9\Ñ\Î)œ\ï\Õ\ÊO	¡\rı>ˆ\à\Â]tšH5ÓŸYÂš\Ã\åjõJd‘x4¸m¿G¤zjË‰,d®(Q–\É\Z1WT,¨\r.7DÂ‘\Ğg²¹œE\Ôÿ?\áü±\ç®>³SZW‡‚r#ÿ¡²@Œ®=c‰Ue\Û\"0G\Ø\Éº Zw\ß ó·¦£øC6\ÈW\Âv\ÄPŒ`‹\ä¤‚˜y€\Ü~\å%Ki\\~ƒ\ÎfXZó…‡l ßµïš¡	\İ\Ü\çğ«‚œ/\nş…\ÔşR•\Ö\áó\å›*\ç\ÍWv¹\å\ë\Zo»„µ\å{ºM\ÍY\ã[»ÿ§\Æonô\ì7\0\0\0ÿÿ\0PK\0\0\0\0\0!\0x2š\0\0/\0\0\0\0\0word/webSettings.xml”“\ÑN\ë0†\ï\Ä;T¹g\í\Ğ6 bCš	!ÄHSw‹H\â(\ÎV\Æ\Ó\ãvŒz\Ó8¿ó±[÷\êúİšd\r4º©2‘€SXj·˜Š×—\Û\Ó‘P”®”L\ÅH\\\ÏNş]\Õy\r\Åˆ‘OR\ÂG¹US±Œ\Ñ\çiJj	V\Ò\0=8NV¬Œ¼\r‹\Ô\Êğ¶ò§\n­—Q\Ú\è¸IÏ²l\":Lø«J+¸Aµ²\àb\ëO&¢£¥ö´£\Õ¡\ÕJP÷cÍ–g¥v_˜\á\èdµ\nHX\Å7\ÓUÔ¢\Ø>\Ì\ÚÈš=`\Üpv˜(]öcL:F\Ê\ÎA?\Ìx‡¡…w‘X•\ß/Y&ñ«I¸»¤7\Ï\æ²OH©\×Ô­I7µ_G£\ìbt>nó–››6·–†§O¤\Êóñ\0UÜ©Ù—ú¬\Ë_\äô\Ç\âcDûC\ç:\æeh¢¸÷8kÁúh\Î5—\nºX¡AG¹Š¸E˜ƒ\Êú9‹oõó†\Ã\ÎûX\Ó}\Ó\Ûp·¶\ß}\ÔVÀ-†yÀš ´·Ic°~z¼\Ûú~ó\Ù\'\0\0\0ÿÿ\0PK\0\0\0\0\0!\0\n§12\ê\0\0\ã\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œSÁ\Ó0½#ñ‘\ï[§\íÒ…\Êõ\nu…ö\0l¥fw\ÏÆ™´m\Ù\Ój\Ë?ñü“„8‘Ó›7“\çç™±¸}imq„˜Œw+6”¬\0§}m\Ün\Å«WoY‘P¹ZY\ï`\ÅNØ­|ıJl¢\Ñ@*HÂ¥\Û#†%\çI\ï¡UiBiG™\Æ\ÇV!…q\Ç}\Ó\rw^Zp\Ège¹\àğ‚\àj¨¯\Â(\È\Å\åÿW´öºó—ªS =)*hƒUòs÷§\Ô[ÁGVT•­Lrú\æ†c(6jI\Î€xö±NrQ^>@±Ş«¨4R\å|>[\â}\Öh…\Ô^ù\É\è\è“o°x\è=€\ày‰ {lA¢Á“,\ÏCñ\Ñ8r0#\"oQ\í¢\nû$o:ƒc$¶ZYXSd£lÁ\âT7Ş2Á#. \Ñ\Ç\"™o4\à+¾¨]\ãVì¨¢Q\ÙP6=¶!a”Õ\ïx°^ğ‘\éa^˜cs-§}\Ë\Â>\è]¾ôW´\Zºş\Ã\î4·\Û{\Ìfvrg\ç3şP]û6(G-\æ#¢M¡òwİ‚ü\ê\â%™Mş\Ù\à~”\îV\å\İl\ï@–[b¡¦¡c	qOWˆ¶;€şu;¨\Ï5\'º­z\ZŞ¬œ.&%}ı\Z9Ú…ñ1ÉŸ\0\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0Z}q\0\0\×\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0‘\Z·\ï\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ª\0\0_rels/.relsPK-\0\0\0\0\0\0!\0³¾‹\0\0¶\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ê\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0.òª\'\0\06¬\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0word/document.xmlPK-\0\n\0\0\0\0\0\0\0!\0¶§\Ë4—\0\0—\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Q\Z\0\0word/media/image1.gifPK-\0\0\0\0\0\0!\0·UBŠ,\0\0‘\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0r\æœF\ë\0\0´\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0z#\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0µ\ï ~¹\0\0\0!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0”(\0\0word/_rels/numbering.xml.relsPK-\0\0\0\0\0\0!\0’NH¢\0\0fy\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˆ)\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0˜ws\0\0\æ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R6\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0÷,_\É\0\0\ß@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ü8\0\0word/numbering.xmlPK-\0\0\0\0\0\0!\0°\Z\Ö|\0\0”\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0õ?\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0x2š\0\0/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¡B\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0\n§12\ê\0\0\ã\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0mD\0\0docProps/app.xmlPK\0\0\0\0\0\0\0\0G\0\0\0\0');
/*!40000 ALTER TABLE `documentoactasproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentoadendascambioproyectos`
--

DROP TABLE IF EXISTS `documentoadendascambioproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentoadendascambioproyectos` (
  `idAdenda` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idAdenda`),
  CONSTRAINT `documentoadendascambioproyectos_adendas_idadenda` FOREIGN KEY (`idAdenda`) REFERENCES `adendascambioproyectos` (`idAdenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentoadendascambioproyectos`
--

LOCK TABLES `documentoadendascambioproyectos` WRITE;
/*!40000 ALTER TABLE `documentoadendascambioproyectos` DISABLE KEYS */;
INSERT INTO `documentoadendascambioproyectos` VALUES (1,'20264562_1739789179654250_7471240034847116774_n.jpg','image/jpeg','ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\í\0œPhotoshop 3.0\08BIM\0\0\0\0\0€g\0GEOGtpuoN04_KuSTAVRD(\0bFBMD01000ac0030000bf2900002d60000019660000f56b00002a96000061e70000f9ef0000dbf900005f0401009b960100ÿ\âICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0\Ì\0\0\0@gTRC\0\0\Ì\0\0\0@bTRC\0\0\Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïcurv\0\0\0\0\0\0\0\Z\0\0\0\Ë\Éc’kö?Q4!ñ)2;’FQw]\íkpz‰±š|¬i¿}\Ó\Ã\é0ÿÿÿ\Û\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9ÿ\Û\0C\n\n\n9& &99999999999999999999999999999999999999999999999999ÿ\Â\0 \0\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0\0\î\0\0\0\0“X\01¶@\Èa´\æ\ÎmNqNˆÉ¤tdfÙ“¢Js{\Ã/@\Ê\ÕdˆÍ°hãºj,™(kœ\æ±t9ó 3¢5ŒºFf\Æk\"4r\é¬e\Ğ:2¾)\Ñ\çF~aÑ™•M\Ó*±¼s›%–\àZ6\ë%ƒ/P\Ü\ã£+S5Lj§FfH_3$/œ\æÁlg>te\à\0\0\0\0\0\0\0y\è~`z~LÙ…\êœ=\Ã¤g2z\Ï\Øñ\Â\ç;«<ó©åºƒ3g\Z©£…\Üd—±³´N’\êyrÛ›¬cu¼5ó\Õ8{†H\Îdõ?®\ä\Ç\à\èq\ça\Ò`¡A¬ys«\å:¡\Şo\éœy¯\ÏW°>hf6ü\ë\Ñ1½×°ÆŠ°\Æ\ØÊ¤_\Ç\í8³¢\í8¾\È\ãóô3Î›‚\ï1Kö8\ïF8>û\Ş8\í¬XÌ­K&g y?¬5\ê9…¤\Ü\Ã\"¿Bù§\Äv\ÔJZœ?px¦†\ÎF™\ÌúWšúPğ\0\0\0\0\0\0\0\Ã\Ü[\Z@f\éRkJ\èD÷\Z\í†u\ÉC>µºä—¤^\Èghši›¤M\×0\×l‰¼\á\Ò=`\Ü]À¢\ÍÎ©¸\ïºWº\Ú g\\”3ª\í†Ó‚•\rÀÏ«´\×d\n)|#©|3oHº@Q³(f;D2\ë\î|¶\Ã:ZwıK\0\Ì=ğ§p\0\0\0\0\0\0\0\0\07ôD©³\É[\"NóŒ4+·<·\ßyWªœ|O\Ç)zOŸö\Ç\'\Ğqv—®\ä\ßCŸ\è[\'.\Ò<û¹\â\Í;¸\Ä\Øù°‘ÀvüIb\î^‰\Ûc\ìc¯E\Îu§%¬\ìs\Òø\îÅ§+KÔ‰|\Ë\Ó|\Ä}ú\×N“\ê91È•ÎWr%ş\Ó\Í=(\à:œY\çÍ½\'\Ï\è78B–¦N\Ù\Ù\ækñ†N®\î‘\ÉgÁ\è\ç\r^\Ú\ç:±˜T+Ÿ\Åv¼I\Ø\êñb¯}\çæœµh’ú—zˆ\0\0\0\0\0\0\0\0\0\0q} p\İ]\à\à4z\àÂ¿x8\Î\Ì\r[A\Î\Ç\ÓvON\Ş\'~¶-7T9«¡G¦nş¨sX€FL±\Ô¯\Ô½°\0¯T\Êõ@T¶³Ó‡+«ª\ÒtÁ™—Ó‡­Ó\ÆöAÁu\×Ã„Nğ\"\ÈpWºğ\Å\æ=9ú½Pegô¡\Ì\é\é‡+\èa\Ãô\ÚA\çúıHs»ƒŒ\ìÀ\0\0\0\0\0T\íÇª9U:“–¤\å–:ƒ—+¨9r:ƒ—S§9€\é\Î`:s˜œ\æ§9\\\Ù{\ÃÎ™zA\æ–\ìôŒµ¬õ\'21Ì‡Ls!\Ó\Èt\Ç2\Å\êNfn]:\éN%+·8\Ë\'Ts–\å\Ø+\ZÍ’°Y+\Ù+…‚¸X 	\Èr˜„&!	ˆBb˜„& \Ë6Ê“‘„„bH000000009…_”PP,rù\ÔU!“\Ë\élô\ì\ÍL·f\Îñ§³Ÿ¾z›GYÛ°¹ \n\"F\ä\å\ÖÎ¥M.\â\çw33q\ät½1fvX\Íså¶±ˆo\n\"€\0ª *µ@E@p€¢ˆ\n\0…V¬\î\î\×/:w–|ª\á\ê†\î²ñQDDDDˆ§6)\éó\"€ˆ \0@H(\0J\0ˆœ·Uœ\ë÷¥ò{3º*÷±\Ù+f›‡µ\Ï\ÙP\ÙõøS·TQ£,E\Ï\ŞY\ÏóŞµÇ’]§¡\ÓZŠ\Şu4\è\å¬!¼(\0¨B (¨ \0\0(€¢*\n\ÕPDQ9\íş>9–±³Va,#£\'\ê¸ûÇ¨É‘­¼( \n *\0*ˆ\n sÂü\à\0(¨ €-¨)\0\0\n  \0…;\ã¤s\Ç\'‹\è\È\×™P¼\Â%ƒG3C\Ñ\ây^¼o™±\çz\Ì\Ènu\ÑY«5\Ï\å\Ş\Ğ\ç\Û›\Ù;¨\ã/t\á\İ^‚\à±\ÉQAY\0¥‘\ÃUTEA\Än¬QÈ¨\0\n\0¼¿Q‘ka:}®Ze\Î~N™7Ë˜¯\è\Ük:·\r\Üõ\à¢(€¢ˆ\n (€ †¸ŠŠ\0€\0\0‚\n\0(\ØgoŸ\Ù^V;\Ï\é”&\ÔÏ­§O©¡I+Y-ò\çg…Óœ\Ê\Çg¥º­^¦­œŞ™Y™//Nn]¾oŞ©¬wW3tzqfuœòø\Óyp\Ğr°‡ŒŒ#C&÷\'=\ÏU73\Ò\Ê\åh®V(\áª9£\ÓÌ¶\î\åñõ\é]\Ênzk¥l£¬†\Ôn–6¯_4¨†ù(‚¸h9\0QDA\ÃT\Â\":ò”ˆ&\"	V%\"	H‚R$\' d¶ŠQ\çZ+›)z8\İ4¨ò{Ÿ,k,,¯wD\Ì\Ò\Ì/±ğkd—¡™’;4ùtF×ƒS¤«+x–ş}œ÷³N\Ì0±\Î\Å\×\ÑÀ\Ô\ïâ†œ°\\\İ1hu\ç\Õa¨g0\Õ2_.¡\Z\æCUÊŒÈ–w¤}?=:\í.\"¦Ùˆ†\êó¶e\Ù\\T³*Zóğ÷h@\Ü\Üt\ëh\Ñm\Îó2ov¹¾ÒŠõó\İZ*\\ZAu*)lªŠÁd¬§>´WX\Ñmd–\Ú\ÑK4\n‰©p¢±ui\İJoX£²\Ï\'¶$‘¨\Ò,û5\í\ä\íú|Å„w›\Ö\á3\ìºM#ÌºTô§g_,ñ\ÇWŸ{µ\ân7j\Ù\ë¡ªõó\\}D\å\ë¿G6ö$è–©euñ\î$oØ§:ñ\×G(2Dr°Ìˆ¯bÆ‘\"’DTPjK€\äDU\\\êúYü}qCw7Ÿ]üÛ–¬\Í\ÚÌŸº™\Ñz<z©úqQÑV8jŠ Š\r0O?¡\Ä&uiµ‡[‡µm8ôQ(Ù¸É¸\êÙ«\çõ$3\Çq^¶¬\Û\Å“N\×^|\Ü\Ñ\Øóú£G2i_i!’M`­\Ñ7\Ñ\ä\är»<¼t\ÂKuñ\ÖÄ¹ñ¦\í\ÌÛ8\Ç,•ñ\Ù\Ía\Ã\Õb\Åf\\\Ğ\Êt~¯\nH\ÙÙ½‰¾R,HLE$ªF£\ÄÆª\n\å#r(¨Ö¤\é•\Ë‰¨®Ç½‡Xu\\=šº|\ë\å¿N¦]\Ã\è\\§\ß\Ï_Ÿ}\ÏMs•:³V\Ë.k\äk%AD+\0jy}m\Zw76¹^\Ãx®L·ÙÔ±¾\Â\Ë\r;\ìZ\×4¯\ÍgZ°›\ÃH\ì™QLú»8Ü»:)Wª2\Ë\Ä\ÙC¿•°Ù‚\âf¹™Ú­8z~^k–WGÃ­œºw\ã\î4\ë\Ñó\ãeHÜ›\æ\è\Û:\ç\Â\İò‘IS$\nŠ³«\\=ˆ\èQŠ=\0p\Ä{EX˜\\Jõ—C7-«\Ñù\ÕÉ«3.²S¤b\ëˆ•\0Zs¢BU®ó²›×¼\ì,£j\ÚB%\ä\â¹—\×N	Y\Ó\r#“Y»c*K65p\æ\Îû8Yz-¬»	\Zş¼\ĞPceœ\n\ÖH\ÆY¡\å\é]H\ìt\â1XsUFµ\Å,rG ­bò¸›8|º\Ãğö\âõ­\Ğk±¯h\ß*n\åYH\Ññ\Ør×’\Z­	°\ÈÜ„°\ÅSÀ“\nG\ZX\âúş&mÑ¹“l‘’\Ä\n\æ\ĞÍ¶X…Jr Šˆ\Õk\Ù$M,/²m\Îz\íš\í|®k–i%ÀÏ†×“ß•}%Ô£^z½9\ZÙ›’=X\ìtL=\ÎXô*|\×u¬\ë>7k* 8jŠ\×(\ÅsFÕ·²#¤±ª¨5 \äQ#’;±†3\ÛğÒ¢;Yƒ	mÓŸ=©=\×šV¯^1\Ë	£’Bœ³>+Au•\r¸P´Td[’¬Fœu\Z·¢‰\Ã\ØùŠ<‡O\Ë\ÍÏ›¥j\ÄcdMYº,\ÙÄ›z‘ï‹‘¤=\Èğz õagKo›Ø¸˜†\ÂB\ËHb\Í\äúõe‹|\â»=²µ¶.k\Ú\á‘b¿NrzŸ\è\Z\ÃÁƒ\ÕUG\äQ@#r<\0TT¼Ô‰,d>w\èÜ•œ\Ìğ\ËN|rB2X\ÄEh­|GB,İ¸@ø\ÙJ\êXš°·R«‹#\Z“8…QƒÚ®²½¸h¥L¬\ë.˜g­™#uª\Ç*J\ÇS\Ñ@•¯B•„–\'¤\ËZrik©l¨ú³·\Ï\ßg l\ËqQò8ÀòûiXclĞ«`šEV­\\\\}ó±\è\\ô\İ]{\Z\Ã\ÄI\Z\0PTQ®E\0\0Z\r•ˆl0¯\r\ÈO)±\Z\Ø÷µAcBj\Ò\Æu\n\ä\ë\ÆG5ğÇµ£\Øú\Õ-e²=Ğ¬¶Y©v\n‹W§\Í|ZJ²’r­­:5‹:´ú©b–{Q¥–\×iuÔ´Š\ÕúlÉªQ$÷5	ÃªIY-lGMoœØ¼\ìº	S›½\Ï\éùıv¨İ¡.\åv®jÑŸ7Q9:sNß‹ôß‘¯±c{p\Ù*(\0\"*C„ZDsÑ¨4„…¥r²Z\çœ\çôÜšhQN\åJˆnŠ\ê ¼8\çKf–\ÆXº\Ã(\Ç\ÄÄ±6kMS2Êº9¤J1\İiT½ƒ5š6\Ö:\ÅZóJO×›;\È~\Şü\×%6ôx\é…[³œó\Äô\Ê÷œ™[\å{R-J)v!\Z\Ô\î`9ñvp:\Í;™\ã¥#\ã\é\Öd\Õ9õeºv\îc¨úúˆ#®]\ëo\Ş.ª\ÑTº”#²ó uNƒs\n\0@ \Ğ¢\r†HFC>w\ÔIŠü\ëZ½Dó^¿\Ş4Q²\\EYY \ÕATµ†”}8İ“>B\ìQ¶Ÿ\Ğ|\ÔKNò”Ÿa\åg¾1\ã$\"£§¸2D¼û:\Õ+Y\×m(øúåµ›yd–H\â;Nˆ\ÔZŠ–¸³š\×<¤®4\Ä,,5­>8‘¬°X\é¨\Ø\×29«\Üó\Ò2ÏŸ\×z¼’s\İi§­dyW[¼Ò²\ÛF¯EŸ\\\Å%«—³šo\èP¿\Û\Î\éa–\åTX)@„@” µĞ•²5ò&ôe\Ê\Ô\ã\İ\èæ”¼ó\Ñø=ó%«?N5ctv*¢Ò |z1o•ı8\îsFÙ\ëA«8#\âibJ\ÓB\Ç;ml\Ç%®‹#=)½‰ô\ÓsiÏ¿I{ˆ\Ğ]­N\Îu¿ñ\Óiù—W,Nœ\\;ù”B	c’˜–\î%N#X´–^™¦„c\ßtš¨û	r¢ˆ\å,	.ƒóˆ”…¶KRR\è[©dªU¢²%…®…´¬\Ò\áMÅ”¬Ú´µT¹6R®\ãs,gRÚ‚\Æt$\âÖ¥¬&2\ì!¶V\"\í	Šmi!Ÿ£[³m¡Y¶\Ò*hA©Yuö(,	ad¨—ª–Ô¨[*±hŒ³P\\¥\Õ#(\ÕZÈ³jñ˜hT\á\Õ[1w&:k†Qª¦R\êk´³WDL\ëE`ğ\Îj§N`¨\nÒ”h8iDF¥8\Ô+Tz52r\"\èŠ\× \É,K\É_)È•„‰ôôG¹SKóR^‚Nve\Ü2…\Õ3/K(\n\0f1‰\Î*\0Š\ÒÏ»O\Î\Ó\ËQr…E¦-t0ò«º‡Ša\ß\Í\ç\Ökº^:\Ôt—¹\í\Èp ®i\næ‚‚€\0+©¤¨Â:Bš\å-\ÂsQ\ÔyR©+¤ŒG\Ódca\íš¨°ò%\ÊV\"T–¥U³^¦zKB4š{Un7\ÎE®û™–5Î‰\Õ*\ÄØ•b£\ÛB±6»§‚²ô\ÆuŠœ¨\0\" \Êvª\ÖV¶H*.B¢\Ñ\ÔNV\ë\ÚÂœ#\á«+Ysk›š=\ZÇ›uq¾2Iw•\ß)Mz­­¬\rU\0\0¹¥E¼”GCUPT\ĞG\Ç5´\á­4r=ñ\ÅÃ¶\n9\\û\íCFI\Òå¼¨+£›•×¼ô\ëJº\çY\î^¾f9’5\ÑSš\Ç\ê6D!\ÈĞ™aIetIHÚº@ch¢*\0 Y­=^\Ë\Õ\Ì#T\\•P§fiT®\n	\â\Õn\Å“kØ™yõ†;j¹Y½5Mc˜72úrY¦–Î¶şn–suE\Ú8\æi \0\0\0\0\0\0s*\×\ŞND)X\ÃG£Rœødc‰¦H |„(óŸh\Ù>/NZİ±\Ò6‚Á¥È£¤—2}\Z3#–7õò9!]bFUT!ª-0\Ù+\ÑF©Z¨©\Ï`\n\"‚\0$\ÑIZ9\ÚYöWT\\\Õ\0‡c­VŞ~~…V.k”U ™,¯£›¬]’=\rò\ßp³Uu\Z\ä\0\0\0\0\0\0\Ìnm\ä\è\æR´\Ïh1\ÊF’¸„•£Uª9! \êhÛ\Ü\Å\Øg?N%—Å­G•–\ÌhÅ·nüGF†¸\n\Öú<\Ïb…ˆF\å:D±\"± –’\Æ2%uya\Î]Tl@\Zö†µ+\Ôô¤\árE$±„\ÙmOœ¦;0mY\ÑğW}—\'£ucª£.\Öù6YYy\n‹%\Ç1û¨\0 P\0\0\0\0\0\Ì+—9Œ‘RtÔ…e’THaµ\Ña‰#hcÁ¢<]°Õ«6=NÎºÉ§Ô´ú“F–„\á\"o„	`¨f\Ò\nØ¶#Ô\\¤K+¢6YdB³EJ\è\İœº \n \äj½\ÄQ[¦»u-\×Úƒ\Ù.dsÁb\Éõ\Ü\Ä\ê\Ù\èhs\íy‘ª%\Ú\ê\İ-&D{5iÚ™\Ú\ÚÆ–^®¹\í*;<¬\É*\n” \0\0\0\0\0\0(”¢†ƒ•…9Z¢ˆ¢*(9«D«\éÌµb:\åoÕ±©\ËYu=®\ëñ\ï¦\Ìú:Å»\Ø\ì\ë\çí´¼\çS7±µşV\ÛX¤·=šks”º©nT[e¦©&[5›Y\í\Ò\"¬\ÓGG@ «nª\ìÆ®\ér¦d¸Y‚z“g5r\äjòõ65ª±G«nÍ1©‘k96¶yı\Íb\í[\×%Tvq<±KÒˆ©J\0\0\0\0\0\0\0rzyôˆ\å‘‹#UÍ”UI^ƒG7;KŸõ@Á\Øô\çRµ¬ıKw0e-s—qù\ê\ìU\İ\Ïl{µÙ¸®k’N“—$\ï\È\çğé£’Ršô-zÄ¤„hZš‚5¨f¢¨\î\ØEGR9…DY­¨­¿={[¹rE6d\Ã*IN\ÕJ£R\Şw/IZhgJ6+Ã¬iMJr\Şm;õ{w#R/¼5Às\\“MÛ¢*R€\0\0\0\0\0\0¨\Çùö‘=\Ğ\×	H\\Àc¡\Ìs†<jV\å·ó}Ü±º]-Y¹E«q\êf\ãDr35£X Yˆ#×¯\ÑÁ\İğ\Õ1\\4ZX£AUE@\0­\'\Ç\'¦5\ìu1\Ít*	°øJ±s\ì\Ø\r\Ëj75{¬bK5\ìsúX\ív49öb\Ø)¶*ZYii\Æ\Ì\Ú\ã\ëŸb\ÎC{\\tœ‰&†m„Tµ@\0\0\0\0\0\0.h]Ë­\È\Øş8cÚš\Ó²R\\A&cZw”1fo³•Mş{n5£t=$5œ\Ì\Ø!¤ì˜4»Ef¯Tk†¹®M“Š\í|ú§\r8jSœ\ÂZ£\Zˆ\ê\Zöš’µŞq½’ªE¤¹”y«zœ\nhH‘!3b@4FË­g÷>Ú²\ç7;Ó·ƒl\è¤ZÆ!§G·¹\âYzmN*\ÚzjY\Ù%ò¨\n\0\0\0\0\0\0q.Ë´¶ WB¼¹\Ã:\×Ş¬,o\Ì{U-n~\'~us£Nu·0u—J•©:g:µªyE4e“\Ã\r\0Epˆ\ä‚Y_\Ùñw;qñ/\r¸5\ÅW\r‘\ÌXÇˆ¶£‘‹\Ô\ÕÏ³ß‹¥†t¯F÷1Yt_«ª\n¨¨€  ‚ˆ¢5È®±T\Í\Ñvd\ËqY\Ş.Ö–½\ÍF½¹Ü“C-–\'‚K4u9ùS¸·\Ëu9\Ğ€\0\0\0\0qÛ©Ç³Ÿ^\ãU¦\'±c±˜%¶h\á4^g¦\ä;q†3yS/¦¨¬\ìeö\Ã!B\"‚\ÅYj\Å#1PH\äŠ\"¼ò¯]\Éu¼õyœz9\è\ä\\²ÄŠ\Í¯d9+N:h–\ÕW2\â}®[C¦kñoƒys\ZB*(\Ğ\0‚‚\n\rQ£‘A\È2\Ëšx¥Ô’¼\Ù\Ò\É¬¹+d\ÖU’i÷>\ÜMXh\0\0\0\0\Ï\ÓO/\\ù[®®ÖÒ²x˜Y’q\ç§¯½Y\äz	º¸¸mS\ëÁ{[¶éš±¾¯\\PeŠœ\ê\ÒX³^\É+\0QP‰â”²ŒñII\Ú\á\îò\è\âFó\Ø\ÉYœµ\ÍMl•©bµ	Š¤3\nNÉ¢éŒ¼h`\ŞX5,TT´dP)D\Â\n€Š\r$Št„z\İ]lz\"ª8l‹!bHX–%„\Ğ\è0n\êuk\Ë\ïòİ¥¨™·V‚V‰š±¤gñøúA°÷\ëˆ-$õá¶­H“#\Ë\ÛÌ©\Æurz5\Ïux6}i\é>‰FJœ\ê ’ª€Bˆ£\åö3L\é8õSI?ZŠf¤N%F¤Â²\ÂEI\ßª6\Ä\Í\îjŒ^p \İEb¤8c”s‚¢\Ğ\0‚€\0¢(\" \Écx\n‚ª•¡5ª:1m7R\ÓH÷¦š\ËúNN]öGÌ´\ìE„eŠ.¡\Ë-C‡I)\Ş~õE5™¤QÙ…Jö e\Ër¾tª\Ô\Ï7T°oYõt#õùñ]¦Fy¸	½$¼\é·’k=q—m\æ›+e~—+†\àƒW3=Qd§šH	\Øõµ‘\Ùu”%|rJ­­kÙšNsûñ¬\ËaM-¢\ÔY\ÜVu¦fJ&œu@\Ò\ÕÑ’2\'.Z_²¸²\\n¥T\èS;\çÍ¢1—bÎšhÔ¦c½ù*µdª]ZÖ‹±\Ñ:=ş\n\Öu×§>…~rs^|;\ä5om¸l\Ê÷=lTAbd\éeª\ÕLY\Ø\çu\ÌD‡\\1\Ä):\æ?:\Ó\\Z¸½üİœ\ëf<wo:QP²\ìµMys\îi2\×rÚ\Ìå©¡–>z¸\Ö\İ\é3Ù³¹kb¤²\İSB­’Ú£’8\ï/<dÃ¸ü\Îb\îâ˜—\îÑ«¤ŞbN®MıY\ÎKĞ²¹§n\â\Ù3jĞº¸±Ï¸ƒ\à\'\ĞÉ­Ï§@œÖ†ww:\Ô1ZzVzr•®ó‘“Eˆ\Ø\æ…X	š­\Z\åkUU³Á:¹Ö®\ë7•®\Æâ½˜E£\İ\Ä\É«!³Cr…Ø”‹#M<J\ÊN\ÖB[vs‹‰Eå‚³	 \ZN@È³s0³¢\Ø\âµ7:8X¥¯\Ëv-\âhú3yj\Ësfj\Î\Íu\î\ÍÃ‡¡‹Ç–\İioE1Ãœs\Æı\Ç5\"\İrE\ÜHI™\ä‰ù:&r}fö-#¼|C³·Jj´6)f\Øm6—šK\n:,\ËJJš	’Ä‚õ]\åöó%‹U§—*K#1\Z=“R\ÔH‰Ö¾\Ì\Î\í™#c7G\'›¼6jZ‡µ\ÉHªU§©§‚s8J²æ¶¦Š>o÷Sk=9\Ë;,\Îğ\"\è9İ•Ms\áb\é²\îr\ÕY®o|A\Ù\\\å·õT%vy½<œ\Édnz\ÏE’\ë?\ZL\İh\êE.\r\ì³\ÏÓ¢±\ÍÛ“f:²\ê5\è\ÙeSIat”¹\Ïf z2¤cĞ«w7‰bTV\éMg¯Cz^Eı“\Î=:z78“\ÅÎµX­\ØW³£$®¶]eu„k\ÛÈ­{ˆu2µv‘ñ·®‘‹«,2ùûÁf­‘\ãA\ÃA@	\ã—mš\Ôú¶X»]‡7\Òãº¤ dìš¯\rˆ3b­f¾Uâ™aS\Ş\Ê\ï\Ã>;o\î‹z!e‘j­‘+”¯e²\ï7Qç£•x.E-H\ìÇ‹’\ÕoŸ¼„K:Xº¨\É\"Iš\×Ó\Ôg\Å?F£Yš\èK\î­k\Z£\ë\r\ì0:lu»\"+md‘«QÍ¹\Î\âıŸg”X¥¼\í¾\ŞA\rFÙ¨ø²\Õ^q‰bK°\Ù\è’\'Á¼½©¹,Rğ\ï^\Õ[B€€\nŠŠ$rD6\Äğz®pk¦°\Ö\Ö\æ~†;½öF\×\Ç+Xôj8¤‡2œW+óg\ãmbt\çQc\Ñ\ë\Çru3QP\0pˆ,°\å\êtsWº\ã¥~=\İGÀ\æ&3›»˜0u\Ü\ë‡DÖ²fÃ£ŸF\ç\ßÀ\ÖrØ¬\ï\Î\ÍkÚ]{Z[ºy\\¦\ÍÅ®I±ªÑ‘ˆ\Ú÷a¹\á3ú¾a‚{n\rV\ëœOd²\Ü|IŒ¶H\Ö\'µR\ßh‘\ÈjQ|°f\î\Í¼zÁfµ \Ñaªö†h`ƒ#]+’\é©õ¹\í3‡N”\é\íP!·•vY\Ú\ìõ(k¹35,$£¤\É0ôtc\íÀA$PJP$\0T\Ä\ÛÇ³\ny,\Öd®Dš\Öckm·s¹õtd:\Ì\Ú\Ù\Z\éª\"µŠ!\Öq½9±:a°\ËC»‡\İsô­—hcT™¢\İr\Íu\ÈZ\æ_u˜\ëJ‘~\æi\Õ;™·sg\ë9ûj¹‹:\Â×··’ –j\Ë&d\Ìm’<[\Ö\ë\Ù\ï„k\ÛdpØŠ]yb—XlÖ²*¡¢ˆ\ĞC\æ†a\\\ÙVM\í.^§Ef:\Ì\ÍŞ­\Öü\Z¹Õs£\ç,Ó§j[9ú›\Ö3q®L\ÜÉ²uùŞ˜\Ñ}×š¢¥Êˆ²(\Ü=Ì2\îÁt\Î[S\×Ù§JxytŠ´´õ=\ËQ\Ø+¼¹\\•W\éù\á\ŞR)Y›/m\Â÷œ½\Ó\È\ÙÆ‘kŒq\Ï\n\æCw/=£\ÏØg>=¤0\'}´‡/o#|±Ş‹×ˆ‚\Õi\Z\ÌkQ¹ö™‘\Ê\Ì\ËóF\îùsX±–”\ĞMÏ´v+Z…T~\ã\Í‚Ö’)fš)Q\ÓA+S]¯c—®Êµû\åE–³±\Úk¹:\×,\Å\Û\ÃÍ¥»\Í\Ú\Í\ÛmŠ{Q‰\"\Ä\Ó\çz\İò†\ìR° \\¨Š\0	…½‹¬Ğ²\ËI\ÎTl‘K¹r8\Û\Ëo\ÍÔ­ExuıõÉ¤\ê¯\Ô\Â\Å\Ó\Í\ë\Î$rj5IizO›uœ»t·ª\Ü\ÏV¢­\Ìq\È\Èei3\æ\à}-y«°-{œ;µ\ïJ\ÌƒŸ\Ö1\Ú\Ô\ß5 „²Ù£+:qbòJ³’¬·Û•½4°;[4-\Ë*Ö‚\ÍV#7“\n\ç9\Ïw¬d;.ª\ç\'\ÔjX}K[—\å^\Ùæ®º\Ä\\®\ç/½5Û\éÎ¿/½‰™\ĞÈœ\çL\ìM½±\"#\Îv\æ¥c§8˜¨\ÂXª‹\0„{˜[•*\ã­J\İòd±\è\Ü\ä²x³¸dR\ÔÔ›.ş—|\î›‹\ÎS±_\ÑÁŒ’*V¶<«ô<\çKÛš™\êá¤­‰\ÑEl=L\\İ‡Æ¶ÁJ\Ì\×\Ò\Í\ĞSŸ\Ú\æµÆ³\\y69\"Îœ\èÔ‘ƒ’åš–XµRWô\Îu—\Ï5µZkRLn;Œ›&W¶,i*õN‚¦u–i™\ÖwK‹\Ğt\ç^ü2k6µ¹Îƒ—¦\Û]`\ç\î\âc]U~+¦\ß7\æ\ï\Ô\Îù¨Œ©:mø,\×+^\Å|MI ^Ü•Z³\n‚Rˆ°ª‰*\áicnz^\ìªóG\×\ÈÇ¶}s„y\ÔrE%’IÅ—Ö³]¾«µ\ïÂ‘~”2nu>½)u;\Ô\Ê\Ó\á\èd\ÒBE-,-K†=»Ì¨°/\É3=‰)KSœ»C¯EK‘\çC™5…\ÌZ,\ÅÖ«÷\ÌzÅ¥-L\ëR\ÊF¼º]š¼Š\çF²¶dm\Õ\Ë\\ô\Ól\r\å\ÓB÷?±\éó\Ùk\Å\ÔÂ;gV“=\Îo¢È‡İ²\İ\Ã=`\Î\èBbv¹ódo8¤3\ã7ó™S¯ô­\æ9X\áQ¨µhX¨\êùj&:F\Ö|¤‘OexŸfXu5“¿,Ë5,@±¢1,j\Ê\Ùb’7Kvj\Ókz\î&\Æzv‰Z~>†Ab´T¶\çTT¯T»ª÷,\ÂaI®(Ç³¦Z\×6YwIŸ<sZŠ©©\Õ0\ÒGEyÎŒn\Ë<\n+\â\×‰R\×n\\*Ö’j\Åi¤jH¥Vj[cu8³\ì\Ù%I\á®\ÃOÏ»n~‹±H³R¬¦¦=mŠ¸\é‡j\Æveşq±0«…	:ñ\Ñ\ÑÀy¼d\Ï-õ¯4(\"\ä\Ñ\Õnw‘`’\å\ÑlV\ÍË±Qzó»«û\Ë\İN\Ï~0g\êecSµY+#zB\"¶Q®kPdZ¬÷2´K$\êø\Æó\ë\ßG“{—w¾µb\ä9³¯›N°F²u\ç¨\ÕL[·\é\ì±\Ë\É\ÚÔ‚³Yl\ÙÆ¬s²\Û2j\Ór\ä\Ô\ï‰üºŞ«b‘M—$*\ÚsuFŠˆ€‚\Ì\ÇR\"¶«\\­5\èVx¿ôZµ²Ô§›>bG9\È\ØjÜ¼U\ß1\í[‚\n\"–4\í\á¿6\å¬\éq\Ö\ä-ƒ\Z°ú\ÂRX\İ\è\ã\Ñ2S\Ñ\çŒbÔ™·©\æ¢›\\‚#’V#Ú±\Ç,2¾z²¥¥b\ê$SG\íb¦ztQW¡Ù‚Œ—¢I¼V‘l\×t¶g¶õ\ê\Æ\ÖWG—%s¥u\ß+\æ±\Ê\ZM\rªyšM™‹ŸGB\r\çZ-d\áÚ•\r{rf+:dA…j´”™4F¹•mA+®\ç¾^\æC¨\Çj™»üš$Ic\\¡™K–±\Ík @’Æ¸)DHs\ãR\ÄL~t·j\Í\Ï\Ó=|¾œ:G{<qQ½•_‹>ô¬VKŠ€\0\Ôz+ µµ\äj\Ë<µg¹s\\‰s1i\ËZl\îG#{b8uU±Yòõòcnrõ\ÇS:^k_%Š;y—õ\Å*[­\Z,m„‹#¢\ç6\ë\Ó2^ \È\Ğ\Î\ï™Ú­\ÖU®h\ĞHVªğ\ÏJ‚RB1\É-[:$k£¨\æ,h\á\"4Z°²6J†he¤¡¡NT!\Ó\ÕV¯\æÚ©#\Ğõyi\çX§\Ïl(ó»wsu5š¬–4Aö­f\Íu\"±j\ÉŒ­[eEi\ÙT.è–2K@@RKùÎš\èªR›\Ï\ê‡\İóØµLE\Ûe‹t\Ö,\ãh\çntğú5\çúI^v\ßF:OF+ÍI#\Í\Ó\ÒC\Î\è\çiè¥r/œ§£‘\ælôğóVzhy¬¾Šp\ßI5=(<\ÌôÀó5ô°óuôpóGú@yºzHyªzXy£½$<\İ=$<\ÕŞw¥‡%hov\ÏG3|\â/L6½İ‡\Ï@,ó\åô\0óôô|ù=“Î¢ô¡|\Ñ}(_5w¤	\æô\Ñ|\Å=<<\Ñ}(<\Éş”\'œ/£ˆ\'œ¯¢‹\çnô ó»=Ùysı8¯=OC$ó“ÑƒÏ£ôPó\è}\Ô\0š\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0aJµ0`\ë\ã\ï_\ÂöxôNzƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ì®O‘\Ì\ßN‹6‚wÕ‰i›»¼\Şÿ\0‡ËŸ\ån}H\ä\é\ê+Y\Ïj	³Ë”\Í²Ø _£;tLz7Œ\Íq\à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\ãyu;¿x´¶ú¾»\çµ\ï.|\Ğ\å\ìÖ“\Ï\í\èi\ã\Ó\Ç\Ñ\ìùyw{/+\éûğ\ì\è\Üw.\Ùò\\\n\Ğhf\\\Í\Ó\Û\Òf‹ƒ#Q\à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ìªğ=W	\ä\ìşŸ\'\Ğ}\ŞÉ”\'\Í\0\0\0œ\ßOO|\Î}~Ñ¾\ï{†\îo@\Çp\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\05\0\0\0\0!1 \"023A#4@B$5P`%6pCÿ\Ú\0\0\0ÿ\0¤´‡ø\Zjø*e\Ú=JšJ…U¨\ÓÒºŸS¥Ê®®*FjE4r\Ç\çTiº\Å#W_#ÆµF¡•“2§T¥§}6¡MRd‘±1\Ú\Õ 4õ1T¶®¾\ZG1Áí¾	*Tz•4•\n«Q§¥u>©K;¶—X¤ÔµôõJ®ª:FC+f‰õğ6ª¯P‚’O:£Tµ1\ÕF¥\Õ\é#}5lIõğ6ª®¾\ZGy\Õ\Z†¶©\é+\à«uLñ\ÓEIW[N³H\r6£MP\êºøi5ª5\Ñ\Î\ÇkwQ\íWW#|\êRWCVj5ZXK_OTeÕ©b“Î¨\Õ<ì©‹XŒ‡L‚iª\ë\"¤\Ê\É\â5Ğ¶­U\Ö\ÃF¼\êA<u¾	*ju*zi|\êx\è|%%\\Um«®†\Ô\ÕGMQ¨*\"¨kœ\×\ë4u-\\C\æ\Ğ?\Ü§Q\á¨úCOM0E©\ÒÅ¦OR¾¤ü0\ĞĞ»Oú}\Î\ËM4ô\ŞS4\ßRUSG¦ˆ>œ/To‚ôø4÷Tk2>£Pf‘F\Ø\Èv—ª}Iù´Š·R\ÍCşı©\ÔxjN„\ÓSL* ydZ¥,Zdõ\ê\Z‡2-?I€Sê´‚†]f^¾›¥ÿ\0·\Ôÿ\0ô?Pÿ\0_\Ô\ÑU!l¡Î¤Ó¤£b\Ó ¢kªú©?0“F¶0\r*\Ò@\íJ±Ú„ŸMş\"gªÕ¢‚š§\ê—\ËG¦ø¦Ëº´Æ˜V\Ç\äòÈ¾¤ü4\ï\ÒzM¦0Ğ¾)´\è4ó=fJc\Ğ\é ªPC\ÎªjOTeÔ¿f•X\ê)¥ÿ\0\è—\Ô\ËÁ\é¾\é\Ò|]ûö³šõ4U¨²&h\ÔS\ËG&¿+f\Zÿ\0û~Ÿ§R\ÏBö»IÔ¾¡\ÆJ}\"™‘WBtºÖœ›ò\éU1\Ò\Ö3V£{µ©SZı?Rt?OTq&¡AS-XµK\êO\ÃM¢u¡¦£Š\r7Á\çO&‘\ßRU©if=&JqA\ã´\ê\Ãº®µ”õ\Ñ\ë4ŒeªjŸR~mjƒ®\Í—jzÜ©¬vŸ©:§ªº…Lµµ#·\Ô4\î’uH\ä t¯1\êP‡húf©O$ñ\Ú\×\Ô?\×ÿ\0\è\ÕIDÍ‚¦V\r\'Z§ÿ\0¡ú“ó$·Rú^‰j(™A\àôß¦ÿ\0\r\r¨¥\Ñb†O©?5~–\êX4G@h\é¼7ú,o¯©?\r?”t(§¢l>7M¬TÁÕªÿ\0¥úejõŠ†¿¦Ş¶›_õ\'1\ÔPø½3N.:’ú™ViF\n]Àihßµœ|\×ÿ\0Fµ	\"“F\Ò\é™U¥TG$\×ÿ\0\ÛôıN–\n\"_«j_PÓ»:}f™\ÑU\Ê\íV¹£ü¾SDStº69”4ñÎ™CN\É\ê4újƒM§SS¹T\Ò\ÃR#cca\åyE\n\ZUME=K¤cde=\Æm2’cMCOJ\Æ\ÈÓ£Ñ—Cp6¦Š¤¨\èi£™”4\ì2†™“\Ôiô\ÕŸN¥§v\Ò\é4r»Ê¨úa 5úE\İOM\r3j(iª_\å*©˜yRi4r\ZjXiƒ¨©\İQSEOR|¢…EGQSR\ÃL$cde5,4Âê¦Š¤¹s)\è©\éœtª\'(¡C…SK\rHòŠMG*›K¤™\Ô\ÔTô©\Ím5$ª¦’\Z¤Æ†6¦’\n¥-<Ñ±‚6x*ªi ªX7\nz\Zzg²Š9ç ¦¨”P¯†§‚*fT\ÑSÔ™é¢¨\Ê(T0\ÇH\Ò(\Ü\êzhi‡÷µ’¾(4óVaÿ\0\Ôf8©zı\íjä–»R‡M­¦¨\Õ\ë0\é•u¬¢«J©ú\ß\é4:õ^O/¨\É\èU\×n¥Zjªh¢\×*-^‡S×¤×ªd‚(ôª‡CBÙ™Lµú•6ƒ;£©\Ô?¡Ò«M5N½[\ÏÓ¤šmz§¥K¡N\è\êu\èh(%­õ4:—Ô„‡Áøu\Î4\ê=2j¨4\í6JI\Ş\éu*úM>¶š©kÔ®-‡U[¡Ó¾Ys6¯QKY¦N \Ôiz_ô$ÿ\0\äPãŸ¤\Õ\Â\Í\n®JˆõÚ&‡;¢ª­”ÁKII.¤´ªjºw-T:MZM:º‘š=y«gAõZ§‘Î£³S«ğt\ĞP\Õ\êM £®¥«\Ö5	\'’\Õ9º]|\ÑTı@O~“W4*¹*#\×jz4šîŠª¦3,Ñ¥cha–¢¯Y¯u+c\Ò*\êKWQ§\Õ}HHf‰_\Õk\Éÿ\0\È?²®\ÒâªÎ­Ò¥ú†\î}$¬šŸ\ê9X\é5––i“\Ğÿ\0\ë\ÙP\êE}Iøk¨Kiµ\n1GIÂŸJ¡¬Ti5\"\nıJ\n˜§\Ój¨[£U¾ªW\Õ6mFª°K[U ›K£¢ñZu5ú¦ÿ\0¥\Ô*›6£WX&¬ªM¥\é\ÔUFøß¥VıIË ü:\ïûuSQO¥\Ñ\ÍHªô¨ªfViu€\á5 n§j¹\Ò7Y™šz\Õ\éü>—¤8;O˜\çõ\Ô?\×\Õ\Öj-nF) \Õ*DÚ…m`©®‘ú1+H¬¨j»ıúiO4š¾„•\Z¬ZM[%_R4ô´©Y-QJ£\áõÀA.\Z\ß\Ô?\×\Õ\Öj-nH)©õJ‘6¡[X\'ª§˜O£VıBz\ZFQÃ¯\ÍB7¶Vk\ÏlÕ¿QC]F\èb¥˜\Ôjÿ\0\ÙUhòu£\Ñ\ç–Zªh\êaòz\È]C£¤Õ¨ä¬†\r)\Ñ\Ü\Ê\å«QIY<f:}^†J\Ö\ÖP\ÔMEGJ\ÚzmWM5n¬ÓY”×‘AH\Ú8*[# Ò´\ãH\ÚúAUMMEQ¤\Ñ\ÉG\rdFzZ**ŠZ-+N4‚¾T\ÓSQTG§³G®`‡D‘\Òjú|µ‡\Éë—€œ\é\Ò+\Ø4\ê*¸\'›F™²\Ó\èó:m¥Ó¦~«³´é¨ª`eL>OY\Ó4¯ıONš®«P¤”ô4µ”\Ô\ÚVšiu+ji©4ù[E\å3Kğ²-CK¨¨¬òZ©\r%,t‘M¤UšŸ+\ÔT`†O\'‰\Ú5TO¡\Òú†Ÿk|¢¸\r;Le\Z\Ôô\éª\êµ\nAYOCKYMM¥i¦‘WR¶¦š\n\n˜ôöhµ±–iš€}m$u‘yElKN\ÒNı^†J\Ö\Ç©\á\Ñ\ßÿ\0³¹\á¢Z\Ö5\n×•\ã&^a\"euĞ¨jkƒ¾\' …Z\É\å8¦ğö€$j±0‡vM‡‹À\Ç,r\Å\Ìü#—\ŞH±½ˆ‘{\\M±»‚¥\Ì¯r†^ õ„À£j• ‰n\ä\à	j6\ë\Ã\Æ\ï\î\ê\ê:\r\ëKZ\êmL´º¶ ¨fÿ\0\Ã\×\ÈL¥\Åe\í±QB\ç¦Qh””Ò±;\íZ{‹™\ê=š¢p$r“•Œ| šš\İa©\Ôõ]Å…²{¤’\ë%O;¢|\ZœR8ø]Dc0k\×7†!0ÀF\Ä\ÜUCun|”ñt£õw-	²t–OryNMA4&\îõ	\\\Ç\Ìs}ı§…~8¿\ìCY3œ\Â\â\ßøJ\æe+c]\0TQ\àU÷{SYG¨¦„Æ§½±µõ\Ì5—Bv½3—54&?ºu\í¨\Ét\î\àğ2\'¢ôE\áK3£}X—şa\ï±Y„\Î\ì}}\Ësºl«˜¸Œ‘\Ê\ÙC£T\Ó6f´&œºÖš\\,©\á2˜!daã‰›gôLŒğ®°L\r‘\ßğ’l7{£H\Ëÿ\0‰³ƒºA0İ0HF¡\È\Í\"\ëÈ„ò^ıHª\İÀa‘Í‹‡\Ä–j\ÍÊŠBÉ˜\ÚCó‡~-Q™S*vu*¢‹ª¨\è‹\âim]9‰\Ú@&¯ş­/lZ,@Bq\ÜA&”\Ñü`§8¸©¢lŠ@š?\Ó\ÖûÑµU\ì\îöC…Nr‰8§ŸŸ\ÅFÊ¡Ql¬yø\Ñ#$¥{*Àk¤jl¢\î—–E\Ù=¡\â\Ä\á³,FÁY8&ŸrwLü\èmruN\Z)\rË‚\êhı¬\ÂGD\Òe‡§ÿ\0H¤)\ç\çªş³õOù¾\0µiú¶Q\ÏSwfdªØµ…\Æ¬;)f|Lc²gü!î‚º™ö‡5½W,\×,7§ù\'\ÍúLz´\Zš`¼\\EDe\ØH28\Ü±RŒ™§ô\î)\åYYYYYp®Â¸SóPF\Ó\İ]]]_\Ò^]+CE,A³©\Æ=V\æ³‘k¯\Æ/š\ê\ê\ê\ê\êş««««®£B\ë\×]r„Áeuu{‚*NdºvI\ïnmm™w\Ä×¡\Ù)c^i\ÈP\Ëv{Xñ\íxG`\å7v\ÆÃƒÓ¼\Æ\Ï\ä9\ä\Õv¬‚\Éet\r\É6Y.“IÀ ÀqYw+¹rš\ç4ƒur²)\â\Ò\ÆüT\Ó{<A•oµc]jyrh*\ë«e\Õ+¬WYu—Yu—Yu‚\ê…\ÕªU«ª\Õ\ÕjÍ¨8²\n\ã\ÓEÓ¯\êŠO}\Ó=\Ç\ÖtP†µ\ÂFªf“$§\Ú~\Ô\èÃ‘c¬\ÈN\"?lB\Íw/‘©‰\Å®­sºd\ÆTƒ)ºp\Ìt\"\nÍ·\ÙY«„\0V\r¹\ÛŠ\r\à\0\ÜJ;_kª¹N1Q\ŞEs´TU;*F¦ğ¯¹ô[\á\áu}¹Y™Y•’\É\\« W6\áp¿nq\nG9Ê„{˜\Ì\İ\èh÷9³Ÿ\î6Yb<Jñ$/“›#c\\¤\'4¹2GH¹aº\'f%8EMVb\r¨T/İ¶\ã~U\Â\ì²E\Ï{‡(‹¬P\'`¸\\medZÒ±j\Ä)[v)\Ì6g;\n4Ğ¨Ah\ÉK8ˆŠøšö=]Yr‡e÷°ì®®²+2ƒ\ÖK%’\Ş\ä¡tBl˜…ú(¢¨\ÚJŠ\'¶6›ÁØ¢°ş;§™­Edš\Õ\×—^\é…”€\ß\0»\"€M\åVË“¶8..¹\ß÷Â°\Ş\ë„VYv\Ş\ë$oat]e~6²™½2\ßré’£¥r\â÷M+bOqqw\ß…‡Æ¦U°¦½V(]X®\Âì®¸Võ­u`ƒZ›Ovô2\×E¡D\×H\Ò\Óú*\Ë\Â\Ì\å#Œ\Çlº})¬ \İCy\ÂÍ *>)I\Ò\Ü\Õ-4± B8\ß\'\Æ\\\Ät\Ñq\ÄNt(9U3tXœ\Åb\Ø8¬\\­µ\×9\\««\î6\ár†\ÖC…r®QÊ«P\È5\× µx\Õâ¥‘IR9%wpWWA\ÖM«pP\Î\ÙE\Õ\Õö»vµı$\ÙI*p²¼j\ìWºo77^‹lZ÷51‘xVØ˜\Í\ÆÕ\àlZ‹J÷zÁÉö²’)UF™#Tp–¼£pi­­.le\áR„5\î/rÿ\0\'!\ØI²%«Û·d\n  ­\È\áw\áZ\ë#\Â/j°X”µ‚³B¹¡OQ$\ÈwmÀ\Í	.^òP\Ù\æÁ£\Ğ‰L=7E ’;¬¹\î‹\Ú\0›¯1HŠrt\Å9\ä¡\İ[v\Æ\Ò:+.œˆ\Æà¢†2-\èö\"\ã³œ¢Œ½ß¡t}VR@Ç‚\à\Ñ,†Rx5Å…ò:W/\ßù9~¹Nk•Ü¬V4£\ÓA\Í+…\Ö(\'\0‡µr…\Ö%bP²ÿ\0\'®¡\'ªŠ¦B*j\ß2(¦ö†£¦3÷;~ÓŸd\Z\ç.‹U¢ %BF\n6X´¬Z°	\År\ÜH\æ¦\ÔH«zJ*¨ˆF¹¹5d\Õ+º’0Y›ù\Úfd\Ğvkykl6Øµ\Û»I÷\Õ:\ïûl\Åûr=¬\äb%tP‰¡Ú°F WA«¤Ğ±*\Ë‡\n\ëÜ¬õ\ïV)\Ù#\ÕG€r\Å\ÊG™$GcÀÙ‡l\ãtı~ö\r²5\Ö,=F\Ü12RW6nd¦¹\×\é•(²*\Û‚¦EeŠ†¥¯~L\å\Íû}=—}\çf%F\ÌB\Éú\Å1T_,f\æC\Øwı—f·²(\ï“Bº34°AÁ]¨¯×´#\ÛÜWÄ«”z‹ùb±+¦\å‹À·\rº±\×C\Ò\r€®\ÊûS¾\Ï\Ä&…av\È\æH\ä\ÉT•8™d}J\åE\Ô*Vb÷wT\ì°Ø…‘¢¨ñR³9\Û\Û\ÕmÊ,\\]eb\å\Û\ÖS~ù\n«eŸ!»Ü‚ÿ\0${¹4\\øWûEÏ¿¸¬J²÷§+ºù’\Õ+§)A®¸¸W(X«3\ØrrOq^å“‚\ê¼\İ\à\"6\ì\0VX¦@^Nh\Ø\ì{¯qX+oLş£rxW–®‹®\ÖX8(\æ““E\Ë‹vqöª\Z=(o\Ãm¯tÖğ¹3ò8óPÌ£/³;û;»]‹K—\î\ë\0\Æ\Ë\rº‚\ÍÁ\ëB1\İ6 \Ôì•¤]#|\ZWIˆ1¬G¿X\Ù{\ÕÊ¯‘­ˆ!·ù»\ÑLö\Ä3q®®®¯\Æk%r²WÚB\É1‘`ô3İ¸”÷\'<\"nœ™ñ\ÂÁc¼¯ö&77F\Üúø^­ñLl\Ø\Â(ªøz5Ù»\0¿vEşM”‘+ªSj\0]h\Êö•\Ó74	º¸E·X€ƒB,º³–‹!+\ZD‘”D\ØTK\Õx\î6o\Ş~\â\n‹+.Pk–6\Û;!3P{\n\á[jg¸´rˆz³\ĞC„ÿ\0\äi…\Å1.ğ†7\ÎH°\ÚY,»‘ua\×øO„©6(µ¦]3f÷\Ø+\íeşK£W@.ŠkKUšWL.™] °bÁˆ\"SšŒ+«9ª\×XF™+P‘\ÖM\î6gs\ŞŞ±*\árË¨U\ÚV\r]%‹Â»•$\Øm{¬šJKT<—œ–û+)Šqº‹BÑ©ñh\Ú\ß\ï\árw2ˆO`s\\0”&\ít\ŞÛ\å­¶;Ğ³m²E\Ò\ÂÕ›mYµ.Cšã±²Éª\ì*©\ÙT9Ó°_´ß¹da½=¯\0+\'6Ş€†A¬‚pº¥“ª\Â\Ó{d\röxT\Îö\î.¨\â£6sb2\ËC¬d?°(¦ş]\İÚ©¸T7³v\ì/aY \ë£\Übƒ\Ø\Ô$nØ‚°+}‹$mñ`±X\Ùr°d{–NMy=ªI*³W\é²ºj?q\Ø\ì\nw5u£™³D	\å¤§&÷½\Ğ.\èµr\r,¸?Ä¡3\nl­&\'lñ\Ã=³\Ã‘8bë§¹=\Û\è¬!¹\Ü|§gl\Ï\Ë}®‰Z¯õq”NN\ï°6M\å\å¡Ç¦—X„\n «l	6Û¨hV	Ë²(9ÁM#[\r\îƒn°Vİ©‘I+ÆŸPO•T#¦\Í\Óğ5A>f(\ØJ¸\ÂE4!À´‚o`İƒ¶²÷+ñ±‘Ñ›ôP„\':).\Òx	®WO>\Ş\è\ìVNo\İ~şzŠ	\ÛE÷lBpZ\Ô>\Ö}Á\rŸ\ßv±F\á8¹X«”\×9{‘xE\ÍW¾\Ù&\Ë\ÆM;´,\ãC¨Ê†ñ\ĞM2:L¡C@£`WH\Ã¡\Ów‹Å“4¦\È¦¥ŠeS¦>Û´™^WtB\Å\Ê\ïJšö£\Âgq‰·\n\á9Sº\Î\'‹µ0–+’Ø\Ôm\Íñ3ü\ä	û2V6p\àv)Ê·¦ø?a\ÙûO>›\Ù—X\ÙZU\Â.j\ê9]6P‹‚/ºp(l\Õ\Õx•\â2d¦\á]]Ss3]a$«+¦¹ø‰ˆ=V½:7(é®€\r\Úê±‚*K\"³Y#b‹S]d\áp\×¢G\Ù\É]…#H‹\Êöqt\×YÌ©sZ÷±A¤ª&;Ä²w\â‰bñq\'V\Ä\Õ•½ù¡\Üÿ\0T6°NhZ„WGö§wôQi\n\å¶²8\"n «+\Ù‡#\×L,bÁŠ_Æ\Ô\æ\Ò\äQW±r\êh\åM‚\ns\âZG\"L–k5©\Û%r®»+\Ü+¢»(˜dt4\â%k+•n_”¦&\È™bØ‹‰‚\å\íÀ9Ydm¥¶û•#n¹\ËOü|‡\ĞóuZzoiÜ©›“\\,bûS»ú_\r\0)]Š7;rurÈ®š…Â±(\Âö¯b³cUM6#f›:\'\\#\Ú\'ˆZj$q>¼š\è\Æ\Ö\å’\ÉWHº¾\×]•\ï¼Lq\Ç²,\à±\ÈF\ë{¸šl§³!¸pŒJd*Z-Ü÷Q~Ÿöô;\ê‚ô´Rõ!Ø§*\Æ\ãQ`S\Ï>—»¤×½’µ\Ì`2!5b—µd]0ºnG0„…Ò½©\İ5\ìG•\î*h‹6)•j}LL•\ìF¹\îkkSglˆ\Êò²%5\Ö][)k€O‘\Ò;\Ñe€X…A6~\ç”0z\é¹Ã¦S›Ï¦¿ƒ§\Ë\ÃB…<+¡N…-!FšŒ¯B›GD…)BŒh€ñ§†#.\ÒXŞ£—UË¬õ\Öz\ëHºò.¼‹®õ\×z\ë½u„\Î]W®³\×Y\èLŒ‘¦¶2¤§ŠFEG+¤\Å\Òb\é1tcRiô²;\Ê\è×–Q¯*¢^UD¼ª‰yUòª%\åTKÁÁsCLT°\Ä\Z`‰t#\ÃÄº1¯\èD¼$\nZ8D1…\Òb\èF¼4+\ÂÂº¯\r\nğ\Ñ/\r\èDO‡—Ò¯/¥^]J¼º•yu*ò\êU\åô«\Ë(×ƒx:u\à©\ÑÓ©\\¼²ye\"ò\ÚEå´‹Ë©—R/.¤^_J…0>\nx\Ze\àiĞ¡§Á\Z\Ä,A«\î\n$•’¾\×Wõ_oÚ²·À\É\Å\âMüCSdk¾y_‘ô»°\í/\Ùı‹½GûÀŠ]\\/\ß}®¿^±\é‚\Ù\ßqR\\ñf\ä\\O­İ™öIö|.‘­^!ˆ\ÎÀ¼\\HOA\í;¿\íş\Ç°X…a¿_kz¯\éº\Êíµ—r\"qR0°«\İÊ¿WWôşÁ!6wµ\n®\rK©M‘®,?‰\ßo®Y\Ù\Zš°¹>g9fº…dSd!\n—…\ã™XS*sx{~;‚ÁXz,­\ê¾\ä\î}\Ş\èôG\Ó\Z\äÖ†ª§\ÙN\×ßM½%]_fJ\æ¨\åkşJ\ÇúõJ\ìY4$•U\ÖI¯r¦«ÁG3$¬JÁb6¾\ÖVõ]_c\è¾\Çk‹^Ş›\í\ÆÁAD§\ÎÆ§N\ä\ç]{W\Ù¹Avººº\É\rÏ¢9œ\ÒÉšóğ\Ó}«÷\é¬v0½\Ü\ß\Ğ\ZJ\é‰V\Ú\è¦HXi*º‰¦û`¬\Õö·\ÊVV\à„\Zw\ÉV\âü_n\èo\İv^,1’L÷§KŠ\ë±\nˆ\ÓfŒ¦¹§b2„P\àw6\æÁV\Ûõut9V\ã²ş:}÷zuŞœ¢š.c¦2tÚ°\Â\éÂ’\"\ÒD\\CpiŸ“wı\Â?\ä¶\×C{!\Î\Å_¬¿{\İtT²\'N\ç\Åedæ®©E7\Ü?\Ò\n%4H\nÈ…úº\ì+€¸MW]\Õ\ÈE_\â§ûÔŸ¦©¹S¿º„{š8‹\'µ:0D‘\âce\ÄQ\Ş:6Ù†vù\nP\áµ\î¯eoPºı\ÙYY\äø†:{=¬\É\×Nu‘6‹#u‹J\ì@]\Ç]][‹!\Ê\å•k\Ê\ì¯\í>(?*›òzª\á0Ê o#\Ô\ä©´b \à,7)¿(\ç\Ôwºº^ëk®s½ X*™j7]¥·Rƒ\ïi/»r(&±5I+$\îSv\î¸\Z‰M•’·²=ş¿2Ÿ\ïõjPuiŠdafĞ²¹N°EÙ¿Ÿ³\Øv\Ø|¼u}ÀV¶Ç”D ®9œ‚‹«ÇºûU‘\ïeûhL\nÈ»k£·\é\r¸º· +!µ\×p>(ÿ\0*¨\ï\ê¨\ìv)\Ñ1Ë¡Š\É]d¿™Ç£)P\Òb\\€¶\ã·\Ïú\Æ\ë`¸W\æ\å4”l²@\íÁX«‘uŠ#nn\×)\Z\Öğ×¢P\å\"jk€c‰*\Û\ßcu\Ù_cµ\Õ\Õø\É][\ã‘T!½•¸ªŸ¢\Ö\Ê\éQW²|FYBmA:\îob\ä\Ù\Ú±\Êü1~öo\Ûó›ƒr²\ç.n\×\èrˆVÛ¶\Îu•\×\êü{+®\n\êWrfõs\ÉÖ\' °\ãk\"€º#ˆº¶ç¯\èº*÷øH!~\ÕG\Úİ‚j<\Í\îm\ÑkÕ£e‹{K,—c\"T\í²b¤›«»;|ù¬–K…\íVj³U›k[ue‚é®š\é¬\rºebBé•‰V!H\âÁ\Év\Ø\İZ\ê\Ê_\İ]]]¬¬Š±VYnÕ—û–6VV²·¦\Ê\Û?\íweQö7ºı·²¯oò\Òò\âŠ\Å»TjP¨P<iÍ¶\ì\íóğ¸\\|WWWY,Y:W\Ö\äù\0t|\Ã6H¬\ÖaI `l®/ŠºV*b™t\ÊÁb±X¬W¹\åD\Ù9\Än.œJ;\ĞPô;³¾\Öı³ş6÷_¶öUŒÉ‹4\ì\â¤}”?vMP8TÇ“\"’\ê3u\nw\â¦m£Ù¾~\n\ß1!‰ò§8Q}\Ï<U70Ç›Œj”÷f\à¯\Í\Ô²Æ ¬\ê.«—UfÕ”kØ½«V¦VŠ\Åb°X¬E\ä\ßA\ì\î\Ñ~)9`¯\Û{)Û˜\rs%<¯¹øñ…”y\'5\Øöt=\âGñn\Î\ß8®Q\Û\ÜU—;ò¬¬UŠ\å{•L–kjŒ€?\'‰zŒœë§€T²\Ùı~—Ù–¸…KYš¸ô\İ]fWU\ë¬õ\Ör\ê”×…\íA™\'2À\"šœ›\éwj\Â~Ñ±\îİ÷T~DS•ğQ¹ò,&\n1*ñ¦Os\à\î\ÄÛ»?°\è¢qW•\Æ\Ül\n¾öGW3Xqu º=\Ş\Å\\\Å[\ÓMù§ü5\Ó{”\Ô\î\Íô–\\SŒc_´SW\é\İ\ê•\Ñ)\É\í\ÉE}L@OT\àş¬²F\ÕL\î;n\Ï\ì\Z\à‹&•Ã—!^ë°º\î»+«ª‡\Û$d/\İ1\r†ä«¬šTH\Ì›½½M\ïAı7\Î\Ş\îMG³}#”\Ã\ËM\Ñ\îŠuL1\'\êTÁ²j™\éfºº%5[%BG9tš\ÈÚ£GÇ¥Ÿ\Ø7„\Ó\î ‚¹\ád¬¹i¸VB\åB©+-²¥Š\Ì\0\'€S¢‹)\ÔD\Ç\Ğ!qc›»{i\ã{üwM\îSS»7s\ÉYY>²œ/3€¨4“©OW$ªûu™\r€V]2¢aò›,jª\Ôp|z¼Š\n\Øfİ½ş~Tk„\ád7Ckd¬ƒö¾!\êI]3¤n*\Ü\0‰².¸\â\éµ\É\Ü\'ú\"˜1˜=¨\í§:Ó—,¸ıp6ı\ïuA_f÷)½\Ï`‚&\È\ÔDTÚˆR\ÎùM\ÖK2‹¨\Ó™+¦½dƒ\ÔoB\Ö§É‚­e¦Mu•5{\Ú^à¡¨ÿ\0\Ø2Á\àğ\×\'…•\×(È‚\0(v·»\Û9|ÏŠq\'‹˜\Ê~\ÓûiF\Ï\ï\ë=ÁQ;ş\×ï…\ÑWW ]p\0\ä.\ê\á\Æ6%\ç°A\Üj3J¿\È\r‹%º\Érré¼©ª„iU<\î\\S$P\Ô=ª\n–\ËóXÜ¢I7M}Óy)¤««\"»*“w=â±¢n¨]h¤«Àº°•\âBšgL†\Ïû½½¡u\á\ãk ,y(]Z\èZ\ÖF\ê\Ü#Û¹\î\n\Ï`ª\ä	d28ü\á\Ä&?\"	\ÄTY:¢G¦&ö—pš‚k“¼da<=@\Â\Z¯ÈŒe\Â\äpK‚\Ï\"J\êüTòb¹{¤v\ÔW-\Ä¾ÜŸNŒ£û^/!ô\Ù~†ô‡ı8\á][b¯cv\ì<X\r®nH{“gx]\\\åÁj\Ïi™\ìF\í\Ùû„\îNw\ZCşL\ns\Ûv‹ºø\\µœ}ª\×µE\ÃKNA\Èİ¦¤«\ØmD\Çs9.ee#\ZSE”¿“\Òû;*şœ®\é\ã\İ\Ê\'\Û\í¹‚\Óû\\.Qr»A@ªw.*¾±°\'8’ö`‚;\Ğí³¾\İ-\Ö\Ç{,£jºŒIC€\Óek§\0õö0=¨‹—œT\Æ\ç}*lC\ãj‘–%\ÈópMƒş\ïHO\ì‡eI‹iH%8”2\Ç.{¬AEË£eƒ\È\0l\Û\åŒõõ\İœQş\Ì\Ù3`‰Nô\Í\ßö\é½\âvMøŸ\ÊÁ¦N‰‰0\âœZ\ç[3°@«d:a2EuY	†Sc³OğÌ‰ÁÅ©\Å?¸\á9\Ş\×\ï»\Õ&\Í\ì#Å…€,İı\Ùµ7ª\ÊØ§;—XµõGU\ÉÖ’ÿ\0Ú·‚¯è²²7wı´lrb\á#WQ«6¬Ú²\n\ã\Ò\ÙnO$ºf=\ïjŠ\å¢\Èõ/p\ä\Óbû5JYŠV©\át*‘¹T=ZÈ”S“¶\î÷zBw\Ú{\Ôrn¹W6 ,J9_tlU†D9d¯ƒ	ºc\0V\ÚB\Z%”\É*?\Ú\Ù=VA]]]J}”œ5®÷O+¡q\å\î\\\ï\Æ\×W\Ä›¹®%\îh\\\çÈ²\ì\çw.+>\\C¤•¹6bjaG,n‰\Úhÿ\0P|n\á\ä\ç|!~œ7\\\Û÷ll\à5\Ü9\Å”‰¡\íK\"[no1–E|\\÷¶6\ÏPé¿¶ız›\É-¶\ÖôIÊŒ\â\Öp§P@lüš@,Šh°2FZ\êó,¬\Ñ!8¢\Ğ\Ö90t‡\ía,ph-—>\Ä=\ì¨.H£™”°º	“dº%<üaSSø‡‘ƒZòš\à\å#JfEwX®»Ã—\ë\îE\Æ\â\×7E\Ï\0g5\ïsÜö£·¨&H\n\ÇlV(„\ĞL£\Üe}•<x&:\ÄLŞ›ª˜\à\×L\ä\"”¯\Ä\Ö5»\Ü\"\æ„sp|\Î\r¬\àn$e‹‰hv]H£Q†J,OÁi	Ÿi–jüI\ßã¡“§=\îŸ\í‰¦\Îw÷#À·)Ü–\İ\â\ÎNw¸ºÁ§%\Å\Ü\Ù\Åö?Ú··®\Ø\Î\Ñ\íµ\ãkl±NŠ\ë\Ç\ß\Ç“Ša\æ7d\àğö7Œ\ìk|{Hñ\Î)\Ó\Ô9tjŸ\"25u\È#hS´\Ânc-Dñv(÷\â\ÙY]d™j4\Í+Á‹ø5\åù¯.^^¼±:‚\ËÁ¯‚À\å\Ë\ËĞ QĞ€ş›H\é\İ6<cf\Ç\ï>\Õ\Ó\É0p2\Â\Ü>6¹¢;7ŸòbŒ.šl9.Š\é\Ó]%‚\é.Š\é„#\0B—ƒN…(#Â…áš…+\n}6)”\Íxt-im\ÓNˆ§µx\à‚4m^¡\Ú\ã°d\×x–\Ë\Äâ—ŠO›\'¶k.º5ø¥ã¬™ªYG\\#LªŒ\ÖF\Æ53V\0I#£\Æ‘µ\Ó^Bs¯µ¹ğ·c\İ¬\n1®š±\"hU‚±27qLû¤g´DlZBººº¾ÿ\0å°§jğ­	Ô—.¤L¦q{¨PÑ†» \Ôaj’™¤x7^hY\rŞ0W(9@+\İ59\ÍY\â\Ş\ë¦\äÇ˜‹Œ¡+¯t\àœ,›\ß\îM\á\è\ìN\×Wô\Şÿ\0\ätyá½÷7k+++le±ê¬VVV\Ù\ï\Å2­\n¶§Ôº\íšV‘4¥fÀI*\ê=­¼/a\æ\n\ë–M\Ö²+$\Ş\å7»˜ş8)\Ñ4§S¢×µd®®›\ßk¬•\ÓU‡¡\ÈlY5©\Ñ(\àhO§m\ä0€\âÛºd\\\\Y]0Qö§ \á s±bBFy2\'¼e4‡#\Æ\ïV]Õ‘\îPE7»¾\àqšÆµ?³{;¿¢\êû:0S˜lw’fF›.n\à8cpğ{Sf\r`˜”&²3ñ\Õ\â÷9.mŒUO`eu\Ü\ÌdbŒr\ä\Ş\ïp¸\Ö*\å\ìbc“©‘ÁrH9§6\Ä6º%#¸E5ªZ\Ğ“¹\ç$J*8\îœCPŸ—œ\\Š¯±\È:\êV®\Äğ£–\Ë\Ú\ä\æûúd\rµ®\\\Ë!Ü‚\ç\Å*\ê\éı›\Ø÷“	\ï°uCŠs‹\ÈD\åbVtœºe`V*Ë²;]4ö~Y1‰ûfğA\ä!\"¹WVF4\èB1(\ìE_k\ì6šNœOyq¿¡Œ\Éqg0\'u\Úc’.Y+¦öÿ\0\î\Ì\İ\á\ßr	¥5ë‡¢\Û»§vº‚\"òÆµˆ•}¤\ìß´÷¹u\Ó6­—\ßu\Ûnn\ÔJ\rq-‚B™GÁ¥	Ô«Â¯¥†\É\Í>€Pq½<™\Ç‘~ †\ÅYb¬ƒˆBTÒ¸V\Û˜òg)’ ‰G\ÒZƒ‡I;¾ñl)³8#%ı«\Z\åú¿·$\×Y{¤]\'46§7 SŸ\Ã\Õ\×\ïvğÛ««\í\'aöŸ¸z\å\ì\ÄÍª\råµƒ.²X’i\è.J\Æ+\r¬ˆ\Şf5>\0¤§Nn\'z9Kf²t ¦8 ö¬‚¸D®û[`ò©Bp¤\Û]&LB‚¯±ô\Ö\Ö)\é»7“ú\"\ê\×DYwQS9\é”	´\r^\r«\Ã5IF\n4jH\Ìnº]{\0ò\äşû_Œ¸CòœP*D>\Ó÷[…\Æ6\rÚ«\ÛQÅ‡\rı\é\Ñ{†\ÖÜ¢‰N;ªb\Ù\áL?Ÿ\0ºat—Mb\å\ï)•\áC)qØ…Š²#{ Q*dC¶Áj6\ê\"‡ri±c\î\Ò\ßgdB—u;ƒU½U4\âF\Ê\Ã®®£qjq¹Ø¨¬S»£±ûß™\íş^³\ØöfÚ€şVr]\Âªm†\åQ	\ÍV\Úapµnÿ\0‚\è²>›«ªS\îGa±u„¯\ÍçŠ\î\Õ}\×_¼rTñó·Á_O›Sl‰ô\rVV²\îG.(/óyAH¿_\å\ë=fmWq@‹l=Ô¡U¶z;JSÍ¶\î†1>œyA\ïM\äbœ\ÔGª\ßÈŠ²²*¥øÄˆV¶\Ì\íû¦‡¨¤§-¥\Î\Æ\æ¦_\Òv²xU±t\æC\ĞJhºj<\"û¦ù~\Ï„8Rwı~ıg±\ì\Í\Ş:2¼…y§oQD„CSÂ‘ªam©Yy>\Z™k++\Z›PÒü“owz/wRşDJa\Ú\×U\Î÷«¢Šg\ÜV”\ß\ás.¼i\ZM¡YYY_\Òõ¨²\ìpQ\Ó8±\Í-;„\Î\Î@+¨;\îF\Òwış²Ù›\×1r\ãA	rh¶\Î\Í8\Ì^\ä\ÓtU\Ô\Îrğò¹1V²*H\îN©™ƒ>\Z\Õen.P•Á6¥\á6±Á~\Õ\Ñ*U\åY4\ì\Î\ÊM\Ê\ßOBùÀÿ\0EM]\Ã¤YYu\Zª\ê†M¦•Ë¡ \"Zˆ\ÌSµ\æ\ë+’AUŒ\Ê(˜_&C\Z«:4P\Ø7%uuO\ÛrŠ“\î=›\ß\ÓmŠwfn@!´ÿ\0\ËCZ‚=¤]K2pŒœ°\'<$­L\Òx#­o„ª¥`‹}…‹¦‹”\àZû8¨>\Ê2­°M	ü\ßw(˜_9şIq‚Âª}œ\éù5l¬œ\ÚÚ‰DQ\É4Ñ²\Åt¥js\0\\\Ø\Èò\Ô{\Ş\êÈ¶\ë\0önv\Ü\î\Íø\nfn\×O7g\Ëd÷T¹T\n¤*¥¾Röq´Ò¹\Ë\Ã\ÊS¨šA·ds1¬\ÅW;£{›=eU9\Ûr¯°	Ï¼h§”\Î#¥6VVX«ª“h÷%Bm[³ú\Ö\ërªBqpO!ÀFÛ¸UGŒt\ï\rˆÔ¸(ªz„~Q\ß~\Älğfö\í\Ù\ÆÈ¹\ï½İ›ğ9=7v*b\çF	Á9\å<¸®‹É†<ûTu4¹5÷F\"\ä\ÈZ\Õ!\ä\ÕYÌ”gøıeN\à\ÅÍ± ,vE¨‚Š\'–ı°Ÿl/\Ê>Pµj´«\ìT\Z‚1Lh°n\å#rC\ÉÏª\ãYq\Ò~r\é\ä¦oMş‡wWM“€‹\Ó~Û¢\äI)¬A©\ß{»5YOMİ©[h\Z‚w)\Í\Ø›Y9T(ß‹\Ç\"\É\ÊN\á7µHşjQüK.ğ\ßtª\êû7¹Eu½\ïÅ¬}–/¹¿Z‰\ç\ĞSŠ¦ˆ†Ašhö\ìU®»\')Dj 6r\æ)[4h\ËUÒ›\æ³Y¢ó»mv6\ÄöknU–+±pı\ï\ì\Õú¢S\Ş?º>\"b\n\É\ÊW\ÙR»¨S»NŸ¢©Ä¹<©\nLûj™i#³à¨–\Ò\\¾\ÊÁY\0šÛ–?$\ç¨\äaU6\î‡x\î\r,®{\nWş_AOZ-F(8e¹\Ù\ÅHû+˜\åhk%c”’\0¥8H,E˜¥÷n}\ryršl‡!9\íjuKB5.(ş\ì\Í\Ú\íŠs¬%©7\ë¹\n…¡À »/\ÓPWR»Š¹UK uLQ§\Ëv\Ô\Ígu\×sE7VT¥FyŒğ\ë\îğLÛ½³¤•Êºk\ì¹k$¦¬Œ&¹S?ù	@ª\Ãy\ÑÜ§­ú±\é*B¤vocx-\\°¼\È\â\ä;«\äø 7D(Š–W\"{Ğ§X1©ó!ù&6Q½\"\î#>ì‚º«}˜®®©ü—\â\'Ü¿°±»Ô¾Í½z\Ğ\Ğ\å#n§£À\à±!Q¼\Ç<\Ê^\íP#ˆD\Üúÿ\0OqÉ¶»ˆE\\mHÖ—;b‚½•Ê¹Tó:7µÙ´Qù‘E]œ´†\ã7¤©–Aa{‘\ëY\Ò\Ùuš\äy`§vRú\ì¢mœş\nÉ¡	L\nW\Ü\ÅWşI\Å\ÔmVVMü£{N\ç+m÷‚KcueGTIn\ÅW}šgõCA«bt\êj”jS%Bo4\í\â¸(S\Ï\Ã~$B\åX¢*\Å4¸òw²\0 Ö Ğ¨B›ò¬K—D®›B&0¡ŒH\æ»}\î‰EJTğD\r–5TÑ¸\ÖS€\ã×¨†+\'ğ§~\îw\n\Û¢~{Ğœl\ØşğQ?\È\ç&+úd„9:;,,ºWP³ùmÀm•\Ñ\á0 Š,—\áSÔ½\ÒR\ÖS¸g\Û)§\ËPÂš’PÓˆ[PT\ßp\î\Ş\×øduƒ”@bZ,÷óš\É0‹”v\n\ÍX8.œ\Î-‚EM8§ˆÖ¹I«§¹\0M6WTg\ÅJ“—E\Ãn\Å+c\ÔB\Ã15ƒ°{•L™»\Ô²<m[i>\ÖWù¹G\Û\ĞJ\ÈX»’Vj\×\Øö¤“(†\ÏU}\ã¦k© \ÅÌ– D2\ÓDÒ¢±\ì<T»‡º\åò\ÄC7 \Üz\äNji²sø-º\Å¦F\\Š*(]* SÄ€E\Ê\ê\ê\ê\ë$\\³PAG!ğ\ÊÙ™±Eò\Îˆ½9\×LOu…DŞ˜›“\åÜ¦P+$Jh\Ø}\ÎQvº¾\ÒKŠt¤’JÜ’¿PÉ‹ƒï¼¯³hf\é\Ô®Š{.øû=¬Nu“\äI%\ĞPá¯“„\ÅQ\'µŠ\Æ÷\Ú\ëõ1Y,—tIYr£—¢§tkCR\×\\l}\'`šP\Ú\İã•²5\ä\Å8]‚\ér\ïj©š\Ã\ÓM÷Õƒ“}1‹¼ ¬±V!’ß¹\Ê>\ÛK&(º\å½\ß\Ù1\Â\Ïu\Ğk“2j\ë‹unœnŸÂ¢Ÿ­öÇ8\"\éğ”aN§)‘60ù±R\É\Ôrsñ.!G&(;/Eö*g#}˜WL”\æ\Ûhš\nŠŸ\Ü=ˆ:\è§ö;\ÖQA7\Ñ\îğ\ÎÙ›tUìºˆÈº‹ªó\'\İ\Ç\ÓK÷U\Ä=0şB‡r\Û.\Ê\ê\á7¹)“\ä²{¯³J³œ„aBº%_fğûA3¢t6V ‚\ìSŠqSLü¶&\É\ÎÈ ®šò\Ô*…@M‘¥\r*H\Ö#91–¨\Ï¢º\Ï\î>\Ò\rÃ”œ9Y\Ø!¹L{¢u5P™¹\"S‚va{\Ñ!ªW¹¦\Ê\×G\ÑB\à$‘™Æ›½\Ôs\Í\ÓG¼&›:£t6oi]dMölD Ö·\Ö\Î\çsÃ©ªNø¥lA\å¨È\"t¡MP²¾\Å\ÖNvHz\î›!jdé¯ºsM±X€du\Ó\\±¸y\å¤\'‹¸…÷!\Æ\Ó\ì}g`šw(¦¹Ñº92nnFTj\Â5*\é\ã`¯pö[zsie}£h¹µ‘EO`M\ärË‰O\r\î\Şé½§M†\à5­ø[\Ûw¦ªy\İ¢²7$ö\İ>)S\à™:2İœû\"IA¿\ÈY]0‹øAœ9k7	®\È)¾\Öv>²Šz\n)to™¦\Í[`mÁO\èªh$sü5\Ó(\ãhğ¬S\Ò\Ù;º…œ\Ãx’Ë„ö\Ø\ãÏƒ!\r\Ä.´–Dü#¿ ®\ÅS\ÎbtdL\×\ä\Äú‹\'\Ô8§IurV(\0>znA\î7Q…R\Ë&»w\'»\×‰>Ø¾\Ã\ë!;vŸAVN6=şTQFùZÖ·rSÜª…Á“\íd\ä? V \É\Ëú\×F\'\Î\ß\ág©É§h\æ’S\êmx¨©¥´\Ò8PAPø®€M*~c\Ó\Óƒ\Ë`D|\ÈÜ¢™\Û\áRÏ³Š{“œªÿ\0q\åv]\äº>\Â/\Ùe—H*–µ¨÷øG©Ş‹\Ùr˜Í»£\ëöş \å!¼cyJr*\'(M¥r>²\à\Ø\ï)A¨pÿ\0EıACR\è‰uÓŠ‘\ÖR?7B\Ïm“\Í\Ó>÷wŒª§\î\ê\Â\äÊ±j‡‡“\ß\àıe1›±]¾\ß\Ö7üo³»Hv+±½Ÿú?½;»“Ï¢\êş¡·q‡TôÑ“‡”\ä\Ó\î‘FUG¹¡ymB:]JòÊ¤tº\Å\å•k\Ë*×–U¯,«^WX¼®±y]bòº\Ä\İ.­yeZòÊµ\å•k\Ë*×–U¯,«^WV¥V4ªĞ¼ª±yUbn•V¼²­\r.­y]bòº\Å\åu‹Ê«•V/*¬^UX¼®­.²\ÃJ¬^WV¼®­y]bòº\Å\åu‹Ê«•\Ö/,¬^WX¼®±y]b\Ze]“X¼\êJ*’¦Õ”4Êµ\å•h\éuˆ\éu… ª\ÇËªW—U/.ª^]T¼º©yuRò\ê¥\åµK\Ëj\Ñ\Ò\ë•\Ö/+¬^WX¼ºµ6¹\ËÊ«•V/*­CK¬^WX¼®±y]bòÊµ\å•k\Ëj×–Õ¯,«^[V¼¶­ymZnVhj“´ª\ç:=*°-«^YV¼²­7L«úuQM\Ó*\Ñ\Ój­\åuş#WQ\Ğd:ƒš\à\áÿ\0`‘\â6M)šE\äk¢\Ï\r®2ÿ\0ª—€ª58bR\êó9:¶¥Ë¯*mT\íQ\ê•\rO/ªñ>4&’”B6–Q\ZoU¯ŠF\Ê×¸1¢Y¢½I\'OgNKº\îfÍ’ò¦O4··ı›*ª¶\ÂÚš\ÙgõQA‘B\\E=L,™®E\ÍR\ÚÚt»Uw˜–\ÃL\Ğ\ØQ›\Ó\ÇıZ¥3ôE\íÿ\0Es±Uµb\È÷Hğ	PQ¾c“L¤‹§\Z­m<Q\Ì\Åe\İY3\æ<°\ÒU\ÔolŒR±\âN»\Ô1¹¦hú\ëH\Õ¤r¨iqM\êS§>Yƒ\Z\Â\çGR|Q´\Ü\Ñ	°ª¨\Ç#\İ#\ã%EC\Ô\rhcwšL*4ù#T´-cj\éB\èßƒ¨\êzN\ãş§!¹¯¨\ë\Ír:}/Y\ß€p©€)c1>ü\é³\\ÔÚµÅ”Ø¨\Ù\ÄL\ÇğÔ´:*\èÃ¢\Ê?şOÿ\Ä\0*\0\0\0\0\0 !01@AQ\"2Paq3pÿ\Ú\0?ÿ\0÷¯”ùO”ùO”ùO”ùO”ùO”Z–[ıŸ\èù?\áòŸ)òŸ(µ/•–_,²\Ë,¼Ye–Ye–Yeøâ­‰	Yñ1ÀœR\á,? ±_SOØ ER\ÃH\Õ\é\×¬? ±O\ê\é‘\\?‘È´\ä\Åüy\Ğ\ìªdtl\çFœm\ãj²Qı\é\Z«²ş¢dD»¹‰-Ä´šñ_-/X¬jA®ü\Ö{63c4µ61;\ïgıHÁ¬=Æœ­\á!ş‰*x²\Ë\Íğ²ñfŸ¬.Š5ŸT^,¾M†\ÓiF\Ò1ş\Æ\ÔmÆ¢¶iõQTk\ËğiN\Ñk’R±vE\Õ÷\çÑ—C¿Á\İ÷oòğQD\ãú;6±Á‡xcg\æÅ™J†¬‹¢\ìr$™£/\Ã\'*$\íù\á*b\Ù9×¬QEq\Ú:D\áa: \İ\çN_Œ7H”¯‚—\ïöFm\Z“\İ\ç¬FD¦ù>‚‰HU\Å:#+\';\å/ñ\åEb¼ñ5Ã¶F4L‚Ä‹\äŸ6úá§²¿·\ZÍ–Yx\r(©J™­§?\ë\É\åK¡É‰Wy—\Ş]ù\Z\átX•³QQøûW‹\Â\\\éUòxLxcú÷›\áŒ•û’>\é\rW)có„7¬\ÚÍ¯\Åg\Æ|d£^eˆ{\Êe\Z‘\ë“xX¢„…—\ïÂºÎ¢\ãX¯X‘\ÔCÔ¿BeššŠ«…VQE³s7³{7³{7³{,²\Ë,²\Ë,\Ün-–ø\ÑEŠ)QE\"¸\îe¾4R+\Í\\\ì\Ün/ı:B‹>1\é1ªğ&_–Ÿ×†“~ÊŒD42Q²¾œD°\â™(\×\Ô\ÒKØŠ¬62‰ÿ\0—\ÒJÈª\á/©	Q\Ùe>‰\êş¾’W\Ò\"«a“‹i´\Úm6›JeP¤\Ñh—bF¼¯¬Q_CEÿ\0b^òÄ¬˜—Mù\ï99‰M/X²\Ñ\ÑH\Úm6\r¦\ß3\Ş/\Ô/ªú2\à‘|h¢Š(¬_‹O\Öf\æ\"Cñ3ş£\Ùÿ\0¼\ì|’lª\Â\ÅWŠ4\ß\ã4±7\äª=şÍ¿¡ÿ\0\Ò],>JN>‰I\Ë\Ş\"QEŠòFe–>\Öó~\Z+ô\'f\ßĞû5aúğ\Äk^{6ø÷3{e¯È¥c“\Ãğ\Äk\ryW\Ê<\Z®Ğ¥d•”K\â1*Í´\"¬\ìcx¿%fğ‡\ìOŒzy÷†¿DdJ6Kß‚1²\ë‘\Ù¿ ü_“q¹Ñ½‰mö-D~|•#z-\ÜnE¡\ÈÜ¨²\Ë,²\Ñh´^l\Ø\Ùñ\È\ØÊ£~“¾³B\ë_\ZÄŠF\Û´£¼¬Y¸\è\Úm\ÍV(\Úm(OFt|¬sD¥~ş‹DK¢\Ë,R/—…Š\å\\œ¼qŠ\ÔlCˆ\á•\Ñd\æ\Ë/—‡•…Ù±›\ãÆ²üh¢\Ë\á5ÂŠ$Š\Â\Ëù\Ç,«\Ã\âük‹&¹2Š\à\Ä1ğE‹%\ï‹ñÁ_x]”%e1øeOƒ%--ÌœhÚ™ñ¡*+³Ó²_\ÈN5\Åø¢·:6\í\èöQ\è‰FÑ¢?\äMSğJN]¾2Îƒéšµ•\\\'e\æ¹\ßi¿\ìK·…\Ù\"%ˆd=’÷\ä¢^óDV+ôQXk)^kü\á«HÜ›¬\"G¦>lzCC\âó\ëŠc7…—‹?÷Š›ˆ;Xö:7ÁÈ±Œ]1jôjOs\ãhŞ†,6,QC¯\Ê,o‹\Ë\â®/±±\ãM÷„1EaœW¶6Ÿ®!mæ…˜J²™cd\å›\ì~:f¬·JÑ»„ex±1–Iò¢˜ã‰Œ‚¡w‹¸~G†V+Ä	\ÙE\\“#,±\Êğ¸¡\æ2¡\Ìr\áf\Æ=6\ÇŠ6Š\'¢‡\áN…;%!¿\ãN¨\Ô]\á\Åaø¢2Oô!‘$Xş²uè”¯›B\æ\nV‰<6E\ílFÒŠ6›M¦ÒŠ(¬QF\Ói´\Ú.¸Q_^Z\îú4õ7ÿ\0¬J\Å†“56\İÒ´È¤—_\êâ¬„\"r†—K¶KRL…nş\Çò4ôw@ƒ‹[X\Ó\Òuøÿ\0V‘ªş\r:^\ß#ÿ\0¬)š2µ_kÿ\Ä\0*\0\0\0\0\0\0\0 !01A@Q2P\"apqrÿ\Ú\0?ÿ\0\Ï_ñññññ\á_e/ÙªıŸıŸññ§Y]ñeŠÿ\0R¤7\Å\"wÃ¨Ç…\ëğ¯ñ:†\ït½_	<%øğ\ï‡Sú—Ã¢\Ç4š#\ê¢\ìs¬¿À“¬X˜¿­…›\î<·\Û°§\â®R\Å\â/\ë\ÃEQEÑº\'\r\Õ=/\ìO¹¢4‰ªK	ù¨–lé¢¹\î|‡\Ènn|ƒŸcbñÈŸw…’û:‘§šµ\Â·k¸³\Óõ\à²\Ä\ËE–7„$}Pğ„¬N‡Ü¢ˆ\ÉEö°•‰WJ\Ê\Äa~$„FŠl]1*\Ì\ÑBBUÁ¬G\Ğ\ãdc\\«\ÆĞ£\âLYr\Ã\ä\Ñ\\¡ı¿>’,‰,D¯*]ø;ú\ãy¬V_	vD$ß¿BI•şŒO¿Ê¬W;,¿B\ÂüŠ\Ípo;!ÎÙ¹¸”W¬1,l‹Eø›£sr.ü\Ïô!\â\Ë!.\åølLly^¼/0\ã~&†j\ÍMh¢ˆ\Ã\ï…‹\Å#TjQH¤PŠ+ŠÎ¦¦¥\"¸\ØÙ³6b“fÌ¶lÍ™l²\Ë/6Ye–\Ëe²\Ë/›\áµp\îY±Ø¢Š\æ‡ÆŠ(¢¹\ÑEfŠ5a£\Ö\Z,\ÜRG±¢†V±EqC\à³y¯–lY\ïŒú”\ÊF¥a3kà¯Š2ğ¤\'š+›(¢‡›6¢rf¢\Ë\Âôjz\Ïqx²³\Z-W‹e\æ\Ñ%xE–K¹—\ì¬$QC±&4_\'–>1‹h›D\Ú&\È\Ø\Ø\ìv;lj„1Í±eE–†¼—$?—›,²6ı\é~\Å±8\áFñ¯\èr¯f\è\Üùùò¡uò.+(|ÈÁx¼YeŸ\Ç_bx²n\Ê\á$Ÿ±û\á\Ü\ï\ÜR\Ê\Ã\ÍC\ÂğI}—ö\Ò\îığ„*$sX®UR(¬w6e²óBY¢±5Á‰…\áqqv\Òôm^\Í>\âôt\ãn†\È{\Í\å«¬u£\Ş\ÍJ\Z(÷\Åxr»•K5\âp§hN\ÍkÑµ«±²\Êc¾}_CBe\Ä\Å\Üî¯\ÃF¨KÈZûD\'°\ãgK\Ö#\ì®OOYY¬\Ç\ÊøµË¦ûW	Æ»¢3LN‹:h~	²¿e~…ÿ\0x\î2\Ó\ÂUøK\Ğ\ÕYe>Î¸¾Ÿ{D&ş\Ä\Èz.£ıŠ\Â\î1Jı‰y\×¬kƒ‡qj\ÍZ\Ã\é9wDzsû>«-\×¤[}MMJe3CV(J¼WŠe›\"\ÑeHR_e£dl‰Sğ6QX\İ¡L}İ››\"\Ö(˜y;6f\Ì\Ù\á2\Ël\ĞôXÕš\Zˆ\ã\àPoğc#ªE¹F†ƒO2-1\á±2\ØI.\ÍÀ®…x\ì²Íó.\äP©bŠ\Å\"‘®^ ©e\á²\Ë\ÊÌ³ül¢†‡ˆf\Ë6!.øhk,N\Ê(^¸¾…—ˆ~CDyG±±|R\ÄW~\à‹Ye]¹\×‡\ØR¬6/w\Æ.U™¸İ–Yxø\İ\Ş%ˆúğ1f‹&Y\ïĞ¼	WfB\ãXˆ»e»\Âô7•Áˆy}„MÌ½‡\×;\Är\Å\Í{,¾-£l\"\Ë±2]\ÙTH£\èGµ\Ç\èR,\\£\ëÁy‡¼>5Éº7‰{Ç¦l2Š¥®/\Ön:³F!–!\â\Å\ï„U,1eap²]\Ä\"Æ°\Ê¡rea	U\ÎK)f+‚\Ê\äÄ8<¼Y‡\Ãb\Å.\â:hL—‚QÅ–%|V,¼¢¹<^R\ä\ãc…\Z\Ã\âÅ–…U\ÆÍ…+,\ÛGÀ\Ê\ÂExu$¨$_\à5E‘}\Éd\nd}q\\’ñµeVój\É\"+,¢±e\æ\Ë,¼ß—\äfÅ››Ye–llll>ø¬\ß\ã¨v%\Zÿ\03©\ÖQuöG¥Ô—yºJ+\Èë¸ºü\äO©\ÚH\åÿ\0#¬\ãÿ\0ûgC ºJß±È¼K§}	\Çúzd£\å7J\Ï\áG\ä“\ëHnøõcj\Ñ\Ğ\êo&»şWÿ\Ä\0C\0\0\0\0!1 \"023AQa@q‘¡¢#Br±PRb’‚Á\Ñ\á`4Sñps“ğò²ÿ\Ú\0\0\0?ÿ\0„\ÄG/È™v #1P\×q….\Ãh\ì\ï\Ò¾;+š\ëXÁ\Ü\Öwñ]e›ƒ›\Ä*¿ø \Ğ_ûPm©tHŒ‚\Öpş”f\à\æòEqs…CB\Ãfü\ï\Òd‹\Ş\àÖ\åB/<ğ¬VO	­µ&\'€A\Í1i¡G£´»¬Šp»¨k8Â’»\r£³¸„?\çJü8‹ş¡fü\ï\Òjƒ­ca ›h\ÍWQ~—u‘ˆ2Ôº$FAUÿ\0\Åu–q\ÃN\ì8œ\ï¤/„ø\×\á‰wY(š\ÛRb\îUÿ\0\Å>İ„\àdc$[f\ãˆNaKC§:\Ê0o¡ÿ\0…–™\Ü“[jL]À-g\ÉÁ\Í\ä‹I|G\íUñ¹®µŒÀ*¿ø§\"sk‹‹œ+„,6o\Îı&I\Ön.\Ä\Ó%Wÿ\0-,ã„®¥\Ö\ÆË¬\à\Ø\É4Ø’\àù\â;\ÓM¬s©\0›ifbÒ¿c\Öw\\Ş¶9Ô€Z\Ïş+“ÃšGiwX	àº»B\ì\\‚«ÿ\0ŠüTOWÜ‹¬*›Ö“H--#„˜Ik;ø¬VO¹\Ä\07•\0\\\î`/„øñôö¿Aû‹ñ¬d\Şõc\ÒÄ¢\érLµpV§¥Ù—·ˆL´±0xŸVn±ú“hIdK±.ß—Sÿ\0\"\ØI5–L\Ï\İUgô\'œ\ÆJ¡\ë¤H4\ï\ÆY9ÿ\0Ø®»£;8\rN	½¦BÄ¬&\ÏıD\Í\0\×ñj±úQ\è}\"B2\â­>·ÿ\0t÷ü\ÆM\ïV],J.’e¨ù‚´=.Ì½¸ŒBe¥‰ƒ\Äú³¾\æX´\Ã²k­™\î\ågm\Ñ\É\ru\'Bº5¯\ê1ôVJ[>ÁYÆXû•©\è\ä\ßÃ¶n\Î\n\Ø3X°Á8t«\"\è\ĞğOµ\è¯\Åj[>ÁXı(E“\î*\Üôa71\Ç\Ñ7¤3\åt`õlla÷V\ßRµ\Í¿½3ğ\Æ¤.MpMp6UV\Ãå‚´üPœ\ÓX\Ög8ÀH\İcõ&u­øÎ‘V–	°\Å(§—d]»¹nŒ\èº\Z¿¥[[/‰\è\â5V\İs1a„&y¡gd0´nV½]\Z\Óş\ê¶mV\å;iYZ@÷sC\êo\Ú\îı_\Ùü\rÍ™Æ­@\ÔÁıÕ§\Öÿ\0\î†=LØ­OG\'‹3<\Âe¸†Gš\èÖŒ1kV_Xûf÷\ÙE\ÎŠ]W½©´†#\ÍhÎ±û\Êc\ìI\ÃQşpß¦´}©€-\"œ\Ğhy‰\Í)\Îx~\åuEÀÙ—´\è\Îİœ?ºs:E–h“^Bo\à\\\ãşn±ú•©·†!`Nmú“½?ñš°•²k\ìŒ-7k+?¡F¿wÊ‹˜Ã‡_½\Ä\Ù`;\Ç\ÉYˆ\ç9˜\Ä	õM\ém¡0±9Å®ı0AÁ°`ôj±úW_f>#k\Ì&“2b¬ú-œğı\Êê‹³.%iÑ»8t\ë>‘eš$Bo\àœ\ãşT\Ó-›>®½Ë©´µ66¡¸C\á,‹\âÆ™c\Õm³ˆM³¶qk™Ê¨Z°8±xg\Zuc\îWÿ\0´?cf\ÜĞjú5b\é}U¦ÿ\0ş„&\Îs<ú\Ùö\n\Ç\éB5şµn:)øl³p\ßÃš\éO£Š\é8 m\Ó\É[}JÑfN‘Aö6¤RP\n\Ç\éM¶kñ·\æ•\ê›|ı\ê\Óñ{9ñ¯‚k\Ø`æ˜{¬~¤Î»i\íj«AÑc3\"\âl°;ş˜\ès™¼·«o ®“ı?\İ>9ù­]oG8ù«7\ÛT\Ì\Ãx]\Åtw7j\Ë&Ãœ¨¬qF!Ğ\İú¿²m»Œ|\Â_\r°´\Z\ê\Ó\ë÷C¦n.\åÿ\0\í<Ø˜\Ù\È0fÿ\0\Ö`x#ciòeõ±Vvoq\Ä\ÑH C`Á\è\ÔÎ’\ÚC	\ä‡\\\â\Ç\ïLm“N\ZòƒE›c\î(9¶3#8®½¶ŒM\İ{l\ái\Æ%b´²¸‰,L³\Î\âgp\Ì\Ä&š\Æ5¢í‡¸ EŒ\Ç\î(:\Ú\Ï©Ei¨DØ³kœV\'Y@ş\Ù(\ÙYÁ\Üw¢×´9§qQÀG,K\r“G$\rµ\")3w\\\Ë8ZqŠ\ë\Ûgñ+›ºö\Ù\Â\Ò1ŒJ\Åid1qX™gÄ˜ß‹«\Âi‚Á\Õx\ïX@\à£\Õ\á\î*L\rX\í¬ñ:©[qX,›…µ­\Ñê°Ÿ\Ú`¡bÀ\Ø\Õ~ \ÙüX\Æ1(k<DRel=\Å>ÉŒƒ¬\"ˆ±fk4\æ<E®(‹a³EöL\Â\ãY›¶³\ÄE&Qc„ZD ‹¬Y„š\çI±™ı\Ål=\Æ\à-™ˆ\nMl=\Å;©fUš\Äl l”l¬\àx¢\ÓC\"Ô³*\Í¹˜°\Òe´A @&õ\ÌÅ†“L³}œZ\ÍY™&±²kD\ëú¿‹\Æ77®f,4šÁ\ØB•Mb»l\áhbcº\Ë[<NúŠ\Ø{Šü>…úbV&\ámj¶³\ÄG8!gj\ÌM„V\Ã\ÜV&JD¬\â¡dÀ\Ş\Ü]gfm¸\0£Ò°\â\İ\Ç\Çóøtk7>\Ñ\ÛÀ¢ˆ\Ã\Ö~\Ş\Ì\î\Öõl-2’gWmğ\ã2?\Â›GÓ’\ë­maŠcvÄºÏ„wrVNi‘wö_†µ?A?eb\"u™uŒÌG´u&\ÒQ-\'«lšº?ş\Û~Ë©³Œ,\Æ\î+9\ÖrğVl³8z\ÈÄ„\Û{v¹\äFGû¦wb´\ßp²iÎ´û\'ôkH\çR<U¿\ĞV{¾\ä\îHtk7sy\n\Ò\'\çBÍ§:\Ó\ì\Ñ\í#ŸHñVÿ\0AN{m°À\ÂiÖ¸ÁpFSV;Š³úBxû¡j-ğƒ¹uµ„¬¶\ÄÀ\Z&B\Û\à\ïş\×~&\Î1n²6¯1µfl8”z]©&y¼\ÏŸd\×@¹\ĞôMµÒŒ3J\è\Ö\Ô.t\à¬>”L1·\ì˜}\Êu£m\Â#\"S\ÙjqP¬\0\çZKÁHüA¿Š´µh’}¡\é;\ê-\í\"Áª#º¶º°„mYm5\Â\â‹-6¬õVöM´Ã\ïºÿ\0©©­\à1®d\Õ\×ZZ\æšbA½gÁß¼øn`ï˜Š÷,fÕ½gW\á:LLğˆ\Ôf‡\Ãrh\Û`pˆÈ”öZœE”+\09Ö’ğF\Â\Ò?o\â­,Áp„QsºS@(6\ÍÄ†˜—rB\Î\Ëh\íü\ëm-`\ã<\ã5\Ôt’Mø\î\æ„ò¿hsÛªx…˜cn\Æ÷YZ†\Úü\ÍM|ZwF «_•\ÌL{ ¬¬\Ä\Ü\Ø\ÅtVº¢\0ù+—c¬Ÿº\èÖ\Ö\ÄÀ|\î±ú—G\éCYŒGh\âK•©ùl›öO·´gX\çsR•¦l8pMm³ğæ»š6\ÖV±kjZ`Q\ë5\Øa7u„c³a€B&Í˜ k½ZZ6³Šµ-—9Q[ô«A<9‘û«O­cp\Åf\Ãqt›6unß½ZZ6³Šs¬íº°ü»\×G\î*\Ï\é	ı\ã\î›ign\ZÓº%Zu¶¸ñBV\èö\Ísy¦²\Ñø›\Â1\\A˜+ğ æ—\àSXÁ´@\\÷Y\ÚK\É;K2\Z8ˆaf\'\ÓõV04CóÚ¬\áÿ\0l}\Ê\ê\í\É`\í„V<AÎµœGgfpÃŠoH³gV\á\r\ë‡Vö\Íuİ®n\ïü¯\Â[’\ê‰\Ô¬ş¶d\ç¼Á¡Z<j†«{;7\àv7O\Å1Ç¤M\Ö.\Ü	\n\Ë\Ê\Ü%ux†8F¦®0TEz©\ç´G¹Y\Ãş\Øû•\ÕÛ’Àÿ\0\Û¬xƒ¬\åÁD\çYÙœ0\â›\Ò,\ÙÕ¸Cze¨£„P\è\ZlšÀ\Úü\Î\â˜ó6–„\Ãº‰Œ³\ÎsFŞº0\ác\Ó,%š\Ò\èn<U•©.p\ìfÛ£\ÛÁ\Ä\Ç8ÿ\0t\Ò\í±Ì’º§‰n\äQn0Ÿ\ÜZ…¯Hp{„\à(˜\Ë2\ĞC£œ¬\ìŸZ `™md\æ ğ\è\Z\Ü\ÆÙ–Œ\'\æVVn„X\Ğ˜³-c¬¬:;f0&°L²€$	i±À\×	«>²\Ò\ÌµJ\ê\ÏH_f«i‰©<S\Ûd@y§›\\{¸pN³CªÒ­z+\Ü\ÂLp@§2Ğ´’\è\æ«K&ÀM[YYõ\Õ1O6¸÷p\àfC·jÛ¢½\Ögp@¨2İ\îyAı*\Ø;ºqV]Y`\Ãe·gó(ôg=¦Ğº1‰‚ƒzC\Z8•\Ş\Ü=¸aD£iÑ­\ày˜4-:]®8nŒcx\éA\ÌÁˆFwş+0bŒ#;dúE•³pŸ\ÜB\ëmiº	–¬sZ\Ğ3Š,£„\Úy«KvF_fE=\Ö\Ø\çR	ö@\0M5i\Ñm\Ş0º……£¤fòqj6¶¯´\åº\ãmfû6\Ò&+\ãtò\å‚\Ìw*\Ö\Ö\Î\ÖÍ¸œH\Î1_õCÿ\0‘É \Ô\ë;A”OG·\ï\ÂP··µ‹\ÄóJ8mº±nŞ¯\ë0X\É\ÇkÇ‚e«ÀÖ´\â‹(\á6j\Ò\Ç‘—Ã™‘Ou®9\ÒO²\0hy«nŒ_gjOŠ‹-¬\Úy8¦“\ÒDÿ\0¸\åò\"\à‹l­\ÆÁ\Ä!kj\ìv‚œ³e£u“lŸ›„¦Ú±\Ì\êš\èÀ\×ÿ\0Z&Vnr\ÔRhZ¡g]-$²\"Uf·ù-`¤A\í™\í8?W˜ö»¸şV\\«\çt®Ş¦\"µa¦\ÍjÃ»µƒ\Å`\Æw\"ß˜,6 ‘\Çz {s(Ã¸)-ñºK9H©MN¢\ã\ÃM\İ\ÎŠ\Ä#7J\ìÒƒNa<T&—Ì¨¦$ /‚‹jƒ7¬:(ûû{lÁ\Â¼®`A+¤”\Öõ\Õòü–Ïº\êeµú,\ãH™ÜµU`Txv\éh\0<\èQ\Ã+¤µJ…\á\ÍÜ€\';òV\ä\×\"º¬\ã¥%½QH)Wx\íÍ—rŠ\à„\î\ä\n0»	$8M§òQ‘5P³MÓ¢€„P*±\îP\r*T-oE­\è±\Z¢±\å5Dv2\Ø\ÌWFO4/ƒjal\ÈÅ§Š‚¤…gù)&™:G\n\n{– NeØoqwË¹\Ùv;\âœ”ª˜\î#±Zµ\ÆùV¸PkĞ¹†„\'Y»\å5R[\Ş1@q»9ğ\ä\Ğ!Zü\Ğü–JzG<‰˜w\î‚119‘\n.Q‡5gØ­~«™ß¢\'ˆ\n@“\ÉI–c½\È\0xE5Â«>\Ò\Ğòl–k\í\É\Æ+Š\ÄÁ(;ˆüª;Ê›`¹\Ê.tøE\rı\Ëz“}œ|E€ı\Êj@¬?¤\äT*…PªUUUBªªªªªª´?¸\İg\Ì\è­bhò [«\ê \İ\È\"\Ø@\ßûHM»uVõEE\Ã,FI¤­E„Œ\ë‰QuTp\Åj‚¤\Óæµ”Cšš\ÓP7\'4º14Xpø\ä÷§FTAˆ¿\â…oªŞ«v©Z¥BTr\Õ>H˜>j@\á2TZªP]e\ÅV\ïö­9˜\İ½5¤Q\0\Æ\â)¶’\Å\Êù©QQQQQQQQQS*ª·\×E<¢\Ê\ÂT\æ¥i\æ‹\í3»&\"N\âqš‘SQò¸rÉ‰1X7¬Vgu-9\îA¼j°¹²Z­P\ÂÕ»#yº¥q[\Õ#Ş¨B¡_\íMUoQ07P®\n¡T\İsJø`Ä£­œJD±ñ\Ş\ŞÁUU]<w_hªœ¡\æ„²	\È\åud¤ \"¦z8):òGsx.Y.w%„\ç5WÀ¬P\Í>ŠŠ‹}ôT[®ÿ\0J‘T†DÁ\È\ãuT\ÔÀT\ÈZH<\Öx{¹9\è\Ñ[‘¹€\ï¯rÃ;Â‹[®Ü¥?·_/[ø\än\\2d2#ˆ\'7q\ÊtÀV…\Ë¹.ja^7\ÅBh‘\ã…UE¾*y=[h\Û\àV©T¿uÛ–\ë·*\İU¼øª]Kª«~\ë·\ßûJ‚¢×‚¬TŠ\â\î¹Õº*l\nq6¹…X\ßE«Kõ²¡}Tq*€µ\ÔD|\Õ,B³ Ğ \Æ\Â\ç·\Äej\İ¢3%›hxY\Ì0\â/\Í0U‰SSŞ |\" /\Â5Ï¥Ğ¿‚™>jN_)_\î\íoE[¤ª¸\İU[µ•n¢\áu¤·ª©\Â²Í óQY\ÊJ4qXl\æx¨“;NtŞ¸…õX]ş”ò`+Yo+PªÁIS\ÕnóºEl‡z‚\Íh\"\Ğ|µ\îÉ¢\ÅiOÒ 2³›>!F\Ì\âp…ó¢Áe«¼©-h¸nQ5\Üq©\ÉÖº\\.œB‘P)·\ÑnòUŠ S‚ª\Ö\n¡Ty-\Ë\\*­eUSv\à¡g\Ígº\\.k· \Ñ¡‹\ËAA\ÜU\ÕhğUyğD\î\áóE\Õ\ÊZ«UnQt ƒ\Ãk¡Á\å‘E-	$O\Ñ+•ø˜Xt2(ªB\×\nn[\Öõ½A¶ªqŠª U\neT­\ê§\ÉUnº—r—ÿ\0Ê†j˜r¡/;”$\ÑÀd9…\ìuQ0\æ \ß\Ç@\Ù\Æ™\Ì/˜ø*ùª\İA‘\\bµŠœ\n›P‚\Öj¡T.[4<\Å/•ıúw¨pÉ•\Ç#pZ\åUM\Ëw•û—\éñZñ\ïUZŞŠªjP[\îRªL—zœ\Z³\\<–±Ny\ì\ïˆQh\'Œ\ÖpJ\nDª‡-X÷*9Q¹\Ö\é\ÕZWqTRª\Z,b›\î\çt”Mt©P(\é*ªª«·­\Ëw’\İ\à¸):\ïğ§\ÇÁJJ¡L5o\n«ü#8\ËC[\ÊóSÈ©ª•™Z°_2ƒ!©f\Ê °\îC•Á“w¨_ˆ\ïÈˆª\æ\Z\Ë\é:\Şxnºt\Ñ\â\âXj3\È)ªª Z!\à¢’˜!f•7z­q\â¾_\0¹-şD?\Õk\İ1u;\ÔA‡(,\ï0¶¤\'BrA#r¥\Ã\"MÊ™\Î[Ô‹‚ùŠ\Õ#½o96(¸\İ\0¡y¸”È«G\r\î\ÒKJx£–D\Ü|\Önr‡‚™U*d)ATª¨š|”\è©-\êP;¬SkVk¼.˜P\Z\Ç$†’[S½‰¹±:\ndV\0Èªù©9L¯š\ér\\21Ta\\‡ƒEJ\rá£†¼£{†\ã1£\Îo¢¢\ÜqZÊóQñR>ªnTõ[\Õb¨B\Ör’Ş¥%15ÀªµH¢c$^|4õRTº¹O5\"¿¢\Úz-gy (1¿2ƒ\ÓX­¸dûı\"=½\êAV\æ?\Ã(\äšõş/“b·ø*•´‚\×Y\Î[Š\Ş·š\Ö>Jo+X¨T„T\ì\Ô\Öjê„·»F2%‘Kª¤\å6Ç¹Cq‘¾°Sp¿ñXü”\Ôwd‘q¶5t‡gnAH¢8h©\')ª*·*z,\Ù*5\ËW\n\ÖZ\Ë_\ÕnóZ¾ª`\ß5TóF\n:\Zª¬\ĞOpZ§/\æUôT¸¯Ò¾\ÅgCdT¾\ëü*Bø\"\İ\à\ä@\ÑHŒWµ©A£p\ì\ã&\Ğ~\í²—\ÙT-eşT°\İRy\0¨#êµ—ú¿6\Ğ-f©ú-Tc!\ÉE\Ä÷F\í]Š‰\îŒ$r¸\İ0R‘\á¹%EYğŠ­ı\è\ât ˆ\á”m>hÃ¶¹CCòy­hª9P©¶\ê*ú]/EP|Td¦n“ıúS>anòUôNµ\Õ\Ê\"Í…\ÊC{Ü¥\İ\ÅFû\ÛÁl]à³¬<\0¢\Õ\ÍF\ê)ª-RªB\Ö7M4ó»qQ\Ã5\ãúP \Ürb~s\Ñ\á’\ÛQºGE5½R*¸T}NE\"¨¤\Ğc\ê¤DTÇ‘Z\îŠ˜+Š A¢uÑ¾2`æ¶–j6®\Å\È)¨\â8…½FŠ¡H\Åg6|D‘u™\Æ\ÏP£tn“•\Ût¤ et“k]2.‡¦ˆ¨Q‚‚€¼\r\åğ\í¤\ÂKXd={DGûPLŸ+§5! «æ £…K#xR#\ÉL‚¨¨£C!±Éªƒ† £e3Ê‹\ã¶\ÍĞ¦ \îh¥Bª•ôSRS»ˆMj’\ÎzŒTJozˆRS$#f57\è¬\áºjp+UoU>K\æòX›N\Æ\Îc$˜Rz-\åN\Åky…8-\Ê\å\n·UN«qZ¥p\\r7\'\Ëw%5ñ\Ä¯™\Ç÷ w\Òù\åÁ­š¬OR|.Š\ä›8\İù \æÙ—7\ì£\æ¤\æ‡¿\Ã&rñ\ìPV.\à\èd‘\ÅCCó(ÂŠDB±Uó»U«P«¬¥h¼\Ô\ÍÛ•U\Æ\Êo/¾D©b)\Ù\íƒ\åv\å;o µ‰\ï\È\ï\Ğş–ñXY¬¶Š¥D˜(FI­¯“‹y„\è\Ûb…^`¡2T‚‹²ŠıŒ@\ïß’ôtLb4a}›±|¨A\â|U\Åô\nmY®‚œ\ÒÂ·)€V¬</Ş¤T\×‘X,\×(5jz©Dt\Í\Ó*š‹ƒ†jÌ„\ÄóHC6*X;‰REL-Ÿ©Xº¹÷•©\ê¶~¥l}\ÅN\Ë\ÜV\Äù•²õ*LeI¥@6½S\ÕC«h\æO½I«UA²\nª«YUUW\ÑW\ÑUUUUUUUULE	)\"Ç¶ óYŒ‡‰TTTZª/²‰\ï+c\î+c\î+c\î+c\î+c\î+c\î+c\î+c\î(®³ªŸª\ÕõZ«Ujú­Uªµ}V\Ï\ÕJ\Íj­Uªµ\ÔõZ¾«S\Õjz­OUª Y¶^¥l½J\Ù{Š\Ù{Š\Ù{Š\Ù{Š\ê+c\î+SÔ­Ÿª\Ôõ*vQş¢¶>\â¶>\â¶^\â¶^\â¶^\â¶^\â¶^\â¶^\â£\Õz•³õ+g\êV\ÏÔ­Ÿ©ZªŠcjª½šJH)?,£\Ù<<¬TÂ‘Šªg,¡ÜŠeUUUI\ÊG¶S²\È-Ã½OM).+VjL)3Q\ĞCz¬n­ò7VD~Y‰\ÔPn°ª\ÍÈŸˆ\\d%PŠ“‡\åXĞŒ{”šz›£Ü·ù­şk4ù¨\Z\ée“\Ä(o\Ñı~šŸ<Š~IT\Z\ÆÇ™Y\ÎSt\Ì|ñš\å#t\rr%\Ú\ßq\Ê<²&¨©u2ü2Ge®’Wsà¡‹ä¥‘0¦{Ò¨Q…\ÑÉ¦Iº\n\ZG\Ür9i‰\à¼{}r`¹^\\NµÀH•6İªJ¢r¹ÃšFõš©i\Ïu\Ç,·\ËFZ 7¹Cò­\êW8ğ\\\Z\0‹”Ô–°òZÁ\ŞHœ…Ó¹Ç}€w]\á–\Â+E;õ†_r\Äw\ç»Ã´OK\ÉC…\Ì(/°\İˆ<˜]5\\Šö\Ü2\Ùİ“œ‰3qş\Í]\áu.„ò*¢ş\ëğU»\Ô\Ä\rñUŠ‰¸.SB2O=;\înP\âVqŒ)uk\n\Ô+8h\Ç`¢¦ŠwK$]EP{\×1y€c»ÑGlG5 \ã!\Â\é\å‘.\Î\Şû‡~SG$FL\á|Öª˜Rqñ¹ñ\Ü{-/ªÖºªº¬<Aw®D	•õÊ˜È¥\Ñ*+vU49Ve<\é\n´ò\í\ÔËª–õ:Qš,&dSš\åtî‹¼–(©\Â\ĞÔ°ê»Z¦ú_K·\åKLPG+¸\åg)\\\ã\Zd?¹Gõ\"ñ‚\æŠ\'’‚e\Ü\Åaõ\nG\Â\ï\Ò7•ˆb0Rt¹j…ª·ª­e¬ûT[òw-ÊƒF\Ş\ärˆPpÊ•\Ğ\ÄNC÷\ÉÇ¬µ•e}A[®¢¦M\Û\Ék½qQ¿\á÷w­X­P4m+\ÇAU[·y-P¦.‘Qˆ†¹&ÿ\0ˆ•˜¸ p\Õa´J—g\çw%Áq¾·S&*}n\Å\Îò fB\êÇ’\Ï\é\Ó\×ET\É7´òÈ‚8µqE²\Ê\à³\Ìa\Ú\0QF2R»€S\\”Ç’”\Öñ~n±¢\çsx\İ02œQ¢l\ãÚ¹\ä\çZ¶+\\Ÿ\é_\ÏùwBY8‚ª„@\\\ï‰\ìò\ÕQQ@‚¤¥E\Î\è).*J.BEÒº·x…< D\'\ÍLd=¾7\ï¾=‡ó´&¤|Z\Ã\æ¥f\ß³.™<ò©\ë+6‚õ\ÆE\áw\Ø\ç5U\ÅD]\ÍN=\Â\î7IgÍ£õB€\\\Ğ%\Ñ%L­Ê¡†QEM˜Oz ‡R\"B\áw<˜]º÷h1‰(1¾%EÎŠ\"ø¬#Y7\Îü\İÄ¬\æ5Ã‘Rt;û\Ñ\â©pÃ‘E\ãE5„y,\r¡©\àƒ|\Ór\Îÿ\0\rpÜ¹*]¡¾\ÉsUŞ !÷º™&\áf;Îš!s\Ê\ÂÉ¿\ì¢k—\'(;M\ÉbŒ¡E‰\nQUD(*©\Òş*FAI@m¢6\İwŠ‡U\ê[?U³õB2vš\Ì\×5JQB0â‚—ª\r\"%@qRPDQoŠ®QX·š\"\çöoEÛ‚¤T#„r\ÑÈ‰qX‡“;\îª.õƒ\æ¿\ÒPPŠ‚$]„P\\ñ¸ \\µ|”†A\Z;9	#()‚¥ »\ÕO\Õx£I•ÁH,\æÁ~T\ï(\0f\ÑùDq\ÒCvõX #ˆpUSšy\îR’\ãÜ‚\ßâ£‰MK~\ë /qŠ\â o¥\ÎÑ·”n”†ô\Ö\á\'‰G’õ\ÉVHô®je¹wN*kÂ‚÷0\Ğ\ÍP£gdY¼şŸÈ†¨¹\Ñ‘ ;”\Â3*N!\nÎª{‚‹¦J†óq\î\Éu“µj¢FIÑ²$\ä\0l¡ı”Â­\Ğ\Ä\"%†[\Ö#.\\Q\ä¾a\â„ùh‰J¨~›Øƒ´xò\ì£LI\\Æ„gW%™\noXœD[„\Å\ëG+\0°ºNR„T\Ä\Ê;\Ü(¸\ïSª\Ê\ê^[˜Arº¨i™f\èJ\ï´\îQ0‚„V\îJp*G9Ê†óG3Q\Ã\á&\Ë\Éaœ9_fV(BPüˆ¢oªª¨U\n¹2ª\İ\â…0\ÑE˜K9¢Öœ.>*eqC2\\” \àPŒ—|\É(@	¨;4\ïN³vpPu77Yq^7ø/\r(¶p\ÕC\ì7®(nSB@¦—I™\îUğD‹\Å@T!‹}+U/5\Â»¨ù#[ıF\æ\Û0\êœ\æñ\n ˆ¹P-@µ\ÕT+\æUrY²ñBp°[\"÷ñX\àH\çUƒŒTpŸ2T”T\à £ó•º²GÏ\åG}<‘k„\×sT/ğ\Ò^\í˜õT$©\ÍoŠ¡%g4\"W\Ërÿ\0*1Nş\nL9¢2Ä x¨jYŠ*\Æ+Œ‘Œ†\áù#Ä§;õ\å,›W!e»•Ur&\à³X÷x*1ªa\ÅPX.a:C’ÿ\0h’\Ì\ÑNb&Ş£œ†Tğá‡’\Z°DqTš\\\0à°»\ÂSš\î\n\"ó¤™\ÍmP\Â)ºg74 Mw­Ë¹D\Ö\è|°‚\á9!\Ä,\å\ÍnŠª ¤œuIù¸AE\Æ\'·\Ï*\ÎR\Õ\n«\Ö*;\Ñ/ Af6\Ñı\ÍR²k~·)\ÛC\èj\'w¹I ^ 3¸¬B$\Ê$aQ\êÄ¸”\\YºHGw #>c\Í\Ü\Ñ\Å\ÍŠ\Öynõ&º!b\ÃñM”D{–\å\Z«N\0\0¡¼4£÷$Qq+š\ÂVa!C\\e J™€S\Í\î*²E‘\nÃŒŞ·F\èc?24ŒÑƒD[¹b‚\ç,!D\Ö\è\îX·«\ä]ÀF«5³„F),\ØO’p?tq\0\ZxºJq¾P\n=g¢ÅŠ\'¹1\ä„\ä\'.jŠ7\Ò÷\Î%\Æ*«_\Ñkú-¯µm}«i\í[_j\×ôZŞ‹_\Ñm=«k\í[_j\Úz-§µ5\Â\Úm1\ÕPŒTq*\ÄÆ¨\ât{„œ\Z7tc‡¹kS’3ôP\Ğ+#j[–,E	ú-e½V\íl\ëz©Z\Ë[\ÑG¢\ÖZ\ë_\Ñm=\ÛÚµ\ãà¶‡ø¨b>J=w„·¢\ÖQ\ë#TRyò[OE´ö­¯¢\Úz-xø*¢\ì5\İ‡\n\ÕõZ«S\Õb„%ª¨µ}T0z­Ÿª\Ùû“¾hA˜P\êü\ÖÀy­Cü–\Ï\ÕC©õ~i+¤¦%tò¡t‚Š¥Ó¾—È­\êF\êª\İ\É`\æ¬\æŸğ\Ü`µŠ†ş*ª\ÊkpS‚•œVuœ<Ua *—QEVj*WMU@(ˆù©\ÄUUf59_ÁË±MD¢\î%Nşwó»9rS0¨6œ\Ô&\ÓGE.\Å2b™Ê.ˆQ¿¦û°»\Ï\"7p\ÑÀ(º½†(\ÂAEJ\é\äSE\Ï5‘\r$¹DœJ•oŠ•\Ğ\È+r†G=w)v \Îj\Ê\át‚B:99´³ü¨\İE£“’Î’#Dcwzš¤—„U\í<8\é\å¥1\Ê<”T2&r$Š\ÕË‡irTTQ\ì\rÉ®Dû<² Š\ïSĞ•„\è&¡; <B‡c\ÅÃ²œ²NP^GDH®jHvC\Ä\"¢T‡`\0(h¥\ØO<˜^` ¡¸*h¹<{Û¹¡£\Ö\É´R¾ªª¹G¹¬<2ñq7R\êhƒ¸\\)¨	ì­´ª¢±:şYO#5Lª\äIs:jª\å8¢rœyä…Œ\Æq+õÃ‚‹À‰Z­óZªm#Áwr]]\"5¸ \çÚ–\Ò\Õ+wD(9­p\äT(x\ês9\'Ğ\ËE•C&y5º½•\ÎL2J9,`ùŒR%f\Å\Õ\Ã&Š\ÌaŒ_%¨ÿ\0\â§.ñq\à±b$p‚h\ä\í\\¥mûš‰\İÅª!\Ñ\ë	2\í\Ğ\È\ÍiqR³Ô†sŠ\ÏHwF\àš\Ö6$£\Ø~•hJ\ÍyZ\ÍS»Pw`sa2rFK,«©Z94B§*\Ìş—\ÅqS5\ïvhA0\0I‚Ù•\"¡\Ä\è%tû1<‘\Å9\Ë&‹sW;\àj/¦Cû\Ñ\ï\ìÀ\äC‰Ê²<§z\Äk•P~­\ÊNiñSp\î­t¿H¸~\Ù]+CÂš\Ü;+»‘\ì6ƒ²\Â\ì\×!£.\Î\ØTŒ\å$#—6·\ÉD0\ÜX1P¦\ì\'ƒ¤µ\Ùæ€†iº¾ò‰\Ü2#\ÕZSq\É\ê@ha—\ÍMUbi­ñPuoğ\Ë6˜@q\ĞEMHƒs\\>j®*M	šY•!u4R\Ò@!\Îk8\Ã ¨fK$Dh\\FL\Í\Â÷e·\é:7\ÉpS¼r\Z_\İ2¨ \İ(\È\r\È(5@]\ë\ÇH\äˆhTô\0\î@÷?¿-;\ä4r“@\ß4\ÖpP¢€½\ÇIE+ N”d7—J%In»V\à\İ9Ê–UKû\îS )¹P• 54”\è#H®\æDV¡4Z\ÂÑœ[T\ìG	<Be £q;÷h\àr:\ä\ÄU4º8F\à€e›¥ûTH½U”RiR’\\{V²”Öª›€X0\â<TšĞ¢µrğ\Z·*\n	ÃŠŠ-`\Ît&°‹\à(4dv8\ä÷K&À\Æ\Õ]\ÊFHa¼Saq¾\'rŸc’™Šš\ÍÒ‡6¡bnƒr¥øGL2Æº&Êš®C{”/ÁÆ½ŒpX[NÃˆSxâƒšdrc“*œ±Ã³\ÍIQW û›\\ª\ß\Z›£|Mñ\Z:dE\Ù$iñ6›\Â\ÄÓ ‰E\Õ\Ê(ñ\Ğ¦4“*š\0ö\Ô ö\è% ‘ºaWK:\äÁ‰†\î\â*/‘»‚™‰Q7K$Ç‚.\å—$.\ä¹\è\'%-$E\rBiˆÊ––ªjªwFø\ß¹ö@\æ\Õba–öŸ—ı*_%<ˆK\Â#(\Ü412R\Ó\ÄP\Ô(´\İ\'AI\áMÁO°OG\Î\â‡a\ÄÚ©;a~\ßò°´ag=ú·\Ê\à@’š¥Ù¹#&½›“»\ÚTÁ\ÍIO²G&J\"\á\ÛAt”Lx /‘¨¦É‰‚…¨\ÂT\Úy´4p’\nZWÛ°»\Ï*9N7R\á\Ë+§Û°¢8ö8i0ºl>Š9bøqºŠRCòÓ k´\Ğ\ìP;®‚,]²õe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îc\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\îe\î\nv~\à¶^\àµ=T¬ıB\Ù{‚\Ù{‚\Ù{‚\Øû‚‡S\îF\ÊP[?p[/p[/p[/p[/p[/p[/p[/p[/p[p[p[p[/p[p[p[p[p[p[p[p[p[p[/p[/p[/p[/p[/p[/p[/p[/p[/p[/pQ\ê}ÁD\Ù{‚\Ô÷³÷²÷²÷²÷²÷²÷±÷ı–±¢… \Âx¨´\Ä\ÈK@‹\Í\ß˜òC¬†.Wáˆø¼#ˆğ0ú©\Û?À­­§òRµš›¢›ŸÒ³‚€™X7ı¯.4h©Nµü<K¿|\Ö&ÿ\0\á8ÀXfş÷A\æ92Q\Ä\ì7\Ù31€\ãY\áo\ê\"\ç\Ù\ÃTv&\Ø7Ö„Düj/0\à7•\rVp]c¨)v~ª/k3Nõ˜‹í‰«`\Ñ\İq‡\ÌÈ•`Ãª]\á}‡ş\àOp¨iLD‚›¾\n\Û\éo÷¸ae™5w>\ä#_ø?š\\óT”\Z\"¾! ¥dÕ¨\ß$\\\ë6\Çr\ÍtG…\í òX Z\Ñê¤¢Ù·{Psiw[e7Q\Í?2€\èö¸¹Á9ö†6¬7rPB\ÒÁñ\âÉ‚‰{0\r\Â3VP|M\ØpK/–\ë0j÷ \Ö\ĞI=\İS\ÜÑ«\ãvakM!\Å9ø1´w€E\î1%Nˆ9ò³û¨4@dA\â*6y\íõQ´yôPpˆ\ÜTé¸¨¨üªˆÿ\0Š\ËQ²’\Ä\íFú\è`Qc¦Ò‹JÂº£ºŸñKB+K€A \ÑSX·µF)ü\Óÿ\Ä\0,\0\0\0\0\0!1AQaq‘ ¡±ğ0Á\Ñ@\áñP`pÿ\Ú\0\0\0?!ÿ\0ñ[ƒ^´«ş®)`\Å\×÷\ÖğIÁO=.\Õ\ím!\æ\ê]”d‰i*\êº\ÊZQ1I’!§\ÊT^\ë˜\Â,*{L\Û?\ì\ÙSC\ì\Â5\Z\ßsÔ6dƒü¶\Ë\Ú\08^\İ,h\äO=.\Õ\í\í!g¢Ë¢€«A\ÌHsqóö\â¡f™#d\Ñv »M\r3¯\ÌŠ¼˜ı:RÆ®³\Ñõé…°ùš¤K^´i¡¦uùd\éNA\Ë²›\Ã\n,”‡\Zò±PiN±\\b\çtv`@…™\"\ZGÊ ®b\Ğ\"ª:(\ÉÒ¢\ÑÀ‰Œ(]SÙZ\\\ê(\çÒRD,¨%­¶üŠ†\Ìı#hK ¶\Æ_,\áZd½ô\Ìg=Wû4G\n\Î%\í\0/h\ÈÀ^Ş”\nx½·Z‰e½¤…¥B\äG\ÜRóWıA\Z§Í¥Q\í\×Ğ µ©A><w÷Šf\Üoø?¯¥|\Óö\åòC\é\ÃO\Ùøœšª\ìòOñ\á±ó/xú?\×O¾~ .íos0s?·=…ß´u·‰\Ö©ú~YŸ «2ı/3!¹™B¾;ò!ø	ùÓ˜\Û#\ç\ŞÆ²‹E¶Üÿ\0xŸ|ü\Ë@\ÅûW£\Ñjy¢÷Ÿ·5\ÑZ~\Ï\Ä\Õ}\Õ\Ù\äu“<>e¼®ÁoGú\è\Î\Úv8ı\í2Nåš·\å¥ì«³0%&½m}a\Å=P\è3\ÉN}`Ä z–ş.\ï\Âa9\Õ.Gnÿ\0=}óó;Hf8eÿ\0yls\év²8¾Ï©,§\×zdş?ö}³ñóRÕ˜4\Æl\r\â šx<ÁY¹\î\rz\æU}o\ÜW\ÌcN\ï\Äv\Ë\ÓïŸˆa¼r\Ìt\'q“\×\Ö\n¿\îód¡±ƒ}\Í9—h^0z\ÏlõU\å¯IÂ…Y2\Ò]\çÆŸ/\æ^Œ¾Ó¿¿\æ~\×Ä³ d\î1\è™ş\Æ=Bášˆ\Ñ\Zõ…I\ØúÒ¿¾‹\"¹\Ó\Ù\ç (sZ\"+\Ò\àòK=~:~¸\ÒYc¶\\:V\\›ö&#ºñøû\Ëû†uûKk›ß•P3_1KfŸ\äC÷;„Î¹U~\Üpp ª+\Z¡w~É\ã\Él“†^·‹â¡¬Ï¾~!8ƒ¯O{€z¢÷£ÿ\0PqT¡§Ox\ç\Ö~Ÿ–,\Ë\é\á\á*…;i¶;z\äg)Œ\Óp…¶ñSù½~LD\æQwÁ\ß÷™÷\Ï\Ì\ãWûYt\r^pÌ¥°«\ßı_\Ü8h*ŠÄ¨E8/\Ù2\Úyg\ÆIF\ëI¼_-N\\Á\"»Ÿ\Şñ¥\\oˆšxII^MKòÁXÕ»N5UF\\g\àù”õC ø†CŠõ–iU´e— ]Ï›\Û\Şú\Êóö\è\ãïŸ™\éFc)š?”l§¦7\rø¶|	ö\Ï\Ä\à–\ßv}c\áïŸ˜ ½#=J’&\ç\Êz«ó=\Ó+@+ 	¦}óñ=5şv¦,}Z~}%•“\Ãœf(0T·ÿ\0…\Ï\Ñö\è\Ê>ñ¿´©÷QH7\Ûj»7ƒ\"ÿ\0X w\ÊEÃ¤\îUu\É@\àQ\æ)	µ\áôè·¢\ß\Ø\è\ÔøO\Ì\æy;Š3-¬R3\É\ë\Óõ¢ò\Ãyb¤g‹¿\ŞUE6NW‡\ïA›(¾*`\Üh\åA\Ğ\n?™R¹¹ı\Ù]\Ë\Ç?\ÌiA«vË½½\Ú\Õ\â\ê%°m¬ün\Æ\é\ìt±\å±cñ0´ô@t\Ï\Ñşò¢©cÿ\0|¯¦£V=˜*KI\É\ë5‘,vÚ˜av\ãq@wb©\é{Û”<µ…øz#++E\Îñu\Ğkke\ŞŞˆl*\Îñu\Ø6\Ö~7\r\ãuxtK\Ü`®o\âi\rX\äı\Ğ D¬1S4\í±\Ã\â8:\í\Úû\Ã*\Z±\ìùŸ£ı\æ\Ó\Ì,\ç\Ş\0\"Xñ»ÁñrCk\ï2¤v5‹©C\ËX_†~÷™;ü–\ì®òÇ–ÅŸ\Ì\Â\Ğ\Ù,ylYü\Ê]šW_\ËÒ‡–°¿–…\É	+\"şYqTµÿ\0¾~÷€\0h–<¶,~\'\èÿ\0x’·C+,h\'ÚŸ³Q„K…¶Â\Í¶;ku­úÌ”Í¥_¯ñbwl*ı%r½öB†€;_Ğ­úk§|vÒ¯zôœ\Ùv‹\å›1\î\Ë\Ë$\ç;\Å\Ô\×\ËWGáŸ£ı\à(\çû«\İ\Ş\æ\Ó\Ì,\ç\Ş\Ñ\Ğ\Ûi~‡K\ë‰ú?\Şxm\â90)öt¸E\']¦W\ßşv…Vû=\ßK@¯\èÿ\0\ï“Å¢\É\ç>Gpÿ\0\ßøÊ’ £ı¦÷\ÙMT ]W\á\Ë÷ƒU;øˆo0÷E\êòDvZ;Yÿ\0¹ıCˆ\rç¥€k\ÒV+œrBšÀı\æH\ïú3%Y\à·\àş\åM§¿\áş{Gg%Ec\ï0¥Gş\Ña\×v\ãÇ‰P?\rÿ\0Qq±À\×\â4Q§ú!«\Ã\ìgl™ƒûø—ù>	ŠG¬p7ıG|R\Çÿ\0_ˆ\ÑFŸ\è•\Ğ\ãÛ´e™Qø2\Ğ\Ë\é?Q\Ú%\"\ä%¯†=²4\\?UŒÀ<rÁm\Ëx+µºs€2¼2‹\Ú{0w\Ö\Éõ:*_ÖŒ&b¼‹‡\È\Ï\ÏL\ÄJ\Ëlxhw¥·$€f*\Új\íÿ\0E•\Ç/ó\Ş;€Àp¥Ÿo\ê	¶\×\Õ;3“_ú¯a`¹Û£\Æ&9Áa9\éB\åzs)ö‹Sx\Û\"ûV°º)\\m\å \n\Ô÷\ïTLšß¡\Ú9p–\î—`\á…Xµ\ÜTrÍ…ù\ëû+\ä—KnH=\0\ÌU´\Õ\Ú=ş&‹>Ÿ/ó\Ş? Àp\ØûKY\Ø\ì‡Y\í/½aE\Ğ\Çz\â,pÏ»´tU—N\çiheô•øöO‹Ô”İ‚¿ømœşÿ\0cœa|ú@u??\ÜK:\ã\ÄCAªñuG\Úa»ß’”$@\ÜÁ®õ·O¾~\"_C\'!Ÿ\İ\Ã(°|ÑiªwWv”E\æG³.\Ø\'6<˜˜·\Ï2™bĞ«\Ò#\çeù:9¤öt?\ÜQ\×µ‰¾n>\'&\Ë\ÅK„¿d\İ§\àŒ¨y¾‡?9*Á»X\çñ6ı\Ç\Ä\Ì\ÔFs‰“\Ğ\Ë\Ç>ñX4¿\â~£·F”#4‹Ÿ¸\Ä\Õ_Xm^CúDM…øÃ·B.…#\Ì~ğÚ‡û˜\ÒÒ„QZ»i,©/\îÌ¶Ô¥yEù™z\ÈğŒ*‰n\ã‚+J9\Ìb\Î÷‹ÆA\Ï\Îb«òÌš`Q\Ñ\×]ş \ÃVn\Óğˆ{Ø¼ûuxK†Õ…õ$}Ò´ª«;)Ë´ óFòú4÷tõL~a\Ì\Ù\'\Ècš\ïƒY{Vı¿¨dI\'\Îı¾\Ò\İ\Æ;V”s˜\á–-©Àû\Å\æˆ \ç\ç1UùfM3~\ÅÜ\Ês\ï\è@¹\ŞhË€\r€ör~÷‡t–‰„!£¹\×\ïx¶Ğ¾Äµh\" ;\Õ\Ã[¤¨‚>‰\Ï5GkuùQµÜˆ\è\îµ9×™b,œzDë˜–\Ò34Í¡®U²~	sõ«	d¾›&\ë±*>$™\n\Æ5ZZ\ß(²\ä–q£\ÖjöW$\æ6{\Ş_…@\ÌfÙ´±U†ƒ\Ìu+p÷\ë\Û˜¤$¢ûã¼¡L–^=#\ÏGp—VEvº€l\â/\ç–5\Ì%\ß\â \îh¿\Ô)±+\ÂØŒy\r“·b‚¿×ˆ\ç÷‹R\ïu*¼ğg\â.ATg{‘Ñ£yƒÙ¸\ìÁ^¦m€vñ\ÔI\Ãdp®\İ–½›ñ\ïf>¤Ğ…Á@ğ¯o1óYOˆ_XV3^\Ú\æ$\Êc`\äuk„½^¶\ì\îd\×ı\Êá‹¸>¡‘”p\î|ô%\ã¡<ø\æ\ÇŞ¥\ÓV\ÓkÌ±³\à(¾	û\çõ›\0²¤‡0Y7û\é6‚eò\ÆN\ì\Ë{G\0|*nV8ôG\0KÂ½¼\Ç\Íe>!=aX\Í{k™ei¶@÷ \ë«\\\'kù‘z8ı¸‚†«?õ¼\np|L\ë\È-©x™}H³³¿™d¾›&\ë±+ „xqLHª„q\í¯ÿ\0´YŒ&+\í2\à¯Yzû\Z‡%°´\Ñ\Ü\"\Õ\Âm\Ù\ßø»!¸b9ø\Ë`•+*f”¼•–Z ?\ìŸ\ï§Û±ÿ\0—r‚\Å{yÏº~Siü®\å\"¥}\Çq-k\Ò\å°5?\ï\ËZÔ¹vEZeôS¨\r–*ıÿ\0ƒ&\åì ™>ûÂ¨\Í,¾f\Z+¤4¬\ŞJ\ï‡ó_òƒ]\äL\Ş\Ô\ÅÈ‹ƒñ¨s\İ`?¸	\ä@Q£\ß\Ñÿ\0\ä=³¬% ´§¢œTJ‚\Êü\'¯C.U*ğÔ»®_¯\ïK=\åµ\Ô\æQßˆl÷\à‚•Gü¢E£1Átk÷ˆ\ØQ(\Ç.–ù\ç\Ã+‡\ìX\×y–&n\ç\â\Ğq\0c¯ş2\ã`\\µˆ5ûB@˜WB¦`J\î<ˆš€C½ıoC\İ1\r]aº7\Ä=J¿\åi®\n\èX\Ú\èô*RA»6qQ¿52\Ğ÷¸¯šs\ä\îY\n9¸O¿¯ş.‰t¦3E¹Mv \×3\Ó\Æ6\Ø\Ãõª:\Õ\à™Û²ğ\"«\Ç\Şc½)\Û`A\Ô\rGşIO\Ä5q\ØJı1ƒ[°»s\â,;ohóÂŒ[*\è\ÜÀjø\Ä’šMÿ\0ñmÁÒ©„î‰ F2Š¶ D\r7õº;tM™ox\Ç6û\ÕpE‰)\ŞQµqÁJä—¬G±ôUG\Ó\Ã\Éf+\å#Rõts\å)uZ\Ü\\Ü¦\é.\"iR¦}\æi;ü_\Ï\å\Ê7÷\Äb>‘Z,9z†W{’\à\í09 \ÎK\ÌN†vG¡\Â9SR°º\ÇÁ–\\v†ú”—4^m­\ÓGş\éÛ·Kú£O–0\í“	†7(”1S)*œ\ÇD=˜z\ÅL²ó›\'úñĞˆM5\Ğf:‰d.†/C.\âe\ŞË‹¨\íA®¸\Z•#\Ú^L¢\Äu-½‚\Î\è4H<@­U\Ûpl4L@e\äV\å\Ì9M±\Í½(>¶ş›ú(\Ğ\Û;\ç\Ş/‹Ù—Bx—.\\¿ g)K®\ã†`\n¸\"[ø/\rr\Í&\n³Xó²EH«ºD`\ÕO\Ò_ğ\ßügQ(\ßQ\Ä\Ø\ë,Je”­\Ç:\"\ã\Ã4M§xñR‡Pk‚dfñ*~¹mw^ı6ˆmb?pÜª\æ\rVL‚’_7gó\ÃĞ¹r\åË—.\\¹r\åô¾€8D\ît\éMË‹¢ˆ\Ó\ÛqQ@ñ”N@fé‚›\éKa^\rùˆ\ì\Ã;#!\í(­]\Öş‹ş;\é}.\\¹r\åË–K%Ë—/¦o=¯¨®¥š\ËB¶#/4w(]ó\Z\Æ\ê|BU\ê\ÜÂ³¹Hl\ïÜˆ1òf™`g\Ù\ä®h¢\Æ&¯\Ë1”d!†	P\êù•oi\í,S\ÄÀğ%M\ç¯wşôÿ\0Ö\Ìğ¾gó?ô\'ó</™\â|\Ï\æxŸ3\Äùœ[ÖoŠ\Æ\åf4\îJw\êR\\¾ƒ,)§˜`6‰Z“³„`08&\rKfˆi›„\ÌÇŒVb*ƒjx\è_K\éUı`\\¹~e\Ëú”w´x\ÅÁ÷a\Úü\Ç\ì`¢\Æ\È1‹Kú§†f\å‰ø\Ô\íõ÷qŸõ8M\Ä\ÄA\Èfk\é’Aq\Â`;\Ê®	H›—*\ËKŞªb/3j*C•	º%u\'\'I”\Ğ\Z•Ú™}£À\È\ä\Ä\Ïd”öe†ğŠ%^¼L\ÌlÀ\Êÿ\0\ĞÃ‚y7*\é\ê\\p\ÌK­ª\àz–Hª\Ëgaù\'…ó?ö\'ş\ÄV!G›‰H\Ö\ìVgı&§™ù´_5T\Ò™”À¨ùg¬X\Ô\áØµ\âS#•Ó™u@\ì4ğ%»!\àùŸµ\Êÿ\0\êSÿ\0sÈdñ3\Æ\Ï=i\êOi„¸\'0nGMı\ï/¥\ÊVó/r¿¨²Lf¥»\Åp„Xv\ÈU\âQŒŒ[\ßW|£ùb\Ù\í+¤J+\Òi¹±$5‹\Â\Æ(« \æd^‘Â•˜w,zs,ŒP\ë®§3œ\Ş\Ïi²\Ó	{½\Ğ\n\âá\ï\n7V˜³•…\Z”Oúœ„<\ËuŠñ1\Ä\ë19\ÃÅ®½\ÄK\Ë\è%O\Ì_\ï\Ğß¼ä“|;K¼Åš¸ñ/\Â/™Kª¢•ˆŠ\Ú\ë,\ĞÒ¯¢\ÒG­l Ue¡¾\Æ)i%)\Ì\ãc\ë›üO\'\â\0\ä=\ç5v\Âıe£\áû\Ì\Ş\æe3\í7\á+Ÿ\Ê_d \ØC	iP£\É\0ózv\Ã-Ü—s[—º•¡\ê™:‰´)‹\åŠeC™€µJ}\Ø•\âYÀ:\êô†d·y`ñ¢Ø¥÷\".¾I\Ú&1¹\ÌP\äA\rœ—)\êA\á\İ³gf}\ãÎ¾ş\ĞU\Şf—}\0-\Ü¸¼%\êX2e\Í5Å¦4ûaWT<¤ h¸*\è¯Xy\Ğ\íà¯œZ\İ3+¡Pª¾#B\ì\í\Z\ÜEu^nZÆ‹<\Ë(o\æmKŸY÷@ÖŸº\'\"^2¯\å‚d\rVû%\íl\ÌU	L\Ñ˜\0—TœZ>.:°Wˆh÷–¸(]¬v‹2\Ïf\Üi¦kRÑ‡7²\rm+¼§wÌ¤\í‰O?iN\ÏTQÍÚ\Ş£º–\ßÁÿ\0È·´·yO,Å¨GAóqñ”qQ½‘Oû#fq\ÒX\Ğ[¶ˆd(*hX\ÆcÓ…\Ì\rÜ¨\ËB«´\Z®¬!\ÌR¥\ëA\à´A;Ê˜%µæ’§{ˆ2Â—»ğ\n…\í¼$ì•‰O–\å…\äÌš\âm\n\r!Xw¼±Ápƒ 2\äzJ\ä‘{	\Æ(õe^şªÄ¬ \àø¥OGq)\ä\ÄyA‚\ï1ñ2[\îZ_|\Îv	—7÷Z+\Ö[Zx€\ÕqÂ¦„\î¼`\Çrg–~~%/N<G´1şGn÷R\İe}\æ5Ÿ¹±r\Æ/4	\Ü\Ô\'¹š^jHX-½\ÌJPı\Ò~P¢¾(UY’\ÕGÌ½0ú\Ë.‡¤\ì*|’Q)\é Û–v¬©R¥L2“&[œ³r¸®\Ø,\rˆ²¤ª^^±j£j·…»‰\Z·‘5‚\Ü°\Èóˆüœ\Û)?¹\å†Y\æ{†\ÏŒ	Ñ¦S\ë;\å—Z¿1!\Î2\ËTòp—\Õ ¯\İBØ†Q·fnmmš\É =.-.ƒ´+x¾ ,ÍˆV¸~\î;¨Ä†f\Ü(\ä|”­ló˜\í!À\æ£õ\âc›÷–\ê‘Q\\ºo\áˆ\äY\\şS\ĞyT¸\éö%\ÎŞŒ+ŸºcŠ#\È&7}Jô#İ¬&0_«]ıªC\è#\Ş÷D·ò}-¹ ‚\Î\ßõƒL\×.cM¡óC\Äi\æ\×\æZ­¬uˆ5\r¡\n„Q\înƒw\Úb\Úsş`@»Š_.D‚sL»X;Kóö‹¢W¦}>€Ù‚Ì­h\ÂÊ¸N\Ù\é:/®!¡-x&B•Á@\Ó9…y\Ø\Õ3°¦K\Ë\\µ\Û\í\0Jñ<A‰\Ì\Ã‘‰c3\ë\á:¦>L4Â´?¸5\0C‰„TH–\ÒzZys\Í$pô	”Á›xˆ0i\Ê\ËA\Ã,‹e)\Ù\âS\ä\äs†¡¤Ó¡ş1.L/£QÍ²\ír\íJ®\Î`/\ïoYxˆ\Ì@µi\r‘û°\"\Ïö³8±<¯úP<aÄ‡¥ÇŠ¢)ùBpÁ;\Şò\Î\Ì#m|5(ºùe\ÇyBğn>‚N&\Ã\Îİ¢¢¯\ÉúEIQu\Ğª\áË£t\Òm˜@š¶v!\ËP»u)T3˜i\Ïöˆ\à°F‡¤{—>jlC\İ\0À>\Ã\â•ğ+€´7Ùˆ?ö7Kh·3 	»öTrU]€ö\êÀ\äÂºû§l|Å\Z.nXvyŠ•*\'0K¦\á·\â\àM)<w”ğ\\ÃšfQ)†º±…wCJ<bY\Ú%7\\H\Ê \nW?—~(F±\Äc\ÇØ¸ŠOVqL1;B\ß\é6\nö”c‡¬Rƒ\ây\İ;=¥y÷H\Z£bü\ÃO\í\Ø\Ğù¤ó£\ÈÓ´°ª¹yzFV\Åñ±Æ™S—\à‚»\á÷a#\îG\Ğ>RÍªÃ³Ñšlsˆw°ôƒ\Ş\Z‹E\Æ\î†=ˆ\èó9=¥ã¹–È \ìKxe-œ¿Y²\èöÿ\0s\Î{\n—”n\Åø¸mû\Ì8«\Ú{‘—¤lJG£X\ÖrW¬.’7g³y ôxÿ\0ÚŸûQ_84%wÂ¾ 0}g£\æM\ŞR\ã8{D¹}atC\Ë50\ÊNGM\Z´n\Æ*.gP\Ë\é+\Ê^ñ{NHm\Ôfs\énr$ªf\Ğ\n‡Wgj›“§Šª	\Âz+\n ‘~“ºa\nŸ²5\Ø62„´v”¸®ù€n¿0yœ\Î\\„\"\ïF—7•\ä†Û£ĞŠõ«\ÔÅ„\Üe©\è. “‰r¸•>™\ŞcöCQvû1ù0ñ’CÀƒ«)\Øş##ÂŸ™oóQjB\'\âb¬~lH${L´«\İTz‘=fQ]¢\Ş%\è\np\å€j\â2\çs\â54 h\Ø\â_&\ë?K2\ì—Ltf\0\Ëô\Ã:™‡nŠZ6÷”;;º¬\è\Ù\"´\íšDi™?=#~ˆ\æhM%\r0“™\ÂvJy~&½\ãºmóo—´L6E5aŞ¢¦w3ö[ÿ\0erz‚\ì‰\ã0À\ÍË¯ŒvNKa—>\è°\Ó\Õ\ïd‹\ÓÃ–,aû\Ë9=aî™„\è¬g3%ñˆbfT;#¼ \áw\Äy—D\Ò\ßd(\åu.8œ\07\âa¶±\Ãû!‚¯ñ)–k\Îeµ3v*`\Õ\Şû\Ş\\®B©¸PiH”\0Ukı–ı“:t¢\0/buÄ‡\Ğ#¡Å\Ïğ]\Æ%öOH¤—G\"\r½§ˆ\ì€\n#\Ñ\êô¼\'\ãv\Ò;\Ç\rB9™F²ºjå‹ 	ŠG\Ô\Ä(\Ğñ(\àò³¼7\Şm\èRı\"ÿ\0@†úx\ÌAÿ\0D±i\êkÀ²W\àC¸É²>\âp‹;Àµ\Ñ=	e]Ü¥Wx)ô\Ì KÁ\Ç\æ6-\èEµF¾¼\0„%¤q›Ä»\Ó.\çRqr„Z‹/t••ˆÙ•Q/«+sP\Ë0¤÷ d§>#^úÔª²ıñ8´Á;\İ\ï!ğS*¥[\á‹N)\İscK\ÄMınn)dYG{¨2\ç\Å\Çqx\ßúw§¿E\Ë\érşŠD¬\Ë:À\ï4{õz0\êy\Ä\ân!v3\0N3°\ßW˜g5SA\\\Ô\n®\Ğn\Ñ\È\'ö¦‘ò—\ç÷dUª>°º˜:‰Ë¯LJ\rVüM‹;\ë	r\Øû\Æ ş¤n%ª/¤uR|B.VjÁ\0F—)+\Õ\np@?¢[ú¤\Èr\Ê^fIóJ\Ó\ÌÍ…\ÓP\Ô\ïñ/j¹z¢S\ÈYÉ–¦\ï´`Sp\í:\r.¥;M\è!Hjn@\rañPí›·¤w¶%qög\n0F^*\Û\ÔVÑ¢>©\nM\Ò\n‡F\Û\0!Â¡Œ%\ËúN¹s)ô=*Tc+€”(ô!­Mkq\İ\è[b\ÏB9l;¦\İxpJ¥‰´…‹y¨©J“S{OYòLkurI”\ÚÚmj>\'r½H=`ğ#ŒúFh\"ve.p2›ı\à†‡\åfe	mn,”S\Ö€%¯h\Ï7ğ#\Şñ\ç\Ä\ÊÒ…¸†·;|\Â\Úó\Ëy†u+Y&kDG2\Ã0*X¸=§$\áğŒúJnºZ\İ0‘~O\Ä;eN\Ñk¥v¬\n[A\ŞÉ¸£\Ì?\ÊkóxG\r\ÙÁ¨M“\ÚB€8Ä»†\à\Z\æ#\Şa\Ü6©\ZG@<ı5ôhş)`AFƒÌ§,zj-1B\Ó^e“g^Hø2–\Ö3¤ö‰¾ü¢4_™\á‰^L\Ú\å3\Ûs.} ú’\Â\Ó\æXAÀ¦G\à€=!V¾Ã±ü—öø\Ş9<JL/üô;£Û´\Úô\n9n^C¼[¿‰\ß\Ä\ZK¥–°ŒUcPmƒ(\æo,e8ƒe|2C¼·\Ê¾rXhûËªG\İ~O@\ÔDW§$O•´ZvvƒK\Ğ\è¡+5¸®\Ö?”•1\íz\çqñ7Ä§‰¬“}n_ò¥‹\æi¸‡k\È¤alÄ&\İ(g \î0•¸K¸\\b\Ùõnk\ìJ³²dˆ½C³h†w…QDx¨™¢ğ\ÊÛ®\Õ2†#šû0F²bƒŸ¬İ‹ú\é;%rñfü\Âóš÷«ˆpe+|Ex1á˜« \ë\îÇ˜\Ê\â,\'o™ƒL°¶\nh{ŒÊ‚\"¹YLEó:‚\è}¥\Ãb/ôB0\Û^JƒF\é\áœX´\Şû3t=\Ô;Ey½\ĞBUBmi™Epa;¥­C¼\ÆS¼@\ÖÖ¦±ª!i†ú*\ëRº›úŞ§l\åtcP\å]Š+,Û -¨‘• Á¹¥r|¬¶·\Ä/z\Â\ŞóÁ\ë_tÂ³a©ó26·\á•\ìø¡B”ñJ³ë˜…¢û\Ãl:ô\ÆıX4£\Ì\Ï\â y\Î-\Í|Ÿ\äeµ4\ÇÆ‚\'¿\ÌhT«¼¼\Ê\"°\ï6›f™m¹R¦W®Whb\í\n†\Æ%6—Àù¢ó=\rY\í8½BV×¼\Ú%\0v{\Ô\í\Şóÿ\0%cG÷¨ò\ëvš|‘R/\ÊiPœüK1£¢bø$9‡K<Ê½tP~Aú´„\Ò;–\Ğ\â§¤|!Sduƒñ\Ño6\è}V¥E\Ê\ì\ÛÍ™\Í\ÄK˜ôƒ™–[ ,Á!++1\ZaØ‹œk¼\Å`UGª¯˜Ï²¯‡d¾ú\ÎOF!ø2¸\"Z†ü-\Ş\Z¢B>\âŠ\ÅÜ¶˜;³o/IJ¡~b&oPc¶)Á/8£K©\ÄJ`9·ü¦c\Ô\Ü7Üc ƒ£¿?¿¾iª¶N[ø±\í5\Íô¦\Ï0Dû‰~!†TB6T\Ë‡BÙ¢J\î\ÚOR(§f-.#“}@²»L\èF\0II½nDÀ\è\"Ô¦EJ\è}ş\è—ı@—OÕ—P\é\Ú=fnV\Ê\î~\Ó-\nez\"X\àO™V‹õ–Ì¬\î^ø²\îû\Åh?0i²\Ç1“tÙ¦{\rÀ™®O:‹c¾‘nd|C\Ö\é\×É{š\Âù–\ïu\Îb{§õ\Z\È{0E \Ô\ÃûSpˆ\â)[.!w÷\æ«ô0v‘yÒ®\Ö\Êÿ\0\ÒX\"`ª©J³˜;\Éş\Èğ¤c‚£\Ûü\"†tsº%\"\äs\æR7GsR\ß|\ÇR_)pÌ·ZCP‘«1õ±\ç´(	\İ\ÄnIS\ä”\rGm(!\ètúÁ¾ñu\Ú(œKÉœ&‰=\àùè¡´œLE\ÍF±£L3¹¸\í}„ßŸ˜+@>³Q&³\ä‹\é\éH\è\ÒQmË¼c!|Ê˜}`\n\ßÒˆ‡2\Æõ”™«<\Ú[Ù†‰‘\ZI\Ù¬<\0¯˜”\îòƒ™‰ˆÁ	fğ\îXn\núJS¨1M–Cşõ|#\çt\ÕC\å T`©rM\í^QN-À2òƒHwn..\ÅGA›ys.‚´§h>!˜–P”H+pq1\ÎĞ™ô\î\0¶\Å)\éT·n=b\âªk\Õ@2-{&‰\0ò½™\Ü´\ÏY#m6e\ÌE\Ğş©‹\Ø\Çf+İ•©ˆ§² ”Lv#¨ºu\Î×«só\æ\n*Áª»5sı¿\ïø…iXQ\Ü÷Y\Új,\"n;Š\î¹lƒ,´‡\Şe¯¶¯D»_r°	\ë;ñ5ª:Ts8t¹Âˆ—pD\ÇrÁ˜H¯ŒAû«ş\Ò\îecu^IH\á\Z©Á=ŒşûK>„£´UXM«–O„\Ú‘\Ü^pzÁ”ºK/²¤k\×É¨\ì\"÷s2õGW*\"óQËšW\å.øa‡¶\ĞÛ±ó\ÍE™\ØC ‚\";–dL®1\Ó_\Äõq9%\ĞNÑ¢÷&0™B\á\ÂDe\ÃSOL~¦\à\n]<Bª!‚\ÔcW	†R\ÊŸI\Øû0Í‡b&¬|Äš}´¥·\èflW\Ö0 N\Í\èŠ\Ó_yy™Kl\Òir\î~·6D<ÀmX¥‚S\Ì€l2–´\Óu1-.õ\ÒC¥‹\ê2›ˆ¬K¡^&\âûO8·-TÁ´¦øš\ÇKò÷Y óy}f\\½¢rz\\S„`»F™¤v\\1\àõ—q•\"Á\Ô\\Á\Ü\'gd¯\êe¨\ìñ/K\é¬\Ç\Öt!\á~ƒ¢§„YZb\á&²‘İ¸ñv˜s,U\"€¥XT³m\İÌ´40¯ \Ğbe\à”qq-\"y–\áO§7’\ZÅ‡1w•ùC\Éq\rşó\ÔMp|ô9]¡\0\İ_‰|b\ËO¤°qœbeOşôÀ¸\rÀk‰ga{ …\ÜsOhJT‹µ·V±\å¶\å\àó\rBıø€\î?M˜Xf`\È²±C\Ó(@®‰Šö‚qQ\îfˆ<¿nU\Û	\0Ë°õ¥G¬\Å_Û˜\Èÿ\0\İ\ãò\âş\İ\æ‹ı9—mUún\Z·0~\Ï_÷€Ò¯\Ûp»ö\ïƒ\ÔOÚ¥\íò&ğÒŠ¢¬g1|«\r5O\Ü@\ë;?d¿_i?hO\Ö\'wD?ñ“/ù\í0\ß\âE\áû\"_õ‡şŸdq²¢[p[~g*Z•\İ\æş\ç\ég\ég\éb\Ûû™\ÛĞ¿û zı>³~Ÿyû\Ş~ÿ\0÷Ÿ·ı\ç\íÿ\0yú\Ö~Ÿ÷Š\ĞZ¶[š•÷KN\Ø6Š\Å~XZ­ü³%şi›ı3ÁùbY\ï\î˜4ùK0\î\Í1=\Ù~\Ã\ï<–-¿™‡ş¤ş\É\â|§\êS\ÂùCµùeKv-\í\æ)\Ãöó<\Ó\Ìñÿ\0O3\Ãı<\ÏôóqUÑ\è?¸\Zÿ\0\ÚxŸ)ú\Ún¯Wû\Ï\Ùş“>?G¬ı?\é?OúCöŸ\Üı¿\é?oú@µú=e,\ïş\Ñrœ?n`\\o3\nşÛ™#õzÅR›)H{®cXxËz\\¼A\í;¥\Ü\\k3e3z¸-¨¥»Oy\ê†QInE]Ëš*PƒŒ\î*\Í\Ô{‚œTpbZ°K\É0\æh•(’*¨B«ŸW¯ó-eš\r>½f\ïøZaùS¦\Çü\'4E©tfñ\n]F¡g\Ì0FØe	\ÙÀy\è{‹¾£·ñ\İ^\"4t\\³l˜50\î{M\"ªm\Ån_\nÏ \Ë\Ú\Æi¯\â\În_\ÕöQ\ÛøA~ñp\ÏI[_X“S©&€}%úlcÔ—\Òÿ\0ˆ–q\Ë4£‚8;J	–È…\ÜvÅ…Œµ-5˜®¢°óq¨öL\Ô<Ä•R/\ŞZ¬tV\ày\Ì.‹<Lcg”,Q¾H¯j,\Å\ì˜F{šbVY,%“s\Ú\ì\Ä\n¬xS‰@¨7ø\Ë ÿ\0+©Ÿ¡3ô¿ƒ(W°\âa\n;¯˜(¹L\\\îr\ÇPt\è[o‡i[\Ü?n ¹j›e<\És3\Õ)\ã£S5¸\Ö\Ö\å7.^‰Á5\\N7-.÷,2K··A\á˜)q^q\îfû/Á9iÀ\å–)x¹š(X\ÔXw&\Ã\Ã\Ãˆg.ù²˜jb«\Ã-f\åªh—\ÍK+Q\Î]\Ç÷\à`›ğ?É¤\íqú\Õ~\ë#n\'@\æ=\Ú_¼7†\ÓF_˜ö¹H^ˆ7\îe<K	è™–\ï\ÑG\Ò\áĞ·¼TVZB¼‘f[(§,¦TM\æ§5R\ïuQ¡¹c»–¬mÏŠ.\ïE†Wl¦\ßù\İ\Î\Â‡\Í+\Å\î\ã´Ğ­ªs\\’/1f^÷-\ĞJ7\Ìß¥±\r\åu*ù…j(9%Ş¥\ã3˜\"\×EJ¡N\Çø´»8j8^¿Q%\í-]7. ˜m\"F¢„\êó0u!\ÙVP\ìö„+Ê²å”•üVJj}\Ğw†‚$D¬X\æV54\Ü\á…,¾#:š\æfpó†!)F\Åy™\èM¨´@4c´·o¹‡hùÑ¥\ÄhaGXV=»]\Ê99ór·òÁ39–Uxy&EM²\Â\×oÄ¬\ĞË¡©¦\á\Ú\ÅL\æ”k)lú?\Å\Çûÿ\0¨\à‡BU\è@\Z1N\"a&ºM31*w*\í¼)\ï	R¢a*:\Õş—‡õÁÆ»\ÍJT\ÕD~ò\Ü7£3ti\Úz Ÿ	w\ÄK<td‡™¢º—\Ìôÿ\0¨ón_0\\\í¡?O3œ\\;ˆˆ¦×«ä‚Œ¸TA´ó\â`ƒ¼<Qs	4\Å)bò§)X\Ş]\âLropm¨Ù©c5*¢¤˜]\ç\Z…\İÿ\0‡£~«İ§Ä®’¦¨M:\Ô`\æ…5\\Ìƒ\à˜\ß*È·U\nO\ß^‡GdÆ¾_\å\r]&ı Vk1R`™!\Ü\Èg´3‚\Ä\Ôf!)l\Ç/¶™(8\á{ÿ\0\Ôğƒ»G,L#v8\"k\ÌU„\×\ß”&\á\â/Á1\Ê/¼WW*¼¢a¶¡\â!l\æ!’\ÉX/\Ş!Àß‚0/ÁY§˜80÷—527(4\âVµˆ?\ÑF\Ë\è\Ñ=ÿ\0Å£\Ü\ÃpW\Ôl¨†\Ö\×rn=q4*WF©†!lÖŸˆ}|C!\ÇC]8N^¯òü\ØE\Üõ\É¸\î\ï¡{M<M\'lCY…Y–óŠMM\ÚY\ÆQ§1@r$ p#•\Ã7\ÚU{\Z”-q\Ì`Q\ä¼\í\'l&\ã…ò¢\nC\İ\ÃEL×‡‰cYˆCœ=ºE©\æ^¯\Ìj_0=‹İ¸BÇ¹”°óöûK­us&\èˆ\ÕÔ¶üÁB\Å{B\Ö\Ú*\Ïñ|\Å9˜}cq\ëPM\Ì`\ÌX\í@\ÔFÔ‘º#\İXŠt9%y \ê\ÑÑœ½—±\ãÑ˜\Æ\Z¯3\Ğn\\[\ÄÀ\Æ0+¼\Ğ:—§\ÆGPf-X¸1Ikqeo`7‰ƒ”6km¯\ÄÁH÷\Æb-x†¸˜\ÕOHÀk,ğ\ÌØ¿\â-\0h\í\r¥™|Lw(´­\àú\Ç\rG\ØKišFö\Î|\Ë.Û•\Ü\î(u¾‰W¾N`\Ï\ã\é¨BDÁ\ĞbMñ2Ø¨,g0LVe*Š\Òf’\Çr€{ \Z\n‡M}mşZ­ ¼!M\ÂMo\ÌÁ¼FÑŸ˜†-\êÈ•UQ ¼€Æ‹ \ÉVDø•¼ùawz–s© ¨)¥\ã:ğ—\ÆA\å\É\ŞZ¥G7\ÌY¢T,\Z{Æ®\ëRZs\Ë\Ïcso\è…¼Ñª-u¹ƒ%ATnÜ«\æ\r\ÇU<G»P¡Rf÷Œ£¹gšYAÏ»ø*$\Å#™\Í\ë\ÑP„l€\â^*\ã¡\îŸi®¯,\Ü|ód˜X\àl\ÂYL¸\Æ\å+_K·C¬g/ò\è7ªY¥1%*]²!ÁU*Cd1\Ş-\Ç1ò»ª¸\Ø\Û‰Cƒ\Ì,9–m8Lw¾%@\í+\Û16\äi“ş…?2\ì¨À—qm•´\ÅvS¶”M\àJ(–”5‚P\ì6÷ù\Ïi\Åp\ÔPŸqPM\é~`xT_š–\Ö Wx°¶\ã›\Ü\Ó1y\Ì\×@ö˜ÿ\0MLt¦iR\é»\Ú±´f\ÓRV\í$AOcP4Q‚pŒ\âÁ\Ğd5N\Ğ\Z![Cß˜¦–pgb\×Kz®\×\×OGSŸ\åy~BS²[š\è\Ï¢‚úL S˜*Ü „\èz‘IWxÁW+he»¢ngc\ÙdVpFk9¯?ôŒ[*#Á˜¬1K\ÈQu\Ş.o‚mp(\é} ˜nÿ\0Pµ\Ñ\â\Ó^’\Ê*5÷0E\r$¤r_ˆ:ªSœ%’\è©JT©\î\Å+ª˜3¸\è\Ã\éz„«„\ä\ìŒ4Añ\è˜F/Uğÿ\0\Üø)4™ja•ˆ#‹X™\â\Í\Í»÷wùC\éùş[›‹î¬¿3\ç<\Ë|\Ìùö–Ç¢z\'ngº{§’zÀ\ÛyB\Æ\ÔF[/Ü—æ¯·˜s@´\ã\Ï\Ï\ä…\Ë\ßt\\Œ\Ã \Ú\Ìøi\İ´/n&\íğ=[~Œ£‡\Ú+µ{LsıÍ¯hù°÷úÄ«„\Ò\ËWˆ<S\"³~Iˆ²g\\ô®`·„\æj4\Õ\Äk_uFa\Ã_OdûI“xƒ¥0\ë+¦@”\Ít˜\ã‚v\î\Ë6 a/!•3²iJP\Ìó\Öe²ÊŸ\êõü\İyş[òø§õ)\ŞU˜\ï=\æ\ÇÔ\ä”ø”ö&jff7\Ú`À”\Ñ{™‚‰ìˆT¯Å³2\êÌ¯Q\Ë%89wô`9­\îœófƒ\Ëöˆ¹\×1‹MM®Å†){¦w­\êC¹}¥û¯£;–ùÒ»\Ğ_y~‡¸‹\íğ”\í;eûı¥¼>\Ó\Ñğ–\íğ·}\Z\ÍO¥ºm¾\ÑZøAOÄ¯h’ˆ\Ù\ë\Ñ\éYs\Ò»Qø	V•,\ì\æ<ƒÌ· wpšŒŠœ%\0®»¿\àc¹÷\'b ]^\ê”\Ølñ’X>0ğ\Â7Ø¿X\İ0\Ó\Ú[´;†¥iW*\ß\êX˜¾\è\ËRû¢œ\âS„Ïœ.M§ˆFjªƒ$\'Ü€ˆ¸„wĞˆØ¤*7¬M2\ÏIea\Ïh\'ygyJ\Ã>)\ØS\Í~\ĞÒŠ-`½\ç£-\éa‹\Ó\Ş-\Ï\"nõ5&‘œttô\İúu3^“b=\r=]7z\Ìm\ÜE\ÇR‰ÀAT[c™öD\àP\ZX\ã´UDº5¯£Ÿüògr€Ú©f~Dp †—}\ã\\…w»€(=Œ´-‡IGrL.-¯™D¥\Öj\"JT^v¾ˆ\ÖsS&¦Şª>\æQf^?#Û¦¦—ôŠ•¾&{G§™cöú=\æzZL\ËwMc:\Æ8—‡\ŞF¥Y\Ú:„3~‚Õ¦øk\ÍI¯ALµ®®\\\Z99¨\\*\í\Ù\ëË‚š€jg¾€¯£\Ïş\0.š|A|\é\ÇxùU6\Ï\ë/!š[0\ç\Ìm¯ğ”\ì=\È\Ş\Ïa„ \àx™J¾¦§±|Jj\ê\ã_\Ë|¢Ue\áÉ—=£¹aM:\Õ2\åùé‡„Ç¯J\è‡Qp*\ì‹\í™a¸bbs5*Ó‰Šÿ\0>ŒJuÒ¡\íônù¯W1¹R5\ÂS˜?X\ÍñBv~\Ñ%+° ~©\í2šA\Ğôbò\î5,\äj¤8¨%\r\é˜\Ş\\Áš•(\ê#®¤Û«ü·\Êdb\É}\Éf¢«\ØvJ\äa5\ÊQ^c\\\ĞñXZ\Â\İN\éøLÍ•\ã¶\È4m\î°^«\æ.;	–5³\æ,®\Ñ{C\ÚW»51G	G|\Ç5º\Ô+Z\Ç\ËM\İqJ\Ô<ôa÷E“÷\âk\êc#Ár»Xˆ\×yûSãƒ¼ı—\Ì>òÿ\0\ÉÆº7\æ\ã‡fógJË¨€..¡m¨\Ø\Âw§ùAÏ°#d­æ‘ª·•bM¾\Ã\á\Şc¢Xn\áx›ƒ³[‚]È–\ßGGg¤Ó”/¿3‚>-J€›õ¿ª–şÚšAúT\Zhx”\ß>e*8âºP¬Y‰cWGyf¾¯ƒºË†N#kÎ“:¨\ØV³Z<Ê\×\0\ÕùC§\Å\Ô\Ğ$ \Õ>e\à\ÑQ#õ-Ä·¦Œ3\àŸ\ÜÁ\Å}Ò˜\Ò=Z€:g\æ`P>\ær›¹FU–¥¦!T\í(¢‚\ÑEúK¤\ÊYX¦Á\ÄÁ\Üì‰¼\Â\Ãvv‚ú&³tt/if˜aT*\ËZÿ\0l¥–Ÿ½DŠğt{K÷–¨†,«—\Ö\ã9Á_<“)T+(ƒ¨¦LjF_h\Zdˆ‘£uõER¿!\ã¯ò£¤—\Ş&²°\àŠø¦Á\Ô@K<\ãpĞ•\Ì\Ô_¤2œ<\ÌÁÅ©U‰TYx\È\Ìhhö•\Ñ\ß0ß°8‰Wÿ\0\'œ™õL\Ï2\ÌxO1¬ò\Ïy\ßş¥™\Şj<>ƒ©\àe„\Ú\çª\Ö}¢W¾Š‰–\æ¦\ÈP\ÙrbY]ğ÷‡\0A˜‚¢\Ğ16ñx\rÁF\0-=\â­k¶‘´Œ\Ø7òŠ>Gª\İ4Šv\Ü\0Œ\'«Ø¹¤¹q‰aL<E¼šUó©zMö¡–³lv¾„pÁN¥\rğ\Äs\Ç¬ôÿ\0\Ìİ¡A‚—R\Ô\ï!q‹Ü ¿(#‘{\í\r\Ğó\ÚcO„ƒ6»½ N=½á€—W¶W-S\Ş[\Ò–\î\nğb;½ƒ[yåŒ•mw3\ÕuI~l«¿üN¿Ş ]\ÓXp\"¤`b\æÿ\0Cñô\rK;\Â0m³p–À*)´¿9‹f\ŞX¼	0›C-¸\Èh\à\nVØ \ÌÔ ùJ7mj\åù\íyo\Z>˜[|Æ«¢T)‡¡’\é]YÀG/ıK¹.\İ7õ\ß\Òô\ç\ìˆ#R\í\ÃU½ûJ[Ağ`GP\î0\éQñ(¦q_’h{\íbt;&ERE/™j‡p”\08b.\Ê^k¼º)\íp) \ÉY&D\â\0¼\ï±³\Ò±¿T®]L<üK»™§´V\ÙFV†T¢©\Ôh_¢\n<ÌY\Ó/C41ÿ\0‘¶\Ó\Ï\ÑPW\Ósy‰m€¬úÀ«ø\n…Ü³\Ì\ä^£y”aE{bj¸dj§P÷¦¼s-Kš\ZÁp#¶Z;²™ôq^ı\áQ]\ä`\0ÿ\0¢?\Ìó˜§\ÄfCcSñD\ä\Ôx9—\Ó\ÏñEMN\Î @˜Á\Äw¤IP37N?\ápnTÙ„A\ä‹0³Z¹x \ÍZñ\Å\é\ëÁ…_öŠ!\Å\æ¡\à§wl9Öe\ZS\Í\Æ7¸ú ¸‰\î;c¾\ÓWf\Ò2\ÂVi¾ğ\É\\\ç3/R*Õ«õp~½Aˆ”•–Ç™W¿´\ßş\ÂBÕ¶\Òõ\'ena\nOh9U\äKÑ¹n9„7Cò˜Áºg8Šn•\â‹˜«l„+ƒ™œr\í¢$¡‚\\i\×\ŞQ\çõj_7Coÿ\0R\à²\âœÿ\0Ài™A\Óqf0!Na¨\ãz\Åÿ\0&¥­Ipü<\Íu\å\Ü\Ü\ÉK±bŒ¤\â]	_´C±\ç5…²°LSö¥¬\Ñ^€ŠJcÁ(—U¹dF1‰¥\Ã\r Ø¾\ĞR\å§h~\ÏÖ´\è.c\â\Üú\ÊÑ\ÛL\'t\Ü4/\Å\"Õ§\Ï¦\Öİ \n\å\Â\Ô)n‹{©t’’ü\ËEMKfóH7\İ\ÌRp·\ÖE\î¯D\r	Ø°\æ$,û‰\r%nö÷õ–=Oü˜\Ù^H\î\Èt`šÑ¼8IX•™²W\ÆT1\Í\àŒT\ÄØœ\nTı\å‡…g^‘ =~!›/Am\ê$1mûJ\æ1\ÇFK\'2dzce\ç¼&\è\Å0³t±ƒ™ÿ\0R…˜ñ\á0”\Ü¦\è&*\î½B¾”\î8ƒIi7}F Á\ÓtÍ†eP‡\Õã´¡&l‘Z‰L7‰;4b(U8¨µ 4«†\Ï\"¥‹(÷\â\"–s½Ê bax€\Âò\Ëª}Ñ¿\ÅL®}Šu,º¶¥\êÀA\é¸\Â?É®‹\"­ƒ‰™w8Bı1_D\Å\Zxú‘E\Ûñ\Ğxóÿ\0J\ëO\æY\ß\è†õ\ë\æn\Ğ\å‰\æ¾·*\0šqÌ¾$ºz\\À_Y\Ï>²Œ\×)’£\ÂÌ »q\ì4&P›\Ğ \æ\ê\ë^=¥Rm\Òo\Î\Ã3\éQ\ZK¾ğó\Ì*HVGR„¥Ó³“\éX™¨*\rS¼v\Â\Øw{ú…\î€\æ\Ñ\Ü()ˆ­œ·bw0ºÀ\Ê_†YôS%u]9¹–ÁD\È\Ù£W”\Êbd¬ñ\Êö3%l‰zğE˜2ú¿\ËQ\'(Ë\ÜW¾œÀ„*\é\Öm3|\â{\Ù\â_ë‹—Gÿ\0p) ±©sX\Ş\å÷™ÿ\0ºb\ë\íevP\Çlôp.`\Õ8Ÿœc}zø…«¢;Ö¾·ˆ\àt…Ö‰Az¯ˆ\0U]h|EiGbB\ß\æS	Ö¡\\\Ğ\×-7\r#&#ì‚œ‡),%©\îK\Ód*ËˆA\ìÍ\Ú+£\Ó<¿K©µ3Û´[	·¿6…J—Jõ˜s,¢òh\ê\ÒLƒ‚HÆ·G™|*\Ì.QB\Ê\Ï#DJô\æT½Í£\Ğ+ûD¢¥‚lÁ32›3\n†\ãu\âÛ‹F«u¸®·\å\é\Ğû\é‹.j\å¨\ÃOO¢úš\Ô*-)\Ü\â^`jnAMøF&z\ÅÈ™I\Å~É‚4\Ò*\æŸyÁYõ‰˜“}e>{;\å´x•sœ\Ün;Ú–Yù)fV¹\äö…½\Ì\î(U]ó\ï}\'–)K£ú‚rX8\Åx†Ï³Oñ+h\æ	w\æQII¥\í0\Ş\æ`]‹r\îUw\ÈdŠ]S’ÿ\0\ê$¶\'/=§}\Ä^ğ)€n›e-\Şö!3U‡\ïˆ\í<¨\é\á³\ÖU*˜ùš¹]s\ŞQ\nP\ÎUœ\ßhş\Û\rrğ%P(\\Vx½dõª\Ò\İ\ÉŒû„\ßm™ª‚ÛŒ_?š\\\Û\é¸ÿ\034ıWXÁCmø•2\Ñ©af¡}<\Âƒ;®h\í\ï@d<…,¬ú\í_,\Ôo{>\Äû\ï\r\Íü\Ì[â‰™ƒi+Ë–%\âQİ¬\àn\ã7™\Üc¦\Ãnù„¥6\ìMvM\İD\æİ²|¼AB^®\äN9\æ\Óü”iZ\Û\n<¥	u =\'i;\Ä\Âm¥!ùUÂ‘b\ŞÓ‹‚½Lšıú\ÈJR°ç´¯¡P\"=ŒND\ËQÑ—´I\Ûj¡Hv\ŞÉ˜\Ø\Øl%\n™\Õ28×‹÷ŠÁ¯n	©]?\ìª\á\æG.\Í\àb/Q›ª\Ñ{Tqq\Z³Bÿ\0\Å=\ëÕ¬·gE\æˆç™Œ\Ï0Ä±[”†Z\Ü\Ä\ï_¹!{ø\å\í6\î\"ŠÆ¿3q´_\Ñ!\ÈT4KUS¨P&Ÿ>%=Š\åœ–mƒ†¢n\ê¬a\Åu\Ú\\\âİ®7›?™Ã’•\ÚWwiö\n@Sº\è`•Ja¨i+vV£z#]¡vxe\rqñ(3\Ş\\f{L\Í\ÆmZó”+±úó\İúõ•º¿\ë\Ö\'öÿ\0b:»ûó\Zm\É\Üşı`üÿ\0^°~_¯YO\Óı˜óıúÀ\åş½g\è ÀR\Ø\"m÷¾›Ô¾Šø0ƒ´\Ñj1\âp„­\ábXª[QWh\èb\"\Ç~eøn\'¼¨-f \×jƒd1·—\ŞP+\àE—O\Â(±üE_‰\ä_¤|ßˆù?·VüAñöE\Õ\ß\ÂTD\çŸ\Ë\\ \r_\Ú\\¾5J\Â\ZO\ï\Ìz¶ıw‡ªñ	6?öˆ\Ç\ï™W‘\îÿ\0¼\"ƒ|\Æ!_(\Çş\Ò\Æ1\æÒ§/ß¬5\Üıy‚\îıùŒS\Ô(\ÅÌš­µ=\áša\ë<›¢)M\ÅÀ¸f…}\î\Ü\ï¬&³\Ô±û\â>¯õ\é§&\ÈÌ¥\îöø&€yöK»}¿óÿ\0w€U‡?ù—˜_h1\Î!™ó-\Ş(t\Ô\Äc7\èHuÕö˜ı;‘\çöô\Æ\Ä;úÚ†ƒD¹šÁ\0™©›¢aº\ÈÃªªQ˜Y¥\\m†6%@0Tt\å9\êvdsAp^\ÒwE£\n”&ON‘\äˆ\"#L\ã\Ê\"\İ1.\îV\Ân6bXF¹ L\Ñôš\'	y†K–\ÍqÅ©\Ã]*\æmD¬\â*+\Ş\îb!4\è0ñ*Ì¢º-\ÆT§^\ÑÁ0L¢\æ\Z“.¥@\Æ¹\Çi\ÇÏ—\ã!šMK\á“±®rˆq{E6±\Ë\Ş71¯Å¸¶tw‹8*\Ê\äó-\Ã\Ò	Ìªtõ\é0a\àœ-F%¼SÈ©^…#}0€Œ‹\ÜÉ®—.8¦;B©™p½M%:¢S¨Áİ±\ÚTTn¥¸š„Hˆ4]¡`±‚PE\êZ\í\îO+\ŞWƒ\Õ‘\ç2cIˆf/º|Àˆ\ÌBª…\"ZR\à‹\\ó™=B\âu]Ì­Å½Ş®	5\Ò\å\Â)\ZfJS‚\Zt\Ç3\å\Z‹\Ø\\O\×V\É,Š5P—ƒ#\îTÀ.&\äÛ®_37S\È8‡‡2•µ¹™\Í»—«Ó”k¸\ÄGKR“GE‚TS\0\Ó\âY,L\Ã2!sgp\Ü\r“A\Ğ\Â2’ŒÀeWP²YÖ–!÷e\ÑØ¾òØ£+F¦Rµ/¯¹\Úf62óo‰A¦´£²œ³jšƒ-%§\ç\Ì\Ä]j¬\ËÜ†©Á)i¨\Ø9<Ã¹h\ÌÁ\Ô\áÕ°…\Ä(ºzB¬2d–¡>±\ër\å\Å\ÄÑŒ­\ÇDMÌ¸4v”1÷\Ë\É\ÌU@{G/€\Û<)»T@©“R\ÇFe¨\ï×ˆ­i”b1\ï\Z°`§7cƒB\ÌˆĞƒ’rP;0¤òˆa<Dq©œ–SL\à¨ØŒK\ÏJ\ÎõqXY½tc[ƒ¶^ œÆ¹\ËÌ¹§|j»¨öw\Ù\Şg‡£\æ÷l\ë\Ì\Ê\×$U7c\ârûJf¬§{\Ü\ÙPB\ÔC™[¨†¡ƒÒ¬KK®„\Ósß¢\Âı\ë©\"Í¡,&£MÃ“Ÿ&\àE^\Ä[4\Ä+İ—©ù\ÇX\×$]ŒtP%ûK&LubdJ—1>`ĞšƒW§g«\ÊòeJDE\Z\é}\Ù\ÊB\Úa\å\Zbñ}\Ã\ã\ä³C)Ì¢5]Àd\ê$\Â\Òñ\Ór«½‰”×¡\Ûp$Jq‰¸Y¨u\âºœı\æ¾ğÀ™jk\Ø\Z\âR¬gP\ä€j\å\Ó\ã%\ä™\ä\æX™r‰R˜\ÌcRó)ƒQš¦®†²ú¿I\Ú‰\ÜZ‡¶\ãg\İy–l¹œ\Ùm°qW(À:Š˜ªHˆ\ÉFbd”\Ã\ÏNS ”\åb\\°\Å	\æy!„\Z\\H\Ê$\äõ\Ã¸H´w“’¹¶\ÇEEPºœ\Î ¤Xğ\ÔW‘\Üa¬9”h\ï=\Ì\ÏI¡X‚Z\Ôï°›\Ìñ\Êø™±A˜¢\ç3¾Ã±¿Xõñ7½\Æd\Ü	W¾£(õ™(\è•5&®†¿Eı\0xA“\Ş\àZ\Ê\çò\ê9¦b\\Q+¡#Eø\æ\ZjT\Ø@£Y”ö‹5\n“œ\ÅFT\ï/İ”iKÔ±\ÔÂµ= ˜\Ò[/¡\Ğ L²ZL¥!3\rA—)}3§1.\ï\Ì³ö\âU\r\Æ;\å¢\0^¥U	J‰TD:¬÷ˆE \\Lpü\Ë\Ö\íc\Ñ\æ<\Şl‡‚ ¨]\Ô@%Ì£’sQ´šg¦0kê¿¤\×\Ä+sF®3ˆ\ç²zªb\Z\è\Ä\ÇH‚\'IˆÖœcm;Ê…]Fª\Z\ÜÄ¨‘\é:’ğœCt\'{F}w3f\\\ï\í472Qv(e\Û\ìE\à\×y‰˜\éqc\Ò\å•L\êd\Ã,L!\Ö\æÓƒ\æ)Ô¦B\å2/hûÁ¥p\Îb¿Y¹\rz\r·¨+”™˜\æ…0jbó¹Ptç‹.\ã¢\á+/A\ÒE¶>Àµ\0óü¦\æ[—\0Ô¶H†Q;E‹’Q\ë‹\Ğa£¢y†.\"¢\ãË²0‰Aešˆõ)X6(i¯\Ò7ˆr3„zdˆ­œ\ÃsJ %›\è+=-i\Z\î=9š§I¯\ä ¶IÀ<0|\Å^:7q¨“Ñ˜Z‰ª\rfXEL\Ìfwğº„Z©ºn1¥Rh%ˆ\ä8‹2\âÅ‡ A¹,H\ÉÑ…•\èG¬\'9”´fG¦\ã\Ù„\É\Õ\Ã@G\Âfb4•\ÕÅ–Na8JœAƒ\Ø%Y¦q‹¸»b=\æP	I³Ñœt“3\\zs\ëÓ¡§V(öE±f\ÅW\Òo§\Ù\ZÂ®‡œEMB\×ˆµ’¶sœP\â»+WøGR\é-r\å\å\\õ\07‘rŒz€³·\ÇF(e\â*\'‘”fõe•\É\èDÑ4n³yŸ\Ôyj? —\è¦O’È°\åz„óaWûŠˆu<©*¿3(=¦Ÿû˜N 2¤v€¨Á–`>3–ˆ:\r³\ÇHC_?HM@\Ô%}\Z\ë´\ê\è-l˜d€\0®¢C3’8ú@K\Şªd„\åf.\ÊüL*8Nf.a²\é_Ã¤E—q\ni—š§‰\èY‚`ò‘\î–e0=¢»ƒ\ÙO¼\èøz6(0P\Â(\Ò\Ş\Åb\ZÌ©Px€\å}!j¸b¾uNq\ê	\ÃeU«\Ås¶\ìzˆ\Ìq\Ô\è0}	\Åş3sku\êlˆ=D#)‹Ä¨rb\è­\æ“W\Ğræ†\Ğ\Ô:’\åõš@˜—¸0Y„R!ö$R½j¿´½m+\0„jø\ÅlÀ÷!\Ì\ÓW2—DÍ´-{\Ë\Ö\r\Õ\ÅÁ(h|™£/E0»\Şÿ\0„\ãQˆ¶³¹\å¼C=RV%E0LZ~`jV\0\Ç\Òê¨–Yüavf¥	»Eö&ã•	2d \Ã\Ñ?,\Zı\È+Ü”£ı–şß˜\n5;(”õğ\ê\ÚbV©}!\Éã—•*!\n¡¸Š1…\rÀŠ\Ç@\Æm5u#Ô•8M&²¥Ki1	P\É\Ól¥\Æ ÿ\0\ê†\Âÿ\0˜ \İ÷L¥\Ì	Kƒ÷—s¦tXP. ­L—hÀvş¸\ËX\ÎD\ãF16úk†£3w\Â\rs’İ¢&`–B\ï\0E£g•÷ˆ	¿\Æµ­J«*Tz.»¥R«kü„|P™\Ûd~%p¥\àó\å–\0fffÒ¢ğ!¬É¤Â“úÊ®¡7ô±\Ëƒ\ÎQ1ô:(š™‚g>–•G}\Ía\ÓR2.[™½\0$\Ô\Å\\!‘)t\Ã\Ì\á›\Ò\ÄÀ\é`‘\á(ò\îT\Ş\ïJúHÅ¶1KÁù—r b¶>Œ\Ê<0(\í\ê\Z\èRÉ‚.7¯1\ÏJ•k\ÄÀœ\ç˜ $@¡–s\ÔÁ®\è•X”ş€!¨nU\Çÿ\0¯1xPB-/kI¼\îú\ÄözV\ìDb\\¸°3\ä”+\ÔTó€@\í\r\Îş¬„q\Ò\âÃ½\Çi5!\Ñ\Ğó‰—\èM:.\ê\Ü>qŠ»ªû\ËX1eŒ•½É®ÏˆIT\Ï	j,\Ğ\×t\Ğ\à%!x\\±ˆ™&\à—\äMöq\Ö\åS;A„¤t\Z†4È™Š,N\İ\\¦3\0­¾&³\nAµ]ô-t\ëNIF¥\ÌûNb°…˜©fÀ÷	G\Ñc*TÛ®f\'‰\åŒ\ÊN\ÓD\Î@š‚¦˜Â£‚!­u¬\ÆIfX–\\\rLS)V¹‡Á\É6!F{%†rŠÀS\Ş\0\Ò#1\ëòA°óg‘\ä\âhÌ½\Æ€†À\×ğw—€\Ë0\ê²*Cnz@\á…ôÈ9’› \êzUDÉ™À\Ú\âË—ˆ±Ô¦8s*‹8ŠŠ\Ó6\0L\èWQô¸=]Ã­ø••.””\Æ\0„kO¼3ñ’½\å\ë3A^r„5‚ô»gš%„ \æ,!‡\æ7\éVq\Ü{\ë£}Yl_|\Â:oö›´fe½â¸¦\r\É1ST\"—W.\ÕV.e‚óôG(^,ŒC+waSúfÁ_\Şyf`<ˆ±\Çr*3‹¡°‚\ß#.,\Õ\Å\ê[6\æ’”\áZ„g\Ên¶]0\Ç,\ìM\ã«ôÌ§¼-“Q*YG7y‡­\Ìhç¬¬¤Ğˆ0qU\ÑXvT¤+S= \"$a	œ\Æ\Ã\Z\"Yµ¨z\é¤I\ÄÎ“*Œ\ç#\á¬O:\î.ôs\Ğ\n\æ$²¾³¦\n`¿0d:X\"ˆC`G$qs\Ã\ŞÀÁ;\Ä\àL©À\Ë\ÌÏ¾Ëœ¡Œ\æ>„ü eG=\çeCñ\0\äÓ’,¸\Æ¡\ÊY\Æ¹¹÷\Ô\n y\\\r¸uVM\Æ\ãN\å1ğ\Z\"<\Í/\'0\ÃD2¹~‡w¢¤*TÓ¡a]U\Â\ê4\İEÁ\Ñ„(¤¢9\r\Ë\á\Ï@\Ä˜\ß?36(òKS‡C¼°\É8Ô §ß‹`¥ZoñyÁ¨u]\ëø.\"Ô¿+1P	„2%\âo¦\Ì}¨4œ~&‰¸€?²†]&ò©kû\ÈŒ­\îQ¡\Zœ‘oq\Üs™JŒ#2qúœE\êt\ÌR\ÒXòŒò:zK¬\Í\Ğ\ëÌ£Ì\Ô$¯x$sOo8õz\èƒ\Å\ÜL\ÂÒ¦nnAb\Ü*Šú/2\åÁ\'yƒb=J¹q‹\éS—h¥Ìˆ,T5˜f\æ9ª®\\Š0\Ò-™‚œTR\Îr¼\ÍòP’\Å\ètbY[n‡\Ğ}\ZT»˜i’Å²½-d[\èkrº›\0Œv^\Ä\n€x–sz%eñE\è}—öx‚[º=:¤Û®b’.î˜£\Ê+ \Ø9¡+—h\Æ1sQ÷XÍ ©™\ë\rJ\åx”ôT¡•¾§hÀÀÀ˜¤9´]ƒ[C«ˆ\Æ\\º„¡¶f\n\Å\ï\ÇHò™“6\Ê”±¯$%CI\Ş¸˜&n\"\î\0¥\Ë\Ó\Ê\è\ßØ’&¹rú/‹\è1‰ŒAµÔ‘j;„N90\è\0†\ÉNK¾\'ªE\ÌX£\Ò\åô;Š`Š\\\Üû¼Ë»Júpa3—(#=!\È\ÄÇ…=ZpB#˜J\è\ä•\Ä8›L\å¸\é¸É³¡K¸3Ds3è†›ƒ`\İ#\ØQ¥Ëºğ¬ /ş\á\Ğ\Úh‡8o\ì\Ë\î^\ä\0—UxBñE2ô\ßÎ˜\Ë!\×HT\Ô\å¦[;ód…Ü˜ˆf¢Á¨0C!…i\Îb\Çqc\Ñ\ß\ÒW\èÍ‘^›\nú¡\Ø\Ì\æd§Q»\Ç\Î%\Ì upw–£”#\Ñ\éz‚\Ö«(„©]ã‰§\Ì\ŞQ(ºL\ìŒ\n)»¦°7yr¦]\Õ<iz7­\ĞZŒ\Çw\"1‡gi¸ó™§@_B°5\Â:\ßAµ\Ç\Ä1C\Ú ¶wÓ˜†\\Á\r\ËL«QJ”ˆG\Æ8\ÆvùL\Ù\Ó“58›tz;\èôT]i\å¨\í\êŠIñ\ï>“>e±¤\ãS-òz¦_\ÄN8\Z\"©L\Å= M‘\èÊ™¸.\á\ÇŠ#\Õ\Ô$Fx²h\Âû†_®\â^ö\Í\å\ç§N>Ss7ƒ\Ì\Ô-\î\Å~£v\êgÊ›\"\Æ\Ã1Œ\Z\Ü+\Ùl›…!lw\â\n\èuY}\Z¥-şğ†\ìJ·\ÓD€œ \Ø\é-\Î«k“S˜¶d¾\Ğl&\İ8úF*ƒ\Ğt©tf¹ú\Ğó?h¶…\à·\Ä\â+5*‚[Vô*:`hn?7ğ\èÂ·¨\ã¼GñBŠƒ¢#\Ş\'= ª™¥´\è=vDC=Ø±eı+A¹†È¬¦oìŸˆIT¦r¨şû&UŸy°Ÿ2\àB9ˆnWC«¾¥Ê†ƒ0Ô›Œ’ø»\Üu˜2\Zœ¢Yô¾Fx\ÎDXe—¥\ÔÊ•Òº7‹1S¨‚z†Orø‡\Ş1\Üo,ù.aÑ”$b<\É\ĞÀõ\Ë\nÓœ¥õd”,Q\âo\ÌÔ‡\ÜJ$ma”•\áĞM\ÍArZD¢\\_¬\Ù\ê\Æeì…ª½ôÍA\â\èú7/ˆ›.8\â´\ÎVbıap\è:n	qSÃ±+Q 55dR;„8ˆ‡c¢m³8oô¤®€†\á1WV\ÃPq/¿S¥fWB!\é\r \è\Êe¥C¡peX\Ä{ˆ¸™\"¼\Ïc6¾CÅ–dº\ÄJ}b\Çø=Xô3‰‰!G˜š`\íØ°]\ì@\ÂË¯¤t\Îaƒé¾ó[d…_@\áWQ€\ÇlO3qhc¿31újT\É+0—Yˆ²_G\Ò`EjÇ§S u®‰”}\éq‰L\Ã\Ò$CÇ¨\Ø2¶(1©q.M\ÔšF›¨o+5u¨ıB±8\Äcœ\×M!†‘.#¢¦rüfµ\Ñv\Ôh\èKWôÏ´^—\ÒúXƒ‹\Ü,¼\å†	c]¢·§½ºƒ\ëÃ§¦?EEw– s38]u:?HŠGB9Œt\Ì\Û\ÄK8„\ÛR*0Ü¦f±š¡\ÖsÑÑŸS=z¹›Íª.Ò ¶k£N¯\Ğ¬!´\nô¸órú@Š“)¹–¡«3\Û\èŒ]y.¼D³\ni™—\Óihf\ç¨\è˜#¹\ØE\åš=ñÀš‹\Ôe\Ù0–	„§lb‡#6%¦G\í\æ%ıxÕ\Ñ\ë‰ú=g\èÿ\0I\ã~gúymúyŸ³ı\'ƒûyŸ§ı\'‹ûysú=f\r?O3Àı<\Çõ\Üqı\Ï\İş“ö¤ğ¿O3X_1\ï\×÷é¿¸öÿ\0¿˜Ÿ\Ó\Ì{o\Ó\Ì\ÙG\é\æ=\í\æ~\ß÷Ÿ·ı§‡ûù?\ï\æx¿™ú\Ú¬ş\â?C\ï	¿\İ\ë?WúO\İş“\Åı<\Ï\İş\Ó÷ÿ\0¼ğo0¦¿W¼%?nóöÿ\0´ı¿\í\0?G\Ş\\\ß\é¹côó?Iÿ\0ag\í\Ş~üÁ¿¿\ïı¿™oõı\ç ?~e\nŠgÿ\0H¯\ìü\Çõ\Üı\ß\é\Üs÷¤ı\ß\é?wúGõ\Ükı\Î\ëõŸ«ı\ç\èÿ\0yú\Şsıû\ÌcS÷\æ~\ï÷Ÿ»ı\ãû\îQ\Ï\ëõ˜_\Ş~\ï÷‡\ìÿ\0¸~÷ûŸ¯ıg\íÿ\0Iû\Ö~¿õ‡\ï¹û?\Ò~ônÿ\0FS\îı9ÿ\0¾\æ>^ñı§÷?WúEo\æ\\^f¾ß§yg4ı;\ÌoÓ¼\Éú~ÿ\0ÿ\0\r\'Q”\É9ÿ\0BñT9¡\Ñ\Ø\èN«u\Êl\Şq²¥\åšÿ\0òÛ½\ÄQG\Ë0G÷rš•\ì~&[û‰ùe<MòJ¼™Â£C¿‘¨\Ğôu¯&·xRº¹;¯¼´\é•\Ù \Ô5«\Ä\Ó/µ?yû¢`y—‹\Ñû]»k1v¾ş’ù\Æ?\ëÛ§“\Ş\ïü\éqD µ\Ó]¢LHd¯ÿ\0f\ãg-0°·\ígè³¿LY\ÚwzZ\à¬\ãg´*D\Òu‹—ù~\İ\0+|\ïhy\èS\ïŸn¿¢\ìÍª¡ñ8?[\ï\æ`)c\r\\\nò\ncª\ÇÕQ\Ú.ª\È6øbe\é¯ı\Ü\\¼\æ;B\åğwV\Ş\Z6=‰ùn\\\ÅXı@\Ş\rmš\\y	\ï¢À;‹‡¸\ï\Z\Í\ÑÓµ\ĞUTXP8\Ïr]\ìJ›„Ğ€Ğ•\ã°a\âÿ\0ƒ\ŞU×“{¸™v¯ÀS÷\ÔM>\È\ìš#J\"z\á\íGBU·\"<Ÿ1X4mL€¦\Şe™d¾Cÿ\0Â•\Ì\Ì#®\ã9\İ(™a‹´s\Z£O\í<‘`\á*{õj4û¥%#\'\îD¡®IF\Ôş\àX\äÿ\0ò˜\ÃD¹\İ{³m¦\àQx» V¿HX\ÃR\à3Û­\îJ­Ó©hù\Ë\Ó\Ûÿ\0Éªl~ô\Ë\Öz wLÄ \ï¼¶aˆ‘5€Gÿ\0©ÿ\Ú\0\0\0\0\0ó\Ï<ó\Î<óO0\ã4ó\Ï<\ã\Í0ó\r<\ãM4\ãN0óM0ÃŒ4ó\r<ó\Ï<ò‰4Á\0I\0¡H\á\Ë°(CEƒO“\0SˆP…0ó\Ï<ó\Ï<ò\Ë<p\Ç0\Ï³\Ï0\Ç,²\Ïó\Ã³\Çr\Ï°\Ï(2\Ç<ó\Ï<ó\ÏÒ£À\Î4#8BGa\n€‹(ró\Ï<ó\Ï<ñ\Ëñ\Ï²\Ë<q\Ã3\Ã<r\Ëq\Çó\Ë<3\Ë,±\Ç,ó\Ï<óÁ ( Š<B	\"8Á›\İ\r÷,¿\Ìl²#\Å ÿ\0ÿ\0ÿ\0½\Ó\èp±\Ôc¶¦Y0@H@‚r?\ÑJ9p#\0\Éÿ\0\Ñm\Ñ\ß<Q„e&\Ùõë£¢s\\\è¬ò“»\ë®n4$\Ã\Â9£B3#»SCL´¯!#šÀWdV\Ö\ÛZ\ìœ\Ù£\í!…\0\Å<R?\æo¶”s<óA(0G6;/ŠşS}ò+§B\äGr\í°\é\ãÂ†1ù\×M\ß@3\å¨š–\ãx´®‰\Ña·(ƒÁ®°*\nI¹—&\æ\0Ú¾ô‡	<—K\Î.\æÅºuõg7c¾\Õ\ĞEh.¯/²l)ıô\rf\Â3\æmó\Ò9\ÇÚ˜±ûwş‡\éñÀG\\\ÑÕ€wj\ëgS\Íx\"=vd9‰÷|«g¦¨™¶Pµs\Z*!‘†\áKA}¦|û½¦xi–[`$¦“¾ë®… …øƒ«¿\Z\Ãû†\Z)‚qŞ‘$ö^\Î%O­—\0\ÆÒ˜3%¸‹3s¤MŒ\"`\0\Ê\ã©w‘š¸„©\Ó\Ö\è\áyø’Œd‰M‚l¦”7E«ˆ@Nˆ«\0\0!„\"\0…¤¾z\Ñö\Ë	ö™ZwKy¨º¤su!C\Ì|$|B….q\Â\Ó)cš.ŸºX»\ÔJ<€Uù…‹À‚É³$\î\Â0\'¤\È\0H‡°š ¼\Şš\ï\ÂÚ±\Ôõ|Š\ÚY\Z°\Ïx‚}dn\ì‚\é\Ñ8 \0\Ñ\rR\Èc;\0LW?\Ñ\0b\Ë(1\ä¡ Y…´O8r\ê òstš`^„©<ƒ_t9„i\ê\Ù&\Ìy­Ñµ[]t\è¸B\Üõ&c?’»=û†N7O4·¢\ÙNò\Ó@]\Ö\â\Ö{}\"\áü“-6× _=Ex€RØ³&(VÃ¨™Ş°ñ\âƒF\Ë/¤–I,M·iš9c~N±##ôZ[‡\ÙÜ¥ƒB:Ò·\êbÖ©s,»3‡\ÊşwYl\Ù\È\Ó\ã¼I7Bim!z¬úOK*3gÎ’34–\ZÈ^öj\0I\Ãû(s\Ï<óÀ\'\ÒhBûw‡ª\'2\Ë\è\İ?‰—)\" W…®\Æ¾$h\Ñ\Ùo<ó\Ï<\î{ilƒ€1¹\n\â¢ˆ¬\İ\íz‚¢\ê¤ô\Õ<Wªó\Ï<ó\Í7\Ù-¾WÜ¬­‚JšŒGsˆğú[—(>Êƒ\á\Å:\ÓO<ó\Ï<nÁ\Í\äb®¶Ñ°S{Y8’€\æ%‚b4gºò…A\â÷Y/\0ó\Ï<ó\Ç97Á,å©5^ó\á•d8ñ:–m\é€n\é\áÈ¿\ËøTr¼¢\Ï<ó\Ï<\é\çM­W*­d\è\Û*%úeL\ìG\í\ë\ê:H#×¦ˆ|ó\Ï<ó\ÅA}€‚G”\Ôb\ß\Õ:\ï\í\áİ‚Ù”,\Ò_:´•u›\Ä/N,\n\å]<ó\Ï<d\Êe\ì;\ã\rN\Ú\Ä:0_uÁ\ÂIP+ô[TŸfcS\\\êG\Ï<ó\ÇZSk¾}\ïjŒ®Á•wÃº¥İ€E›\äaS\ãT¹üó\Ì<È“ğú4Zs\ï	³·»2ú\ä{\Ù\Î\ÇAµM\çV|D\İùµ\é\Í\íu\í|~Ü–ÿ\0­»x\ÔvŞ½G¢\ß*PÖ‹¤\ŞTd\İt\Ç\ZœpJùú{ıd,\Ò9¬ÍCvÈ£Á“»úrÂ‘G\Òòğv¢Mÿ\0û\Ø\ëôô\\nø\Ì\è‰°ß£\íZ\è\ëcj …ş0\Ã\ÆZHmdRİ‡{\rH¸’Ÿşš 5—Á³ò\\\ÈR_~\ÓN0\Ö+#{bun–NQV\ìJ\ë§C\r–œ8	K-³Í­|u…¢]}\ÚB1û7ş=T}W[áŒ¥øL°C¬A\Õúzõø]®š\×-‰j\î«\ä\Şp\Ã[ù\Íù\Üq¹p<qDšİ¼-o¨‘\àfı8/\Ã¹ÁF\èZú\ä\ê1pıwthR0\é\ë\ÏI&ı3K\Ù{\ÉOğ\íkRn4i3B=¯\è89\ïc d•©DS5W9a_EÙ—H4F9Z]e5@²LaLŠÿ\0¼?€ù\n<R]£.”¢ù4´W´ö¥ ‡(\î\á&i\n<|ô\"¹¸´\á\ÛÇˆÁ{§\í\ËX V\ìğ\ë \ç.ı\È\0\Ò©^Ğ°&bÕŒ\Æ\Ğ»;5/w\ïZ1Ò€¢0@	§|G\ë\ê@ó’\Ñq±\é]jc•Á£¿\ÜAşBbø” \Ä\à±\Ú0ˆ–}\ç‚£ÿ\0¹­x\â±\İ\ÛC•G‰\âŸ;ú\Ú ½a¦øK—wBŸUTk\êvµ\Ó’\0z\Î\åm“›õxAh\'ó\\RµT\Z™û+X9Í…ú@¸T§hU1O\æö\Ñ#\Ğj]O724ôŸ‚T‘ºµSC¯$_\ĞÍ*•;Õ¬¥<»7\É\Ï\Ï\Ô\Şh\Ãö2\Z°˜Ø‘\Ñ\çôA\Ü<yfJÎ°Œ\ZöS\ÛÖ¥NHúØ¥¶¥$R&†/|V¢¨ƒ—\áÁ¼ø\å¡p\ç¹\ã,ğs\ãŒ\Ñ\è¡I\Ôp?7\Ó!J8²\Å\Â[¸<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï\Ï4ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ğ»$œpBò\Ç²ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ã-—µ¬<°\Ï,q\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï·G<ó\Å\0\×\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ï<ó\Ïÿ\Ä\0&\0\0\0\0\0\0\0!1AQ 0aq@P‘Áp\Ñÿ\Ú\0?ÿ\0\ç¯ñ‹ü_\âÿ\0ø¿\Åş/ñ‹üI\à\ã#Oñ‹ü_\âÕ™\nÄ¹o\â6\Û@_\Ø\02\Ï\Ç?š\0\Â_N\Ù\Zq—\Í\Ã%\ß\á¶\Ûùû`ûe‘=ı9e–Yeœ\ä4œ!óbÈ¿R\Ë \ÖÀ\Î\è\ß\Ğ\ÂÌ\É3õgeœe\ë\Zƒ#Y4“©\ß\'\Ô&\Çd¼™†°ú~õŒ>H\Z{³E\ïôe–Ye–Ye‘Ó®\à\\\î\Ó4†7GÄ‰\'?È‹½²\âdg\Zyú\Ç\Z£%4³/\àWôiiiiiibñ%ñ¯Ÿ1œx\ÎZ·\á\ã‘<\Ë\ä]½;º¯²\Ü8Õ»P¶ğ×ƒ®Mº\È\ÆG^\ÃX³‹ıX´±b\ÛKHş¬}\ÍQ\ìwú·\æÇ‘\Ô\á\Å$	:\â€ü^Î¼’µ´\Ã	¯\Äi8t\Ú’Of4\ê\Ş\í»\äw®2\Ë$»±ö\Û?\\\é—n“õ={\r\ß\à\Â\Ç\Écß‹ †p0\Î\İ,»\Ø\'#$d\Ãm\Z\Å\Ôò`\Âú\Ñÿ\0„qee†\Ø[m.˜º³•¶\î\Òm5~a\ê]u\Ï\Ö\Ñ\Âlq³\ä¿\Ñ$\Èp\êC\É}<õj!Ñ‘\ëÉ§—tŞ¶C¢De\ÎV\Û[x\Öñã¿«ı´\á#~ÀŒ‡ñK£–’/0N\ä\ß&\r“\ÖÀ\î‰÷ğE¤fxyù±ø³«‹\"\\‡}—\'»Xzş/\ã´\ävw\ÂÀû‘½]š\ÏŸ’‘+ŸÃµóœŞ£x\Â\×Ä—–­Zµd_^XaÖ\â\İ-‘„\Ä\Ï	F¾l>%\Élş\×ò\ïn\Ë_›mx\Ë,»-,ƒÕ–ÅxÏ†Vd\Ù<]ÿ\0#¹\ï\éøımÕ“\Õ\ì.J¶1Õ»e\ß\àYeó]ı~Y¨Ş¯·\Õ\ÖK%­¹Áo\è9\Ï\É8\"ñ\Òö\Ë-6\éòn\İ!{y\ÙO_v\Ûø˜\È\Ë:¿\ËcKù\ß\ÆO\ĞFñŸ\î>\í·?\î\Ş6\Ù »»·§\Î\Ë\æ_3§3m:-A·\ëñ|¶z²¶N<v\Éñ-•\Ë\Ú,‰\ëmx\ê\Å2]¬²\Ï\Ãmze\İ‰€\ã\Æ\é\îE ;ğ<o\î\Øü\ß\Ò>\Ëû7õŸµµ÷k\îÕ¯»_v¾[_v¾\á\Ç\ŞƒiO^r\ËR>¬}_\ÂG\Ô}>¬}Xú¿„\ãğ,<Yo^2\Îú_\Ê\áaûDÉó¼ˆµˆ\è9\Şr\Ë?_\\\ï;\Æs¿l	i\Ü:6\Û\Î\Ù\Â^wò\'Œo\åfF2~\Ìü3–\íz ù€ùkó‹&N\î§x\Ëm#õ\Ìl?R\"ö8O\Øq¼\ä\çS\×	S»³Ë£¨|üÎ»‰¬¶ö\ê\Ë\æx\ïõ7‹§ú\Ë\ÏS\åœ÷o\Ç\Ë–\èw\0=²5„2.ºğ¶\Ûoú™ü“õd7…‡\Ö]õ\'õbÿ\0V¾\íZµÅ¿«_Vş¯	»\ÆiGV‹8t²K,³ƒ\r\ã8l\Ñ\Â\ØH\ÈÀ\×|~­-.®­±ói`¾‰m¶7\Ù;]ŒzB|X\ç\â³÷\ÇV­\í®^–Ámpq2xf\Ş\'\íú‚\Ç\â\Ï\å›ñe–<	3œ»mıŞ—“g\Éı_\î\ßİ¿»_p§¼…\ã\ã#\Îö]o =Y^ò{-oHGN\0;ÛŸûqŸV–Ÿ€+m·@–1\r,–­]‘·s\Ç\Ï]¬Y\Z\à\'\è‡\áÎ§õ&õi\é\0t°\èG\É\ß\Â]ƒ:\à\îòşğ\Æ\Å6|@\Îk\Ô+{\êQ\"rY\Æ~@ôûÁÑ™/L­8zt´;ùƒó3C°:N]\Ğw2\Ì\êO¨I\ç¦\Î·gQ\Ù\Ók;´õ÷½H	D\Ä~€>föõ\Ë½C¿—cX’A\ÄC¿b\íóA‚ñ\Èò{€\Ì`,\ë¦\\°\\º8\Ûøm‹wö0\å‰wŸ“//gmÑ‚Ÿ2‡|rò\Î=^\È\ZH\Ç\ÄË®\Ë\è\æ\Ë\å!O«g_µ’òõ,Õ¡oñ\Ø\'\ê$w^K»:{öô\Ë\ÄYg)0\Ø~!g¹v[^\Î\í>\'\éÜ»ûõoI¬9\ä#\ÆÄ¦°uó&{\Ò\ß\ÚA\ÃÜ£¶QÕ¤u\ìå¥¼$øB\Ùü\È\Í\İı\í\ßc\Ç\É÷bÁbÅ‰â¿µˆ\ï»,ybC\Ò~›]™66tx\íüµmB@º[u¶ßˆl¢Ûœ.†OkM\Ïa\'>FV¯I©²Cb\×İ‰—FHØ“¨\ß(›¡6\Å\Ô6\ÛÀœ|q¶\Û\ÆXe¶\Ó\\:\"8˜~/-‹%\Ëg˜\á\×»\áƒugxk#\Ñù‡\à!ù€\ë%!\\”ò\Ì\ë”Š\îÔXHø²\êğ»\ï›\Ä„ÁòHY\'\Äõ&\Äz†]~¾\ĞÈ² \ÂOpğq‹0‡\r\ÉwÏ‹½\ï…\ïƒØ¼–\Ù\"NH\çWû.¿Y\î<¼ˆo´\Ş\ß?ˆÓ‹0Qøº²\Âù‡c¦YX…\×\Ë1†1\ÍA/XX¼z\ã\ŞW‡x\Ş1\êÁ`¶.\Ä;ü	\çğVot½\Â3ˆ}Œ\0$|2e®ÁnHÜ›3\ã¨öm†÷Áo%¶o\Ú{~‹oòLe\Ô\ËOVK#†Á\ç]”Ó—x_p\ĞÁ!±›w˜Yw:a,Ó¹D?Sg,\Í\à\á€³\Ñû”š´9a:˜¶ó,\Üõ?ƒ\ï.‡\à›t\à\Æ\Üm€\à\á½`B\Ë:\Ò=¬@›BLó„|¾\Ëft@ş \Ë\Ğ\ÛU§²\"|ÎŞ²]\ÚBí·‘`AjH8\İ;„\áoyY	¶\È%\Â»ìŒº³“yz™\çs?‰=!O\Ù?e½\Î£¸a‘wc´¾g®\Û\ÏÅ‚\É\Ù.\Ã\'\ÎI(\Ùj²Ş ùdQƒ·°ÿ\0\Ü!\í<œ\Ï’\Û-¾e¿€oDqNˆwe,@za²²:”û\ã,\ã\×Á\"Ÿg\Ép\ÖRõ>–,ˆ„\îİ‘\ße­§L\Î-:#È…\ÖVŞğ~&+Œ\ä÷l˜û\É2\Ælü!	\î\Û`\ØiOWF\È\Í†v_K\Ë7¸\ê\'²L²Õ’;d\ç«\â–8~Wõ\r\ãõ\Z\å?4ZFx\èø“{€ò]÷ñ\Â\Æ\ÒEºLµ¶Xğ;\×?HKŞ‚\è\êF\Ş\í\ÛR\äª!\Ã+\Ü\ë©\Ä	°\ë,À<»ı´‹\ådt\ÊûúV\Ú=ˆ\éÁ\'W\ëxÙ·I!ÀüIÕ¼.[¶Í\êwf\è@±{\ã9ıö\'v\È]$<\Èì³€\ìùø	Ã½.úu\ËC\ËBÈ¶şyÿ\0\ÄKfÍ‹0KlYbn6,\Íó=\Ùa\0³ÿ\0@\Ö\ìü_K\ÏúÅ€{\0ø½B\ÏO˜€_üX¯õz»‰ÿ\0\İ\Ñÿ\0\í\ê¿ø–O›ovüX+-›·\çòúŸ\äA–/÷_\ÇCOIô›W\Çü¯ÿ\Ä\0&\0\0\0\0\0\0\0!1 AQaq0@P‘¡\Ñpÿ\Ú\0?ÿ\0÷¯\îşÿ\0õwõwõWõwõpú\à…|Ÿ\Õı_\ÕıXµd¹r\ìø¬\á–Ye–Ye–Ae–|3\á¼m¶ñ¶\Ûm\ÙHº\Ê°7%§am¶Û§%op\Èò÷?-ø®¶\å¨\Çm\çy\Ûxõ™³»^\Ùcm—­´v\í´rgŒ–\Ë\Ç\npt\Ãşm¶\Ûo\r¶\Ùv½]7E¤—¬\È~gN\ZYôO\ê\'¯ş’¡V\Òu>\ãxÿ\0\r¶\Ûm¶\Ûm¶n‡\×\0}³\êK\ï±\Æo\ÜK5˜;r<\ã&\Ë8\Ë/|Ov¡°¶_\Äo\íş\Úá¯€s\Ó#÷\ã\'D\Ëdc\ïD„ƒ‘\ä¬}\Ë9E\ç’V»`\ã.­.®­-º°°³€w\Ù\ï²~–ŠÚ²\Ë,±·öJú >Àgô¿ˆt\Ë^\ìGs;f*p´Ÿ,ûK8\åKÀ™vÙ»OVq„ud™\Çó‹«©X\Îî½—¸…q;+P>\î¶8/\â6yÂ¶X0‹Ù´{ü\Ü\ã™a\Âö\Î2Ë¾;ùe‹Gµòè\È\Äi0\ë¨ı\àÁ\ëƒŸ¼\à‹„C/¨,·:±Ü‚ˆYû÷œ²\Â\ém\ç\Ç,·-\ÖûÈ\Ş·|‚Ë¢RË¤[=ZıI3~)¦6X¾\ÃRğŸ\Ë[¶\ÖïŒ²\Î\0™bÈƒ‡\ß\Ôw\Âvu;ŸYËºm–|û\ãÏ-øw\Â\êË²\Ä%\ï\áœ-²ú\áºÀ¸\Ém\ä`\ãm´d½\ì\Èü\Ûğ\Û8^H—Ya\Ãe‡Õ¶\Ûdõo|1<6–\Û6òš@K\İÍ¾c\âq¿\æ„&fK¶\Û.ñ®\Z\ÜÏÁ¿V¶\Ë\ê{„G\Í\ßõ\Û³3\Î6Àı’\ìÍˆu÷,zƒö_B\İ\ê\ŞWÔ­\Ó=‚ù7\İı°†û±ùña¤~EüX7ƒ°³\æ4\ï„\ê\Ç:Õ€Hl‰\Ãm\ã`\á\ß!´°A÷-xz¼¿\Äi–gVO´\à\äƒñx\Û,;†œKŞ­öIš˜u\É\n1o\Ën°¶ú°úœ#ñ_ªO\Ù<ƒ\í\Äg\â`òú°\Ü\É­\êG\Ù~ˆœí­¯Ì»\Ó~\Éüƒ\Ö\Õ\ë~\Æı\íûö7\îµùµkók=°º<µkókókó~\ë÷_²\×\æ\Æl¶ı~[Üûa\è°\ß`û´û±5[¿¸¥²:\âZ®\Ş[”r¯\Ì…\Ì\İ|±aq™wõ	·÷+:°\ëƒG»Ä¨u\'°Cm}d\Éú¾\Ñ„¤ö\î\×Õ§»\Ö\î:\Î>>¡o4 <¼\È,\å@\êQİ»Y›n\Åk/\æ\è½\êr„=ŸW\ít;l\0»0ô¶!Ô‰\Üy¸J†l³o>£ÕœL8Jµ$-xN\ìGošN£Qˆ°_.\Â\ï\îÔ©ƒ82{²\éÕ³P¼\Û–»+ø—¶‰\Ï[M\ãy=¼pq\î\Ñj\Ë-n\Ë\ÔGø]`¼“\Ähwd`Zzn³¸M:½…ŸM‚t\ÌX\ÂÛ¿s«Ã»\ì¶BŠ°Bv\Ïlød{¬‚\é\Û1z‹\rú»\Şx<ÿ\0¬còG\Ğ\Ï\ĞÀûl6\'V\ìôÇ \àv\è¶e\ê\Æ[(aİ¸{Ñ¸wb!ş:´`ô8\Éag\ÎG«7¾Mµ:··\Ô\àóüXü\Ú[g`¹:õ\ŞÕ“¤¨õ\'«\0\É\Ô×ƒ8±xÄ‚ú”±\äi\ÆIÀ¾ ºGIë¨²X\ì;Û¥\ãxñş\ÔOø»M\r±ø—\ï/\âqõc<\ßø\Ûu1Û»F!Ç‚‘Ÿˆ\ß\Ì?•S\Ò\Öö_Vu2lü\r\Õ\à\î\Ã+\àÛŸH\Ñÿ\0œ“\èQëŸ»&Ÿ’ûò\ê\Ë!Œ\Ï\îqga#¢0³¦DûºHCCû¾¯©OM¨˜}\ßa\Æ\Æ]­»•e\ãü=öú‡ö]:±”0\È{3eOòLzĞ™\ëë—­»r<[\ÜWgK÷±e}Iô±©¢\Ì;\ã\Ìum¿\Ù\Î\Ë8B\0û~¶g\Ìó„ÿ\0Ìì–µ@\èû~–Ê¿’ ³ïŒ–!£­\î\ìpòĞ´\Êt]yÁ‰\ßrQoüR\Å\ä½pD\ã\ì™òd†Åûo¹£gc:ZNOÀY\ë&\â7K\ç\Ï\ÙüÀu9ug@\Î™f‘\à‹.ù…\ì™\åšNp?s+	}œ¥³\ïœÓ†z#_´gÕ¯\ê1\'=’\Î\Òp0lCı6{²ÈŸ!¸mŸ\íı£œ\ØMÚ“ş6~\ÃÀ¸\Ûx%:õ,q:‡|’»:Z\\l\à“†K\á\Ôg\í¶,²\Ëp±÷b\çq\é¿‹pH5/e>\ÂúĞ‹\í\ê·vY\îO¹A\Üò\Ø\ì7\Õú¥>“\Ûbaİ¥¥¶–ñŒ[b¾\ì’{~\Î$=.“òŸ©±¿tƒ\Û#x\Ë\îq‘1º1À€kÅ‚õ6LHooÁù0\Å^’\'··|‰¥Ÿl·^\Ã\Öğ\è„ğ€=€J…kf\ĞÀ{\'Ô‰ğöH»N2ÌmHW\Û,\ç,aIG˜e“8—\ÙR\á{vXtŞ…ƒ €üBu}³wğ¼BYyiÁ\r£\0ô\ßa(÷‚pƒÔ¼œ»\Z¿«[€Ã¦ğ²q-2\Ãä¯©”;–u Ù³\àwû›Õ°Xƒl­†Zs‘\Ş\ÎrÇ‘Ç¨,!Ó\á«Rtº´ø\rŠ3¤P7\ß¢\Øf¹Àğ\'œ\ã>,Á²YÀ„\çÏŠ\Ö\Ù`¿s6I¥„€™\É\ì–\Écg‘ä¶\Øö÷\Ã¶LY1\"\Édw&\n\ä¥\ÂF]\ßPY<Â—¿ˆµfl]C\ŞÀJ?œDè‘€6pÃ»\ÊN3€‘’p\\6U\îÜ€\Ïm—{6\íX\Ór\Ò\'ƒ\Î€ƒ\Ä\Ôp=m˜\â6\ßxg\Ùµ—Q£Œ™ö.G¶C`³8]p=6xGdI\Ü\î\è°8É–w¥\ã\àa„²7ƒCx\á6c•\È÷»Hös_R¸şÇ°u\Û?S\æ\È\È\Ë!\'w8\Ä\Ø\äèµa˜;{\'„Y\Æ]›‡\È\Õ\Ù\Ã\áœ“-\î\Ûl²\ë$\ì†ò\r\í‰„³z-3 \'\Ş>ôi†šC\à\'\ÒP˜ôO¹B\Ş_‹;\È\â;xbƒ •![33¬³\îKØ‹·™õ—\Õ\Ö^z]:C¼ŸS6\îò\ï\Z:a¾²ã„ \×`\ÒL³€›˜B\Ş\âõ\"\á;€³%¶\Ùa‹S©ıÍ‡’¤®÷o\Û<\'ÁÀ\Ë\r:œ1€;u \Èp¤\É:»YÂ‡²6M®/Všğz\ŞxÓ²DôŒ]¦ş#®¦}–sxˆg_\Øa=Z%\Û-lÏ†q:»µ±Ø‡V\åÜ¾¸\ÎK„/\ËA=\É#r	\0\ê J\á\Ş\Ëv\Û3Ï\ïE¤\'œ‰½$6‹\ÌK.\Äv|¾SL‘w1\"\ÛEµ‚PÁş‡$\à~,pú/©kn3\Ó\à\Ù\ß+9€zrÀ\Ö{uˆ\Æb\êÕ«m„[µk…m¼\ì6ñ¶\Û,¡–­°‹V\íÛµjİ«V­Zµj\Ô}<b\Ë61ÿ\0L¯o\Éÿ\0¶&¯òCğ÷ÿ\0—–o÷»\"Ø¶\ç„ôñ’ºÿ\0\Úñ{ü¯¿Y_-H>\Ä:7ó\é‡ş\ì\Z{ÿ\0j\Øü/¹›‡\ê\Ùñúi;—¾6Züÿ\0\Õÿ\Ä\0+\0\0\0!1AQaq‘¡±Á\Ñ \áğñ0`@Pÿ\Ú\0\0\0?ÿ\0ñ\0PrÁTv ;ÿ\0ğšŠŸq\ê	\Ñ\È\\]iš\Ç~˜¡\â\Ó\Ï|\Ë\ËS\ét:¿~‰7™À!\İ\ÑVÀ\Ê\"Ùª2&\ÇÃ™ÿ\0³ş\ã\è\ä´s+\ìIEZo\â\îˆú·ñ0â±®“c\á\ÌN—±}-…ø¼CAD{+Ç°XP:\ê/\0kó™Gñ(\Ì,^’“\ä\Ìl[½44\İC€l’)‚‘26ø}²$¢\Â\ÃÊš\ï\Ó.×›‹\àöY™\Ñ\Z\\’ü]ú\0Zš?§\è\éÜ¸\Ü	-U\\ \ï\áe\Ù\éXº_\Ğ\Ä·P×’\n@\Û\Ë\Ø@(@Qe7\î§ş\ÏûŒLmP$q-põ÷ û—	Jô\é;¶\Ï%R\0†Ø^\Â6(Şš\Z\Ìÿ\0\Ùÿ\0q\Ür\n\ê9\ÂE­²½²”\î±~\äPE`Z\Z\0\åş\â0\Şd—/\ĞÏ˜9M\Ã\àRøŠ7¦†³‡z#\ê\Øøz®\Ó\Ò9a\è.¤–4ó?öß¢C\r\æAsÿ\0gı\Â6\î«\éWT6*…øJi\Â\í)\àpü,1%J4\Ó?ö\Üa†0£ˆb\Ú\Ôn\ÊÀl/œÅ°òe\'Âš£U›s\Ø3*\ï\ì‚™a;„\ÒC–r‡˜¢zy\Êzû/\é+£\ê¼­h®‘¤|!ÁH™|0ğEˆ)\Ögş\Ïû—xö·:şdƒ\rã²±Nü=KH8•wöF\ÓGj\Èc\ÙCˆ\Ï*¨­VÒºVO’S\Èj\ê,,aO\ì\Ä—`C\åf¼\ë\Ïÿ\0\Â\'~r{ğü61»\Ëÿ\0ªP\Ø\Ş\â^Œ\0¢Ú¦)J¦®©ñ%Q2<‰ºUz\Ü¸ûL\Åg¨2¥th|aúxŠ–†¶Õ³õ\î	µ5†Öµ>…:.f“Fª\Ë_\ÜK€e\ë\0¯rşˆOŒ²Í¬Ø—üt\ÄÀf\Ï\'	]¦qÄ¿ ]±\rı€x§¶8\\I\Ş=ˆ¬6\Êi)…3\Ã\éõú4ËŸ—fGVŞ•Ÿ÷{€÷\\<€\Åü\"\è\Ã-\Ìı.\ån…a¾/\â[\'\Ê\ÒH\Å*°ª˜„\Ñ\02<©ºUŒ¨T©k¯b¿ò\å?´\"À	K[Îª#FR•\ì\ÅŞ™{\0)¡P>n~/öú@|\Ç\ÑfŸ÷ş\è-µò\ĞM†©lX©\Ê@\äB\'v[\í’ş\Â\0µğß¬V\ç\Öy˜\Ï0 iY¡ñ ëš–ø¬<\ç¨\0\Úh‰n4üpô¸q¨(.\Ä\á`\Ğ\"–ª‹º\\QÜ¶½,û•\ã³.\à0W\Å7\Ôñõ¥\Ç\Øü&&ŠY\ëí«„<¤¦‚\×·VõV7\\\é­õ›\Ø$¬\ß\Ë\ÌOx Š›°–şN³0\'¥\î\Ø\íWi–·-B%]\Ö\âª\è\Ç .é¾¥R\àªÛ”»„•²«*@{ÿ\0ğŒ›….n\Ã\ã)ÿ\0•Ôƒ]y\ÖO\ÈKÿ\0U‘±a9õ\ìu“Fmr¾)öˆ.—B¾iü§ı\Ş\àŒ¡s~/Sşÿ\0\İ\rI3\Â\ã9\Í\Å/á‚¯±:\Ä§·½‡¤lNô\0^1‡\rh8…{*R\Ä\àYN{\Zˆ$‘5b\à\Ë\ß\Â\0\è\Ùv(;ß˜C^@ºg\'ğö\\¶\Ê÷n’\Ïş\ËÀ +(P<(.\Æ´\Ğ]v\Ì^UM\roE3\Ä\0õ¡ \Ç*O,>šò\Ìø\Ê\r\çîƒÓˆfJ¼m¨h/¼òñja|Ö½.Q+¬6.¿–£šV\àÕ§´\Z·•gµ_›ú\î[\î1R\ZPLˆ\Ï~…\'/}{v«p\êû®\à»\Î$\ÂÓ–\Â\Ï5( \ÑÚ‰\Äk†Ã¶!h\rªš«÷Tªp(€x>s\Ô\Èa\çxTø†>\ËË·8\ï\Âı>²¿²]wÁÙ£7­K*ö²\îX1B†ı©.	LG\n\ÄTe»\Ã!ğ4×–ZjT\Ğ\ÏtÓˆ\Ùğ\Ğ^7y\å\ã„ba«\æ¢i¡KJ>‚g\å\Ä(¢…:­Œv\ÒEU\Ûlƒºò\ã,Z\Z]À{z¦ô\Æ\ê#ƒrÒ4†kP5¤S\'¥\Ñ\ïù’\Í\èx]#€\Æ\"Ğ™fG¼®\à\0\íP\ë¸]\Ê\"\ÕĞ²ö|1pQ¢›Ô~†k½`}\í\Óß¬\êÛ™E¬-\å\Î\æxy\È\Ób\ì°Eğ\íò\×¥ßˆ‰UJ\ßp¦Qäƒ…-Z\Ç5\Øú|À\r¾‚\Ø[/\İw(aÈ³®\Ë\Âd\à\É\Ã>2~¯Á~%H2\ÛCcHŸdR¬{=.ÿ\0\Ï%\ìo¬F\Î(J”Ë¸Ğ½D¸¸^®\Ëu\×\ØdM5\èÁ\È\'üş—\Ğ šl6ø³}\Ô\0¥kp\Èšòe®\Â8b!%g¸Æ¬ÂŸ<tô,°B3B‚½PŠõµ¡\\C¶{\î\Z†W;\'b\è\Ğß»ÿ\0w¸ı\ä9tÎ¯^†?ù”Yƒ½e§@ş¹\ænC…t|\0ô\0MF\æË€j´œ\Ç}\rµ…U«W\Ú\Î\àˆ\ĞM	n†\Åø;†P£WYPpô\Öş`qs[}c:\è\r²ı\Üæ‚ş\×\×E;Ù¢\rX(64÷#Ok–Ô…¶ñÏ¥¸Bª\É\î\âª6\âWjµÁ\Î\î ¶‡\È_¥Œƒ©N\Ç\æUƒ-š0ªüÁ*Á³\Ñz\éÂ‘±–Q£V\ËT±.PŸö\ÉV*\0À\Ùbw¼½\Ì\Ö^\İ{A«óR\ê€:®…Z<\0\ÑÀò1¸a´\ß\Şş˜^ò´È»W+\åYb\0lm0z;4wÁv\è–-yKR\Û\Ç>ŠŒ1²İ‹qU˜\Ø‰]ª>\×.¼<‚\Ú!~€Xğ\Ä Ë´Ÿ¡ğ$´\Û\Í]°t‡\î™CB\È*«ª\â:ºV³ûPx*\'`¿r•~\åO…B€\Úûô]\ÅÍ­Ê…´¼K	X2\ì\Û\ÇÁ£\à#ùi•÷iZñ¨v†U°¦€8– Á\Ó¢õ¹\n\ØÊ’\Ìa”2Î…?‰v¶,\ÂX‰ñ(d\n6…mRQJCa¯K`‹i‚5g)>¦1\Z†.\Ëù®û—\Ò\n…«k\é\\J \0½\ÆA‰Ô§có\è½%\Âp\Å\Ö\ÊÛ¨‚N\í×º9|CPö\':µh\Ö\n\Ôrw –ŠK<3ö1Y\È\Ö\Ú\îWHÀ«j½£p~:ƒè˜¤²oà¼£tn «®h «\à®¦J¤\ë@Ü¸\rÁ•CÖ®]\ã<ú~†+9ºo©»\Ì\ÙµM\ì¬f7\"€NÔˆ:8™(9\×m­²\Ş#›`z³Eøô^¯o\"¿\Ç6·*\ÒğDhƒ¨MÒ¢óŞ­\í•Bœ.6‡K\Ï>ƒ\æ[F\Ş\×k\åŒ#ƒ\äGdT/¶´|[_9\é\Ì÷iW\åÿ\0û—l\Î3thoñ\Ì\Ğ9kÓœ6\Öß£ÿ\0÷— áŸ•e_\0ù]f\æ\Ë\É(9\íX\ëÿ\0\æiƒ`2/!Uöw¿Ş“e†ó\Ö\åğAaV\\€=ø¨\"AÉ»T\àñúª”Ce\Í^\é3Œy4\Ì|\Zb\Äk¯!—•¿ógDr&ğƒ^=“oR\\T«x]\Ùz\Ù\âú—÷\Æ‡+\ÊÏµD T\ÊÁ•\ä\ÖÜ8Ú¡6/-ª\Ëú¸;Ä£¤xº\ä\ë\Ë	\è³.‹i¦ê»™[E¾šlròòú!š•T\Ò}–\Ó\ÉqV[b´\Ïv~ˆˆ\ÒejœñıÏ…ñd\Ü\Ûô¿£“*(\ÉnJ¦’¾Z{,]†Ø®¾môŒ@F“(	lˆ•£x|Á(7L\0ƒÑ®G9=\îÁy…hÚ¹¾h´*t„:E´°\Øø‰T\Õ6Q¼ûBHÑ¢‹w\ç<.ß‘‹;zV]]\ß‚\ä\Ç\åñC‘iğ£k*j\é~!:@YptZW¯E®•Yš—QB€\Z{1&h6†ğ©\"0Cj\Ú\å‚!Q¢¯b`\ê˜ai\\xM¡–š3È³!\ßar\Î[ñ]}*B—ú\Æ\Â\ÖÃ‘«O¼²\ÂYÀ_Œ,5é¡º¾J§„%.•œ€\Åb\Õ\Æ3»ú„ µ\Æb¥,;-€\É\ãLÀ B\ãH\á¬d­\ĞÛ˜n‰ÿ\0“ı¥¢­\ì€_\âuTö¸¶ğı\Ë\"\Öp5`\rœx!ŠÀ¯Ab9\Å¦y\Şx-\"¦rUf6`#\ÒG>\×\ï\Ìö˜…r\Z\rì¦¦©†•ÇD\Úi£8\ì‹2\İö(\ì\å¿­UûR\n_\êS[“VŸ|Bø®rJG\ÓJ˜ª\ÜüpX,^Ú ó\î‚1¦\Ë\ÉV*!\ìø€{6\í‘YéŒ§5©Y\Õ\')¤gµkxge…\â25›r/ıfR+N?ş0²Á\Ôm0´\á¼\ßY“\0¡€\åd\Í¡ R¿\r\Ø÷¡õ\0q•LÀp*n\ë0w95\ä\î\Í8ğşH¼ PZ5\ÉEü<0T-0>\Å>÷\ëvAó\È\0\åO˜aC]5‚^ƒ^\êó+*º‘C\æ·ò\0¶\Ö7eŸ,¬\Ê\Ût\Øy¦‹\éfS8‰ ò­sP$SL\r®‰\â\ßhªPˆ\Õ\ìk«\ç\Ñ{ˆ•3Y\Îº\ÓzP\áÀa\0Oqı¼iy“O’	\Ê\Ìş`\Ù\äòÃ¢2\Ì\ìò>=\nr‡Rú[t’“\ä²N0^#ßƒ/%\ä>F\Ç\Ún~dÚ\áóub•T\Ò\ÍVô\äü\ÃÊ„{\\ÿ\0\Ú\é?\ãt„‹\àVR~{l®œ\Ó]Kf·;2ª7{º§7­DrEi\Õ\ÙXx2d­\Ã\n¡\Ö\ÇB\Ê@÷BRSÀ>}Z3¿A\\\Ê]\î19,rÕ¸/z„ş}\Z´\rp)û\" [>Pë¿’fE]\'?\nh\Ê\ä~F8ı“K\Ú\0\ç4\Ş|\Æ Ä‚‚\í\Éuø¼^ùmZ¨±6.ı\0|\Í\Ñ(¯²üL¹\Ï\Äx°_4BÖ•aŠ¦öR2¼S\Üÿ\0±\Ü:f©¿kª\æ9\Z÷Ug²~%Q\Âò…d÷ˆ\nd\ä=@0\\5)rjlóWó,ö\ï¬7WÌ¢/X1C¿dU²±8G¨—@Ì£\Øt\'\Ê\ä~F8ı“K\Ú\0\ç4\Ş|\ÇM”‚‚ƒy_\×¼€¼[j\Õu¶&\Åß \à‚= È½û<6|K\Å\ÆU´ñ™óWœC¨\ÊQß€\Ğq\î¬q\â\Â\'ö|!š+XGùñ*h*„÷–|\Ò{¬ ¬7\0$S„¯Ï¾2\Ì\Å\nO\n]qÿ\0\Z¨J«ZÕ‹¾O–vt\n?3yÁGÿ\0PAl\ÊÁ?,¤ˆE\ìE+\Å\îZIp	c…œË„:NS«3\É)& LbÓÕ±œq€‰X²\\“[´1KYŒD“Rq¥*Î˜\n;µ¹­š\à·6­.­k\ÅK\ìÌ†Ë¥™\í\âo¶ñ¨-H\"¦Ï¦ˆp\nŠ \â¿W\æ!\Òë‚€\Ï¡.\Ø*caŠ\Ä\Z°Ê­\ã‚8´”@ûCIf¹‡*D\ä±@³\Û/¼¨\0¡›\ÄZPT…¾h_\Ä]F\äğYs”¡\â!•†U\ëƒ2ŒA\\	²\Ğ\ÒY­,`\rO%`v\Ç\ÆV½¡)À„\éˆC\áş`5´¶•gOP\0 P’&()¢­¡\â¸){Á \á‚Á%4|\ÅH,úr\àv\å-&mÀ\×ñ\ê\èkƒW±…Ú¬ú\ÒG²\Ã\n\Æg~\Ó\ÂA\äa\ï6T\0Ÿ–SB@¹0¢Ò©eÑ…\ÄyB•ª‘T9\î4\rpni\Ó÷Á[\ÌD»÷´\ä{²÷¤š^\\†V¾ˆ*(Š€İ\ÓTøY«h\ë¹J6³wh©ßŸ†~X™w\ÍÈ‚h¬\îñ±$\ËY.\ÆZh\'°?hn\à\Û\ßymB-\éK/\Ò.MºKh\Û0ua¤\äG„r300^š#÷ğFmb\ç‘\éN\ÊÎ•0¹\0Ö‘º1g>‘\nf\Îı\ç\î2Š\ì>{rø\É\ŞP¥j¤U{\\›štığEùˆ—}\Ús}\Ø\íù——!•®8 ¨¢*vCMS\áeñ\ÔXªp7kX\Å7Vkƒ\ê_…¤XE)\Ï=\ïq\Øòs\á*\Í°+Ø©fùÌ®”+ut‰&¤\ãJU0·¼\â²\Ø\çs°f§º»\Í^?ıw\ÌùŸ3\æ_™~}1/\Òü\Ëó.\\ù—.\\¿2üÏŸK%Ï™ó\ëgr\åù—\æ_™~eù—\æ_™~}/\Òÿ\0Áÿ\0ıœ\ÌúgÌ·¸\\Ï¡r\å\Â}úg\Ó33=\Ì\Æ\ÆYU–½³’,\ß\ë\Õ\r6µ\ïpKpp	^ñ¢E\Üf4\ÌTª\á‹X¦½~}~ı3è®»\å”!g™½\ï·ñ®G¸¶£«,hy\Ë¤š§¨)i_ê¬’~\ã¥…ÿ\0\Ğ~fH7.,\Z—õ/O¸_ø\İKe§LW\î˜ˆ£pH\å\nI;­‚ºô7<%²ñÜ¿¸3Ÿ2óüK—/Ï¥Ë—/\ê\\¼Ëƒ._¥J•\èJş!\éR¥Jõ¨†\0]®£½#v\å\Íôx\" \æ\rık\ÆnT¢\Î\Âd›ÀK³\ÜSœüBT€Yë®½¿™M^÷‡\ì‡Ş‹³¸zT¯J•F\æ_mJ	SR‰²8¼<2\á¹a5ÑµV\â²˜ñzA\æ¬ù*¿^\'R\á™e\Ëô¹\î—›—\êzó5\ép‘)\êÃ¯“1ö-ª+¬Vò‰Uˆ \×K‘v\ßVSt“i\ä44\çvfø–^R¬\Å\ß¨\0•k€›\"A¾¾%Ë—/2\åÿ\0©©¶_\Ø\Ëj\Ì\Ñ.^¥\ËÌ¹R½*T©^•*T©R½kÖ¥\\\' €qu—\Ş€†RWEF¨¢nh\â\n¾qKP\ë\'\Â2€T¾\á‹\Â6r\Â²’ªcÁL\Û5\ÚU«£Ò¥\\¯WH0\àAF®š—±¹ŒF’¢l~„ó\Ó\à?\İúzeõ\0#7.\ZõZõjµ5^·~œú\å/pe\Ôq~ \âaPTõ\rÊ­¾SWğ\Ì\æ%$¤¤\"V)F\ÆÖ›¤Qé§‰\\’´\äº\Î?6ò«\Ë°-hc\ç\Ş_‘E\\#…\ìtû\Ç%MR\ä\çUx;¹R%h\Èü\Ëo$Üº\ã`\ï‰\Æ\àúX\çÒ½/2\ËuT¯Jô¯yR½+Ò½\×\êW«§	\ï?¨!±7W5+)‚\'7•eŠš…]BÌƒ˜y\îf¹÷–#:ôvÌ©6Ol©R½*Tø&	rc1Àı“©¸bQ\Ã[–^w6\åŠ\í\î†U=;’cPœzÜ¹w/2ò\Ïô´·¨\Îj7{\ï_\ãvN3\0\ÜI\0i/‰^].\İ$«ÅŒ(e/Í¿\Ï\ÜdS!Ld\ã\ßÄ¶´VÊ¯ç¨¢Æ½ª‘·À\rÂª(Kj³8UA€G\Ó	Qeµ\Ö	ó5\Ùx\İ0`\ßß™tyƒ\Ëe\ß›ø˜3Ô¼Àõ¯ó¨•ş\ëR\Ñk!Œ+ªö‹\Ì\"®_s\æ5¢­ü¢ƒù‚\ruk\í0\Êÿ\0+·\ÔÜ²¢ƒj \åyVk›F\×?QÅ–\ë\á\"X5YCgg—rš&RR‰lf]µş¼C$/\âu\éuÇ¥MÀS\Òñ,ö˜˜ô´\r€\È\î#8\0‚\"²óğ2Œñ\\ƒ‹%|+¤‰­=\ĞÜ£Z)—T\Í|ùX˜t/dó\ZV\í\ÜÂ ‹\"\È]o>|LJQ§fV½\åœf_ \ÂgŸS\Ìş=8ş=F½jW¥zT¢W­J•*T©R½0F*¿’˜…G,À+rù¨\"\êw2^\Ø\ÄY+(ğT™¼šrz\ÔHU¨¾™‡”d\Æ_lq\ï\n\ÉeàµTŒ\ĞH\'µ³<\nÑ±^i¸¾¥aö^}o\Ñrı	¿xc\ÑkŸMÜ¸2\ï\ŞVeIú†\ï\Ğ.´^C‡>ük\ŞTvüÙ²\Í#\Ò,µù†€-?Æ˜_\ß\Äj”Vª\'ªq\ç¹^dam_=@Y\Å;\r¢ikñpº\r½Ë—.\\¹r\å\â_Ô¿yó/™rÿ\0\È?Â¥J•şu—Hû&$¢ .s_(ŠÊ·C¾n\Â@5XR(KsW‡Ã”¹”¯Œ–\Â\à_\çQJ‡_‰Eó¶\Ï\áGù†5| Šº@Â¥FŒj]_&~e¦SœCª5Q\Éo+ñ( W1²\0q¤\ê^ÀKx¦X€¨–)\Ä‰G\Ò\àÜºe\ÜX²\ê=8¡sr\ìy\ï0`\Ëõ\ÔW.\rÊ™T5¼ş\ã[(<AphŒƒÄµ\0¿\ê¬#×ˆ\á=²\Ã!§šòÁ\"‰×ˆ¢Tû÷.¢ª¾Jş%\Ü^e\ßû†}k\Óm_§ˆ?\àzT¯Põ¯RWø\ÔV> -\Æd;¾\å.\ÛG}\ÄVh‡^\'z%.\"\íJV±&\ß\ÎğA0`T³ V£Ş¹Š…­\ì¿3B\rg„\Ç\æ&õCœ˜„\ï%>1ƒñ-…quT\'o?z\ß\ãz™)6“‚\åo5Pï¡•\å\0	b¦©ÿ\0¸–£]N\â\Ú@°\î\á@6>x™Í§uŸ\Íú³3™peË¹~%Ë—\ï\èX·\è-y,PuG¬\Ãv<…ı’\Ğ~Aeû\èt”0‹¹s˜2-˜®¬«ø„Í€\r\î7h€¾\Øh>&¯\á—İqi’\ê\Ôc\İnT¤ğ·o¼~J-F¨px\Í\Îe\ËüE³\Õ/õ†,(–Ÿ>e\Åù–^!ş§2 zW¥J+\Ğ%J•¨QüEl´\Û\Ì©¡n]´¤—\Â­Š\n”\å\ê}5€\×öN3/csG’˜™.VZ‘¼SJ‹–›ywq‡/Ô¨[óQ\Â\Ãì‹«4ÏŠ;`A\r<÷%È®\èöµED¯mKVm)\è+\é}3\Öıı+p¤YoŸ\Î	ô„­eWa\ìKûô~—.k¼\Â,•¾,_t\'ñ<g\êıº tŒşXğüJGv#H÷\ïp–Î€›ÇŸÜ¿\Ğejû[Ÿ˜˜ğŸ	È«-B\\\ÃL/¾qó½\0Y¨5.2üË”—\ç\Ò\å—Ô¿2\áù—.]@K”–vJJDJ\Ê\Ê÷+\é\ÔúOL¼2vD\Ôß´v6s\Äñ\én¨?;`	y\ß\Â+…·\ê¥\Ó	XP1SP¹s­-Ê·˜¹œª$9V–üT\"mmü«X—Œ½3ø¸vX\ç/\İÍ¤°,D\Â\ÓUó©È³dóƒ$¡‹\îxaI\ÄMF\\\Ë(Ã‘®n-À†\\ \â_Ø¶\Ï\Û,%«™lfşh¸_B5\ëS„?Õ¥ÕŸù9ÿ\0†ƒÿ\0J\ä \ßÒ”´A\\\æ”€Š£Dpd…Ñ¹˜q\'Ì¡\Òı\àGgÜ©¿\ÜÅ¼wp±¿E\Ê\Ò\ÇqÕ•—Aôb\ç \ã\çˆ\Âö\ß~—\é\Ğ0VÒ¹‹c¾B±¹ ı¼Ã«J\ÃagˆKˆ¦\Óù¯‰aa\"_Ü¹~…ô\Ü\Ê-\ËÄº¬Kƒ–m+>s>ı\Ñ\æ{\ç¾V=òµ¹I\á-1.\Û7‰\ë/\Ô\Ú{,Uhrœğ¢¹®Ü@I¤e\è”8\0(&\Ä4–„·r‹\â\æ¾hDP\å3@g0´Pw!(¶„¯Zt\ì„K)=<\×õ*¨Ø½~ ’˜}$0(0o\Ì_‚K¥ö#³`‚R\Ù\Òr|ó\r¬\"m¶\ä‚\Äô$\ã\Ìj\Å¦¡\Úû—-1\ÛLA8Y>_h*…‘\à\Íjq§	d\İZ´WˆÄ³)²n	Dù¶\â\Ó4+ó\ÖE\é…ƒV‹Æ®›~\Ô\Øzv^\Õ\\Q*ß‚*Ô¤w\í)m\Â\Ö%\Î\0¸Dyy™¹oy’Au™}oñ	¥Õ»ÿ\0RøªêŒªõ\æü\0×˜®ù\×(*İ¿\İ-¬\Ø\Ç\æ8›‹\ÅÔ™ÁV\â \é@M>\ßÄ­\Ò\Ù\n\Ù\n\Ù\Ş\ÅU>\à<\Â÷2\Ö)\Şñ©PEóf#\0üÃ¥\áX\ä9¯Ô­!iQŠ¿2™£YP|Vb\ÕB¬^\ï~\æxl§²d7Pe\0œ/ğKF…–Iÿ\0C«1¼\Ïı†Z\ÉQ\É=7(.¤x›‘ù˜\çÿ\0I1iø™4~!\Ş}É‚yChK\08\İ\ËJJ\Şfö2\åÅ‚:Jv}Áˆ6„nP¡r\ÙO\Ôø•\Ä£\è\Ğ[ˆœ{,2Eİ¾\ã^\ÕN\à\É\Å.’¤ºo‰JxYN¸eXMñ‹/ó)\Ş h8CoCTö\æ%*\Ì÷še^5\ÄFÁ˜j_~\Ş0\ÊW\çQ\nZ>e’\"?¤lM\ÖM‡ıú™N\ÕXü\Âua*PY\ÌN¸„)\Ô_!\Ò@qe¢) /Lµ\Ío\â9Ç´\È/zD#J¿“™C,l8ÿ\0}}\ÆÓ‚\ÑJ;\ÅB\\\"©+ñšnÖ˜µ b²)\í\0¶\ŞBV)8\\\ß\æ9]Ô¯ a\á\ìTv³(\ÇòAµ\ÑF©?U+R\âk(h§J³\Æb\nc\È\ê Dr+ü¿<Šp·µ\ÌÓ’Rh-F\Ãq=3*\Î\Ù@ ó¸1aŒ—\ï_¨*f²\ã\ß›¥)?õÁ\Ú\Z\0ˆP\ËÍ–œGa‡\0§ó\0\ÆP¡`US›´üÀh­ñtE\ßr\Õ@¥¨pºøüÅ¸\Ök³’½{‘\0\äDÚ¯ ¥nq9uqˆ­\×1\êQ½Â…O©A†\n \ãí†…°\Şş%j^©r‹\Ø/$j\Ù\İ\ÔI³[N\ãn¨=ŸYŠ¢\Ğ<8W\ßS\ÚÙ¶£eM,L·\\²’\ÔÍ \"\Ã_ú\î\È|ˆ†ù•d;b¹E\rïŠ–n†áµ“¹“»u/`Ó¸¯ª.\Ïh\É\ÕNS\êR$cš(\ÔrM\Ò-E1ˆ‘QZ«(<°8J~H­Ÿ¡ƒ\êYšhŸ™Yj\ÏC”Z…x!\íyebı\â3p\Ñr\Û<Œ%[_sW\å÷Š«¼<\êh\Õ,\Ë+.…Cp›¡\"™XUyc·¼’\Çß¨l==N%\rû\íŒ(#”Š·lbO6\ã\ÚPR}\rø¤¤·Á”\Õ\ç3Å¸¦{f+\É)G\îm\Ê1\á\ë\Äh\Z_áœ@{Oõ6Vl\ÚL48§ñ\Z\È”\æX\"\Úñÿ\0“D6\Øş	@Ø®\\±\Ê¥?\ê¢Á¤ÿ\0\Ã+-f\×S÷q¡.\åHÿ\00¥G(¿\Û<°­¤}ùŠ<\È#Wt}KÂŒ!b¼\î^¦\å?^Jß”‘Ek\î\0Zj¶}L……t\×\í\0G·õ¼¦\Ô\Å\È\ìü\â(ğ„¹\Ë\Å\\\ï½D¸~0¿½L>©g>®0!’¨¢n\È\ãz\ÙdA?3XR¯a\ï>£@u†ù^`\"±qQ¿ˆ\Ğ]Cz,óuô\Åt?_\Äó~bSV\Óù`\Ú|F=¡zk\İ=\ÍÀ\Íø|\ÓsŠğ1ó\ì£`>™X34»ı\Æ\ë[\Ç)h€òÀÇ•#J¡\Û#ñ(\Ş6\ÕWÁq^€¦‡?D@¦\0=ö\'D<\í}Á\Z¾a…c\İ\'\ê@\áÍ\Ï\Æù\â+ŠıÆŠ-‹ –^LW\İb\ÏxN\î\0†V¥¶/\êSGV\Ï-ıEù&`ˆhq)R‰<E¶Ñº_@G.«°\Û-…ª\èjø†1*yŒŒh|u\ÔwKe\Ö\Äs m\Û 9üB\ßP¹«\ß,H²Œ\Ü^ù‡Ÿ‘hq.\0F›\ß\â]H\Ò¾L;\æ4÷8ñ9{•° ˆ\rQª|\Ëg*F\0º>`]€\Ùn>ı\ÜEl\\/QÙ„-˜C0M„¶k—\àş\æ„M\\%Htû‘Q¤­òú—ö;Wó\0t¸¬}\ÅPü™aFÜ‰r\éG\â\ÉaG\'5Ï½NcÙ’*ƒ?‘‰U­\Å’ô4J\æ\Âÿ\07«-+\'³9š÷FhÂ»W\ÔP†¸\×28\É?(ˆ‘û—‹42c`)‘g(’\íTb!?³ıÀ¶ d¡¨xK\ÕüªZ§*øò#\ÎKĞ¯dr6V°;§úœ\Ê÷\ì+·,£y\â=eğı\ÅU\Ğ|M0²:=\çC÷w\ï¢#\ÛÀ\è:qtÿ\0Ä¥––¯\ì\æE•so\Ü\İ\Ïz\Éõ\rmƒ(\Ùğ\Ò}@4—Ç¾ˆ$j²Ÿp\é˜jÿ\0\ZŠ\0¤iÿ\0C(°a\íù¨vu¨|Sğ	›ó|\Â2‡\â\0ıG\Ğtù·\Ğ\Ã\îôŠT£\ÏÈ¶\Z\Øéš´;˜\nõJ\êÀ\çW„‚‹W\Ş]4\Ô]5GWÌ«60i´\×şL­\r²=\æD6\Ñù‚\Ä\"„ÀYd¡¥Ÿ³3˜m˜™Q!~U\æ`¤eÔ´o9_ÓˆeSË„s†S¬=\ç	}I n”|x˜¸â—¸\ÃGe\ã¨\á\×(\nøuñ.Œ´\ÂşK‹\Z‡\æ5\r¾¼\ÌB¼Ìª\Ğ‡\Ì\Î¯\ÚWö\Ù\0;G®©!hQ\êTJÚ¬%ï¨’4‚	¤›\ì÷\ë\îYª\ærŒ¹ƒ	\Ô\È\Ë\"²8_\Ü<	\î\Õª.\ZSŒµ»f‚½ \àCQ—\ÉKDW~#\ïLVgrg„V\"<“LwW\à-w«£ó(-~o\â ¾\0aNG\åúŠ½\Æw\0\è£\âQy,¯\É;‰\â“û†lC¥¥`ˆ7ŠC\ê\Z\\a¿\Æ`³¨\è~Nfeb‰aºô\Ô¤<¬‰ ŠôË„ª\Ê=Sõ0\"ñeÿ\03†©NjS2®SZ&\×”9fÍ‹”òø‹L·‘÷Q\Ò\â.–ñ\ìb5\\³{@\Ñ\æ\Â\á{TL+ÀI‡iWó–1³´ÿ\0\é\0(¶\èƒ\ØRñµø%ˆ\\\èÁ®‡\ÔÄ°,\Û?1M\Ğ:w÷ˆ ¡v\àQ€rT}üx¹rı²#6Zµf‰ŒÀˆ4Vş\â¼\İ\íş\á»\È+;Â¡\Ñ”q\â4p:ªıı£Q°óVÈŠ\â³,\é\É¤9¬ŸLÎŸ€¯¿?ˆZ,(0~7\Ëv÷¹Z‚(0}¥·\ÆÃµ¿¬?\\®&dî´›`y±ˆW\èb½ŠW\n\æ\á@“\0Q,•Óˆ\á\è©nEK\îo\æ*I\çCü0\Èf)RB)1Q\Ôv*(P‘SG\à:<\îZf¹\Æ$o#“\æ^a\Æ\Óş»e€å¬¸g9—ˆ*\İ\Ê\Åo,¿²+B\İk?˜r¡lLü\â(6¸\ä0Œ*§SV«o\ĞjT8Uc6†{¾\×,]\Ê~.081|÷,rE\Ëò±q›\ìş\â^\Â3mß›†õ¶ ¿š©ew\ÏP\æ\Âc9K\Û\àÌ¿\à™X qŠC\äş\"%tE×µ\Üñ\'Vc\áQúŒ\çg\â¿R´Ÿ†\Êe5\Í\î-\âŠ\Äµ¼{\ÇIX^À\Ë\î\Ñ2@\0>\rü\Ü\0¸®§ƒ‘÷--I]™&rudóÁ\ç‚hO\æ!\ß<ccL\Ù\rw\Ätb<N(¶mvŠ!÷eˆË£™\È-Àu(˜ˆ2L~°@PKú\ãÀ\á\Zü\Ê\ZÉ˜ş!ClÂ®?””W^\á)¼\á{S?ˆE\Õ-\0=\İg\ÛX\Üa\ÆAÿ\0¿e®//e¨.\Ñ\ÓYk\'´¿1{ta\r\069O\Â0”\Ö\ë\âW•–pU`\æ/\ÊRƒ¿ôŠŒB°P\0ZÁñ0@‹­k€\Z˜z\\¢]q5„1¯¸\é\îj\ß\ÜÄ€k*\è2°€Ù¾ë‰<\Å\ê$\İVL‰\á™^#²\Çr±	\rŒp\êfrùª+(}¾Ò³vşYÊˆØ±,\Øe™*\0fwlvº\n\é\Ü\Ët»9o=Ş£@gû„((Pp)/\à\×\ã€\0\È¯v*R;\0¨1›CEK\"û	l¨8mü\\«JÜ ¯\â\îŸˆı‹¡\ß\â\\S\Şr‘øŒ¡\ä¾3]\Z\Úú\Ô.\ØV¬u0¨–ğ\n\ë\Ì+¢˜qmf%F¼§›9†}\ê\nª\ÂsDĞ‡¿8ü’„¢\\Á\Ú^8\Æó\ï\ÙZ‹~\ÕßƒQ\"¢P\ŞW\â2D1e§\\:%\åk\\\r8º\æ7(”\î|xó\ÏJ\ÍkvCeŠ7”p<uŞ¿$«ƒÂ¥Ti|¡\ÈÖªU ˜l¾ñ1‹c˜†\É	@\nL\âş\â™AWFŸy@sWÿ\01¸=†¯ú³Rş\Ó\àòÀq¹3_\ÌfJÿ\0Q|Wl*¼Å‚~#\0…tø„\rEk³Áô\npB‰\Õ\Ü\0<¥SøšibŠo²0Â©@\Ê Ü”\ÅlL`j\0>\n•*$\ê(º\Çh\Ï\nö)\ÅNX~s™\ÕSÀz|3.(i[d¿ˆ¶\æV†?0Ä´ª¼\Ä` Y¬\"L\ï0Š†m…5‰¸\Òp•šy„\ëqy¯¥(=ø\æc¥\ä\ë\ß\Ã\âRVK¨>F£\Í\æd“Tn¢®V6dš¶\ê_õuL\ØÁóıÜ¨\Ö.R\Ëø©Š¾Ec÷‰as\ä\ÇÔ JĞ¦\ï-–<\\¥4]lı•p\éF\ÓGr¥\ä]~\æQC°Ìª]¡şªY\r\æ\Û\ë€h\êW\Ïú†b‡fß¶J€\Ğ<\î¼9‚[\Éş©¨É³x§»ıAmAoğ»ø!L«\Î_\Ô ¬\Öú§\îc$\ÃTŠ\r`\"\Å2eF\Æ	[±H±–‹hùXagUÜ±¥u.²«˜»;•<QQ{\Î,:1\ÚyX\íYV,)°Á\àó\Ù\Îw–#\à\Ù\âQ`\Ï1\Ã\í(ˆdg‹Ï¿PË‡‹Zö\Öß¨ŸeK \í?±.‚¿–\\5d\Ñ\é¢_\Ä[<ş9†h¹¥\Å_\Ô\n§]›®\á¨ˆ”Ô¤¢k-G\î_6À\ÄTT.\Õ`†ú\"ø¨ò€eSA[\Èù¼ôÀfT\Ö]\Ô\r˜g»¢\Çu™÷şI[ \ì€\Ì÷=’×€ñı¥©µ\è‡A\Êøñ‰\æz\àA°ó¸ö\æŒLUÌ«Ñ˜\Ç}_1ña†Y\Ï\âaN_Ea Š\ZŠ™[\Ä\Ä\0RŸ35El¨S\'}‡0¾†”G0r\Ûú—C¡ü¢(\Ş>\n>\ãR\á3\ç2ñA\Ü~Bş É±\á\ÔË©-şet\Å\Õ\Ò|¸!‡ şYXöcøş\ã5k\é/\á™ÀP\à\×\åbÔ‹v-c\â˜J[\É\ãDB\Ñ\âõL\n„õ‹_d\Â%\Ûş\âV\ç´{n\\IøX=±k\0	4b€\ÓÉ›Œ>U^†R°÷Œm<Ê”\Èñğs¸\Ê3\Ø\ãıÀp\á\Ít\ËaÁqXû™C\nº^: Z\04|JÚšóV\Æúl?r¥…sKn¾\Øò(\î·,\n¿	»ø²]Ó‡õõ*¹œ\äò+£\ã\Ú*÷\Â\Ñ\Î_¨õ M	E©iVõÄ¯\åh\Õy\ÙR“\É[W~P@Tof,´-9Wñ	c%9<E~\Ğ ¸.\Ç3‚1jp¢}KÁ»\nDlb5\ï;ö¹ªl˜®9˜‹\ëR®9\Ùisy5(v\îÀ”TÇ\éöŸ\r\Ã)ø›}\å`¢i*l\nôª}\ã\Ükif•‚úOõjJ5Ä©\ç˜\ï\á.\'bw:´Ô¼I¯|‘2ö\Ø5l?×¾rk\â-\à4xú\Ò\âa«^\Ã:0i|\ê)S9\Ë÷3\'-£mù¨&3\È?R*\ÄU-\rú/ó*µ\åW¶a\"ş¨û?˜\Ä.¥1R\ÕhÎŸ7rƒEÚ¿zˆ\ÉV\Ö~KK\Ü\àşbn\á«üÄ¬–Š»öMLZôX¿\Ór¶\ÈÖ‘Œ­#ñ˜“\'ºğ“q°´”•\à–\à]D»E^`+0›‰`s‰\\&¨&7r³´r@âœ‹\\³Fµ\İU\ïO1¯ùv6`\ßX©‰w–c‚dV\ï3Ë©QVË³™TK\Ø\Ê•`ƒ!X˜3\ä‰e±Y\"£%Yò\Ï\È\ÌAA´o\Ú\à>	›W\ãú—y\ÜûŞ¦*“6¬ûŒ½ğ‚˜=±_r \ËJVñó¥5¬\ÒS/7\ÔsUÌª“²/[JüT®\ÜÂ¢\Å\åY“\Ğt¢»v\Ç„_G\Üs÷3¨\0+\'‹X\îü™S)uô©\Ì\í6Ç˜-\Û\ç\Ú\'y[•\è±½1\ÜÁ\á§Ê˜mK\ÉB½	.½\É\æ	À\İÂ‚¼B\ZÔ²MÌ¾s\r\Ê;««”T\0¶\ëVüFeE«ˆ…œ·®UYBù…ºş2E\Ú{˜¿d&7_‹e·¯Œ\İ}#s,‹=Å†õ!l²>†¹Ö‹\Ç\äŠr:>#ğ)h`O d˜\n9fPÚ±€\årÁ­\É\Øx²0E¹JıL\\ÿ\0pXD\Í$P\0”µgÍ³ \0Á({iù0Z\åw­ATq™h¯l¯\ál€\Ó/|¿©{œ¨2h\Å_˜\àAC½¸–Ï—Q\Ä\n­%À\Õ\æ7G\rF¾A_pk\nAz¡\0\Ãö/³€R‚\Ï\å\"{¥\Ú\\ÁUˆ¶\Õ¸%\ë\â ¸‚´j\ä\Ä\æ\á›Ù¨V	Î–_ ¯§zš\éøkóNf´g¸C~j¯\æ\çN{3ü\Í<Œ\İö\Æf”+ó\0[ŸyÜ´£V’¦š\æ)šA2uò½\ÅoK\ZÀyü\Ì\Í\Ókt_–LZ!™\È\Â\r\Ö5\åkù™Mı¡—\æ\0¹2\Ğ\Â\r\ÍB\ØEˆN%„\Æ\'\Ú€£¢kür²…LETşC1Rü]°ö\Ê\\\ä\îdlğºølD½7ÿ\0\È\Î}M¿¸¨Š“‚W•o¤«p.\äQu„zöø—S22\Æ\æu‚lö\î^X\àP?!‰}\ç\â\ÉrÆ…dJ~ ^\à©™… yğ¯(>\âñQú”Õƒ†™û%òÃ€³\ì¨‘\êÔ®\0µó¸\æû«ö¸úˆ)\ÜZş\â9\Û\áÛ¨ —oæ•¥T-şĞ¦bliª1\Û\0\0Û†\'«X<¯\Í\Ë\0õµ_…´C›Ê°\ê´\\ª€‚\å¿ı¹HUsø‹N\rL[2Òªµ\n´h;böüœA¾œ\Ñ\\b«f5`6\Ç\×\å%‚ø\ä\ÔÂ…~\ÈN\ç¸1\r«…—›\r\ßœ3£°\é’\×\î\ç\áI\0*¼\Ú\ÃCÅ›´\ÃñQ)@\Ğ50-Z©ø‹²*\Í\rõ-:\Ím¯b \êLo\Ïq\é!B5L!Ptˆ¥¹_ˆ*	:0÷£ò\Â\Úxx–t¤\Î22\ÅX|À¼™ T z\Óp_‹ü_K‹¤=FR„\\\ìÇ´M§\Ì\Z¼HÁ¤^³p<ËŒ6ôsÁ1Á\n¡–ñU>Ik¨9yŠ ªª\Òz¨‡)\Ê-|#j­\Ş_Ì©u=\å[¨M|?\Ü^°ü€óøº~?˜¥29?–~#GòÀ4°yøª‡R\é[¯¨o\È\ç\Ø\Û9ş \æ/ˆü¹…¨;ù1¤6\İÜ·Ex«#óTB-_ üq3W¯%?ˆ¥İ¥‘¨Í…\Ç\Ş\Z±s“\Æ\êY3†\Z±Æ¡Â°…Üµ™7‰u\Şñ_Œ\Î+\0Ïƒşú\Êæ„°ü\ÒU>*\'e[•G.	yÀKeU\âR@\ÕpG·rü”\"½\ë\ÂCâ¦ˆx¨ns\È\Ã>‘H\âJ\Óô\ÆB¢„D\áM\ï0¨\ä\ìIEL|aü\Ê[‹\0ø~¦Ô‡7(.&\áY\ÂUk‘‹ˆ\Ús\\şb\ËaE+\æ,‚ª<\Âı\ÄvÀøA\Z^\\\Ï¸wİ•4C|ü“\Óa\åJ¿ˆ¨\Ø	ñ:\î•‰u@a*ÿ\0\Ä\Æ8‹ˆ¥$!\Ë(şbyb)\Ã]±¢ji–#4\ÉKğ \Ì:Cœ?ˆPo\Ş}-¢\Ğ\Ço™‡)r?It›GÓˆ\"\Én-+ó5\Ëp18\Óy¿b\0`-*\ìeğ–}L@u`:ûO\â)\ÓòHV\Æ\î=“…EŸ%7)*>õ\ni}ˆş¡” \éO£,kb7H+ú!\0¼@şŠÂ—…~\Õ´ö75üD¯kŒ>%T­‚Ó¼ñ(\Ñc—æ«…*ÁŸ™aF°,}Nj\\}\æl\ä-b\Õ\ÛşˆB£¢t\\¡g5/e\ĞÁø-Kv‹¸›¢Œ2™^´@÷¢8°we0\ßF©.\Ô\Î—×¼JŸŒˆ\Í?\0¯\Ì6\ÄóOû&9‚şš˜ªÓ¸{^¢—½³­NP±b%üŒ¥\İ3?,Z\Ú\Û6fóuÇœŸˆ/8ct¤˜j¶Py\'¼~†\ÊJEµ\æ®Z–¶ø÷\"½\Ë!¥†,S€q\Úø\Ã\rQÀTÀ\Ì6ıJ‘\Ëq°·X˜\ÇFU\ÂĞŠô\Ùş+ñ\â¢bc\ì\n\'Éš~%Ul»f	¸\Ğø[?s\ËD¶\r1\Å\ÛTA\â\â\\Ü­\î3ˆ¸¦BW_zúº\åÀ~£9o‡\ÒÀ*.‚k\ç0\Ë[n\×\è\ê1=\áTƒlx\ï,¥(\Ú\ï?_0M…M\î\\¶r…¸ª€pb{G†‚#ù—,şÊ•Ô®\Â+\æ\å´r\æ³ö\ÊH„o\í\Ô\ÉPı\Â\æ±È€}\Åş`®³»óµßœ\Ähm\Zµ·%|\Å\í\ŞEd\Ğ\ãjj\Õ	\à%\ËL¯0]\"\Ö\"ó\è\Ñ\É0,Ü¶\Å;u31*/d÷Ê•3X…ß„TúZ\Î?\îû ¡\É\r¶Zı\Ï\â28ÁXO&‚f\É\ÙøCó0;¯ûJp_S\çd	9§7³\Ôjh¡\İ>YL½)’Šz\ß€…¿”´\Z1œÏ²\Â	€4»—˜$\Z\Éy37J\Øÿ\0»%TAW‚¦R\à]U\Å\ĞKIHğ¿sH e!‡\äv\0\ã\Şÿ\0\ËVö\\5Áˆ\Ó4<G\'HSr\ïñZ\\·Ä¿Eôc‡0Qg2˜mBtk¹K«óPb\0û>|39>\ã\é«^ó\"£`¬Yr¥—[,¯\0Z/¼\Î?Ì‚×µ\í´¿–>Szqõ¬<\ÛµQ\â¯V‹•©._–X\n&B.¦\n8øc…bQBwœ\Ëc›h\ë\Û\âQ„\Ï\í\ÇÌ²µ\ß\ÔJ‚X~`·\nô)÷-]\ï±	p\æ &\ê€\ß\ÄBw”ğÏ±oS?Â‰IK\è?16*œ ùÒ·G™Ák\ê³+\Äú\É`N`÷tN\\\Æğ¬j66 O°ˆ°)p=º{\Ä\"Á<?U‚\ÖC)º‚Ñ‚¨¥8©m^q~?\í\ÌLŸ\Ü\Z\nrÑ¿ûøP,8»ö+Í±	XOjXô{¢”}M\ä‚ÿ\0r¹c¡GŞ \æ\ç(\ÌA.ŒC,€]SŠ}¯qB\Ó\Ş	ø–4N\í\ê^Å°R|\ËcN‘ƒfiñ•\Â\á•X·\Ù\Ï\âZˆ²Ä§ñ\r\Ëó<d–ôË¿4\Â#i¨Ë«˜]A™T€¥šúg0\áQ)W\"#\"ŒVzñ”\Ã,\ê\î\0hô\\\Æ\"<\Ë\Ø\îõ,…ù`	\ÜZ\n\î\Ã/7+\árŸ›>g1\Ü\\\ÎH-VP~Š [\Ä\Åq\Z\Ş\Ö\Ê_\î4fû™\Ñxù]J….Šı,ƒµW\â]ƒğqó+i²¿\ÅF\ánÁ`\ËË¯ûŸV/\Ú)]„öÿ\0R\Ç	ôKú‹©…¤¾½¢3SYg\ÏR jÀVV/\Übı³V\Ú\Ö5Vk\á-„T¶%\Ş{\0>\å“@\Ñ\Äu\ÍXBYt)\ã¨\ê\Ì;•\ÚùHˆxƒ¤OñP*‹C\â6D\äI¯5’c&“\æ\0,\ä-q]Lt\ÑÁ—8\Íæ¯¨~jŠı©‡\äc:µ´\Ğ9O©l\ê\îş¡©\0Y\\\İò\Å3[¬¿\ë\â)W¸LGe‘öş¦À¼·ı\Ìz],¾\Ğ^¶÷?’\n\0v\áöe\×#D±\àş‘2\Î4(+~q\ÌH³lÏ„\ÇÜ¿`8ûJ\ÛvÀu®V®Z\Ê}¡ˆ£\×mU\\d’°\çÜN\È\Ñ?mEPK\Üv¢\ÃÈ„²\ä?3P‚¥S\ê \Î ¤6X`†a\Äxÿ\0à¹‚\âã‘˜)n%…9Ü¬{¥\ZO}w¿h€L\Úô\n\í.\ë\ã°\É\Ïd,=\ã²ø¸\Ê\ĞY‹ÃœTU^ŠÚ•ˆ©–8*ós\ãN—\à©eB»?²Pñ%\èš•®»`œ=ğ¾k?q\íJ­7?1`\\”iö6¾\Ğ*Õ€>!,;0¿š\ÜmA\Ôü‡r\ÏW\ÛG\Äe˜5K\Ú|=_\ä3ò\äd8?†¥A\Ó¸•–Nğú\Ã@Ÿ˜Ú‰T\Ê\Î~¥‹‰b·¼±½{33‰C¬jşa*\àš¦Ÿ¹xf£´ˆ©VüD¦˜\å¾ \ŞH!w\ÊşfÀ\Ù £\Ê^›˜Ç„>ˆ\Ù*%jœkÙ³Ú¦\Ğ/W\Z©Y› @ø_hÛŠye(üL\Ì\Ğk„–$§œ>@X„|4\ìöa\'jñ\Årü+J\0 )÷.ò¾.\ß<GÌ‹}‡µÀa…\'QQ~ -¯\'úOdf\Î!¤Q¿¤E\ÔG8Ø¤½£\Ë\â\à9€\ÕcFö\ÏÔ ÷™ÿ\0ÉœGd‚\Ùx\Õ\Ğ \ÈÀ0‰Ÿ´M˜ğŸh¢\Zv´gRf\"x!3sü\×\Ğ6EQ5º\ê6m@F\ê;\r\äû?\î\\,K‰ş\Ñ2\í½Ë•R1Gÿ\0›w5L\Ş\ÇT¸ \Ì}\ëkJ¹\íQ4ÁÙ÷ş .¬n_ˆ\ÈQóBı’¸,yK}†b ğ\ãô\ï\æ#\r9hú.WF\ÛHk\âZ»˜±\Â${ô§\Ä\ÇGa\íˆ\é\Ì\è´¿f\Ébš¶œ\Ê\×k6&c\Ç\Õ\ÔßXˆX\Ï\nƒ\ì.\Zmÿ\0+şb\'¸ˆ \Ö[ô\â‹\Â\Ë\\\áôÑ‡½w¬ \ZŸGŠ(^ô\ç\æW\Ó1BgeñpJ¸ƒœ›£0±	9”`}¥ôø\ÌEZµ)`{q\ã\İ,vÀd\Â\Ë y!”\'‰[’\ß1]/—\Ìb\Ê\ì\înH—\í: €:\Ñ\Ğ_\î\×[\î2˜o6>\çSpW6ş\rŸD^1\n‚9dšº—\ß7dz6%!øö†<¹]0HG4\n}®6R‘¾şmx\"/6\èU\Æt\ï*Ü¨‚€\ÄAMj|mş\"%Àc\Û%€\Z\Ç0{§ıAw<I›\r‹‰~¦+cÒ¦7(sJ\Ç\Ñ ¯\æ‘A”Ÿ%LF,¾Ç‚¬‰bCl\\C-\Ã\Ò\êp\ÑË9¤h‹\Ò(\0|®/œ\Ële8n°;\ç)ı\Ã{j°|CXx\n\Ô5ö€}n$°œ\Ú~\åü[Ş“\îZa˜\"É„S+‰zºƒ\á˜\é¾5\è*\Æxœ£2\Âƒò\ÇE§›³ñšG\r°¡\âªó 2‚°p¿Üº‹­{5cÖ½¥eu‰U*–7‰O3.&f\'\ÛtSZ\Îk\î/JäŒ›­Æ·YG6r#\İLSq´\æ\ÃV?€€bœÌœ¤WöFlÕ€,²©7±á—¸E.\Ì1R\ì„\â-§>B\à9‹w§Soõ0P´\Â{/\à\æ›\ï³,\ZdUY¬czŠù;\Åw\ï)\ì•j\Zÿ\0ˆ\ã\ÒT®\ís/XoŒK«\Ï*3-\È\Ç\ĞPA’½\ë)q\nX\ß|P×¼v\nY)¿/P\à£_À\Z%B\Û}J€&©x”®bÀ.\ìTñ2\à\Èõ“Oò\\Ë‹e\Üc9,ñJ\èçº»?™{,~cş#¡fM½\Ì7E?g2–^W7°³pjEJ_ieÙ¤‡v.óÃ›³™‚†\09¦^½÷ˆ¬\0TŞ˜lò6W2Œu2w\Õ<üÌ¡vlI²\î\ÕXP£\Ü\ï\'\ÄUö&\'€6}\æ£\î†_LQ|#\æn]÷w\îQy–\êSñ[¹\Ì\çcì»öQo\Ì+\rMxhx\ï;7ù5g\"rL\ä«Bdğ8bTm\r)\Û0i1FŸ¹>I‘óO0\Ç`¢—\\\Õ\Ç‘»cø°E‚n_¥\"Ë £ˆÁSğ\Âq¥\æ5\Ğ<ª\'”3ÀşXÕ®\ÇG€^¥_ªRğ°\âQ\æ2Æ¾ x=SdiI\ç%\ÖûKTV\Îv\Ì7+€¡¯’{\Ô\"dU¡¤Ø¡]–Î«™p][Xt\ä~šŒ\í\Í)ûôº”\ãÎ‹ğ¶Y\0*<(\ÖFøÿ\0r¦ÿ\0\äq\æ-š2¡‹F[À˜\rCÍše‰e\ïƒı\Ã!\Å]ó0R\Âûd±\ÃÀh\ïqA\0÷\0lSy–ª&\ß÷B9j¨5y\æU‡°\'\ê¨fÁ@sõ\Ø\ë\ØıOÿ\0\Êu^·ÿ\0„.\Z?\á\ÄBj:ÿ\0\ÊeÁ\Éş¥]ƒu\Ç\â]@¯ú\â,üÿ\0R\Ú\Æuõ9U\ëÿ\0)€…u_\ê3Ft6&\ê\Ù-óŒ…u÷1HøË¬™m62•1ù?¹ÿ\0ı\Å÷ù?¹ÿ\09~e*×£\ÇÀ—4–S/ˆKo|X|8|(|I|HPB½··\rh|1ÀC¥ÉŒw\×0Uk€µöf8v¶ı²°óµoş¹”+™ÿ\0­\Â|÷1q¡\ßş°\Ëj[ş\éIˆ\ÕóĞiş`?«\Õ\Ä\î\Ó\Ğ0\Z¯·÷Á¨u\Òÿ\0\ÌQ¼\ßñ\Ìğ?\ã\Ìÿ\0ƒ\î\n«¿öˆ\Ô6ª}óu{R\Ä\ÄD —\Ü0[ª \Ú-@ŒœópÅ§\í´\É\Í\ãû\àÇ¶G-\"Qr386®f\Ö!p\ÌX´‰\èE«HğŠø`\ÙP\İ~H\0\0Z\êB.\Ù \ã\"\"hª\ÊĞ¥y­ü\Íg•`\Ö\â`®*r\ZıË³f8r*wQ¥›oD[oQEÚe\í¤ü²†Gˆ›–\Ó2Š8\\\Â\Ğl°¦bôŠ\Ò\Şı\å™\ZgaE»=AVk\æ!m¯™S¦\"N_\Ä\Z«ñ¯3.`\ï\Ìj\æ6Ü©\n\â\"ÿ\0bV×•)]‡¼V¢¬\ÅQ¶2\î\Í\æ\ZÁ†ˆò\ßR\Øn¹—›7\Å\Ç=\ç\Z$9G¶?#x\ÔbzŸ¯Zÿ\0\æ%J\r¬¢WŸ1sş?H¿¨¼°0_Ï¡	^§¦\áşPõÇ¼p\Ç\ÑXB~G£¸BT=j\\ª9K\Z\ZüJ¥\í:|Atü\"°P\å\î*l\Ì4\Åx\Öc‹ÅµO0y Tñ(\Ì\Û-Yvs*¹q¾ h‘\àŠ\æ7\ã2Á€˜\Ølbº†ü\ÍÃ·<\Æ*¨HÅ<\×€ö‹[\\¸yˆ2ƒwb\'	2´µñ(\Zlh\'™B\ÔNS\ÔxJ¨9\\T Ç¶7,šWcI…p?\îP\İ[#u\ï/ğ˜i\×ÿ\0!\è«\ÎgÓŠ\â6›õ«ô_©\ÉŸ‰\í+zß¡[£8<\Ì4u\\Â˜7\Óuø”8Fı¡û)\æ \íª\ËeBlö\ê\Ğ\ê}\Î/\æ=j~’gqôU\Ó\Ş8z\äz\Ñ~\Ğ\Ğg—\Zb\à6¨iÀ\Ûuü&\ÇX\ØX¥\Â	P+ø˜\ÜıF±>L\\d®mˆö½‘;Y1‘9•al\Ä]\È\é´\ç‰AY\Ô.3t\Ó\â! b(wÛŠ¢utF‚Ô•)\â\İ÷.‰Tº<Á%\èZ\É\Ğ-G9j.;\Èl\Ñ\í˜ô2\Ï\æ›¬1\ì\Õ\Ôu†˜±–Usu\ÜH-^ğ«¯h/†®:­±\n\\™\ÊÄª\ë\rÀ–ƒ\Ú#zL•0½¥³kóZ\é0ò\å¸$	½ª¡&M\"\ÒKÿ\0Ï£¯ñ`´xc½í‚‡oõC\ÔôE-§}E^&_v8³ee2•[UŒ\ÃlE\ÌI~Ç›\n»ˆb­\ĞLÖ¶R\î!2‹ø0#–ÿ\0šM´Y²2¡\ÂT=BõŸi¦g¾\"ô~P;@Õ…Züî‰œ³µz`$G¼J\æX\æU¼\Ñ?!·2ª\Z|\Ê.—QE“m2Ì­œ‘°¸\Ø ]QM\ë÷{.¥k\é\î/\È:ó9ƒ\â«Xª1r¬\ã;v\çˆkÁqEp`?‚!a\å\ä»`õ\Ïj\Ü(°»6?Mq+6>&F;CDöÕ¶ %\à#jÀu,\ÔNj \à:¨ƒÁ˜Ôªa’P)^\â\ë›2\ÅN\"\Z²-\Ï¸\İa*dP°\Û1w\æ	a\Ì;¸¶|3Y¯®\àß£¿ğ\æ1ô\æ;\ï\å†\Ù\ÙP‡ø\\P§º46²­\ÚÌ­\×L\ZU\êP½›\âS\ã\Êap·Fj+‘>€\Zqxø “8Z±<Ân\Ã\á€M—\ï\ëX„M‡ØPò\Ï\éBÇ»\r =‰–”\ÏÄ³p\Ì‰_\à\'º&‹¹x\Ìã¹Ÿ34kO±\n\Ãr:&£œ\â †ı ’´3Ä·pŒBÍ„\Ì€05d¥†o\0q$ï @7úŒ<³kËˆJ”\Ã\î:+|µ 8M5¯”Š´®\Ëõı¢²\à÷rò”\È~˜5\íbğg1M\å\è%\'\Ó6§c\É¬+@K\rG7/»\É\ïr•\Ø\áŠİ±\Çó«J\é…B\í,\']F¶nõ1c‘9Døe7v\\\Ä	¦(°\ä\ÜÀ\Ï™vJ5	ŒRM\Ñ\ã\ÌPE¡«öŒ}5/\Ñõ^\Ü~ne‡‘\rz%A¿¡.[ö©b3˜¿ıYw\Ş\é—A’mõ8$Ìºs+q¸\Ø\á\ÂK\Ãe(\Å¹×Ÿc\'\Í\ËL Ò¶0Z\ËS“¼š1ó˜\Õ\\\Å~ş¤ù 	_üVº~&/\æ`\Úøw-¶–\ï1m}\åYpüX~/\Ú	m\Å\ád\ÎÍ`\æ\ÑÌ»@ø\Ô#š¦f„U—+-œÁ\ß¢X\rÀ&­BŒc¹{¦)\ÒG~«\Ì:Ë²£\î]\ĞC„^Sg7º‹{úMü\Ü#ÀW¯ \Ìw\Å\Ü 0š~–…L™‡R\Ô.«OÄ±\Ğ÷2”\äm\r\'c\ÜK¾ÀşN^49ó-y²]B4	\ãº º-Vw\0Z\Ñ\Æ%¡Ut¼\ÇVÄºğ:?”h,	~\Ói\Ö\Ùk}3¾M²‚\Şõ1,°¡b¬«–t\Ö:–\ãw½\Ê*\Ô\É9Œ_òcø¯ö~\á óı\Â‡¥\ÄE \î\êŸüG]9›0I\îBµx”.O™­>j	Uú™ª\\\Ğ	l•#4¢x•¯Q)”\Ü÷EW\ãø”J&ÇŸ&`[\Ó_–\È,\r”\nÿ\0\è\ÜK\ÉPTTğLŒÙµ÷\ÄBØ¥a¢¢8¤\ç¾ \î\áa \Í# 8oqU\çƒS=\à÷”‰³1®®\Z€\n-\â]¥8ñ\0¯,qy‰ vj«0ATQK°ÿ\0/\ã\ßR\Û»\Éÿ\0^\Ä\Ë6ÀS¼\èò\Ê{\å÷Y¯i]g¹¬¿œ\ÊÚ¡wj\'%I„ù•m§ó\Ï\ÌÄ\Ë\ÇO9–Qw’Ñ¯o¸fÃ¥Zsòı„\0\0J!,+V¢….º\Ü%\rš‹@™\ÄT\Ô%œŸƒÀ\Û\ï(h\ÃuLF–y¯idc³\íR0_‚4\É\Ù-¨Q\İlŠ\Æ\ÔYü\Æ\àªU#JSgi¼xœ\Æ_«\ëQ\×`üOõ6}\å\"‡¥Ê¦\×	Ú‡ø\Òõs|\Ãz\×U‰X ¨\ç”\Ôa2‹:¸ÂŒ)\Ó\Õö‰ıKò\Ä}?\Ëñ­ˆğ…\ã\å	¡\èsùş ö_¹ÿ\0ê•…\Ò\ænº^7@\àJ\ß~#§6…­\ê2•½‰\0Qm\æ\\\Z\ãp\Ôx{’\æ(Ü¢ô<\î\n ñÆ‹\Ãp(Ğ§½Lzk2¼g®¨\ÔsŸ³r\æC¥G)‘¡¿!\à\ã\Ë|@¸Hˆ!hN>¿S\ÂTõ~Vlu—n\n”#pU\ç\ßÄ¡\0uEó\Ì. ‘\Í^ò\Ø)ŠÜ¿˜r\ëtöL±®“\Ã\Ñ\à9?r°«\Z—EFšIo\ÌCHQdAvF²QPÃ²\æ\å-ıEX\Zv:‰\Òr\"Hm5¤8˜´—A\r\Æ\ÜM¯d\0‚¿\é¡N[¹‚\ä\æ^U’U\ß1\Ü}oü8Š»\é¹²{€\Ä!2\â´\î¹µŒ#\ë\â\rs”(O\èW\ŞX\Ä\"\Ã(Tsl^¥¡\rµu‰‡‰O?¿\Ä\n7t+Zk¬²¯h†&¦¯oO\Ùş¯ÿ\0¨¶ZY¸\ê\ËK—ø”X¬ò\îY—¨2¿ƒ]›iŠİ³Iòól/~#pbğP\ê(É¦÷µ¦M\ÑdFQ\\†¥d´%¦u\ÅÄ”ƒ]Jp\"\nJW\0œF–\Ê\"@!ª\ê\ÕG\æ]1£ö–\Ïx!K÷\ã`$\'#\í˜ {‹W\Şc«Œ¢x^ObQ$\Ó\äBVQ[Á\ÜP\Z¶s=\âC!¿,jš§\ZıÜ¶\ë\0U\Äh\æ n)ª¦y…\äYÒªT\Ê\Çj°uY½Œ`-\å3\å›ğ”T\Ã\Ú\Z†\Z€\Ã\'‹¸\Øh\Ú\×Ç´\ÖgH+8»\êTZ9ğ{\Ç\Ñÿ\0\nõu\à_I\r½¡¥\ì~\Øz	P	U­\r\Åa»>a‘¦\ê\n°BÀ<²”\å‡}crÃ¸`’·Q\Ö-~%p\Ø\Ñ\×\êb²õyOö}E9[™\í_ŒÀ†ª;N\ÃÓ¼\ßÿ\0­`\æ<ù‚\Ê\ïr\Ì\ÌUS5x\ÌY\Ó¸\ÑYƒNÇÀ¼£\Ù0px¸\Ãfa\"\n\Æ\Ín®E¯Qª\æ^¨^£xh–E_Šp4¨š:\Şõs9@>)˜\ÔÅ%k\ÉO½Äµagö¢\à\'ºLŸ¶#JA\Ú\Æ\" `G$\ìe\ã¨AK[\ÒLG‰f\ÔYß’\Õ2œ—Y3\Ä\Ç.\Ï2\Æ\Ù\âvş¦\n\0 JN\İ\Ê#F½¢¼¸#FvZ»¾b\ßt\İJ;:Û\Ä\âƒ´E©– ]\ĞT+]\Ç<@‚İ\Ü\rg\ÛbƒM’\ëƒÉª‰.\ËÆª¾#8=£Il)N¿\Íõ°ö~!ş a\í=\é_\ÌPz&Xa\É^\åC\ì?ˆu™Vù\æPV\Æc˜<§s€^F¢ø–t±‚\Ø\á|[øÿ\0¼AA€3¯û©ŒAÇ ıŸM~f>\ïñÿ\0\ÔI²…hÚ­”ª\Ë5P\"\ã(E`,o\êV \Ğq¨\ÅD\â\Ñy·^c©Pp÷\Ü`TW	j^Æ¥\è\"¿\Äk£š¶;4q[Š4LĞ™„A£,\Ä\0 ²V°o˜9w¦\ÈKBÀvO:xaE…À÷|L1V‹PÅ‡ıP‰XqZî¯ˆ!£\Õ\à¸r¼ª£\Ø6h5c,ğ¼\ë\ŞR+T0\ÄZ²ı|ÁÍ‹2<¿Ô«zX,\Ï\Ò¶q\â`®\\JüË°™Š«’£‚°«O÷1\Ú\ØÍšıJ\Ûm©r6£€\ækA|ñ\ÔDŸ+\Ê9ú‡f\Öy™¨\rB»“/ñú?\áL¢{J¿c+˜q\ä\\´‚\Õ\êğ’ô\Å¶œF¸[mšk\Ì-J¼®­*\Ã@Û˜…\ÕğA¤¸Qü\Ì\Óf\ÉpJM\Ì7\è`”\"eÈ‡WY)RŠÃœd¸sµ~\'\æ?¸z?\ÓHõ¦5Bw¢şb…g0fš\âa j\"Ø¹·QP\Ûı\ÍLS,\ÃV+qİ\à§«S\nm\ÆsõšI3Vo6°\å›\Ï>ğ»Ë®bX»¡š–aœ¥\Í;HÊ¡¾e2@b\Õ\ècñ¨ 2ŒYu\Ù\n\ßeõ)Zƒ&\Öd\ÕEşmö*¹5^Xhº#gAıJÁ\Z´(:S¤Xl­Ä´ş¥¬1YÀJ}Š\Í\Ê[_H\Ë\ÙÔ™Ò¸7\\33¶®1\ÈáŒ½\æk©jµ™ˆe’˜\ÛJ.<DÌ™\é\ÂEX;U\ÔE1}\å)—E ù¶«\ë\Äw._§ºP× \Ê\â\ã\ägó_\Ì\Ó\î—u?„\àƒpdA~@Ğ…\È\ĞG\ÊÅ˜5\ÑÑ¯\Ü\Ï1Ê†a	Å•.´+\Å\Î\nş(†ğ’ \â-¡÷ƒZ“Nl—Jƒ\Ù%\\ G‹•gÎ˜)‚•!tp†ı^\Èmÿ\0\Ô&(>e\ÕcÜƒ]\İ\á‰2>È§ş&[·\Éq{\Z^ğ’\ä\à9`(û§\é!+\É\ç0]­Î¥7“²¥\Ê\ís\åT­Jg4	Ÿ©o\Ô‡’÷K\ãRš 2\èùe\r6¶±uù\Æe¯²\Ç\æ‡\â\'œTT¶w+’¹C/ó©AA\Ô>\Å9§D5±uZ ¾\"s\Ì\Ê\ÊÅ¦%€X¡\Ú\rC\"¼}@,5…:Ü·@]7)0ƒ\0\Û+e^x¿¸ş\î+i¥@r¦ˆf,»\ã\ê5e·\Ã-#—e\İ \Ñ\æa¬µğF\ßOln¾€\äÒ¸\ÔYœbU¬@=)˜‰\çf¦1—!°#¡ÿ\0¤&I\í7z—\ÂC?‰Q%\îŸ\Ä¬ùWøŒN0Y•\àƒ9û†#l*»\\´™t@\Ä\äu­,Ÿ‰Æ^\âş „\Èû¾§ğÿ\0\ë`)XÁ\Ô\Âe£¸QB\Îb;q£\"]8û\Ü\Z\Õ7W¸)µ½\å</œ\ËO‡q\É\ë.\Ú\â^\ßÔ˜K\Ğ\Ã-\ë0\Ï.˜\Ğòó(\ÛN\ËSõ s/owÏ–?[k—7\Ü8¡\ZQ ğ$lb\ä^a\r\Æ,B³\Ø05Gb e\à\İA\Ä\åôCµšW€®¢Š\Ñ¨ke?w(ˆgÈ«ö\Ã3‡3&u\0%\ÅVYùŠX*\0hö»b4[Z^&:yp¹º‚Œ\Ç\0‡-´}\ã@\î\ÔE\ÃD\é\Ïp\Ö\í3S’û÷ƒª\0\ÉUòK\Ú4®—qË€µSÀ¹cu\Ğhó7€]T7|\Ä\rzjDö9›zcö˜º„2\Ï\r?’i&±P÷š\ë…?0\Ù(‚\ÜW¿ö**\Ğ\Üv{L3Ï Ce\\™Ÿ”YÄ ¡y®º”q(bÿ\0‰€¹ùa\Ò‘Ù \Ê0cs]+<Š¯\Ç\î¿Ápöÿ\0\ëCy•ô”(£‡0\ZP3\âc†vqdK]Â˜˜º‹\nU&s‰–\Ô\ê\å8\Ùs\è.\îjw\Şå‹±\ÆBó@ª]\Å[o}Õ€_Ÿp´WJ\äÿ\0P@§óğam\×,B\àRê´”†uÿ\0{L£Œb\Şı©‚%\\§\Ùo†Î¬¤\\˜ò<˜½‰©ªC\0\Û\Ñ~øˆµ,_hyó\İb:\\D=Ÿ0m_UÀt¹<CH\àå³Ï¶\à[	À\æõ…%,Ë›	w)\ì\Ë\Ô{¯÷˜,¤\í%õ=Px6ı-Á44e|’\Ø\éƒ§\Ò-ü†6üVeZø!cÜ›Æ¬4L‰YÌ©ˆGj0\Ò~\'›?Tó’•0u¸n,Â–‘z¢Š¡z^7¸ê¢­›qbR=M†\â´9\Ó\å†8<r\ÌÏ\"\Ñn%…mñc‹ibS¨ø>em¢§ŠüÊ¢¡ÁP„_g¯\'\Ïÿ\0[dQe¾d¡¢‰IL&M¯[\ÔeZ\Z\"\Z)kŒBgg-Ã‰Ş­ MÁ9¯\Ş\çhUr’‹7x\âe\â\Ş=\áFyS·j¯f¥šÂ¶\ç3ªaMß½0<\Ø:s{Cw¸!\rX\Ü1r(0\Ö¨9§$<ZVˆ\éD2®‚Q\Ê8 ôœ˜\çú…È—˜‡\âVŠ¬&c¦Mn¸™n\ã‰J\Ó\Ûª	PdFªbZGkÊ‡0‘©X —´?pÄ±B+‡7u½\âó\r\"8†¹\Õ`J‹„Î™G˜±\ÉvÅ‹G\Â|\ÊÁe«\Çù†©²öb6 {52‹=\Ãp8fG\Ä5/\Õü\Ì\êã±¨73ö¦\é\ìI\Z=³ño0ï¹€ŸğxEQ:;?\ÙüK­W%‚£+-H–µ\â9L‚\ÛøŒZ`zƒ\Ø°–±\â2™J#¬©\Ã\ÄrÊ„\ÒOGgÿ\0Qª€¶#¿˜\è2^C¹†cWV|õ.;\r«ù„	\ÆiüE*D¥3÷=l²¶Êƒ!]…±6\Ö\Ö~%\ÊÀ\Í\İC…÷\Ãuù \0¡Šw_;ˆ=¿ƒT\Ñdk‰™·Š2M©¨PŒšaUqQp”´ş\")SaAjep\×\âc8-ğ8şÿ\0]\Æ\n¸ĞŸl?,K`\ØL$û\Æ!¨f„$œ±ü¢÷w\ÇõDKQ\Ü \'š%R]×´±hW=J\\+z¬Í·\Îbu\Ã9\Å\â6\\´w\Í\Å\Êj\å7Z\ã2­`\á\\MOn~÷,OLóù˜5\Ü3\"\áPÕµø‹W{*\à¶x©€÷¨`©\Ó\Ü?‰ªj6\ä¥u.p§\Ñÿ\0q¼YÔ¸j\ÌJòEÉ¬˜{_\ÄoO·ôÙ¾eD6Š8m^`01\0\0{sÚŒJGh\ìtJ¡«r\ÎH@ôGş·3­¤|\Û¬\å–2Ì&ş\æ\éQ\\_Â‰x\n\Ù\æ¢Qƒ°\ã\Ãœ¢7k\ÖeY„\Ï¯7-\0g´•\ÉË™…\ä \n¶™¦¬U\ÕüÌ¶\\–c\Úr+¾\Ú\n\ËQ—~¯•‰c\nK\Ê*€\Ş\ÚıLğVp\é¤\Ø\Ğ´\"Z„\ÇdV‹Y\"]şbB\\{`ú\Ëñ´§ŸPÊ\â:{@u„š”\ç\æQ,\',Tqj\Å}\êôA|vF•\Ğù\æ5—=±BÕ\â‹x®*.\nodKª¤\ÖnP*\ÛıF\Ç\0\Í17L\Î7™e\\šŸšL«\æ~$y\Ã(\\n<B*“«c\êŸ\Ó\É\r.Ÿ\ï\Ò|»\È\Ì\ê\êÒ¨Y\Î?`~eHE@Q}\Óû@”¸p\ÛÁ|·™WÌ#…\Ê\Èm@2l<LBrP[KSXŠ‡C–\Õ\å{œFgp/\Û\\\Ã\Â\íNÿ\0ıU1GÌµ,\çY\ã¨O²*¿Ô¾”0	b=ÁE\0pCT8¡c\ã¹_Z)´PÀÀ±X\ÜFd\r£ŸqBb¯!\â\'nt\á€\á\\\à	Ë ƒPl4 (ò8\â;| ]E­\æ×›¦l(Ásg¢\îyT& ¶÷0°1h‚\ĞTm$!tK¾lN£&tõß’b{—\Æ\æeJ.Ç§D½daü(\É*b3š\Ú\èmj\ì~ÿ\0H ½7u6‘‡¿š…W°„\ëbæ±Ì»¶\Åxh:Yş> UQ¡Y%B’ú,)XR!mÿ\0\ÌT¼\"/(^Œl%ÀU m\"ŠMW_Ü¢ºj\î,>fjaO?\Än\Ìó\î¿€‡4z8eğDt\ÜK@uˆ¤ˆZñ\ìqT4\Ê§9eº!ıb…4C\àû—§\È?T\ß\Ê\ËFş òšj\ãP¢f\àµkşeı\ÊP\Ã\Ì\äƒh\Äf^q¨óP\ãĞ¯˜&%£~¢€~}½@!‚û$\à\èh{\Ûúš[²Ş‡ğÀ­ì†§\êõ\á\îõªP*°7{T.²WQ¬\æz®HHKslûW\r2­\0n	ˆ¹Xqp#d*ûñı“lµ\ÔPÈ£m²s˜¦.\Ë\ÕT\Zjwºkš]M\0½9½|J2±‰Ê´Z\ÇyZ¬\ßÄĞ®k\Ô#ik\ï\ä(\ÓCÔ¤¹R\àÆ M%\n\Ûğ1\İE\äŸ\r¸•3\å¬\Î\"Q y–°”+¬¶?×ˆZDQ|mF\Ş\åJü\Ì±bB˜,6\Ş~fV‹Š!H—­$&*í…•\â\r‰]J\ÊO\Ó÷‘\ÉÀ\Ğ9€-8ª‚Póæ¡˜(dGö\â\í\Òÿ\0¿iRUjº¡yÎŸ\'rÙ‚‚7©`šk\ßõSzQSz,\æj[5z\Ü\İ\Şâ¼Š<V1Q´&\æm\ë\Ä	UEb®ø¨+Şš1e\ï3\ïŒq{f!N†`P 9W¨\È6©z¶ó¢-h.\ï†ı\Ôö`ôú4>¦/)B§r…Dµuqi8ƒP•pJPüø…\ÃCgš2\ßqV\Ì!W,-Å‚\İnTœ·+^û•V>=¾^>\à\éI\Úgóo\Ìi)k¨.’W\Ä\ï)óg˜i\Ê^\à\Øş\"\ì17¯®¿0D±³³\ÓOş¹\é\rjŸ\\AxS\ßó*fH2\äó\æT\rSŒb\î¡ô³mÃ¡6r\Z¦°ø„€-\á÷™\È^V{¨¸Ák¹\ÆõP+Cw}\Å0—L—?¹d\0Samœ\Îµƒ]p\ÄÀ\Â\ãI‚š\à†5iû\"\ZT\×ò\âü‹#f\ï\Å-M\Ş}\åV)Dv¡cD7_[?ˆN\ÌE\Ë9Š±0eÿ\03ŸyS¨\ì}\ß@ñ)gr\àlÏ .´ió˜nÂºkÿ\0\"+¥4V\Î\à;R\ÉaÀj¡’¯\ã 4u«qõ1‹r\àû@\Û]Ü±\'%\Şr\ê3Ü³aó\0„9 ^(÷` ñ.;\î,\ì\rĞ­­°T€FŸ©}K±Z¢„÷€„K½şb½\Ø\ÂC‰Š÷–ø!»˜IBEnH\â‹\á\ä\Æø‚[6\Ã\î1¯¡qõ¼Ë‹4ƒ\Ê\Êz¸}¥\\\Çq½ó³2¢\ÕùD) e²h.ış\ßrİ¬²Z¼Ü«®LD\Ìqè¥¢‚“+.\ë$)ƒi8ö=ø‹ˆôRY:šü„°­1|Š:\Öba\ÑV\è4\Ë\Æ\Şõ…¢G\á\Ä7T\ï${•\É-k\"ƒ?–€¥·û\\Ê‰8YUeñ­Tq\í°dº[ÜªÕÒ©\Ê<°ˆn]Jµ¯\ÌpYp\ÔÇ‚jo¿\Şeğ8Ş‡\ç/´`\ÈTó,*²‡\Ãü\Ì‚\Ê\ãdd\Ób\å\ÍwEO\Ôi[WRùW—õ<\Ë\è¤[!@x?\ÂV¥\Ç2\Ëz`\Ü\"¿1TV9`WGš\æa$¤¯ğÌ´Š	½)v\Ìu\ê0,À)E¶şIR²%\Ç[”0\r¥Õ\ïp\\<QY\"‹Q`Ó˜‚5¬t¼÷D0\îw²\é…o-/«\éø\Ä)Š\Z\"\Ş,z\Ä&TC‹ ‰Mlˆ¯ã½xşx–\É\ív\rLW\Ã3©‹\ì–*˜µÏ‡/òÁÉ…\0hˆ\éjK‹.\å\Æ_¡e\Í\Æ˜˜CÀeq`¡z·P[	¨Go‚\áX;‹hŠlV”\évÊ¯i…\ÕjQ\Ì56ŠP\ÔdyDd\é¦ ¢\Ï1jy\Ç6³\Üö„eM\Ûúÿ\0\é€\Ç(¸8ğb	y\'nV\":e»|P¸\"\Ùdd8€Au\0¦œy‹\ëJN\Ä`¦\0Z^kÙ¹”)3ş£ù-T€F\ß\àˆdçƒz*›A3[/|n2\Ñ+Rn<\\©¥ƒœöÇ©\È\ßC\ç1»«µc\Û\á\í\Ë\Ë4P…\Çñ3ş\Ô-gù‹–\'9k\âSm¥_¸*\Ã\ëg¹*`ALh\å\è\ÔtÁ²†š©Y”fCG\Z•¹R=F\Èi\É~^m…ñ\Ô­‹\n4\Ş\Ï\Ôl\ZO\Îûƒ6”‰Fò\ê$:H+;z\æ_V¯c”™-W\Èu)€K…c\í\êoÉœkó\r• ¹Z\Útn ğ‰„km\æ»\Ì,	d£\á\ÆwñFM¶\à\ß\ê\á K`8»–\äE66<T=­Á\â6ÛÅƒ	¤\æ·,ö·¹0«n\Ít¼¶{sq¼yƒ\éS˜\î>©[ŒI^+K¨Ğ¸;•\É2+¥\ê\\§(Cˆ\Øf®˜n\É\ÜC#	qºÀ&¿Ÿş”©\í \Ç%E\â40\ç\rš\Í\àŒRX¸ª½§_‰\Ç%¤+®\Î.X\r˜\rgª\Æ\Ö¦ğ\â	Rû+9®s\r+;ò_\Ô„L‡/¼ Q\Ïa¼™€3»V­ÀR\Ú\ë©{©€,,\Î\Û/ú,“¨±°P%jv.»Ä¥b7n\È\Ö\Ì\Ù\Ì \ÅÌš¨¾Vş%ü[[\áƒq=ˆ0Õºôc\Ì	ˆ\ßSQ\Èôi×´\Í\â=K ¶Œ\êR¼°y¹j9 ƒ\"Sx\Ï\Ü\İ1c;_*P\Øh§¼\ÊK\ér[%\Z\â.Á±,š˜r^\Â+À»³\ÄcÔ­…\ì»ÀòÁ\Ï\Ñ\Å \æ\ÉLpQeñ\ç\æUYN<c¢²¾+uU\\\î%2¾Rµ(2‹ò¼»§Í½\Üz.aé°\é\èJ”\ëˆ	°\ß\ë\ÏQß¿Ÿ,q–\Ä\ÛÑ„\ç\Ñ%JôpÁ²\'®•¬\ÌM	,`¬G{òEw2ER\ë.5i†Ù˜mV+9”§šHch\Ã\'ÿ\02\Ê]\ZÛ¥°¨6¡^Ô¿O¼^H\Û¸qªˆ6YEÚ¼’¶É©€\àª\ÜX9Ò‹|^­Àouhbš{\è¢0#ú·ó\â5\n\0~i3\ÇU\ÔDÆ¥\"«»} hc<ñGvicVõû”§\nÁ2­Œen3‘¨D\é¢^P¼¦\å\á‰Z„¦	­Á–ö\×0G¿QZ{~Zß¼s\rÁœ¸¸©×¼…P\Î2ªüj¢[‚_÷3\Ï2\ËÆ£Ä³–[Rª‡,[­BªTcœš–4Pµ\íqe«©­Z\ë0Ø€]	C\ïPuZµ¬{1=$\nˆ\çŒı\\§[lK\ë&X^U¢\Õsò\â\Â\ÅP\çÎ ù\ÔÑ»jµˆmbFe¢\×ñl^6À¸mÚšû\â_>í­«\ÜW=‚]\Å\É\ëS™¦oÖ½\âJ§\ÃzrFxµd¬<6{Cğ\ÅE2ª^X¬\Ë\éR\à–§©«„e…\Å\Òœ2§ ‘ÿ\0;\Ïø3(\r÷İŒp}\r1M\í_p\Ğ;	İ¾WÃŠpƒ<(\'ÁKbõ%4\İâº‚`¹n¼±\äÀ\×Ñ¬»\ç!\Ì$¸\Z\ß\æ-¹\ÃP}/\\\îZŒ‹.\Êj¸„î‚»·\'†`ü“«xG@²\ì›\Êò~ª</·HÀó¼¤\èA|`¢¡‘s–W«\É	°-w/T\ÛF£(S“½\Æf«üL bûO\Ñp\ËÜ½\ÃpP—±ß£»ø©‰B«@mz€\æ\"4oº`r©”9«vpCŒu$y\à¨\Ú\ì³1Vßœj•A{—‘ş%Q.Ö¬\×[–\0z&,Qo7ø•jV\×=Â¿T7«\æ1@/±J\ë\â¦\ä%\"¯7¸^$öD\çyU%·¿µ´*¥X(¯k€r\ÊL\r\í_*}´¥tÌ¤Fk¹ctio;bW8\â7ô.\"¤÷õÌ¸>•\ê\"\åty\Ì\İô×\Ä$=\ê\"ş˜—Mó\Ñ-÷%²P¾M\Ë\é\ê=¦\æ<GOĞ°ğ\ékó*\ì\'P]AòÇ‰\ìı\Æ\r2\ï\èA46ƒó/\Ö\É\ì£M\Óñ¥\Ë´(\\Bkh\Z—\ÙW\ï\Õ,³/6fRrY`Âš~Ë ¥­òZ¾\è\Ä	e»WŠx<\â0<’†\Ì\î­\×óhP\Ó\çş\Ì\ŞX‹öSw\â4\æ\ĞNqWf½¥\â\í<ßˆ\Ñyh9ñrµUK`\Âr\×d£¸ó\Ù\ÄUq¹W9\ë\'\à˜(Š¿œ~&s\\­í¹œT„ûJÁ”¶X\Ãz1¸òö—TJ\Úğö®)©§&\ë\è—;ô;ó.{2ÿ\02ğù‰\ä-ˆY‹\Êmqg\Û\í+[\Ê·ƒ˜\"\Ë\"Jª—ŒKÿ\0¹›@\È\Ği\ç‡\Ú¨¨gš<\æ=µ˜hU¹Ô¿(n\êE¼Wu¯x1,7‹ª\Åsu\æ\à&‘Rá¬§rôÖ¨KEy¿ˆ\ŞM{¼\n\İW‡¥CphñZ!\ÉH\Ğ6%f±hÖ‰r­\â[iµl›¿¹e¦\ç9s\ìv\Æmm\è\Ğx\ëklµœ0ùK¹Ï£põ \ÃÒ½*$|½\rŸh‘\'L¥(\r\È\ì—\\Ja%\'\Ì(Ã™–ôJ¾`hu\Í\Ü\Õ÷+\í@ûŸ\áÕ¨|¹ö©œ8u \\·)³£‘\Şa\Ï8%\Ó,r/‰\Ø?\ïh«_\0ş¢*²ò\İÂŒ^ğ¿\Ü¬öm€yY{\Îo³\Õø‹N\ÅòŠ;ï©”|´Z\Ş\0˜\æ\â\í\å¦cºRh\âf8Oû–\æ6Œø\ÂôYx\Ë2¡&°*¶øÄ«›\Ø\0ù\Æ&fÈ„(5\Ã\Ï™•“H\Ö\Î\\j\ÚÜªˆJ\Ş]{=õ1! ”i \Õ\â\ß\Ï ­\ä€8»}\á™,)_†ö¸”xº/iÀŞ­ÅœË‰š|!ªX“ğ2Æ\'<œ±a„q-X\ØQ¹\ì+Q—4<Å·\Ì\åÛ¼÷\"‹\å—/\Ğ\Ì\åMN\Èô\Ù÷»0¼x»x \êD›5À~q\Ö•Â¾/ˆd#Df®¯·¸-«y[\Î<½GFò\nRúmÂ¤<#©w\Úø˜Š\Üj\\)\ßŞ¥ú=ù¯—˜\n¤Û©y\ë#ö\é*\î(\Ş*a»¿Ô·VËT¹º\É\\–V1³ˆ\æ³/E\ÕD>gƒ8\ä®wŠ\Ìß›\n£šÎŒ`¨tE\åô9c¢\ã\É\íó‘<GË·ˆ„Œ¡•™Y\æ$>„«•!\ÜW2B\\\"\àÁC–V\ZE]\î™‘\à°ù…\"ˆ÷˜-\Ëğõø‰]©OùlU\Æ\æŒ\ÃÜğ€7\Ü_\æ\Å\n\Ï²k\ì\èş%²…Ê¸Ê¡g\è‡\Ò\Ç\å1\äö\ßY‰Y|`é„¿_©~\ÑZ>\ÙA2Y´¼Ë¹U*2\â\Ö<Ev]n)’\îÌWM’\Ô\Î/–&\í\Ğ\ägµ_Ä¹ˆ[s€Wxƒ Ê°\ìƒY™WÀ5¶í¨¹¦6\Ê;£*±e\×kvts¼pµÒ1£\Z(‚g\nw)0f#\ÚW¸‡5n³lñŒš¯2›	U„œ˜Ñ•„\Ù\Ú(l)ŒCO{F\ØDX¹š?\â0s¦!\è8¬€ñfX`Á+hº\ì§>\ìi«(+¯dm—b3uƒˆòE\ÎnY¥i…BÍ…n\×\ÇÄºY”\Ò\è9C»wL\äEAöÇ¼-67o» ù £$.\Ö\Äm?1!\Ü(NW\É\ìg\Ş]‰(B´\Ö/4·	R\Ä&/\ß¸ ))<ø†â’Œ£²!eM…M\ïlR\Ü	\Å\é´\ÜM\Û@”›¶¼±\Ó+•kÀp{K·ná¨¾ã¨—†\æF´!şB„_B¿œK—dº \ã\Ğ‡|À\å\æfÊ±-w\nƒX\ç\Ä3œ\è\Äf0[[¡Y^Ó‰MN\Z/³\Ô\à‚‡C˜@†u‘†¥-\ê¸Ù3úÀ‹ü\Ğ>‰Å—˜­—ûy#\è¨jğ\äo\îR\î£`2ZM”Y¨ü•®9œµ\êÁº»¾üf—d¹«i\ÑıJH\Z•@¢¼\ßA\ÉÑª\îb‡«¡\Û\ÜT6 ˆ®o»6uğ€\ï-±‰šy¦“E(co9)ˆ\\A\Ú·L·6$k0%&\n´¶8c@š\Ñ@\æ\Åv\ïLÌªV\ç,…R¼”°\Ê^¶k\Ì\Ö´¬\ç#g\ÄzŠZ\Ö\Ú\ÎyŒ$@]13°¦’¿Ã¯G’¥\ÆTÕ„}Ÿ˜! \Ëw¡ó«\Ô& d©iğs\Ó{¨6]£\Ñz7\Ìª L_6\Õ>\ä\Òb\é\Ê!IW¨‡1“¼y?.Vºš´«h\"Z¡e/=\Ä@\'n9¾<Dõ\àKœ¥\ÄK“\í»Lyx€¬±§%ò\íúh\"­\rÒ‹UŒo8€l»\0 X7”_vkLF`ù\ã\ÚX®’›\Â\ÓA^ ¥\ÌR¹´´ö9ó\Z¢&º\ZÁ­j\àwÄ‰p \ã\ĞÄ¸2\à\Ü&¡GSI•z`©\Ä56BUõÀ96,|0ZE\ÈPiûA\ëgšQ\Â)š\É\èµt\Ù\ïÿ\0w5¦V³\05h¹¤o\àXA\É\Ü¥·oOÁ]G¾@Ë¹uº7šR§Pt{âµ®\Ï\Ë\0‡š-@z\"±;\è¶·Ì»8Te©€˜«[%\èF€\Ş\î\İÂ±ˆ\ê„l¬oA*õ»@€_,\0±\Z6 #_)wUN#A­òw<ƒ\ß¤\É[æ“¦/÷)	(¦³\Ø^!“¹·=¶˜\Ñ U^\ÛÜ¥PaO#\İ\Í-@lñk©[\ÌÛ‚¡½E…L¢øò\Ëú@o•\Ì\n,8\rød\ëP‚×¦{ˆb…)Âƒz\ÜK%6}B\æF??x2Šÿ\0—>e\\i_0 Sq:B‡8Gü\Û÷²‡|#‰ q&ˆ8˜^õ\Ç\Ö	\áªßˆ\è]iKE®rY\rP³‚/Vqóe $ps˜!\0\n¥{WŸo:º\ÆAÙ¸\Ğ8Àlo«\Æ\åš\æ‚\ìŸx0\Ğ\Õ\í\æó\ÌS Q@µgÁñ\Ìd–)X¥\Õus\æ\Z\Æ\ÈF\Ç0j›\Îvó¸†\âÅ¬\Z\Öq©¤R%\í\áqDn\é>®+d[™rªq_\î\Ã\ãÿ\0psGDÿ\0pxO0\0¿‰ıË…—¢\Ò\Ğ$õ&¿û™¿÷\n/\Çûóûƒƒşs8ñ\Ï_\ÌpN:o÷z=\íù†	KYA+‡Áh\Ïò4«õs-\"¦k\Ç(²z(Sjk@$h\äü\Åp+”8ø¹X49\n¨¬\ê\âmÒ…}\Ù4®’[3\Ì±RNS—·û—f|?˜}¹¯1k\ËV²!Ó”_Ÿ˜i5¶­s\ï\æ!M”\È\ëš\'\Ïù\â\0ajøKÊ‘z\ÍŞ§»€ÿ\0YilŸõ”Ö…R\âW\Ø\ß\âWu\n®p\İ\áœW‹Cr­ \Ø]b¡­Mkq\r ı«ù– ª\0üEj-·\Û\à”ˆ”ª_Å¢\".l¶n\æ\"³›\Ğ3iZ\Ù±¹K\à2¶\ÜCxÊ™\"B\Æ/A£|¸\Úip\"\r•¨d.òC>\âˆ#u„ƒhlÅ¸§0—¡”;!™\Í7=ˆ\Û\î¸øK\rò\ÎX–¢t¯\ÄÍ›\"Wû†•w,\Ó\Ã85ˆ¥µQZ#¤\0ƒÁ¨€+\æ6`_¹’\Ã8RÕ¦¢NtÌ°\èö\Ş\ØL²¢[\r¸\Ü32s,G„ª…\é¾\é¨\Å\Õo[P!\ÓSœ€$3†£†¼\Ìc›]÷AE™!\Éõp\å\æ–6û”C<%\í\ç§9I~iö†˜pqÃ—˜\í7J®¥–C\ârK¤öq·\æ/r\ŞB¬\Ó\Ü‹`¥€•o0\Ú\æ\0\ìË¿\ë\Ù)‹ô¨\æPı\ãu•\Ô\Åó¬EMK\rDº–¨—öT}q?„\İ\0\Ùq\æ^\âš+~\ï´[™\å¾ˆ²%UOlóU‘QW#^\æb´‹PX›LÁ\Ók\ÍS…\ä÷ƒ­KÄ½Xm\É\å½µtC±6òGŒÀš–\ãPw6‰õ\\òõƒªö\âú¹FQ8¦\ág3­<\Í\íZ­GP÷\äa‘BÇ…ñ\æÓ³;&r\Îi›\ØwS‘y‚y—4\Ä\Í9JH\Âø¯3>%%`C7*5°\ÓÄ«v‰Hù#h+¼Áq\ÒJ\ÍÁU™Î£Z–\Ã0”ã¤±\0ó+ŠU\î\áøs	¤6dıA \ä\Ü!U\ÉCõ@\ãU`‚\ÓR±U\Û\n\ë\Şg8q:w™m›4\à>.p²mıFÀÀE59D¸lHf\ß\\Wk$V\Ê!–\èN”¾2@\É\Ò\Şe˜˜„s©£´V\Ô,\àûcjı‘\í¤\ãü\å+\Z\æ\á)EG\Ãp¬ »ƒT@§s\ÔV\æW\î—\ĞyX‚+jŠ\Ò¿\Æb¯Ü¶@¹“Á¨\ÂÀ_Ÿxñ2\äOû¨&¡\É\Ê\ïğBª\0Ù§8¯¨­|*f§&#„\án\â„X\á\â\Øb\éº\é|~şeœ#\ÇfPT\å\ì^ò†kQšº?¸6#†\éN«˜s“CÀº<B\ØAC\Ï,§Œ\ãg¼°c\"\á£\â2\\@\ÔŠ¹‹™\Ç\Ä4\æ8°½C\Ú\'¦_…#y\É©\å™vD¸iˆÀ¦ Q)B›•p\Æ%Ûˆ¨÷\Ş‚–‹˜]ªc‹\ê*½\è¼ş\Õ\Ùb$-\ç®!\í\0k ÷‡uoZ[ˆ$\Äø§~\ŞI7g§‘%…÷òŸS\Í?÷ˆ‹Px/‡Ïˆ8uÌ®¼²¦)À\é›AM9®#\í]	\Ü\æ37¦\Æ.w. Ç¶@\Óú¡4ñT{\ÄÊŸ,\ß\å”*ø\ê/&4—ƒB\ÕÊº¬<7dd[\Ğ\Z•ñP\× –»\æS\ï¯\Ùˆ*$\Í\æ4!`\ÚØ®¦Ú™)W0RŒG\Û\í\r\ém«\ÄvPœ¥u\Öê‘›b\î\0\Í3û¾Jf–À\×8\ëõ**­=ÿ\0\ÕQ\Â\ê\\©¡·©\ØWs\n3\æx2\È\àQ\×T\á\à\Ô\Ç!\æÌ»(€\n\rn»e>$|#¾\éğzq™-\é\Ä\Ì	Sm¨ú\Å5BØ–\Ép\Ü\è©\Ó\Äõg)&\çd‚=0\íUKˆ&\ÆeÀE‹r¢ñ.Ã1xÁ^è‚™j\ËdW«‹\Ç3_\ê @ À«ye‘\à\Ì>#Q`a‚\à½ûDu½l\Óûˆe\ÃÏ“¸•l2y\ç\î\r#\Ó\Ô	\Ì\É^Mÿ\0r´o©¹Ø¿LÅ•\í­ö|Jø\ÊkÀó,o\Å%¢µµT¤ü\"¢\Ó\Ãø$\Ó}C±\Ñ.WP-8%„RW\îccjü¾!»\r­²–³-&S\Ş2¾ó!\í\å0YL\ÍK#\'¤Q±6‡N\ê.\í‘éŠ \r\Ê\êSZ¬«÷–\n\Ø`	Mu\æv©o|õ.:\Ñ6ÿ\0\Ø-\ÍP©\Îÿ\0ò/\İ\Ö\Ë\Ù$\ÙUüÁ\ì±ß™s’\Ô#XV‘_r\áKgOS63õ\Å>\ÈKi\Ä\0¸À4”ß¼·\Ü\åù±Wm¹”x‹\'œòn[%IXõa\ï(s9Ab\\2¦1#(\ì\æQ:0CGq\Ò-HôÃU2´ô\àX\ËË‰™+jf‰•\æ\åÏ¨—*l\"¯¼F@ƒOñ\ÆÀ£Ìµ¶b/˜a½j\rOb™W\Ì‰²_\Ã,\à-~cµ§¢Š†X\Ø‹slY‹@8!\\,bb!\r€¥_ŸHlc3ı“	Æ†>¥ó™hS–\Z\î\å4\ÄXø\'¼x{aOb~è±\Ì%%C\Óö™Û™³\Ì\×\ï,ÿ\0*c¡•\Û\Ú¥EA»\ïÄº\Â\\°y…ÈD²½\æV´ÿ\0 µ[\Ïs\0\èø%Ğ«7ƒ3J\rPñ\01‹–%@7\Äv\ÔÅ®’–ÿ\0dwW…\Ó/Ôv\éSó\r|	Áûƒp›‘\n”°@x\Ì\Ò\\ÈŠ»1\í°:¡s3c\æ1\â1H\Âj\ã¦.\Î%P\Î\àR+¨•1€#\Äğ\n7\ÄU\Ë*\'X¢ªP­[Y ı“[l3Às3û(¯\ß\Ìm\Ü(el2õ™u­½Q),Š¬‘:¬‚®¥Ë®z!\ÎM\Øv%˜M”i¬M¬\Şe\Z{!\å3UwL\Ñ26NN¦ñ\Éu9‰hRY˜­ğ\â(ó¹‚^\Ñ ‘ÀCY\Ä2»\âPOyíŸ…ñQö—.]F6Ê¨)}Eò÷›\\\Z\ìi÷\ê2\Ø6|[¬\rğf%À¸„“ğ¦¿–5u).¡¹g¼TË—\İ7M)œD¿w\ËÁ]\Ór€\Ö]M\Å\ç @a\Ô\\\ÂJ1\Ò%M—\å\ïdBfM¥A*şf9p\Í\é\Âe\Ü\æ7¹v\Æ ,œ\\µ\ÍŠù‰›FbÀ—‚\ÆV¢^fCC¬ ¨\Õ!-’\Ô\çS€T_ÀÂ³\ßmu\Ñ)MV®\Ï2Ë¥«•ºÄ¸€El%•Š*†`i&f\à?1aûŠ´¯?Ü¶\ì-Ss(bRH2[u+²\àbp¢V\ĞeHx„ª\r1œ`,R–½§\ÃÚÇ¼\Õˆ>·P\Â<½¢\Îü\Ã\ĞÀÅ˜Œ½Ø¾\Ø®A\ï\â&•¶°%\Î\ã±\ËR½F»Šœp	Ç¥š0ómH.ñ’\Z6ƒƒc\æp2’	¸´\í`e•*%N Y)˜\"}—òˆ\î_7Jó*be‰LB7/¹Gu(\å(e N÷*p«\"X\è8\"z\ÌnoõM\äJ¾f«2\áñŸhR\áú¿\á\"U|Us\âe´ø<@8ƒop\n!«\Üz+Å¨\åƒ\Ñú™\ÒF!“¾ ¸V<s\â\Ô\Ò;\'S\n\ÙYP·(¨\æQ*\'>ğ±\n¶Ÿ‚„´\Ò(°\Î%@F€ZF(ş£Tf¦\ç\ât¯“Öˆ£óù\'$AW\É\ìw+A6ºøş¢\Ğ	²\×\ïzŒpP`ö†‹—qEü%R\n\\ö“¼,4GFHWšgqf—¼Š‡™Aµmõ\ÔÏ¡.¢\Ê\\X>cŠ7\ïRóº•\Õó.R“Ÿh){Å™tJYG´³\è\Ô:•IqôÇ¶ \×\ÑITû\Âb3»#s:`Ú±\Èö˜|§ñ\\\Ç72—¸@\rq$~•òùƒ|˜%#®\ã£-ûÊ‰ˆ`H\î)%£f&6µÆ»#‚=zŠ\Å~\ÑEˆ9}½ˆ\ì\è*+l`òAK-g†;\ê6\Â%1a¸\Ëe f(\ëØœóø¢ÿ\0‡0›<\Íşó_D±Dp\ËYi·§1\×±·\æ/\\¼—›ˆ‰C‚b\n„…LYıÇ¾*<\åñ2\\\0˜Sò‹Ø©us­ ¶3P!´‰j\Ô\Ùğ%ÿ\0;ôy{K{W*1<\Å\Õi†{\Ã?b\"¥Ä³\İ^ñŒ‡‰T¼IUĞ³\Éb¿K:¹YØ½\âLœK.J†øqb¹U\ã\Ø\Úğûˆ\İd^«ó‘ù‰‹Å—\0Wˆ&\n\Ğ{Jİ_0U¢\Í\æ\Å–% \æ\ÖX]‹\Ô>Š\Ú4\Ë[–ğ‚¡d°\\j4JÙŠè¸…]\ÅFªU±ª=§\Ì\Ú!·R“\İú´\Û5ÿ\0?\ß1pú³š«ƒG\ÜmBu˜6Î··\â˜i¡>S\ÛË\ÛT°oìªk\âJ\0f·XŒ‚\Ìfm¶» \ï@¶3R\äpaÁ>U‘ñÅ—\ë~•€0\îS¤øT5\Ö)\È\Ú\î0`\Æp;™‚v^&_0O)\Ù`Bª7\Â\n¼Ç¹¿\äT­NZ\Ì6CW9¬F\ä*	Vo!*C\Ëhóq‚\ëˆd6\ì\é>\ÙN€s„~\Éf®õ¨’‹·\ä¸ø¡R¿lFl#`Âk.\\\ÊÆ«\"y-pk‚\n²@t{ıÁ\Ğ~\éı \0«NE\âÿ\0I]°Ï˜nS†&F‡´G>ğA¯’Š\âY)n6^\Æ,EC\í-WPl\Ü\ÙXÀ	j\Ïs\î”DÆ¡\\\ÎWrˆLO´\Û%@¶dFEÑ†\Ì	PŸ–“˜#‚\Â=\åfX \Ñ|\Åp0şH—Á{vª%§«r„²\à˜ù\Û\n°eúŒ“\Åx_œ¦:\î(+ÀD5¬Å¤Eº–T¹¹^—\è7?dYrX@£\Ú\n’gb\æ\"]3…L\ê¬t\Æ\Û`—2¯ˆ\á\Üò•a‘˜™ˆ\ç´+„F˜\Ê;÷¹H\Ë\rğ\â/c¸¨b‰Å´¿`¤\Ë2J»z	Ä²)ML£R_‚\Ä\å‡c$P\Íe\0\Í\âkE¶‚ÿ\0™¿z°ùH\n\ÉMs.8\Ö\Æ\Èdª\Ù\n	®\Ö\ì&\Ì\Æ\Îê²µ‹µ÷šqmş%\Zk±º´0À±Juš¿!+›P«#“\äˆ\ì¡o&µ˜W)#¢0¨%„\Ä\r8Sş\Ğv©òLÀ¸ˆ\ãÑ¢…s3‡\é›=cˆ¢q*B¾\Ñ	‰ª`Dœ\Úh•GtWP\r­Dfr’Øµ ö\Ì\ØQ9Uq“Kµ¿Qd\í\è¬ı\Ã^5˜À7SX\0;x€“\rT½-\Ô5c•s÷·]…Á\Å^\ìc…\Ä\íÁa\Íb_VkŠ‚Ê³@4›Ÿ—+ü\È*¶¶2|&1\ë*…3)x\ØT£+½M.Xxf¡\Üc†8Á]g\ĞM\×(­·Ï¢`fü€«û³ùŒšK\æ4!\î\Û°ÀË¸\Ìc#¸M²š¶\è/€Ä£•‹ªc\ÃS\Ë\ìòõ-(/¡Ÿ\ÅşDtÚ”ğ™‚2\Ç\ì\nµ¹\ìn[Pr2\ËN\"[=¦.¶Å¶ÁŒ+-„¨4RıLÊª0M(;q•\"ñ8/döfD±œF¢û™ø\'ˆišz”\Â\àXÑ…0\ã\í\ÅB#£\×\È\íµ\Íü\Êˆ ûÄ»WDA/Œ£?¨)»­üD#o;q	)œ\Ü<a£†qT¹–/,·M\ÓPÄ LMs,¡Ñ¦0œ€ğ\ë\É/2\åÁ‹N#»,¢\Ãp\ĞRª$\ÒE)\Ş!X9Bi¨\Ùj\È\àeº\èE©DÅ¸>ğ\Ğ1\Ö\à!ù”ƒ_\Ü\Ç<j\"\Äo¸&‡\Öö¤\Ë\Æw\á‡÷*Nhu˜[®Ls\è`\îl`\'\İ>\Ú\ÊğË¼ªşn×¶zl°n\Û7m|Œ¾ÁÄ©\êd®\"kTR\"\ï\á†i‰l·™Ô‘\Ô-N\ÈÑŸ•ñ4V¸©iq˜¡g0\Óû \ã\ß\Ñe\Í\Í`\È\Ø\"wr³R\ì¶b\ÒU€Š\Äı³Hef6‚ŒÁ\Ç	¢\Z1\âa –®¦n\Ú³¯\ÄÀ\ê*BQ/0G\åˆbB\ê\ålüAl@fİ°\à\0d¡`ş¢Áx¬\Ïú#z‘=\Ì\î*\\}T3sŸR³(E\Ì	U.)uøœ¹D=z¸\Ê*”\â\Öv£4J7/=\å$¨Ù¸\æa\×epĞ°^\n7³¨	\Ä@\Ì/V\à,bj7Äš˜ .‘k\ÑYª`?%ü\Î™8•<BŠ·¸”‚‹—3¾bj¨|Kú¯\r•`c)xIT\×¥:q\"\Å\0µ·û7 v)}\ãó\n„r9À«ñ* w9‹o»&ºùEò°{79f|\ÆY¡\ç¨H†\Ñ\"¬Ñˆ­°@0Q¹–ó¬\Z\Â±”v|1SöŠ\îF0\Û±.#jƒó ©\Z—R”\êß„\Î0‹ò˜v`´”c9…@”„\ìñ\í\ât¦®Um\ÒŞ¥0¼\Ñ\ÄÀJp¸^:`Œ\ä3û•õ¨«e–òLFÚƒKHSs\ÒË‹‰Ìºƒ>bÍ‹Á4\è(*¤7G˜‚«b \Å`\0 G7š7\Z?A*5pW˜)q„®a\ÍDÂ\Ë\î1Š»ö#·t~\á¨i›—L‚\Òò€°º0>¿r1\rE¯E*<\Ò%\Ì7\Ín\áÊ…á•¨§H+Q¬† \ÖCR\İITşa:\ä\È,™¥Œ€c\Èü¤!\Ä\Ê0½q¤­Y]ñh©\×\é\Äk³oxpKA«\ÌÁTâ †Z\ÄÎ°ŠË°\èƒhôl‰m\Ìc%@F=g7–°\Ì4\É\Õ\Ïq„s]™—M0\Üj=>f†a·	k®\ã¯a¬:†¨\Ù<\\yl£,ş#U‰Ï™}˜6¥:°ñ+\Ş\ã¶P\"\ÛV_Xø›Œ\Ôe<\ë2—ß˜\é±ñV8ñ\è\Ç\è5\\·\é<ü\Ô@ğÂµ2\Ö`ƒ˜Qªe¶\ãœ×¼Af\0sr­%\Ì\ãŞ ¸™%f&P\Í™\'ğd¡—DB\Z\Ç\n\"²)õ019¸Û˜\Û.%÷\ã\Ñegˆ¬ašş¥	W!ø•ƒ\ìT`\\9B\ØT\Å\å+(5\Ôß˜v7Mø¶\á”\Å\â;Šø•¨\Óp|$8M²q\0k\æR†\ï	¬/Ü† G*!\\\Ø(Q¼ ‰s\Í	C’©\ÜFnf\Ù2ŒE\ï\Ş0\ÇtÀò¥Ì¦a¨*t\Ô+1X#±0µ×™‰R“\ãCD(,strıB2€`”ø˜Í¦`¥\ê\Õ.ÁKv%lu#S,oS25°º\Î‡÷+x¦R¦Q\Æ&d\ÛpTö\ãm‰[.,[ô>ºRh)ù€\Ğô\Ğ2G]J\è¨Th¸+\Ú\Ø\Ğ3\ê\ËÛŠ(W\æˆ16b,••\\³{?H€n	Ì»Q˜Ú¥Ç†\Æ.\Ö•ŸE\ä\\Œº\î-Y±E\åz%PŒV¬\ëÉ°Å·Ÿ\ê>±\æ	Q5#\Ã\Ì}\Ë\ËaOš„3j¾\Ã.3y²\rAPæ¤¸w64).£Ìµ†š—4«7\ÄA\ŞUZË…•¦¥­p4Ác1\Åñ\ÍEe\î\ãÒˆ\ÂıÀ2n£š\ÇE\Ë\ê?DoI»‹ UÓ˜º£XD\é8¹È…:•]Ê€óL3\n‚\ÆKb\ÈO,Ä·p.Ÿn\å\È){\ÄÍ±mk¤\Ã.%Xªqq,l£õ	ø\ÔI\ßu=Ì¶\\;c“\Ğj.b\Äq˜L-ªm\n”9—\ÑÄ¾\Ü}\å\Ä%`øŸq\0%¨fƒ\È\ÄK¯­À\n\Ù.	\ÈHšÖ¬=£1„wÿ\0ff?\Ô\ÑcÁˆ\Ø]KupºşøKL?\ç†É«U\Ñr†…`\Ë_W*Z\ÂÃ‘\Éøõ”\æG§PW,\äID\Ó]Mnôn£Gô…¡@\r¤Zis©xµv\ì\0,sx¹^]\æşh”¯,¨¸”\îŸy¢\Øó\ï\ÅW\Ë%Ÿ5,*B+¶\Ï/…¾`C\êd\r—ó\Â2o˜}6G¿c7¶ “L\0> \×\âY\Ñ\Ü1Ha^\"ª¢«1\Ó\ï\0¼…>e`°\ßr9‹Ãˆ`Z†À¼û¸—h\æ\Çqó\â\â¼BªSŒ9‚\Ñ.“c\Ç,Q\éz–d®\Ã\0ttC´5Ó\ÂG¿¥¨2@A¹xô¸eô1\ÊHó±o2Ô®† ¸Áˆ%aä•®“rXCyˆ(\Ñ\Ë_º¿\Ä.‚9ûf\İ\n¡¹a:\Ûz§÷€Ö\Ù\"\éT­maü¥.=¡R\Æ\ìE\ç\0m”$-0\æ:^ù^k\'\ÔÁ,™L\Ä\Íö”\á¡`\áÅ’R’#7K\É\\\Å!Àgbm÷– [7j«Œu\Üs\Ímß”­	z·\Ì![Æ»yb¢\á36‰—G1SGWS`µ\06Ë·ˆPñf‡d¸[Ì½˜\ÙÄ¢`Æ”\Ù\Ên\Z‰,f,@|EeQ,ŠNf …™Ef¼\Â\Ûğ\ês\Ş&F…öŒ—ˆ7•P2^löŠ“[­„\ÒW tdhG\Ş\ç©OˆE(j¿\Æ[Bù\Ìj¤–££˜\Î.\\˜¤nŸ®†ul© Ë e\Å\Üb“W+&õ/I³¹y\Ù\"™%\ê\\ğ\Ë=Ò“xk\0|\ÌJğ \\Ö‡\æ\ê\ï\í6—\Ìg:\\\Êô\Ã=²¶I_–¬k\ÄUL«˜\Z\è”\\]:¯\Èa…rÍŒ÷\ç»\ÌwC1\êôÚ¥ß’¢ğ¹¼\Äú.*\è2\Ê|¸‡\Ç\Ò\\\Ô:ñjmE\0oX\Ó\ì‚\é(Q.0•û™H\î]Kª\Ä\\\rJ¥iv3S©L^\îZ£º÷¡¯Œ\'á‡»\"q\'Ì¶´1•\Ù}‘\'\Æ^\Îl,$|Ì‰Q²87‹\âR\ÕW\Î·ñ0\ÔP‡eT§2\Ó\0´\Äf\à\ĞN¡l=\áÁ™b¹3\æ6®M…«\rRoû†\Ş\ß÷Ã§\ÌÌŒL­a¦5ô¥˜?\àr—L\ÅK¨\Æ\\\Ê$fxX£“\Ğ¬2\Ü¯o¨ş\áùZª\ç·\ÌşB-Ñ”ë‡\ÓWd s7\ÚY¸\â“\"c\á\èğ\"\×w!£\Ğ;ğ8a¶&;<\'	Ô«Y”«ú÷ag2­\ZqÜ¬\Ğ\ìV÷J§QØ…`ŠEx\ÄUr¹Wl\Ö>—pP¸\Î\êT·\r’\Ñ\á¸a¤\ê\×\ÄxõeJW¸ˆa˜¯\ä™\'¼¢[”¹Ì­ƒ#¦\å;¢	`IJ\Ø9®¦Íœ\â&x\Ü\n»\Úû˜\É\Äk@\'‚N£”õò\æ]Ì¾e;DP¾\"\î1ÁÁ\Ï|$\'TöÁ¤x\0;\0ñ<\ã·X0võ,–¾’¬\Ş\ï­€Šû—.:¥n;:—@¬Q\íJÔŒ\ÜM\êq•x‰N3˜–A¸~ğS†\ã·7¹x¡Iª,¦\â+øi\ìŠB\æ“X•Ÿ3ˆÔƒŒf:[\ÔÙ£‘¡ş™mCX$”\Ü\á#L·0\ç&¹A\Z\ÜNRõÌ \Ê\ì\â<Eqô;		ZRø•>‘T¥9Bû&	ÀH—¯¼]õ¦V\î\'Ô­ x¸<´bf¹”\Ü%ˆ«7‰•Î£\Ñ|\"ü£H„\ç\â$|‡j.ˆ¦3\Û§\Ò)\ç\î*\n€Ûˆ>NØ·r™[…\áÊµ\Ì0µ!W\åò3?”‰+µ\ĞV\âs(KW9‰m?1\Öw\0\Ëó¤4•s4\Ü]px¸\íIH³²7«‰t\âdDOÅ¨\Z‚\åŞ§4B\rv.\"š4\ÔT‡K¨óp\Éi\Z5\\Àw\n‡\ë\Ú\á -ğO$[<\Ñ2°°bg\ÂZ\âZ\ÜØ‡¸Á!\Ğ\ä\0Ceƒ§»9‰\Ú\Û:€]\Çˆ,°xs9™W\rXÚ·\èŠ,¸‚c¢0\íp>}ı\\°<J\ÕBW°A\Ê×‰ˆ¨\î\ç˜%\Æ@´š`\îyA‚g\Ø\É9o¼\ê¾\â\Î8\"\ÇZˆ\Üf(§3>OR‡ö,Ø¶^\"«\â\â:Ì¤\é0~ ñ+L<Cr\Ä-\Âvy„Hb#§§\ÌQÅ‘•\Ã ùZ\"‹Á\Û-¾\Æ6\æ*Š“\Ép4zqE©y™V\ÔZ\É\\K C\Â-P\è\æ\\9¡¬I˜5FK2\ç‰J½À&!n\ì1R\ÑU0ùó\0<8–(ó}£_3\Şa,/x\ê$\ZY\Ë+	11¸¬	b9”WÄ»\ĞK\Ø>\ç\ZÕ‰T‰È˜G	8\íY°Sµp\æ´ğ§x«%0³x¯s]\Í£Û¹wˆ\í–7[…\Zc…2¬\Şşá™Ÿ)\Ì.}[0\Ìf†\ÓH®P\èqé€¾%…F&T,Ï¶\Ú\" 2K )\Ó-V]wqZ—°†\İ^c\â\çD\Ş\ï<ŸRÍ¬É¸\Â\æ,¸¶Ì¹O†ö\Å|ÁN\â\ZL½d–š\ç“§\Ì$Ì­ñ¦Dx‚[œ‘·tua!¼8\Şgµ¢M`˜C,Î›À\ë\ï1a¨ª-Ë¸­z…\Ñ1\ß\ÙqZy>N#P9cu¬\Ëü #¥Eƒ8\Ûy\âOaD .ĞJ?ôuÔ±|b…\â\â\ï\Ä\ÒY#F˜™f“I„Y\ï¬2\ï¨\Õw/#²‰}2X8C‘0Œ0µš\åWœ¯ş¨¨6O°ü\Zg•OEC(\Ì\ĞÁ{GØo\Úa\â· Ö…\\k\Å\nedvU±ÃŠù%²Z¼B¬	²&(2¼’]GöVB\nc:W«\Ó\Z\ÉFà¥³\á…C­”J‰\"¼\\Ppq,7˜¹‹š\ÔXÅeq\È6\Ë\Ñ.\"¼Å–`y—Å¹ayŠVqFÇ‘ş:ŒÄ–V$;\ä[s…Ağ\ÈDS8A\Ù+-)ó¸\è<FX¶\ÂšôR\'	^ó\n\"\ß^e\Ó8™\Ëˆ?“™™P\á\áŒ©²	ƒ…0Ái³\Ã½®}È‚}ø`\ZNG’Q¿¦dñaLÁ^beôº¨\å›¤ =¦]Lc!öó\Ã3œ=\Ãó<7P¡óq€qK•D% \â6‚\ÜJ¨£˜i I\ÉóaŠ*\\TJ\ÏK*f6÷ŒQ{”k‰BÁ½Ä¾¬Ç£\é,NzE¿h\ÈÃƒ,Ã½sd\ÌE»IfgNr\Ölsœ\Ñg7Š£‚^#0ß–¢å‹˜ˆª-gV\ç x–ùùu\'$\ã\ä¡\ÕÓ–_vZƒb\Ä=\ÖZÓ±ƒ\Óñ†¢¼5µŸL#¨”D\Ìós;©ua³Å¦ÌŸ\Ä²¼@\\§$­;¹`Y	’™?0¾33¡ŒöK\É\Ö|w`VA6õûñs”\âq\r\Ä\Æ#LÌ¦A\ZC«– \Ã<³]Dİ³¼w·@[<\Ø\ÆR\á¸P‚\ZœŒ¢\Ãõ™WG™€4©ŸE\ê\é½#	U“\"*nd\Ç+Wñ\Ëúˆ\Üøœ2¾ce\\”pÆ˜÷•	¹™yu+P+a\ÑqS/&p\Üw(L=)1+$¤e‚]öbÁ@²-\î,\Çv^5	Yú€\Òı”{¦D¬±ª\Î-\Z…L	®aU`Š\âñB·\éW%³\Ü-÷1ÅÁ¸\Òy”2\ß\â*\İø‹™“>%/Wª\æ+\ÜE#8w\0\ÂÊ´\ëPb\Ü54q\ÑÄ²\ß?\Òtğ³Ü•§™¼D\ÅJ•ŸG^—7¸¦\ÉÁ-K%x•e§oh s™Œd,Š¹øƒ3eUJšƒ	wm+c‰z—\ã\Ä@¬’Õ®\â Z\Å	K`š\Ğm—g©¤Q\åû‹Š³-JóB¨øˆ‹/0e\îc\âó[°Œùªq\àw\éU‰rì‹‰€p¹•Ÿ\æsCDÀ9_\ß2\Ôñ/LiÄ¯ƒ1V‘¦`\ä†\Ñf°\Êr\î-ó9˜³^fn\ÉMù™ó.´™‡\æqùŠ¥LÖ¥\âd=ÁşüN–€²ñ\Z\ï»Ÿ\É0\Ç\Û2\Ü\ß\çk\ï)\ÄLS:Ö–ğ\Ê\\\ä\Ü\æ%zd\Çx˜©¼²ã·¼®\Û\íG5´X\æ\'\Z\Ã(7¶\íeı1…µ\n‰ƒ\ÌL119 Ë§\Éù–£3”z³\ÌF—+i¸…˜aELcú\'5\ÜoL^\åÌ²‚*³D\Z\à\nˆµ%¹ˆ\n\Ì×6ibvD²¾šÔ™F	R&1\ß\èFi\æšÆ©7\0Ì¹¬\ØõôÍ–‚i\æ\ZD™˜bX\n“\Ä\É`±\é~‘-\é!@\Â!šL€\rÌ–\n‰\é\Ík“SşIª\ã\ï\Í\Òı -\Ì,>Y–\ÃĞ‰®’³8h¾7¼Lsó¸,?\Ü\\V´\\x†\á\ÚU\áhn9!Ç‘‚\Ü\ÅÔ¥œ¢oœÓVv3¬Klœ»Š®HOHQk\Æp„\\\Ğ\Î0ß¡—\Ò¹…\Z‚rR¡†P—·$,\ÔÜ‘J#«è¦‚ivZO¾^’\ÔÁ‚m8€3§‡x½¢\ÛZZ`ZK\é\ã‹K‡¿&8ck·ÿ\0Áoÿ\0\å¯ş•ş9ÿ\0ó5\èi\Ğõ¼¯‚\\òÙš\Z\á‘ùÿ\0ô\Z”,vùğy‰p\â-ı¿@Z\\f¿“O\Ìöš¨z¤€A¦Á¥­Õ¦üµÀ¬pn\0?+î¸\ËÀ\è\Äel8£úElg¿÷\Ç\Í>ı±\0Nj\Ş1¼\Ê÷Yt»\Íq\Å\ÏÁ\Êù%.DXdÁË°tş\ã¯@\Ùü°›£@T\à(ª^‰2Ñ’¹`\nA>hÈ1µ™z\Ì\Â.§ö>‚(\â”Ä¦\éd¬„5•š\È[óı½-x\ê;#\ì¹¨\ä\Ä2Ázx´®\Ó\Ğ,õı•xı½2\Ü\ZÈ–«Ö»‡Íar]\ï_ş\ÊW^f9Šxñ\æ8-´û÷mıxšô²xr\Î\å—\Ìc»\Øı\Ë\Íó\Èm\\odP^× õ¿\Ôh±õ\ÖVz.½\Òû§^•\Úû¡øu¸¸4I~?Á¬Â²?\"O\É2ª3¥«µU_1Ğ\Ë„e\Æ\ÊkW\Î\Ïøú@\n\Ù{¼}±°œ]\È4Y\æÿ\0\rir´w1\Äü\ÛÁù˜³ÀtR\ÖW=\ê3o²_©Ø\nû9s \ä\ß\Ûpúş©ˆ’?á¡©Gƒ\Ç\Ôu&!_?2Ù\'I\Û\ã¢[\ì;5™yø\éó\Ì¿|yŸCB¦©*Óƒ-.G„H©\Äù¸¯%ûJ\Æ_“²8-mÚ®4]AZZk“(œŠs\ã\äbÑ·@®\İ\Ä\é`¯6³\Æ®úJSN\àüf\ê\Ñt˜(Ğ\Õ	‹V°\Íj½ƒyÔ­\ïô€¢“®‚\ì4tŠ\âùrù©!A\Zğ‘\ÕBT”¿Ÿÿ\0\n\ãQ<\İ\ï\Ú?•÷–\æv¸:ƒA>\Æy}£2\î<IùaOú\r¦eü0ˆE¸­\éŒ,\êğsñ‡wÓ¥\ßl¼†Á”ı_ü0·]L¼>!\ë\ãûŒ\ÛR¯\Ó\É\n@\Ä‡ÿ\0\Êe\ï\ím¢—ò?€™\Ûs»ñ6—WNcŸı€\0\0pğÃ¤cFù¼#\Ùÿ\0nfB³VI/–ü<“9azü¾Ïˆù%+`²¶LE~™‡³Ä¥…\Ëk•Ü¯E#·µòÿ\0òÄ Y\ÒK%DÁÂ‚~o\âRA,k¨…\Õ#»\Ùò)ÿ\0ôÿ\0ÿ\Ù');
/*!40000 ALTER TABLE `documentoadendascambioproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentoadendasingresoproyectos`
--

DROP TABLE IF EXISTS `documentoadendasingresoproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentoadendasingresoproyectos` (
  `idAdenda` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idAdenda`),
  CONSTRAINT `documentoadendasingresoproyectos_adendas_idadenda` FOREIGN KEY (`idAdenda`) REFERENCES `adendasingresoproyectos` (`idAdenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentoadendasingresoproyectos`
--

LOCK TABLES `documentoadendasingresoproyectos` WRITE;
/*!40000 ALTER TABLE `documentoadendasingresoproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentoadendasingresoproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentoadendasretiroproyectos`
--

DROP TABLE IF EXISTS `documentoadendasretiroproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentoadendasretiroproyectos` (
  `idAdenda` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idAdenda`),
  CONSTRAINT `documentoadendasretirosproyectos_adendas_idadenda` FOREIGN KEY (`idAdenda`) REFERENCES `adendasretiroproyectos` (`idAdenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentoadendasretiroproyectos`
--

LOCK TABLES `documentoadendasretiroproyectos` WRITE;
/*!40000 ALTER TABLE `documentoadendasretiroproyectos` DISABLE KEYS */;
INSERT INTO `documentoadendasretiroproyectos` VALUES (2,'24072017 CA2.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','PK\0\0\0\0\0!\0b\îh^\0\0\0\0\0[Content_Types].xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬”\ËN\Ã0E÷HüC\ä-JÜ²@5\í‚\Ç*Q>ÀÄ“Æªc[iiÿ‰ûB¡j7±\Ï\Ü{2ñ\Íh²nm¶‚ˆÆ»R‹\ÈÀU^7/\Å\Ç\ì%¿’rZY\ï @1__f›\0˜q·\ÃR4D\áAJ¬\Zh>€\ã\Ú\ÇV\ßÆ¹ªZ¨9\È\ÛÁ\àNV\Ş8Ê©\Ó\ã\Ñ\Ôji){^ó\ã-I‹\"{\Üv^¥P!XS)bR¹rú—K¾s(¸3\Õ`c\Ş0†½\İ\Î\ß»¾7M4\Z²©ŠôªZÆk+¿|\\|z¿(‹ôPúº6h_-[@!‚\Ò\Ø\0Pk‹´­2n\Ï}\Ä?£L\Ëğ\Â \İû%\á\Ä\ßdºdN\"m,\à¥ÇDO97*‚~§\ÈÉ¸8ÀO\íc|n¦\Ñ\äEøÿö\éºóÀB\ÉÀ!$}‡\í\à\È\é;{\ì\Ğ\å[ƒ\îñ–\é2ş\0\0ÿÿ\0PK\0\0\0\0\0!\0µU0#ô\0\0\0L\0\0\0_rels/.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬’MO\Ã0†\ïHü‡\È÷\ÕİBKwAH»!T~€I\Üµ£$İ¿\'T\ZƒG½~ü\Ê\Û\İ<\ê\È!ö\â4¬‹;#¶w­†—úqu*&r–Fq¬\á\Äv\Õõ\Õö™GJy(v½*«¸¨¡K\É\ß#F\ÓñD±\Ï.W\Z	¥†=™Z\ÆMY\Şbø®\ÕBSí­†°·7 \ê“Ï›×–¦\é\r?ˆ9L\ìÒ™\ÈsbgÙ®|\Èl!õù\ZUSh9i°br:\"y_dlÀóD›¿ı|-Nœ\ÈR\"4ø2\ÏG\Ç% õZ´4ñËy\Ä7	Ã«\ÈğÉ‚‹¨\Ş\0\0ÿÿ\0PK\0\0\0\0\0!\0>”—ó\0\0\0º\0\0\Z\0xl/_rels/workbook.xml.rels ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¬RMK\Ä0½ş‡0w›v\Ùt/\"\ìU\ëÉ´)\Û&!3~ô\ß*º]X\ÖK/o†y\ï\Í\Çv÷5\âõÁ+¨Šzl\ï;o\Íó\Íb\í­‚G\ì\ê\ë«\íšs¹>’\È,8\æø(%‡£¦\"Dô¹Ò†4j\Î0u2js\Ğ\ÊMY\ŞË´\ä€ú„Sì­‚´·· š)f\åÿ¹C\ÛöŸ‚y\Ñó	I<\ry\0\Ñ\è\Ô!+øÁEöò¼üfMy\ÎkÁ£ú\å«Kª5=|†t ‡\ÈG)’så¢™»U\ï\átBû\Ê)¿\Ûò,\Ëô\ïf\ä\É\Ç\Õ\ß\0\0\0ÿÿ\0PK\0\0\0\0\0!\0a0?i\0\0\î\0\0\0\0\0xl/workbook.xml¬”]o\Ú0†\ï\'\í?d·’–FI*\nTEš¦ª\ë\Ç\rRe’\â\á\Ì6ƒj\Ú\ßqRV6n:m7±­<~\Ï{^\ì÷¾6LÉŒ„ƒ€x U2¹\Ê\Èı\İUD<c©,)W2ò†\\\ä\ïß¥[¥\×K¥\Ö¤\ÉHmm“ø¾)j\ÔTw*¥µ\ê•o\Z\r´45€Ü‚\à\Ô”I\Òı†ª*VÀT\Òv\rœZ”ojÖ˜=MoÁ	ª×›¦_(\Ñ b\É8³\Ï-”x¢H\æ+©4]rL{\Æ{2NĞ‚ZU\Ù¢üN\äQ¾a\à‡a—rVŒ\ÃCg»G›\æ\îN<N•\ÌB™‘3\Õ^N‰§7\Í\å†q\Ü\rGQtNüüW)n4¨{\Ì-hI-L”´hÓ‹ÁÿjIË\Ô\n\à\İ\Â\×\rÓ€uw\Î\ä)~i‘Ğ¥¹¡¶ö6šgd’,\î\rf¸xdœ3*Sµ•\\a,¬¤\Çuú3i\áò÷1\çNW7ÿ3ÿ<uúÀ`k^\Ír¡·{d²TÛŒ`\Û?Ì·\íò#+m‘h4\np¿[»¶ª-š\rO\âöğv\Û\ÛxF;z²­\éµúBC¼C®\í\ç®jXÂ„\áD\ÏË°\ìÿ*¡bJ\×\n\È8ˆ^HO;.\Å\àéŠ¹òN©¥KjÀuHAù\ç=…Ö¬,Á]f’·‡\è{aÒ›\Î{a\ê`Ñ¬ßDNq£=7´J\ã([‰°³\ÍS±¶,#\ß\Ãa0>Î‡ı`v÷‡£ó¨?\ZDı\Ép\Z\Í\â³\Ùtvÿø¿7[,\Ù?:NeMµ½Ó´X\ãSu\Õ%š\árvı€:»o«\Ú\ßÿ•ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0£ÿe\Ô	\0\0\'\0\0\0\0\0xl/sharedStrings.xml”X\İs›8\ïLş\ï\å\î¡v\ÈWs\Ä”T=@>„3m\ŞV\İ`\ä\Îôşû[p‚	ß“m\í\îo¿%\ï^|ùµ\ÊÈ“*JmòË‘3>•§f¡ó\å\åh_<‘²JòE’™\\]şU\å\è\Ëô\à\ÃEYVdóòrôXU\ëÏ“I™>ªUR\ÍZ\å@y0\Å*©\àg±œ”\ëB%‹òQ©j•M\Ï&«D\ç#’šM^\ŞgD6¹ş¹Q\îó\ÉñùhzQ\ê\éE5uİ‹I5½˜Ô¿¶\'\×ıƒˆ\İğ€…DÎ¯$÷8õ‰ELı>\rc.şs\Ú\'\Ìc¾\Ï\Ãşù_9=$¿‘““GŸóˆ¤.1f“”H\ár\ê\0#LÆµ‹#!©?÷ú\Ø!ûGl&\å\É\á\Æq—‡”Ü°E\Ø+^³< •\Ãgn\Ìo2AY\ÄE\Äc\n}ª+B9÷cJ\Ø÷˜E!\n\Ú\Ø*\0^{[“yØˆ\Öj°Ü²»¾\ÔW¼ƒ€ñ`\îCXÀ˜G‚{L°!¢’…’_ù¬/½NR­òJc½6|_õƒN\á\Ğ\äV\Öp³R\Å\Ş\Ìfu_(\Ç\ÖĞ¬tºVY¦Æğ\ÂaÇ¸V\éc>­jWU•T¿\ì\ÄXe\êÁ\ä\ï3¸*\ÛdIa\Õ\â\éB¥u|#Ujxª+¯k\îUQmŠD&\Ùf1ÀVÊ°L¥UarÚô\Ô:)ªd5‡\0\î’T¯5†)\ÜfSŒ]¸\ã–ôA=-\ÊŠ\Úh!\ç[/ b+ı4`O\ØT™c\êoõ\íUş-·­n¶(\Òd\ê\n\ç¶1(_òª®\æ\ä\ÇWUñ\"\Íg²\ïÛKPeªƒô&S¤Rµ®\Òj\Ì6Û³dYç¾‘€t•Œİ¤X\ZASÈƒ^$ÚœFj¥\ë·\Ñ&³m•½x·Ü‹õ%\ä\Ã\Ì\å6xI}ùõŒ\ï›ûŠõ\íöî²¼]l][Q\èüÁHU<AM˜r,\n½T9­\ê;\Çğ5o]//’\Ïy„dõy-óùg…6E“Ü½Lš\ß[’\×V¸\É\n\Õ\åko›r÷*¹™†\Û\é‰ \É\Õ?†Cj—E’\rGÁ\Ó\É27 !5\à „zı®„*\ÓB7-³7t¤²\æQ…¤ —ìµ·\Şı=Î\åxôZ\á\ç¶\Ï\İùL\"\Í.ôIzD2w‡‡U=\ã!BoÀ¾\ã~\à_\ìC„j^±\Ú\ß\"tı\ÅR-\à©\r:€X¨\Å;³\á!BµxŸlxˆ\ĞÁ\ÃB-Ş¹\r:xX¨\ÅûÓ†‡<,\Ô\â9h,h+\ZQº)\Æb;H{“v	\ÛAZû\ÄjL\ìt²µUœ¡^Á\Ä¤µ[œp¬-)\İ4…c\í\nL\éBô…cmL\éB´†c\í\rL\éBt‡cmL\éB4È‘µA0¥{G\ã\î\áÏº3\ZG0Ñ¢XH˜\Ñ\äLo\æ°@Ç°M8>%\çgWyY/S>—0\ÌÂ’¶%%ü‡R£)™\İ\Ìú÷\È7!¡ş‹bA\Èeõb@„w\ÔÇ£µ\'|›ŸJB£˜»0`»\\„0V	¹‰hXO\Ø?``l0	–!•@?øPÿtip\Å\á\Óc„Ä°\é€9>\Ã,_ÓºDw«\í\àƒ\ïƒQ°û ·T\Ö\n%\Ø\àqØ‡ø ğ\È\Üû^CJÌ¢À d\Ì|‡m	\İÏ»~G=\nÜ°‹ğ\æ.\ì\"H\Ä^{NwKò¼e\è‡*pNQvoôüñ¢¨YLÀò£]®4\nw@XtMÿ\0\0ÿÿ\0PK\0\0\0\0\0!\0Œğ”Â \0\0\Z\0\0\0\0\0xl/theme/theme1.xml\ìYO‹7¿ú\Ä\Üÿ›\ÛK¼Á\Û\Ù6»I\È:)9jmÙ£¬fdf\äİ˜(É±P(MK/…\Şz(m	ô’~šmS\Úòú¤{¤µ\ÜM\Ó\r¤%kXf4¿÷ôô\Ş\Ó\ï\é\Ï\ÅKw#†H’R·ê…ŠƒH<\âc\ZO\Û\Î\Í\á \ÔtP*p<ÆŒÇ¤\í,H\ê\\\Ú~ÿ½‹xK„$\"\ä\ãt·Pˆ\ÙV¹œ §øŒ\ÄğmÂ“xM¦\åq‚Ao\ÄÊµJ\Å/G˜\ÆŠqj‡ ƒ\Æ]›L\èˆ8\ÛKõ}}\Ä\"•\r#–\ìK\å$—Ñ°\ãÃªD¤‹4`	:Â¬\í@Oc~<$w…ƒN|h;õç”·/–ñV.\Ä\ÄYMn şr¹\\`|XS}&ÓƒU§®\ë¹~g¥_˜X\Çõ}¿\ï¯ô)\0`¤™-ºN¯\Û\êö¼«²G‹\î^£W¯\ZxM}\Í\æ\'^2ı\î\Z~0À‹^2¼gñI£¸^2¼¿†oT:=·a\à(d4>\\CW<¿,G»‚L8Û±\Â[;h\Ôr\å\n²a•]²‹	Å¦\\‹ğ\0 \Z#±˜‘	A˜Ñƒ„¢]:\r!ñf8\æ)4Wj•A¥ÿ\å\ÏUO\Ê#x‹`MZ\Ú–¤kM\Ò”:m\çC\Ğ\êh—Ï¾ù\ì	zù\ìñÉƒ§\'~:yøğ\äÁ™.Cp\ÇS]ğÅ·Ÿıùõ\Ç\è\'ß¼xô…Ÿ\êø_øä—Ÿ?·a°…ùø·§Ÿõ\é\ï\ß=²À;	>\Ğ\áC\Z‘]%\Ç\è`l\Ê¦\å\ä ùg\ÃSC‡ Û¢º/Bxu™\r\×%¦ón%@06\à\åù\Ã\Öı0™j\éùJÀ=\ÎY—\'V\\‘}i\Îã©½ód®\ãn`|d\ë;À±\Úş|\ÌJm*ƒf^g8xJb\"ü\Æ	±Œ\î6¥†_÷\è(\á)Ÿt›¢.¦V—é‘H…\Ğ .›j\Ã7{·P—3Û¨{\ä\ÈDÂ„À\Ìbü0Ã—ñ\\\àÈ¦rˆ#¦;|‹\Ğf\äş\"\é¸~* \ÒS\Â8\êIš\Úd®%0^-\èW€\\\ìa\ßc‹\ÈD&‚\Út\îb\Îud!fV›i\ê\Ø\ÒCHQŒ®saƒ\ïqs†\Èwˆ7†û%F¸\Ï&‚›À«ºIE‚\È/ó\Ä\ËË„›óqÁ&˜(–\Ú7\Ø<¢ñ™\Ô~ŠÔ½w¤U¥Ó¤\ŞI¨ujíœ¢òM¸ÿ ÷ğ<¾N`Î¬°wüı¿ÿ=oš\Ë\ç\Ï\ÚQ‡«uµv6.\İ\'”±}±`d7U«÷\Ê\Óx\0j[¡ö–«­\Ü,„\Ç|£`\à¦	V2(\á\â#*\Âı\Ï`‰_U›\Öiš«¦h\ÆSXù«fµ)&§t«ı\Ã<\Ú\ã\ãl\ÇZ­\Ê\İiF)E{\Å[µ\ÃnCdh¿Q\ì\ÂV\êÕ¾vªv\ËK¤\ì?1B\ë\Ì4¢n1¢±l„(üjd\çbE\ËbESª_†jÅ•+À´UT`ı„`\Õ\Õv<7;	€Mfd,\ã”\n,£+ƒs®‘\Ş\äL¦g\0,&–PDº%m\İ8<9º,\Õ^!Ò†Zº™Fhib8”Q\ç)y3/g¬[EH\ró¤+–³¡0£\Ñ|±–$rŠX¬3‹\Ñq\Ûñ\ëœğ¬\íL`\ç\Ñr\'•\ë^Ì¦p€6I6\á_‡YfI*z8\r3‡+\Ò\É\Ø ¢‚$ˆÑ¨\í\Èá¯²ÅŠC”m\Õ\Z\Â[k\\h\åm3‚n™L&d$ô°k-\Ò\Ó\Ù+0|6¬_•øëƒ¥$ŸC¸÷\Ãñ1:`ó\ä†ó\ZU\éÀ1M\á\0¨šysL\áDsEdEş*L9\í\êGŠ*‡²v\Ìf!\Î+ŠN\æ\\‘\è\Êõ¶òö–º\îÂƒ©,°ÿº\ê]ª¥\ç4\Ò,j¦Á*²j\Ú\Éô\ÍyÍª¢ˆ\ZVeÔ­¶\riÁu­%\×A¢Z«\ÄU÷\n‚fZÑ™aš´x†%gç­¦i\ç¸ \Ğ<\áoğÛªFX=ñº•\äNg­,\Ëu¥J|uù¡\ßNğƒ;@=83‘ªP\Â\İC‚aÑ—$g´S\ä®\È×ˆğ„\æ	m;÷*^\Ç\rj^Pª4½~É­»•R\Ó\ë\ÔKÏ«Wû^µ\Ò\ë\Ö\îCaaTõ²‹—œG±E~ı¢\Ú×®`¢\å‘Û…\Ê\\]­”•\á\ê\n¦Z3®`²\ë4”7,¢@:÷üÚ UouıR«\Ş”\Ü^·Yj~·\ÔóƒFo\Ğ¼fkp\ßAG\n\ìv\ê\ë÷›%¿\Z%×¯Hó›­RÃ­\Õ:n£\Óì»ûù2F\ÑG\îp¯²kû/\0\0\0ÿÿ\0PK\0\0\0\0\0!\0	b+\Ø\Í\0\0\Û\0\0\r\0\0\0xl/styles.xml\ÌXKo\Û8¾\Øÿ ğ®\èËµ\rIEmG@¶(\Ø+-Q6Q>Š\Î\Ê]\ìï’l%i\'q\Ò\Í!\æ\ĞÃ™\á¼ø\ã\rg\Î5Q5•\"AÁ™\"rYP±N\Ğ÷«Ì §\ÖX˜IA´#5úşõ.®õ‘\Ë\r!\Ú¢N\ĞF\ëj\æyu¾!\×g²\"¾)¥\âX©\Ö^])‚‹\Ú\â\Ì}\ìqLj%\Ìx~ŒÕm\å\æ’WX\ÓeT\ï¬,\äğ|öi-¤\Â+¦6Á\çNŒU\Øk°[w”pš+Y\ËRŸPO–%\Í\É][§\Ş\Ô\ÃùAˆ}¤ òü°½x\Z—R\è\Ú\É\åV\èE \İ=û!\ä?\"3_ALPË•\ÆõO\ç\Z3\Ø	—Æ¹dR9\Zœ\rwµ;s\Òr,0£+E\r[‰9e»v;46>§\à-³\é;\î\è±ü¯#µµ^­W	\Ê2\ßş;N®l\àª\×Wfıõ\Zq±\á©!>”±}¶„&1`#¡4Q\"\Â\é\ÖW»\n\ÒB@Í¶\áµ|p¯\Şa48\àY…i¼’ª€\Ñ\ç©I\Év+)5N\Ñõ\Æ|jYÁÿ•\Ô\ZJ)Š\×R`fR¬?\Ñ-\à:9a\ì\Òô‘¿\Ë²›\Ò[qı©Ht$“œı.\Ò-[y-a\ä¥µ²‡b\Ç`ó\Ó\å:M¹Wp\ß\é\0ü½Uû\Ó®*¶3mJµ£\àÌú\È\èZp\Ò2¤1\ÔoK:©\èO8h\n\ßø\Z™n­in\èøI[¿Myÿõ ıı¿\r<ª\îû¢ñ\ç.©oK\ç¡P¼]®Ø‚|F²ŒN,\ëô\î8Ef|\İòQ™.ƒz}iõv\Õúôú}»¤yš‰Æ®®3]u\'ô\íq}00	ı\èûq«Sß¶òvVDhû\Õø\Ûb6Ü\æ24\åODaø>=·\ç˜\'ş¨ô¥\Î\Z`‰·{\'óŠ.\0Ux\è\Z\Ú\ã\ZÇ \ã}5‰Á¨\ĞAgµ¥LSñ$2‹æ€­bº\Çù70øt |<œnCK€u\ë…::$e‹÷‹{d€@\Í0azV\Õ[\ë3Z\á\Ú\ÚÌ€[\î}	Á/H‰·L_\í¿L\Ğaı…t\Ë!/:®oôZj+\"A‡õgt\ë(\Ò\è\Ï5LMğ\élMĞ¿ó÷\Ó\åEº>qG\ç$r§\Ñ|\éF£\Å|¹Ì¦~\è/ş£/E\í\à0(\Íj«\ê.\Ûy\ØKĞ€hÍ·1³‡¶OÃ±ÿ1\n|7;÷w4\Æw2>\Ü,\n\Â\åx4¿ˆ²h`{ô\Ì\á\×÷‚ ~› ši\Ê	£¢U¡\á.	\È.\áõ‘ğ¿J¤¿\0\0\0ÿÿ\0PK\0\0\0\0\0!\0ş~|±§\0\08\0\0\0\0\0xl/worksheets/sheet1.xmlŒ™ks›:†¿Ÿ™ó<ş^as\Ë$\é€hz¿¥m\ÚôÁ8aŠÛ¿?+˜}å¦\é¤-+\é\İ}„?\Ø“»¬ªór{23k:É¶i¹Ê·\×\'\Óo_Ïù\ÓI\İ$\ÛUR”\Û\ìdú˜\Õ\Ó\ç§ÿşs|_V¿\ê›,k&\äa[ŸLošfw4Ÿ\×\éM¶I\êY¹Ë¶Ô².«M\Ò\Ğ\Ï\êz^\ïª,YµmŠ¹mY\î|“\ä\Ûi\ç\á¨ú\åz§Y\\¦·›l\ÛtNª¬H\Z\Z}“\ï\ê\Ş\Û&ıw›¤úu»{––›¹¸Ê‹¼ylN\'›ô\èõõ¶¬’«‚\æı –I\Úûn\î7yZ•u¹nf\än\Ş\rÔœs0\æ\ä\éôx•\Ó”\ì“*[ŸLCq¿¶§ó\Ó\ãV ‹<»¯G×“&¹ú’Y\Úd+Š\ÓtÒ”»wÙº‘YQœL?\Ğ\r«²ü¥|M6õQ·O¨>’´\É\ï2mmSLÿ\ëzµ~œ\Åm·ó¡\ß\Ó\ãıu?†³6Ÿª\ÉURg²,¾\ç«\æ†Bù²\Ê\Ö\ÉmÑœ—÷¯²üú¦¡»)¥;Z=\ÆYR¤h<3\ÛQ\ÓKË‚œ\Ò\ß\É&§”óH\é\ä¡ıÿ¾ói»3\Ûw„\ã’=\åŞ£’_Ğ¯²º9Ë•û\é$½­›r\ÓB»\í\Ú!ı¯\n1[Úç‹±\Ã%{HÍ£†º\èsfg-à©§º¶ûÉ¨‹§:¬s›k;WC\çû¹?=_»Ÿ°º\è%<0tòò´‚ó.2m\Z\ÄI“œW\åı„¨¤\'\ë]¢GB,~[\nª²UrLkJ¿»S\á\Ï\ï(ŸR\İ±FŸ7J\Öğ\Æx\Üh[¼ñk¼ñŒ5Ú¼ñ¥š\\—_Ã \í·y\Å,y\ãk\í`9šµ\íp›7‡l\\nó–u²½c \Û{\Ö²©•a˜\Ødû\È\ZA¶O¬dû\Ì\ZA¯s\Öz}a \ÔW\Ö\n}c \Ğk…¾³FP\èÇ¸q	\n]²FP\è\'k…BÅ\Ê,fJ…Š\Ã†(2>– ]\È\0Y‚v!#d	\â…\n‘!…– ^\È\àp@¾P\Ñ1<\ë€~¡\âbßŠ2\"T!\á dŒ	µbP8¨£\ÂA­jÅ¸pP+†‹Z12\\ÔŠ¡\á¢VŒ\rµbp¸¨£\ÃE­.j\ÅøpQ+ˆZE\ìE\á‚V{Sx U\Ä^h1<\Ğ*b,x U\ÄXğ@«ˆ±\àVcÁ­\"Æ‚‡/FÆ‚‡Z1<ÔŠ±\à£VŒµb,ø¨cÁG­>j\ÅXğQ+Æ‚Z1|ÔŠ±\à£VŒµb,¨c!@­j\ÅXP+\ÆB\0ZI\ÆB\0ZI\ÆB\0ZI\ÆB\0ZI\ÆB€;.\ÆB\0ZIÆ‚°@,\É`¨%\r\Â¹$\ÃAX —d<c@cD%cH5cLEcPU\ãT hŒ\n!°™a!jÊ¸5e`\ĞVö×Œ!PS††¨)cCÔ”Á!p\ã/B ¦!póÏ‹\n\ÜşÇ¼¬°Aµ˜6¨3D\îşcÆˆ°Aµ˜C‚[ÿ˜Cbƒj1‡\Ä\ŞgâœŠ¯¡S;«Àh;\èöUpWš·eZW|Ï¼\ß\Ö\ß}¦vŸúJ\rWBm¡¾\"Üº\ÛYZ\Æ\Ú\Ò\Ù\Ğ\ß}½gC`\éÛ‚\ê‰\Û@t_°ÁR\å\ì\r\Äù¥ó¢³\íû¸Y}uÀ	TsÚ…Ó¹7XÀh\ß0“…-\\\Ë\r\Ô\æ\í¡ñB\â½3mÀ\â}o¡¾›¨\âúƒù@şÑ´€Œı\ÔYt*9–EK³ğ|\\¾?ÿ±§ó?öôEK5\Ş\ås½¿ö*\Ë`œ\ßÌ§\Ó–ò\ïÅ²\r§oY–\ã\Ólù~t6]\ÈZ¹|\\ö3U£¤\ï–ø&üy(Ø¸	õ`E;–¥\í\ã;-ŒÀ\"-İ§ùG‹¼a¢q\ë¾Aµ_l4\\£;=J\íwª\ÖF³3²¡¯•ˆ6<š•öûb7ƒƒ\\`E2€Ñ§}8€0Zj°~:À¾?ÃÁ³¦\æ2Z\Äx‚„XÀwk8\Ğ0x\Ö\Ù\Ï</°¼\Ò\0\Ğb¾\ï\å\Ğ \Ğ7Å½\Í+1\Í7Â‚L\ã0Š‡NşÑ!Ù‡‰\é\İß‰t.ûVeca\é\\º¯€ğP§1S\ëƒ!‘sµ¤\àe\È\ãöC#4z_`‘a$yd$y4$ù0÷~ıĞˆtN\ïÑˆŒtltº\î\É\é\ä\Ù\èT\İ1/\Z–\İa\Ì\Ã2;\Ü\Ñ9µ{4,¦ƒÎ–Q_F¶D:[F6:[öw¤Î–}_²_\é\re¿²\í\ï\èù1.i,\\Òˆ©4b*uLG˜J#¦R\Çtô”Si\ÄTê˜2b*˜J\Ó\ÑSFL¥S9¼0ûJ#¦Òˆ©\Ô1õe\ÄT\Z1û·\Ù¯Øˆil\Ä46b\Z1˜\ÆFLc#¦\ê\è¬\Û\Ñ\ÒÜ»­sw†\Õd¤\åv•«#Â¤\èv\Ë\roög`—‹£K*0}\Çs\'T¥\ĞNk}~[d“\æqG\'O«\Û]‘§I“]$\Å-~NVku¼FŸ.wU^Vt`¨¶·ªÛƒ½¨£®§:·ÿ¶C:˜\Úw\ØF\ëw\î’\ë\ì}R]\ç\ÛzR\Ğ¡:{£÷B\ÕÎµ\×tz\ØŞ¥B\áªl\è(­ÿuC\'´m4­ó¬Ë²\é¨	g¾§ÿ\0\0ÿÿ\0PK\0\0\0\0\0!\00b)G\0\0]\0\0\0docProps/core.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Œ’ÁN\Ã0D\ïHüC\ä{\â¸\r-XI*\ê‰JHq³\ìmk;–mHû÷8IRÁ£wf\ßÎ®œ/ªŠ¾À:Y\ë‘$Eh^©wz]/\ã[9Ï´`U­¡@GphQ^_\å\ÜP^[x¶µ\ë%¸(´£\Ühï½¡;¾\Å\\:ˆ\Û\Ú*\æ\Ã\Ó\î°aüƒ\í\0O\Òt†x&˜g¸\Æf ¢Rği>m\Õ\ÇP\í&	Á?^V¹?:e\äT\ÒM\Ø\éw\Ì¼÷Á\ÉÁ\Ø4M\ÒL»!?Áo«§—n\ÕX\êöVP™N¹\æk[2¡¤\Îñ¨\Ò^¯bÎ¯Â¡·\Äı±\ÜÈª’L\åø·X]ô\"\nahı¬l¦\ë%*\')™\Ç\é<dk2£dJ\Óì½|\Ñß†\ë\ê4ÿŸ\Ä;še”ÜŒˆg@\Ù\å¾ü\å7\0\0\0ÿÿ\0PK\0\0\0\0\0!\0\'ì¥‘\0\0\0\0\0docProps/app.xml ¢( \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0œ’Án\Û0†\ïö†îœn(†@VQ¤rØ°\0I{\çd:\Ñ&K‚\Ä\É\ŞfÏ²m£‰³\í\ÔÉŸúõ‰¢º?¶®\è0e|%\æ³R\èM¨­\ßU\âiû\é\æƒ(2¯Á•8a÷ú\íµN!b\"‹¹`Ÿ+±\'Š)³\ÙcyÆ²g¥	©\â4\ídh\Zkğ1˜C‹\ämY\ŞI<ú\Z\ë›x6£ã¢£×š\ÖÁô|ùy{Š¬\ÕCŒ\Î\Z ~¥şbM\n94T|<\ZtJNE\Åt4‡d\é¤K%§©\Úp¸dcİ€Ë¨ä¥ Vı\Ğ\Ö`SÖª£E‡†B*²ı\Éc»\Å7\È\Ø\ãT¢ƒdÁcõmc2\Ä.fJz¾C.j,\Ì\ï_\Î\\P’ûFm§G¦±}¯\çC×½Á\È\Ã\Â5\éÖ’\ÃüµYC¢ÿ€Ï§\àÃˆ}A¯œ\â\r\ç‹ş²^†6‚?±p>[ÿ#?\ÅmxÂ—¡^\Õf	kş‡ó\Ğ\Ïµ\ây&×›,÷\àwX¿ôü+ô+ğ<î¹\ß\Í\Êw%ÿî¤¦\äe£õ\0\0\0ÿÿ\0PK-\0\0\0\0\0\0!\0b\îh^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0µU0#ô\0\0\0L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0—\0\0_rels/.relsPK-\0\0\0\0\0\0!\0>”—ó\0\0\0º\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0¼\0\0xl/_rels/workbook.xml.relsPK-\0\0\0\0\0\0!\0a0?i\0\0\î\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ï\0\0xl/workbook.xmlPK-\0\0\0\0\0\0!\0£ÿe\Ô	\0\0\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0…\0\0xl/sharedStrings.xmlPK-\0\0\0\0\0\0!\0Œğ”Â \0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0À\0\0xl/theme/theme1.xmlPK-\0\0\0\0\0\0!\0	b+\Ø\Í\0\0\Û\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0‘\0\0xl/styles.xmlPK-\0\0\0\0\0\0!\0ş~|±§\0\08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‰\0\0xl/worksheets/sheet1.xmlPK-\0\0\0\0\0\0!\00b)G\0\0]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0f#\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0\'ì¥‘\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ä%\0\0docProps/app.xmlPK\0\0\0\0\n\0\n\0€\0\0«(\0\0\0\0');
/*!40000 ALTER TABLE `documentoadendasretiroproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentoadicionesproyectos`
--

DROP TABLE IF EXISTS `documentoadicionesproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentoadicionesproyectos` (
  `idAdicion` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idAdicion`),
  KEY `documentosadiciones_adiciones_idadicion_idx` (`idAdicion`),
  CONSTRAINT `documentosadiciones_adiciones_idadicion` FOREIGN KEY (`idAdicion`) REFERENCES `adicionesproyectos` (`idAdicion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentoadicionesproyectos`
--

LOCK TABLES `documentoadicionesproyectos` WRITE;
/*!40000 ALTER TABLE `documentoadicionesproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentoadicionesproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentocumplimientoalertasavalproyectos`
--

DROP TABLE IF EXISTS `documentocumplimientoalertasavalproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentocumplimientoalertasavalproyectos` (
  `idcumplimientoalertaavalproyecto` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idcumplimientoalertaavalproyecto`),
  CONSTRAINT `documentocumplimientoalertas_cumplimientoalertas_idcumplimiento` FOREIGN KEY (`idcumplimientoalertaavalproyecto`) REFERENCES `cumplimientoalertasavalproyectos` (`idcumplimientoalertaavalproyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentocumplimientoalertasavalproyectos`
--

LOCK TABLES `documentocumplimientoalertasavalproyectos` WRITE;
/*!40000 ALTER TABLE `documentocumplimientoalertasavalproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentocumplimientoalertasavalproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentocumplimientocompromisosproyectos`
--

DROP TABLE IF EXISTS `documentocumplimientocompromisosproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentocumplimientocompromisosproyectos` (
  `idcumplimientocompromisoproyecto` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idcumplimientocompromisoproyecto`),
  CONSTRAINT `documentocumplimientocompromiso_idcumplimientocompromiso` FOREIGN KEY (`idcumplimientocompromisoproyecto`) REFERENCES `cumplimientocompromisosproyectos` (`idcumplimientocompromisoproyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentocumplimientocompromisosproyectos`
--

LOCK TABLES `documentocumplimientocompromisosproyectos` WRITE;
/*!40000 ALTER TABLE `documentocumplimientocompromisosproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentocumplimientocompromisosproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentoplazosproyectos`
--

DROP TABLE IF EXISTS `documentoplazosproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentoplazosproyectos` (
  `idPlazo` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idPlazo`),
  KEY `documentosplazos_plazos_idPlazo_idx` (`idPlazo`),
  CONSTRAINT `documentosplazos_plazos_idPlazo` FOREIGN KEY (`idPlazo`) REFERENCES `plazosproyectos` (`idPlazo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentoplazosproyectos`
--

LOCK TABLES `documentoplazosproyectos` WRITE;
/*!40000 ALTER TABLE `documentoplazosproyectos` DISABLE KEYS */;
INSERT INTO `documentoplazosproyectos` VALUES (1,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\â\ã\Ï\Ó\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nxœ­–¿n\Û0\Æw>Å\éP™ÿ)ulĞ´\ÈĞ¦€EF¢’˜\Ò6Šú;\çJ:±\ã1m€‚aK0	ş\îûx<\Ş/ô¾FL‚\ê}¨\ÑWD\á2şK\0‡OüU…z@³C=Ggo\ê»8÷y\n†f@¸(aûõ\"\\€’!ğ–bğ\Í÷&ª*\Ê…¬v\0x3%¬qvmº•¬—ZW\Şı1\Í\Ò-\à\Şyh]LŒC÷JD?~†g»Qôbd/\ÊAaUPò¿\È\ç\Îÿ¶«^¿\ËÄ`Aš£HUò’²\\=¬:ú\ì†or1~Ì¸\ï¶\ï­\à‹_\Úõ‰´\ßa\Ò\å\Ó\Z\ß>\î\Æ(\ÈJ$ª\í{®O·^*œˆT¨\\\ÓHY¥’è¡µ›\"‰$§	¦3¬f“\\Eq{¥\"	Ô•ñFO¬\é­\Ùù\\\ë\Â1O;waš[\rv´\Õı‡CrRTqŒL´Q÷Pô€²¹uo×º±\ã$yHRÛ–]Å‚$•}Ÿœ\×\á\Z\èu¶\ÆY`‰‚Ëƒ\åaŠ-\"<AxT3_¯\Ã=—W+1Z>\Õ\Ê\íûÉµ2\\ØªL\Ø^»¥\î\ávg~¼•—^\ß\è»ü\ZÚ€“ÙVMA/\ä\Ñ\0\î½ó\Şuz1…`!óz½vÙ°Ø‰¥X\çn\Â»ˆÍ•\Û\Øs™|‰\nc‰2¸\rDo:\İ\æ‹%•L§Rny\â¬LrKFT R\Í.ğ\Æ’ˆ6‰\"_ED„\ËGü”½¼`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n'),(2,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\â\ã\Ï\Ó\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nxœ­–¿n\Û0\Æw>Å\éP™ÿ)ulĞ´\ÈĞ¦€EF¢’˜\Ò6Šú;\çJ:±\ã1m€‚aK0	ş\îûx<\Ş/ô¾FL‚\ê}¨\ÑWD\á2şK\0‡OüU…z@³C=Ggo\ê»8÷y\n†f@¸(aûõ\"\\€’!ğ–bğ\Í÷&ª*\Ê…¬v\0x3%¬qvmº•¬—ZW\Şı1\Í\Ò-\à\Şyh]LŒC÷JD?~†g»Qôbd/\ÊAaUPò¿\È\ç\Îÿ¶«^¿\ËÄ`Aš£HUò’²\\=¬:ú\ì†or1~Ì¸\ï¶\ï­\à‹_\Úõ‰´\ßa\Ò\å\Ó\Z\ß>\î\Æ(\ÈJ$ª\í{®O·^*œˆT¨\\\ÓHY¥’è¡µ›\"‰$§	¦3¬f“\\Eq{¥\"	Ô•ñFO¬\é­\Ùù\\\ë\Â1O;waš[\rv´\Õı‡CrRTqŒL´Q÷Pô€²¹uo×º±\ã$yHRÛ–]Å‚$•}Ÿœ\×\á\Z\èu¶\ÆY`‰‚Ëƒ\åaŠ-\"<AxT3_¯\Ã=—W+1Z>\Õ\Ê\íûÉµ2\\ØªL\Ø^»¥\î\ávg~¼•—^\ß\è»ü\ZÚ€“ÙVMA/\ä\Ñ\0\î½ó\Şuz1…`!óz½vÙ°Ø‰¥X\çn\Â»ˆÍ•\Û\Øs™|‰\nc‰2¸\rDo:\İ\æ‹%•L§Rny\â¬LrKFT R\Í.ğ\Æ’ˆ6‰\"_ED„\ËGü”½¼`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n');
/*!40000 ALTER TABLE `documentoplazosproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentoprorrogasproyectos`
--

DROP TABLE IF EXISTS `documentoprorrogasproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentoprorrogasproyectos` (
  `idProrroga` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idProrroga`),
  KEY `documentosprorrogas_prorrogas_idprorroga_idx` (`idProrroga`),
  CONSTRAINT `documentosprorrogas_prorrogas_idprorroga` FOREIGN KEY (`idProrroga`) REFERENCES `prorrogasproyectos` (`idProrroga`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentoprorrogasproyectos`
--

LOCK TABLES `documentoprorrogasproyectos` WRITE;
/*!40000 ALTER TABLE `documentoprorrogasproyectos` DISABLE KEYS */;
INSERT INTO `documentoprorrogasproyectos` VALUES (1,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\â\ã\Ï\Ó\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nxœ­–¿n\Û0\Æw>Å\éP™ÿ)ulĞ´\ÈĞ¦€EF¢’˜\Ò6Šú;\çJ:±\ã1m€‚aK0	ş\îûx<\Ş/ô¾FL‚\ê}¨\ÑWD\á2şK\0‡OüU…z@³C=Ggo\ê»8÷y\n†f@¸(aûõ\"\\€’!ğ–bğ\Í÷&ª*\Ê…¬v\0x3%¬qvmº•¬—ZW\Şı1\Í\Ò-\à\Şyh]LŒC÷JD?~†g»Qôbd/\ÊAaUPò¿\È\ç\Îÿ¶«^¿\ËÄ`Aš£HUò’²\\=¬:ú\ì†or1~Ì¸\ï¶\ï­\à‹_\Úõ‰´\ßa\Ò\å\Ó\Z\ß>\î\Æ(\ÈJ$ª\í{®O·^*œˆT¨\\\ÓHY¥’è¡µ›\"‰$§	¦3¬f“\\Eq{¥\"	Ô•ñFO¬\é­\Ùù\\\ë\Â1O;waš[\rv´\Õı‡CrRTqŒL´Q÷Pô€²¹uo×º±\ã$yHRÛ–]Å‚$•}Ÿœ\×\á\Z\èu¶\ÆY`‰‚Ëƒ\åaŠ-\"<AxT3_¯\Ã=—W+1Z>\Õ\Ê\íûÉµ2\\ØªL\Ø^»¥\î\ávg~¼•—^\ß\è»ü\ZÚ€“ÙVMA/\ä\Ñ\0\î½ó\Şuz1…`!óz½vÙ°Ø‰¥X\çn\Â»ˆÍ•\Û\Øs™|‰\nc‰2¸\rDo:\İ\æ‹%•L§Rny\â¬LrKFT R\Í.ğ\Æ’ˆ6‰\"_ED„\ËGü”½¼`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n'),(2,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\â\ã\Ï\Ó\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nxœ­–¿n\Û0\Æw>Å\éP™ÿ)ulĞ´\ÈĞ¦€EF¢’˜\Ò6Šú;\çJ:±\ã1m€‚aK0	ş\îûx<\Ş/ô¾FL‚\ê}¨\ÑWD\á2şK\0‡OüU…z@³C=Ggo\ê»8÷y\n†f@¸(aûõ\"\\€’!ğ–bğ\Í÷&ª*\Ê…¬v\0x3%¬qvmº•¬—ZW\Şı1\Í\Ò-\à\Şyh]LŒC÷JD?~†g»Qôbd/\ÊAaUPò¿\È\ç\Îÿ¶«^¿\ËÄ`Aš£HUò’²\\=¬:ú\ì†or1~Ì¸\ï¶\ï­\à‹_\Úõ‰´\ßa\Ò\å\Ó\Z\ß>\î\Æ(\ÈJ$ª\í{®O·^*œˆT¨\\\ÓHY¥’è¡µ›\"‰$§	¦3¬f“\\Eq{¥\"	Ô•ñFO¬\é­\Ùù\\\ë\Â1O;waš[\rv´\Õı‡CrRTqŒL´Q÷Pô€²¹uo×º±\ã$yHRÛ–]Å‚$•}Ÿœ\×\á\Z\èu¶\ÆY`‰‚Ëƒ\åaŠ-\"<AxT3_¯\Ã=—W+1Z>\Õ\Ê\íûÉµ2\\ØªL\Ø^»¥\î\ávg~¼•—^\ß\è»ü\ZÚ€“ÙVMA/\ä\Ñ\0\î½ó\Şuz1…`!óz½vÙ°Ø‰¥X\çn\Â»ˆÍ•\Û\Øs™|‰\nc‰2¸\rDo:\İ\æ‹%•L§Rny\â¬LrKFT R\Í.ğ\Æ’ˆ6‰\"_ED„\ËGü”½¼`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n'),(3,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\â\ã\Ï\Ó\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nxœ­–¿n\Û0\Æw>Å\éP™ÿ)ulĞ´\ÈĞ¦€EF¢’˜\Ò6Šú;\çJ:±\ã1m€‚aK0	ş\îûx<\Ş/ô¾FL‚\ê}¨\ÑWD\á2şK\0‡OüU…z@³C=Ggo\ê»8÷y\n†f@¸(aûõ\"\\€’!ğ–bğ\Í÷&ª*\Ê…¬v\0x3%¬qvmº•¬—ZW\Şı1\Í\Ò-\à\Şyh]LŒC÷JD?~†g»Qôbd/\ÊAaUPò¿\È\ç\Îÿ¶«^¿\ËÄ`Aš£HUò’²\\=¬:ú\ì†or1~Ì¸\ï¶\ï­\à‹_\Úõ‰´\ßa\Ò\å\Ó\Z\ß>\î\Æ(\ÈJ$ª\í{®O·^*œˆT¨\\\ÓHY¥’è¡µ›\"‰$§	¦3¬f“\\Eq{¥\"	Ô•ñFO¬\é­\Ùù\\\ë\Â1O;waš[\rv´\Õı‡CrRTqŒL´Q÷Pô€²¹uo×º±\ã$yHRÛ–]Å‚$•}Ÿœ\×\á\Z\èu¶\ÆY`‰‚Ëƒ\åaŠ-\"<AxT3_¯\Ã=—W+1Z>\Õ\Ê\íûÉµ2\\ØªL\Ø^»¥\î\ávg~¼•—^\ß\è»ü\ZÚ€“ÙVMA/\ä\Ñ\0\î½ó\Şuz1…`!óz½vÙ°Ø‰¥X\çn\Â»ˆÍ•\Û\Øs™|‰\nc‰2¸\rDo:\İ\æ‹%•L§Rny\â¬LrKFT R\Í.ğ\Æ’ˆ6‰\"_ED„\ËGü”½¼`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n'),(4,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\â\ã\Ï\Ó\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nxœ­–¿n\Û0\Æw>Å\éP™ÿ)ulĞ´\ÈĞ¦€EF¢’˜\Ò6Šú;\çJ:±\ã1m€‚aK0	ş\îûx<\Ş/ô¾FL‚\ê}¨\ÑWD\á2şK\0‡OüU…z@³C=Ggo\ê»8÷y\n†f@¸(aûõ\"\\€’!ğ–bğ\Í÷&ª*\Ê…¬v\0x3%¬qvmº•¬—ZW\Şı1\Í\Ò-\à\Şyh]LŒC÷JD?~†g»Qôbd/\ÊAaUPò¿\È\ç\Îÿ¶«^¿\ËÄ`Aš£HUò’²\\=¬:ú\ì†or1~Ì¸\ï¶\ï­\à‹_\Úõ‰´\ßa\Ò\å\Ó\Z\ß>\î\Æ(\ÈJ$ª\í{®O·^*œˆT¨\\\ÓHY¥’è¡µ›\"‰$§	¦3¬f“\\Eq{¥\"	Ô•ñFO¬\é­\Ùù\\\ë\Â1O;waš[\rv´\Õı‡CrRTqŒL´Q÷Pô€²¹uo×º±\ã$yHRÛ–]Å‚$•}Ÿœ\×\á\Z\èu¶\ÆY`‰‚Ëƒ\åaŠ-\"<AxT3_¯\Ã=—W+1Z>\Õ\Ê\íûÉµ2\\ØªL\Ø^»¥\î\ávg~¼•—^\ß\è»ü\ZÚ€“ÙVMA/\ä\Ñ\0\î½ó\Şuz1…`!óz½vÙ°Ø‰¥X\çn\Â»ˆÍ•\Û\Øs™|‰\nc‰2¸\rDo:\İ\æ‹%•L§Rny\â¬LrKFT R\Í.ğ\Æ’ˆ6‰\"_ED„\ËGü”½¼`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n');
/*!40000 ALTER TABLE `documentoprorrogasproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfoquesmetodologicos`
--

DROP TABLE IF EXISTS `enfoquesmetodologicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfoquesmetodologicos` (
  `idEnfoqueMetodologico` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idEnfoqueMetodologico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfoquesmetodologicos`
--

LOCK TABLES `enfoquesmetodologicos` WRITE;
/*!40000 ALTER TABLE `enfoquesmetodologicos` DISABLE KEYS */;
INSERT INTO `enfoquesmetodologicos` VALUES (1,'Cualitativo'),(2,'Cuantitativo'),(3,'Mixto');
/*!40000 ALTER TABLE `enfoquesmetodologicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidadesinternacionalesproyectos`
--

DROP TABLE IF EXISTS `entidadesinternacionalesproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidadesinternacionalesproyectos` (
  `idEntidadInternacionalProyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idEntidadInternacionalProyecto`),
  KEY `entidadesinternacionalesproyectos_idproyecto_proyectos_idx` (`idProyecto`),
  CONSTRAINT `entidadesinternacionalesproyectos_idproyecto_proyectos` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidadesinternacionalesproyectos`
--

LOCK TABLES `entidadesinternacionalesproyectos` WRITE;
/*!40000 ALTER TABLE `entidadesinternacionalesproyectos` DISABLE KEYS */;
INSERT INTO `entidadesinternacionalesproyectos` VALUES (2,18,'CAFAM'),(3,18,'OTRA'),(7,25,'BRASIL MEDICAL');
/*!40000 ALTER TABLE `entidadesinternacionalesproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadosproyecto`
--

DROP TABLE IF EXISTS `estadosproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadosproyecto` (
  `idEstadoProyecto` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idEstadoProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosproyecto`
--

LOCK TABLES `estadosproyecto` WRITE;
/*!40000 ALTER TABLE `estadosproyecto` DISABLE KEYS */;
INSERT INTO `estadosproyecto` VALUES (1,'EjecuciÃ³n'),(2,'Finalizado'),(3,'Atrasado'),(4,'Cancelado'),(5,'Trasladado');
/*!40000 ALTER TABLE `estadosproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes` (
  `idEstudiante` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTipoIdentificacion` int(11) NOT NULL,
  `nombres` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `idTipoEstudiante` int(11) NOT NULL,
  `numeroIdentificacion` bigint(20) NOT NULL,
  `correoElectronico` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `contacto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  UNIQUE KEY `numeroIdentificacion_UNIQUE` (`numeroIdentificacion`,`idTipoIdentificacion`),
  KEY `estudiantes_tiposestudiantes_idtipoidentificacion_idx` (`idTipoIdentificacion`),
  KEY `estudiantes_tiposestudiantes_idtipoestudiante_idx` (`idTipoEstudiante`),
  CONSTRAINT `estudiantes_tiposestudiantes_idtipoestudiante` FOREIGN KEY (`idTipoEstudiante`) REFERENCES `tiposestudiantes` (`idTipoEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estudiantes_tiposidentificacion_idtipoidentificacion` FOREIGN KEY (`idTipoIdentificacion`) REFERENCES `tiposidentificacion` (`idTipoIdentificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,1,'WILLIAM','ORTIZ',3,71984823,'WORTIZ@GMAIL.COM','PEDRO'),(5,1,'CAROLINA','ZAPATA',1,1000456789,'carolina@hotmail.com','ANDR?S');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantesproyectos`
--

DROP TABLE IF EXISTS `estudiantesproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantesproyectos` (
  `idEstudiante` bigint(20) NOT NULL,
  `idProyecto` bigint(20) NOT NULL,
  `idPrograma` int(11) NOT NULL,
  `idRol` int(11) NOT NULL,
  `porcentajePropiedadIntelectual` decimal(18,2) NOT NULL,
  `horasSemana` int(11) NOT NULL,
  `mesesDedicados` int(11) NOT NULL,
  `semestre` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`,`idProyecto`),
  KEY `estudiantesproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `estudiantesproyectos_idprograma_idx` (`idPrograma`),
  KEY `estudiantesproyectos_roles_idrol_idx` (`idRol`),
  CONSTRAINT `estudiantesproyectos_estudiantes_idestudiante` FOREIGN KEY (`idEstudiante`) REFERENCES `estudiantes` (`idEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estudiantesproyectos_idprograma` FOREIGN KEY (`idPrograma`) REFERENCES `programas` (`idPrograma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estudiantesproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estudiantesproyectos_roles_idrol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantesproyectos`
--

LOCK TABLES `estudiantesproyectos` WRITE;
/*!40000 ALTER TABLE `estudiantesproyectos` DISABLE KEYS */;
INSERT INTO `estudiantesproyectos` VALUES (1,17,20,6,1.00,2,3,4),(1,25,8,6,1.00,2,3,4),(5,25,18,6,2.00,3,4,4);
/*!40000 ALTER TABLE `estudiantesproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultades`
--

DROP TABLE IF EXISTS `facultades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultades` (
  `idfacultad` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idfacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultades`
--

LOCK TABLES `facultades` WRITE;
/*!40000 ALTER TABLE `facultades` DISABLE KEYS */;
INSERT INTO `facultades` VALUES (1,'Facultad de Artes'),(2,'Facultad de Ciencias Agrarias'),(3,'Facultad de Ciencias EconÃ³micas'),(4,'Facultad de Ciencias Exactas y Naturales'),(5,'Facultad de Ciencias Sociales y Humanas'),(6,'Facultad de Comunicaciones'),(7,'Facultad de Derecho y Ciencias PolÃ­ticas'),(8,'Facultad de EducaciÃ³n'),(9,'Facultad de EnfermerÃ­a'),(10,'Facultad de IngenierÃ­a'),(11,'Facultad de Medicina'),(12,'Facultad Nacional de Salud PÃºblica'),(13,'Facultad de OdontologÃ­a'),(14,'Ciencias FarmacÃ©uticas y Alimentarias'),(15,'Escuela de Â Idiomas'),(16,'Escuela de Â Interamericana de BibliotecologÃ­a'),(17,'Escuela de MicroBiologÃ­a'),(18,'Escuela de Â NutriciÃ³n y DietÃ©tica'),(19,'Instituto de FilosofÃ­a'),(20,'Insituto Universitario de EducaciÃ³n Fisica'),(21,'Instituto de Estudios Politicos'),(22,'Instituto de Estudios Regionales'),(23,'CorporaciÃ³n Ambiental'),(24,'CorporaciÃ³n de Ciencias Basicas BiomÃ©dicas'),(25,'CorporaciÃ³n de PatologÃ­as Tropicales');
/*!40000 ALTER TABLE `facultades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuentesfinanciacion`
--

DROP TABLE IF EXISTS `fuentesfinanciacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuentesfinanciacion` (
  `idFuenteFinanciacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `correoElectronico` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contacto` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idTipoFuenteFinanciacion` int(11) NOT NULL,
  `idOrigenFuente` int(11) NOT NULL,
  `idNaturaleza` int(11) DEFAULT NULL,
  `idTipoEntidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFuenteFinanciacion`),
  KEY `fuentesfinanciacion_origenesfuente_idorigenfuente_idx` (`idOrigenFuente`),
  KEY `fuentesfinanciacion_natualezasfuente_idnaturaleza_idx` (`idNaturaleza`),
  KEY `fuentesfinanciacion_tiposentidad_idtipoentidad_idx` (`idTipoEntidad`),
  KEY `fuentesfinanciacion_tiposfuente_idtipofuentefinanciacion_idx` (`idTipoFuenteFinanciacion`),
  CONSTRAINT `fuentesfinanciacion_natualezasfuente_idnaturaleza` FOREIGN KEY (`idNaturaleza`) REFERENCES `naturalezasfuente` (`idNaturalezaFuente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fuentesfinanciacion_origenesfuente_idorigenfuente` FOREIGN KEY (`idOrigenFuente`) REFERENCES `origenesfuente` (`idOrigenFuente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fuentesfinanciacion_tiposentidad_idtipoentidad` FOREIGN KEY (`idTipoEntidad`) REFERENCES `tiposentidad` (`idTipoEntidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fuentesfinanciacion_tiposfuente_idtipofuente` FOREIGN KEY (`idTipoFuenteFinanciacion`) REFERENCES `tiposfuentefinanciacion` (`idTipoFuenteFinanciacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuentesfinanciacion`
--

LOCK TABLES `fuentesfinanciacion` WRITE;
/*!40000 ALTER TABLE `fuentesfinanciacion` DISABLE KEYS */;
INSERT INTO `fuentesfinanciacion` VALUES (1,'Alcaldia de Envigado',NULL,NULL,1,2,1,4),(2,'Alcaldia de Itagui',NULL,NULL,1,2,1,4),(3,'AlcaldÃ­a de MedellÃ­n - Metroseguridad',NULL,NULL,1,2,1,4),(4,'Alta Consejeria para la ReconciliaciÃ³n - Presidenc',NULL,NULL,1,2,NULL,NULL),(5,'Ãrea Metropolitana del Valle de AburrÃ¡',NULL,NULL,1,2,NULL,4),(6,'AsociaciÃ³n Colombiana de Aviadores \"ACDAC\"',NULL,NULL,1,2,NULL,NULL),(7,'Centro Internacional para el Desarrollo de Investi',NULL,NULL,1,2,NULL,NULL),(8,'CODI',NULL,NULL,1,2,NULL,NULL),(9,'COLCIENCIAS',NULL,NULL,1,2,NULL,6),(10,'CorporaciÃ³n Fondo de PrevenciÃ³n Vial',NULL,NULL,1,2,NULL,NULL),(11,'CorporaciÃ³n Parque Explora',NULL,NULL,1,2,NULL,NULL),(12,'CorporaciÃ³n Surgir',NULL,NULL,1,2,NULL,NULL),(13,'Departamento de Antioquia- Gerencia de Seguridad A',NULL,NULL,1,2,NULL,NULL),(14,'Departamento de Antioquia-Secretaria Seccional de',NULL,NULL,1,2,NULL,NULL),(15,'ESE Metrosalud',NULL,NULL,1,2,NULL,4),(16,'Fondo de Apoyo a los Trabajos de Pregrado',NULL,NULL,1,2,NULL,1),(17,'Fondo InvestigaciÃ³n Docente',NULL,NULL,1,2,NULL,1),(18,'Fondo InvestigaciÃ³n Docente y ExtensiÃ³n',NULL,NULL,1,2,NULL,1),(19,'Gobernacion de Antioquia',NULL,NULL,1,2,NULL,NULL),(20,'INDER',NULL,NULL,1,2,NULL,NULL),(21,'Instituto Colombiano de Bienestar Familiar - ICBF',NULL,NULL,1,2,NULL,NULL),(22,'Instituto de Medicina Legal',NULL,NULL,1,2,NULL,NULL),(23,'IPS Universitaria',NULL,NULL,1,2,NULL,NULL),(24,'Ministerio de la ProtecciÃ³n Social',NULL,NULL,1,2,NULL,7),(25,'Municipio de El Carmen de Viboral',NULL,NULL,1,2,NULL,4),(26,'National Association of Chronic Disease Directors',NULL,NULL,1,2,2,NULL),(27,'National Center for Rural Health Professions (NCRH',NULL,NULL,1,2,2,NULL),(28,'OrganizaciÃ³n de Estados Americanos OEA',NULL,NULL,1,2,2,NULL),(29,'OrganizaciÃ³n Panamericana de la Salud - OPS',NULL,NULL,1,2,2,NULL),(30,'SecretarÃ­a de Gobierno del Municipio de MedellÃ­n',NULL,NULL,1,2,NULL,4),(31,'Secretaria de Salud de MedellÃ­n',NULL,NULL,1,2,NULL,4),(32,'Sostenibilidad Interna grupos',NULL,NULL,1,2,NULL,1),(33,'UBS Optimus Foundation',NULL,NULL,1,2,2,NULL),(34,'UdeA Especie',NULL,NULL,1,2,NULL,1),(35,'Universidad de Dalhouise',NULL,NULL,1,2,2,NULL),(36,'Universidad de Illinois',NULL,NULL,1,2,2,NULL),(37,'Universidad de Manitoba',NULL,NULL,1,2,2,NULL),(38,'Universidad de Michigan',NULL,NULL,1,2,2,NULL),(39,'VicerectorÃ­a de Docencia',NULL,NULL,1,2,NULL,1);
/*!40000 ALTER TABLE `fuentesfinanciacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuentesfinanciacionproyectos`
--

DROP TABLE IF EXISTS `fuentesfinanciacionproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuentesfinanciacionproyectos` (
  `idfuentefinanciacionproyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `idFuenteFinanciacion` int(11) NOT NULL,
  `idTipoFuenteFinanciacionProyecto` int(11) NOT NULL,
  `montoFrescos` bigint(20) NOT NULL,
  `montoEspecies` bigint(20) NOT NULL,
  PRIMARY KEY (`idfuentefinanciacionproyecto`),
  KEY `fuentesfinanciacionproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `fuentesfinproy_fuentesfinanciaron_idfuentefinanciacion_idx` (`idFuenteFinanciacion`),
  KEY `fuentesfinanciacionproyectos_tiposfuenteproyecto_idx` (`idTipoFuenteFinanciacionProyecto`),
  CONSTRAINT `fuentesfinanciacionproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fuentesfinproy_fuentesfinanciaron_idfuentefinanciacion` FOREIGN KEY (`idFuenteFinanciacion`) REFERENCES `fuentesfinanciacion` (`idFuenteFinanciacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fuentesfinproy_tiposfuentefinpro_idtipofuentefinproy` FOREIGN KEY (`idTipoFuenteFinanciacionProyecto`) REFERENCES `tiposfuentefinanciacionproyecto` (`idTipoFuenteFinanciacionProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuentesfinanciacionproyectos`
--

LOCK TABLES `fuentesfinanciacionproyectos` WRITE;
/*!40000 ALTER TABLE `fuentesfinanciacionproyectos` DISABLE KEYS */;
INSERT INTO `fuentesfinanciacionproyectos` VALUES (53,18,13,1,4500000000,776767677),(54,25,3,1,2333333333,333333333),(55,25,13,2,16789,76543),(56,17,3,1,120000,66666666);
/*!40000 ALTER TABLE `fuentesfinanciacionproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gruposinvestigacion`
--

DROP TABLE IF EXISTS `gruposinvestigacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gruposinvestigacion` (
  `idGrupoInvestigacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idGrupoInvestigacion`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gruposinvestigacion`
--

LOCK TABLES `gruposinvestigacion` WRITE;
/*!40000 ALTER TABLE `gruposinvestigacion` DISABLE KEYS */;
INSERT INTO `gruposinvestigacion` VALUES (1,'Aplicaciones EstadÃ­sticas y Salud PÃºblica'),(2,'DemografÃ­a y salud'),(3,'Didactica'),(4,'EpidemiologÃ­a'),(5,'GestiÃ³n y polÃ­ticas de salud'),(6,'Grupo de investigaciÃ³n en gÃ©nero, subjetividad y sociedad- Instituto de Estudios regionales INER- UdeA.'),(7,'Grupo Investigador de Problemas en Enfermedades Infecciosas - GRIPE'),(8,'HistorÃ­a de la salud'),(9,'MicrobiologÃ­a BÃ¡sica y Aplicada MICROBA'),(10,'PromociÃ³n de la Salud- Enfermeria'),(11,'Salud mental'),(12,'Salud ocupacional'),(13,'Salud y sociedad'),(14,'Seguridad Â y salud en el trabajo'),(15,'Sistemas de informacion en salud'),(16,'Salud y Ambiente'),(17,'Antropologia Medica Critica');
/*!40000 ALTER TABLE `gruposinvestigacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gruposinvestigacionproyectos`
--

DROP TABLE IF EXISTS `gruposinvestigacionproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gruposinvestigacionproyectos` (
  `idGrupoInvestigacion` int(11) NOT NULL,
  `idProyecto` bigint(20) NOT NULL,
  `principal` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idGrupoInvestigacion`,`idProyecto`),
  KEY `gruposinvestigacionproyectos_proyectos_idproyecto` (`idProyecto`),
  CONSTRAINT `gruposinvestigacionproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gruposinvestigacionproyectos`
--

LOCK TABLES `gruposinvestigacionproyectos` WRITE;
/*!40000 ALTER TABLE `gruposinvestigacionproyectos` DISABLE KEYS */;
INSERT INTO `gruposinvestigacionproyectos` VALUES (1,2,1),(1,4,1),(1,5,1),(1,8,1),(1,17,0),(1,25,1),(1,26,1),(2,25,0),(3,25,0),(4,25,0),(5,25,0),(6,18,0),(6,25,0),(7,18,0),(9,18,1),(10,18,0),(11,18,0),(12,18,0),(17,17,1);
/*!40000 ALTER TABLE `gruposinvestigacionproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `naturalezasfuente`
--

DROP TABLE IF EXISTS `naturalezasfuente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `naturalezasfuente` (
  `idNaturalezaFuente` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idNaturalezaFuente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `naturalezasfuente`
--

LOCK TABLES `naturalezasfuente` WRITE;
/*!40000 ALTER TABLE `naturalezasfuente` DISABLE KEYS */;
INSERT INTO `naturalezasfuente` VALUES (1,'PÃºblica'),(2,'Privada');
/*!40000 ALTER TABLE `naturalezasfuente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacionesvencimientoplazo`
--

DROP TABLE IF EXISTS `notificacionesvencimientoplazo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacionesvencimientoplazo` (
  `idnotificacionvencimientoplazo` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTipoPersona` int(11) NOT NULL,
  `idPersona` bigint(20) NOT NULL,
  `idProyecto` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`idnotificacionvencimientoplazo`),
  KEY `notificacionesvencimientoplazo_idtipopersona_tipospersona_idx` (`idTipoPersona`),
  KEY `notificacionesvencimientoplazo_idproyecto_proyectos_idx` (`idProyecto`),
  CONSTRAINT `notificacionesvencimientoplazo_idproyecto_proyectos` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `notificacionesvencimientoplazo_idtipopersona_tipospersona` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipospersona` (`idTipoPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacionesvencimientoplazo`
--

LOCK TABLES `notificacionesvencimientoplazo` WRITE;
/*!40000 ALTER TABLE `notificacionesvencimientoplazo` DISABLE KEYS */;
INSERT INTO `notificacionesvencimientoplazo` VALUES (1,1,3,25,'2017-08-18 16:00:33'),(2,1,3,25,'2017-08-18 16:00:34');
/*!40000 ALTER TABLE `notificacionesvencimientoplazo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetivosespecificos`
--

DROP TABLE IF EXISTS `objetivosespecificos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetivosespecificos` (
  `idObjetivoEspecifico` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idObjetivoEspecifico`),
  KEY `objetivosespecificos_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `objetivosespecificos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetivosespecificos`
--

LOCK TABLES `objetivosespecificos` WRITE;
/*!40000 ALTER TABLE `objetivosespecificos` DISABLE KEYS */;
INSERT INTO `objetivosespecificos` VALUES (1,8,'Apoyar el diseÃ±o de los menu'),(2,8,'Crear una medologÃ­a'),(8,15,'Objetivo 1'),(9,16,'Pruebas'),(14,17,'Pruebas'),(15,17,'GuÃ­Â­a de la informaciÃ³n'),(19,25,'DESARROLLAR PLATAFORMA CON TECNOLOGÃAS DE PUNTA');
/*!40000 ALTER TABLE `objetivosespecificos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcionesmenu`
--

DROP TABLE IF EXISTS `opcionesmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcionesmenu` (
  `idopcionmenu` int(11) unsigned NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci DEFAULT '',
  `nivel` int(2) unsigned DEFAULT NULL,
  `idpadre` int(11) unsigned DEFAULT NULL,
  `orden` int(4) unsigned DEFAULT NULL,
  `css` varchar(100) COLLATE utf8_spanish_ci DEFAULT '',
  `url` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idopcionmenu`),
  KEY `opcionesmenu_opcionesmenu_idpadre_idx` (`idpadre`),
  CONSTRAINT `opcionesmenu_opcionesmenu_idpadre` FOREIGN KEY (`idpadre`) REFERENCES `opcionesmenu` (`idopcionmenu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcionesmenu`
--

LOCK TABLES `opcionesmenu` WRITE;
/*!40000 ALTER TABLE `opcionesmenu` DISABLE KEYS */;
INSERT INTO `opcionesmenu` VALUES (2,'Proyectos',1,NULL,2,'fa fa-ticket fa-fw',NULL,1),(3,'Novedades',1,NULL,3,'fa fa-ticket fa-fw',NULL,1),(4,'Registrar',2,2,1,NULL,'/proyectos/crear',1),(5,'Consultar',2,2,2,NULL,'/proyectos/proyectos',1),(6,'Proyectos',2,3,1,NULL,'/novedades/proyectos',1),(7,'Reportes',1,NULL,4,'glyphicon glyphicon-list-alt',NULL,1),(8,'Integrantes por proyectos',2,7,1,NULL,'/reportes/integrantesProyectos',1),(10,'Proyectos por grupo de investigaciÃ³n',2,7,3,NULL,'/reportes/proyectosPorGrupoInvestigacion',1),(11,'Fuente de financiaciÃ³n por proyecto',2,7,4,NULL,'/reportes/fuentesFinanciacionProyectos',1),(12,'Proyectos en ejecuciÃ³n y atrasados por docente',2,7,5,NULL,'/reportes/proyectosEjecucionAtrasadosProfesor',1),(13,'Proyectos por docente',2,7,6,NULL,'/reportes/proyectosProfesor',1),(14,'Seguimiento de proyectos por docente',2,7,7,NULL,'/reportes/seguimientoProyectosProfesor',1),(15,'InscripciÃ³n de proyectos',2,7,9,NULL,'/reportes/proyectosInscritos',1),(16,'Administrar',1,NULL,6,'fa fa-dashboard fa-fw',NULL,1),(17,'Crear usuario',2,16,1,NULL,'/usuarios/crear',1),(18,'Usuarios',2,16,2,NULL,'/usuarios/usuarios',1),(19,'Privilegios',2,16,4,NULL,'/privilegios/privilegios',1),(20,'Crear privilegio',2,16,3,NULL,'/privilegios/crear',1),(21,'Editar Proyecto',2,2,3,'','/proyectos/editar',0),(22,'Editar Novedades',2,3,3,'','/novedades/editar',0),(23,'Editar Privilegios Usuario',2,16,4,'','/usuarios/privilegios',0),(24,'Editar Privilegio',2,16,5,'','/privilegios/editar',0),(25,'Certificados',2,27,1,'','/reportes/certificados',1),(26,'Seguimiento de Proyecto',2,7,8,'','/reportes/seguimientoProyecto',1),(27,'Constancias',1,NULL,5,'glyphicon glyphicon-check',NULL,1);
/*!40000 ALTER TABLE `opcionesmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcionesmenuprivilegios`
--

DROP TABLE IF EXISTS `opcionesmenuprivilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcionesmenuprivilegios` (
  `idprivilegio` int(11) NOT NULL,
  `idopcionmenu` int(11) unsigned NOT NULL,
  PRIMARY KEY (`idprivilegio`,`idopcionmenu`),
  KEY `opcionesmenuprivilegios_idprivilegio_idx` (`idprivilegio`),
  KEY `opcionesmenuprivilegios_opcionesmenu_idopcionmenu_idx` (`idopcionmenu`),
  CONSTRAINT `menuprivilegios_privilegios_idprivilegio` FOREIGN KEY (`idprivilegio`) REFERENCES `privilegios` (`idPrivilegio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcionesmenuprivilegios`
--

LOCK TABLES `opcionesmenuprivilegios` WRITE;
/*!40000 ALTER TABLE `opcionesmenuprivilegios` DISABLE KEYS */;
INSERT INTO `opcionesmenuprivilegios` VALUES (3,4),(3,5),(3,6),(3,8),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(4,8);
/*!40000 ALTER TABLE `opcionesmenuprivilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origenesfuente`
--

DROP TABLE IF EXISTS `origenesfuente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origenesfuente` (
  `idOrigenFuente` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idOrigenFuente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origenesfuente`
--

LOCK TABLES `origenesfuente` WRITE;
/*!40000 ALTER TABLE `origenesfuente` DISABLE KEYS */;
INSERT INTO `origenesfuente` VALUES (1,'Nacional'),(2,'Extranjera');
/*!40000 ALTER TABLE `origenesfuente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalexterno`
--

DROP TABLE IF EXISTS `personalexterno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalexterno` (
  `idPersonalExterno` bigint(20) NOT NULL AUTO_INCREMENT,
  `numeroIdentificacion` bigint(20) NOT NULL,
  `idTipoIdentificacion` int(11) NOT NULL,
  `nombres` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `correoElectronico` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL,
  `entidad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idPersonalExterno`),
  UNIQUE KEY `numeroIdentificacion_UNIQUE` (`numeroIdentificacion`,`idTipoIdentificacion`),
  KEY `personalexterno_tiposidentificacion_idtipoidentificacion_idx` (`idTipoIdentificacion`),
  CONSTRAINT `personalexterno_tiposidentificacion_idtipoidentificacion` FOREIGN KEY (`idTipoIdentificacion`) REFERENCES `tiposidentificacion` (`idTipoIdentificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalexterno`
--

LOCK TABLES `personalexterno` WRITE;
/*!40000 ALTER TABLE `personalexterno` DISABLE KEYS */;
INSERT INTO `personalexterno` VALUES (1,71984823,1,'William','Ortiz','wortiz@hotmail.com','SURA'),(2,78986456,1,'LORENZO','ZAPATA','lorenzo@hotmail.com','LOS LLANOS');
/*!40000 ALTER TABLE `personalexterno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalexternoproyectos`
--

DROP TABLE IF EXISTS `personalexternoproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personalexternoproyectos` (
  `idPersonalExterno` bigint(20) NOT NULL,
  `idProyecto` bigint(20) NOT NULL,
  `idRol` int(11) NOT NULL,
  `porcentajePropiedadIntelectual` decimal(18,2) NOT NULL,
  `horasSemana` int(11) NOT NULL,
  `mesesDedicados` int(11) NOT NULL,
  `cartaCesionDerechosPatrimonio` tinyint(1) NOT NULL,
  PRIMARY KEY (`idPersonalExterno`,`idProyecto`),
  KEY `personalExternoProyectos_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `personalExternoProyectos_roles_idrol_idx` (`idRol`),
  CONSTRAINT `personalExternoProyectos_personalexterno_idpersonalexterno` FOREIGN KEY (`idPersonalExterno`) REFERENCES `personalexterno` (`idPersonalExterno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personalExternoProyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `personalExternoProyectos_roles_idrol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalexternoproyectos`
--

LOCK TABLES `personalexternoproyectos` WRITE;
/*!40000 ALTER TABLE `personalexternoproyectos` DISABLE KEYS */;
INSERT INTO `personalexternoproyectos` VALUES (2,25,7,2.00,3,4,0);
/*!40000 ALTER TABLE `personalexternoproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plazosproyectos`
--

DROP TABLE IF EXISTS `plazosproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plazosproyectos` (
  `idPlazo` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `mesesAprobados` int(11) NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fechaActaCODI` datetime NOT NULL,
  `numeroActaCODI` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idPlazo`),
  KEY `plazos_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `plazos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plazosproyectos`
--

LOCK TABLES `plazosproyectos` WRITE;
/*!40000 ALTER TABLE `plazosproyectos` DISABLE KEYS */;
INSERT INTO `plazosproyectos` VALUES (1,5,'Plazo adicional','2017-08-27 19:09:25',4,'2017-08-27 00:00:00','4','2017-08-27 00:00:00','5'),(2,8,'Nuevo plazo','2017-08-27 19:11:36',6,'2017-08-27 00:00:00','4','2017-08-27 00:00:00','4');
/*!40000 ALTER TABLE `plazosproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegios`
--

DROP TABLE IF EXISTS `privilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegios` (
  `idPrivilegio` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idPrivilegio`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegios`
--

LOCK TABLES `privilegios` WRITE;
/*!40000 ALTER TABLE `privilegios` DISABLE KEYS */;
INSERT INTO `privilegios` VALUES (1,'Gestor de InformaciÃ³n','GESTOR_INFORMACION'),(2,'Usuarios CI','USUARIOS_CI'),(3,'Administrador del Sitio','ADMINISTRADOR'),(4,'Super Admin','SUPER_ADMIN');
/*!40000 ALTER TABLE `privilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegiosusuario`
--

DROP TABLE IF EXISTS `privilegiosusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegiosusuario` (
  `idusuario` bigint(20) NOT NULL,
  `idprivilegio` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`idprivilegio`),
  KEY `privilegiosusuario_idprivilegio_fkey_idx` (`idprivilegio`),
  CONSTRAINT `privilegiosusuario_idprivilegio` FOREIGN KEY (`idprivilegio`) REFERENCES `privilegios` (`idPrivilegio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `privilegiosusuario_idusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegiosusuario`
--

LOCK TABLES `privilegiosusuario` WRITE;
/*!40000 ALTER TABLE `privilegiosusuario` DISABLE KEYS */;
INSERT INTO `privilegiosusuario` VALUES (1,1),(6,1),(7,1),(8,1),(9,1),(10,1),(15,1),(1,2),(1,3),(14,3),(4,4);
/*!40000 ALTER TABLE `privilegiosusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesores` (
  `idProfesor` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTipoIdentificacion` int(11) NOT NULL,
  `nombres` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `numeroIdentificacion` bigint(20) NOT NULL,
  `correoElectronico` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `contacto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idProfesor`),
  UNIQUE KEY `numeroIdentificacion_UNIQUE` (`numeroIdentificacion`,`idTipoIdentificacion`),
  KEY `profesores_tiposestudiantes_idtipoidentificacion_idx` (`idTipoIdentificacion`),
  CONSTRAINT `profesores_tiposidentificacion_idtipoidentificacion` FOREIGN KEY (`idTipoIdentificacion`) REFERENCES `tiposidentificacion` (`idTipoIdentificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` VALUES (1,1,'William','Ortiz',71984823,'waortiz@hotmail.com','En la facultad'),(2,1,'Juan David','Ortiz Perea',43567890,'juan@hotmail.com','Casa de la mamÃ¡'),(3,1,'FABIO','PALACIO',71985678,'waortiz@hotmail.com','ANA FARINA');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesoresproyectos`
--

DROP TABLE IF EXISTS `profesoresproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesoresproyectos` (
  `idProfesor` bigint(20) NOT NULL,
  `idProyecto` bigint(20) NOT NULL,
  `idRol` int(11) NOT NULL,
  `idFacultad` int(11) NOT NULL,
  `cartaCesionDerechosPatrimonio` tinyint(1) NOT NULL,
  `porcentajePI` decimal(18,2) NOT NULL,
  `horasSemana` int(11) NOT NULL,
  `mesesDedicados` int(11) NOT NULL,
  `horasSemanaFueraPlan` int(11) DEFAULT NULL,
  `mesesFueraPlan` int(11) DEFAULT NULL,
  `idTipoVinculacion` int(11) NOT NULL,
  PRIMARY KEY (`idProfesor`,`idProyecto`),
  KEY `profesoresproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `profesoresproyectos_roles_idrol_idx` (`idRol`),
  KEY `profesoresproyectos_facultades_idfacultad_idx` (`idFacultad`),
  KEY `profesoresproyectos_tiposvinculacion_idtipovinculacion_idx` (`idTipoVinculacion`),
  CONSTRAINT `profesoresproyectos_facultades_idfacultad` FOREIGN KEY (`idFacultad`) REFERENCES `facultades` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_profesores_idprofesor` FOREIGN KEY (`idProfesor`) REFERENCES `profesores` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_roles_idrol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_tiposvinculacion_idtipovinculacion` FOREIGN KEY (`idTipoVinculacion`) REFERENCES `tiposvinculacion` (`idTipoVinculacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesoresproyectos`
--

LOCK TABLES `profesoresproyectos` WRITE;
/*!40000 ALTER TABLE `profesoresproyectos` DISABLE KEYS */;
INSERT INTO `profesoresproyectos` VALUES (1,2,5,14,0,5.00,2,3,4,5,5),(1,5,1,23,1,6.00,4,5,6,7,3),(1,8,5,25,0,2.00,3,4,5,6,8),(1,18,1,5,1,7.00,3,4,5,6,2),(3,25,1,14,1,6.00,4,5,5,6,6);
/*!40000 ALTER TABLE `profesoresproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programas`
--

DROP TABLE IF EXISTS `programas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programas` (
  `idPrograma` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idPrograma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programas`
--

LOCK TABLES `programas` WRITE;
/*!40000 ALTER TABLE `programas` DISABLE KEYS */;
INSERT INTO `programas` VALUES (1,'Salud PÃºblica'),(2,'AdmistraciÃ³n en salud: Â GestiÃ³n Sanitaria y Ambiental'),(3,'Salud Mental'),(4,'EpidemiologÃ­a'),(7,'Ciencias Sociales'),(8,'AdministraciÃ³n en Salud: GestiÃ³n de Servicios de Salud'),(10,'IngenierÃ­a Ambiental'),(11,'Doctorado en Paz, conlictos y democracia'),(12,'psicologia'),(13,'Salud comunitaria'),(15,'Gerencia en Sistemas de InformaciÃ³n en Salud'),(17,'Salud Ocupacional'),(18,'Desarrollo humano a nivel local y regional.'),(19,'TecnologÃ­a en Regencia de Farmacia'),(20,'Doctorado en antropologÃ­a y trabajo social');
/*!40000 ALTER TABLE `programas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prorrogasproyectos`
--

DROP TABLE IF EXISTS `prorrogasproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prorrogasproyectos` (
  `idProrroga` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `mesesAprobados` int(11) NOT NULL,
  `montoAprobado` bigint(20) NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fechaActaCODI` datetime NOT NULL,
  `numeroActaCODI` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idProrroga`),
  KEY `prorrogas_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `prorrogas_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prorrogasproyectos`
--

LOCK TABLES `prorrogasproyectos` WRITE;
/*!40000 ALTER TABLE `prorrogasproyectos` DISABLE KEYS */;
INSERT INTO `prorrogasproyectos` VALUES (1,5,'Nueva entrega','2017-08-27 19:08:09',3,5000000,'2017-08-27 00:00:00','34556','2017-08-27 00:00:00','56654'),(2,5,'Otra prÃ³rroga','2017-08-27 19:08:47',5,45000000,'2017-08-27 00:00:00','345','2017-08-27 00:00:00','456'),(3,8,'Prueba','2017-08-27 19:10:48',4,5,'2017-08-27 00:00:00','6','2017-08-27 00:00:00','7'),(4,8,'Nueva entrega','2017-08-27 19:11:12',2,444444,'2017-08-27 00:00:00','3','2017-08-27 00:00:00','3');
/*!40000 ALTER TABLE `prorrogasproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos` (
  `idProyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombreCompletoProyecto` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `nombreCortoProyecto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFinalizacion` datetime NOT NULL,
  `idAreaTematica` int(11) NOT NULL,
  `codigoCOLCIENCIAS` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `participacionInternacional` tinyint(1) NOT NULL,
  `idTipoProyecto` int(11) NOT NULL,
  `idRiesgoEtico` int(11) NOT NULL,
  `idTipoContrato` int(11) NOT NULL,
  `idEnfoqueMetodologico` int(11) NOT NULL,
  `idConvocatoria` int(11) NOT NULL,
  `objetivoGeneral` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `idUsuarioCreacion` bigint(20) NOT NULL,
  PRIMARY KEY (`idProyecto`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `proyectos_areastematicas_idareatematica_idx` (`idAreaTematica`),
  KEY `proyectos_riegoseticos_idriesgoetico_idx` (`idRiesgoEtico`),
  KEY `proyectos_enfoquesmetodologicos_idenfoquemetodologico_idx` (`idEnfoqueMetodologico`),
  KEY `proyectos_tiposcontrato_idtipocontrato_idx` (`idTipoContrato`),
  KEY `proyectos_convocatorias_idconvocatoria_idx` (`idConvocatoria`),
  KEY `proyectos_tiposproyecto_idx` (`idTipoProyecto`),
  KEY `proyectos_idusuariocreacion_usuarios_idx` (`idUsuarioCreacion`),
  CONSTRAINT `proyectos_areastematicas_idareatematica` FOREIGN KEY (`idAreaTematica`) REFERENCES `areastematicas` (`idAreaTematica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_convocatorias_idconvocatoria` FOREIGN KEY (`idConvocatoria`) REFERENCES `convocatorias` (`idConvocatoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_enfoquesmetodologicos_idenfoquemetodologico` FOREIGN KEY (`idEnfoqueMetodologico`) REFERENCES `enfoquesmetodologicos` (`idEnfoqueMetodologico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_idusuariocreacion_usuarios` FOREIGN KEY (`idUsuarioCreacion`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_riegoseticos_idriesgoetico` FOREIGN KEY (`idRiesgoEtico`) REFERENCES `riesgoseticos` (`idRiesgoEtico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_tiposcontrato_idtipocontrato` FOREIGN KEY (`idTipoContrato`) REFERENCES `tiposcontrato` (`idTipoContrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_tiposproyecto_idtipoproyecto` FOREIGN KEY (`idTipoProyecto`) REFERENCES `tiposproyecto` (`idTipoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'GestiÃ³n de NiÃ±os','GestiÃ³n','2017-05-09 00:00:00','2017-05-25 00:00:00',2,'SE4','1',1,1,3,1,1,2,'DESARROLLAR','2016-05-28 14:31:03',1),(2,'Programa especial de la niÃ±ez','Programa especial de la niÃ±ez','2017-05-02 00:00:00','2017-05-28 00:00:00',2,'86786','464',1,1,3,1,1,2,'Crear conciencia del cuidado de los niÃ±os','2017-05-28 16:02:36',1),(3,'CreaciÃ³n de NiÃ±os U de A','CreaciÃ³n de NiÃ±os','2017-05-02 00:00:00','2017-05-28 00:00:00',2,'86786','789',1,1,3,1,1,2,'Ninguno en especiÃƒÂ¡l','2017-05-28 16:09:32',1),(4,'Proyecto de IntegraciÃ³n Colectiva','Proyecto de IntegraciÃ³n Colectiva','2017-05-03 00:00:00','2017-05-28 00:00:00',2,'dasdas','56789',0,1,3,1,1,2,'Desarrollar la plataforma de tecnologÃ­a de la colectividad','2017-05-28 16:10:08',1),(5,'GestiÃ³n de NiÃ±os','GestiÃ³n de NiÃ±os','2017-05-09 00:00:00','2017-05-19 00:00:00',2,'54','31312',0,1,3,1,1,2,'Crear Ã¡rboles','2014-05-28 16:21:25',1),(8,'NutriciÃ³n Callejera en MedellÃ­n','NutriciÃ³n Callejera','2017-05-16 00:00:00','2017-05-29 00:00:00',2,'88','4234',1,1,3,1,1,2,'Crear un sistema','2017-05-29 08:50:45',1),(9,'Social Completo','Social','2017-05-09 00:00:00','2017-05-24 00:00:00',2,'76','646',0,1,3,1,1,2,'Trabajo social','2017-05-29 12:10:28',1),(15,'Pruebas 1','Pruebas 1','2017-07-01 00:00:00','2017-07-30 00:00:00',2,'6','34',0,1,3,1,1,2,'Desarrollo','2015-07-01 14:33:53',1),(16,'Pruebas 1','Pruebas 1','2017-07-01 00:00:00','2017-07-30 00:00:00',2,'6','890',0,1,3,1,1,2,'Desarrollo','2017-07-01 14:35:00',1),(17,'Proyecto 1','Proyecto 1','2017-07-01 00:00:00','2017-07-31 00:00:00',2,'89','786',0,1,3,1,1,2,'Pruebas de guÃ­a de informaciÃ³n','2017-07-01 17:29:49',1),(18,'Perea','William Alexis','2017-07-02 00:00:00','2017-07-31 00:00:00',4,'5','57',1,1,3,1,1,7,'Ninguno','2017-07-02 20:00:16',1),(20,'Prueba 1','Prueba 1','2017-07-02 00:00:00','2017-07-31 00:00:00',2,'5','4368',0,1,3,1,1,2,'Desarrollo','2017-07-02 20:04:39',1),(21,'Prueba 1','Prueba 1','2017-07-02 00:00:00','2017-07-31 00:00:00',2,'5','21345',0,1,3,1,1,2,'Desarrollo','2017-07-02 20:16:37',1),(25,'DESARROLLO DE TELEASISTENCIA PARA LA TERCERA EDAD','TELELLAMADA','2017-08-11 00:00:00','2017-10-08 00:00:00',5,'5685ASD','6543',1,2,3,1,2,7,'DESARROLLAR PLATAFORMA DE FACILITACIÃ“N','2017-08-11 12:43:17',1),(26,'Desarrollo integral de planes de acciÃ³n','Desarrollo de Planes','2017-08-28 00:00:00','2017-10-01 00:00:00',1,'3467','2',0,2,2,1,1,5,'Desarrollar el plan','2017-08-28 18:31:55',1);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riesgoseticos`
--

DROP TABLE IF EXISTS `riesgoseticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riesgoseticos` (
  `idRiesgoEtico` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idRiesgoEtico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riesgoseticos`
--

LOCK TABLES `riesgoseticos` WRITE;
/*!40000 ALTER TABLE `riesgoseticos` DISABLE KEYS */;
INSERT INTO `riesgoseticos` VALUES (1,'Sin Riesgo'),(2,'Riesgo MÃ­nimo'),(3,'Mayor al MÃ­nimo'),(4,'SD');
/*!40000 ALTER TABLE `riesgoseticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Investigador Principal'),(2,'Co_Investigador'),(3,'Joven Investigador CODI'),(4,'Joven Investigador COLCIENCIAS'),(5,'Asesor Nacional'),(6,'Asesor Internacional'),(7,'Auxiliar de InvestigaciÃ³n'),(8,'Estudiante en FormaciÃ³n'),(9,'Director de Trabajo de Grado'),(10,'Co_Director de Trabajo de Grado');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposacta`
--

DROP TABLE IF EXISTS `tiposacta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposacta` (
  `idTipoActa` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoActa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposacta`
--

LOCK TABLES `tiposacta` WRITE;
/*!40000 ALTER TABLE `tiposacta` DISABLE KEYS */;
INSERT INTO `tiposacta` VALUES (1,'Registro y Propiedad Intelectual'),(2,'FinalizaciÃ³n'),(3,'Cierre'),(4,'Consejo de Facultad'),(5,'Inicio');
/*!40000 ALTER TABLE `tiposacta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposaval`
--

DROP TABLE IF EXISTS `tiposaval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposaval` (
  `idTipoAval` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoAval`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposaval`
--

LOCK TABLES `tiposaval` WRITE;
/*!40000 ALTER TABLE `tiposaval` DISABLE KEYS */;
INSERT INTO `tiposaval` VALUES (1,'Personal'),(2,'Organizacional');
/*!40000 ALTER TABLE `tiposaval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposcompromiso`
--

DROP TABLE IF EXISTS `tiposcompromiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposcompromiso` (
  `idTipoCompromiso` int(11) NOT NULL,
  `nombre` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoCompromiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposcompromiso`
--

LOCK TABLES `tiposcompromiso` WRITE;
/*!40000 ALTER TABLE `tiposcompromiso` DISABLE KEYS */;
INSERT INTO `tiposcompromiso` VALUES (1,'PublicaciÃ³n de un articulo'),(2,'Ponencias a profesores estudiantes y estamento no docente'),(3,'Documentos con los resultados de la investigaciÃ³n'),(4,'ArtÃ­culo publicado en revista indexada tipo A o B'),(5,'DivulgaciÃ³n de los resultados para las asociaciones A las que pertenezcan el grupo de venteros participantes en el estudio y para las autoridades de salud del municipio si es necesario.'),(6,'PresentaciÃ³n de los resultados en un evento acadÃ©mico.'),(7,'Entrega del informe final en medio magnÃ©tico para la biblioteca'),(8,'SustentaciÃ³n oral ante jurados'),(9,'ArtÃ­culo publicables'),(10,'PublicaciÃ³n de artÃ­culo'),(11,'Entrega de documento final de la tesis'),(12,'Discusion de los resultados, elabroacion y entrega del informe final'),(13,'Divulgacion del estudio, diseÃ±o, elaboracion y entrega del articulo para publicacion.'),(14,'PresentaciÃ³n en congresos'),(15,'PublicaciÃ³n en memoria de evento internacional'),(16,'ArtÃ­culo de revista sobre un producto del proyecto'),(17,'Documentos con recomendaciones para el seguimiento de la dinÃ¡mica de la enfermedad por vigilancia epidemiologia'),(18,'Acta de finalizaciÃ³n con Colciencias, fondo de apoyo y secretaria de salud. Ok'),(19,'Articulo  presentado para publicaciÃ³n'),(20,'DivulgaciÃ³n'),(21,'FormaciÃ³n de estudiantes'),(22,'Entrega informe final en CD'),(23,'PresentaciÃ³n en evento'),(24,'FormaciÃ³n estudiante '),(25,'ArtÃ­culo'),(26,'PublicaciÃ³n de ArtÃ­culo'),(27,'DivulgaciÃ³n'),(28,'FormaciÃ³n de estudiantes'),(29,'Entrega informe final en CD'),(30,'Publicacion de Articulo'),(31,'FormaciÃ³n de estudiante 1 pregrado y 1 de posgrado'),(32,'Ponencia'),(33,'Taller'),(34,'DivulgaciÃ³n en foros y conversatorios en medios academicos y comunitarios, entidades gubernamentales y establecimientos educativos'),(35,'PublicaciÃ³n de ArtÃ­culo'),(36,'FormaciÃ³n estudiantes'),(37,'PresentaciÃ³n pÃºblica en el auditorio de la FNSP'),(38,'ArtÃ­culo listo para ser publicado en la revista de la FNSP'),(39,'Un artÃ¬culo aceptado para publicaciÃ³n en una revista nacional o Internacional '),(40,'Una Ponencia en evento cientÃ­fico nacional o internacional'),(41,'PublicaciÃ³n de un artÃ­culo en revista indexada, grado Ao B, con los resultados de la investigaciÃ³n.'),(42,'PresentaciÃ³n de los resultados en un evento acadÃ©mico de orden nacional internacional. '),(43,'Un estudiante de pregrado en formaciÃ³n'),(44,'FormaciÃ³n de estudiante  de doctorado'),(45,'Articulo en revista Nacional o internacional reconocida por Colciencias'),(46,'Articulo en revista Nacional o internacional reconocida por Colciencias'),(47,'PresentaciÃ³n en jornada de investigaciÃ³n y congreso.'),(48,'Articulo'),(49,'Formacion de 2 est. pos'),(50,'Ponencia nal o intern.'),(51,'PresentaciÃ³n en el CINDE y entidades participantes'),(52,'PresentaciÃ³n de los resultados en congreso nacional Ã³ internacional.'),(53,'PublicaciÃ³n de dos artÃ­culos '),(54,'Articulo cientÃ­fico para publicaciÃ³n en revista nacional o internacional'),(55,'RealizaciÃ³n de foros regionales en las ciudades seleccionadas para el estudio'),(56,'Serie de artÃºculo de prensa en un diario de circulaciÃ³n nacional y otro especÃ­fico de la regiÃ³n.'),(57,'ContribuciÃ³n en la formaciÃ³n en investigaciÃ³n de estudiantes de la MaestrÃ­a em Salud PÃºblica'),(58,'Articulo publicado  en una revista indexada en las categorias A1, A2 o B.'),(59,'Presentacion de los resultados en congresos y eventos academicos'),(60,'Compartir los resultados con otras instituciones que ejecutan el programa de crecimiento y desarrollo como estrategia para impulsar cambios en el programa.'),(61,'Un (1) artÃ­culo aceptado para publicaciÃ³n en una revista nacional Ã³ internacional reconocida por Colciencias.'),(62,'FormaciÃ³n en investigaciÃ³n de un (1) estudiante de pre o posgrado.'),(63,'PresentaciÃ³n de los resultados de investigaciÃ³n en un evento nacional o internacional'),(64,'PublicaciÃ³n  de articulo en revista nacional indexada       '),(65,'SocializaciÃ³n de resultados en talleres realizados en las 4 veredas.'),(66,'Acta de acuerdo, segÃºn estatuto de propiedad intelectual.'),(67,'PublicaciÃ³n en revista indexada categoria B o A.'),(68,'Presentacion de los resultados en un evento academico nacional o internacional'),(69,'Articulo en revista Nacional o internacional reconocida por Colciencias'),(70,'FormaciÃ³n de 2 estudiantes pregrado'),(71,'Ponencia evento nacional o internacional.'),(72,'Articulo divulgando los resultados del proyecto'),(73,'ParticipaciÃ³n en eventos nacionales e internacionales relacionadas con la tuberculosis'),(74,'asantÃ­a de estudiante de doctorado en Los Angeles California para asesorÃ­a de expertos en anÃ¡lisis y procesamiento de informaciÃ³n.'),(75,'FormaciÃ³n de una estudiante de doctorado en EpidemiologÃ­a'),(76,'Presentar informe final en CD '),(77,'DivulgaciÃ³n de los resultados : Ponencia en el Congreso Internacional de Riesgos Psicosociales en BogotÃ¡'),(78,'PublicaciÃ³n de un artÃ­culo en revista A 1 o A2'),(79,'FormaciÃ³n estudiante de doctorado GermÃ¡n Fernando Vieco (Doctorado en'),(80,'Articulo cientifico revista indexada'),(81,'Formacion investigacion 3 estudiantes de posgrado'),(82,'Evento difusion y validacion '),(83,'Micromundo procesos de educacion vial'),(84,'Articulo en revista especializada'),(85,'informe final en la pÃ¡gina web de la FNSP '),(86,'presentaciÃ³n en congreso y/o foros especializado'),(87,'SocializaciÃ³n permanente del proceso de investigaciÃ²n y de sus resultados con el grupo de investigaciÃ³n  G y P.'),(88,'UtilizaciÃ³n de los resultados en los procesos de docencia pertinentes al tema de la investigaciÃ³n '),(89,'Acta de finalizacion por entidad externa'),(90,'ComunicaciÃ³n de resultados en la pagina web de la FNSP '),(91,'Articulo en revista especializada'),(92,'Congreso y/o Foro especializado'),(93,'ArtÃ­culo publicado'),(94,'FormaciÃ³n de estudiantes 2 de pre y 1 de posgrado'),(95,'Entregar 2 trabajos de grado de estudiantes de AministraciÃ³n en salud'),(96,'un ( 1 ) artÃ­culo aceptado para publicaciÃ³n en una revista nacional Ã³ internacional'),(97,'FormaciÃ³n en investigaciÃ³n de un ( 1 ) estudiante de pre o posgrado.'),(98,'Una  ( 1) ponencias en eventos cientÃ­fico nacional Ã³ internacional.'),(99,'Informe Final '),(100,'Presentacion de resultados '),(101,' Articulo'),(102,'Estudiante en formaciÃ³n del programa Doctorado en Salud PÃºblica'),(103,'PublicaciÃ³n de un artÃ­culo en revista indexada por Colciencias A1 o A2'),(104,'DivulgaciÃ³n de resultados en evento cientÃ­fico a nivel nacional o internacional'),(105,'Resumen ejecutivo  para involucrados.'),(106,'PresentaciÃ³n de los resultados en evento acadÃ©mico e intituciones involucradas  con la poblaciÃ³n desplazada,  en eventos o congresos Nal o Intern.y ante el mpio con publicos diferentes en los que se encuentre representaciÃ³n de la poblaciÃ³n desplazada, fun'),(107,'Articulo para publicaciÃ³n en revista indexada u homologada por colciencias.'),(108,'Informe participaciÃ³n del estudiante con copia a la hoja de vida'),(109,'Articulo de revista A1 o A2'),(110,'Conferencia sobre los resultados de la investigaciÃ³n a la comunidad universitaria'),(111,'SocializaciÃ³n de los resultados en una reuniÃ³n de la mesa por el derecho a la salud de la niÃ±ez en situaciÃ³n de calle y/o participaciÃ³n en un evento de ciudad relacionado con el tema'),(112,'ParticipaciÃ³n en eventos acadÃ©micos de nivel nacional'),(113,'Se firmarÃ¡ acta de acuerdo de propiedad intelectual.'),(114,'Se publicarÃ¡ un artÃ­culo en una revista indexada '),(115,'Se presentarÃ¡ al menos, una conferencia a la comunidad universitaria interna sobre los resultados de la investigaciÃ³n'),(116,'Se presentarÃ¡ informe sobre el desempeÃ±o de los estudiantes que participaron en el proyecto.'),(117,'Se firmarÃ¡ acta de finalizaciÃ³n del proyecto, firmada por el Jefe del Centro de Investigaciones de la Facultad Nacional de Salud PÃºblica.'),(118,'Se firmarÃ¡ acta de liquidaciÃ³n del proyecto'),(119,'Se desarrollarÃ¡ un taller de educaciÃ³n mÃ©dica y nutricional continuada con el fin de divulgar nuestros  hallazgos entre el personal mÃ©dico, paramÃ©dico y nutricionistas.  '),(120,' PublicaciÃ³n en una revista nacional indexada A1, A2, o B'),(121,' Informe desempeÃ±o estudiante de maestrÃ­a con copia para su hoja de vida.'),(122,' PresentaciÃ³n de resultados en evento acadÃ©mico'),(123,'Taller con la comunidad acadÃ©mica, las instituciones, los jÃ³venes y las autoridades locales '),(124,'LocalizaciÃ³n y concertaciÃ³n de jÃ³venes de la lÃ­nea de base,'),(125,'evaluaciÃ³n de impacto con casos y controles'),(126,'evaluaciÃ³n de impacto con investigaciÃ³n cualititativa grupos focales'),(127,'entrega y sustentaciÃ³n de resultados.'),(128,'entrevistas, integraciÃ³n de informe cuantitativo y cualitativo'),(129,'Documentos metodolÃ³gicos'),(130,'Documentos bÃ¡sicos de anÃ¡lisis'),(131,'Documentos de anÃ¡lisis de problemas especÃ­ficos de salud'),(132,'Documentos de sÃ­ntesis del ASIS'),(133,'Bases de datos e informes de ejecuciÃ³n'),(134,'PresentaciÃ³n del informe final en medio magnÃ©tico, '),(135,'Articulo publicado en revista indexada'),(136,'PresentaciÃ³n de los resultados en evento acadÃ©mico.'),(137,'Presentar los resultados ante el grupo de investigacion GestiÃ³n y PolÃ­ticas y el INPEC '),(138,' Publicar artÃ­culo en revista indexada'),(139,'PresentaciÃ³n en eventos acadÃ©micos relacionados con el tema'),(140,'Informe final CD '),(141,'Presentar el proyecto como propuesta de investigaciÃ³n en el encuentro regional de semillero de investigaciÃ³n organizado por la Red Colombiana de Semilleros de InvestigaciÃ³n (REDCOLSI) nodo Antioquia.'),(142,'Presentar los resultados parciales y/o totales de la investigaciÃ³n en el Encuentro Nacional de Semilleros de InvestigaciÃ³n organizado por la Red Colombiana de Semilleros de InvestigaciÃ³n (REDCOLSI).'),(143,'Presentar los resultados del estudio a estudiantes y profesores de la FNSP y a la comunidad universitaria donde sea posible la presentaciÃ³n'),(144,'Organizar una memoria para la biblioteca de la FNSP con las publicaciones de los estudiantes en la revista de la FNSP, resÃºmenes de ponencias donde participaron estudiantes de pregrado.'),(145,'Presentar informe final (tÃ©cnico y financiero) del proyecto al centro de investigaciones de la FNSP'),(146,'Publicar los resultados en la Revista de la FNSP u otra'),(147,'Presentar los resultados en diferentes eventos realizados por la red colombiana de semilleros de investigaciÃ³n.'),(148,'DivulgaciÃ³n de resultados en evento programado con los egresados y empleadores y demÃ¡s pÃºblicos de la facultad.'),(149,'PublicaciÃ³n de artÃ­culo con resultados en revista de la FNSP'),(150,' Divulgar los resultados en eventos acadÃ©micos relacionados con el proyecto'),(151,' Articulo  para publicar los resultados de investigaciÃ³n en una revista indexada en las categorÃ­as A1, A2 o B        '),(152,'PresentaciÃ³n en evento acadÃ©mico'),(153,' Compartir los resultados con los participantes de la investigaciÃ³n'),(154,'Realizar un diagnostico de la situaciÃ³n, necesidades de capacitaciÃ³n y asistencia  a los Municipios en temas de prevenciÃ³n de la violencia  en el marco de los derechos humanos con Ã©nfasis   en los temas de violencia intrafamiliar , consumo de psicoactivos'),(155,'DiseÃ±ar los manuales de capacitaciÃ³n  y asistencia  requeridos y los protocolos  de intervenciÃ³n   grupal  para el desarrollo de las actividades y el cumplimiento de los objetivos del proyecto.'),(156,'ConformaciÃ³n de las unidades mÃ³viles  en cada subregiÃ³n  incluyendo el equipo interdisciplinario'),(157,'DiseÃ±ar e implementar  un plan de comunicaciÃ³n  y difusiÃ³n  de las actividades y el desarrollo del proyecto con Ã©nfasis en la puesta en marcha de las 5 Unidades MÃ³viles'),(158,'Presentar dos informes de avance a la GobernaciÃ³n, sobre el estado  de desarrollo del proyecto'),(159,'Presentacion pÃºblica en la FNSP'),(160,'Publicacion en la revista de la FNSP'),(161,'Entrega de Informe final y presentaciÃ³n a los implicados en la investigaciÃ³n'),(162,'Hacer entrega de los resultados del proyecto en medio magnÃ©tico'),(163,'Articulo para revista indexada'),(164,'Socializar los resultados en un evento con ponencia, charla magistral o conversatorio'),(165,'DiseÃ±ar un folleto que resuma los principales hallazgos de la investigaciÃ³n'),(166,'Los resultados de la investigaciÃ³n serÃ¡n comunicados en primer lugar a los agentes involucrados de manera directa en el estudio a travÃ©s de medio magnÃ©tico.'),(167,'Dar a conocer al pÃºblico en general a travÃ©s de seminarios, congresos, simposios y otros eventos acadÃ©micos los resultados del estudio.'),(168,'El resultado final de la investigaciÃ³n serÃ¡ publicado en la Revista indexada en categorÃ­a Al.'),(169,'Elaboracion y entrega del informe final a la Universidad  y a la Empresa de Servicios Publicos.'),(170,'Socializacion de los resultados del proyecto a la comunidad de usuarios del acueducto del municipio La Pintada y Administracion Municipal y Empresa de Servicios Publicos.'),(171,'Socializacion de los resultados del proyecto a la comunidad universitaria en general.'),(172,'Articulo sometido para publicaciÃ³n en la revista de la FNSP.'),(173,'Trabajo de grado dirigido a la universidad'),(174,'Publicacion en la pagina web de la Red Colombiana de Investigacion en Politicas y sistemas de salud'),(175,'Presentacion en el auditorio de la FNSP'),(176,'Articulo para publicar en una revista indexada'),(177,'Elaborar el documento inicial de sustentacion de proyecto'),(178,'el diseÃ±o muestral'),(179,'el protocolo'),(180,'el estudio de costos para el cuarto Estudio Nacional de Salud Buca'),(181,'Informe final de actividades, conclusiones y recomendaciones'),(182,'Movilizar las administraciones municipales'),(183,'Coordinar recoleccion de la informacion y organizar y procesar una encuesta'),(184,'Aplicar el sistema de informacion diseÃ±ado por la Gobernacion'),(185,'Entregar un documento con el plan de seguridad ciudadana y justicia de cada municipio'),(186,'apoyar el diseÃ±o del modulo de planes de seguridad y justicia'),(187,'ndicarle a las administraciones locales y los ciudadanos las pautas para seguir el plan formulado'),(188,'Suministrar equipo humano y materiales'),(189,'Promocionar la imagen institucional de la Gobernacion y de asesoria de pa'),(190,'Entregar a la asesoria de paz todos los documentos evidenciales'),(191,'Acreditar ante el interventor el cumplimiento con las obligaciones de la seguridad social.'),(192,'ElaboraciÃ³n de un informe que se presentarÃ¡ al ComitÃ© de programa de la maestrÃ­a en EpidemiologÃ­a de la Facultad Nacional de Salud PÃºblica de la Universidad de Antioquia, y se dejarÃ¡ una copia en la Biblioteca de esta misma Facultad'),(193,'PresentaciÃ³n pÃºblica de los resultados en una reuniÃ³n acadÃ©mica programada por el comitÃ© de programa de la MaestrÃ­a en EpidemiologÃ­a de la Facultad Nacional de Salud PÃºblica de la Universidad de Antioquia.'),(194,' EnvÃ­o para publicaciÃ³n de un artÃ­culo con los resultados de la investigaciÃ³n en una revista nacional indexada'),(195,'SocializaciÃ³n de los resultados de la investigaciÃ³n en un evento acadÃ©mico nacional.'),(196,'FormaciÃ³n de un estudiante de MaestrÃ­a en EpidemiologÃ­a o de la MaestrÃ­a en Salud PÃºblica'),(197,'Informe Final'),(198,'PublicaciÃ³n de artÃ­culo con los resultados del estudioOK'),(199,'FormaciÃ³n de un estudiante de Doctorado de EpidemiologÃ­a U de AFormaciÃ³n de un estudiante de MaestrÃ­a en EpidemiologÃ­a y/o residencia clÃ­nica UIS'),(200,'FormaciÃ³n de estudiantes de pregrado de Medicina, MicrobiologÃ­a y BioanÃ¡lisis'),(201,'PresentaciÃ³n de los resultados en el Encuentro Nacional de InvestigaciÃ³n en Enfermedades Infecciosas y en un Congreso Internacional'),(202,'PublicaciÃ³n cientÃ­fica en una revista nacional y una internacional (A1 o A2) Informe de los resultados del estudio presentados al Ministerio de la ProtecciÃ³n Social'),(203,'Propuesta de un sistema de vigilancia en salud pÃºblica de la TB en centros penitenciarios'),(204,'FormaciÃ³n de un estudiante de MaestrÃ­a de la FNSP.'),(205,'PublicaciÃ³n de resultados en revista indexada.'),(206,'Informe Final a entidades financiadoras'),(207,'PublicaciÃ³n de artÃ­culo en revista indexada en categorÃ­a A, A1 o B nacional o internacional'),(208,'Seminario de divulgaciÃ³n de los resultados de la investigaciÃ³n en la ciudad de MedellÃ­n'),(209,'FormaciÃ³n de un estudiante de postgrado'),(210,'FormaciÃ³n de investigadores indÃ­genas de la comunidad de CristianÃ­a'),(211,'FormaciÃ³n de estudiante de MaestrÃ­a en EpidemiologÃ­a'),(212,'Libro NarraciÃ³n de la historia del proyecto, experiencia y resultados'),(213,'ArtÃ­culo en ingles en revista internacional comunicando principales hallazgos'),(214,'Programa educativo en salud sexual para pueblos indÃ­genas, se compone de 12 sesiones con talleres, cine foros y otras dinÃ¡micas participativas'),(215,'Plan de acciÃ³n 2011 - 2013 para prevenciÃ³n de VIH e ITS en CristianÃ­a.'),(216,'Acta de liquidacion'),(217,'Presentacion publica en el auditorio de la FNSP'),(218,'Articulo publicado sobre el estado del articulo de las luchas en Colombia en (Revista B)'),(219,'Realizar el acta de inicio de actividades'),(220,'Realizar una publicaciÃ³n en una revista nacional indexada'),(221,'Elaborar un informe sobre el desempeÃ±o del estudiante de maestrÃ­a durante el desarrollo del estudio con copia a su respectiva hoja de vida.'),(222,'Elaborar un acta de finalizaciÃ³n y liquidaciÃ³n del proyecto firmada por el Jefe del Centro de Investigaciones y por los investigadores.'),(223,'Realizar una presentaciÃ³n a la comunidad acadÃ©mica, las instituciones, los jÃ³venes y las autoridades locales para la presentaciÃ³n de los resultados finales.         '),(224,'Garantizar la confidencialidad de la base de datos generados, de los instructivos, manuales y el instrumento de recolecciÃ³n de la informaciÃ³n  y evitar la utilizaciÃ³n de este material para otros fines diferentes a los propuestos por la investigaciÃ³n.'),(225,'Documento final de la investigacion'),(226,'ImplementaciÃ³n de un inventario de las instituciones/programas sociales que existen en las comunas 1-3,8'),(227,'ImplementaciÃ³n de un inventario de los programas asociados con Metrosocial en las comunas 1-2'),(228,'RecolecciÃ³n de datos secundarios sobre los barrios en el estudio de PlaneaciÃ³n, PolicÃ­a, FiscalÃ­a'),(229,'Seguimiento de personas encuestadas en PREVIVA 2003-4 en las comunas 1-3,8'),(230,'Levantamiento de una segunda encuesta a las personas seguidas de PREVIVA 2003-4 en las comunas 1-3, 8'),(231,'ObservaciÃ³n del entorno de los barrios donde viven las personas encuestadas'),(232,'CreaciÃ³n y mantenimiento de una base de datos para compilar los datos levantados en la encuesta y en la observaciÃ³n de entorno'),(233,'El proyecto se llevarÃ¡ a cabo con El concurso de tres estudiantes en formaciÃ³n del programa AdministraciÃ³n en Salud con Ã‰nfasis en GestiÃ³n Sanitaria y Ambiental .'),(234,'DivulgaciÃ³n de los resultados a la comunidad del municipio Marinilla, donde se invitarÃ¡ a las autoridades municipales y la comunidad en general con Ã‰nfasis en los socios del acueducto rural la Primavera-El Socorro-la AsunciÃ³n y parte del Alto del Mercado '),(235,'Ponencia en jornadas de investigaciÃ³n de la FNSP'),(236,'PublicaciÃ³n de un artÃ­culo de revista A1 o A2'),(237,'Entrega del informe final en la Biblioteca de la Facultad Nacional de Salud Publica OK.'),(238,'Presentar  los resultados a las directivas y a la fnsp   '),(239,'Publicar Articulo'),(240,'PublicaciÃ³n articulo de revista'),(241,'Ponencia en evento nacional o internacional, seguramente en el marco del Congreso  Colombiano de Calidad de aire. '),(243,'FormaciÃ³n en investigaciÃ³n de un estudiante de pregrado, contribuyendo a la formaciÃ³n de futuros investigadores.'),(244,' Escribir un artÃ­culo relacionado con el tema de investigaciÃ³n.'),(245,'Poner a disposiciÃ³n de quienes necesiten, los resultados de la investigaciÃ³n y la experiencia lograda en el mejoramiento de la docencia.'),(246,'Articulo enviado para publicacion'),(247,'PresentaciÃ³n a grupos acadÃ©micos y a los participantes e instituciones comprometidas con el tema'),(248,'FormaciÃ³n de estudiante de pregrado'),(249,'Articulo'),(250,'Formacion estudiante de pregrado  '),(251,'Conferencia de socializacion  a personal directivo y a estudiantes'),(252,'Articulo publicado en revista B, A2 o A1 '),(253,'Taller de divulgacion con docentes y personal de las organizaciones comunitarias'),(254,'Se formaran 2 estudiantes de pregrado'),(255,'Se entregara al Centro de investigacion informe sobre el desempeÃ±o de los estudiantes de pregrado'),(256,' DiseÃ±ar un modelo de intervencion con perspectiva de genero, en el marco de familias con integrantes desmovilizados de grupos armados ilegales, que incluya protocolos de actuacion, para la prevencion de la violencia intrafamiliar.'),(257,'Modulos con la base conceptual, metodologica e instrumental para aplicar a un programa de intervencion, orientado a la prevencion del desarrollo de violencia en familias con personas desmovilizadas.'),(258,'Validacion del programa de intervencion en dos municipios.'),(259,'Publiacion del material guia para la implementacion del programa de intervencion (Modulos)'),(260,'Asesoria para la extension del programa de intervencion a otras zonas que se establezcan entre las partes del convenio.'),(261,'Las obligaciones que desde el convenio fueron contraidas con la entidad externa.'),(262,'Informe de los resultados de la aplicaciÃ³n de la encuesta '),(263,'Informe final de ejecuciÃ³n del proyecto  '),(264,'Articulo'),(265,'Formacion de estudiantes'),(266,'Ponencia en evento cientifico nacional o internacional'),(267,'Documento con revisiÃ³n de literatura y manuales nacionales internacionales sobre la oferta de servicios de asesorÃ­a para la prueba voluntaria de VIH en servicios de atenciÃ³n a personas con TB'),(268,'Documento con propuesta tÃ©cnica validada para la incorporaciÃ³n de los servicios de asesorÃ­a para la prueba de VIH en los servicios que prestan atenciÃ³n a la poblaciÃ³n con TB en el SGSSS Colombiano en versiÃ³n lista para impresiÃ³n (incluye redacciÃ³n, diagr'),(269,'Material pedagÃ³gico diseÃ±ado y validado para pacientes y prestadores que sirven de apoyo a la incorporaciÃ³n de los servicios mencionados (incluye redacciÃ³n, diagramaciÃ³n y copia en medio magnÃ©tico).'),(270,'Participar y coordinar con CISALVA-univalle el diseÃ±o, implementacion y evaluacion del modulo de conflictos, violencia y DH para cohorte del programa lideres en salud internaciona'),(271,'Disponer de 2 tutores'),(272,'Dar tutoria en los temas relacionados con conflictos y derechos humano'),(273,'Traducir al ingles las principales guias y contenidos basicos del curso.'),(274,'Escrito sobre factores de riesgo y protecciÃ³n asociados a ser agresor de la pareja'),(275,'Recomendaciones de cÃ³mo implementar y fortalecer programas y proyectos de prevenciÃ³n de la violencia'),(276,'Escrito sobre el cambio de la violencia conyugal y el maltrato a los hijos entre 2004 y 2007 en el valle de aburra'),(277,'Informe sobre el avance del anÃ¡lisis sobre factores de riesgo y protecciÃ³n asociados al maltrato infantil de la familia.'),(278,'Recomendaciones de cÃ³mo implementar y fortalecer programas y proyectos de prevenciÃ³n de la violencia'),(279,'Entrega del informe final.          '),(280,'PresentaciÃ³n del trabajo final ante la comunidad acadÃ©mica en al Facultad Nacional de Salud PÃºblica'),(281,'Certificado por parte del ComitÃ© editorial de una revista acadÃ©mica de haber recibido un artÃ­culo.'),(282,'PresentaciÃ³n del informe escrito en CD.     '),(283,'DivulgaciÃ³n de los resultados ante la comunidad acadÃ©mica de la Facultad Nacional de Salud PÃºblica.'),(284,'Certificado por parte del ComitÃ© editorial de una revista acadÃ©mica de haber recibido un artÃ­culo.'),(285,'PresentaciÃ³n del informe final del trabajo de grado en CD  '),(286,'DivulgaciÃ³n de los resultados de la investigaciÃ³n a la comunidad del corregimiento de San Cristobal.  '),(287,'DivulgaciÃ³n de los resultados de la investigaciÃ³n a la comunidad acadÃ©mica '),(288,'Certificado por parte del comitÃ© editorial de una revista acadÃ©mica de haber recibido un artÃ­culo.'),(289,'ElaboraciÃ³n y entrega del informe final de trabajo de grado a la Universidad y al municipio de ItaguÃ­.  '),(290,'SocializaciÃ³n de los resultados del proyecto a la comunidad acadÃ©mica universitaria en general, por medio de la exposiciÃ³n del trabajo en el auditorio de la FNSP.  '),(291,'CertificaciÃ³n del ComitÃ© editorial de una revista acadÃ©mica de haber recibido un artÃ­culo.'),(292,'PresentaciÃ³n del informe escrito del trabajo de grado '),(293,'DivulgaciÃ³n de los resultados de la investigaciÃ³n a la comunidad acadÃ©mica '),(294,'Certificado por parte del comitÃ© editorial de una revista acadÃ©mica de haber recibido un artÃ­culo.'),(295,'PublicaciÃ³n del artÃ­culo en revista indexada'),(296,'ParticipaciÃ³n de al menos un estudiante de pregrado o posgrado de los programas acadÃ©micos de la FNSP en la implementaciÃ³n del proyecto'),(297,'PresentaciÃ³n a manera de charla, conferencia o taller de los resultados obtenidos del proyecto con autorÃ­a de la FNSP (Grupo Salud Mental), U de A y una presentaciÃ³n a la comunidad indÃ­gena.'),(298,'RecolecciÃ³n de informaciÃ³n por paÃ­s'),(299,'Procesamiento y anÃ¡lisis con prueba de base de datos, control de calidad, resultados de prueba'),(300,' Informe de la reuniÃ³n de expertos'),(301,'CoordinaciÃ³n tÃ©cnica del proceso de recolecciÃ³n de datos por paÃ­s.'),(302,'Estudiante en formaciÃ³n de MaestrÃ­a en Salud PÃºblica'),(303,'Protocolo del estudio para establecer la prevalencia e intensidad de infecciones por geohelmintos (Ascaris lumbricoides, Trichuris trichiura y uncinarias) en niÃ±os en edad escolar en Antioquia.'),(304,' El protocolo debe ser concertado con las autoridades de salud y de educaciÃ³n de Antioquia, la representaciÃ³n de OPS/OMS en Colombia y el MPS - INS y avalado por ellas.'),(305,'Acta de reuniÃ³n presentaciÃ³n de la propuesta a las autoridades departamentales de salud.'),(306,'Archivos electrÃ³nicos de los productos de punto 1 y 2, en formato de MS  Word o MS Excel (no solamente en formato PDF).'),(307,' DiseÃ±o, validaciÃ³n, ediciÃ³n, de la intervenciÃ³n para la prevenciÃ³n secundaria de la violencia de pareja y publicaciÃ³n de los manuales para implementar esta intervenciÃ³n.'),(308,'Estudio sobre factores de riesgo y protecciÃ³n asociados al maltrato infantil en la familia, por sexo de la vÃ­ctima del agresor.'),(309,'DiseÃ±o, validaciÃ³n, ediciÃ³n para la intevenciÃ³n de prevenciÃ³n de la agresiÃ³n en niÃ±os y niÃ±as desde el nacimiento hasta los tres aÃ±os y publicaciÃ³n de los manuales para implementar esta intervenciÃ³n.'),(310,'AnÃ¡lisis descriptivo sobre las caracterÃ­sticas de las personas que han acudido en el Ãºltimo aÃ±o a los Centros Zonales de la Ciudad de MedellÃ­n del ICBF (base de datos proporcionada por el ICBF al Programa PREVIVA) y comparaciÃ³n con las caracterÃ­sticas de '),(311,'Socializar los resultados de la investigaciÃ³n ante las directivas del Colegio Conquistadores, FundaciÃ³n HÃ¡bitat, Teritorio y Medio Ambiente, estudiantes y docentes del colegio, en el Grupo de Salud y Ambiente y ante la corporaciÃ³n Ambiental del Ãrea Metro'),(312,'Realizar una publicaciÃ³n con los resultados del estudio'),(313,'Presentar los resultados del estudio en un evento nacional donde sea aprobada la presentaciÃ³n.'),(314,'FormaciÃ³n de dos estudiantes de doctorado de la Universidad de Antioquia OK'),(315,'DifusiÃ³n de resultados ante la comunidad agicultura del municipio de Marinilla del Oriente AntioqueÃ±o y ante entidades ambientales y ONG\'s relacionadas con la problemÃ¡tica de los plaguicidas.'),(316,'PublicaciÃ³n de artÃ­culo en revista A1, A2 o B.'),(317,'PresentaciÃ³n de resultados al menos en una conferencia o seminario a la comunidad universitaria.'),(318,' Informe sobre el desempeÃ±o del estudiante que paricipÃ³ en el proyecto, con copia a su hoja de vida acadÃ©mica.'),(319,'Taller sobre educaciÃ³n ambiental comunidad agricultora del municipio de Marinilla.'),(320,'FormaciÃ³n de un estudiante de doctorado en epidemiologÃ­a en la FNSP U de A'),(321,'ParticipaciÃ³n de estudiantes de pregrado de la U de A'),(322,'PasantÃ­a internacional'),(323,'DivulgaciÃ³n de los resultados en congreso nacional y/o internacional.'),(324,'Seminario de epidemiologÃ­a social, enfoques conceptuales y resultados de investigaciÃ³n relacionados con el impacto del contexto social en la salud tendiente a ampliar la panorÃ¡mica de la cadena causal que cree que estÃ¡n asociadas con los patrones de ECNT'),(325,'Una publicaciÃ³n cientÃ­fica en revista ISI (Web of science) o Scopus nacional y/o internacional A1-A2 y/o B(Revista BiomÃ©dica del Instituto Nacional de Salud Colombia, Revista OPS, Social Science and Medicine)'),(326,'Seminario de EpidemiologÃ­a social dirigido a la comunidad acadÃ©mica.'),(327,'Entrega de cronograma.'),(328,'Informe de prueba piloto'),(329,'Informe de avances cada 6 meses'),(330,'Informe final con el resultado de la investigaciÃ³n'),(331,'Informe final administrativo y financiero de la ejecucuiÃ³n de los recursos asignados por la ESE Metrosalud para el desarrollo del proyecto.'),(332,'DivulgaciÃ³n de los resultados en la ESE Metrosalud con los responsables de los programas de hipertensiÃ³n y diabetes, de salud familiar y a los que a bien considere la empresay el equipo directivo de la instituciÃ³n. PENDIENTE'),(333,'FormaciÃ³n de un Estudiante de MaestrÃ­a'),(334,'Someter un artÃ­culo a publicaciÃ³n en una revista internacional'),(335,'Someter un artÃ­culo para publicaciÃ³n en revista nacional indexada'),(336,'PresentaciÃ³n de los resultados en evento acadÃ©mico'),(337,'Se realizarÃ¡ una publicaciÃ³n en revista nacional o internacional indexada A1, A2 Ã³ B.'),(338,'Se presentarÃ¡n y socializarÃ¡n los resultados con la comunidad acadÃ©mica y con generadores de programas de reinserciÃ³n'),(339,'FormaciÃ³n de estudiante de pregrado de Gerencia de Sistemas de InformaciÃ³n en Salud.OK'),(340,'PublicaciÃ³n de un artÃ­culo en Revista Indexada, categorÃ­a A o B. '),(341,'La formaciÃ³n de tres estudiantes de pregrado: Dos estudiantes de prÃ¡cticas acadÃ©micas en investigaciÃ³n del Departamento de PsicologÃ­a de la Facultad de Ciencias Sociales y Humanas de la Universidad de Antioquia, y la tercera de la misma facultad. quien de'),(342,'AsÃ­ mismo las estudiantes participarÃ¡n en la ediciÃ³n de materiales. en la socializaciÃ³n de resultados y en la presentaciÃ³n final de la investigaciÃ³n en evento acadÃ©mico en la FNSP. Ok'),(343,'Una publicaciÃ³n cientÃ­fica en revista ISI (Web of science) o Scopus nacional y/o internacional A1-A2 y/o B(Revista BiomÃ©dica del Instituto Nacional de Salud Colombia, Revista OPS, Social Science and Medicine)'),(344,'PublicaciÃ³n en una revista revista indexada en categorÃ­a A,A1 o B de carÃ¡cter nacional o internacional.  '),(345,'DivulgaciÃ³n de resultados a la comunidad acadÃ©mica y tomadores de decisiones'),(346,'FormaciÃ³n de un estudiante de la FNSP. '),(347,'Los resultados de la investigaciÃ³n se darÃ¡n a conocer a las instituciones que participaron brindando informaciÃ³n requerida para el estudio, mediante comunicaciÃ³n con el resumen de los resultados obtenidos.'),(348,'PresentaciÃ³n de los resultados a la comunidad acadÃ©mica'),(349,'PresentaciÃ³n de los resultados de la investigaciÃ³n en un Congreso Nacional o internacional.'),(350,'ComunicaciÃ³n   cientÃ­fica  para  someter a evaluaciÃ³n para   PublicaciÃ³n en revista  Nacional o  Internacional categorÃ­a  A1 o A2'),(351,'Entrega de informe final del proyecto '),(352,'PublicaciÃ³n en una revista indexada, categorÃ­a A'),(353,'PresentaciÃ³n del trabajo en un evento cientÃ­fico nacional. '),(354,'FormaciÃ³n  de un estudiante de posgrado del Doctorado en Salud pÃºblica'),(355,'ContribuciÃ³n a la formaciÃ³n de un (1) estudiante de doctorado en salud pÃºblica.'),(356,'ContribuciÃ³n a la formaciÃ³n de un (1) estudiante de MaestrÃ­a en salud pÃºblica  Nal. de BogotÃ¡.Pendiente respuesta Colciencias, Vanesa Giraldo participaciÃ³n escritura de artÃ­culo'),(357,'PublicaciÃ³n de artÃ­culo en revista internacional indexada'),(358,'PublicaciÃ³n de artÃ­culo en revista nacional indexada.'),(359,'aller sobre  ConstrucciÃ³n de un modelo teÃ³rico / metodolÃ³gico para el anÃ¡lisis de las luchas por la salud.'),(360,'PresentaciÃ³n de resultados a la comunidad educativa a travÃ©s de una ponencia de orden nacional o internaciona'),(361,'RealizaciÃ³n de un foro con los actores e instituciones interesados en el tema donde se socializan y discuten los hallazgos.'),(362,'Entrega de Base de datos sobre lucha por la salud en Colombia entre 1994-2010 que incluye: actores convocantes, participantes, adversarios, tipo de lucha, cobertura, motivo de la protesta. '),(363,'ArtÃ­culo publicado en revista  A1 o A2'),(364,'DivulgaciÃ³n de resultados a la comunidad acadÃ©mica '),(365,'Vincular estudiante de pregrado de la FNSP '),(366,'PresentaciÃ³n informe final de la investigaciÃ³n por escrito'),(367,'SustentaciÃ³n pÃºblica del informe final de la investigaciÃ³n'),(368,'SocializaciÃ³n de los resultados de la investigaciÃ³n a la SecretarÃ­a de Salud, y las instituciones que participaron en el desarrollo.'),(369,'Un manuscrito (publicaciÃ³n cientÃ­fica) en medio fÃ­sico y magnÃ©tico (CD archivo'),(370,'Documento final en medio fÃ­sico y magnÃ©tico (CD en formato PDF), con los'),(371,'Documento final en medio fÃ­sico y magnÃ©tico (CD en formato PDF), con los resultados de la investigaciÃ³n, siguiendo las normas de presentaciÃ³n de resultados de investigaciÃ³n cientÃ­fica  y teniendo en cuenta la metodologÃ­a utilizada. Del informe final aprob'),(372,'Manuscrito (publicaciÃ³n cientÃ­fica) en medio fÃ­sico y magnÃ©tico para la revista Salud PÃºblica de MedellÃ­n, la cual deberÃ¡ presentarse siguiendo las normas para autores de esta revista. '),(373,'SocializaciÃ³n de los resultados de la investigaciÃ³n a la SecretarÃ­a de salud de MedellÃ­n, al sector acadÃ©mico y especialistas en el Ã¡rea, en un evento acadÃ©mico programado por las partes del convenio.'),(374,'Informe prueba piloto '),(375,'Informe parcial del proyecto'),(376,'Informe final del proyecto'),(377,'ArtÃ­culo publicado en revista nacional clasificada en publindex en categorÃ­a A1, A o B, o en revista extranjera en SCOPUS'),(378,'ElaboraciÃ³n y entrega del informe final a la Universidad.'),(379,'SocializaciÃ³n de los resultados del proyecto en el Grupo de InvestigaciÃ³n DemografÃ­a y Salud.'),(380,'Certificado del ComitÃ© Editorial de una revista acadÃ©mica de haber recibido el artÃ­culo para su publicaciÃ³n.'),(381,'ElaboraciÃ³n de 200 folletos con los principales resultados obtenidos en la investigaciÃ³n para ser entregado a las entidades gubernamentales.'),(382,'Entregar informe final en la biblioteca de la Facultad Nacional de Salud PÃºblica'),(383,'Un artÃ­culo con los resultados de la investigaciÃ³n para ser sometido a publicaciÃ³n en una revista categorÃ­a A.'),(384,'Entregar documento con los resultados de la investigaciÃ³n a Metrosalud.'),(385,'DivulgaciÃ³n de los resultados a la comunidad acadÃ©mica.'),(386,'Realizar al menos 1 charla sobre tuberculosis infantil al personal de salud de las instituciones participantes en el proyecto.'),(387,'Entrega de informe final a la Biblioteca de la Facultad Nacional de Salud PÃºblica'),(388,'PresentaciÃ³n sobre los resultados de la investigaciÃ³n, dirigida a acadÃ©micos de psicologÃ­a y salud mental, con invitaciÃ³n especial a las personas que participaron en el estudio.'),(389,'Entrega del informe final a la biblioteca de la Facultad Nacional de Salud Publica'),(390,'RealizaciÃ³n del diagnÃ³stico: base consolidada con los documentos de consulta al respecto.'),(391,'Micro site: Foro virtual'),(392,'Un foro presencial'),(393,'Tres (3) mesas de trabajo bajo metodologÃ­a inspirada en conferencias de Consenso ciudadano CCC'),(394,'Un informe que contenga: descripciÃ³n metodolÃ³gica; AnÃ¡lisis, resultados y logros de la experiencia participativa en sus diferentes fases; Documento de la agenda priorizada de ciencia, tecnologÃ­a e innovaciÃ³n en salud de la zona centro-occidente, 2010 - 2'),(395,'Tesis de investigaciÃ³n con los resultados en la biblioteca de la FNSP'),(396,'ArtÃ­culo publicado en revista nacional clasificada en publindex en categorÃ­a A1, A o B, o en revista extranjera en SCOPUS'),(397,'ParticipaciÃ³n como ponente en la â€œFiesta del libroâ€: presentaciÃ³n de avances en la contextualizaciÃ³n del proyecto y gestiÃ³n con las organizaciones comunitarias '),(398,'ParticipaciÃ³n en la Feria de la CT+I: presentaciÃ³n de avances MetodolÃ³gicos.'),(399,'ParticipaciÃ³n como ponente en evento propio de la Red de JÃ³venes Investigadores de Metrojuventud, AlcaldÃ­a de MedellÃ­n, Parque Explora.'),(400,'Entrega de Informe escrito con los resultados del proyecto'),(401,'Escritura de un artÃ­culo publicable en una revista nacional indexada'),(402,'Taller de socializaciÃ³n de resultados con la comunidad participante de la investigaciÃ³n, la sociedad civil, la red de organizaciones comunitarias y la Mesa Interbarrial de Desconectados.'),(403,'Cumplir con los tÃ©rminos de referencia que se proponen en la convocatoria.'),(404,'ParticipaciÃ³n en el mes de septiembre en la fiesta del libro: con avances generales del proyecto '),(405,'Participar en el mes de octubre en la Feria de la CT+I con los avances MetodolÃ³gicos'),(406,'Entrega  parcial del articulo publicable, el  8 de noviembre de 2011'),(407,'Entrega del artÃ­culo publicable: noviembre 15 de 2011'),(408,'Participar en el mes de diciembre en el evento propio de la Red de JÃ³venes investigadores y entrega del informe final de investigaciÃ³n'),(409,'PresentaciÃ³n de los resultados y el informe final ante el grupo de  InvestigaciÃ³n de Salud mental (GISAME) de la Facultad Nacional de Salud PÃºblica.'),(410,'Entrega del informe final en la biblioteca de la Facultad Nacional de Salud PÃºblica.'),(411,'RedacciÃ³n informe final'),(412,'Un artÃ­culo A1 o A2'),(413,'PresentaciÃ³n de los resultados como ponencia a nivel nacional y/o internacional.'),(414,'RecolecciÃ³n de informaciÃ³n por paÃ­s.'),(415,'Procesamiento y anÃ¡lisis con prueba de base de datos, control de calidad, resultados de prueba'),(416,'Informe de la reuniÃ³n de expertos'),(417,'CoordinaciÃ³n tÃ©cnica del proceso de recolecciÃ³n de datos por paÃ­s.'),(418,'Estudiante en formaciÃ³n de MaestrÃ­a en Salud PÃºblica'),(419,'Una presentaciÃ³n privada a los directivos de la InstituciÃ³n (Metrosalud)'),(420,'Una presentaciÃ³n pÃºblica en el auditorio de la Facultad Nacional de Salud PÃºblica'),(421,'Un informe tÃ©cnico dirigido a la instituciÃ³n'),(422,'Un artÃ­culo listo para publicar en una revista indexada nacional'),(423,'PresentaciÃ³n de los resultados ante la comunidad indÃ­gena del municipio de MedellÃ­n y ante entidades gubernamentales y no gubernamentales relacionadas con la problemÃ¡tica de los pueblos indÃ­genas.'),(424,'ArtÃ­culo en revista nacional clasificada en publindex en categorÃ­a A1, A o B, o en revista extranjera en SCOPUS. '),(425,'DifusiÃ³n de los resultados del estudio en un evento de carÃ¡cter nacional relacionado con el tema.'),(426,'Un producto de divulgaciÃ³n sobre los resultados de la investigaciÃ³n (artÃ­culo en revista de divulgaciÃ³n). Se homologÃ³ por diseÃ±o de video que fue publicado en la plataforma de You tube. '),(427,'FormaciÃ³n de estudiante de pregrado. '),(428,'Informe final de investigaciÃ³n a la MaestrÃ­a en Salud Mental'),(429,'Entrega de Informe  a la DirecciÃ³n del Sistema de Bibliotecas de la UdeA'),(430,'Entrega de informe final a la Biblioteca de la Facultad'),(431,'Entrega del Informe final en la biblioteca de la Facultad Nacional de Salud PÃºblica'),(432,'PublicaciÃ³n nacional de un artÃ­culo cientÃ­fico '),(433,'ArtÃ­culo en revista nacional clasificada en publindex en categorÃ­a A 1, A o B, o en revista extranjera en SCOPUS.Compromiso eliminado por medio de Adenda al acta 205.'),(434,'DifusiÃ³n de los resultados del estudio en un evento de carÃ¡cter nacional relacionado con el tema.relacionado con el tema.'),(435,'PublicaciÃ³n de artÃ­culo en revista indexada A1.'),(436,'ParticipaciÃ³n en el rol de autorÃ­a o coautorÃ­a con el estudiante de MaestrÃ­a, en la publicaciÃ³n de un artÃ­culo en una revista.'),(437,'DirecciÃ³n de un trabajo de investigaciÃ³n para optar el tÃ­tulo de Magister.'),(438,'PresentaciÃ³n de una conferencia o seminario a la comunidad universitaria sobre los resultados de la investigaciÃ³n. '),(439,'ParticipaciÃ³n con ponencia en un evento acadÃ©mico nacional o internacional.'),(440,'Informe sobre el desempeÃ±o del estudiante que participÃ³ en el proyecto, con copia a su hoja de vida acadÃ©mica. '),(441,'Elaborar un artÃ­culo de divulgaciÃ³n.'),(442,'Retroalimentar con la informaciÃ³n a las instituciones participantes en el  proceso   de investigaciÃ³n.'),(443,'PresentaciÃ³n de los resultados en un evento acadÃ©mico.'),(444,'ArtÃ­culo publicado en revista nacional clasificada en publindex en categorÃ­a A1, A o B, o en revista extranjera en SCOPUS'),(445,'Informe tÃ©cnico donde se describe la metodologÃ­a, resultados, conclusiones'),(446,'Plegable con un resumen ejecutivo de los principales hallazgos y recomendaciones'),(447,'PresentaciÃ³n en POWER POINT con la metodologÃ­a, resultado, conclusiones'),(448,'PresentaciÃ³n de los Resultados a la Junta Directiva y a los pilotos de ACDAC (los costos de desplazamiento de dos de las personas que participarÃ¡n en este convenio serÃ¡ asumido por la ACDAC)'),(449,'Entrega de CD con versiones electrÃ³nicas de todos los documentos que fueron revisados y analizados. Esta informaciÃ³n serÃ¡ entregada a la Junta Directiva de ACDAC en un mÃ¡ximo de diez (10) dÃ­as despuÃ©s de cumplido el plazo para concluir la investigaciÃ³n d'),(450,'Informe escrito con los resultados del proyecto en la Biblioteca de la FNSP.'),(451,'PublicaciÃ³n de un artÃ­culo en una revista Nacional indexada  A2. (CT 202 del 24/01/2017, aprobÃ³ cambio de categorÃ­a para la publicaciÃ³n en revista (A1 a A2) '),(452,'PresentaciÃ³n de resultados en jornadas de investigaciÃ³n FNSP.'),(453,'DivulgaciÃ³n de resultados en Coloquio Nacional de InvestigaciÃ³n.'),(454,'El CTI 202 del 24/01/2017recomienda considerar una vez vencido el 6 plazo, sino se ha logrado la publicaciÃ³n, cerrar el proyecto en consideraciÃ³n de la categorÃ­a de la revista (incluso A 2) pues estas revistas no se interesan por estos temas y menos cuand'),(455,'Informe tÃ©cnico que serÃ¡ entregado a las autoridades del INPEC y la CÃ¡rcel de MÃ¡xima Seguridad de ItaguÃ­. Pendiente solicitarle soportes del acuerdo con el instituto para valer este compromiso con las ponencias.'),(456,'Ponencia que serÃ¡ presentada en eventos acadÃ©micos tipo congreso, seminario o foro. Ok'),(457,'Un producto de divulgaciÃ³n sobre los resultados de la investigaciÃ³n (artÃ­culo en revista de divulgaciÃ³n)'),(458,'Informe tÃ©cnico con resumen ejecutivo que contenga los resultados mÃ¡s relevantes del estudio.'),(459,'PresentaciÃ³n en power point con la metodologÃ­a, resultados conclusiones y recomendaciones'),(460,'PresentaciÃ³n de los resultados a la Junta directiva y a un grupo significativo de los trabajadores de Copa Airlines Colombia'),(461,'Entrega de Cd con la totalidad de los materiales, docmentos, bases de datos y demÃ¡s que dieron soporte al estudio'),(462,'PublicaciÃ³n de artÃ­culo de difusiÃ³n cientÃ­fica, en revista A1 o A2, que dÃ© cuenta del estimativo de los tamaÃ±os de la poblaciÃ³n.'),(463,'Entrega de informe resumen del estudio para entregar al Instituto Colombiano de Bienestar Familiar, la AlcaldÃ­a Municipal, entidades de control y organismos del Sistema Nacional de Bienestar Familiar y del Sistema General de Seguridad Social en Salud'),(464,'ElaboraciÃ³n de pÃ³ster que representa los resultados en mapas de las comunas de estudio'),(465,'SocializaciÃ³n de los resultados en evento acadÃ©mico.'),(466,'SocializaciÃ³n de los resultados en espacios de gestiÃ³n de polÃ­tica pÃºblica en la ciudad (ComitÃ© TÃ©cnico de PolÃ­tica PÃºblica de Infancia y Adolescencia, COMPOS, COPACO, Concejo de MedellÃ­n, otros).'),(467,'FormaciÃ³n de estudiante de pregrado. Ok'),(468,'Informe final en formato de artÃ­culo publicable'),(469,'ElaboraciÃ³n de un informe que se presentarÃ¡ al ComitÃ© de programa de la maestrÃ­a en EpidemiologÃ­a de la Facultad Nacional de Salud PÃºblica de la Universidad de AntioquÃ­a, del cual se tendrÃ¡ una copia en la Biblioteca.'),(470,'PresentaciÃ³n pÃºblica de los resultados en una reuniÃ³n acadÃ©mica programada por la lÃ­nea de AnÃ¡lisis de SituaciÃ³n de Salud â€” ASIS â€” de la MaestrÃ­a en EpidemiologÃ­a de la Facultad Nacional de Salud PÃºblica de la Universidad de Antioquia.'),(471,'SocializaciÃ³n de los resultados en instituciones pÃºblicas y privadas (organizaciones sociales, ONGs, autoridades de salud) que estÃ©n interesadas en formular intervenciones que favorezcan la inclusiÃ³n social y el mejoramiento del estado de salud y de la ca'),(472,'EnvÃ­o para publicaciÃ³n de un artÃ­culo con los resultados de la investigaciÃ³n en una revista nacional indexada'),(473,'FormaciÃ³n de dos estudiantes de pregrado de programas de ciencias sociales y de la salud de la Universidad de la Guajira.'),(474,'FormaciÃ³n de un estudiante de doctorado inscrito a un programa de ciencias sociales y de la salud.'),(475,'FormaciÃ³n de un estudiante de doctorado inscrito a un programa de ciencias sociales y de la salud.'),(476,'CreaciÃ³n de un semillero de investigaciÃ³n en salud pÃºblica, con 5 estudiantes en formaciÃ³n de la Universidad de la Guajira.'),(477,'VinculaciÃ³n de 5 estudiantes de investigaciÃ³n en salud pÃºblica del semillero de epidemiologÃ­a UdeA'),(478,'Curso interuniversitario de promociÃ³n y prevenciÃ³n de VIH y otras ITS que incluye 12 estudiantes de la Universidad de la Guajira,'),(479,'Un libro sobre la experiencia del trabajo con los wayÃ¼u en relaciÃ³n con los hallazgos de la investigaciÃ³n con indÃ­genas en CristianÃ­a (Soroeste AntioqueÃ±o)'),(480,'Un artÃ­culo en revista acerca de las percepciones del uso y aceptaciÃ³n del condÃ³n en la comunidad Wayuu.'),(481,'Un artÃ­culo en revista acerca de la efectividad del proceso de formaciÃ³n de los lÃ­deres.'),(482,'Un artÃ­culo en revista sobre la caracterizaciÃ³n de la situaciÃ³n de VIH desde los determinantes en las comunidades Wayuu.'),(483,'Una cartilla donde se presentan las guÃ­as de intervenciÃ³n en salud sexual y reproductiva contextualizadas al medio.'),(484,'Un libro (material educativo) acerca de la prevenciÃ³n del VIH y otras ITS. Segunda ediciÃ³n'),(485,'Una ponencia, exposiciÃ³n de resultados en un congreso internacional'),(486,'Dos ponencias, exposiciÃ³n de resultados en congresos regionales'),(487,'CreaciÃ³n del Sistema de informaciÃ³n geogrÃ¡fica (SIG) de la comunidad Wayuu de Maicao.'),(488,'Ocho programas de radio sobre educaciÃ³n en prevenciÃ³n de VIH en lengua Wayuunaiki y en espaÃ±ol'),(489,'Video sobre las experiencias del proceso con la comunidad Wayuu.'),(490,'FormaciÃ³n de un estudiante de maestrÃ­a o doctorado, salud pÃºblica, ciencias polÃ­ticas '),(491,'ArtÃ­culo de prensa que presente los hallazgos mÃ¡s relevantes'),(492,'Dos artÃ­culos de resumen con los hallazgos relevantes para revista indexada nacional o internacional '),(493,'Un libro que presente los principales resultados (500 ejemplares impresos) '),(494,'Una ponencia, presentaciÃ³n de resultados en un congreso nacional o internacional en temÃ¡ticas con la salud. '),(495,'Apoyar en la formaciÃ³n de estudiante de maestrÃ­a para adquirir capacidades para trabajo de campo.'),(496,'ArtÃ­culo en revista: magnitud de las conductas de riesgo para la salud'),(497,'ArtÃ­culo en revista: Efectos de la polÃ­tica pÃºblica de prevenciÃ³n de la violencia y promociÃ³n de la convivencia del valle de aburra'),(498,'ArtÃ­culo en revista: EvaluaciÃ³n de la implementaciÃ³n de la polÃ­tica pÃºblica'),(499,'Informe tÃ©cnico: Conocimiento sobre los factores asociados a las de violencia interpersonal, agresor de la pareja y del menor de 5 aÃ±os y del consumo de licor hasta la embriaguez.'),(500,'Informe tÃ©cnico efectos de la polÃ­tica: Conocimiento a cerca de los efectos de la polÃ­tica pÃºblica de prevenciÃ³n de la violencia y promociÃ³n de la convivencia MedellÃ­n y el Ã¡rea metropolitana.'),(501,'Informe tÃ©cnico: Conocimiento acerca del grado de avance en el logro de las metas de la polÃ­tica pÃºblica de prevenciÃ³n de la violencia y promociÃ³n de la convivencia.'),(502,'Informe tÃ©cnico: Conocimiento acerca del grado de avance en el logro de las metas de la polÃ­tica pÃºblica de prevenciÃ³n de la violencia y promociÃ³n de la convivencia'),(503,'Informe tÃ©cnico: EvaluaciÃ³n de la implementaciÃ³n de la polÃ­tica pÃºblica de prevenciÃ³n de la violencia y promociÃ³n de la convivencia MedellÃ­n y el Ã¡rea metropolitana.'),(504,'Informe tÃ©cnico: Conocimiento acerca de la variaciÃ³n en los factores de riesgo y protecciÃ³n asociados a la agresiÃ³n y a las conductas de riesgo para la salud.'),(505,'Informe tÃ©cnico: Conocimiento acerca del grado de satisfacciÃ³n de los actores involucrados con respecto a la implementaciÃ³n o no de la polÃ­tica pÃºblica de prevenciÃ³n de la violencia.'),(506,'Informe tÃ©cnico: Conocimiento acerca del grado de avance en el logro de las metas de la polÃ­tica pÃºblica de prevenciÃ³n de la violencia y promociÃ³n de la convivencia MedellÃ­n y el Ã¡rea metropolitana.'),(507,'Informe tÃ©cnico: Conocimiento acerca del grado de satisfacciÃ³n de los actores involucrados con respecto a la implementaciÃ³n o no de la polÃ­tica pÃºblica'),(508,'Informe tÃ©cnico: TriangulaciÃ³n de avance, continuidad y sostenibilidad de la polÃ­tica pÃºblica de prevenciÃ³n de la violencia y promociÃ³n de la convivencia MedellÃ­n y el Ã¡rea metropolitana.'),(509,'Se realizara una publicaciÃ³n en ISI (Web of Science) o Scopus o en revista Al o A2'),(510,'ArtÃ­culo de revista, libro o capitulo de libro en el que se encuentren los resultado de investigaciÃ³n con participaciÃ³n del estudiante en formaciÃ³n'),(511,'Un artÃ­culo en revista de divulgaciÃ³n'),(512,'Se dirigirÃ¡ un trabajo de investigaciÃ³n para optar al titulo de Magister. Se presentarÃ¡ un informe sobre el desempeÃ±o del estudiante durante el desarrollo del estudio con copia a su respectiva hoja de vida'),(513,'Se realizarÃ¡ el acta de inicio en la que estarÃ¡ consignado el acuerdo de propiedad intelectual.'),(514,'Se realizarÃ¡ un acta de finalizaciÃ³n de proyecto firmada por el Jefe del Centro de Investigaciones y por los investigadores.'),(515,'Se realizarÃ¡ un acta de liquidaciÃ³n del proyecto.'),(516,'PresentaciÃ³n de resultados en evento acadÃ©mico internacional.'),(517,'Se realizarÃ¡ un taller con la comunidad acadÃ©mica para la presentaciÃ³n de los resultados.'),(518,'ArtÃ­culo en revista ISI (WEB of Science) o Scopus en revista A1 o A2.      '),(519,'ArtÃ­culo de revista de autorÃ­a o en coautorÃ­a del estudiante.'),(520,'ArtÃ­culo en revista de divulgaciÃ³n.'),(521,'DirecciÃ³n de trabajo de investigaciÃ³n para optar al tÃ­tulo de Magister.'),(522,'PresentaciÃ³n de resultados en un congreso a nivel nacional'),(523,'PresentaciÃ³n de los resultado de la investigaciÃ³n a los actores (empresas Promotoras de Servicios â€“ EPS), participantes en el proyecto. '),(524,'Informe final sobre los resultados de la investigaciÃ³n'),(525,'Informe sobre el desempeÃ±o del estudiante que participÃ³ en el proyecto, con copia a su hoja de vida acadÃ©mica.'),(526,'ArtÃ­culo en revista ISI (WEB of Science) o Scopus en revista A1 o A2. (Objetivo 5 Adenda)'),(527,'Certificado de entrega del informe final a la biblioteca de la FNSP'),(528,'Certificado de divulgaciÃ³n de los resultados de la investigaciÃ³n'),(529,'Un artÃ­culo publicado en revistas ISI (Web of Science) o Scopus o en revistas ; Al o A2'),(530,'DirecciÃ³n de un trabajo de investigaciÃ³n para optar al tÃ­tulo de MagÃ­ster'),(531,'ParticipaciÃ³n en un congreso nacional o internacional con ponencias o poster'),(532,'PresentaciÃ³n de una conferencia o un seminario a la comunidad universitaria sobre los resultados de la investigaciÃ³n'),(533,'PresentaciÃ³n de los resultados al ICBF'),(534,'Certificado de entrega del informe final en la biblioteca de la FNSP'),(535,'Resumen de los resultados de investigaciÃ³n a la IPS universitaria y ClÃ­nica Sagrado CorazÃ³n'),(536,'Entrega del informe final a la biblioteca de la FNSP'),(537,'PresentaciÃ³n de los resultados preliminares en el dÃ­a Mundial de la TB 2012 y/o a los funcionarios encargados del PCT de MedellÃ­n.'),(538,'Entrega de informe final a la biblioteca FNSP'),(539,'Dos evaluaciones de dos expertos diferentes '),(540,'Dos evaluaciones emitidas por dos expertos con amplia experiencia en bioestadistica y en la estimaciÃ³n de modelos aplicables a estudios epidemiologicos'),(541,'Un resumen ejecutivo de los hallazgos de la evaluaciones '),(542,'Un informe de evaluaciÃ³n que incluya la metodologÃ­a utilizada y los anexos que se requieran para su sustenctaciÃ³n'),(543,'Una presentaciÃ³n ante ASOCAÃ‘A, la asociaciÃ³n neumologica colombiana y la Universidad de la salle sobre los resultados de la evaluaciÃ³n'),(544,'Un archivo en power point con los puntos mas importantes de los hallazgos.'),(545,'Informe Parcial'),(546,'Informe final'),(547,'Resumen ejecutivo: de maximo dos pÃ¡ginas en el que se resalte de forma suscinta y clara: temas de foco, metodologÃ­a, conclusiones/recomendaciones de acuerdo al anexo 1.'),(548,'PresentaciÃ³n del informe escrito del trabajo de grado. '),(549,'DivulgaciÃ³n de los resultados de la investigaciÃ³n a la comunidad acadÃ©mica.'),(550,'Certificado por parte del comitÃ© editorial de una revista academica  de haber recibido el articulo.'),(551,'Documento final de la investigacion'),(552,'ArtÃ­culo para publicar en la revista de Salud PÃºbica de MedellÃ­n'),(553,'Actividad de SocializaciÃ³n ante el sector academico y la secretaria de salud de los resultados mÃ¡s relevantes'),(554,'Documento con la construcciÃ³n de planes institucionales de control de la tuberculosis, con base en los resultados encontrados.'),(555,'Entregar informe de avance e informe final asÃ­:informe parcial- septiembre 2012,informe final- Diciembre 2012'),(556,'FormaciÃ³n de un estudiante de Doctorado en EpidemiologÃ­a '),(557,'Dos envios de artÃ­culos de revistas nacional o internacional '),(558,'Una presentaciÃ³n pÃºblica de los resultados '),(559,'Documento que consolide la metodologÃ­a sobre planes locales de control de la tuberculosis en las unidades hospitalarias'),(560,'GuÃ­a nacional de prevenciÃ³n de la transmisiÃ³n institucional de la tuberculosis de acuerdo con las orientaciones de la OMS y las mejores tecnologÃ­as disponibles OK'),(561,'YOMI VIDA: realizar cuatro grpos focales con niÃ±os y niÃ±as de cuarto grado y uno con un grupo de docentes, ambos pertenecientes  a las 42 instituciones educativas que han estado en el proceso 2009-2011.'),(562,'RETOMEMOS: realizar cuatro grupos focales con jovenes que han participado en el programa 2010-2011 y un grupo de docentes de dichas instituciones.'),(563,'Elaborar y presentar informe parcial e informe final'),(564,'Informe parcial de avance'),(565,'Informe final contentivo de los productos y actividades pactadas, el cual deberÃ¡ ser entregado en medio fÃ­sico y copia magnÃ©tica'),(566,'Documento con el ajuste del protocolo y marco muestral utilizados en la prueba piloto realizada por la Universidad durante los aÃ±os 2011-2012, en cuanto a su diseÃ±o metodolÃ³gico, de tal manera que se adapte para la Encuesta Nacional de Parasitismo Intesti'),(567,'Documento con los resultados de la encuesta realizada que comprende: la toma de muestra de material fecal y hemoglobina, pesar y tallar a los participantes; la aplicaciÃ³n de una encuesta escrita de factores de riesgo y desempeÃ±o escolar, y el analisis de'),(568,'Elaborar Acta de propiedad intelectual'),(569,'Entrega de informe final que de cuenta  del proceso de validaciÃ³n del instrumento ISO-30 en el centro de investigaciÃ³n en fÃ­sico y en CD (octubre 2013).'),(570,'FormaciÃ³n de un estudiante de MaestrÃ­a'),(571,'ArtÃ­culo publicado en revista A1, A2 o B reconocido por Colciencias (Octubre 2013). Compromiso homologado por:  ArtÃ­culo impreso, â€œValidation of the Spanish Version of the Inventory of Suicide Orientation - ISO 30 in Adolescent Students of Educational Ins'),(572,'PresentaciÃ³n oral o en poster de los resultados de la validaciÃ³n del instrumento en evento academico (junio 2013): Compromiso homologado por: CertificaciÃ³n de un taller realizado con docentes en la instituciÃ³n educativa PresbÃ­tero Antonio JosÃ© Bernal Lon'),(573,'SocializaciÃ³n de los resultados con los desempleados participantes  en el estudio y demÃ¡s actores involucrados.'),(574,'ArtÃ­culo publicado en revista indexada nacional A1 SCOPUS o ISI'),(575,'DivulgaciÃ³n de los resultados en evento acadÃ©mico nacional o internacional. '),(576,'Entrega de informe final al Centro de InvestigaciÃ³n y a la Biblioteca FNSP. '),(577,'Un informe final tecnico y financiero en el mes de enero de 2013.'),(578,'Exponer los avances en investigaciÃ³n en el campo de los fenomenos de consumo de SPA y su asociaciÃ³n con la salud mental con la Salud Mental en la regiÃ³n.'),(579,'Presentar los avances, en los diseÃ±ios, ejecuciÃ³n y evaluaciÃ³n de los programas e intervenciones clÃ­nicas, comunitarias y de apoyo psicosocial para el abordaje del fenomeno de los consumos de SPA en la regiÃ³n.'),(580,'Realizar un evento del 01 al 02 de noviembre 2012'),(581,'Garantizar la participaciÃ³n de minimo un conferencista nacional'),(582,'Garantizar la participaciÃ³n de minimo dos conferencistas internacionales'),(583,'Entrega de informe final a la Biblioteca de la Facultad'),(584,'Divulgar los resultados de la investigaciÃ³n, al menos en una instituciÃ³n que trabaje con niÃ±os en situaciÃ³n de calle. '),(585,'Publicar un artÃ­culo en una Revista indexada A1, A2 o B del Publindex.'),(586,'Presentar los resultados de la investigaciÃ³n en las Facultades de Salud PÃºblica  y EnfermerÃ­a '),(587,'Participar como ponente en un evento nacional, con el fin de divulgar los resultados de la investigaciÃ³n'),(588,'Presentar un informe acerca de los avances logrados por el estudiante de pregrado en el desarrollo de la investigaciÃ³n '),(589,'Presentar a una convocatoria interna un proyecto de investigaciÃ³n, que permita avanzar en el abordaje  de la temÃ¡tica de niÃ±ez en situaciÃ³n de calle desde una perspectiva que involucre la opiniÃ³n de los niÃ±os. '),(590,'Componente de capacitaciÃ³n '),(591,'proceso de capacitaciÃ³n a mediadores y a profesionales: DiseÃ±o de capacitaciones, guÃ­as metodolÃ³gicas y kit de materiales; CapacitaciÃ³n a mediadores; CapacitaciÃ³n a profesionales de salud y personal de la salud.'),(592,'DiseÃ±o de seminarios de juventudes'),(593,'Componente fortalecimiento de la participaciÃ³n juvenil en salud'),(594,'Levantamiento de linea de base de la participaciÃ³n juvenil, con enfasis en temas de salud en la ciudad de MedellÃ­n: diagnistico situacional de la participaciÃ³n juvenil en MedellÃ­n; Diagnostico rapido participativo con lideres significativos juveniles'),(595,'procesos de capacitaciÃ³n para el fortalecimiento en ciudadania juvenil: diseÃ±o y producciÃ³n de la estrategÃ­a para capacitaciÃ³n en participaciÃ³n en salud y ciudadania juvenil; capacitaciÃ³n a jÃ³venes'),(596,'procesos de capacitaciÃ³n para el fortalecimiento en ciudadania juvenil: diseÃ±o y producciÃ³n de la estrategÃ­a para capacitaciÃ³n en participaciÃ³n en salud y ciudadania juvenil; capacitaciÃ³n a jÃ³venes'),(597,'procesos de acompaÃ±amiento a los jÃ³venes para su inserciÃ³n en espacios de participaciÃ³n en salud'),(598,'desarrollo de propuestas comunicacionales y artisticas relacionadas con tema  de salud de jÃ³venes para jÃ³venes: propuestas que han sido desarrolladas y que tengan algÃºn grado de implementaciÃ³n; Ideas de propuestas que requieran 100% de desarrollo e imple'),(599,'Componente sistema de monitoreo y evaluaciÃ³n'),(600,'Hacer delimitaciÃ³n de indicadores '),(601,'DiseÃ±ar un instrumento para recojer la informaciÃ³n de manera sencilla y sistematica (herramienta tecnologica) que permita recoger la informaciÃ³n significativa de los distintos componentes del programa.'),(602,'proceso de seguimiento y evaluaciÃ³n de la estrategia de servicios amigables para adolescentes y jovenes: EvaluaciÃ³n de la implementaciÃ³n del programa servicios amigables para jÃ³venes; EvaluaciÃ³n del impacto de la efectividad de la estrategÃ­a.'),(603,'Componente de sistematizaciÃ³n de la experiencia.'),(604,'Antecedentes del programa jÃ³venes por la vida'),(605,'ImplementaciÃ³n del prograna jÃ³venes por la vida'),(606,'delimitaciÃ³n de un modelo'),(607,'PresentaciÃ³n del informe escrito del trabajo de grado'),(608,'DivulgaciÃ³n de la investigaciÃ³n a la comunidad academica.'),(609,'Certificado de aceptaciÃ³n de resumen en un evento academico'),(610,'Entrega de informe de la investigaciÃ³n a la comunidad de esfuerzos de paz II'),(611,'ArtÃ­culo publicado en revista nacional o internacional indexada A1, A2 o B'),(612,'Socializar los resultados en la comunidad academica y con generadores de procesos y programas'),(613,'FormaciÃ³n de un estudiante'),(614,'FormaciÃ³n de un estudiante de doctorado en epidemiologÃ­a'),(615,'FormaciÃ³n de tres estudiantes de pregrado'),(616,'FormaciÃ³n de tres profesionales del Ã¡rea de la salud del proyecto (mÃ©dico y enfermeras) y una profesional en gerencia en sistemas de informaciÃ³n en salud'),(617,'FormaciÃ³n de cien personas privadas de la libertad, personal de guardia del INPEC, personal de sanidad de las tres cÃ¡rceles'),(618,'Dos artÃ­culos sometidos a dos revistas, una nacional y una internacional,clasificada como Al del sistema Publindex'),(619,'Memorias de la presentaciÃ³n de los resultados del proyecto en dos eventos'),(620,'Un folleto sobre sÃ­ntomas respiratorios y tuberculosis'),(621,'Una cartilla sobre tuberculosis, tratamiento y seguimiento'),(622,'Cien certificados de entrenamiento en el sistema de vigilancia implementado en'),(623,'Un protocolo de sistema de vigilancia'),(624,'Se trabajarÃ¡ en conjunto con Manitoba HIV Program para asesorÃ­a permanente'),(625,'DifusiÃ³n de los resultados cuatro ComitÃ© de Vigilancia EpidemiolÃ³gica en eventos acadÃ©micos y en la reuniÃ³n del del Departamento de Antioquia'),(626,'PresentaciÃ³n de los resultados del proyecto en dos eventos cientÃ­ficos, uno nacional y otro internacional'),(627,'Quince presentaciones de socializaciÃ³n de los resultados a las personas privadas de la libertad, al personal de salud y de guardia del INPEC'),(628,'Diez talleres de entrenamiento sobre TB y sÃ­ntomas respiratorios, asÃ­ como del funcionamiento del programa de TB que se estÃ¡n implementando realizado a las personas privadas de la libertad, al personal de salud y de guardia del INPEC y a las autoridades d'),(629,'Un video sobre la TB y sÃ­ntomas respiratorios en centros penitenciarios, el cual'),(630,'Una pasantÃ­a internacional del estudiante de doctorado.'),(631,'FormaciÃ³n de un estudiante de maestrÃ­a'),(632,'RealizaciÃ³n de un evento para presentar los resultados y sus implicaciones en las politicas publicas'),(633,'PublicaciÃ³n de artÃ­culo en revista indexada acerca de los efectos del programa en las conductas de los niÃ±os'),(634,'RealizaciÃ³n  de un taller con 300 docentes de 16 escuelas sobre el conocimiento de los efectos del programa y como mejorar su implementaciÃ³n.'),(635,'Promover programas de prevenciÃ³n temprana de las conductas de riesgo en escolares y preescolares del Ã¡rea meropolitana del valle de AburrÃ¡ y otros municipios'),(636,'Una pasantÃ­a en universidad extranjera para profundizar analisis de la informaciÃ³n.'),(637,'Dos ponencias sobre los resultados en eventos nacionales o internacionales'),(638,'Conocer el efecto atribuible al programa y como se cambian las trayectorias hacia las conductas de riesgo.'),(639,'PÃºblicaciÃ³n de un artÃ­culo cientÃ­fico en la revista indexada en septiembre 2013.'),(640,'PresentaciÃ³n de resultados en Congreso Internacional de Salud PÃºblica Noviembre 2013.'),(641,'FormaciÃ³n de un estudiante de doctorado en Salud Comunitaria.'),(642,'SocializaciÃ³n de los resultados a nivel comunitario y/o institucional'),(643,'Entrega de informe final a la bibloteca FNSP'),(644,'Informe final de evaluaciÃ³n externa que contengan los productos de la Fase I, Fase II,  Fase III relacionados en el contrato.'),(645,'Cronograma y prueba piloto '),(646,'Informe de avance '),(647,'Informe final'),(648,'ArtÃ­culo presentado a publicar en revista internacional indexada'),(649,'PresentaciÃ³n de los resultados en conferencia nacional '),(650,'PresentaciÃ³n de los resultados a la comunidad general'),(651,'PresentaciÃ³n de los resultados a la comunidad academica'),(652,'AnÃ¡lisis de la revisiÃ³n bibliogrÃ¡fica de sistemas de indicadores de atenciÃ³n mÃ©dica prehospitalaria para accidentes de trÃ¡nsito. '),(653,'AnÃ¡lisis del marco legal colombiano vigente en materia de atenciÃ³n mÃ©dica prehospitalaria para accidentes de trÃ¡nsito'),(654,'Propuesta inicial del sistema de indicadores a ser adoptados en el contexto nacional el cual se someterÃ¡ a aprobaciÃ³n de la CFPV'),(655,'Listado de actores, entidades y sistemas de informaciÃ³n clave para acceder a informaciÃ³n relacionada con atenciÃ³n mÃ©dica prehospitalaria para accidentes de transito en el paÃ­s.'),(656,'AnÃ¡lisis preliminar de los factores crÃ­ticos que afectan la disponibilidad y viabilidad de consulta de informaciÃ³n y, por ende, la estimaciÃ³n del sistema de indicadores.Este producto deberÃ¡ ser entregado seis (6) semanas despuÃ©s de la firma del acta de in'),(657,'Documento con las fichas tÃ©cnicas de cada uno de los indicadores del sistema,construidas acogiendo la normatividad tÃ©cnica vigente sobre indicadores de salud.'),(658,'PresentaciÃ³n de la propuesta metodolÃ³gica para estimar el sistema de indicadores de atenciÃ³n mÃ©dica prehospitalaria para accidentes de trÃ¡nsito.'),(659,'Listado de contactos identificados para revisar/consultar fuentes de informaciÃ³n y realizar entrevistas a las que haya lugar, en la concesiÃ³n vial y las ciudades del grupo objetivo, junto con cronograma tentativo de citas. '),(660,'Este producto deberÃ¡ ser entregado nueve (9) semanas despuÃ©s de la firma del acta de inicio.'),(661,'PresentaciÃ³n que incluya la exposiciÃ³n de los resultados del pilotaje en una ciudad pequeÃ±a y una intermedia.'),(662,'PresentaciÃ³n del sistema de indicadores '),(663,'Informe final (este producto deberÃ¡ ser entregado 22 semanas despues de la firma del acta de inicio). '),(664,'PresentaciÃ³n de las principales conclusiones      '),(665,'Asistencia a reuniones periÃ³dicas de seguimiento.                                                      '),(666,'Publicado en revista nacional o internacional indexada'),(667,'Socializar los resultados en la comunidad academica '),(668,'Socializar los resultados con los diferentes actores generadores de procesos y programas en salud mental'),(669,'FormaciÃ³n de un estudiante de pregrado'),(670,'Entrega del informe final a la biblioteca de la FNSP'),(671,'Informe ejecutivo con los resultados de la investigaciÃ³n para el INS y el Ministerio de Salud y protecciÃ³n social (direcciÃ³n de salud pÃºblica y subdirecciones de salud ambiental, epidemiologica y demografica).'),(672,'PresentaciÃ³n pÃºblica de la investigaciÃ³n (proceso y/o resultado) en un evento (talleres o seminarios o club de revista) organizado directamente por la dependencia academica o investigativa a cargo del proyecto.'),(673,'ArtÃ­culo con  los resultado de la investigaciÃ³n para la publicaciÃ³n en una revista indexada nacional o internacional categorÃ­a A o B.'),(674,'PresentaciÃ³n de resultados en la conferencia cientÃ­fica del Instituto Nacional de Salud.'),(675,'Realizar un estudio exploratorio que permita conocer las necesidades de formaciÃ³n que tienen las diversas organizaciones que trabajan  en el Ã¡mbito de atenciÃ³n psicosocial en desastres y emergencias en Colombia.   '),(676,'Realizar un estudio exploratorio sobre las creencias y realidades en materia de atenciÃ³n psicosocial en desastres que tienen los diferentes actores sociales.                                                                                                  ');
/*!40000 ALTER TABLE `tiposcompromiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposcontrato`
--

DROP TABLE IF EXISTS `tiposcontrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposcontrato` (
  `idTipoContrato` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoContrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposcontrato`
--

LOCK TABLES `tiposcontrato` WRITE;
/*!40000 ALTER TABLE `tiposcontrato` DISABLE KEYS */;
INSERT INTO `tiposcontrato` VALUES (1,'Contrato'),(2,'Convenio'),(3,'SD');
/*!40000 ALTER TABLE `tiposcontrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposentidad`
--

DROP TABLE IF EXISTS `tiposentidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposentidad` (
  `idTipoEntidad` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoEntidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposentidad`
--

LOCK TABLES `tiposentidad` WRITE;
/*!40000 ALTER TABLE `tiposentidad` DISABLE KEYS */;
INSERT INTO `tiposentidad` VALUES (1,'EducaciÃ³n'),(2,'Empresa'),(3,'ONG'),(4,'Municipal'),(5,'Departamental'),(6,'Departamento Administrativo'),(7,'Ministerio'),(8,'Instituto de InvestigaciÃ³n'),(9,'Instituto Descentralizado');
/*!40000 ALTER TABLE `tiposentidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposestudiantes`
--

DROP TABLE IF EXISTS `tiposestudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposestudiantes` (
  `idTipoEstudiante` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposestudiantes`
--

LOCK TABLES `tiposestudiantes` WRITE;
/*!40000 ALTER TABLE `tiposestudiantes` DISABLE KEYS */;
INSERT INTO `tiposestudiantes` VALUES (1,'Pregrado'),(2,'MaestrÃ­a'),(3,'Doctorado'),(4,'Egresado'),(5,'EspecializaciÃ³n Medico Quirurgica');
/*!40000 ALTER TABLE `tiposestudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposfuentefinanciacion`
--

DROP TABLE IF EXISTS `tiposfuentefinanciacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposfuentefinanciacion` (
  `idTipoFuenteFinanciacion` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoFuenteFinanciacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposfuentefinanciacion`
--

LOCK TABLES `tiposfuentefinanciacion` WRITE;
/*!40000 ALTER TABLE `tiposfuentefinanciacion` DISABLE KEYS */;
INSERT INTO `tiposfuentefinanciacion` VALUES (1,'Interna'),(2,'Externa');
/*!40000 ALTER TABLE `tiposfuentefinanciacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposfuentefinanciacionproyecto`
--

DROP TABLE IF EXISTS `tiposfuentefinanciacionproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposfuentefinanciacionproyecto` (
  `idTipoFuenteFinanciacionProyecto` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoFuenteFinanciacionProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposfuentefinanciacionproyecto`
--

LOCK TABLES `tiposfuentefinanciacionproyecto` WRITE;
/*!40000 ALTER TABLE `tiposfuentefinanciacionproyecto` DISABLE KEYS */;
INSERT INTO `tiposfuentefinanciacionproyecto` VALUES (1,'Principal'),(2,'Secundaria');
/*!40000 ALTER TABLE `tiposfuentefinanciacionproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposidentificacion`
--

DROP TABLE IF EXISTS `tiposidentificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposidentificacion` (
  `idTipoIdentificacion` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoIdentificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposidentificacion`
--

LOCK TABLES `tiposidentificacion` WRITE;
/*!40000 ALTER TABLE `tiposidentificacion` DISABLE KEYS */;
INSERT INTO `tiposidentificacion` VALUES (1,'CÃ©dula de CiudadanÃ­a'),(2,'Pasaporte'),(3,'CÃ©dula de ExtranjerÃ­a');
/*!40000 ALTER TABLE `tiposidentificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipospersona`
--

DROP TABLE IF EXISTS `tipospersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipospersona` (
  `idTipoPersona` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipospersona`
--

LOCK TABLES `tipospersona` WRITE;
/*!40000 ALTER TABLE `tipospersona` DISABLE KEYS */;
INSERT INTO `tipospersona` VALUES (1,'Profesor'),(2,'Estudiante'),(3,'Personal Externo');
/*!40000 ALTER TABLE `tipospersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposproyecto`
--

DROP TABLE IF EXISTS `tiposproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposproyecto` (
  `idTipoProyecto` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposproyecto`
--

LOCK TABLES `tiposproyecto` WRITE;
/*!40000 ALTER TABLE `tiposproyecto` DISABLE KEYS */;
INSERT INTO `tiposproyecto` VALUES (1,'InvestigaciÃ³n'),(2,'Inscrito');
/*!40000 ALTER TABLE `tiposproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposvinculacion`
--

DROP TABLE IF EXISTS `tiposvinculacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposvinculacion` (
  `idTipoVinculacion` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoVinculacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposvinculacion`
--

LOCK TABLES `tiposvinculacion` WRITE;
/*!40000 ALTER TABLE `tiposvinculacion` DISABLE KEYS */;
INSERT INTO `tiposvinculacion` VALUES (1,'Docente Vinculado Tiempo Completo'),(2,'Docente Ocasional Tiempo Completo'),(3,'Docente Ocasional Medio Tiempo'),(4,'CÃ¡tedra'),(5,'Asociado'),(6,'Asistente'),(7,'Auxiliar'),(8,'Contratista'),(9,'Visitante Tiempo Completo'),(10,'Docente Vinculado Medio Tiempo'),(11,'Jubilado'),(12,'Asesor'),(13,'Egresado');
/*!40000 ALTER TABLE `tiposvinculacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `nombreUsuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `correoElectronico` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `nombreUsuario_UNIQUE` (`nombreUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'William','Ortiz Ãlvarez','william','123','waortiz@gmail.com'),(2,'Juan David','Ortiz Perea','juan','123','juan@hotmail.com'),(3,'javier','mejÃ­a','javier','123','javier@hotmail.com'),(4,'pepe','ramirez','pepipo','123','pepe@pepe.com'),(5,'petra','petra','petra','123','petra@hotmail.com'),(6,'Ana','Ortiz','Ana','123','ana@hotmail.com'),(7,'SofÃ­a','Pelaez','Sofia','123','sofia@hotmail.com'),(8,'Yesika','Lopera','yessy','123','yesika@gmail.com'),(9,'Sandra','Gomez','sandra','123','sandra@hotmail.com'),(10,'FabiÃ¡n AndrÃ©s','MejÃ­a','fabian','123','fabian@hotmail.com'),(14,'William Alexis','Perea','william1','1','waortiz@hotmail.com'),(15,'William Alexis','Perea','william3','1','waortiz@hotmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gpci'
--
/*!50003 DROP FUNCTION IF EXISTS `ObtenerEstadoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerEstadoProyecto`( varIdProyecto bigint) RETURNS int(11)
BEGIN

		declare meses int default 0;
        declare mesesPlazos int default 0;
        declare mesesProrrogas int default 0;
        declare fechaFinalizacionProyecto datetime;
        declare estadoProyecto int;
        declare actasFinalizacion int default 0;
        
        select fechaFinalizacion
        into fechaFinalizacionProyecto
        from proyectos
        where idproyecto = varIdProyecto;
        
        select sum(mesesAprobados)
        into mesesPlazos
        from plazosproyectos 
        where idProyecto = varIdProyecto;
        
        IF mesesPlazos IS NULL THEN
          SET mesesPlazos = 0;
		END IF;
        
        select sum(mesesAprobados)
        into mesesProrrogas
        from prorrogasproyectos
        where idProyecto = varIdProyecto;

        IF mesesProrrogas IS NULL THEN
          SET mesesProrrogas = 0;
		END IF;

		SET meses = mesesPlazos + mesesProrrogas;

        SET fechaFinalizacionProyecto =  DATE_ADD(fechaFinalizacionProyecto, INTERVAL meses MONTH);
        if fechaFinalizacionProyecto >= now() then
            set estadoProyecto = 1;
        elseif fechaFinalizacionProyecto < now() then
			select count(idActa)
            into actasFinalizacion
            from actasProyectos
            where idproyecto = varIdProyecto
            and idtipoActa = 2;
            
            if actasFinalizacion > 0 then
                 set estadoProyecto = 2;
            else 
                set estadoProyecto = 3;
            end if;
        end if;

		RETURN estadoProyecto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ObtenerNombreEstadoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerNombreEstadoProyecto`( varIdProyecto bigint) RETURNS varchar(50) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN

        declare varEstadoProyecto varchar(50);
        declare varIdEstadoProyecto int default 0;
        
        select ObtenerEstadoProyecto(varIdProyecto)
        into varIdEstadoProyecto;
		
		select nombre 
        into varEstadoProyecto
        from estadosproyecto
        where idEstadoProyecto = varIdEstadoProyecto;

		RETURN varEstadoProyecto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ObtenerNombreInvestigadorPrincipalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerNombreInvestigadorPrincipalProyecto`( varIdProyecto bigint) RETURNS varchar(200) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN

        declare investigadorPrincipal varchar(200);

		select concat(concat(prof.nombres, ' '), prof.apellidos)
        into investigadorPrincipal
		from proyectos pro
			inner join profesoresproyectos profp on pro.idproyecto = profp.idproyecto and profp.idrol = 1
			inner join profesores prof on prof.idprofesor = profp.idprofesor
		where pro.idProyecto = varidProyecto;

		if investigadorPrincipal is null then
        
			select concat(concat(est.nombres, ' '), est.apellidos)
			into investigadorPrincipal
			from proyectos pro
				inner join estudiantesproyectos estp on pro.idproyecto = estp.idproyecto and estp.idrol = 1
				inner join estudiantes est on est.idestudiante = estp.idestudiante
			where pro.idProyecto = varidProyecto;
        
        end if;

		if investigadorPrincipal is null then
        
			select concat(concat(pe.nombres, ' '), pe.apellidos)
			into investigadorPrincipal
			from proyectos pro
				inner join personalexternoproyectos pep on pro.idproyecto = pep.idproyecto and pep.idrol = 1
				inner join personalexterno pe on pe.idpersonalexterno = pep.idpersonalexterno
			where pro.idProyecto = varidProyecto;
        
        end if;

		if investigadorPrincipal is null then
			set investigadorPrincipal = '';
        end if;

		RETURN investigadorPrincipal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarActaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarActaProyecto`(
 varIdActa bigint(20), 
 varObservaciones varchar(300),
 varIdTipoActa int(11),
 varFecha datetime,
 varNumero varchar(45)
)
BEGIN

UPDATE actasproyectos
SET observaciones = varObservaciones,
    idtipoacta = varidtipoacta,
    numero = varNumero,
    fecha = varFecha
WHERE idActa = varIdActa;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarAdendaCambioProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAdendaCambioProyecto`(
 varIdAdenda bigint(20), 
 varIdTipoPersona int,
 varIdPersonaAnterior bigint,
 varIdPersona bigint,
 varFechaCambio datetime,
 varFechaActa datetime,
 varNumeroActa varchar(50),
 varIdRol int,
 varObservaciones varchar(300)
)
BEGIN

UPDATE adendascambioproyectos
SET
	idTipoPersona = varidTipoPersona,
    idPersonaAnterior = varIdPersonaAnterior,
	idPersona = varIdPersona,
	fechaCambio = varfechaCambio,
	fechaActa = varfechaActa,
	numeroActa = varnumeroActa,
	idRol = varidRol,
	observaciones = varobservaciones
WHERE idAdenda = varIdAdenda;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarAdendaIngresoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAdendaIngresoProyecto`(
 varIdAdenda bigint(20), 
 varIdTipoPersona int,
 varIdPersona bigint,
 varFechaIngreso datetime,
 varFechaActa datetime,
 varNumeroActa varchar(50)
)
BEGIN

UPDATE adendasingresoproyectos
SET
	idTipoPersona = varidTipoPersona,
	idPersona = varIdPersona,
	fechaIngreso = varFechaIngreso,
	fechaActa = varfechaActa,
	numeroActa = varnumeroActa
WHERE idAdenda = varIdAdenda;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarAdendaRetiroProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAdendaRetiroProyecto`(
 varIdAdenda bigint(20), 
 varIdTipoPersona int,
 varIdPersona bigint,
 varFechaRetiro datetime,
 varFechaActa datetime,
 varNumeroActa varchar(50),
 varmotivo varchar(399)
)
BEGIN

UPDATE adendasretiroproyectos
SET
	idTipoPersona = varidTipoPersona,
	idPersona = varIdPersona,
	fechaRetiro = varFechaRetiro,
	fechaActa = varfechaActa,
	numeroActa = varnumeroActa,
    motivo = varmotivo
WHERE idAdenda = varIdAdenda;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarAdicionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAdicionProyecto`(
 varIdAdicion bigint(20), 
 varMonto bigint,
 vardescripcion varchar(200), 
 varfechaActa datetime,
 varnumeroActa varchar(45),
 varfechaActaCODI datetime,
 varnumeroActaCODI varchar(45)
)
BEGIN

UPDATE adicionesproyectos
SET monto = varMonto,
    descripcion = vardescripcion, 
    fechaActa = varfechaActa,
    numeroActa = varnumeroActa,
    fechaActaCODI = varfechaActaCODI,
    numeroActaCODI = varnumeroActaCODI
WHERE idAdicion = varIdAdicion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarAlertaAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAlertaAvalProyecto`(
 varidAlertaAvalProyecto bigint(20), 
 varidTipoAval int,
 varFechaActa datetime,
 varNumeroActa varchar(50),
 varDescripcion varchar(100)
)
BEGIN

UPDATE alertasavalproyectos
SET
 idTipoAval = varidTipoAval,
 fechaActa = varfechaActa,
 numeroActa = varnumeroActa,
 descripcion = varDescripcion
WHERE idAlertaAvalProyecto = varidAlertaAvalProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarClaveUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarClaveUsuario`(
	varIdUsuario bigint,
	varClave varchar(50)
)
BEGIN
UPDATE Usuarios SET
    clave = varClave
WHERE idUsuario = varIdUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCompromisoHomologadoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCompromisoHomologadoProyecto`(
 varIdCompromisoHomologadoProyecto bigint,
 varIdCompromisoProyectoHomologado bigint(20), 
 varIdCompromisoProyecto bigint(20), 
 varFechaActa datetime,
 varNumeroActa varchar(50),
 vardescripcion varchar(200),
 varObservaciones varchar(200)
)
BEGIN

UPDATE compromisoshomologadosproyectos
SET FechaActa = varFechaActa,
    descripcion = varDescripcion,
    observaciones = varObservaciones,
    NumeroActa = varNumeroActa,
    idCompromisoProyecto = varIdCompromisoProyecto,
    idCompromisoProyectoHomologado = varIdCompromisoProyectoHomologado
WHERE idcompromisoHomologadoProyecto = varIdCompromisoHomologadoProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCompromisoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCompromisoProyecto`(
 varIdCompromisoProyecto bigint(20), 
 varDescripcion varchar(300),
 varSoporte varchar(200),
 varIdTipoCompromiso int
)
BEGIN

UPDATE Compromisosproyectos
SET descripcion = varDescripcion,
    IdTipoCompromiso = varIdTipoCompromiso,
    soporte  = varSoporte 
WHERE idCompromisoProyecto = varIdCompromisoProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCumplimientoAlertaAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCumplimientoAlertaAvalProyecto`(
 varidcumplimientoalertaavalproyecto bigint,
 varFechaActa datetime,
 varNumeroActa varchar(50)
)
BEGIN

UPDATE cumplimientoalertasavalproyectos
SET fechaActa = varFechaActa,
numeroActa = varNumeroActa
WHERE 
 idcumplimientoalertaavalproyecto = varidcumplimientoalertaavalproyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCumplimientoCompromisoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCumplimientoCompromisoProyecto`(
 varidcumplimientocompromisoproyecto bigint,
 varIdCompromisoProyecto bigint(20), 
 varFechaActa datetime,
 varNumeroActa varchar(50)
)
BEGIN

UPDATE cumplimientocompromisosproyectos
SET FechaActa = varFechaActa,
    NumeroActa = varNumeroActa,
    idCompromisoProyecto = varIdCompromisoProyecto
WHERE idcumplimientocompromisoproyecto = varidcumplimientocompromisoproyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDocumentoActaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumentoActaProyecto`(
 varIdActa bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

UPDATE DocumentoActasproyectos
SET nombre = varNombre,
    tipocontenido = vartipocontenido,
    contenido = varcontenido
WHERE IdActa = varIdActa;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDocumentoAdendaCambioProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumentoAdendaCambioProyecto`(
 varIdAdenda bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

UPDATE DocumentoAdendasCambioproyectos
SET nombre = varNombre,
    tipocontenido = vartipocontenido,
    contenido = varcontenido
WHERE IdAdenda = varIdAdenda;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDocumentoAdendaIngresoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumentoAdendaIngresoProyecto`(
 varIdAdenda bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

UPDATE DocumentoAdendasIngresoProyectos
SET nombre = varNombre,
    tipocontenido = vartipocontenido,
    contenido = varcontenido
WHERE IdAdenda = varIdAdenda;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDocumentoAdendaRetiroProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumentoAdendaRetiroProyecto`(
 varIdAdenda bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

UPDATE DocumentoAdendasRetiroProyectos
SET nombre = varNombre,
    tipocontenido = vartipocontenido,
    contenido = varcontenido
WHERE IdAdenda = varIdAdenda;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDocumentoAdicionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumentoAdicionProyecto`(
 varIdAdicion bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

UPDATE DocumentoAdicionesproyectos
SET nombre = varNombre,
    tipocontenido = vartipocontenido,
    contenido = varcontenido
WHERE IdAdicion = varIdAdicion;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDocumentoCumplimientoAlertaAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumentoCumplimientoAlertaAvalProyecto`(
 varidcumplimientoalertaavalproyecto bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

UPDATE documentocumplimientoalertasavalproyectos
SET nombre = varNombre,
    tipocontenido = vartipocontenido,
    contenido = varcontenido
WHERE idcumplimientoalertaavalproyecto = varidcumplimientoalertaavalproyecto;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDocumentoCumplimientoCompromisoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumentoCumplimientoCompromisoProyecto`(
 varidcumplimientocompromisoproyecto bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

UPDATE documentocumplimientocompromisosproyectos
SET nombre = varNombre,
    tipocontenido = vartipocontenido,
    contenido = varcontenido
WHERE idcumplimientocompromisoproyecto = varidcumplimientocompromisoproyecto;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDocumentoPlazoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumentoPlazoProyecto`(
 varIdPlazo bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

UPDATE DocumentoPlazosproyectos
SET nombre = varNombre,
    tipocontenido = vartipocontenido,
    contenido = varcontenido
WHERE IdPlazo = varIdPlazo;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarDocumentoProrrogaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDocumentoProrrogaProyecto`(
 varIdProrroga bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

UPDATE DocumentoProrrogasproyectos
SET nombre = varNombre,
    tipocontenido = vartipocontenido,
    contenido = varcontenido
WHERE IdProrroga = varIdProrroga;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarEntidadInternacionalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEntidadInternacionalProyecto`(
 varidEntidadInternacionalProyecto bigint(20),
 varNombre varchar(200)
)
BEGIN

UPDATE entidadesinternacionalesproyectos
SET nombre = varnombre
WHERE idEntidadInternacionalProyecto = varidEntidadInternacionalProyecto;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarEstudianteProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEstudianteProyecto`(
 varIdProyecto bigint(20), 
 varidEstudiante bigint(20),
 varIdTipoIdentificacion int(11),
 varNombres varchar(250),
 varApellidos varchar(250),
 varNumeroIdentificacion bigint(20),
 varCorreoElectronico varchar(250),
 varContacto varchar(100),
 varIdTipoEstudiante int(11),
 varidRol int(11),
 varidPrograma int(11),
 varporcentajePropiedadIntelectual decimal(18,2),
 varhorasSemana int(11),
 varmesesDedicados int(11),
 varsemestre int(11)
)
BEGIN

  UPDATE estudiantes
  SET nombres = varNombres,
	 apellidos = varApellidos,
	 correoElectronico = varCorreoElectronico,
	 contacto = varContacto,
	 idtipoidentificacion = varIdTipoIdentificacion,
	 numeroIdentificacion = varNumeroIdentificacion,
     idtipoestudiante = varidtipoestudiante
  WHERE idEstudiante = varidEstudiante;

  UPDATE estudiantesproyectos
  SET	idRol = varidRol,
        idPrograma = varidPrograma,
		porcentajePropiedadIntelectual = varporcentajePropiedadIntelectual,
		horasSemana = varhorasSemana,
		mesesDedicados = varmesesDedicados,
		semestre = varsemestre
  WHERE idEstudiante = varidEstudiante 
    AND idProyecto = varidProyecto;  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarFuentefinanciacionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarFuentefinanciacionProyecto`(
 varIdfuentefinanciacionproyecto bigint(20),
 varIdFuenteFinanciacion int(11), 
 varidTipoFuenteFinanciacionProyecto int(11), 
 varMontoFrescos bigint(20), 
 varMontoEspecies bigint(20)
)
BEGIN

UPDATE fuentesfinanciacionproyectos
SET	varIdFuenteFinanciacion = varvarIdFuenteFinanciacion,
	ididTipoFuenteFinanciacionProyecto = varidTipoFuenteFinanciacionProyecto,
	montoFrescos = varMontoFrescos,
	montoEspecies = varMontoEspecies
WHERE Idfuentefinanciacionproyecto = varIdfuentefinanciacionproyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarGrupoInvestigacionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarGrupoInvestigacionProyecto`(
 varidGrupoInvestigacion int(11),
 varidProyecto bigint(20),
 varPrincipal tinyint(1)
)
BEGIN

UPDATE gruposinvestigacionproyectos
SET principal = varprincipal
WHERE idGrupoInvestigacion = varidGrupoInvestigacion
AND idProyecto = varidProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarObjetivoEspecificoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarObjetivoEspecificoProyecto`(
 varIdObjetivoEspecificoProyecto bigint(20), 
 varDescripcion varchar(300)
)
BEGIN

UPDATE `objetivosespecificos`
SET descripcion = varDescripcion
WHERE idObjetivoEspecifico = varIdObjetivoEspecificoProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarPersonalExternoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPersonalExternoProyecto`(
 varIdProyecto bigint(20), 
 varIdPersonalExterno bigint(20),
 varIdTipoIdentificacion int(11),
 varNombres varchar(250),
 varApellidos varchar(250),
 varNumeroIdentificacion bigint(20),
 varCorreoElectronico varchar(250),
 varEntidad varchar(100),
 varidRol int(11),
 varcartaCesionDerechosPatrimonio tinyint(1),
 varporcentajePropiedadIntelectual decimal(18,2),
 varhorasSemana int(11),
 varmesesDedicados int(11)
)
BEGIN
  
  UPDATE personalexterno
  SET nombres = varNombres,
	 apellidos = varApellidos,
	 correoElectronico = varCorreoElectronico,
	 idtipoidentificacion = varIdTipoIdentificacion,
	 numeroIdentificacion = varNumeroIdentificacion,
     entidad = varEntidad
  WHERE idPersonalexterno = varIdPersonalexterno;

  UPDATE personalexternoproyectos
  SET	idRol = varidRol,
		cartaCesionDerechosPatrimonio = varcartaCesionDerechosPatrimonio,
		porcentajePropiedadIntelectual = varporcentajePropiedadIntelectual,
		horasSemana = varhorasSemana,
		mesesDedicados = varmesesDedicados
  WHERE idpersonalexterno = varidpersonalexterno
    AND idProyecto = varidProyecto;  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarPlazoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPlazoProyecto`(
 varIdPlazo bigint(20), 
 varDescripcion varchar(100),
 varMesesAprobados int(11),
 varfechaActa datetime, 
 varnumeroActa varchar(45), 
 varfechaActaCODI datetime, 
 varnumeroActaCODI varchar(45)
)
BEGIN

UPDATE plazosproyectos
SET descripcion = varDescripcion,
	mesesAprobados = varMesesAprobados,
    fechaActa = varfechaActa,
    numeroActa = varnumeroActa,
    fechaActaCODI = varfechaActaCODI,
    numeroActaCODI = varnumeroActaCODI
WHERE idPlazo = varIdPlazo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarPrivilegio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPrivilegio`(
	varIdPrivilegio int,
    varNombre varchar(50),
	varCodigo varchar(45)
)
BEGIN

	UPDATE privilegios SET
		nombre = varNombre,
		codigo = varCodigo
	WHERE idPrivilegio = varidPrivilegio;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarProfesorProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProfesorProyecto`(
 varIdProyecto bigint(20), 
 varIdProfesor bigint(20),
 varIdTipoIdentificacion int(11),
 varNombres varchar(250),
 varApellidos varchar(250),
 varNumeroIdentificacion bigint(20),
 varCorreoElectronico varchar(250),
 varContacto varchar(100),
 varidRol int(11),
 varidFacultad int(11),
 varidTipoVinculacion int,
 varcartaCesionDerechosPatrimonio tinyint(1),
 varporcentajePI decimal(18,2),
 varhorasSemana int(11),
 varmesesDedicados int(11),
 varhorasSemanaFueraPlan int(11),
 varmesesFueraPlan int(11)
)
BEGIN
  
  UPDATE profesores
  SET nombres = varNombres,
	 apellidos = varApellidos,
	 correoElectronico = varCorreoElectronico,
	 contacto = varContacto,
	 idtipoidentificacion = varIdTipoIdentificacion,
	 numeroIdentificacion = varNumeroIdentificacion       
  WHERE idProfesor = varIdProfesor;

  UPDATE profesoresproyectos
  SET	idRol = varidRol,
        idFacultad = varidFacultad,
		idTipoVinculacion = varidTipoVinculacion,
		cartaCesionDerechosPatrimonio = varcartaCesionDerechosPatrimonio,
		porcentajePI = varporcentajePI,
		horasSemana = varhorasSemana,
		mesesDedicados = varmesesDedicados,
		horasSemanaFueraPlan = varhorasSemanaFueraPlan,
		mesesFueraPlan = varmesesFueraPlan
  WHERE idProfesor = varidProfesor 
    AND idProyecto = varidProyecto;  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarProrrogaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProrrogaProyecto`(
 varIdProrroga bigint(20), 
 varDescripcion varchar(100),
 varMesesAprobados int(11),
 varMontoAprobado bigint,
 varFechaActa datetime,
 varNumeroActa varchar(45),
 varfechaActaCODI datetime,
 varNumeroActaCODI varchar(45)
)
BEGIN

UPDATE prorrogasproyectos
SET descripcion = varDescripcion,
	mesesAprobados = varMesesAprobados,
	montoAprobado = varMontoAprobado,
	fechaActa = varFechaActa,
	NumeroActa = varNumeroActa,
	fechaActaCODI = varfechaActaCODI,
	NumeroActaCODI = varNumeroActaCODI   
WHERE idProrroga = varIdProrroga;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProyecto`(
   varIdProyecto bigint(20), 
   varNombreCompletoProyecto varchar(300),
   varNombreCortoProyecto varchar(100),
   varFechaInicio datetime,
   varFechaFinalizacion datetime,
   varIdAreaTematica int(11),
   varCodigoCOLCIENCIAS varchar(50),
   varCodigo varchar(15),
   varParticipacionInternacional tinyint(1),
   varIdTipoProyecto int(11),
   varIdRiesgoEtico int(11),
   varIdTipoContrato int(11),
   varIdEnfoqueMetodologico int(11),
   varIdConvocatoria int(11),
   varObjetivoGeneral varchar(300)
)
BEGIN
UPDATE proyectos
SET
nombreCompletoProyecto = varNombreCompletoProyecto,
nombreCortoProyecto = varNombreCortoProyecto,
fechaInicio = varFechaInicio,
fechaFinalizacion = varFechaFinalizacion,
idAreaTematica = varIdAreaTematica,
codigoCOLCIENCIAS = varCodigoCOLCIENCIAS,
codigo = varCodigo,
participacionInternacional = varParticipacionInternacional,
idTipoProyecto = varIdTipoProyecto,
idRiesgoEtico  = varIdRiesgoEtico,
idTipoContrato = varIdTipoContrato,
idEnfoqueMetodologico = varIdEnfoqueMetodologico,
idConvocatoria = varIdConvocatoria,
objetivoGeneral = varObjetivoGeneral
WHERE idProyecto = varIdProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUsuario`(
	varIdUsuario bigint,
	varNombres varchar(250),
	varApellidos varchar(250),
    varCorreoElectronico varchar(100),
    varNombreUsuario varchar(50)
)
BEGIN
UPDATE Usuarios SET
    nombres = varNombres,
    apellidos = varApellidos,
    correoElectronico = varCorreoElectronico,
    nombreUsuario = varNombreUsuario
WHERE idUsuario = varIdUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarActaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarActaProyecto`(
 varIdActa bigint(20)
)
BEGIN

DELETE FROM documentoactasproyectos
WHERE idActa = varIdActa;

DELETE FROM actasproyectos
WHERE idActa = varIdActa;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarAdendaCambioProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAdendaCambioProyecto`(
 varIdAdenda bigint(20)
)
BEGIN

DELETE FROM documentoadendascambioproyectos
WHERE idAdenda = varIdAdenda;

DELETE FROM adendascambioproyectos
WHERE idAdenda = varIdAdenda;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarAdendaIngresoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAdendaIngresoProyecto`(
 varIdAdenda bigint(20)
)
BEGIN

DELETE FROM documentoadendasingresoproyectos
WHERE idAdenda = varIdAdenda;

DELETE FROM adendasingresoproyectos
WHERE idAdenda = varIdAdenda;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarAdendaRetiroProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAdendaRetiroProyecto`(
 varIdAdenda bigint(20)
)
BEGIN

DELETE FROM documentoadendasretiroproyectos
WHERE idAdenda = varIdAdenda;

DELETE FROM adendasretiroproyectos
WHERE idAdenda = varIdAdenda;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarAdicionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAdicionProyecto`(
 varIdAdicion bigint(20)
)
BEGIN

DELETE FROM documentoadicionesproyectos
WHERE idAdicion = varIdAdicion;

DELETE FROM adicionesproyectos
WHERE idAdicion = varIdAdicion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarAlertaAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarAlertaAvalProyecto`(
 varidAlertaAvalProyecto bigint(20)
)
BEGIN

DELETE FROM alertasavalproyectos
WHERE idAlertaAvalProyecto = varidAlertaAvalProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCompromisoHomologadoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCompromisoHomologadoProyecto`(
 varidcompromisoHomologadoProyecto bigint(20)
)
BEGIN

DELETE FROM compromisoshomologadosproyectos
WHERE idcompromisoHomologadoProyecto = varidcompromisoHomologadoProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCompromisoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCompromisoProyecto`(
 varIdCompromisoProyecto bigint(20)
)
BEGIN

DELETE FROM compromisosproyectos
WHERE idCompromisoProyecto = varIdCompromisoProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCumplimientoAlertaAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCumplimientoAlertaAvalProyecto`(
 varidcumplimientoalertaavalproyecto bigint(20)
)
BEGIN
DELETE FROM documentocumplimientoalertasavalproyectos
WHERE idcumplimientoalertaavalproyecto = varidcumplimientoalertaavalproyecto;

DELETE FROM cumplimientoalertasavalproyectos
WHERE idcumplimientoalertaavalproyecto = varidcumplimientoalertaavalproyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCumplimientoCompromisoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCumplimientoCompromisoProyecto`(
 varidcumplimientocompromisoproyecto bigint(20)
)
BEGIN

DELETE FROM documentocumplimientocompromisosproyectos
WHERE idcumplimientocompromisoproyecto = varidcumplimientocompromisoproyecto;

DELETE FROM cumplimientocompromisosproyectos
WHERE idcumplimientocompromisoproyecto = varidcumplimientocompromisoproyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarEntidadInternacionalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarEntidadInternacionalProyecto`(
 varidEntidadInternacionalProyecto bigint(20)
)
BEGIN

DELETE FROM entidadesinternacionalesproyectos
WHERE identidadInternacionalProyecto = varidEntidadInternacionalProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarEstudianteProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarEstudianteProyecto`(
 varIdProyecto bigint(20), 
 varidEstudiante bigint(20)
)
BEGIN

  DELETE FROM estudiantesproyectos
  WHERE idProyecto = varIdProyecto
    and idEstudiante = varidEstudiante;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarFuentefinanciacionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarFuentefinanciacionProyecto`(
 varidfuentefinanciacionproyecto bigint(20)
)
BEGIN

DELETE FROM fuentesfinanciacionproyectos
WHERE idfuentefinanciacionproyecto = varidfuentefinanciacionproyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarGrupoInvestigacionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarGrupoInvestigacionProyecto`(
 varidGrupoInvestigacion int(11),
 varidProyecto bigint(20)
)
BEGIN

DELETE FROM gruposinvestigacionproyectos
WHERE idGrupoInvestigacion = varidGrupoInvestigacion
and idProyecto = varidProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarObjetivoEspecificoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarObjetivoEspecificoProyecto`(
 varIdObjetivoEspecificoProyecto bigint(20)
)
BEGIN

DELETE FROM `objetivosespecificos`
WHERE idObjetivoEspecifico = varIdObjetivoEspecificoProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarOpcionMenuPrivilegio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarOpcionMenuPrivilegio`(
	varIdOpcionMenu int,
	varIdPrivilegio int
)
BEGIN

DELETE FROM opcionesmenuprivilegios 
WHERE idOpcionMenu = varIdOpcionMenu AND
 idprivilegio = varIdPrivilegio;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarPersonalExternoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPersonalExternoProyecto`(
 varIdProyecto bigint(20), 
 varidPersonalExterno bigint(20)
)
BEGIN

  DELETE FROM personalexternoproyectos
  WHERE idProyecto = varIdProyecto
    and idPersonalExterno = varidPersonalExterno;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarPlazoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPlazoProyecto`(
 varIdPlazo bigint(20)
)
BEGIN

DELETE FROM documentoplazosproyectos
WHERE idplazo = varidplazo;

DELETE FROM plazosproyectos
WHERE idplazo = varidplazo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarPrivilegio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPrivilegio`(
	IN varIdprivilegio bigint
)
BEGIN

	DELETE FROM opcionesmenuprivilegios
	WHERE idPrivilegio = varIdPrivilegio;

	DELETE FROM privilegiosusuario
	WHERE idPrivilegio = varIdPrivilegio;

	DELETE FROM privilegios
    WHERE idPrivilegio = varIdPrivilegio;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarPrivilegioUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarPrivilegioUsuario`(
	varIdUsuario bigint,
	varIdPrivilegio int
)
BEGIN

DELETE FROM privilegiosUsuario 
WHERE idusuario = varIdUsuario
AND  idprivilegio = varIdPrivilegio;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarProfesorProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProfesorProyecto`(
 varIdProyecto bigint(20), 
 varIdProfesor bigint(20)
)
BEGIN

  DELETE FROM profesoresproyectos
  WHERE idProyecto = varIdProyecto
    and idProfesor = varIdProfesor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarProrrogaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProrrogaProyecto`(
 varIdProrroga bigint(20)
)
BEGIN

DELETE FROM documentoprorrogasproyectos
WHERE idprorroga = varidprorroga;

DELETE FROM prorrogasproyectos
WHERE idprorroga = varidprorroga;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarActaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarActaProyecto`(
 varIdProyecto bigint(20), 
 varObservaciones varchar(300),
 varIdTipoActa int(11),
 varNumero varchar(45),
 varFecha datetime,
 OUT varIdActa bigint(20)
)
BEGIN

INSERT INTO ActasProyectos
(
idProyecto,
fecha,
observaciones,
IdTipoActa,
numero)
VALUES
(varIdProyecto,
 varFecha,
 varobservaciones,
 varIdTipoActa,
 varNumero);

SET varIdActa = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarAdendaCambioProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarAdendaCambioProyecto`(
 varIdProyecto bigint,
 varIdTipoPersona int,
 varIdPersonaAnterior bigint,
 varIdPersona bigint,
 varFechaCambio datetime,
 varFechaActa datetime,
 varNumeroActa varchar(50),
 varIdRol int,
 varObservaciones varchar(300),
 OUT varIdAdenda bigint(20)
)
BEGIN

INSERT INTO adendascambioproyectos
	(
    IdProyecto,
    idTipoPersona,
    IdPersonaAnterior,
	idPersona,
	fecha,
	fechacambio,
	fechaActa,
	numeroActa,
    observaciones,
	idrol)
VALUES
	(
    varIdProyecto,
    varidTipoPersona,
    varIdPersonaAnterior,
	varidPersona,
	now(),
	varfechaCambio,
	varfechaActa,
	varnumeroActa,
    varObservaciones,
	varidrol);


SET varIdAdenda = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarAdendaIngresoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarAdendaIngresoProyecto`(
 varIdProyecto bigint,
 varIdTipoPersona int,
 varIdPersona bigint,
 varFechaIngreso datetime,
 varFechaActa datetime,
 varNumeroActa varchar(50),
 OUT varIdAdenda bigint(20)
)
BEGIN

INSERT INTO adendasingresoproyectos
	(
    IdProyecto,
    idTipoPersona,
	idPersona,
	fecha,
	fechaIngreso,
	fechaActa,
	numeroActa)
VALUES
	(
    varIdProyecto,
    varidTipoPersona,
	varidPersona,
	now(),
	varFechaIngreso,
	varfechaActa,
	varnumeroActa);


SET varIdAdenda = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarAdendaRetiroProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarAdendaRetiroProyecto`(
 varIdProyecto bigint,
 varIdTipoPersona int,
 varIdPersona bigint,
 varFechaRetiro datetime,
 varFechaActa datetime,
 varNumeroActa varchar(50),
 varmotivo varchar(300),
 OUT varIdAdenda bigint(20)
)
BEGIN

INSERT INTO adendasretiroproyectos
	(
    IdProyecto,
    idTipoPersona,
	idPersona,
	fecha,
	fechaRetiro,
	fechaActa,
	numeroActa,
	motivo)
VALUES
	(
    varIdProyecto,
    varidTipoPersona,
	varidPersona,
	now(),
	varfechaRetiro,
	varfechaActa,
	varnumeroActa,
	varmotivo);


SET varIdAdenda = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarAdicionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarAdicionProyecto`(
 varIdProyecto bigint(20), 
 varMonto bigint,
 vardescripcion varchar(200), 
 varfechaActa datetime,
 varnumeroActa varchar(45),
 varfechaActaCODI datetime,
 varnumeroActaCODI varchar(45),
 OUT varIdAdicion bigint(20)
)
BEGIN

INSERT INTO Adicionesproyectos
(
idProyecto,
fecha,
monto,
descripcion, 
fechaActa,
numeroActa,
fechaActaCODI,
numeroActaCODI
)
VALUES
(varIdProyecto,
 now(),
 varMonto,
 vardescripcion, 
 varfechaActa,
 varnumeroActa,
 varfechaActaCODI,
 varnumeroActaCODI);

SET varIdAdicion = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarAlertaAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarAlertaAvalProyecto`(
 varIdProyecto bigint(20), 
 varIdTipoAval int,
 varFechaActa datetime,
 varDescripcion varchar(100),
 varNumeroActa varchar(50)
)
BEGIN

INSERT INTO alertasavalproyectos
(
idProyecto,
fecha,
idTipoAval,
fechaActa,
descripcion,
numeroActa)
VALUES
(
 varidProyecto,
 now(),
 varidTipoAval,
 varfechaActa,
 vardescripcion,
 varnumeroActa);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarAreaTematica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarAreaTematica`(
	IN varNombre varchar(50),
    out varidAreaTematica int
)
BEGIN
   
    select MAX(idareatematica) + 1 
    into varidAreaTematica
    FROM areastematicas;
   
	INSERT INTO areastematicas
	(
    idareatematica,
	nombre
	)
	VALUES
	(
    varIdAreaTematica,
	varNombre);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarCompromisoHomologadoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarCompromisoHomologadoProyecto`(
 varIdCompromisoProyecto bigint(20), 
 varIdCompromisoProyectoHomologado bigint(20),
 varFechaActa datetime,
 varNumeroActa varchar(50),
 vardescripcion varchar(200),
 varObservaciones varchar(200)
)
BEGIN

INSERT INTO compromisoshomologadosproyectos
(idCompromisoProyecto,
 idCompromisoProyectoHomologado,
 fecha,
 fechaActa,
 descripcion,
 numeroActa,
 observaciones)
VALUES
(varidCompromisoProyecto,
 varIdCompromisoProyectoHomologado,
 now(),
 varfechaActa,
 vardescripcion,
 varNumeroActa,
 varobservaciones);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarCompromisoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarCompromisoProyecto`(
 varIdProyecto bigint(20), 
 varDescripcion varchar(300),
 varSoporte  varchar(200),
 varIdTipoCompromiso int
)
BEGIN

INSERT INTO CompromisosProyectos
(
 idProyecto,
 descripcion,
 fecha,
 soporte, 
 idTipoCompromiso)
VALUES
(varIdProyecto,
 varDescripcion,
 now(),
 varSoporte, 
 varidTipoCompromiso);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarConvocatoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarConvocatoria`(
	IN varNombre varchar(50),
    out varidConvocatoria int
)
BEGIN
   
	INSERT INTO convocatorias
	(
	nombre,
	fecha)
	VALUES
	(
	varNombre,
	now());


   SET varIdConvocatoria = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarCumplimientoAlertaAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarCumplimientoAlertaAvalProyecto`(
 varIdAlertaAvalProyecto bigint,
 varFechaActa datetime,
 varNumeroActa varchar(50),
 OUT varidcumplimientoalertaavalproyecto bigint
)
BEGIN

INSERT INTO cumplimientoalertasavalproyectos
(
IdAlertaAvalProyecto,
fecha,
fechaActa,
numeroActa)
VALUES
(
 varIdAlertaAvalProyecto,
 now(),
 varfechaActa,
 varnumeroActa);

SET varidcumplimientoalertaavalproyecto = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarCumplimientoCompromisoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarCumplimientoCompromisoProyecto`(
 varidCompromisoProyecto bigint(20), 
 varFechaActa datetime,
 varNumeroActa varchar(50),
 OUT varidcumplimientocompromisoproyecto bigint
)
BEGIN

INSERT INTO cumplimientocompromisosproyectos
(idCompromisoProyecto,
fecha,
fechaActa,
numeroActa)
VALUES
(varidCompromisoProyecto,
now(),
varfechaActa,
varnumeroActa);

 SET varidcumplimientocompromisoproyecto = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarDocumentoActaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarDocumentoActaProyecto`(
 varIdActa bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

INSERT INTO DocumentoActasproyectos
(
idActa,
nombre,
tipocontenido,
contenido)
VALUES
(varIdActa,
 varNombre,
 varTipoContenido,
 varContenido);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarDocumentoAdendaCambioProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarDocumentoAdendaCambioProyecto`(
 varIdAdenda bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

INSERT INTO documentoadendascambioproyectos
(
idAdenda,
nombre,
tipocontenido,
contenido)
VALUES
(varIdAdenda,
 varNombre,
 varTipoContenido,
 varContenido);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarDocumentoAdendaIngresoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarDocumentoAdendaIngresoProyecto`(
 varIdAdenda bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

INSERT INTO documentoadendasingresoproyectos
(
idAdenda,
nombre,
tipocontenido,
contenido)
VALUES
(varIdAdenda,
 varNombre,
 varTipoContenido,
 varContenido);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarDocumentoAdendaRetiroProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarDocumentoAdendaRetiroProyecto`(
 varIdAdenda bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

INSERT INTO documentoadendasretiroproyectos
(
idAdenda,
nombre,
tipocontenido,
contenido)
VALUES
(varIdAdenda,
 varNombre,
 varTipoContenido,
 varContenido);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarDocumentoAdicionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarDocumentoAdicionProyecto`(
 varIdAdicion bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

INSERT INTO DocumentoAdicionesproyectos
(
idAdicion,
nombre,
tipocontenido,
contenido)
VALUES
(varIdAdicion,
 varNombre,
 varTipoContenido,
 varContenido);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarDocumentoCumplimientoAlertaAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarDocumentoCumplimientoAlertaAvalProyecto`(
 varidcumplimientoalertaavalproyecto bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

INSERT INTO documentocumplimientoalertasavalproyectos
(
idcumplimientoalertaavalproyecto,
nombre,
tipocontenido,
contenido)
VALUES
(varidcumplimientoalertaavalproyecto,
 varNombre,
 varTipoContenido,
 varContenido);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarDocumentoCumplimientoCompromisoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarDocumentoCumplimientoCompromisoProyecto`(
 varidcumplimientocompromisoproyecto bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

INSERT INTO documentocumplimientocompromisosproyectos
(
idcumplimientocompromisoproyecto,
nombre,
tipocontenido,
contenido)
VALUES
(varidcumplimientocompromisoproyecto,
 varNombre,
 varTipoContenido,
 varContenido);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarDocumentoPlazoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarDocumentoPlazoProyecto`(
 varIdPlazo bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

INSERT INTO DocumentoPlazosProyectos
(
idPlazo,
nombre,
tipocontenido,
contenido)
VALUES
(varIdPlazo,
 varNombre,
 varTipoContenido,
 varContenido);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarDocumentoProrrogaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarDocumentoProrrogaProyecto`(
 varIdProrroga bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

INSERT INTO DocumentoProrrogasproyectos
(
idProrroga,
nombre,
tipocontenido,
contenido)
VALUES
(varIdProrroga,
 varNombre,
 varTipoContenido,
 varContenido);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarEntidadInternacionalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarEntidadInternacionalProyecto`(
 varidProyecto bigint(20),
 varNombre varchar(200)
)
BEGIN

INSERT INTO entidadesinternacionalesproyectos
(idProyecto,
nombre)
VALUES
(varidProyecto,
 varnombre);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarEstudianteProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarEstudianteProyecto`(
 varIdProyecto bigint(20), 
 varIdTipoIdentificacion int(11),
 varNombres varchar(250),
 varApellidos varchar(250),
 varNumeroIdentificacion bigint(20),
 varCorreoElectronico varchar(250),
 varContacto varchar(100),
 varIdTipoEstudiante int(11),
 varidRol int(11),
 varidPrograma int(11),
 varporcentajePropiedadIntelectual decimal(18,2),
 varhorasSemana int(11),
 varmesesDedicados int(11),
 varsemestre int(11)
)
BEGIN

  DECLARE varIdEstudiante bigint(20);
  
  SELECT idEstudiante
  INTO varIdEstudiante
  FROM estudiantes
  WHERE idtipoidentificacion = varIdTipoIdentificacion
   AND numeroIdentificacion = varNumeroIdentificacion;
   
  IF  varIdEstudiante IS NOT NULL THEN
	 UPDATE estudiantes
	 SET nombres = varNombres,
	 	 apellidos = varApellidos,
		 correoElectronico = varCorreoElectronico,
		 contacto = varContacto,
         idtipoestudiante = varidtipoestudiante
	 WHERE idEstudiante = varidEstudiante;
  
  ELSE
  
     INSERT INTO estudiantes
     (idTipoIdentificacion,
      nombres,
      apellidos,
      numeroIdentificacion,
      correoElectronico,
      contacto,
      idtipoestudiante)
     VALUES
	 (varidTipoIdentificacion,
	 varnombres,
	 varapellidos,
	 varnumeroIdentificacion,
	 varcorreoElectronico,
	 varcontacto,
     varidtipoestudiante);
  
    SET varIdEstudiante = LAST_INSERT_ID();
  
  END if;
  
	INSERT INTO estudiantesproyectos
	(idEstudiante,
	idProyecto,
	idRol,
	idPrograma,
	porcentajePropiedadIntelectual,
	horasSemana,
	mesesDedicados,
	semestre)
	VALUES
	(varidEstudiante,
	 varidProyecto,
	 varidRol,
	 varidPrograma,
	 varporcentajePropiedadIntelectual,
	 varhorasSemana,
	 varmesesDedicados,
	 varsemestre);
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarFuenteFinanciacionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarFuenteFinanciacionProyecto`(
 varIdProyecto bigint(20),
 varIdFuenteFinanciacion int(11), 
 varidTipoFuenteFinanciacionProyecto int(11), 
 varMontoFrescos bigint(20), 
 varMontoEspecies bigint(20)
)
BEGIN

INSERT INTO fuentesfinanciacionproyectos
(idProyecto,
 idFuenteFinanciacion,
 idTipoFuenteFinanciacionProyecto,
 montoFrescos,
 montoEspecies)
VALUES
(varidProyecto,
 varidFuenteFinanciacion,
 varidTipoFuenteFinanciacionProyecto,
 varMontoFrescos,
 varMontoEspecies);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarGrupoInvestigacionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarGrupoInvestigacionProyecto`(
 varidGrupoInvestigacion int(11),
 varidProyecto bigint(20),
 varPrincipal tinyint(1)
)
BEGIN

INSERT INTO gruposinvestigacionproyectos
(idGrupoInvestigacion,
 idProyecto,
 principal)
VALUES
(varidGrupoInvestigacion,
 varidProyecto,
 varprincipal);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarNotificacionVencimientoPlazo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarNotificacionVencimientoPlazo`(
 varidTipoPersona int(11), 
 varidPersona bigint(20), 
 varidProyecto bigint(20) 
)
BEGIN

 INSERT INTO notificacionesvencimientoplazo
(idTipoPersona,
 idPersona,
 idProyecto,
 fecha)
VALUES
(varidTipoPersona,
 varidPersona,
 varidProyecto,
 now());


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarObjetivoEspecificoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarObjetivoEspecificoProyecto`(
 varIdProyecto bigint(20), 
 varDescripcion varchar(300)
)
BEGIN

INSERT INTO `objetivosespecificos`
(
`idProyecto`,
`descripcion`)
VALUES
(varIdProyecto,
 varDescripcion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarOpcionMenuPrivilegio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarOpcionMenuPrivilegio`(
	varIdOpcionMenu int,
	varIdPrivilegio int
)
BEGIN

INSERT INTO OpcionesMenuprivilegios (idOpcionMenu, idprivilegio)
VALUES (varIdOpcionMenu, varIdPrivilegio);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarPersonalExternoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarPersonalExternoProyecto`(
 varIdProyecto bigint(20), 
 varIdTipoIdentificacion int(11),
 varNombres varchar(250),
 varApellidos varchar(250),
 varNumeroIdentificacion bigint(20),
 varCorreoElectronico varchar(250),
 varEntidad varchar(100),
 varidRol int(11),
 varcartaCesionDerechosPatrimonio tinyint(1),
 varporcentajePropiedadIntelectual decimal(18,2),
 varhorasSemana int(11),
 varmesesDedicados int(11)
)
BEGIN

  DECLARE varIdPersonalExterno bigint(20);
  
  SELECT idPersonalExterno 
  INTO varIdPersonalExterno
  FROM PersonalExterno
  WHERE idtipoidentificacion = varIdTipoIdentificacion
   AND numeroIdentificacion = varNumeroIdentificacion;
   
  IF  varIdPersonalExterno IS NOT NULL THEN
	 UPDATE PersonalExterno
	 SET nombres = varNombres,
			apellidos = varApellidos,
			correoElectronico = varCorreoElectronico,
            entidad = varentidad
	 WHERE idPersonalExterno = varIdPersonalExterno;
  
  ELSE
  
     INSERT INTO PersonalExterno
     (idTipoIdentificacion,
      nombres,
      apellidos,
      numeroIdentificacion,
      correoElectronico,
      entidad)
     VALUES
	 (varidTipoIdentificacion,
	 varnombres,
	 varapellidos,
	 varnumeroIdentificacion,
	 varcorreoElectronico,
     varentidad
     );
  
    SET varIdPersonalExterno = LAST_INSERT_ID();
  
  END if;
  
	INSERT INTO personalExternoproyectos
	(idPersonalExterno,
	idProyecto,
	idRol,
	cartaCesionDerechosPatrimonio,
	porcentajePropiedadIntelectual,
	horasSemana,
	mesesDedicados)
	VALUES
	(varidPersonalExterno,
	 varidProyecto,
	 varidRol,
	 varcartaCesionDerechosPatrimonio,
	 varporcentajePropiedadIntelectual,
	 varhorasSemana,
	 varmesesDedicados);
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarPlazoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarPlazoProyecto`(
 varIdProyecto bigint(20), 
 varDescripcion varchar(100),
 varMesesAprobados int(11),
 varFechaActa datetime,
 varNumeroActa varchar(45),
 varFechaActaCODI datetime,
 varNumeroActaCODI varchar(45),
 OUT varIdPlazo bigint(20)
)
BEGIN

INSERT INTO Plazosproyectos
(
idProyecto,
fecha,
descripcion,
mesesAprobados,
fechaActa,
NumeroActa,
FechaActaCODI,
NumeroActaCODI)
VALUES
(varIdProyecto,
 now(),
 varDescripcion,
 varMesesAprobados,
 varFechaActa,
 varNumeroActa,
 varFechaActaCODI,
 varNumeroActaCODI );

SET varIdPlazo = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarPrivilegio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarPrivilegio`(
	IN varNombre varchar(50),
	IN varCodigo varchar(45),
    out varIdPrivilegio int
)
BEGIN
   
	select MAX(IdPrivilegio) + 1 
    into varIdPrivilegio
    FROM privilegios;
   
	INSERT INTO privilegios
	(idPrivilegio,
	nombre,
	codigo)
	VALUES
	(varidPrivilegio,
	 varnombre,
	varcodigo);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarPrivilegioUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarPrivilegioUsuario`(
	varIdUsuario int,
	varIdPrivilegio int
)
BEGIN

INSERT INTO privilegiosUsuario (idusuario, idprivilegio)
VALUES (varIdUsuario, varIdPrivilegio);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarProfesorProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarProfesorProyecto`(
 varIdProyecto bigint(20), 
 varIdTipoIdentificacion int(11),
 varNombres varchar(250),
 varApellidos varchar(250),
 varNumeroIdentificacion bigint(20),
 varCorreoElectronico varchar(250),
 varContacto varchar(100),
 varidRol int(11),
 varidFacultad int(11),
 varidTipoVinculacion int,
 varcartaCesionDerechosPatrimonio tinyint(1),
 varporcentajePI decimal(18,2),
 varhorasSemana int(11),
 varmesesDedicados int(11),
 varhorasSemanaFueraPlan int(11),
 varmesesFueraPlan int(11)
)
BEGIN

  DECLARE varIdProfesor bigint(20);
  
  SELECT idProfesor 
  INTO varIdProfesor
  FROM profesores
  WHERE idtipoidentificacion = varIdTipoIdentificacion
   AND numeroIdentificacion = varNumeroIdentificacion;
   
  IF  varIdProfesor IS NOT NULL THEN
	 UPDATE profesores
	 SET nombres = varNombres,
			apellidos = varApellidos,
			correoElectronico = varCorreoElectronico,
			contacto = varContacto
	 WHERE idProfesor = varIdProfesor;
  
  ELSE
  
     INSERT INTO profesores
     (idTipoIdentificacion,
      nombres,
      apellidos,
      numeroIdentificacion,
      correoElectronico,
      contacto)
     VALUES
	 (varidTipoIdentificacion,
	 varnombres,
	 varapellidos,
	 varnumeroIdentificacion,
	 varcorreoElectronico,
	 varcontacto
     );
  
    SET varIdProfesor = LAST_INSERT_ID();
  
  END if;
  
	INSERT INTO profesoresproyectos
	(idProfesor,
	idProyecto,
	idRol,
	idFacultad,
	idTipoVinculacion,
	cartaCesionDerechosPatrimonio,
	porcentajePI,
	horasSemana,
	mesesDedicados,
	horasSemanaFueraPlan,
	mesesFueraPlan)
	VALUES
	(varidProfesor,
	 varidProyecto,
	 varidRol,
	 varidFacultad,
	 varidTipoVinculacion,
	 varcartaCesionDerechosPatrimonio,
	 varporcentajePI,
	 varhorasSemana,
	 varmesesDedicados,
	 varhorasSemanaFueraPlan,
	 varmesesFueraPlan);
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarProrrogaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarProrrogaProyecto`(
 varIdProyecto bigint(20), 
 varDescripcion varchar(100),
 varMesesAprobados int(11),
 varMontoAprobado bigint,
 varFechaActa datetime,
 varNumeroActa varchar(45),
 varfechaActaCODI datetime,
 varNumeroActaCODI varchar(45),
 OUT varIdProrroga bigint(20)
)
BEGIN

INSERT INTO Prorrogasproyectos
(
idProyecto,
fecha,
descripcion,
mesesAprobados,
MontoAprobado,
FechaActa,
NumeroActa,
fechaActaCODI,
NumeroActaCODI)
VALUES
(varIdProyecto,
 now(),
 varDescripcion,
 varMesesAprobados,
 varMontoAprobado,
 varFechaActa,
 varNumeroActa,
 varfechaActaCODI,
 varNumeroActaCODI 
 );

SET varIdProrroga = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarProyecto`(
   varNombreCompletoProyecto varchar(300),
   varNombreCortoProyecto varchar(100),
   varFechaInicio datetime,
   varFechaFinalizacion datetime,
   varIdAreaTematica int(11),
   varCodigoCOLCIENCIAS varchar(50),
   varCodigo varchar(15),
   varParticipacionInternacional tinyint(1),
   varIdTipoProyecto int(11),
   varIdRiesgoEtico int(11),
   varIdTipoContrato int(11),
   varIdEnfoqueMetodologico int(11),
   varIdConvocatoria int(11),
   varObjetivoGeneral varchar(300),
   varIdUsuarioCreacion bigint(11),
   OUT varIdProyecto bigint(20)
)
BEGIN
INSERT INTO proyectos
(
`nombreCompletoProyecto`,
`nombreCortoProyecto`,
`fechaInicio`,
`fechaFinalizacion`,
`idAreaTematica`,
`codigoCOLCIENCIAS`,
`codigo`,
`participacionInternacional`,
`idTipoProyecto`,
`idRiesgoEtico`,
`idTipoContrato`,
`idEnfoqueMetodologico`,
`idConvocatoria`,
`objetivoGeneral`,
`fechaCreacion`,
`idUsuarioCreacion`)
VALUES
(
varNombreCompletoProyecto,
varNombreCortoProyecto,
varfechaInicio,
varfechaFinalizacion,
varidAreaTematica,
varcodigoCOLCIENCIAS,
varcodigo,
varparticipacionInternacional,
varidTipoProyecto,
varidRiesgoEtico,
varidTipoContrato,
varidEnfoqueMetodologico,
varidConvocatoria,
varobjetivoGeneral,
now(),
varidUsuarioCreacion);

SET varIdProyecto = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `IngresarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarUsuario`(
	IN varNombreUsuario varchar(50),
	IN varNombres varchar(250),
	IN varApellidos varchar(250),
    IN varClave varchar(50),
    IN varCorreoElectronico varchar(100),
    OUT varIdUsuario bigint
)
BEGIN
   
	INSERT INTO usuarios
	(nombres,
	apellidos,
	nombreUsuario,
	clave,
	correoElectronico)
	VALUES
	(varnombres,
	varapellidos,
	varnombreUsuario,
	varclave,
	varcorreoElectronico);

	SET varIdUsuario = LAST_INSERT_ID();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerActasProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerActasProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT act.idActa, act.fecha, act.observaciones, tip.idtipoacta, tip.nombre descripciontipoacta, act.numero
FROM actasProyectos act
 inner join tiposActa tip on act.idtipoacta = tip.idtipoacta
WHERE act.idProyecto = varIdProyecto
ORDER BY fecha;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerAdendasCambioProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAdendasCambioProyecto`(
 varIdProyecto bigint(20)
)
BEGIN


SELECT ad.idAdenda, 
       ad.observaciones, 
       ad.fechaCambio,
       ad.fechaacta,
       ad.numeroacta,
       ad.observaciones,
       ad.idrol,
       r.nombre nombrerol,
       tp.idtipopersona,
       tp.nombre nombretipopersona,

       tipa.idTipoIdentificacion idTipoIdentificacionPersonaAnterior,
       tipa.nombre nombreTipoIdentificacionPersonaAnterior,
       proa.nombres nombresPersonaAnterior,
       proa.apellidos apellidosPersonaAnterior,
       proa.numeroIdentificacion numeroIdentificacionpersonaAnterior,

       ti.idTipoIdentificacion idTipoIdentificacionPersona,
       ti.nombre nombreTipoIdentificacionPersona,
       pro.nombres nombresPersona,
       pro.apellidos apellidosPersona,
       pro.numeroIdentificacion numeroIdentificacionpersona
FROM adendascambioproyectos ad
 inner join roles r on ad.idrol = r.idrol
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN profesores pro on ad.idpersona = pro.idprofesor
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = pro.idTipoIdentificacion
 INNER JOIN profesores proa on ad.idpersonaanterior = proa.idprofesor
 INNER JOIN tiposIdentificacion tipa on tipa.idTipoIdentificacion = proa.idTipoIdentificacion
WHERE ad.idProyecto = varIdProyecto
and tp.idtipopersona = 1

union all

SELECT ad.idAdenda, 
       ad.observaciones, 
       ad.fechaCambio,
       ad.fechaacta,
       ad.numeroacta,
       ad.observaciones,
       ad.idrol,
       r.nombre nombrerol,
       tp.idtipopersona,
       tp.nombre nombretipopersona,

       tipa.idTipoIdentificacion idTipoIdentificacionPersonaAnterior,
       tipa.nombre nombreTipoIdentificacionPersonaAnterior,
       esta.nombres nombresPersonaAnterior,
       esta.apellidos apellidosPersonaAnterior,
       esta.numeroIdentificacion numeroIdentificacionpersonaAnterior,

       ti.idTipoIdentificacion idTipoIdentificacionpersona,
       ti.nombre nombreTipoIdentificacionpersona,
       est.nombres nombresPersona,
       est.apellidos apellidospersona,
       est.numeroIdentificacion numeroIdentificacionpersona
FROM adendascambioproyectos ad
 inner join roles r on ad.idrol = r.idrol
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN Estudiantes est on ad.idPersona = est.idEstudiante
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = est.idTipoIdentificacion
 INNER JOIN Estudiantes esta on ad.idPersonaAnterior = esta.idEstudiante
 INNER JOIN tiposIdentificacion tipa on tipa.idTipoIdentificacion = esta.idTipoIdentificacion
WHERE ad.idProyecto = varIdProyecto
and tp.idtipopersona = 2

union all

SELECT ad.idAdenda, 
       ad.observaciones, 
       ad.fechaCambio,
       ad.fechaacta,
       ad.numeroacta,
       ad.observaciones,
       ad.idrol,
       r.nombre nombrerol,
       tp.idtipopersona,
       tp.nombre nombretipopersona,

       tipa.idTipoIdentificacion idTipoIdentificacionPersonaAnterior,
       tipa.nombre nombreTipoIdentificacionPersonaAnterior,
       pea.nombres nombresPersonaAnterior,
       pea.apellidos apellidosPersonaAnterior,
       pea.numeroIdentificacion numeroIdentificacionpersonaAnterior,

       ti.idTipoIdentificacion idTipoIdentificacionpersona,
       ti.nombre nombreTipoIdentificacionpersona,
       pe.nombres nombrespersona,
       pe.apellidos apellidospersona,
       pe.numeroIdentificacion numeroIdentificacionpersona
FROM adendascambioproyectos ad
 inner join roles r on ad.idrol = r.idrol
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN PersonalExterno pe on pe.idPersonalExterno = ad.idPersona
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = pe.idTipoIdentificacion
 INNER JOIN PersonalExterno pea on pea.idPersonalExterno = ad.idPersonaAnterior
 INNER JOIN tiposIdentificacion tipa on tipa.idTipoIdentificacion = pea.idTipoIdentificacion
WHERE ad.idProyecto = varIdProyecto
and tp.idtipopersona = 3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerAdendasIngresoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAdendasIngresoProyecto`(
 varIdProyecto bigint(20)
)
BEGIN


SELECT ad.idAdenda, 
       ad.fechaingreso,
       ad.fechaacta,
       ad.numeroacta,
       tp.idtipopersona,
       tp.nombre nombretipopersona,
       ti.idTipoIdentificacion idTipoIdentificacionpersona,
       ti.nombre nombreTipoIdentificacionpersona,
       pro.nombres nombrespersona,
       pro.apellidos apellidospersona,
       pro.numeroIdentificacion numeroIdentificacionpersona
FROM adendasingresoproyectos ad
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN profesores pro on ad.idpersona = pro.idprofesor
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = pro.idTipoIdentificacion
WHERE ad.idProyecto = varIdProyecto
and tp.idtipopersona = 1

union all

SELECT ad.idAdenda, 
       ad.fechaingreso,
       ad.fechaacta,
       ad.numeroacta,
       tp.idtipopersona,
       tp.nombre nombretipopersona,
       ti.idTipoIdentificacion idTipoIdentificacionpersona,
       ti.nombre nombreTipoIdentificacionpersona,
       est.nombres nombrespersona,
       est.apellidos apellidospersona,
       est.numeroIdentificacion numeroIdentificacionpersona
FROM adendasingresoproyectos ad
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN Estudiantes est on ad.idPersona = est.idEstudiante
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = est.idTipoIdentificacion
WHERE ad.idProyecto = varIdProyecto
and tp.idtipopersona = 2

union all

SELECT ad.idAdenda, 
       ad.fechaIngreso,
       ad.fechaacta,
       ad.numeroacta,
       tp.idtipopersona,
       tp.nombre nombretipopersona,
       ti.idTipoIdentificacion idTipoIdentificacionpersona,
       ti.nombre nombreTipoIdentificacionpersona,
       pe.nombres nombrespersona,
       pe.apellidos apellidospersona,
       pe.numeroIdentificacion numeroIdentificacionpersona
FROM adendasingresoproyectos ad
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN PersonalExterno pe on pe.idPersonalExterno = ad.idPersona
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = pe.idTipoIdentificacion
WHERE ad.idProyecto = varIdProyecto
and tp.idtipopersona = 3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerAdendasRetiroProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAdendasRetiroProyecto`(
 varIdProyecto bigint(20)
)
BEGIN


SELECT ad.idAdenda, 
       ad.fecharetiro,
       ad.fechaacta,
       ad.numeroacta,
       ad.motivo,
       tp.idtipopersona,
       tp.nombre nombretipopersona,
       ti.idTipoIdentificacion idTipoIdentificacionpersona,
       ti.nombre nombreTipoIdentificacionpersona,
       pro.nombres nombrespersona,
       pro.apellidos apellidospersona,
       pro.numeroIdentificacion numeroIdentificacionpersona
FROM adendasretiroproyectos ad
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN profesores pro on ad.idpersona = pro.idprofesor
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = pro.idTipoIdentificacion
WHERE ad.idProyecto = varIdProyecto
 and tp.idtipopersona = 1

union all

SELECT ad.idAdenda, 
       ad.fecharetiro,
       ad.fechaacta,
       ad.numeroacta,
       ad.motivo,
       tp.idtipopersona,
       tp.nombre nombretipopersona,
       ti.idTipoIdentificacion idTipoIdentificacionpersona,
       ti.nombre nombreTipoIdentificacionpersona,
       est.nombres nombrespersona,
       est.apellidos apellidospersona,
       est.numeroIdentificacion numeroIdentificacionpersona
FROM adendasretiroproyectos ad
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN Estudiantes est on ad.idPersona = est.idEstudiante
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = est.idTipoIdentificacion
WHERE ad.idProyecto = varIdProyecto
and tp.idtipopersona = 2

union all

SELECT ad.idAdenda, 
       ad.fecharetiro,
       ad.fechaacta,
       ad.numeroacta,
       ad.motivo,
       tp.idtipopersona,
       tp.nombre nombretipopersona,
       ti.idTipoIdentificacion idTipoIdentificacionpersona,
       ti.nombre nombreTipoIdentificacionpersona,
       pe.nombres nombrespersona,
       pe.apellidos apellidospersona,
       pe.numeroIdentificacion numeroIdentificacionpersona
FROM adendasretiroproyectos ad
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN PersonalExterno pe on pe.idPersonalExterno = ad.idPersona
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = pe.idTipoIdentificacion
WHERE ad.idProyecto = varIdProyecto
and tp.idtipopersona = 3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerAdicionesProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAdicionesProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT idAdicion, monto, descripcion, 
fechaActa,
numeroActa,
fechaActaCODI,
numeroActaCODI
FROM adicionesproyectos
WHERE idProyecto = varIdProyecto
ORDER BY fecha;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerAlertasAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAlertasAvalProyecto`(
 varIdProyecto bigint(20)
)
BEGIN


SELECT aa.idAlertaAvalProyecto, 
       aa.fechaacta,
       aa.numeroacta,
       ta.idtipoaval,
       ta.nombre nombretipoaval,
       aa.descripcion
FROM alertasavalproyectos aa
 inner join tiposaval ta on ta.idtipoaval = aa.idtipoaval
WHERE aa.idProyecto = varIdProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerAreasTematicas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerAreasTematicas`(

)
BEGIN
SELECT idAreaTematica,
   nombre
FROM AreasTematicas
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCantidadProyectosPorEstado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCantidadProyectosPorEstado`(
	out varCantidadProyectosEjecucion int(11),
    out varCantidadProyectosFinalizados int(11),
	out varCantidadProyectosAtrasados int(11),
	out varCantidadProyectosTrasladados int(11),
	out varCantidadProyectosCancelados int(11)
)
BEGIN
	  DECLARE varIdProyecto bigint;
      DECLARE varIdEstado int;
      DECLARE done INT DEFAULT 0;
      DECLARE CursorProyectos CURSOR FOR
      SELECT IdProyecto
	  FROM Proyectos;

      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	 SET varCantidadProyectosEjecucion = 0;
     SET varCantidadProyectosFinalizados = 0;
	 SET varCantidadProyectosAtrasados = 0;
	 SET varCantidadProyectosTrasladados = 0;
	 SET varCantidadProyectosCancelados = 0;

      OPEN CursorProyectos;
      REPEAT
        FETCH CursorProyectos INTO varIdProyecto;

        IF NOT done THEN
		    
            SET varIdEstado = ObtenerEstadoProyecto(varIdProyecto);
            IF varIdEstado = 1 THEN
				SET varCantidadProyectosEjecucion = varCantidadProyectosEjecucion + 1;
            ELSEIF varIdEstado = 2 THEN
                SET varCantidadProyectosFinalizados = varCantidadProyectosFinalizados + 1;
            ELSEIF varIdEstado = 3 THEN
				SET varCantidadProyectosAtrasados = varCantidadProyectosAtrasados + 1;
            ELSEIF varIdEstado = 4 THEN
				SET varCantidadProyectosTrasladados = varCantidadProyectosTrasladados + 1;
            ELSEIF varIdEstado = 5 THEN
				SET varCantidadProyectosCancelados = varCantidadProyectosCancelados + 1;
            END IF;
        END IF;

      UNTIL done END REPEAT;
      CLOSE CursorProyectos;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCantidadProyectosPorEstadoPorAnyo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCantidadProyectosPorEstadoPorAnyo`(

)
BEGIN
	  DECLARE varIdProyecto bigint;
      DECLARE varIdEstado int;
      DECLARE varAnyo int;
      DECLARE varAnyoAnterior int;
      
      DECLARE varCantidadProyectosEjecucion int(11);
      DECLARE varCantidadProyectosFinalizados int(11);
	  DECLARE varCantidadProyectosAtrasados int(11);
	  DECLARE varCantidadProyectosTrasladados int(11);
	  DECLARE varCantidadProyectosCancelados int(11);
      
      DECLARE done INT DEFAULT 0;
      DECLARE CursorProyectos CURSOR FOR
      SELECT year(fechaCreacion), IdProyecto
	  FROM Proyectos
      ORDER BY year(fechaCreacion);

      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	 SET varCantidadProyectosEjecucion = 0;
     SET varCantidadProyectosFinalizados = 0;
	 SET varCantidadProyectosAtrasados = 0;
	 SET varCantidadProyectosTrasladados = 0;
	 SET varCantidadProyectosCancelados = 0;
	 
	 CREATE TEMPORARY TABLE IF NOT EXISTS CantidadProyectosPorEstadoPorAnyo (anyo int, ejecucion int(11),
																			 finalizados int(11), atrasados int(11), trasladados int(11), cancelados int(11)) ENGINE = MEMORY;
     DELETE FROM CantidadProyectosPorEstadoPorAnyo;
    
     OPEN CursorProyectos;
     REPEAT
        FETCH CursorProyectos INTO varAnyo, varIdProyecto;

        IF NOT done THEN
		    IF varAnyoAnterior IS NULL THEN
				SET varAnyoAnterior = varAnyo;
            END IF;
            IF varAnyoAnterior <> varAnyo THEN
				INSERT INTO CantidadProyectosPorEstadoPorAnyo (anyo, ejecucion, finalizados, atrasados, trasladados, cancelados) 
                VALUES (varAnyoAnterior, varCantidadProyectosEjecucion, varCantidadProyectosFinalizados, varCantidadProyectosAtrasados, varCantidadProyectosTrasladados, varCantidadProyectosCancelados);

				SET varCantidadProyectosEjecucion = 0;
				SET varCantidadProyectosFinalizados = 0;
				SET varCantidadProyectosAtrasados = 0;
				SET varCantidadProyectosTrasladados = 0;
				SET varCantidadProyectosCancelados = 0;
                SET varAnyoAnterior = varAnyo;
            END IF;
            
			SET varIdEstado = ObtenerEstadoProyecto(varIdProyecto);
			IF varIdEstado = 1 THEN
				SET varCantidadProyectosEjecucion = varCantidadProyectosEjecucion + 1;
			ELSEIF varIdEstado = 2 THEN
				SET varCantidadProyectosFinalizados = varCantidadProyectosFinalizados + 1;
			ELSEIF varIdEstado = 3 THEN
				SET varCantidadProyectosAtrasados = varCantidadProyectosAtrasados + 1;
			ELSEIF varIdEstado = 4 THEN
				SET varCantidadProyectosTrasladados = varCantidadProyectosTrasladados + 1;
			ELSEIF varIdEstado = 5 THEN
				SET varCantidadProyectosCancelados = varCantidadProyectosCancelados + 1;
			END IF;
        END IF;

     UNTIL done END REPEAT;
     CLOSE CursorProyectos;

	 INSERT INTO CantidadProyectosPorEstadoPorAnyo (anyo, ejecucion, finalizados, atrasados, trasladados, cancelados) 
	 VALUES (varAnyoAnterior, varCantidadProyectosEjecucion, varCantidadProyectosFinalizados, varCantidadProyectosAtrasados, varCantidadProyectosTrasladados, varCantidadProyectosCancelados);

	 SELECT anyo, ejecucion, finalizados, atrasados, trasladados, cancelados
     FROM CantidadProyectosPorEstadoPorAnyo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerClaveUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerClaveUsuario`(
	varIdusuario int(20),
	out varClave varchar(50)
)
BEGIN
SELECT 
    clave
INTO
	varClave
FROM usuarios
WHERE idUsuario = varIdUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCompromisosHomologadosProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCompromisosHomologadosProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT ch.idcompromisoHomologadoProyecto, 
       ch.idCompromisoProyecto, 
       co.descripcion descripcionCompromisoProyecto, 
       ch.idCompromisoProyectoHomologado, 
       coh.descripcion descripcionCompromisoProyectoHomologado, 
       ch.fechaActa, 
       ch.numeroacta,
       ch.descripcion,
       ch.observaciones
FROM compromisoshomologadosproyectos ch 
 inner join compromisosproyectos co on co.idCompromisoproyecto = ch.idCompromisoProyecto
 inner join compromisosproyectos coh on coh.idCompromisoproyecto = ch.idCompromisoProyectoHomologado
WHERE co.idProyecto = varIdProyecto
ORDER BY co.descripcion;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCompromisosProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCompromisosProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT co.idCompromisoProyecto, 
       co.descripcion, 
       co.IdTipoCompromiso,
       co.soporte, 
       tc.nombre nombretipocompromiso 
FROM compromisosproyectos co
 inner join tiposcompromiso tc on tc.idtipocompromiso = co.idtipocompromiso
WHERE co.idProyecto = varIdProyecto
ORDER BY co.descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCompromisosProyectoPorCumplir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCompromisosProyectoPorCumplir`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT co.idCompromisoProyecto, 
       co.descripcion
FROM compromisosproyectos co
WHERE co.idProyecto = varIdProyecto
 AND not exists (SELECT idcumplimientocompromisoproyecto 
				 FROM cumplimientocompromisosproyectos
                 WHERE idCompromisoProyecto = co.idCompromisoProyecto)
 and not exists (select chp.idCompromisoProyectoHomologado 
				 from compromisoshomologadosproyectos chp
				 where chp.idCompromisoProyectoHomologado = co.idCompromisoProyecto)                 
ORDER BY co.descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCompromisosSeguimientoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCompromisosSeguimientoProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT co.descripcion,
       (SELECT CASE count(idcumplimientocompromisoproyecto)             
                  WHEN 0 THEN 'Pendiente'
                  ELSE 'Cumplido'
               END  
			FROM cumplimientocompromisosproyectos
            WHERE idCompromisoProyecto = co.idCompromisoProyecto
	   ) estado
FROM compromisosproyectos co
WHERE co.idProyecto = varIdProyecto
 and not exists (select chp.idCompromisoProyectoHomologado 
				 from compromisoshomologadosproyectos chp
				 where chp.idCompromisoProyectoHomologado = co.idCompromisoProyecto)                 
ORDER BY co.descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerConvocatorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerConvocatorias`(

)
BEGIN
SELECT idConvocatoria,
   nombre
FROM Convocatorias
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCumplimientoAlertasAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCumplimientoAlertasAvalProyecto`(
 varIdProyecto bigint(20)
)
BEGIN


SELECT caa.idcumplimientoalertaavalproyecto,
	   caa.idAlertaAvalProyecto,
       aa.descripcion descripcionAlertaAvalProyecto, 
       caa.fechaacta,
       caa.numeroacta,
       ta.nombre nombretipoaval
FROM cumplimientoalertasavalproyectos caa
 inner join alertasavalproyectos aa on aa.idAlertaAvalProyecto = caa.idAlertaAvalProyecto
 inner join tiposaval ta on ta.idtipoaval = aa.idtipoaval
WHERE aa.idProyecto = varIdProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCumplimientoCompromisosProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCumplimientoCompromisosProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT cco.idcumplimientocompromisoproyecto, 
       co.idCompromisoproyecto, 
       co.descripcion descripcionCompromisoProyecto, 
       cco.fechaActa, 
       cco.numeroacta 
FROM cumplimientocompromisosproyectos cco 
 inner join compromisosproyectos co on co.idCompromisoProyecto = cco.idCompromisoProyecto
WHERE co.idProyecto = varIdProyecto
ORDER BY co.descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoActaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoActaProyecto`(
 varIdActa bigint(20),
 out varNombre varchar(200),
 out varTipoContenido varchar(200),
 out varContenido longblob
)
BEGIN

SELECT nombre, tipocontenido, contenido
INTO varnombre, vartipocontenido, varcontenido
FROM documentoactasproyectos
WHERE idacta = varIdActa;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoAdendaCambioProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoAdendaCambioProyecto`(
 varIdAdenda bigint(20),
 out varNombre varchar(200),
 out varTipoContenido varchar(200),
 out varContenido longblob
)
BEGIN

SELECT nombre, tipocontenido, contenido
INTO varnombre, vartipocontenido, varcontenido
FROM documentoadendascambioproyectos
WHERE idAdenda = varIdAdenda;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoAdendaIngresoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoAdendaIngresoProyecto`(
 varIdAdenda bigint(20),
 out varNombre varchar(200),
 out varTipoContenido varchar(200),
 out varContenido longblob
)
BEGIN

SELECT nombre, tipocontenido, contenido
INTO varnombre, vartipocontenido, varcontenido
FROM documentoadendasingresoproyectos
WHERE idAdenda = varIdAdenda;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoAdendaRetiroProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoAdendaRetiroProyecto`(
 varIdAdenda bigint(20),
 out varNombre varchar(200),
 out varTipoContenido varchar(200),
 out varContenido longblob
)
BEGIN

SELECT nombre, tipocontenido, contenido
INTO varnombre, vartipocontenido, varcontenido
FROM documentoadendasretiroproyectos
WHERE idAdenda = varIdAdenda;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoAdicionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoAdicionProyecto`(
 varIdAdicion bigint(20),
 out varNombre varchar(200),
 out varTipoContenido varchar(200),
 out varContenido longblob 
)
BEGIN

SELECT nombre, tipocontenido, contenido
INTO varnombre, vartipocontenido, varcontenido
FROM documentoadicionesproyectos
WHERE idadicion = varIdAdicion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoCumplimientoAlertaAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoCumplimientoAlertaAvalProyecto`(
 varidcumplimientoalertaavalproyecto bigint(20),
 out varNombre varchar(200),
 out varTipoContenido varchar(200),
 out varContenido longblob
)
BEGIN

SELECT nombre, tipocontenido, contenido
INTO varnombre, vartipocontenido, varcontenido
FROM documentocumplimientoalertasavalproyectos
WHERE idcumplimientoalertaavalproyecto = varidcumplimientoalertaavalproyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoCumplimientoCompromisoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoCumplimientoCompromisoProyecto`(
 varidcumplimientocompromisoproyecto bigint(20),
 out varNombre varchar(200),
 out varTipoContenido varchar(200),
 out varContenido longblob
)
BEGIN

SELECT nombre, tipocontenido, contenido
INTO varnombre, vartipocontenido, varcontenido
FROM documentocumplimientocompromisosproyectos
WHERE idcumplimientocompromisoproyecto = varidcumplimientocompromisoproyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoPlazoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoPlazoProyecto`(
 varIdPlazo bigint(20),
 out varNombre varchar(200),
 out varTipoContenido varchar(200),
 out varContenido longblob 
)
BEGIN

SELECT nombre, tipocontenido, contenido
INTO varnombre, vartipocontenido, varcontenido
FROM documentoPlazosproyectos
WHERE idPlazo = varIdPlazo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoProrrogaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoProrrogaProyecto`(
 varIdProrroga bigint(20),
 out varNombre varchar(200),
 out varTipoContenido varchar(200),
 out varContenido longblob 
)
BEGIN

SELECT nombre, tipocontenido, contenido
INTO varnombre, vartipocontenido, varcontenido
FROM documentoProrrogasproyectos
WHERE idProrroga = varIdProrroga;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerEnfoquesMetodologicos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerEnfoquesMetodologicos`(

)
BEGIN
SELECT idEnfoqueMetodologico,
   nombre
FROM enfoquesMetodologicos
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerEntidadesInternacionalesProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerEntidadesInternacionalesProyecto`(
 varidProyecto bigint(20)
)
BEGIN

SELECT idEntidadInternacionalProyecto, nombre
FROM entidadesinternacionalesproyectos
WHERE idProyecto = varidProyecto
order by nombre;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerEstadosProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerEstadosProyecto`(

)
BEGIN
SELECT idEstadoProyecto,
   nombre
FROM EstadosProyecto
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerEstudiante`(
	in varNumeroIdentificacion bigint(20),
    in varIdTipoIdentificacion int(11),
    out varIdEstudiante bigint(20),
	out varNombres varchar(250),
	out varApellidos varchar(250),
    out varIdTipoEstudiante int(11),
    out varDescripcionTipoEstudiante varchar(45),
    out varContacto varchar(100),
    out varCorreoElectronico varchar(250)
)
BEGIN
SELECT 
   es.idEstudiante,
   es.nombres,
   es.apellidos,
   es.contacto,
   es.correoElectronico,
   es.IdTipoEstudiante,
   te.nombre
INTO
   varidEstudiante,
   varnombres,
   varapellidos,
   varcontacto,
   varcorreoElectronico,
   varIdTipoEstudiante,
   varDescripcionTipoEstudiante
FROM estudiantes es
 INNER JOIN tiposEstudiantes te on es.IdTipoEstudiante = te.IdTipoEstudiante
WHERE es.numeroIdentificacion = varNumeroIdentificacion
and es.idTipoIdentificacion = varIdTipoIdentificacion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerEstudiantesProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerEstudiantesProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT ep.idEstudiante,
       ep.idRol,
       r.nombre descripcionRol,
       ep.idPrograma,
       p.nombre descripcionprograma,
       ep.porcentajePropiedadIntelectual,
       ep.horasSemana,
       ep.mesesDedicados,
       ep.semestre,
       est.idTipoIdentificacion,
       ti.nombre descripcionTipoIdentificacion,
       est.nombres,
       est.apellidos,
       est.numeroIdentificacion,
       est.correoElectronico,
       est.contacto,
       est.idtipoestudiante,
       te.nombre descripciontipoestudiante
FROM EstudiantesProyectos ep
  INNER JOIN Estudiantes est on ep.idEstudiante = est.idEstudiante
  INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = est.idTipoIdentificacion
  INNER JOIN roles r on r.idrol = ep.idrol
  INNER JOIN programas p on p.idprograma = ep.idprograma
  INNER JOIN tiposestudiantes te on te.idtipoestudiante = est.idtipoestudiante
WHERE idProyecto = varIdProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerFacultades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerFacultades`(

)
BEGIN
SELECT idFacultad,
   nombre
FROM Facultades
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerFuentesFinanciacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerFuentesFinanciacion`(

)
BEGIN
SELECT idFuenteFinanciacion,
   nombre
FROM fuentesfinanciacion
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerFuentesFinanciacionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerFuentesFinanciacionProyecto`(
 varidproyecto bigint(20)
)
BEGIN

SELECT ffp.idfuentefinanciacionproyecto,
	   ffp.idProyecto,
	   ffp.idFuenteFinanciacion,
       ff.nombre nombreFuenteFinanciacion,
	   ffp.idTipoFuenteFinanciacionProyecto,
       tffp.nombre nombreTipoFuenteFinanciacionProyecto,
	   ffp.montoFrescos,
	   ffp.montoEspecies
FROM fuentesfinanciacionproyectos ffp
 INNER JOIN fuentesfinanciacion ff ON ff.idfuentefinanciacion = ffp.idfuentefinanciacion
 INNER JOIN tiposfuentefinanciacionproyecto tffp on tffp.idTipoFuenteFinanciacionProyecto = ffp.idTipoFuenteFinanciacionProyecto
WHERE idProyecto = varidproyecto
ORDER BY idfuentefinanciacionproyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerFuentesFinanciacionProyectos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerFuentesFinanciacionProyectos`()
BEGIN

	select year(pro.fechaCreacion) anyoCreacion,
		   ObtenerNombreEstadoProyecto(pro.IdProyecto) estadoProyecto,
           pro.codigo,
           pro.nombreCompletoProyecto,
           ff.nombre fuentefinanciacionprincipal,
           ffp.montoFrescos monto,
           ffa.nombre fuentefinanciacion,
           tffa.nombre tipofuentefinanciacion,
           (select sum(montofrescos) from fuentesfinanciacionproyectos where idproyecto = pro.idproyecto) montoTotal,
           ObtenerNombreInvestigadorPrincipalProyecto(pro.idProyecto) investigadorPrincipal,
           gi.nombre grupoInvestigacion
     from proyectos pro
      inner join fuentesfinanciacionproyectos ffp on ffp.idProyecto = pro.idproyecto and ffp.idTipoFuenteFinanciacionProyecto = 1
      inner join tiposfuentefinanciacionproyecto tffp on tffp.idTipoFuenteFinanciacionProyecto = ffp.idTipoFuenteFinanciacionProyecto 
      inner join fuentesfinanciacion ff on ff.idFuenteFinanciacion = ffp.idFuenteFinanciacion
      inner join gruposinvestigacionproyectos gip on gip.idproyecto = pro.idproyecto
      inner join gruposinvestigacion gi on gi.idgrupoinvestigacion = gip.idgrupoinvestigacion
      left join fuentesfinanciacionproyectos ffpa on ffpa.idProyecto = pro.idproyecto and ffpa.idTipoFuenteFinanciacionProyecto <> 1
      left join tiposfuentefinanciacionproyecto tffpa on tffpa.idTipoFuenteFinanciacionProyecto = ffpa.idTipoFuenteFinanciacionProyecto 
      left join fuentesfinanciacion ffa on ffa.idFuenteFinanciacion = ffpa.idFuenteFinanciacion
      left join tiposfuentefinanciacion tffa on tffa.idTipoFuenteFinanciacion = ffa.idTipoFuenteFinanciacion;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerGruposInvestigacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerGruposInvestigacion`(

)
BEGIN
SELECT idGrupoInvestigacion,
   nombre
FROM GruposInvestigacion
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerGruposInvestigacionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerGruposInvestigacionProyecto`(
 varIdProyecto bigint
)
BEGIN
SELECT gi.idGrupoInvestigacion,
       gi.nombre,
       gip.principal
FROM GruposInvestigacion gi
 inner join gruposinvestigacionproyectos gip on gip.idGrupoInvestigacion = gi.idGrupoInvestigacion
WHERE gip.idProyecto = varIdProyecto
ORDER BY gi.nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerIntegrantesProyectos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerIntegrantesProyectos`()
BEGIN

	select year(pro.fechaCreacion) anyoCreacion,
           pro.codigo,
           pro.nombrecortoProyecto,
           'Profesor' tipoIntegrante,
           prof.numeroIdentificacion numeroIdentificacionIntegrante,
           concat(concat(prof.nombres, ' '), prof.apellidos) integrante,
           rol.nombre rolIntegrante
     from proyectos pro
      inner join profesoresproyectos profp on pro.idproyecto = profp.idproyecto
      inner join profesores prof on prof.idprofesor = profp.idprofesor
      inner join roles rol on rol.idrol = profp.idrol
      
      union all

	select year(pro.fechaCreacion) anyoCreacion,
           pro.codigo,
           pro.nombrecortoProyecto,
           'Estudiante' tipoIntegrante,
           est.numeroIdentificacion numeroIdentificacionIntegrante,
           concat(concat(est.nombres, ' '), est.apellidos) integrante,
           rol.nombre rolIntegrante
     from proyectos pro
      inner join estudiantesproyectos estp on pro.idproyecto = estp.idproyecto
      inner join estudiantes est on est.idestudiante = estp.idestudiante
      inner join roles rol on rol.idrol = estp.idrol

     union all
     
	select year(pro.fechaCreacion) anyoCreacion,
           pro.codigo,
           pro.nombrecortoProyecto,
           'Personal externo' tipoIntegrante,
           per.numeroIdentificacion numeroIdentificacionIntegrante,
           concat(concat(per.nombres, ' '), per.apellidos) integrante,
           rol.nombre rolIntegrante
     from proyectos pro
      inner join personalexternoproyectos perp on pro.idproyecto = perp.idproyecto
      inner join personalexterno per on per.idPersonalExterno = perp.idPersonalExterno
      inner join roles rol on rol.idrol = perp.idrol;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerObjetivosEspecificosProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerObjetivosEspecificosProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT idObjetivoEspecifico, descripcion 
FROM objetivosespecificos
WHERE idProyecto = varIdProyecto
ORDER BY descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerOpcionesMenuConUrl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerOpcionesMenuConUrl`()
begin
	select om.idopcionmenu, 
    case when om.idpadre IS NULL then om.nombre
                else concat(ompa.nombre, ' - ', om.nombre)  
		   end as nombre 
    from opcionesmenu om
    inner join opcionesmenuprivilegios omp on omp.idopcionmenu = om.idopcionmenu
    left join opcionesmenu ompa on ompa.idopcionmenu = om.idpadre
    where om.url is not null
    order by om.nivel, om.idpadre, om.orden;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerOpcionesMenuPrivilegio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerOpcionesMenuPrivilegio`(IN varIdPrivilegio int)
begin
	select om.idopcionmenu, om.nombre
    from opcionesmenu om
    inner join opcionesmenuprivilegios omp on omp.idopcionmenu = om.idopcionmenu
    where omp.idPrivilegio = varIdPrivilegio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerOpcionesMenuUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerOpcionesMenuUsuario`(IN varIdUsuario int)
begin
	Select distinct om.idopcionmenu, 
		   om.nombre, 
           om.nivel, 
           case when om.idpadre IS NULL then 0 
                else om.idpadre 
		   end as idpadre, 
           om.css, 
           om.url,
           om.visible
    from opcionesmenu om
	where om.idopcionmenu in (
							Select distinct om.idopcionmenu
							from privilegiosusuario privu
								inner join opcionesmenuprivilegios omp on omp.idprivilegio = privu.idprivilegio
								inner join opcionesmenu om on om.idopcionmenu = omp.idopcionmenu
							where privu.idusuario = varIdUsuario union all
							Select distinct om.idpadre
							from privilegiosusuario privu
								inner join opcionesmenuprivilegios omp on omp.idprivilegio = privu.idprivilegio
								inner join opcionesmenu om on om.idopcionmenu = omp.idopcionmenu
							where privu.idusuario = varIdUsuario 
                               and om.idpadre is not null
							 ) 
    order by om.nivel, om.idpadre, om.orden;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerPersonalExterno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPersonalExterno`(
	in varNumeroIdentificacion bigint(20),
    in varIdTipoIdentificacion int(11),
    out varIdPersonalExterno bigint(20),
	out varNombres varchar(250),
	out varApellidos varchar(250),
    out varCorreoElectronico varchar(250),
    out varEntidad varchar(100)
)
BEGIN
SELECT 
   idPersonalExterno,
   nombres,
   apellidos,
   correoElectronico,
   entidad
INTO
   varidPersonalExterno,
   varnombres,
   varapellidos,
   varcorreoElectronico,
   varEntidad
FROM personalExterno
WHERE numeroIdentificacion = varNumeroIdentificacion
and idTipoIdentificacion = varIdTipoIdentificacion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerPersonalExternoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPersonalExternoProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT pep.idPersonalExterno,
       pep.idRol,
       r.nombre descripcionRol,
       pep.cartaCesionDerechosPatrimonio,
       pep.porcentajePropiedadIntelectual,
       pep.horasSemana,
       pep.mesesDedicados,
       pe.idTipoIdentificacion,
       ti.nombre descripcionTipoIdentificacion,
       pe.nombres,
       pe.apellidos,
       pe.numeroIdentificacion,
       pe.correoElectronico,
       pe.entidad
FROM PersonalExternoproyectos pep
  INNER JOIN PersonalExterno pe on pe.idPersonalExterno = pep.idPersonalExterno
  INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = pe.idTipoIdentificacion
  INNER JOIN roles r on r.idrol = pep.idrol
WHERE idProyecto = varIdProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerPlazosProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPlazosProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT idPlazo, 
	   descripcion, 
       fecha, 
       mesesAprobados, 
       fechaActa,
	   NumeroActa,
	   FechaActaCODI,
	   NumeroActaCODI
FROM plazosproyectos
WHERE idProyecto = varIdProyecto
ORDER BY fecha;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerPlazosSeguimientoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPlazosSeguimientoProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT pla.mesesAprobados, 
	   DATE_ADD(pro.fechaFinalizacion, INTERVAL pla.mesesAprobados MONTH) fechaFin
FROM plazosproyectos pla
	inner join proyectos pro on pro.idProyecto = pla.idProyecto
WHERE pla.idProyecto = varIdProyecto
ORDER BY pla.idPlazo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerPrivilegio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPrivilegio`(
 varIdPrivilegio int,
 out varNombre varchar(50),
 out varCodigo varchar(45))
begin
	select pri.nombre, pri.codigo
    into varnombre, varcodigo
    from privilegios pri
    where pri.idprivilegio = varidprivilegio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerPrivilegioPorCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPrivilegioPorCodigo`(
  varCodigo varchar(45),
  out varIdPrivilegio int
)
begin
	select idPrivilegio
    into varIdPrivilegio
    from privilegios
    where codigo = varCodigo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerPrivilegios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPrivilegios`()
begin
	select pri.idprivilegio, pri.nombre, pri.codigo
    from privilegios pri
    order by pri.nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerPrivilegiosUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPrivilegiosUsuario`(IN varIdUsuario bigint)
begin
	select pri.idprivilegio, pri.nombre, pri.codigo
    from privilegios pri
    inner join privilegiosusuario priu on priu.idprivilegio = pri.idprivilegio
    where priu.idusuario = varIdUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProfesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProfesor`(
	in varNumeroIdentificacion bigint(20),
    in varIdTipoIdentificacion int(11),
    out varIdProfesor bigint(20),
	out varNombres varchar(250),
	out varApellidos varchar(250),
    out varContacto varchar(100),
    out varCorreoElectronico varchar(250)
)
BEGIN
SELECT 
   idProfesor,
   nombres,
   apellidos,
   contacto,
   correoElectronico
INTO
   varidProfesor,
   varnombres,
   varapellidos,
   varcontacto,
   varcorreoElectronico
FROM profesores
WHERE numeroIdentificacion = varNumeroIdentificacion
and idTipoIdentificacion = varIdTipoIdentificacion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProfesoresProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProfesoresProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT pp.idProfesor,
       pp.idRol,
       r.nombre descripcionRol,
       pp.idFacultad,
       f.nombre descripcionfacultad,
       pp.idTipoVinculacion,
       tv.nombre nombreTipoVinculacion,
       pp.cartaCesionDerechosPatrimonio,
       pp.porcentajePI,
       pp.horasSemana,
       pp.mesesDedicados,
       pp.horasSemanaFueraPlan,
       pp.mesesFueraPlan,
       pro.idTipoIdentificacion,
       ti.nombre descripcionTipoIdentificacion,
       pro.nombres,
       pro.apellidos,
       pro.numeroIdentificacion,
       pro.correoElectronico,
       pro.contacto       
FROM profesoresproyectos pp
  INNER JOIN profesores pro on pp.idprofesor = pro.idprofesor
  INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = pro.idTipoIdentificacion
  INNER JOIN roles r on r.idrol = pp.idrol
  INNER JOIN facultades f on f.idfacultad = pp.idFacultad
  INNER JOIN tiposVinculacion tv on tv.idtipovinculacion = pp.idtipovinculacion
WHERE idProyecto = varIdProyecto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProgramas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProgramas`(

)
BEGIN
SELECT idprograma,
   nombre
FROM programas
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProrrogasProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProrrogasProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT idProrroga, descripcion, mesesAprobados,  MontoAprobado, FechaActa, NumeroActa, fechaActaCODI, NumeroActaCODI
FROM prorrogasproyectos
WHERE idProyecto = varIdProyecto
ORDER BY fecha;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProrrogasSeguimientoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProrrogasSeguimientoProyecto`(
 varIdProyecto bigint(20)
)
BEGIN

SELECT prorro.mesesAprobados,  
       prorro.MontoAprobado monto, 
       DATE_ADD(pro.fechaFinalizacion, INTERVAL prorro.mesesAprobados MONTH) fechaFin
FROM prorrogasproyectos prorro
  inner join proyectos pro on pro.idProyecto = prorro.idProyecto
WHERE prorro.idProyecto = varIdProyecto
ORDER BY prorro.idProrroga;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProyecto`(
	in varIdProyecto bigint(20),
	out varNombreCompletoProyecto varchar(100),
	out varNombreCortoProyecto varchar(100),
	out varFechaInicio datetime,
	out varFechaFinalizacion datetime,
	out varIdAreaTematica int(11),
    out varAreaTematica varchar(50),
	out varIngresadoSIGEP tinyint(1),
	out varIngresadoSIIU tinyint(1),
	out varIngresadoSIU tinyint(1),
	out varCodigoSIIU varchar(50),
	out varCodigoCOLCIENCIAS varchar(50),
	out varCodigoSIU varchar(50),
	out varCodigo varchar(15),
	out varParticipacionInternacional tinyint(1),
	out varIdTipoProyecto int(11),
    out varTipoProyecto varchar(50),
	out varIdRiesgoEtico int(11),
    out varRiesgoEtico varchar(500),
	out varIdTipoContrato int(11),
    out varTipoContrato varchar(50),
	out varIdEnfoqueMetodologico int(11),
    out varEnfoqueMetodologico varchar(50),
	out varIdConvocatoria int(11),
    out varConvocatoria varchar(250),
	out varObjetivoGeneral varchar(100),
	out varIdEstado int(11),
    out varEstado varchar(50),
    out varfechaIngresadoSIGEP datetime
)
BEGIN
SELECT 
   pro.nombreCompletoProyecto,
   pro.nombreCortoProyecto,
   pro.fechaInicio,
   pro.fechaFinalizacion,
   pro.idAreaTematica,
   atem.nombre areaTematica,
   0,
   0,
   0,
   '',
   pro.codigoCOLCIENCIAS,
   '',
   pro.codigo,
   pro.participacionInternacional,
   pro.idTipoProyecto,
   tipProy.nombre tipoProyecto,
   pro.idRiesgoEtico,
   re.nombre riesgoEtico,
   pro.idTipoContrato,
   tc.nombre tipoContrato,
   pro.idEnfoqueMetodologico,
   em.nombre enfoqueMetodologico,
   pro.idConvocatoria,
   con.nombre convocatoria,
   pro.objetivoGeneral,
   null
INTO
	varNombreCompletoProyecto,
	varNombreCortoProyecto,
	varFechaInicio,
	varFechaFinalizacion,
	varIdAreaTematica,
    varAreaTematica,
	varIngresadoSIGEP,
	varIngresadoSIIU,
	varIngresadoSIU,
	varCodigoSIIU,
	varCodigoCOLCIENCIAS,
	varCodigoSIU,
	varCodigo,
	varParticipacionInternacional,
	varIdTipoProyecto,
    varTipoProyecto,
	varIdRiesgoEtico,
    varRiesgoEtico,
	varIdTipoContrato,
    varTipoContrato,
	varIdEnfoqueMetodologico,
    varEnfoqueMetodologico,
	varIdConvocatoria,
    varConvocatoria,
	varObjetivoGeneral,
    varfechaIngresadoSIGEP
FROM proyectos pro
  inner join areasTematicas atem on pro.idAreatematica = atem.idAreatematica
  inner join tiposProyecto tipProy on pro.idTipoProyecto = tipProy.idTipoProyecto
  inner join tiposContrato tc on pro.idTipoContrato = tc.idTipoContrato
  inner join enfoquesMetodologicos em on pro.idEnfoqueMetodologico = em.idEnfoqueMetodologico
  inner join convocatorias con on pro.idConvocatoria = con.idConvocatoria
  inner join riesgoseticos re on re.idRiesgoEtico = pro.idRiesgoEtico
WHERE idProyecto = varIdProyecto;

select nombre, idestadoProyecto
into varEstado, varIdEstado
from estadosproyecto
where idEstadoProyecto = ObtenerEstadoProyecto(varIdProyecto);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProyectos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProyectos`(
   varFechaInicio datetime,
   varFechaFinal datetime,
   varCodigo varchar(45),
   varDocumentoInvestigadorPrincipal bigint
)
BEGIN
   IF varFechaInicio IS NOT NULL AND varFechaFinal  IS NOT NULL THEN
		SELECT 
		   pro.idProyecto, 
           pro.codigo,
		   pro.nombreCortoProyecto,
		   pro.fechaCreacion,
		   pro.fechaInicio,
		   pro.fechaFinalizacion,
		   tipProy.nombre tipoProyecto,
		   est.nombre estadoProyecto
		FROM proyectos pro
		  inner join tiposProyecto tipProy on pro.idTipoProyecto = tipProy.idTipoProyecto
		  inner join estadosProyecto est on est.idEstadoProyecto = ObtenerEstadoProyecto(pro.IdProyecto)
		where pro.fechaCreacion between varFechaInicio and varFechaFinal
		 and (varCodigo is null or pro.codigo = varCodigo)
		 and (varDocumentoInvestigadorPrincipal is null or (select count(1) 
													 from profesoresproyectos pp
													   inner join profesores pro on pp.idprofesor = pro.idprofesor
													 where pro.numeroidentificacion = varDocumentoInvestigadorPrincipal
													   and pp.idproyecto = pro.idproyecto) > 0
												 or (select count(1) 
													 from personalexternoproyectos pep
													   inner join personalexterno pe on pe.idpersonalexterno = pep.idpersonalexterno
													 where pe.numeroIdentificacion = varDocumentoInvestigadorPrincipal 
													  and pep.idproyecto = pro.idproyecto) > 0
												 or (select count(1) 
													 from estudiantesproyectos estp
													  inner join estudiantes est on est.idestudiante = estp.idestudiante
													 where est.numeroIdentificacion = varDocumentoInvestigadorPrincipal 
													  and estp.idproyecto = pro.idproyecto) > 0                                              
			)
		ORDER BY pro.fechaCreacion;
	ELSE
		SELECT 
		   pro.idProyecto, 
           pro.codigo,
		   pro.nombreCortoProyecto,
		   pro.fechaCreacion,
		   pro.fechaInicio,
		   pro.fechaFinalizacion,
		   tipProy.nombre tipoProyecto,
		   est.nombre estadoProyecto
		FROM proyectos pro
		  inner join tiposProyecto tipProy on pro.idTipoProyecto = tipProy.idTipoProyecto
		  inner join estadosProyecto est on est.idEstadoProyecto = ObtenerEstadoProyecto(pro.IdProyecto)
		ORDER BY pro.fechaCreacion;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProyectosCertificadoEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProyectosCertificadoEstudiante`(
 varIdEstudiante bigint
)
BEGIN

	select pro.nombreCompletoProyecto,
           gi.nombre grupoInvestigacion,
           pro.codigo codigoProyecto,
           ff.nombre fuentefinanciacion,
           rol.nombre rol,
           pro.fechaInicio,
           pro.fechaFinalizacion,
           estp.horasSemana
     from proyectos pro
      inner join estudiantesproyectos estp on pro.idproyecto = estp.idproyecto
      inner join gruposinvestigacionproyectos gip on gip.idproyecto = pro.idproyecto and gip.principal = 1
      inner join gruposinvestigacion gi on gi.idgrupoinvestigacion = gip.idgrupoinvestigacion
      inner join roles rol on rol.idrol = estp.idrol
      left join fuentesfinanciacionproyectos ffp on ffp.idProyecto = pro.idproyecto and ffp.idTipoFuenteFinanciacionProyecto = 1
      left join fuentesfinanciacion ff on ff.idFuenteFinanciacion = ffp.idFuenteFinanciacion
	where estp.idestudiante = varIdEstudiante;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProyectosCertificadoPersonalExterno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProyectosCertificadoPersonalExterno`(
 varIdPersonalExterno bigint
)
BEGIN

	select pro.nombreCompletoProyecto,
           gi.nombre grupoInvestigacion,
           pro.codigo codigoProyecto,
           ff.nombre fuentefinanciacion,
           rol.nombre rol,
           pro.fechaInicio,
           pro.fechaFinalizacion,
           pep.horasSemana
     from proyectos pro
      inner join personalexternoproyectos pep on pro.idproyecto = pep.idproyecto
      inner join gruposinvestigacionproyectos gip on gip.idproyecto = pro.idproyecto and gip.principal = 1
      inner join gruposinvestigacion gi on gi.idgrupoinvestigacion = gip.idgrupoinvestigacion
      inner join roles rol on rol.idrol = pep.idrol
      left join fuentesfinanciacionproyectos ffp on ffp.idProyecto = pro.idproyecto and ffp.idTipoFuenteFinanciacionProyecto = 1
      left join fuentesfinanciacion ff on ff.idFuenteFinanciacion = ffp.idFuenteFinanciacion
	where pep.idPersonalExterno = varIdPersonalExterno;
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProyectosCertificadoProfesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProyectosCertificadoProfesor`( varIdProfesor bigint)
BEGIN

	select rol.nombre rol,
           pro.nombreCompletoProyecto,
           pro.fechaInicio,
           pro.fechaFinalizacion,
           profp.porcentajePI,
           profp.horasSemana
     from proyectos pro
        inner join profesoresproyectos profp on pro.idproyecto = profp.idproyecto 
	    inner join roles rol on rol.idrol = profp.idrol	
    where profp.idProfesor = varIdProfesor;
     
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProyectosEjecucionAtrasadosProfesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProyectosEjecucionAtrasadosProfesor`( varnumeroIdentificacion bigint)
BEGIN

	select prof.numeroIdentificacion,
		   concat(concat(prof.nombres, ' '), prof.apellidos) nombreProfesor,
           rol.nombre rol,
           pro.codigo,
           pro.nombreCompletoProyecto,
           ObtenerNombreEstadoProyecto(pro.IdProyecto) estadoProyecto,
           profp.horasSemana,
		   profp.horasSemanaFueraPlan,
           pro.fechaInicio,
           pro.fechaFinalizacion,
           (select count(idPlazo) from plazosProyectos where idProyecto = pro.idProyecto) plazos,
           (select count(idProrroga) from prorrogasProyectos where idProyecto = pro.idProyecto) prorrogas
     from proyectos pro
        inner join profesoresproyectos profp on pro.idproyecto = profp.idproyecto
        inner join profesores prof on prof.idprofesor = profp.idprofesor
	    inner join roles rol on rol.idrol = profp.idrol	
    where prof.numeroIdentificacion = varnumeroIdentificacion
     and ObtenerEstadoProyecto(pro.IdProyecto) in (1, 3);
     
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProyectosInscritos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProyectosInscritos`()
BEGIN

	select pro.codigo,
           pro.nombreCompletoProyecto,
           ObtenerNombreInvestigadorPrincipalProyecto(pro.idProyecto) investigadorPrincipal,
           'No' ingresadoSIGEP,
           'No' ingresadoSIIU,
           '' codigoSIIU,
           'No'ingresadoSIU
     from proyectos pro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProyectosNotificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProyectosNotificar`(
 varDiasPreviosNotificacion int(11)
)
BEGIN

SELECT pro.idproyecto, 
	   prof.correoElectronico, 
       pro.nombreCortoProyecto, 
       1 idTipoPersona,
       prof.idprofesor idPersona,
       concat(concat(prof.nombres, ' '), prof.apellidos) investigadorPrincipal
FROM proyectos pro
      inner join profesoresproyectos profp on pro.idproyecto = profp.idproyecto and profp.idrol = 1
      inner join profesores prof on prof.idprofesor = profp.idprofesor
WHERE DATEDIFF(pro.fechaFinalizacion, now()) between 0 and varDiasPreviosNotificacion and not exists(
																 select idproyecto 
                                                                 from notificacionesvencimientoplazo
                                                                 where idproyecto = pro.idproyecto
                                                                  and idTipoPersona = 1
                                                                  and idPersona = prof.idprofesor)
union all

SELECT pro.idproyecto, 
	   est.correoElectronico, 
       pro.nombreCortoProyecto, 
       2 idTipoPersona,
       est.idEstudiante idPersona,
       concat(concat(est.nombres, ' '), est.apellidos) investigadorPrincipal
FROM proyectos pro
      inner join estudiantesproyectos estp on pro.idproyecto = estp.idproyecto and estp.idrol = 1
      inner join estudiantes est on est.idestudiante = estp.idestudiante
WHERE DATEDIFF(pro.fechaFinalizacion, now()) between 0 and varDiasPreviosNotificacion and not exists(
																 select idproyecto 
                                                                 from notificacionesvencimientoplazo
                                                                 where idproyecto = pro.idproyecto
                                                                  and idTipoPersona = 1
                                                                  and idPersona = est.idEstudiante)
union all

SELECT pro.idproyecto, 
	   pe.correoElectronico, 
       pro.nombreCortoProyecto,
       3 idTipoPersona,
       pe.idPersonalExterno idPersona,
       concat(concat(pe.nombres, ' '), pe.apellidos) investigadorPrincipal
FROM proyectos pro
      inner join personalexternoproyectos pep on pro.idproyecto = pep.idproyecto and pep.idrol = 1
      inner join personalexterno pe on pe.idpersonalexterno = pep.idpersonalexterno
WHERE DATEDIFF(pro.fechaFinalizacion, now()) between 0 and varDiasPreviosNotificacion and not exists(
																 select idproyecto 
                                                                 from notificacionesvencimientoplazo
                                                                 where idproyecto = pro.idproyecto
                                                                  and idTipoPersona = 1
                                                                  and idPersona = pe.idPersonalExterno);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProyectosPorGrupoInvestigacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProyectosPorGrupoInvestigacion`()
BEGIN

	select year(pro.fechaCreacion) anyoCreacion,
		   ObtenerNombreEstadoProyecto(pro.IdProyecto) estadoProyecto,
           pro.codigo,
           pro.nombreCompletoProyecto,
           ff.nombre fuentefinanciacionprincipal,
           ObtenerNombreInvestigadorPrincipalProyecto(pro.idProyecto) investigadorPrincipal,
           gi.nombre grupoInvestigacion
     from proyectos pro
      inner join fuentesfinanciacionproyectos ffp on ffp.idProyecto = pro.idproyecto
      inner join tiposfuentefinanciacionproyecto tffp on tffp.idTipoFuenteFinanciacionProyecto = ffp.idTipoFuenteFinanciacionProyecto 
             and tffp.idTipoFuenteFinanciacionProyecto = 1
      inner join fuentesfinanciacion ff on ff.idFuenteFinanciacion = ffp.idFuenteFinanciacion
      inner join gruposinvestigacionproyectos gip on gip.idproyecto = pro.idproyecto
      inner join gruposinvestigacion gi on gi.idgrupoinvestigacion = gip.idgrupoinvestigacion;
     
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProyectosProfesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProyectosProfesor`(varnumeroIdentificacion bigint)
BEGIN

	select prof.numeroIdentificacion,
		   concat(concat(prof.nombres, ' '), prof.apellidos) nombreProfesor,
           rol.nombre rol,
           pro.codigo,
           pro.nombreCompletoProyecto,
           ObtenerNombreEstadoProyecto(pro.IdProyecto) estadoProyecto,
           profp.horasSemana,
		   profp.horasSemanaFueraPlan,
           pro.fechaInicio,
           pro.fechaFinalizacion,
           (select IFNULL(sum(mesesAprobados), 0) from plazosProyectos where idProyecto = pro.idProyecto) plazos,
           (select IFNULL(sum(mesesAprobados), 0) from prorrogasProyectos where idProyecto = pro.idProyecto) prorrogas
     from proyectos pro
        inner join profesoresproyectos profp on pro.idproyecto = profp.idproyecto 
        inner join profesores prof on prof.idprofesor = profp.idprofesor
	    inner join roles rol on rol.idrol = profp.idrol	
    where prof.numeroIdentificacion = varnumeroIdentificacion;
     
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerRiesgosEticos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerRiesgosEticos`(

)
BEGIN
SELECT idRiesgoEtico,
   nombre
FROM RiesgosEticos
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerRoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerRoles`(

)
BEGIN
SELECT idRol,
   nombre
FROM Roles
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerSeguimientoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSeguimientoProyecto`(varCodigo varchar(15))
BEGIN

	select pro.idProyecto,
           pro.codigo codigoProyecto,
           ObtenerNombreEstadoProyecto(pro.IdProyecto) estadoProyecto,
           pro.nombreCompletoProyecto,
           pro.fechaInicio,
           pro.fechaFinalizacion,
           ObtenerNombreInvestigadorPrincipalProyecto(pro.idProyecto) investigadorPrincipal,
           IFNULL(acpro.numero, '') numeroActaInicio,
           (select IFNULL(sum(horasSemana), 0) from profesoresproyectos where idProyecto = pro.idProyecto) horasPlanTrabajo,
           (select IFNULL(sum(horasSemanaFueraPlan), 0) from profesoresproyectos where idProyecto = pro.idProyecto) horasFueraPlanTrabajo
     from proyectos pro
        left join actasproyectos acpro on acpro.idProyecto = pro.idproyecto and acpro.idtipoacta = 5
    where pro.codigo = varCodigo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerSeguimientoProyectosProfesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerSeguimientoProyectosProfesor`(varidProfesor bigint)
BEGIN

	select pro.idProyecto,
           prof.numeroIdentificacion,
		   concat(concat(prof.nombres, ' '), prof.apellidos) nombreProfesor,
           pro.codigo codigoProyecto,
           pro.nombreCompletoProyecto,
           profp.horasSemana horasPlanTrabajo,
		   profp.horasSemanaFueraPlan horasFueraPlanTrabajo,
           pro.fechaInicio,
           pro.fechaFinalizacion,
           (select IFNULL(sum(mesesAprobados), 0) from plazosProyectos where idProyecto = pro.idProyecto) cantidadPlazos,
           (select IFNULL(sum(mesesAprobados), 0) from prorrogasProyectos where idProyecto = pro.idProyecto) cantidadProrrogas,
           (select count(com.idCompromisoProyecto) 
            from compromisosproyectos com 
               inner join cumplimientocompromisosproyectos ccom on ccom.idCompromisoProyecto = com.idCompromisoProyecto
		    where com.idProyecto = pro.idProyecto
             and not exists (select chp.idCompromisoProyectoHomologado 
							 from compromisoshomologadosproyectos chp
						 	 where chp.idCompromisoProyectoHomologado = com.idCompromisoProyecto)) compromisosEntregados,
           (select count(com.idCompromisoProyecto) 
            from compromisosproyectos com 
		    where com.idProyecto = pro.idProyecto
             and not exists (select ccom.idCompromisoProyecto
							 from cumplimientocompromisosproyectos ccom 
                             where ccom.idCompromisoProyecto = com.idCompromisoProyecto)
             and not exists (select chp.idCompromisoProyectoHomologado 
							 from compromisoshomologadosproyectos chp
						 	 where chp.idCompromisoProyectoHomologado = com.idCompromisoProyecto)) compromisosPendientes
     from proyectos pro
        inner join profesoresproyectos profp on pro.idproyecto = profp.idproyecto 
        inner join profesores prof on prof.idprofesor = profp.idprofesor
    where prof.idProfesor = varIdProfesor;
     
  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiposActa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiposActa`(

)
BEGIN
SELECT idTipoActa,
   nombre
FROM TiposActa
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiposAval` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiposAval`(

)
BEGIN
SELECT idTipoAval,
   nombre
FROM TiposAval
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiposCompromiso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiposCompromiso`(

)
BEGIN
SELECT idTipoCompromiso,
   nombre
FROM TiposCompromiso
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiposContrato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiposContrato`(

)
BEGIN
SELECT idTipoContrato,
   nombre
FROM TiposContrato
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiposEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiposEstudiante`(

)
BEGIN
SELECT idTipoEstudiante,
   nombre
FROM TiposEstudiantes
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiposFuentesFinanciacionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiposFuentesFinanciacionProyecto`(

)
BEGIN
SELECT idTipoFuenteFinanciacionProyecto,
   nombre
FROM tiposfuentefinanciacionproyecto
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiposIdentificacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiposIdentificacion`(

)
BEGIN
SELECT idTipoIdentificacion,
   nombre
FROM TiposIdentificacion
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiposPersona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiposPersona`(

)
BEGIN
SELECT idTipoPersona,
   nombre
FROM TiposPersona
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiposProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiposProyecto`(

)
BEGIN
SELECT idTipoProyecto,
   nombre
FROM TiposProyecto
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerTiposVinculacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTiposVinculacion`(

)
BEGIN
SELECT idTipoVinculacion,
   nombre
FROM TiposVinculacion
ORDER BY nombre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerUsuario`(
	in varNombreUsuario varchar(50),
	out varNombres varchar(250),
	out varApellidos varchar(250),
	out varIdusuario int(20),
	out varClave varchar(50),
    out varCorreoElectronico varchar(100)
)
BEGIN
SELECT 
    nombres,
    apellidos,
    idusuario,
    clave,
    correoElectronico
INTO
	varNombres,
	varApellidos,
	varidusuario,
	varClave,
    varCorreoElectronico
FROM usuarios
WHERE nombreUsuario = varNombreUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerUsuarioPorId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerUsuarioPorId`(
	in varIdusuario int(20),
	out varNombreUsuario varchar(50),
	out varNombres varchar(250),
	out varApellidos varchar(250),
	out varClave varchar(50),
    out varCorreoElectronico varchar(100)
)
BEGIN
SELECT 
    nombres,
    apellidos,
    nombreUsuario,
    clave,
    correoElectronico
INTO
	varNombres,
	varApellidos,
	varNombreUsuario,
	varClave,
    varCorreoElectronico
FROM usuarios
WHERE idUsuario = varIdUsuario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerUsuarios`(
)
BEGIN
SELECT 
    nombres,
    apellidos,
    idusuario,
    correoElectronico,
    nombreUsuario
FROM usuarios
order by nombres, apellidos;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ValidarExistenciaProyectoPorCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarExistenciaProyectoPorCodigo`(
   varCodigo varchar(45),
   out varExiste tinyint(1)
)
BEGIN
		IF EXISTS(SELECT pro.idProyecto 
				  FROM proyectos pro
				  where pro.codigo = varCodigo) THEN
		   SET varExiste = 1;			
	    ELSE
           SET varExiste = 0;
	    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-04 12:41:52
