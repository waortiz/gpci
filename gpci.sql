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
INSERT INTO `areastematicas` VALUES (1,'Salud'),(2,'Energía'),(3,'Tecnología'),(4,'Gases'),(5,'NUEVAS TECNOLOGÍAS');
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
INSERT INTO `compromisosproyectos` VALUES (1,18,'2017-08-07 14:07:02','Entrega de Documentos',256,'null'),(4,25,'2017-08-11 12:43:17','ENTREGA DE FORMATOS AL DÍA',153,'DOCUMENTOS'),(5,25,'2017-08-11 13:59:00','ENVÍO DE INFORMACIÓN',151,'DOCUMENTOS'),(6,2,'2017-08-27 22:28:27','Entrega de referencias',256,'Ninguno'),(7,8,'2017-08-27 22:30:10','Documentos',307,NULL);
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
INSERT INTO `convocatorias` VALUES (1,'Ruta N','2017-05-27 00:00:00'),(2,'Municipio de Medellín','2017-05-27 00:00:00'),(4,'Otra convocatoria','2017-08-11 12:13:59'),(5,'Nueva Convocatoria U de A','2017-08-11 12:18:35'),(7,'Nueva Convocatoria Colciencias','2017-08-11 12:20:12');
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
INSERT INTO `documentoactasproyectos` VALUES (4,'20264562_1739789179654250_7471240034847116774_n.jpg','image/jpeg','�\��\�\0JFIF\0\0\0\0\0\0�\�\0�Photoshop 3.0\08BIM\0\0\0\0\0�g\0GEOGtpuoN04_KuSTAVRD(\0bFBMD01000ac0030000bf2900002d60000019660000f56b00002a96000061e70000f9ef0000dbf900005f0401009b960100�\�ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \�\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0\�\0\0\0@gTRC\0\0\�\0\0\0@bTRC\0\0\�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�curv\0\0\0\0\0\0\0\Z\0\0\0\�\�c�k�?Q4!�)�2;�FQw]\�kpz���|�i�}\�\�\�0���\�\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9�\�\0C\n\n\n9& &99999999999999999999999999999999999999999999999999�\�\0� \0\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�\0\0\0\0�X\01�@\�a�\�\�mNqN�ɤtdfٓ�Js{\�/@�\�\�d�Ͱh㞺j,�(k�\�t9�3�5��Ff\�k\"4r\�e\�:2�)\�\�F~aљ�M\�*��s�%�\�Z6\�%�/P\�\�+S5Lj�FfH_3$/�\��lg>te\�\0\0\0\0\0\0\0y\�~`z~Lم\�=\��g2z\�\��\�\�;�<�広3g\Z���\�d����N��\�yrۛ�cu�5�\�8{�H\�d��?�\�\�\�\�q\�a\�`�A�ys�\�:�\�o\�y�\�W�>hf6�\�\�1�װƊ�\�\�ʤ_\�\�8��\�8�\�\���3Λ�\�1K�8\�F8>��\�8\�X�̭K&g�y?�5\�9��\�\�\"�B��\�v\�JZ�?px��\�F�\��W��P�\0\0\0\0\0\0\0\�\�[\Z@f\�RkJ\�D�\Z\�u\�C>��䗤^\�gh��i��M\�0\�l��\�\�=`\�]��\�Ω�\�W�\� g\\�3�\�ӂ�\r�ϫ�\�d\n)|#�|3oH�@Q�(f;D2\�\�|�\�:Zw�K\0\�=�p\0\0\0\0\0\0\0\0\07�D��\�[\"N�4+�<�\�yW��|O\�)zO��\�\'\�qv��\�\�C�\�[\'.\�<��\�\�;�\�\�����v�Ib\�^�\�c\�c�E\�u�%�\�s\��\�ŧ+Kԉ|\�\�|\�}�\�N��\�91ȕΎWr%�\�\�=(\�:�Y�\�ͽ\'\�\�78B��N\�\�\�k�N�\�\�g�\�\�\r^\�\�:��T+��\�v�I�\�\��b�}\�朵h���z�\0\0\0\0\0\0\0\0\0\0q}�p\�]\�\�4z\�¿x8\�\�\r[A\�\�\�vON\�\'~�-7T9��G�n��sX��F�L�\��\���\0�T\��@T��Ӈ+��\�t���Ӈ�Ӂ\��A�u\�ÄN�\"�\�pW��\�\�=9��Peg��\�\�\�+�\�a\��\�A\���Hs���\��\0\0\0\0\0T\�Ǫ9U:���\�:��+�9r:��S�9�\�\�`:s��\��9\\\�{\�Ι�zA\�\������\'21̇Ls!\�\�t\�2\�\�Nfn]:\�N%+�8\�\'Ts�\�\�+\Z͒�Y+\�+���X 	\�r��&!	�Bb��& \�6ʓ���bH000000009�_�PP,r�\�U!�\�\�l�\�\�L�f\�񧳟�z�GYێ���\n\"F\�\�\�ΥM.\�\�w33q\�t�1fvX\�s嶱�o\n\"�\0� *�@E@p���\n\0�V�\�\�\�/:w�|�\�\�\��QDDDD��6)\��\"���\0@H(\0J\0���U���\����{3�*��\�+f���\�\�P\���S�TQ�,E\�\�Y\��޵ǒ]��\�Z�\�u4\�\�!�(\0�B�(��\0\0(��*\n\�PDQ9\��>9���Va,#�\'\��Ǩɑ��(�\n *\0*�\n s�\�\0(���-�)\0\0\n �\0�;�\�s\�\'�\�\�\��P�\�%�G3C\�\�y^�o��\�z\�\�nu\�Y�5\�\�\�\�\�\��\�;�\�/t\�\�^�\�\�QAY\0��\�UTEA\�n�QȨ\0\n\0��Q�ka:}�Ze\�~�N�7˘�\�\�k:�\r\��\�(���\n (������\0�\0�\0�\n\0(\�go�\�^V;\�\�&\�ϭ�O��I+Y�-�\�g�Ӝ\�\�g����^���ޙY�//Nn]��oީ�wW3tzqfu���\�yp\�r�����#C&�\'=\�U73\�\�\�h�V(\�9�\�̶\�\���\�]\�nzk�l����\�n�6�_4���(��h9\0QDA\�T\�\":�&\"	V%\"	H�R$\' d��Q\�Z+�)z8\�4���{�,k,,�wD\�\�\�/��k�d����;4�tF׃S��+x��}���N\�0�\�\�\�\��\�\�↜�\\\�1hu\�\�a�g0\�2_.��\Z\�C�UʌȖw�}?=:\�.\"�و�\��e\�\\T�*Z���h@\�\�t\�h\�m\��2ov��Ҋ��\�Z*\\ZAu*)l���d��>�WX\�md�\�\�K4\n��p��ui\�JoX��\�\'�$��\�,�5\�\�\��|ńw�\�\�3\�M#̺T��g_,�\�W�{�\�n7j\�\����\\}D\�\�G6�$薩eu�\�$o�ا:�\�G(2Dr�̈�bƎ�\"�DT�PjK�\�DU\\\��Y�}qCw7�]�ۖ�\�\�̟��\�z<z��qQяV8j� �\r0O?�\�&ui���[��m8�Q(ٸɸ\�٫\��$3\�q^��\�\��N\�^|\�\�\����G2i_i!�M`�\�7\�\�\�r�<�t\�Ku�\�Ĺ�\�\�۝8\�,��\�\�a\�\�b\�f\\\�\�t~�\nH�\�ٽ��R,HLE$�F�\�ƪ\n\�#r(�֤\��\����ǽ��Xu\\=��|\�\�N�]\�\�\\�\�\�_�}\�Ms��:�V\�.k\�k%AD+\0jy}�m\Zw76�^\�x�L�َԱ�\�\�\r;\�Z\�4�\�gZ��\�H\�QL��8ܻ:)W�2\�\�\�C���ق\�f��ڭ8z~�^k�WGí��w\�\�4\�\��\�eHܛ\�\�\�:\�\�\��IS$\n���\\=�\�Q�=\0p\�{EX�\\J��C7-�\��\�ɫ3.�S�b\���\0Zs�BU�󲛞׼\�,�j\�B%\�\��\�N	Y\�\r#�Y�c*K65p\�\��8�Yz-��	\Z��\�Pce��\n\�H\�Y�\�\�]H\�t\�1XsUF�\�,rG �b�8|�\���\���\�k��h\�*n�\�YH\��\�rא�\Z�	�\�܄�\�S��\nG\ZX\���&mѹ�l��\�\n\�\�ͶX�Jr���\�k\�$M,/�m\�z\�\�|�k�i%�φדߕ}%ԣ^z�9\Zٛ�=X\�tL=\�X�*|\�u�\�>7k* 8j�\�(\�sFշ�#����5�\�Q#�;��3\��Ң;Y�	mӟ=�=�\��V�^1\�	��B��>+Au�\r�P�Td[��F�u\Z���\�\���<�O\�\�ϛ�j\�c�dMY�,\�ěz��=\��z �agKo�ظ��\�B\�Hb\�\���e�|\�=���.k\�\�b�Nrz�\�\Z\���\�UG\�Q@#r<\0TT�ԉ,d>w\�ܕ�\��\�N|rB2X\�Eh�|GB,ݸ@�\�J\�X���R��#\Z�8�Q�ڮ���h�L�\�.�g��#u��\�*J\�S\�@��B���\'�\�Zrik�l����\�\�g�l\�qQ�8���iXclЫ`�EV�\\�\\}�\�\\�\�]{\Z\�\�I\Z�\0PTQ�E\0\0Z\r����l0�\r\�O)�\Z\���AcBj\�\�u\n\�\�\�G5�ǵ�\��\�-e�=Ь�Y�v\n�W�\�|ZJ��r��:5��:����b�{Q��\�iuԴ�\��lɪQ$�5	êIY-lGMo�ؼ\�	S��\�\���v�ݡ.\�v�jџ7Q�9:sNߋ�ߑ��c{p\�*(\0\"*C�ZDsѨ4����r��Z\�\��ܚhQN\�J�n��\� ��8\�Kf�\�X��\�(\�\�ı6kMS2ʺ9�J1\�iT��5�6\�:\�Z�JOכ;\�~\��\�%6�x\�[���\��\����[\�{R-J)v!\Z\�\�`9�vp:\�;�\�#\�\�\�d\�9�e�v\�c����#�]\�o\�.�\�T��#��uN��s\n\0@ \��\r�HFC>w\�I��\�Z�D�^��\�4Q�\\EYY�\�AT���}8ݓ>B\�Q��\�|\�KN�a\�g�1\�$\"���2D��:\�+Y\�m(��嵛yd�H\�;N�\�Z������\�<����4\�,,5�>8���X\�\�\�29�\��\�2ϟ\�z��s\�i��dyW[�Ҳ\�F�E�\\\�%����o\�P�\�\�\�a�\�TX)@�@� �Е�5�&�e\�\�\�\�\�攼�\��=�%�?N5ctv*�Ҡ|z1o��8\�s�Fٞ\�A��8#\�ibJ\�B\�;ml�\�%��#=)����\�siϿI{�\�]�N\�u��\�i��W,N�\\�;��B	c���\�%N�#X��^���c\�t���	r��\�,	.�󈔅�KRR\�[�d�U��%�����\�\�MŔ�ڴ�T�6R�\�s,gRڂ\�t$\�֥�&2\�!�V\"\�	�mi!���[�m�Y�\�*hA�Yu�(,	ad����Ԩ[*�h��P\\�\�#(\�Zȳj�hT\�\�[1�w&:k�Q��R\�k��WDL\�E`�\�j�N`�\nҔh8iDF�8�\�+Tz52r\"\�\� \�,K\�_)ȕ�����G�SK�R^�Nve\�2�\�3/K(\n\0f1�\�*\0�\�ϻO\�\�\�Qr�E�-t0�����a\�\�\�\�k�^:\�t��\�\�p �i\n悂�\0+����:B�\�-\�sQ�\�yR��+��G\�dca\�����%\�V\"T����U�^�zKB4�{Un�7\�E����5Ή\�*\�ؕb�\�B�6�����\��u����\0\"�\�v�\�V�H*.B�\�\�NV�\�\�#\�+Ysk��=\ZǛuq�2Iw�\�)Mz���\rU\0\0��E��GCUP�T\�G�\�5�\��4r=�\�ö�\n9\\�\�CFI\�弨+���׼�\�J�\�Y\�^�f9�5\�S�\�\�6D!\�ЙaIetIHں@ch�*\0 Y�=^\�\�\�#T\\�P�fiT�\n	\�\�n\��kؙy��;j�Y�5Mc�72�rY��ζ�n�suE\�8\�i \0\0\0\0\0\0s*\�\�ND�)X\�G�R��dc��H�|�(�h\�>/NZݱ\�6���ȝ���2}\Z3#�7��9!]bFUT!�-0\�+\�F�Z��\�`\n\"�\0$\�IZ9\�Y�WT\\\�\0�c��Vގ~~�V.k�U �,�����]�=\r�\�p�Uu\Z\�\0\0\0\0\0\0\�nm\�\�\�R�\�h1\�F�����U�9!�\�h۝\�\�\�g?N%�ŭG��\�hŷn��GF��\n\��<\�b��F\�:D�\"� ��\�2%uya\�]Tl@\Z���+\���\�rE$��\�mO��;0mY\��W}�\'�uc��.\��6YYy\n�%\�1��\0�P\0\0\0\0\0\�+�9��Rtԅe�THa�\�a�#hc��<�]�ի6=NκɧԴ��F��\�\"o�	`�f\�\n؍�#ԍ\\�K+�6YdB�EJ\�\��� \n�\�j�\�Q[��u-\�ڃ\�.ds�b�\��\�\�\�\�\�hs\�y��%\�\�\�-&D{5iڙ\�\�Ɩ^��\�*;<�\��*\n��\0\0\0\0\0\0(������9Z���*(9�D��\�̵b:\�oձ�\�Yu=�\��\�\��:Ż\�\�\�\��\�S7����V\�X��=�ks���nT[e��&[5�Y\�\�\"�\�G�G@���n�\�Ʈ\�r�d��Y�z�g5r\�j��65��G�n͏1��k96�y�\�b\�[\�%Tvq<�K҈�J\0\0\0\0\0\0\0rzy�\��#U͔UI^�G7;K��@�\��\�R���Kw0e-s�q�\�\�U\�\�l{�ٸ�k�N��$\�\�\��飒R��-zĤ�hZ��5�f��\�\�EGR9��DY����={[�rE6d\�*IN\�J�R\�w/IZhgJ6+ìiMJr\�m;�{w#R/�5�s\\�Mۢ*R�\0\0\0\0\0\0�\����=\�\�	H�\\�c�\�s�<jV\��}ܱ�]�-Y�E��q\�f\�Dr35��X Y�#ׯ\��\��\�1\\4ZX�AUE@\0�\'\�\'�5\�u1\�t*	��J�s\�\�\r\�j75{��bK5\�s�X\�v49�b\�)�*ZYii\�\�\�\�\�b\�C{\\t���&�m�T�@\0\0\0\0\0\0.h]˭\�\��8cښ\��R\\A&cZ�w�1fo��M�{n5�t=$5�\�\�!�옎�4�Ef�Tk���M���\�|��\r8jS�\�Z��\Z�\�\Z����ޞq���E���y�z�\nhH�!3b@4F˭g�>ڲ\�7;ӷ�l\��ZƏ!�G��\�YzmN*\�z��jY\�%�\n\0\0\0\0\0\0q.˴� WB��\�:\�ެ,o\�{U-n~�\'~us�Nu�0u�J��:g:��yE4e��\�\r\0Ep��\�Y_\��w;q�/\r�5\�W\r�\�Xǈ����\�\�ϳߋ��t�F�1Yt_��\n��� ����5Ȯ�T\�\�vd\�q�Y\�.֖�\�F��ܓC-�\'�K4u9�S��\�u9\��\0\0\0\0q�۩ǳ�^\�U�\'��c��%��h\�4^g�\�;q�3y�S/���\�e�\�!B\"�\�Yj\�#1PH\�\"���]\�u��y�z9\�\�\\�Ċ\��d9+N:h�\�W2\�}�[C�k�o�ys\ZB*(\�\0��\n\rQ��A\�2\��x�Ԓ��\�\�\���+d\�U�i�>\�MXh\0\0\0\0�\�\�O/\\�[��֝Ҳx�Y�q\����Y\�z	���mS\��{[�隱��\\Pe��\�\�X�^\�+\0QP�┲��I�I\�\�\��\�\�F�\�\�Y��\�Ml��b�	��3\nNɢ錼h`\�X5,TT�dP)D\�\n��\r$�t�z\�]lz\"�8�l�!bHX�%�\�\�0n\�uk\�\��ݥ���V�V����g����A��\��-$�ᶭH��#\�\�̩\�urz5\�ux6}�i\�>��FJ�\� ���B��\��3L\�8�S�I?Z�f��N%F�²\�EI\��6\�\�\�j�^�p�\�Eb�8c�s��\�\0��\0�(\"�\�cx\n����5�:1m7R\�H����\��NN]�G̴\�E�e��.�\�-C�I)\�~�E5��QمJ��e\�r�t�\�\�7T�oY�t#���]�Fy�	�$�\��k=q�m\��+e~�+�\��W3=Qd��H	\����\�u�%|rJ��kٚNs��\�aM-�\�Y\�Vu��fJ&�u@\�\�ђ2�\'.Z_���\\n�T\�S;\�͢1�bΚh�Ԧc��*���d�]Z֋�\�:=�\n\�uק>��~rs^|;\�5om�l\��=lTAbd\�e�\�LY\�\�u\�D�\\1\�):\�?:\�\\Z���ݜ\�f<wo:QP��\�Mys\�i2\�rځ\�婡�>z�\�\�\�3ٳ�kb��\�SB��ڣ�8\�/<dø�\�b\�☗\�ѫ�ގbN��M�Y\�Kв��n\�\�3jк��ϸ�\�\'\�ɭϧ@�ֆww:\�1ZzVzr����E�\�\�X�	��\Z\�kUU��:�֮\�7��\�➽�E�\�\�\��!�Cr�ؔ�#M<J\�N\�B[vs��E傳	�\ZN@ȳs0��\�\�7:�8X��\�v-\�h�3yj\�sfj\�\�u\�\�Ç��ǖ\�ioE1Üs\��\�5\"\�rE\�HI�\��:&r}f�-#�|C��Jj�6)f\�m6��K\n:,\�JJ�	�Ă�]\���%�U��*K#1\Z=�R\�H�־\�\�\�#c7�G\'��6jZ��\�H��U����s8J�润�>�o�Sk=9\�;,\��\"\�9ݕMs\�b\�\�r\�Y�o|A\�\\\��T%v�y�<�\�dnz\�E�\�?\ZL\�h\�E.\r\�\�Ӣ�\�ۓf:�\�5\�\�e�SIat���\�f z2�c�Ыw7�b�TV\�Mg�Cz^E��\�=:z78�\�εX�\�W��$��]eu�k\�ȭ{�u2�v�����,2���f��\�A\�A@��	\�m�\���X�]�7\�㺤� d욯\r�3b�f�U❙aS\�\�\�\�>;o�\�z!e�j��+��e�\�7Q磕x.E-H\�ǋ�\�o����K:X��\�\"I�\�Ӟ\�g\�?F�Y�\�K\�k\Z�\�\r\�0:lu�\"+md��Q͹\�\���g�X��\�\�A\rF٨��\�^q�bK�\�\�\'�����,R�\�^\�[B��\n��$rD6\��z�pk��\�\�\�~�;��F\�\�+X�j8��2�W+�g\�mbt\�Qc\�\�\�ru3QP\0p�,�\�\�tsW�\�~=\�G�\�&3���0u\�\�Dֲfã�F\�\��\�rج\�\�\�kڎ]{Z[�y��\\�\�ŝ�I��э��\��a�\�3��a�{n\rV\�Od�\�|I��H\�\'�R\�h�\�jQ|�f\�\��z�f��\�a����h`��#]+�\���\�3�N�\�\�P!��vY\�\��(k�35,$��\�0�tc\��A$PJP$\0T\�\�ǳ\ny,\�d�D�\�ckm�s��td:\�\�\�\Z\�\"����!\�q�9�:a�\�C��\�s���hcT��\�r\�u\�Z\�_u�\�J�~\�i\�;��sg�\�9��j��:\�׷����j\�&d\�m�<[\�\�\�\�k\�dp؊]yb��Xlֲ*���\�C\�a\\\�VM\�.^�Ef:\�\�ޭ\��\Z�Վs�\�,ӧj[9��\�3q�L\�ɲu�ޘ\�}ך��ʈ�(\�=̍2\��t\�[S\�٧Jxyt�����=\�Q\�+��\\�W�\���\��\�R)Y�/m\�����\�\�\�Ƒk�q\�\n\�Cw/=�\�؎g>=�0\'}��/o#|�ދ׈�\�i\Z\�kQ����\�\�\��F\��sX���\�Mϴv+Z�T~\�\��֒)f�)Q\�A+S]�c��ʵ�\�E���\�k�:\�,\�\�\�ͥ�\�\�\�\�m�{Q�\"\�\�\�z\��\�R� \\��\0	����Н�\�I\�Tl�K�r8\�\�o\�ԭExu���ɤ\�\�\�\�\�\�\�\�$rj5�IizO�u��t��\�\�V��\�q\�\�ei3\�\�}-y��-{�;�\�J\���\�1\�\�\�5���٣+:qb�J�����ە�4�;[4-\�*ւ\�V#7�\n\�9\�w�d;.�\�\'\�jX}K[�\�^\�殺\�\\�\�/��5ۍ\�ο/����\�Ȝ\�L\�M��\"#\�v\�c�8��\�X��\0�{�[��*\�J\��d�\�\�\�x��d�R\�ԛ.��|\��\�S�_\����*V�<��<\�K��ۚ�\�᤭�\�El=L\\݇ƶ�J\�\�\�\�\�S�\�\�Ƴ\\�y69\"Μ\�ԑ��嚖X�RW�\�u�\�5�ZkRLn;��&W�,i*�N��u�i�\�wK�\�t\�^�2k6��΃��\�]`\�\�\�c]U~+�\�7\�\�\�\�����:m�,\�+^\�|MI�^ܕZ�\n�R����*\�icnz^\��G\�\�Ƕ}s��y\�rE%�Iŗֳ]����\�~�2nu>�)u;\�\�\�\�\�d\�BE-,-K�=�̨�/\�3=�)KS��C�EK�\�C�5�\�Z,\�֫�\�zť-L\�R\�F��]���\�F��dm\�\�\\�\�l\r\�\�B�?�\��\�k\�\�;gV�=\�o�ȇݲ\�\�=`\�\�B�bv��do8�3\�7�S����\�9X\�Q��hX�\��j&:F\�|��Oex�fXu5��,ː5,@��1,��j\�\�b�7Kvj\�kz\�&\�zv�Z~>�Ab�T�\�TT�T���,\�aI��(ǳ�Z\�6YwI�<sZ���\�0\�GEyΌn\�<\n+\�\��R\�n\\*֒j\�i�jH�Vj[cu�8�\�\�%I\�\�Oϻn~��H�R���=m��\�j\�ve�q�0���	:�\�\��y�d\�-��4(\"\�\�\�nw�`�\�\�lV\�˱Qz��\�\�N\�~0g\�ecS�Y+#zB\"�Q�kP�dZ���2�K$\��\��\�\�G�{�w��b\�9����N�F�u\��\�L[�\�\�\�\�\�Ԃ�Yl�\�Ƭ��s�\�2j\�r\�\�\���ޫb�M�$*\�suF����\�\�R\"��\\�5\�Vx��Z��ԧ��>bG9\�\�jܼU\�1\�[�\n\"�4\�\�6\�\�q\�\�-�\Z��\�RX\�\�\�\�2S\�\�bԙ��\��\\�#�V#ڱ\�,2�z���b\�$SG\�b�ztQW��ق���I�V�l\�t�g��\�\�\�WG�%s�u\�+\��\�\ZM\r�y�M���GB\r\�Z-d\�ڕ\r�{rf+:dA�j���4F���mA+�\�^\�C�\�j����$Ic\\��K��\�k�@�Ƹ)DHs\�R\�L~t�j\�\�\�=|��:G{<qQ���_�>��VK��\0\�z+ ��\�j\�<�g�s\\�s1i\�Zl\�G#�{b8u�U�Y���cnr�\�S:^k_%�;y��\�*[�\Z,m��#�\�6\�\�2^ \�\�\�\�ڭ\�U�h\�HV��\�J�RB1\�-[:$k��\�,�h\�\"4Z��6J�he���NT!\�\�V�\�ک#\��yi\�X�\�l�(�wsu5���4A��f\�u\"�j\���[eEi�\�T.薞2K@@RK�Κ\�R�\�\�\��صLE\�e�t\�,\�h\�nt��5\��I^v\�F:OF+͏I#\�\�\�C\�\�\�i襞r��/����\�l���Vzhy���p\�I5=(<\����5���u�p�G�@y�zHy�zXy��$<\�=$<\�ސw��%hov\�G3|\�/L6�݇\�@,�\��\0���|�=�΢��|\�}(_5w�	\��\�|\�=<<\�}(<\���\'�/����\'����\�n� �=ٝys�8�=OC$�уϣ�P�\�}\�\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0aJ�0`\�\�\�_\��x�Nz�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0̮O�\�\�N�6�wՉi���\��\0�˟\�n�}�H\�\�\�+Y\�j	�˔\��ؠ_�;tL�z7�\��q\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\�yu;�x�����\�\�.|\�\�\�֓\�\�\�i\�\�\�\�\��yw{/+\���\�\�\�w.\��\\\n\�hf\\\�\�\�\�f��#Q\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0̪�=W	\�\���\'\�}\�ɔ\'\�\0\0\0�\�OO�|\�}~Ѿ\�{�\�o�@\�p\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\05\0\0\0\0!1 \"023A#4@B$5P`%6pC�\�\0\0\0�\0����\Zj�*e\�=J�J�U�\�Һ�S��ʮ�*F�j�E4r\�\�Ti�\�#�W_#ƵF���2�T��}6�MRd��1\�\� 4�1T���\ZG1�펾	*Tz�4�\n�Q��u>�K;��X��Ե��J��:FC+f���6��P��O:�T�1\�F�\�\�#}5lI��6���\ZGy\�\Z���\�+\�uL�\�EIW[N�H\r6�MP\��i5�5\�\�\�k�w�Q\�WW#|\�RWCVj5ZXK_OTeթb�Ψ\�<쩋X���L�i�\�\"�\�\�\�5ж�U\�\�F�\�A<u��	*ju*zi|\�x\�|%%\\Um����\�\�GM�Q�*\"�k�\�\�4�u-\\C\�\�?\��Q\��COM0�E�\�ŦOR���0\�лO�}\�\�M4��\�S4\�RUSG��>�/To���4�Tk2>�Pf�F\�\�v��}I����R\�C���\�xjN��\�SL* ydZ�,Zd�\�\Z�2-?I�S괂�]f^����\0�\��\0�?P�\0_\�\�U!l�ΤӤ�b\� �k���?0�F�0\r*�\�@\�J�ڄ�M�\"g�բ���\��\�G���˺�ƘV\�\��Ⱦ��4\�\�zM�0о�)�\�4�=f�Jc\�\� �PC\��jOTeԿf�X\�)��\0\�\�\��\�\�\�|]������4U��&h\�S\�G&�+f\Z�\0�~��R\�B��IԾ��\�J}\"��WBt�֜��\�U1\�\�3V�{��SZ�?Rt?OTq&�AS-X��K\�O\�M�u�����\r7�\�O&�\�RU�if�=&JqA\�\�\�������\�\�4��e�j�R~mj��\��jz܎��v��:����L����#�\�4\�uH\�t�1\�P�h�f�O$�\�\�\�?\��\0\�\��ID͂�V\r\'�Z��\0����$�R��^�j(�A\��ߦ�\0\r\r���\�b�O�?5~�\�X4G@h\�7���,o��?\r?�t(��l>7M�T��ժ�\0��ej������޶�_�\'1\�P��3N.:���ViF\n]�ihߵ�|\��\0F�	\"�F\�\�U�TG$\��\0\���N�\n\"_�j_Pӻ:}f�\�U\�\�V����SDSt�69�4�ΙCN\�\�4�j�M�SS�T\�\�R#cca\�yE\n\ZUME=K�cde=\�m2�cMCOJ�\�\�ӣїCp6�����\�i���4\�2���\�i�\��N��v\�\�4r�ʨ�a�5�E\�OM\r3j(i�_\�*���yRi4r\ZjXi���\�QSEOR|��EGQSR\�L$cde5,4���ꦊ����s)\�\�t�\'(�C�SK\rH�MG*�K��\�\�T��\�m5$���\Z�Ɔ6��\n�-<ѱ�6x*�i �X7\nz\Zzg���9砦��P����*fT\�Sԙ風�\�(T0\�H\�(\�\�zhi�����(4�Va�\0�\�f�8�z�\�j䖻R�M���\�\�0\�u����J���\�\�4:�^O�/�\�\�U\�n�Zj�h�\�*-^�Sפתd�(���CBٙL����6�;��\�?�ҫM5N�[\�Ӥ�mz��K�N\�\�u\�h(%����4:�Ԅ���u\�4\�=2j�4\�6JI\�\�u*�M>���kԮ-�U[�ӾYs6�QKY��N�\�iz_�$�\0\�P㟤\�\�\�\n�J��ڞ�&�;�����KII.���j�w-T:MZM:���=y�gA�Z��Σ�S��t\�P\�\�M�����\�5	\'�\�9�]|\�T�@O�~�W4*�*#\�jz4��3,ѥcha���Y�u+c\�*\�KWQ�\�}HHf�_\�k\��\0\�?��\�⪝έҥ��\�}$���\�9X\�5��i�\��\0\�\�P\�E}I�k�Ki�\n1GIJ��Ti5\"\n�J�\n��\�j�[�U���W\�6mF��K[U �K���Zu5���\0�\�*�6�WX&���M�\�\�UF�ߥV�Iˠ�:\��u�SQO�\�\�H����fViu�\�5 n�j�\�7Y���z\�\��>��8;O�\��\�?\�\�\�j-n�F)�\�*Dڅm`�������1+H��j���iO4����\Z�ZM[%_R4���Y-Q�J�\���A.\Z\�\�?\�\�\�j-n�H)��J�6�[X\'���O�V�Bz\ZFQï\�B7�Vk\�lտQC]F\�b��\�j�\0\�Uh�u�\�\�Z�h\�a�z\�]C��ը䬆�\r)\�\�\�\�QIY<f:}^�J\�\�P\�MEGJ\�zmWM5n�ӝY�בAH\�8*[#�Ҵ\�H\��AUMMEQ��\�\�G\rdFzZ**�Z-+N4���T\�SQTG��G�`�D�\�j�|��\�뗀�\�\�+\�4\�*�\'�F��\�\��:m�Ӧ~���鎨�`eL>OY\�4��ON���P���4��\�\�V�iu+ji�4�[E\���3K�-CK����Z�\r%,t�M�U��+\�T`�O\'�\�5TO�\����k|��\r;Le\Z\��\�\�\nAYOCKYMM�i��WR���\n\n���h���i��}m$u�yElKN\�N�^�J\�\��\�\�\��\0��\�Z\�5\nו\�&^a\"euШjk��\' �Z\�\�8����$j�0�vM���\�,r\�\��#�\�H����{\\M�����\��r�^�����j���n\�\�	j6\�\�\�\�\�\�\�:\r\�KZ\�mL������f�\0\�\�\�L�\�e\�QB\�Qh��ұ;\�Z{��\�=��p$r����|���\�a�\��]Ņ�{��\�%O;�|\Z�R8��]Dc0k\�7�!�0�F\�\�UCun|��t��w-	��t�OryNMA4&�\��	\\\�\�s}���~8�\�CY3�\�\�\��J\�e+c]\0TQ\�U�{SY�G���Ƨ����\�5�Bv�3�54&?�u\�\�t\�\��2\'��E�\�K3�}X��a\��Y�\�\�}}\�s�l�����\�\�C�T\�6f�&���֚\\,�\�2�!da㉛g�L��L\r�\��l7{�H\��\0����A0ݎ�0�HF�\�\�\"\�Ȅ�^��H�\��a�͋�\��j\�ʊBɘ\�C�~-Q�S*v�u�*����\�\�im]9�\�@&���/lZ,@Bq\�A&�\��`�8����l�@�?\�\���ѵU\�\��C�Nr�8���\�FʡQl�y�\�#$�{*�k�jl�\��E\�=�\�\�\��,F�Y8&�rwL��\�mr�uN\Z)\r˂\�h���\�GD\�e���\0H�)\�\����O��\0�i��Q\�Swfd��ص�\��;)f|Lc�g�!���5�W,\�,7���\'\���Lz��\Z�`�\\EDe\�H28\��R����\�)\��Y�Y�Y�Y�Yp�¸S�PF\�\�]]]_\�^]+CE,A��\�=V\���k�\�/�\�\�\�\�\��������B\�\�]r��euu{��*Nd�vI\�nmm�w\�ס�\�)c^i\�P\�v{X�\�xG`\�7�v\�Ã�Ӽ\�\�\�9\�\�v��\�et\r\�6Y.�I� �qYw+�r�\�4�ur�)\�\�\��T\�{<A�o�c]jyrh*\�e\�+�WYu�Yu�Yu�\�\��U��\�\�jͨ8�\n\�\�Eӯ\�O}\�=\�\�tP��\�F�f�$�\�~\�\�Ñc�\�N\"?lB\�w/���\���s�d\�T�)�p\�t\"\nͷ\�Y��\0V\r�\��\r\�\0\�J;_k���N1Q\�Es�TU;*F���[\�\�u}�Y�Y��\�\\��W6\�p�nq\nG9ʄ{�\�\�\�h�9��\�6Yb<J�$/��#c\\�\'4�2GH�a�\'f�%8EMVb\r��T/ݶ\�~U\�\�E\�{�(��P\'`�\\medZұj\�)[v)\�6g;\n4ШAh\�K8�����=]Yr�e����쮮�+2�\�K%�\�\�tBl���(��\�J�\'�6���آ��;���Ed�\�\���^\����\�\0�\"�M\�V˓�8..�\��°\�\�VYv\�\�$oat]e~6���2\�r钣�r\��M+bOqqw\���ƦU����V(]X�\�쮸V��u`�Z�Ov�2\�E�D\�H\�\��*\�\�\�\��#�\�l�})���\�Cy\�͍�*�>)I\�\�\�-4��B8\�\'\�\\\�t\�q\�Nt�(9U3tX��\�b\�8�\\��\�9\\���\�6\�r�\�C�r�Q�ʫP\�5\���x\�⥑IR9%wpWWA\�M�pP\�\�E\�\���v��$\�I*p��j\�W�o77^�lZ�51��xVؘ\�\�Ս\�lZ�J�z�ɝ����)UF�#Tp����pi��.le\�R��5\�/r�\0\'!\�I�%�۷d\n ��\�\�w\�Z\�#\�/j�X����B���OQ$\�wm�\�	.^�P\�\���\��L=7E �;��\�\�\0���1H�rt\�9\�\�[v\�\�:+.��\�ࢆ2-\��\"\������ߡt}VR@ǂ�\�\�,�Rx5Ņ�:W/\��9~�Nk�ܬV4�\�A\�+��\�(\'\0��r�\�%bP��\0\'��\'���B*j\�2(�����3�;~ӟd\Z\�.�U� %BF\n6X��Z�	\�r\�H\�\�H�zJ*���F��5d\�+��0Y���\�fd\�vkykl6ص\��I�\�:\��l\��r=�\�b%tP��ڰF WA��б*\��\n\�ܬ�\�V)\�#\�G�r\�\�G�$Gc�هl\�t�~�\r�5\�,=F\�12RW6nd��\�\�(�*\���Ee����~L\�\��}=�}\�f%F\�B\��\�1T_,f\�C\�w���f��(\�B�34�A�]��״#\�܎Wī�z���b�+�\���\r��\�C\�\r��\��S�\�\�&�av\�\�H\�\�T�8�d}J\�E\�*Vb�wT\�؅����R�9\�\�\�mʎ,\\]eb\�\�\�S~�\n�e�!�܂�\0${�4\\�W�EϿ��J���+����\�+�)A���W(X�3\�rrOq^哂\��\�\�\"6\�\0VX�@^Nh\�\�{�qX+oL��rxW����\�X8(\���E\��vq��\Z�=(o\�m�tց�3�8�P̣/��;�;�]��K�\�\�\0\�\�\r��\��\�B1\�6 \�앤]#|\ZWI�1�G�X\�{\�ʯ���!���\�L�\�3q����\�k%r�WڞB\�1�`�3ݸ��\'<\"n���\��c���&77F\���^��Ll\�\�(��z5ٻ\0�vE�M���+�Sj\0]h\���\�74	��E�X��B,����!+\ZD��D\�TK\�x\�6o\�~\�\n�+.Pk�6\�;!3P{\n\�[jg��r�z�\�C��\0\�i�\�1�.��7\�H��\�Y,���ua\��O���6(���]3f�\�+\�e�K�W@.�kKU�WL.�] �b��\"S��+�9�\�XF�+P�\�M\�6gs\�ށ�*\�r˨U\�V\r]%�»�$�\�m{��JKT<����+)�q���Bѩ�h\�\�\�\�rw2�O`s\\0�&\�t\�۞\���;гm�E\�\�՛mY�.C�㱲ɪ\�*�\�T9Ӱ_�߹da�=�\0+\'6ހ�A��p����\�\�{d\r�xT\��\�.�\�6sb2\�C��d?�(��]\�ک�T7�v\�/a�Y�\�\�b�\�\�$n؂�+}�$m�`�X\�r�d{�NMy=�I*�W\���j?q\�\�\n�w5u���D	\��&��\�.\�r\r,�?ġ3\nl�&\'l�\�=�\��8b맹=\�\�!�\�|�gl\�\�}��Z��q�NN\�6M\�\�Ǧ�X�\n �l	6ۨhV	˲(9�M#[\r\�n�Vݩ�I+ƟPO�T#�\�\��5A>�f(\�J��\�E4!���o`݃���+���ћ�P�\':).\�x	�WO>\�\�\�V�N�o\�~�z�	\�E�lBpZ\�>\�}�\r�\�v�F\�8�X��\�9{�xE\�W�\�&\�\�M;�,\�C�ʆ�\�M2:L�C@�`WH\��\�w��œ4�\����eS�>۴�^WtB\�\�\�J���\�gq��\n\�9S�\�\'��0�+�؞\�m\��3�\�	�2V6p\�v)ʷ��?a\��O>�\��X\�ZU\�.j\�9]6P��/�p(l\�\�x�\�2d��\�]]Ss3]a$�+�����=V�:�7(鮀\r\�걂*�K\"�Y#b�S]d\�p\��G\�\�]�#H�\��qt\�Y̩sZ��A��&;Ĳw\��b�q\'V\�\�������\��\0T6�NhZ�W�G��w��Qi\n\����8\"n �+\��#\�L,b��_Ǝ\�\�\�\�QW�r\�h\�M�\ns\�Z�G\"L�k5�\�%r��+\�+��(�dt4\�%k+�n_��&\��b؋��\�\��9Ydm����#n�\�O�|�\��uZzoiܩ��\\,b�S��_\r�\0)]�7;ru��rȮ��±(\���b�cUM6#f�:\'\\#\�\'�Zj$q�>��\�\�\�\�\�WH��\�]�\�Lq\��,\�\�F\�{���l��!�p�Jd*�Z-ܝ�Q~���;\���R�!ا*\�\�Q`S\�>���׽��\�`2!5b��d�]0�nG0��ҽ�\�5\�G�\�*h�6)�j}L�L�\�F�\�kkSgl�\��%5\�][)k�O�\�;\�e�X�A6~\�0z\�æS�ρ����\�\�B�<+�N�-!F���B�GD�)B��h��#.\�Xޣ�Uˬ�\�z\�H��.����\�z\�u��\�]W��\�Y\�L����2���FEG+�\�\�b\�1tcRi��;\�\�זQ�*�^UD���yU�%\�TK��sCLT�\�\Z`�t#\�ĺ1�\�D�$\nZ8D1�\�b\�F�4+\�º�\r\n�\�/\r\�D�O��ү/�^]J���yu*�\�U\���\�(׃�x:u\�\�ө\\���ye\"�\�E崋˩�R/.�^_J�0>\n�x\Ze\�iС��\Z\�,A�\�\n$���\�W�_oڲ��\�\�\�M�CSdk�y_����\�/\����G���]\\/\�}��^�\��\�\�qR\\�f\�\\O�ݙ�I�|.��^!�\���\\HOA\�;�\��\��X�a�_kz�\�\��r\"qR0��\�ʿWW���!6w�\n�\rK��M��,?�\�o�Y\�\Z���>g9f��dSd!\n��\��XS*sx{~;��Xz,�\�\�\�}\�\��G\�\Z\�ֆ��\�N\�ߏM�%]_fJ\�\�k�J\���J\�Y4�$�U\�I�r���G3$�J�b6�\�V�]_c\�\�k�^ޛ\�\��AD�\�ƧN\�\�]{W\��Av���\�\rϢ9�\�ɚ��\�}��\�v0�\�\�\�\ZJ\��V\�\��HXi*����`�\���\�VV\��\Zw\�V\��_n\�o\�v^,1�L��K�\�\n�\�f����b2�P\�w6\��V\��ut9V\��:}��zuޜ��.c�2��tڰ\�\�\"\�D\\Cpi��w�\�?�\�\�C{!\�\�_���{\�tT�\'N\�\�ed殩�E7\�?�\�\n%4H\nȅ��\�+��MW]\�\�E_\��ԟ���S���{�8�\'�:0D�\�ce\�Q\�:6ٞ�v�\nP\��\�eoP��\�YY\���:{=�\�\�Nu�6�#u�J\�@]\�]][�!\�\��k\�\�\��>(?*��z�\�0ʠo#\�\���b \�,7)�(\�\�w��^덏k�s��X*�j7]��R�\�i/�r(&�5I+$\�Sv\�\Z�M����=��2�\��jPui�da�fв�N�Eٿ��\�v\�|�u}�V�ǔD �9�����Ǻ�U�\�e�hL\nȻk��\�\r��� +!�\�p>(�\0*�\�\�\�v)\�1ˡ�\�]d��ǣ)P\�b\\��\�\��\�\�`�W\�\�4�l�@\��X��u�#nn\�)\Z\��עP\�\"jk�c�*\�\�cu\�_c�\�\��\�][\��T!������\�\�\�QW�|�FYBmA:\�ob\�\�\��\��1~�o\��r�\�.n\�\�r�V۶\�u�\�\��{+�\n\�Wr�f�s\�֏\' �\�k\"��#����獯\�*��H!~\�G\�݂j<\�\�m\�k՞�e�{K,��c\"T\�b����;|���K�\�Vj�U�k[ue�鮚\�\r�ebB镉V!H\��\�v\�\�Z\�\�_\�]]]����VYn՗��6VV���\�\�?\�weQ�7�����o�\��\�\���TjP�P<iͶ\�\���\\|WWWY,�Y:W\�\��\0t|\�6H�\�aI `l�/��V*b�t\��b�X�W�\�D\�9\�n.�J;\�P�;��\����6�_��U�ɐ�4\�\�}�?vMP8TǓ\"�\�3u\nw\�m�ٝ�~\n\�1!��8Q}\�<U70Ǜ��j��f\�\�\��Ơ�\�.��UfՔkؽ�V�V�\�b�X�E\�\�A\�\�\�~)9`�\�{)ۘ\rs%<����y\'5\��t=\�G�n\�\�8�Q\�\�U�;�U�\�{�L�kj��?\'�z��맀T�\��~�ٞ���KY���\�]fWU\��\�r\�ׅ\�A�\'2�\"���\�wj\�~ѱ\�ݝ�T~DS��Q��,&\n1*��Os\�\�\�ۻ?�\��qW�\�\�l\n��G�W3Xqu �=�\�\�\\\�[\�M���5\�{�\�\�\���\\S�c_�SW\�\�\�\�)\�\�\�E�}L@OT\����F\�L\�;n\�\�\Z��\��&�×!^밺\�+���\�$d/\�1\r�䫬�T�H\����M\�A�7\�\�\�MG�}#�\�\�M\�\�uL1\'\�T��j�\�f��%5[%BG9t�\�ڣGǥ�\�7�\�\� ��\�d��i�VB\�B�+-���\�\0\'�S��)\�D\�\�!qc��{i�\�{�wM\�SS�7s\�YY>��/3��4��OW$��u�\r�V]2�a�,j�\�p|z��\n\�fݽ�~Tk�\�d7Ckd����!\�I]3�n*\�\0��.�\�\���\�\�\'�\"�1��=�\�:ӗ,��p6�\�u�A_f�)�\�`�&\�\�DTڈR\��M\�K2���\��+��d�\�oB\��ɂ�e�Mu�5{\�^ࡨ��\0\�2�\��\�\'��\�(Ȃ\0(v��\�9|ϐ�q\'��\�~\��iF\�\�\�=�Q;�\�\�WW ]p\0\�.\�\�\�6%\�A\�j3J�\�\r�%�\�r�r�鼩��i�U<\�\\S$P\�=�\n�\��XܢI7M}Ӑy)���\"�*�w=❱�n�]h������\�B�gL�\�����u\�\�k ,y(]Z\�Z\�F\�\�#۹\�\n\�`�\�	d28�\�\�&?\"	\�TY:�G�&��p��k��d���a<=@\�\Z�Ȍe\�\�pK�\�\"J\���T�b�{�v\�W-\��ܟN����^/!�\�~���8\�][b�cv\�<X\r�nH{�gx]\\�\��j\�i�\�F\�\���\�Nw\ZC�L\ns\�v���\\��}�\��E\�KNA\�ݦ��\�mD\�s9.�ee#\ZSE���\��;*���\�\�\�\�\'\�\��\��\\.Qr�A@�w.*���\'8���`�;\��\�-\�\�{,�j��IC�\�ek�\0��0=����T\�\�}*lC\�j��%\��pM��\�HO\�eI�iH%8�2\�.{�AEˣe�\�\0l�\�\���\��Q�\�\�3`�N�\�\��\�\�vM��\���N��0\�Z\�[3�@�d:a2EuY	�Sc�O�̉�ũ\�?�\�9\�\�\�\�&\�\�#Ņ�,ݝ�\��7�\�ا;�X��GU\�֒�\0ڷ��貲7w��lrb\�#WQ�6�ڲ\n\�\�\�nO$�f=\�j�\�\��/p\�\�b�5JY�V�\�t*��T=ZȔS��\��zBw\�{�\�rn�W6 ,J9_tlU�D9d��	�c\0V\�B\Z%�\�*?\�\�=VA]]]J}��5��O+�q\�\�\\\�\�\�W\����%\�h\\\�Ȳ\�\�w.+>\\C���6bjaG,n�\�h�\0P|n\��\�\�|!~�7\\\��ll\�5\�9\����\�K\"[no1�E|\\��6\�P鿶�z�\�-�\��Iʌ\�\�p�P@l��@,�h�2FZ\��,�\�!8�\�\�90t�\�a,ph-�>\�=\�.H�����	��d�%<�aSS����Z�\�\�#JfEwX���×\�\�E\�\�\�7E\�\0�g5\�s܏����&H\n\�lV(�\�L�\�e}�<x&:\�Lޛ��\�\�L\�\"��\�\�5�\�\"\�sp|\�\r��\�n$e��hv]H�Q�J,O�i	��i�j�I\�㡓�=\�\���\�w�#���)ܖ\�\�\�Nw����%\�\�\�\��?ڷ���\�\�\�\�\�kl�N�\�\�\�\���a\�7d\���7�\�k|{H�\�)\�\�9tj��\"25u\�#hS�\�nc-D�v(�\�\�Y]d�j4\�+���5\���.^^��:�\�����\�\�\�РQЀ��H\�\�6<cf\�\�>\�\�\�0p2\�\�>6��;7��b�.�l9.�\�\�]%�\�.�\�#\0B��N�(#ᚅ+\n}6)�\�xt-im\�N���x\��4m^�\�\�d\�x�\�\�◊O�\'�k.�5��㬙�YG\\#L��\�F�\�53V\0I#�\���\�^Bs�����c\��\n1���\"hU��27qL��g�DlZB�����\0尧j�	ԗ.�L�q{��Pц��\�aj���x7^hY\rޞ0W(�9@+\�59\�Y\�\�\�\�ǘ����+�t\��,�\�\�M\�\�\�N\�W�\��\0\�tyὝ�7k+++le�ꬁVVV\�\�\�2�\n��Ժ\�V�4�f�I*\�=��/a\�\n\�M\���+$\�\�7����8)\�4�S�׵d���\�k��\�U��\�lY�5�\�(\�hO�m\�0�\�ۺd\\\\Y]0Q�� \� s�b�BFy2\'�e4�#\�\�V]Ց\�PE7��\�q�Ƶ?�{;��\��:0S�lw�fF�.n\�8cp�{Sf\r`��&�3�\�\��9.m�UO`eu\�\�db�r\�\�\�p�\�*\�\�bc�����rH9�6\�6�%#�E5�Z\���\�$J*8\�CP���\\���\�:\�V�\��\�\�\�\���d\r��\\\�!܂\�\�*\�\���\���	\�uC�s�\�D\�bVt��e`V*˲;]4�~Y1��f�A\�!\"�WVF4\�B1(\�E_k\�6�N�Oyq���\�qg0\'�u\�c�.Y+���\0\�\�\�\�\�r�	�5뇢\���v��\"�Ƶ��}�\�ߴ��u\�6��\�u\�nn\�J\rq-�B�G��	ԫ¯��\�\�>�Pq�<�\��~��\�Yb���BTҸV\���g)� �G\�Z��I;��l�)�8#%��\Z\����$\�Y{�]\'46�7 S�\�\�\�\�v�۫�\�\'a���z\�\�\�ͪ\r嵃.�X�i\�.J\�+\r��\�f5>\0��Nn\'z9Kf�t��8 ����D��[`��Bp��\�]&LB����\�\�)\�7��\"\�\�DYwQS9\�	�\r^\r�\�5IF\n4jH\�n�]{\0�\���_��C��P*D>\��[�\�6\rګ\�QŇ\r�\�\�{�\�ܢ�N;�b\�\�L?�\0�at�Mb\�\�)�\�C)q؅��#{�Q*dC��j6\�\"�ri�c\�\�\�gdB��u;�U�U4\�F\�\����qjq�ب�S�����ߙ\��^�\��fڀ�Vr]\��m�\�Q	\�V\�ap��n�\0�\�>���S\�Ga�u��\�獊\�\�}\�_�rT����_O�Sl��\r�VV�\�G.(/�yAH�_\�\�=�fmWq@�l=ԡU�z;JSͶ\�1>�yA\�M\�b�\�G��\�Ȋ��*��ĈV�\�\�������-�\�\�\��_\�v�xU�t\�C\�Jh�j<\"���~\��8Rw�~�g�\�\�\�:2��y�oQD�CS�am�Yy>\Z�k++\Z�PҞ��owz/wR�DJa\�\�U\�����g\�V�\�\�s.�i\ZM�YYY_\����\�pQ\�8�\�-;�\�\�@+�;\�F\�w����ٛ\�1r\�A	rh�\�\�8\�^\�\�tU\�\�r��1V�*H\�N���>\Z\�en.P��6�\�6��~\�\�*U\�Y4\�\�\�M\�\�OB���\0EM]\��YYu\Z�\�M��ˡ \"Z�\�S�\�\�+�AU�\�(�_&C\Z�:4P\�7%uuO\�r��\�=�\�\�m�wfn@!��\0\�CZ�=�]K�2p���\'<$�L\�x#�o���`�}�����\�Z�8�>\�2��M	�\�w(�_9�Iq��ª}�\��5l��\�ډDQ\�4Ѳ�\�t�js\0\\\�\��\�{\�\�ȶ\�\0�nv\�\�\��\nfn\�O7g\�d�T�T\n�*��R�q�ҹ\�\�\�S��A�ds1�\�W;�{�=eU�9\�r��	ϼh��\�#�6VVX���h�%Bm[��\�\�r�BqpO!�F۸UG�t\�\r�Ը(�z�~Q\�~\�l��f��\�\�\�ȹ\�ݛ�9=7v*b\�F	�9\�<���Ɇ<�Tu4�5�F\"\�\�Z\�!\�\�Y̔g��eN\�\�ͱ ,vE���\'����l/\�>P�j��\�T\Z�1Lh�n\�#rC�\�ύ��\�Yq\�~r\�\�oM��wWM���\�~ۢ\�I)�A�\�{�5YOMݝ�[h\Z�w)\�\��Y9T(ߋ\�\"\�\�N\�7�H�jQ�K.�\�t�\��7�Eu��\�Ŭ}��/��Z�\�\�S����A�h�\�U��\')Dj� 6r\�)[4h\�Uқ\�Y��mv6\��knU�+�p�\�\�\���S�\�?�>\"b\n\�\�W\�R��S�N���Ĺ<�\nL�j�i#�ਖ\�\\�\��Y\0�ۖ?$\��\�aU6\�x\�\r,�{\nW�_AOZ-F(8e�\�\�H�+�\�hk%c��\0�8H,E���n}\ryr�l�!9\�juKB5.(��\�\�\�\�s�%�7\�\n��� �/\�PWR���UK uLQ�\�v\�\�gu\�sE7VT�Fy��\�\��L۽����ʺk\�k�$���&��S?�	@�\�y\�ܧ���\�*B�vocx-\\��\�\�\�;��\�� 7D(��W\"{ЧX1��!�&6Q�\"\�#>삺�}�������\�\'ܿ���Ծ͍�z�\�\�\�#n���\�!Q�\�<\�^\�P#�D\���\0Oqɶ��E\\mH֗;b���ʹT�:7�ٴQ��E]���\�7���A�a{�\�Y\�\�u�\�y`�vR�\�m��\nɡ	L\nW\�\�W�I\�\�mVVM��{N\�+m��Kcu�eGTIn\�W}�g�CA�bt\�j�jS%Bo4\�\��(S\�\�~$B\�X�*\�4��w�\0�֠ШB��K�D��B&0��H\�}\�EJT�D\r�5TѸ\�S�\�ר�+\'�~\�w\n\��~{Мl\���Q?\�\�&+�d�9:;,,�WP��m�m�\�\�0���,�\�SԽ\�R\�S�g\�)�\�P�Pӈ[PT\�p\�\�\��du��@bZ,��\�0��v\n\�X8.�\�-�EM8��ֹI���\0M6WTg\�J��E\�n\�+c�\�B\�15��{�L��\��<m[i>\�W��G\�\�J\�X��Vj\�\����(�\�U}\�k��\�̖ D�2\�DҢ�\�<T���\��\�C7 \�z\�Nji�s�-�\��F\\�*(]*��SĀE\�\�\�\�\�$\\��PAG!��\�ٙ�E�\���9\�LOu�Dޘ��\�ܦP+$Jh\�}\�Qv��\�K�t��J�ܒ�Pɋ�Ｏ�hf\�\���{.��=�Nu�\�I%\�Pᯓ�\�Q\'��\��\�\��1Y,�tIYr����t�kCR\�\\l}\'`�P\�\�㕲5\�\�8]�\�r\�j��\�\�M�Ճ�}1�����V!�߹\�>\�K&(�\�\�\�1\�\�u\�k�2j\�un�n�¢���ǐ8\"\��aN�)�60��R\�\�rs�.!G&(;/E�*g#}�WL�\�\�h�\n��\�=�:\��;\�QA7\�\��\�ٛtU캈Ⱥ���\'\�\�\�K�U\�=0�B�r\�.\�\�\�7�)��\�{��J���aB�%_f��A3�t6V �\�S�qSL���&\�\�Ƞ���\�*�@M��\r�*H\�#91��\���\�\�>\�\rÔ�9Y\�!�L{�u5P��\"S�va{\�!�W��\�\�G\�B\�$��ƛ�\�s\�\�G�&�:�t6oi]dM�lD�ַ\�\�\�sé�N��l�A\�ȝ\"t�MP��\�\�NvHz\�!jd鯺s�M�X�du\�\\��y\�\'����!\�\�\�}g`�w(��Ѻ92nnFTj\�5*\�\�`�p�[zsie}�h���EO`M\�rˉO\r\�\�齧M�\�5��[\�w��y\����7$�\�>)S\��:2ݜ�\"IA�\�Y]0���A�9k7	�\�)�\�v>��z\n)�to��\�[`�m�O�\�h$s�5\�(\�h�S\�\�;���\�x�˄�\�\�σ!\r\�.��D�#���\�S\�btdL\�\�\���\'\�8�IurV(\0>znA\�7Q�R\�&�w\'�\��>ؾ\�\�!;v�AVN6=�TQF�ZַrSܪ����\�d\�? V \�\���\�F\'\�\�\�g�ɧh\�S\�mx����\�8PAP���M*~c\�\���\�`D|�\�ܢ�\�\�Rϳ�{�����\0q\�v]\�>\�/\�e�H*�����G�ދ\�r�ͻ�\����\�!�cyJr*\'(M�r>��\�\�\�)A�p�\0E�ACR\�uӊ�\�R?7B\�m�\�\�>�w���\�\�\�\�ʱj���\�\��e1��]�\�\�7�o��Hv+����?�;��Ϣ\����q�T�ѓ��\�\�\�FUG��ymB:]J�ʤt�\�\�k\�*זU�,�^WX���y]b�\�\�.�yeZ�ʵ\�k\�*זU�,�^WV��V4�м��yUbn�V���\r.�y]b�\�\�u�ʫ�V/*�^UX���.�\�J�^WV���y]b�\�\�u�ʫ�\�/,�^WX���y]b\Ze]��X�\�J*���Ք4ʵ\�h\�u�\�u����\�˪W�U/.�^]T���yuR�\�\�K\�j\�\�\��\�/+�^WX���6�\�ʫ�V/*�CK�^WX���y]b�ʵ\�k\�jזկ,�^[V���ymZn�Vhj���\�:=*�-�^YV���7L��uQM\�*\�\�j�\�u�#WQ\�d:��\�\��\0`�\�6M)�E\�k�\�\r�2�\0����58bR\��9:��˯*mT\�Q\�\rO/���>4&��B6�Q\ZoU��F\�׸1�Y����I\'OgNK�\�f͒�O4�����*��\�ښ\�g�QA�B\\E=L,��E\�R\�ڏt�Uw��\�L\�\�Q�\�\��Z�3�E\��\0Es�U�b\��H�	PQ�c�L����\Z�m<Q\�\�e\�Y3�\�<�\�U\�ol�R�\�N�\�1��h��\�H\��r�iqM\�S�>Y�\Z\�\�GR|Q�\�\�	���\�#\�#\�%EC\�\rhcw�L*4�#T�-cj\��B\�߃�\�zN\���!���\�\�r:}/Y\��p��)c1>��\�\\ԝڵŔب\�\�L\��Դ:*\�â\�?�O�\�\0*\0\0\0\0\0 !01@AQ\"2Paq3p�\�\0?�\0����O��O��O��O��O�Z�[��\��?\��)�(�/��_,�\�,�Ye�Ye�Ye�⭉	Y�1��R\�,?��_SOؠER\�H\�\�\��?��O\�\��\\?�ȴ\�\��y\�\�dtl��\�F�m\�j�Q�\�\Z�����dD����-Ĵ��_-/X�jA��\�{63c4�61;\���g�H��=Ɯ�\�!��*x�\�\���f��.�5�T^,�M�\�iF\�1�\�\�mƢ�i�QTk\��iN\�k�R�vE\��\�їC��\���o��QD\��;6����xcg\�řJ����\�r$��/\�\'*$\��\�*b�\�9׬QEq\�:D�\�a:�\�\�N_�7H����\��Fm\Z�\�\�FD��>��HU\�:#+\';\�/�\�Eb��5öF4L�ċ\�6�᧲��\Z͖Yx�\r(�J���?\�\�\�K�ɉWy�\�]�\Z\�tX��QQ��W�\�\\\�U�xLxc���\�������>\�\rW)c�7��\�ͯ\�g\�|d�^e�{\�e\Z�\�xX����\�º΢\�X�X��\�CԿBe������VQE�s7�{7�{7�{,�\�,�\�,\�n-��\�E�)QE\"�\�e�4R+\�\\\�\�n/�:B�>1\�1��&_��׆�~ʌD42Q����D�\�(\�\�\�K؊�62��\0�\�JȪ\�/�	Q\�e>�\����W\�\"�a��i�\�m6�JeP�\�h�bF���Q_CE�\0b^�Ĭ��M�\�9�9�M/X�\�\�H\�m6\r�\�3\�/\�/��2\��|h��(�_�O\�f\�\"C�3��\��\0�\�|�l�\�\�W��4\�\�4�7\�=��Ϳ��\0\�],>JN>�I\�\�\"QE��Fe�>�\��~\Z+�\'f\�Н�5a��\�k^{6��3{�e�ȥc��\��\�k�\ryW\�<\Z�Хd��K�\�1*ʹ\"�\�cx�%f��\�O�zy���DdJ6K߂1�\���\����_�q�ѽ�m�-D~|�#z-\�nE�\�ܨ�\�,�\�h�^l\�\��\�\�ʣ~���B\�_\ZĊF\�����Y�\�\�m\�V(\�m(OFt|�sD�~��DK�\�,R/����\�\\��q��\�lC�\�\�d�\�\�/����ٱ�\�Ʋ�h��\�\�5$�\�\��\�,�\�\��k�&�2�\�\�1�E�%\���_x]�%e1�eO�%�--̜hڙ�*+�Ӳ_\�N5\����:6\�\��Q\�FѢ?\�MS�JN]�2΃隵�\\\'e\�\�i�\�K��\�\"%�d=��\�^�D�V+�QXk)^k�\�Hܛ�\"G�>lzCC\��\�c7���?�����;X�:7�ȱ��]1j�jOs\�hކ,6,QC�\�,o�\�\�/��\�M��1E�a���W�6��!m慘J��cd\�\�~:f��Jѻ�ex�1�I�㉌���w��~G�V+ĝ	\�E��\\�#,�\��\�2�\�r\�f\�=6\��6�\'��\�N�;%!�\�N�\�]\�\�a��2O�!�$X��u蔯�B\�\nV�<6E�\�lFҊ6�M�Ҋ(�QF\�i�\�.�Q_^Z\��4�7�\0�J\���56\�ҏ�Ȥ�_\�⬄�\"r��K�KRL�n�\��4�w@��[X\�\�u��\0V���\r:^\�#�\0�)�2�_k�\�\0*\0\0\0\0\0\0\0 !01A@Q2P\"apqr�\�\0?�\0\�_�����\�_e/٪�������Y]�e��\0R�7�\�\"wèǅ\���:���\�t�_	<%��\�S��â\�4��#\�\�s�����X������\�<�\���\�R\�\�/\�\�EQE�Ѻ\'\r�\�=/\�O��4��K	���l颹\�|�\�nn|��cb�ȟw����:����\���k��\��\�\�\�E�7�$}P���N�ܢ�\�E����W�J\�\�a~$��F�l]1*\�\�BBU��G\�\�dc\\�\�У\�LYr\�\�\�\\���>�,�,D�*]�;�\�y�V_	vD$߿BI���O�ʬW;,�B\���\�po;!΍ٹ���W��1,l�E���sr.�\��!\�\�!.\��lLly^�/0\�~&�j\�Mh��\�\��\�#Tj�QH�P�+�Φ��\"�\�ٳ6b�f̶l͙l�\�/6Ye�\�e�\�/�\�p\�Y�آ�\�Ɗ(��\�Ef�5a�\�\Z,\�RG���V�EqC\�y��lY\���\�F�a3kொ2�\'�+�(���6�rf�\�\��jz\�qx��\Z-W�e\�\�%xE�K��\�$QC�&4_\'�>1�h�D\�&\�\�\�\�v;�lj�1͍�e�E����$?��,�6�\�~\��8\�F�\�r�f\�\�����u�.+(|ȏ�x�Ye�\�_bx�n\�\�$���\�\�\�\�R\�\�\�C\��I}���\�\����*$sX�UR(�w6e��BY��5���\�qqv�\��m^\�>\��t\�n�\�{\�\��u�\�\�J\Z(�\�xr��K5\�p�hN\�kѵ����\�c�}_CBe\�\�\�\�F�KȞZ�D\'�\�gK\�#\�OOYY�\�\���˦�W	ƻ�3LN�:h~	��e~��\0x\�2\�\�U�K\�\�Ye�>θ��{D&�\�\�z.���\�\�1J��y\��k��qj\�Z\�\�9wDzs�>�-\��[}�MMJe3CV(J�W�e�\"\�eHR_e�dl�S�6QX\��L}ݛ�\"\�(��y;6f\�\�\�2\�l\��X՚\Z�\�\�Po�c#�E�F��O2-1\�2\�I.\����x\�͍��.\�P�b�\�\"��^ �e\�\�\�̳�l����f\�6!.�hk,N\�(^�����~CDyG��|R\�W~\��Ye]�\��\�R�6/w\�.U���ݖYx�\�\�%���1f�&Y\�м	WfB\�X��e�\��7���y}�M̽�\�;\�r\�\�{,�-�l\"\��2]\�TH�\�G�\�\�R,\\�\��y��>5ɺ7�{Ǧl2����/\�n:�F!�!\�\�\�U,1eap�]\�\"ư\��rea	U\�K)f+�\�\�č8<�Y�\�b\�.\�:hL��QŖ%|V,���<^R\�\�c��\Z\�\�Ŗ�U\�ͅ+,\�G�\�\�Exu$��$_\�5E�}\�d\nd}q\\��eV��j\�\"+,���e\�\�,�ߗ\�fś�Ye�llll>��\�\�v%\Z�\03�\�Qu�G�ԗy�J+\�븺��\�O�\�H\��\0#�\��\0�gC��J߱ȼK�}	\��zd�\�7J\�\�G\�\�Hn��cj\�\�\�o&��W�\�\0C\0\0\0\0!1 \"023AQa@q����#Br�PRb���\�\�`4S�ps����\�\0\0\0?�\0�\�G/ȍ��v #1P\�q�.\�h\�\�\��;�+�\�X�\�\�w�]e���\�*���\�_�Pm�tH��\�p��f\�\��E�qs�CB\�f�\�\�d�\�\�֍\�B/<�VO	��&\'�A\�1i�G�����p��k�8�\r����?�\�J�8����f�\�\�j��ca �h\�WQ~�u��2Ժ$FAU�\0\�u�q\�N\�8�\�/���\�\�wY(�\�Rb\�U�\0\�>݄\�dc$[f\�NaKC�:\�0o��\0���\��[jL]�-g�\��\�\�I|G\�U񹮵��*���\"sk���+�,6o\��&I\�n.\�\�%W�\0-,ㄮ�\�\�ˬ\�\�\�4ؒ\��\�;\�M�s�\0�ifbҿc\�w\\޶9ԀZ\��+�Ú�GiwX	ົB\�\\���\0��TOW܋��*�֓�H--#��Ik;��VO�\�\07�\0\\\�`/������A����d\��c\�Ģ\�rL�pV��ٗ��L��0x�Vn���hIdK�.�ߗS�\0\"\�I5�L\�\�Ug�\'�\�J�\�H4\�\�Y9�\0خ��;8\rN	��BĬ&\��D\�\0\��j��Q\�}\"B2�\�>��\0t��\�M\�V],J.�e����=.̽��Be���\����\�X�\��k���\��\�gm\�\�\ru\'B�5�\�1�VJ[>�YƝX���\�\�\�ön\�\n\�3X��8t�\"\�\��O�\�\�j[>�X�(E�\�*\��a71\�\�7�3\�t`�lla�V\�R�\���3�\��.�MpMp6UV\�傴�P��\�X\�g8�H\�c�&u���ΑV��	�\�(��d]��n�\�\Z��[[/�\�\�5V\�s1a�&y�gd0�nV�]\Z\���\�mV\�;iYZ@�sC\�o\�\��_\��\r͙ƭ@\���է\��\0\�=LحOG\'�3<\�e��G�\�֌1k�V_X�f�\�E\��]W�����#\�hα�\�c\�I\�Q�pߦ�}��-\"�\�hy��\�)�\�x~\�uE�ُ��\�\�ݜ?�s:E�h�^Bo\�\\\��n�������!`Nm����?񚰕�k\�-7k+?�F�wʋ�Ç_�\�\�`;�\�\�Y�\�9�\�	�M\�m���0�9Ů�0A��`�j��W_f>#k\�&�2b��-���\�ꋁ�.%iѝ�8t\�>�e�$Bo\��\��T\�-�>��˩��66��C\�,�\�ƙc\�m���M��qk�ʨZ�8�xg\Zuc\�W�\0�?cf\�Нj�5b\�}U��\0���&\�s<�\��\n\�\�B5��n:)�l�p\�Ú\�O��\�8�m\�\�[}JѝfN�A��6�RP\n\�\�M�k�\�\�|�\�\��{9�k\�`昍{�~�λi\�j�Aюc3�\"�\�l�;���\�s�����o����?\�>9��]oG8��7\�T\�\�x]\�tw7j\�&Ü��qF!Н\����m��|\�_\r��\Z\�\�\��C�n.\��\0\�<ؘ\�\�0�f�\0\�`x#ci�e���Vvoq\�\�H C`�\�\�Β\�C	\�\\\�\�\�Lm�N\Z�E�c\�(9�3#8����M\�{l\�i\�%b����,L�\�\�gp\�\�&�\�5�퇸�E�\�\�(:\�\��E�i�Dسk�V\'Y@�\�(\�Y�\�w�״9�qQ�G,K\r�G$\r��\")3w\\\�8Zq�\�\�g�+���\�\�\�1�J\�id1qX�g�Ęߋ�\�i��\�x\�X@\�\�\�\�*L\rX\��:�[qX,����\�갟\�`�b�\�\�~ \��X\�1(k<DRel=\�>Ɍ��\"��fk4\�<E�(�a�E�L\�\�Y����\�E&Qc�ZD ��Y��\�I���\�l=\�\�-��\nMl=\�;�fU�\�l�l�l�\�x�\�C\"�Գ*\����\�e�A�@&�\�ņ�L�}�Z\�Y�&��kD\����\�77�f,4��\�B��Mb��l\�hbc�\�[<N��\�{��>��bV&\�mj���\�G8!gj\�M�V\�\�V&�JD��\�d�\�\�]gfm�\0�Ұ\�\�\�\���tk7>\�\����\�\�~\�\�\�\��l-2�gWm�\�2?\��GӒ\�ma�cvĺτwrVNi�w�_��?A?eb\"u�u�̏G�u&\�Q-\'�l��?�\�~˩��,\�\�+9\�r�Vl�8z\�Ą\�{v�\�FG��wb�\�p�iδ�\'�kH\�R<U�\�V{�\�\�Htk7sy\n\�\'\�Bͧ:\�\�\�\�#�H�V�\0AN{m��\�i�ָ�pFSV;���Bx��j-���u������\��\Z&B\�\�\��\�~&\�1n�6�1�fl8�z]�&y�\��d\�@�\��M�Ҍ3J\�\�\�.t\�>�L1�\��}\�u�m�\�#\"S\�jqP�\0\�ZK�H�A����h�}�\�;\�-\�\"��#�����mYm5\�\�-6��V�M�Þ\��\0���\�1�d\�\�ZZ\�bA�g�߼�n�`�,fսgW\�:LL��\�f�\�r�h\�`p�Ȕ�Z�E�+\09֒�F\�\�?o\�,��p�Qs�S@(6\�Ć��rB\�\�h\��\�m-`\�<\�5\�t�M��\�\���hs۪x��cn\��YZ�\��\�M|ZwF �_�\�L{���\�\�\�\�tV��\0�+�c���\�֏\�\��|\���G\�CY��Gh\�K����l��O��gX\�sR���l8pMm��滚6\�V�kjZ`Q\�5\�a7u�c�a�B&͘ k�ZZ6����-��9Q[��A<9���O�cp\�f\�qt�6un߽ZZ6���s����\�G\�*\�\�	�\�\�ign\ZӺ%Zu���BV�\��\��sy��\���\�1\\A�+�旁\�SX��@\\�Y\�K\�;K2\Z8�af\'�\��V04C�ڬ\��\0l}\�\�\�\�`\�V<Aε�G�gfpÊoH�gV\�\r\��V�\�u�ݮn\���\�[�\�\����d\���Z<j��{;7\�v7O\�1Ǥ�M\�.\�	\n\�\�\�%ux�8F��0TEz�\�G�Y\��\���\�ے��\0\��x���\��D\�Yٜ0\�\�,\�ոCze���P\�\Zl���\��\�\��6��\�����\�sF޺0\�c\�,%�\�\�n<U��.p\�fۣ\��\�\�8�\0t\�\�̒���n\�Qn0�\�Z��Hp{�\�(�\�2\�C���\�Z `�md\� �\�\Z\�\�ٖ�\'\�VVn�X\���-c��:;f0�&�L��$	�i���\�	�>�\�\��J\�\�H_f�i��<S\�d@y��\\{�pN�C�ҭz+\�\�Lp@�2д�\�\�K&�M[YY��\�1�O6��p\��fC�jۢ�\�gp@�2ݍ\�yA�*\�;�qV]Y`\�e�g�(�g=�к1���zC\Z8��\�\�=�aD�iѭ\�y�4-:]�8n�cx\�A\���Fw�+0b�#;�d�E��p�\�B\�mi�	��sZ\�3�,��\�y�KvF_fE=\�\�\�R	�@\0M5i\�m\�0�����f�qj6���\�\�mf�6\�&+\�t��\�\�w�*\�\�\�\�͸�H\�1_�C�\0�ɠ\�\�;A�OG�\�\�P����\��J8m��nޯ\�0X\�\�kǂe��ִ\�(\�6�j\�\���Ù�Ou�9\�O�\0hy�n�_gj�O��-�\�y8��\�D�\0�\��\"�\��l�\��\�!kj\�v���e�u�l����ڱ\�\�\��\��\0Z&Vnr\�RhZ�g]-$�\"Uf��-`�A\�\�8?W�����V\\�\�t�ަ\"�a�\�jû��\�`\�w\"ߘ,6��\�z� {�s(ø)-�K9H�MN�\�\�M\�\��\�#7J\�҃Na<T&�̨�$�/��j�7�:(��{l�\���`A+��\��\�����Ϻ\�e��,\�H�ܵU`Txv\�h\0<\�Q\�+��J�\�\�܀\';�V\�\�\"��\��%�QH)Wx\�͗r�\��\�\�\n0�	$8M��Q�5P�MӢ��P*�\�P\r*�T-oE�\�\Z��\�5Dv2\�\�WFO4/�j�al\�ŧ�����g�)&�:�G\n\n{��Ne؍oqw˹\�v;\�����\�#�Z�\��V�Pk�й��\'Y�\�5R[\�1@q�9�\�\�!Z�\���JzG<��w\�119�\n.Q�5gح~��ߢ\'�\n@�\�I�c�\�\0xE5«>\�\��l�k\�\�\�+�\��(;���;ʛ`��\�.t�E\r�\�z�}�|E���\�j@�?�\�T*�P�UUUB�������?�\�g\�\�bh�[�\�\�\�\"\�@\��H�M�uV�EE\�,F�I��E��\�QuTp\�j��\�浔C��\�P7\'4�14Xp�\���FTA��\�o�ޫv�Z�BT�r\�>H�>j�@\�2TZ��P]e\�V\���9�\��5�Q\0\�\�)��\�\���QQQQQQQQQS*��\�E<�\�\�T�\�i\�\�3��&\"N\�q��SQ�rɉ1X�7�Vgu-9\�A�j���Z�P\�ջ#y��q[\�#ިB�_\�MUoQ07P�\n�T�\�sJ�`ģ��JD��\�\��UU]<w_h���\��	\�\�ud� \"�z8):�Gsx.Y.w%�\�5W��P\�>���}�T[��\0J�T�D�\�\�uT\��T\�ZH<\�x{�9\�\�[���\�rÞ;[�ܥ?�_/[�\�n\\2d2#�\'7q\�t�V�\��.ja^7\�Bh�\��UE�*y=[h\�\�V�T�uۖ\�*\�U���]K��~\�\��J��ׂ�T�\�\��պ*l\nq6��X\�E�K���}Tq*��\�D|\�,�B��Р\�\�\�\�ej\��3%�hxY\�0\�/\�0U�SSޠ|\"�/\�5ϥп��>jN_)_\�\�oE[���\�U[��n�\�u����\��͠�QY\�J4qXl\�x��;�Nt޸��X]���`+Yo+P��IS\�n�El�z�\�h\"\�|�\�ɢ\�iOҠ2��>!F\�\�p���e���-h�nQ5\�q�\�ֺ\\.�B�P)�\�n�U��S��\�\n�Ty-\�\\*�eUSv\�g�\�g�\\.k��\���\�A��A\�U\�h�Uy�D\�\��E\�\�Z�UnQt �\�k��\�E-	$O�\�+����X�t2(�B\�\nn[\���A���q���U\neT�\�\�Un��r��\0ʆj��r�/;�$\��d9��\�uQ�0\�\�\�@\�\��\�/��*��\�A�\\�b���\n�P�\�j�T.[�4<\�/���w�pɕ\�#pZ\�UM\�w���\��Z�\�UZފ�jP[\�R�L�z�\Z�\\<��Ny\�\�Qh\'�\�pJ\nD��-X�*9Q�\�\�\�ZWqTR�\Z,b�\�\�t�Mt�P(\�*�����\�w�\�\�):\��\��JJ�L5o\n��#8\�C[\��Sȩ����Z�_2�!�f��\� �\�C����w�_�\�Ȉ�\�\Z\�\�:\�xn�t\�\�\�Xj3\�)���Z!\���!f�7z�q\�_\0�-�D?\�k\�1u;\�A�(,\�0��\'BrA#r�\�\"Mʙ\�[ԋ���\�#�o96(�\�\0�y��ȫG\r\�\�KJx��D\�|\�nr����U*d)AT���|��\�-\�P;�SkVk�.�P\Z\�$��[S����:\ndV\0Ȫ��9L��\�r\\21�Ta\\��EJ\rᣆ���{�\�1�\�o��\�qZʍ�Q�R>�nT�[\�b�B\�r�ޥ%15���H�c$^|4�RT��O5\"��\�z-gy��(1�2�\�X��d����\"=��\�AV\�?\�(\����/�b��*���\�Y\�[�\���\�>Jo+X�T�T\�\�\�jꄷ�F2%�K��\�6ǹCq���Sp��X��\�wd�q�5t�gnAH�8h�\')�*�*z,\�*5\�W\n\�Z\�_\�n�Z��`\�5T�F\n:\Z��\�OpZ�/\�U�T��Ҿ\�gCdT�\��*B�\"\�\�\�@\�H�W���A�p\�\�&\�~\���\�T-e�T�\�Ry�\0�#굗��6\�-f��-Tc!\�E\��F\�]��\�$r�\�0��R�\�%EY�����\�\�t �\�m>hö�CC�y�h�9P��\�*�]/EP|Td�n���S>an�U�N��\�\�\"ͅ\�C{ܥ�\�\�F�\��l]೬�<\0�\�\�F\�)�-R�B\�7M4�qQ\�5\��P \�rb~s\�\�\�Q�GE5�R*�T}NE\"��\�c\�DTǑZ\���+��A�uѾ2`涖j6�\�\�)�\�8���F��H\�g6|D�u�\�\�P�tn��\�t��et�k]2.����Q�����\r\��\��\�KXd=�{DG�PL�+�5! �栣�K#xR#\�L����C!�ɪ�� �e3ʋ\�\�Ц \�h�B���SRS��Mj�\�z�TJoz�RS$#f57\�\�jp+UoU>K\��X�N\�\�c$�Rz-\�N\�ky�8-\�\�\n�UN�qZ�p\\r7\'\�w��%5�\���\���w\��\�����OR|.�\�8\�� \�ٗ7\�\�\���\�&r�\�PV.\�\�d�\�CC�(DB�U��U�P���h�\�\�ەU\�\�o/�D�b)\�\��\�v\�;o ��\�\�\�\����XY����D�(FI����y�\�\�b�^`�2T�������@\�ߒ�tLb4a}��|�A\�|U\��\nmY����\�·)�V�</ޤT\��X,\�(5jz�Dt\�\�*�����j̄�\��HC6*X;��REL-��X�����\�~�l}\�N\�\�V\�����*LeI��@6�S\�C�h\�O�I�UA�\n��YUUW\�W\�UUUUUUUULE	)\"Ƕ �Y���TTTZ�/��\�+c\�+c\�+c\�+c\�+c\�+c\�+c\�+c\�(�������\��Z�Uj��U��}V\�\�J\�j�U��\��Z��S\�jz�OU��Y�^�l�J\�{�\�{�\�{�\�{�\�+c\�+Sԭ��\��*vQ���>\�>\�^\�^\�^\�^\�^\�^\�\�z���+g\�V\�ԭ��Z��c��j���JH)?,�\�<<�T���g,�܎�eUUUI\�G�S�\�-ýOM).+Vj�L)3Q\�Cz�n��7VD~Y�\�Pn��\�Ȟ��\\d%P���\�X�Ќ{��z��ܷ���k4��\Z\�e�\�(o\��~��<�~IT\Z\�ǙY\�St\�|��\�#t\rr%\�\�q\�<�&��u2�2Ge��Wsࡋ䥑�0�{�ҨQ�\�ɦI�\n\ZG\�r�9i�\�{}r`�^\\N��H�6ݪJ�r�Ú�F���i\�u\�,�\�FZ�7�C��\�W8�\\\Z\0��Ԗ��Z�\�H��ӹǞ�}�w]\�\�+E;��_r\�w\�ôOK\�C�\�(/�\��<�]5\\��\�2\�ݓ��3q��\�]\�u.��*��\��U�\�\�\r�U���.SB2O=;\�nP\�Vq�)uk\n\�+8h\�`���wK$]EP{\�1y�c�яGlG5 \�!\�\�\�.\�\���~SG$FL\�|֪��Rq��\�{-/�ֺ���<Aw�D	��ʘȥ\�*+vU4�9Ve<\�\n��\�\�˪��:Q�,&dS�\�t�(�\�\�԰껁Z��_K�\�KLPG+�\�g)\\\�\Zd?�G�\"�\�\'��e\�\�a�\nG\�\�\�7��b0Rt�j�����e��T[�w-ʃF\�\�r�Pp�ʕ\�\�NC�\�Ǭ��e}A[���M\�\�k�qQ�\��w�X�P4m+\�AU[�y-P�.�Q����&�\0�����p\�a�J�g\�w%�q��S&*}n\�\��fB\�ǎ�\�\�\�\�ET\�7��Ȃ8�qE�\�\�\�a\�\0QF2R��S\\�ǒ�\��~n��\�sx\�0�2�Q�l\�ڹ\�\�Z�+\\�\�_\���wBY8���@\\\�\��\�QQ@���E\�\�).*J.BEҺ�x�<�D\'\�Ld=�7\�=���&�|Z\�\�f\���.�<�\�+6���\�E\�w\�\�5U\�D]\�N=\�\�7Igͣ�B�\\\�%\�%L�ʡ�QEM�Oz �R\"B\�w<�]��h1�(1�%EΎ�\"��#Y7\��\�Ĭ\�5ÑRt;�\�\�pÑE\�E5�y,\r���\��|\�r\��\0\rpܹ*]��\�sUޠ!���&\�f;Κ!s\�\�ɿ\�k�\'(;M\�b��E�\nQUD(*�\��*FAI@m�6�\�w��U\�[?U��B2v�\�\�5JQB0ₗ�\r\"%@qRPDQo��QX��\"\��oEۂ�T#�r\�ȉqX���;\�.���\��\�PP��$]�P\\� \\�|��A\Z;9	#()�� �\�O�\�x�I��H,\��~�T\�(\0f\��Dq\�Cv�X�#�pUS��y\�R�\�܂\�⣉MK~\�/q�\�o�\�ѷ�n���\�\�\'�G���\�VH��je�wN*k�0\�\�P�gdY���Ȇ���\�� ;�\�3*N!\nΪ{���J��q\�\�u��j�FIѲ$\�\0�l���­\�\�\"%�[\�#.\\Q\�a\��h�J�~�؃�x�\�LI\\Ǝ�gW�%�\noX�D[�\�\�G+\0��NR�T\�\�;\�(�\�S��\�\�^�[�Ar��i�f\�J\�\�Q0��V\�Jp*G9ʆ�G3Q\�\�&\�\�a�9_fV(BP���o���U\n�2�\�\�0\�E�K9�֜.>*eqC2\\� \�P��|\�(@	�;4\�N�vpPu77Y�q^7�/\r(�p�\�C\�7�(nSB@��I�\�U�D��\�@T!�}+U/5\�����#[�F\�\�0\�\��\n ��P-@�\�T+\�Ur�Y��Bp�[\"��X\�H\�U��Tp�2T��T\� ����Gώ\�G}<�k�\�sT/�\�^\��T$�\�o��%g4\"W\�r�\0*1N��\nL9�2Ġx�jY�*\�+����\��#ħ;�\�,�W!e��Ur&\�X�x*1��a\�PX�.a:C��\0h�\�\�Nb&ޣ��T�ᇒ\Z�DqT�\\\0఻\�S�\�\n\"�\�mP\�)��g74 Mw�˹D\�\�|��\�9!\�,\�\�n�� ��uI��AE\�\'�\�*\�R\�\n�\�*;\�/ Af6\��\�R�k~�)\�C\�j�\'w�I�^ 3��B$�\�$aQ\�ĸ�\\Y�HGw�#>c\�\�\�\�\��\�yn�&�!b\��M�D{�\�\Z�N\0\0��4��$Qq+�\�Va!C\\e�J��S\�\�*�E�\nÌ޷F\�c?�24�уD[�b���\�,!D\�\�\�X��\�]�F�5��F),\�O��p?tq\0\Zx��Jq�P\n=g�Ŋ\'��1\�\�\'.j�7\��\�%\�*�_\�k�-��m}�i\�[_j\��Zދ_\�m=�k\�[_j\�z-��5\�\�m1\�P�Tq*\�ƨ\�t{��\Z7tc��kS�3�P�\�+#j[�,E	�-e�V\�l�\�z�Z\�[\�G�\�Z\�_\�m=\�ڵ\�ඇ��b>J=w���\�Q\�#TRy�[OE�����\�z-x�*�\�5\��\n\��Z��S\�b�%���}T0z���\����hA�P\��\��y�C��\�\�C���~i+��%t�t���Ӿ�ȭ\�F\�\�\�`\�\��\�`����*�\�kpS���Vu�<Ua�*���QEVj*WMU@(���\�UUf59_�˱MD�\�%N�w�9rS0�6�\�&\�GE.\�2b�ʝ.�Q�����\�\"7p\��(���(\�AEJ\�\�SE\�5�\r$���D��J�o��\�\�+r�G=w)v \�j\�\�t�B:99������\�E����Β#Dcwz����U\�<8\�\�1\�<�T2&r$��\�ˇirTTQ\�\rɮD�<���\�SЕ�\�&��; <B�c\�ò��NP^GDH��jHvC\�\"�T�`\0(h�\�O<�^`���*h�<{۹��\�\��R����G��<2�q7R\�h��\\)�	쭴���:�YO#5L�\�Is:j�\�8�r�y䅌�\�q+�Â���Z��Z��m#�wr]]\"5� \�ږ\�\�+wD(9�p\�T(x\�s9\'О\�E�C&y5���\��L2J9,`��R%f\�\�\�&�\�a�_%��\0\�.�q\�b$p�h\�\�\\�m���\�Ū!\�\�	2\�\�\�\�iqR�Ԇs�\�HwF\��\�6$��\�~��hJ\�yZ\�S�Pw`sa2rFK�,��Z94B�*\���\�qS5\�vhA0\0I�ٕ\"�\�\�%t�1<�\�9\�&�sW;\�j/�C�\�\�\��\�C�ʲ<�z\�k�P~�\�Ni�Sp\��t�H�~\�]+C\�;+��\�6��\�\�\�!�.\�\�T�\�$#�6�\�D0\�X1P�\�\'���\�怆i����\�2#\�ZSq\�\�@ha�\�MUbi��Puo�\�6��@q\�EMH�s\\>j�*M	�Y�!u4R\�@!\�k8\� �fK$Dh�\\FL\�\��e�\�:7\�pS�r\Z_\�2��\�(\�\r\�(5@]\�\�H\�h�T�\0\�@��?�-�;\�4r�@\�4\�pP���\�IE+�N�d7��J%In�V\�\�9ʖUK�\�S )�P� 54��\�#H�\�DV�4Z\�ќ[T\�G	<Be �q;�h\�r�:\�\�U4�8F\��e���TH�U�RiR��\\{V��֪��X0\�<T�Т�r�\Z�*\n	Ê�-`\�t&��\�(4dv8\��K&�\�\�]\�FHa�Saq�\'r�c����\�҇6�bn�r��G�L2ƞ�&�ʚ�C{�/�ƽ�pX[NÈSx⃚drc�*��ó\�IQW ��\\�\�\Z��|M�\Z:dE\�$i�6�\�\�Ӡ�E\�\�(�\��4�*�\0�\� �\�%���aWK:\����\�\�*/�����Q7K$ǂ.\�$.\�\�\'%-$E\rBi�ʖ��j�wF�\���@\�\�ba�����*_%<�K\�#(\�412R\�\�P\�(�\�\'AI\�M�O�OG\�\�a\�ک;a~\��ag=��\�\�@���ٹ#&����\�T�\�IO�G&J\"\�\�At�Lx�/����ɉ����\�T\�y�4p�\nZW۰�\�*9N7R\�\�+�۰�8�8i0�l>�9b�q��RC�Ӡk�\�\�P;��,]��e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�c\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�\nv~\�^\�=T��B\�{�\�{�\�{�\����S\�F\�P[?p[/p[/p[/p[/p[/p[/p[/p[/p[p[p[p[/p[p[p[p[p[p[p[p[p[p[/p[/p[/p[/p[/p[/p[/p[/p[/p[/pQ\�}�D\�{�\����������������������\�x��\�\�K�@�\�\���C��.Wሏ��#��0��\�?�����R������ҳ���X�7��.4h�N��<K�|\�&�\0\�8�Xf��A\�9�2Q\�\�7\�31�\�Y\�o\�\"\�\�\�Tv&\�7քD�j/0\�7�\rVp]c�)v~�/k3N���퉫`\�\�q�\�ȕ`ê]\�}��\�Op�iL�D���\n\�\�o��ae�5w>\�#_�?�\\�T�\Z\"�!� �dը\�$\\\�6\�r\�tG�\� �X Z\�ꤢٷ{Psiw[e7Q\�?2�\�����9��6��7rP��B\���\�ɂ�{0\r\�3VP|M\�pK/�\�0j� \�\�I=\�S\�ѫ\�vakM!\�9�1�w�E\�1%N�9���4@dA\�*6y\��Q�y�Pp�\�T鸨������\0�\�Q��\�\�F�\�`Qc�ҋJº����KB+K�A��\�SX��F)��\��\�\0,\0\0\0\0\0!1AQaq�� ���0�\�@\��P`p�\�\0\0\0?!�\0�[�^����)`\�\��\��I�O=.\�\�m!\�\�]�d�i*\�\�ZQ1I�!�\�T^\�\�,*{L\�?\�\�SC\�\�5\Z\�sԁ6d���\�\�\08^\�,h\�O=.\�\�\�!g��ˢ��A\�Hsq��\�f�#d\�v �M\r3�\�����:RƮ�\��酰���K^�i��u��d\�NA�\���\�\n,��\Z�PiN�\\b\�tv`@��\"\ZGʠ�b\�\"��:(\�ҍ�\����(]SَZ\\\�(\�ҏRD,�%�����\��#hK��\�_,\�Zd��\�g=�W�4G\n\�%\�\0/h\��^ޔ\nx��Z�e����B\�G\�R�W�A\Z�ͥQ\�\�Р��A><w��f\�o�?��|\��\��C\�\�O\�����\��O�\��/x�?\�O�~ .퐍os0s?�=�ߴu��\���~Y� �2�/3!���B�;�!�	�Ә\�#�\�\�Ʋ�E�ܝ�\0x�|�\�@\��W�\�jy����5\�Z~\�\�\�}\�\�\�u�<>e���oG�\�\�\�v8�\�2N嚷\�쫳0%&�m}a\�=P\�3\�N}`Ġz��.\�\�a9\�.Gn�\0=}��;Hf8e�\0yls\�v�8�ϩ,�\�zd�?�}���R՘4\�l\r\� �x<�Y�\�\rz\�U�}o\�W\�cN\�\�v�\�\�a�r\�t\'q�\�\�\n�\��d���}\�9�h^0z\�l�U\�IY2\�]\�Ɵ/\�^��ӿ�\�~\�ĳ d\�1\��\�=Bᚈ\�\Z��I\��ҿ��\"�\�\�\�(s�Z\"+\�\��K=~:~�\�Yc�\\:V\\��&#����\���u�Kk�ߕP3_1Kf�\�C�;�ιU~\�pp��+\Z��w~ɞ\�\�l��^��⡬Ͼ~!8��O{�z����\0PqT��Ox\�\�~��,\�\�\�\�*�;i�;z\�g)�\�p���S��~LD\�Qw�\����\�\�\�W��Yt\r^p̥��\��_\�8h*�ĨE8/\�2\�yg\�IF\�I�_-N\\�\"��\��\\o��x�II^MK��XջN5UF\\g\����C���C���iU�e��]�ϛ\�\��\���\�\�\�Fc)�?�l��7\r��|	�\�\�\��\�v}c\���#=J�&�\�\�z��=\�+@+ 	�}��=5�v�,}Z~}%��\��f(0T��\0�\�\��\�\�>񿴩�QH7\�j�7�\"�\0X w\�Eä\�Uu\�@\�Q\�)	��\��跢\�\�\�\��O\�\�y;�3-�R�3\�\�\����\�yb�g��\�UE6NW�\�A�(�*`\�h\�A\�\n?�R���\�]\�\�?\�iA�v˽�\�\��\�\�%�m��n\�\�\�t�\�c�0��@t\�\���c�\0|���V=�*KI\�\�5�,vژav\�q@�wb�\�{۔<���z#++E\��u\�kke\�ވl*�\��u\�6\�~7\r\�uxtK\�`�o\�i\rX\��\� D�1S4\�\�\�8:\�\��\�*\Z�\�����\�\�\�,\�\�\0\"X����rCk\�2�v5��C\�X_�~���;��\��ǖş\�\�\�\�,ylY�\�]�W_\�҇�����\�	+\"�YqT��\0�~���\0h�<�,~\'\��\0x��C+,h\'ڟ�Q�K��\��;ku��̔ͥ_��bwl*�%r��B��;_Э�k�|vүz��\�v�\�1\�\�\�$\�;\�\�\�\�WG៣�\�(\���\�\�\�\�\�,\�\�\�\�\�i~�K\��?\�xm\�90)�t�E\']�W\��v�V�=\�K@�\��\0\�Ţ\�\�>Gp�\0\��ʒ ����\�MT�]W\�\���U;��o0�E\��DvZ;Y�\0��C�\r祀k\�V+�rB����\�H\��3%Y\�\��\�M��\��{G�g%Ec\�0�G�\�a\�v\�Ǟ�P?\r�\0Qq��\�\�4Q��!�\�\�gl������>	�G�p7�G|R\��\0_�\�F�\�\�\�۴e�Q�2\�\�\�?Q\�%\"�\�%��=�4\\?U��<r�m\�x+��s��2�2�\�{0w\�\��:*_֌&b���\�\�\�L\�J\�lxhw��$��f*\�j\��\0E��\�/�\�;��p��o\�	�\�\�;3�_��a`�ۣ\�&9�a9\�B\�zs)��S�x\�\"�V��)\\m\�\n\��\�TL�ߡ\�9p�\�`\�X�\�Trͅ��\��+\�KnH=\0\�U�\�\�=�&�>�/�\�?��p\��KY\�\�Y\�/�aE\�\�z�\�,pϻ�tU�N\�ihe����O�Ԕ݂��m���\0c�a|�@u??\�K:\�\�CA��uG\�a�ߒ�$@\�����O�~\"_C\'!�\�\�(�|яi�wWv�E\�G�.\�\'6<���\�2�bЫ\�#\�e�:9��t?\�Q\����n>\'&\�\�K��d\��\���y��?9�*��X\��6�\�\�\�\�Fs��\�\�\�>�X4�\�~��F�#4���\�\�_Xm^C�DM��÷B.�#\�~�ڇ��\�҄QZ�i,�/\�̶ԥyE��z\���*��n\��+J9\�b\����ƐA\�\�b��̚`Q\�\�]� \�Vn\���{�ؼ�uxK�Յ�$}ҏ���;)˴ �F��4�t�L~a\�\�\'\�c�\��Y{V���dI�\'\���\�\�\�;V�s�\�-���\�\��\�\�1U�fM3~\�ܝ\�s\�\�@�\�hˀ\r��r~��t���!��\�\�x��оĵh\"�;\�\�[���>�\�5Gku�Q�܈\�\���9�יb,�zD똁�\�34͡���U�~	s��	d��&\�*>$�\n\�5ZZ\�(�\�q�\�j�W$\�6{\�_�@\�fٴ�U��\�u+p�\�\���$��㼡L�^=#\�Gp��VEv���l\�/\�5\�%\�\� \�h�\�)�+\�،y\r��b��׈\���R\�u*��g\�.ATg{�ѣy�ٸ\���^�m�v�\�I\�dp�\�����\�f>�Ѕ�@�o1�YO�_XV3^\�\�$\�c`\�uk��^�\�\�d\��\�ዸ>���p\�|�%\�<�\�\�ޥ\�V\�ḵ�\�(�	�\���\0���0Y7�\�6�e�\�N\�\�{G\0|*n�V8�G\0K½�\�\�e>!=aX\�{k�ei�@� �\�\\\'k��z8�����?��\np|L\�\�-�x�}H����d��&\�+ �xqLH��q\��\0�Y�&+\�2\�Yz�\Z�%��\�\�\"\�\�m\�\���!�b9�\�`�+*f����Z ?\�\�۱�\0�r�\�{yϺ~Si��\�\"�}\�q-k\�\�5?\�\�ZԹvEZe�S�\r�*��\0�&\�젙>�¨\�,�f\Z+�4�\�J\��_�]\�L\�\�\�ȋ��s\�`?�	\�@Q�\�\��\0\�=��%�����TJ�\��\'�C.U*�Ի�_�\�K=\�\�\�Q߈l�\���G��E�1�tk��\�Q(\�.��\�\�+�\�X\�y�&n\�\�\�q\0c��2\�`\\��5�B@�WB�`J\�<���C��oC\�1\r]a�7�\�=J�\�i��\n\�X\�\��*R�A�6qQ�52\�����s\�\�Y\n9�O���.�t�3E�Mv�\�3\�\�6\�\���:\�\��۲�\"�\�\�c�)\�`A\�\rG�IO\�5q\�J�1�[���s\�,;oh�[*\�\��j�\���M�\0�m�ҩ�F2�� D\r7��;tM�ox\�6��\�pE�)\�Q�q�J䗬G��UG\�\�\�f+\�#R�ts\�)uZ\�\\ܦ\�.\"iR�}\�i;��_\�\�\�7�\�b>�Z,9z�W{�\�\�09�\�K\�N�vG�\�9SR��\���\\v����4^m�\�G�\�۷K���O�0\�	�7(�1S)*�\�D=�z\�L���\'��ЈM5\�f:�d.�/C.\�e\�ˋ�\�A��\Z�#\�^L�\�u-��\�\�4H<@�U\�pl�4L@e\�V\�\�9M�\��(>����(�\�\�;\�\�/�ٗBx�.\\��g)�K�\�`\n�\"[�/\rr\�&\n�X��EH���D�`\�O\�_�\��gQ(\�Q\�\�\�,Je��\�:\"\�\�4M�x�R�Pk�df�*~�mw^�6�mb?pܪ\�\rVL��_7g�\�йr\�˗.\\�r\����8D\�t\�Mˋ��\�\�qQ@��N@f邛\�Ka^\r��\�\�;#!\�(�]\����;\�}.\\�r\�˖K%˗/�o=�����\�B�#/4w(]�\Z\�\�|BU\�\�³�Hl\�܈1�f�`g\�\�h�\�&�\�1�d!�	P\���oi\�,S\���%M\�w���\0֞\��g��?�\'��</�\�|\�\�x�3\���[֍o�\�\�f4\�Jw\�R\\��,)��`6�Z���`08&\rKf�i��\�ǌVb*�jx�\�_K\�U�`\\�~e\���w�x\���a\��\�\�`�\�\�1�K���f\����\�\���q���8M\�\�A\�fk\��Aq\�`;\��	H��*\�Kުb/3j*C�	�%u\'\'I�\�\Z�ڙ}��\�\�\�\�d��e���%^�L\�l�\��\0\�Ây7*\�\�\\p\�K��\�z�H�\�ga�\'��?�\'�\�V!G��H\�\�Vg�&�����_5T\������g�X\�\�ص\�S#�әu@\�4�%�!\����\��\0\�S�\0sȞd�3\�\�=i\�Oi��\'0nGM�\�/�\�V�/r���Lf��\�p�Xv\�U\�Q��[\�W|��b\�\�+�J+\�i��$5�\�\�(��\�d^��w,zs,�P\���3�\�\�i�\�	{�\�\n\�၁\�\n7V����\Z�O���<\�u��1\�\�19\�Ő��\�K\�\�%O\�_\�\�߼䞓�|�;K�Ś��/\�/�K�����\�\�,\�ү�\�G�l�U�e��\�)i%)\�\�c\���O\'\�\0\�=\�5v\��e�\��\�\�\�e3�\�7\�+�\�_d�\�C	iP�\�\0�z�v\�-ܗs[����\�:��)�\�eC���J}\��\�Y�:\��d�y`���إ�\".�I\�&1�\�P\�A\r��)\�A\�\��gf}\�ξ�\�U\�f�}\0-\���%\�X2e\�5Ŧ4�aWT<��h�*\�Xy\�\�௜Z\�3+�P��#B\�\�\Z\�Eu^nZƋ<\�(�o\�mK�Y�@֟�\'\"^2�\�d\rV��%\�l\�U	L\��\0�T�Z>.:�W�h���(]�v�2\�f\�i�kRч7��\rm+��w̤\�O?iN\�TQ͞ڍ\�����\���\0ȷ��yO,ŨGA�q�qQ��O�#fq\�X\�[��d(*hX\�cӅ\�\rܨ\�B��\Z��!\�R�\�A\��A�;ʘ%���撧{�2���\n�\�$앉O�\�\�̚\�m\n\r!Xw���p���2\�zJ\�{	\�(�e^��Ĭ�\���OGq)\�\�yA�\�1�2[\�Z_|\�v	�7��Z+\�[Zx�\�q¦�\��`\�rg�~~%/N<G�1�Gn�R\�e}\�5���r\�/4	\�\�\'��^jHX-�\�JP�\�~P��(UY�\�G̽0�\�.��\�*|��Q)\� ۖv��R�L2�&[��r��\�,\r����^^��j�j����\Z��5�\��\����\�)?�\�Y\�{�\��	ѦS\�;\�Z�1!\�2\�T�p�\���\�B؆Q�fnmm�\� =.-.��+x� ,͈V�~\�;�Ćf\�(\�|��l�\�!��\��\�c���\�Q\\�o\�\�Y\\�S\�yT�\��%\�ތ+��c�#\�&7}J�#ݬ&0_�]��C\�#\��D��}-� �\�\���L\�.cM��C\�i\�\�\�Z��u�5\r�\n�Q\�n�w\�b\�s�`@��_.D�sL�X;K����W�}>�ق̭h\�ʸN\�\�:/�!�-x&B��@\�9�y\�\�3���K\�\\�\�\�\0J�<A�\�\���c3\�\�:�>L4´?�5\0C��TH�\�zZys\�$p�	���x�0i\�\�A\�,�e)\�\�S\�\�s���ӡ�1.L/�QͲ\�r\�J�\�`/\�oYx�\�@��i\r���\"\���8�<��P<�ać�Ǌ�)�Bp�;\��\�\�#m|5(��e\�yB�n>��N&\�\�ݢ��\��EIQu\��\�ˣt\�m�@��v!\�P�u)T3�i\���\�F��{�>jlC\�\0�>\�\���+��7و?�7Kh�3 	��TrU]���\��\�º��l|ŝ\Z.nXvy��*\'0�K�\�\�\�M)<w��\\ÚfQ)�����wCJ<bY\�%7\\H\� \n�W?��~(F�\�c\�ظ�OVqL1;B\�\�6\n��c��R�\�y\�;=�y�H\Z�b�\�O\�\�\����\�Ӵ���yzFV\���ƙS�\���\��a#\�G\�>Rͪóњls�w��\�\Z�E\�\�=�\��9=�㹖Ƞ\�Kxe-��Y�\���\0s\�{\n��n\���m�\�8�\�{���lJG�X\�rW�.�7g��y �x�\0ڟ�Q_84%w¾� 0}g�\�M\�R\�8{D�}atC�\�50\��NGM\Z�n\�*.gP\�\�+\�^�{NHm\�fs\�nr$�f\�\n�Wgj������	\�z+\n �~��a\n��5\�62��v�����n�0y�\�\\�\"\�F�7�\�ۣЊ��\�ń\�e�\�. ��r��>��\�c�CQv�1�0���C���)\��##�o�QjB\'\�b�~lH�${L��\�Tz�=fQ]�\�%\�\np�\��j\�2\�s\�54 h\�\�_&\�?K2\�Ltf\0\��\�:��n�Z6��;;��\�\�\"�\��Di�?=#~�\�hM%\r0��\�vJy~&��\�m�o��L6E5aޢ�w3��[�\0�erz�\�\�0�\�˯�vNKa�>\�\�\�\�d�\�Ö,a�\�9=a\�g3%�bfT;#�� \�w�\�y�D\�\�d(\�u.8�\07\�a��\��!���)�k\�e�3v*`\�\��\�\\�B��PiH�\0Uk����:t�\0/buć�\�#�ŏ\��]\�%�OH��G\"\r���\�\n#\�\���\'\�v\�;\�\rB9�F��j勠	�G\�\�(\��(\��7\�m\�R�\"�\0@��x\�A�\0D�i�\�k��W\�C��ɲ>\�p�;��\�=	e]ܥWx�)�\� K�\�\�6-\�E�F��\0�%�q�Ļ\�.\�R�qr�Z�/t����ٕQ/�+sP\�0�� d�>#^�Ԫ���8��;\�\�!�S*�[\�N)\�scK�\�M�nn)dYG{�2\�\�\�q�x\��w��E\�\�r��D�\�:�\�4{�z0\�y�\�\�n!v3\0N3�\�W�g5SA\\\�\n�\�n\�\�\'����\��dU�>���:�˯LJ\rV��M�;�\�	r�\��\� ��n%�/�uR|B.Vj�\0F�)+\�\np��@?�[��\�r\�^fI�J\�\�ͅ\�P\�\��/j�z�S\�Yɖ�\��`Sp\�:\r.�;M\�!Hjn@\ra�P�퍛��w�%q��g\n0F^*\�\�VѢ>�\nM\�\n�F\�\0!�¡�%\��N�s)�=*Tc+��(�!�Mkq\�\�[b\�B9l;�\�xpJ�����y��J�S{OY�LkurI�\�ڞmj>\'r�H=`��#��Fh\"ve.p2��\���\�fe	mn,�S\��%�h\�7�#�\��\�\�\�҅���;|\�\��\�y�u+Y&kDG2\�0*X�=��$\����Jn�Z\�0�~O\�;eN\�k�v�\n[A\�ɸ�\�?\�k�xG\r\���M�\�B�8Ļ�\�\Z\�#\�a\�6�\ZG@<�5�h�)`AF�̧,zj-1B\�^e�g^H�2�\�3������4_�\�^L\�\�3\�s.}���\�\�\�XA��G\��=!V�ñ����\�9<JL/��;�۴\��\n9n^C�[��\�\�\ZK����UcPm�(\�o,e8�e|2�C��\��rXh�˪G\�~O@\�DW�$O��Zvv�K\�\�+5��\�?��1\�z\�q�7ħ���}n_���\�i��k�\���alč&\�(�g�\�0��K�\\b\��nk\�J��d��C�h�w�QDx����\�ۮ\�2�#��0F�b���݋�\�;%r�f�\������pe+|Ex1ᘫ�\�\�ǘ\�\�,\'o��L��\nh{�ʂ\"�YLE�:�\�}�\�b/�B0\�^J�F\�\�X�\��3t=\�;Ey�\�BUBmi��Epa;��C�\�S�@\�֦��!i��*\�R���ާl\�tcP\�]�+,۠-��� ���r|���\�/z\�\���\�_t³a��26�\�\���B��J�똅��\�l:�\��X4�\�\�\�y\�-\�|�\�e��4\�Ƃ\'�\�hT���\�\"�\�6�f��m�R�W�Whb\�\n���\�%6������=\rY\�8�BV׼\�%\0v{\�\�\���\0%cG���\�v�|�R/\�iP���K1��b��$9�K<ʽtP~�A���\�;�\�\���|!Sdu��\�o6\�}V�E\�\�\�͙\�\�K���[�,�!++1\Za؋�k�\�`UG���ϲ��d���\�OF!�2��\"Z��-\�\Z�B>\�\�ܶ�;�o/IJ�~b�&oPc�)�/8�K�\�J`9���c\�\�7܏c ���?��i��N[���\�5\��\�0D��~!�TB6T\��B٢J\�\�OR(�f-.#�}@��L\�F\0I�I�nD�\�\"ԦEJ\�}�\��@�O՗P\�\�=fnV\�\�~\�-\nez\"X\�O�V���̬\�^��\��\�h?0i�\�1�t٦{\r����O:�c��nd|C\�\�\�Ɂ{�\����\�u\�b{��\Z\�{0E�\�\��Sp��\�)[.!w�\��0v�yҮ\�\��\0\�X\"`��J��;\��\����c��\��\"�ts��%\"\�s\�R7GsR\�|\�R_)p̷ZCP��1��\�(	\�\�nIS\�\rGm(!\�t�����u\�(�Kɜ&�=\��衴�LE�\�F��L3��\�}�ߟ�+@>�Q��&�\�\�\�H\�\�Qm˼c!|ʘ}`\n\�҈�2\�����<\�[ن��\ZI\��<\0���\�򃙉��	�f�\�Xn\n�JS�1M�C��|#\�t\�C\� T`�r�M\�^QN-�2�Hwn..\�GA��ys.���h>!��P�H+pq1\�Й�\�\0�\�)\�T�n=b\�k\�@2-{&�\0�\��\�Y#m6e\�E\����\�\�f+ݕ���� �Lv#��u\�׫s�\�\n*����5s��\���iXQ\��Y\�j,\"n;�\�l�,��\�e���D�_r��	\�;�5�:Ts8t��pD\�r��H��A���\�\�ecu^IH\�\Z��=���K>���UXM��O�\��\�^pz���K/��k\�ɨ\�\"�s2�GW*\"��Q˚W\�.�a��\�۱�\�E�\�C��\";�dL�1\�_\��q9�%\�NѢ�&0�B\�\�De\�SOL~�\�\n]<B�!�\�cW	�R\��I\��0͇b&�|Ě}���\�flW\�0�N\�\�\�_yy�Kl\�ir\�~�6D<�mX��S\��l2��\�u1-.��\�C���\�2���K�^&\��O8�-T�����\�K��Y��y}f\\��rz\\S�`�F��v\\1\���q�\"�\�\\�\�\'gd��\�e�\��/K\�\�\�t!\�~����YZb\�&��ݸ�v�s,U\"��XT�m\�̴40� \�be\��qq-\"y�\�O�7�\ZŇ1w��C\�q\r��\�Mp|�9]�\0\�_�|b\�O��q�beO����\r�k�ga{ �\�sOhJ�T���V�\��\�\��\rB���\�?M�Xf`\���C\�(@������qQ�\�f�<�nU\�	\0˰��G�\�_ۘ\��\0\�\��\��\�\���9�mU�n\Z�0~\�_��ү\�p��\��\�Oڥ\��&��Ҋ��g1|��\r5O\�@\�;?d�_i?hO\�\'wD?�/��\�0\�\�E\��\"_����dq��[p[~g*Z�\�\��\�\�g\�g\�b\���\�п��z�>�~�y�\�~�\0����\�\��\0y�\�~���\�Z�[���KN\�6�\�~XZ���%�i��3��bY\�\�4�K0\�\�1=\�~\�\�<�-������\�\�|�\�S\��C��eKv-�\�\�)\���<\�\���\0O3\��<\���qUя\�?�\Z��\0\�x�)�\�n�W�\�\���>?G��?\�?O�C��\���\�?o�@��=e,\��\�r�?n`\\o3\n�ۙ#�zŁR�)H�{�cXxˎz\\�A\�;�\�\\k3e3z�-���Oy\�QIn�E]˚*P��\�*\�\�{��TpbZ�K\�0\�h�(�*�B��W��-e�\r>��f\��Za��S�\��\'4E�tf�\n]F��g\�0F؞e	\��y\�{�����\�^\"4t\\�l�50\�{M\"��m\�n_\nϠ\�\�\�i�\�\�n_\��Q\��A~��p\�I�[_X�S�&�}%��lcԗ\��\0��q\�4��8;J	�ȅ\�vŅ��-5�����q��L\�<ĕR�/\�Z�tV\�y\�.�<Lcg�,Q�H�j,\�\�F{�bVY,%�s\�\�\�\n�x�S�@�7�\� �\0+���3���(W�\�a\n;��(�L\\\�r\�Pt\�[o�i[\�?�n �j�e<\�s3\�)\�S5�\�\�\�7.^��5\\N7-.�,2K��A\��)q^q\�f��/�9i�\�)x��(X\�Xw&\�\�\��g.������jb�\�-f\��h�\�K+Q\�]\��\�`��?ɤ\�q�\�~\�#n\'@\�=\�_�7�\�F_���H^�7\�e<K	虖\�\�G\�\�з�TVZB��f[(�,�TM\�5R\�uQ���c���mϊ.\�E�Wl��\��\�\�\��\�+\�\�\�Э�s\\�/1f^�-\�J7\�ߥ�\r\�u*��j(9%ޥ\�3�\"\�EJ�N\����8j8^�Q%\�-]7.��m\"F���\��0u!\�VP\���+�ʞ�唕�VJj}\�w���$D�X\�V54\�\�,��#:�\�fp��!)F\�y�\�M���@4c��o��h�я�\�haG�XV=��]\�99�r���39�U�xy&EM�\�\�oĬ\�ˡ��\�\�\�L\��k)l�?\�\���\0�\���BU\�@\Z1N\"a&�M�31*w*\�)\�	R�a*:\������ƻ\�JT\�D~�\�7�3ti\�z��	w\�K<td�����\���\0��n_0\\\�?O3�\\;���׫䂌��TA��\�`��<Qs	4\�)b��)�X\�]\�Lr�opm�٩c5*���]\�\Z�\��\0��~�ݧĮ���M:\�`\�5\\̃\��\�*ȷU\nO\�^�Gdƾ_\�\r]�&��Vk1R`�!\�\�g�3�\�\�f!)l\�/��(8\�{�\0\����G,L#�v8\"k\�U�\�\��&\�\�/�1\�/�WW*��a��\�!l\�!�\�X/\�!�߂0/�Y��80��527(4\�V��?\�F\�\�\�=�\0ţ\�\�pW\�l��\�\�rn=q4�*WF���!l֟��}|C!\�C]8N^���\�E\��\��\�\�{M<M\'lCY�Y��MM\�Y\�Q�1@r$�p�#�\�7\�U{\Z�-q\�`Q\�\�\'l&\���\nC\�\�ELׇ�cY�C�=�E�\�^�\�j�_0=�ݸBǹ�����K�us&\�\�Զ��B\�{B\�\�*\��|\�9�}cq\�PM\�`\�X\�@\�Fԑ�#\�X�t9%y�\�\�ќ���\�ј\�\Z�3\�n\\[\��\��0+�\�:��\�GPf-X��1Ikqeo`7���6km�\��H�\�b-x���\�OH�k,�\�ؿ\�-\0h\�\r��|Lw(��\��\�\rG\�Ki�F�\�|\�.ە\�\�(u��W�N`\�\�\�BD�\�b�M��2ب,g0LVe*��\�f�\�r�{ \Z\n�M}m�Z� �!M\�Mo\���Fџ��-\�ȍ�UQ ��Ƌ \�VD����awz�s���)�\�:�\�A\�\�\�Z�G7\�Y�T,\Z{Ɲ�\�RZs\�\�cso\���Ѫ-u��%ATnܫ\�\r\�U<G�P�Rf�����g�YAϻ�*$\�#�\�\�\�P�l�\�^*\�\�i��,\�|�d�X\�l\�YL�\�\�+_K�C�g/�\�7�Y�1%*]�!�U*Cd1\�-\�1����\�\��C�\�,9�m8Lw�%@\�+\�16\�i���?2\���qm��\�vS��M\�J(��5�P\�6���\�i\�p\�P�qPM\�~`xT_��\� Wx��\�\�\�1y\�\�@���\0MLt�iR\�\���f\�RV\�$AOcP4Q�p�\��\�d5�N\�\Z![Cߘ��pgb\�Kz�\�\�OGS�\�y~BS�[�\�\����L S�*ܠ�\�z�IWx�W+he��ngc\�dVpFk9�?�[*#���1K\�Qu\�.o�mp(\�} �n�\0P�\�\�\�^�\�*5��0E\r$�r_�:�S�%�\�JT�\�\�+��3�\�\�\�z���\�\�4A�\�F��/U��\0\��)4�ja��#�X�\�\�\���w�C\���[���3\�<\�|\�����Ǣz\'ng�{��z�\�yB\�\�F[/ܗ毷�s@�\�\�\�\�\�\�t\\�\��\�\��i\��/n&\��=[~���\�+�{Ls�ͯh����ī�\��\�W�<S\"�~I��g\\��`��\�j4\�\�k_uFa\�_Od�I�x��0\�+�@�\�t�\��v\�\�6 a/!�3�iJP\��\�e�ʟ\���\�y�[�����)\�U�\�=\�\�ԁ\����&jff7\�`���\�{����쐈T�ų2\�̯Q\�%89w�`9�\��f�\����\�1�MM�ņ){�w�\�C�}����;����һ\�_y~���\��\�;e����>\�\��\����}\Z\�O��m�\�Z�AOįh��\�\�\�\�Ys\���Q�	V�,\�\�<�̷�wp����%\0���\�c��\'b ]^\�\�l���X>0�\�7ؿX\�0\�\�[�;��iW*\�\�X��\�\�R���\�S�Ϝ.M��Fj��$�\'܀���wЈؤ*7��M�2\�Iea\�h\'ygyJ\�>)\�S\�~\�Ҋ-`�\�-\�a�\�\�-\�\"n�5&��tt�\��u3^�b=\r=]7z\�m\�E\�R��AT[c��D\��P\ZX\��UD�5�����gr�کf~Dp ��}\�\\�w��(=��-��IG��rL.-���D�\�j\"JT^v��\�sS&�ު>\�Qf^?��#ۦ����&{G���c��=\�zZL\�wM�c:\�8��\�F�Y\�:�3~�զ�k\�I�AL����\\\Z99�\\*\�\�\�˂��jg����\��\0.�|A|\�\�x�U6\�\�/!�[0\�\�m��\�=\�\�\�a��\�x�J����|Jj\�\�_\�|�Ue\�ɗ=����aM:\�2\��釄ǯJ\��Qp*\�\�a�bbs5*Ӊ��\0>�Juҡ\��n��W1�R5\�S�?X\��Bv~\�%+��~�\�2��A\��b�\�5,\�j�8�%\r\�\�\\���(\�#��۫��\�db\�}\�f��\�vJ\�a5\�Q^c\\\��X�Z\�\�N\��L͕\�\�4m\�^�\�.;	�5�\�,�\�{C\�W�51G	G|\�5�\�+Z\�\�M\�qJ\�<�a�E��\�k�\�c#�r�X�\�y�Sー��\�>��\0\�ƺ7\�\�f�gJ˨�..�m�\�\�w��Aϰ#d�摪��bM�\�\�\�c�Xn\�x���[�]Ȗ\�GGg�Ӕ/�3�>-J��������ښA�T\Zhx�\�>e*8␺P�Y�cWGyf����ˆN#kΓ:�\�V�Z<ʎ\�\0\��C�\�\�\�$ \�>e\�\��Q#�-ķ��3\��\��\�}Ҙ\�=Z�:g\�`P>\�r��FU���!T\�(��\�E�K�\�YX��\��\�쉼\�\�vv��&��tt/if�aT*\�Z�\0l����D��t{K����,��\�\�9�_<�)T+(����LjF_h\Zd�����u�ER�!\��򣤗\�&��\�����\�@K<\�pЕ\�\�_�2�<\��ũU�TYx\�\�hh��\�\�0߰8�W�\0\'���L\�2\�xO1��\�y\����\�j<>��\�e�\�\�\�}�W����\�\�P\�rbY]���\0A���\�16�x�\r�F\0-=\�k����\�7�>G�\�4�v\�\0�\'�؏���q��aL<E��U�zM����lv��p�N�\r�\�s\����\0\�ݡA��R\�\�!q�ܠ�(#�{\�\r\��\�cO��6�� N=�ဗW�W-S\�[\��\�\n��b;��[y匕mw3\�uI~l���N�ޠ]\�Xp\"�`b\��\0C��\rK;\�0m�p��*)��9�f\�X�	0�C-��\�h�\�\nVؠ\�Ԡ�J7mj\��\�y��o\Z>�[|Ɓ��T)���\�]Y�G/�K�.\�7�\�\��\�\�#R\�\�U��J[A�`GP\�0\�Q�(�q_�h{\�bt;&ERE/�j�p�\08b.\�^k��)\�p)�\�Y&D�\�\0�\��\���T�]L<�K����V\�FV�T��\�h_�\n<̐Y\�/C41�\0��\�\�\�P�W\�sy�m������\n�ܳ\�\�^�y�aE{bj�dj�P���s-K�\Z�p#�Z;���q^�\�Q]\�`\0�\0�?\����\�fCcS�D\�\�x9�\�\��EMN\� @��\�w��IP37N?�\�pnTلA\�0�Z�x��\�Z�\�\�\���_��!\�\�\�wl9֞e\ZS\�\�7�� ��\�;c�\�Wf\�2\�Vi��\�\\\�3/R*ի�p~�A����ǙW��\��\�Bն�\��\'ena\n�Oh9U\�Kѹn9�7C���g8�n�\�����l�+���r\�$��\\i\�\�Q\��j_7Co�\0R\�\��\0�i�A\�qf0!Na�\�z\��\0&��Ip�<\�u\�\�\�\�K��b��\�]	_�C�\�5���L�S����\�^��Jc�(�U�dF1���\�\r�ؾ\�R\�h~\�ִ\�.c\�\��\�с\�L\'t\�4/\�\"է\��\�ݠ\n\�\�\�)n�{�t���\�EMKf�H7\�\�Rp�\�E\�D\r	ذ\�$,��\r%n����=O��\�^H\�\�t`��Ѽ8IX���W\�T1\�\��T\�؜\nT�\��g^��=~!�/�Am\�$1m�J\�1\�FK\'2dzce\��&\�\�0�t����\0R���\�0�\��\�&*\��B��\�8�Ii7}F��\�t͆eP�\�㴡&l�Z�L7��;4b(U8�� 4��\�\"��(�\�\"�s�ʠbax�\��\��}ѿ\�L�}�u,���\��A\��\�?ɮ�\"�����w8�B�1_D\�\Z�x��E\��\�x��\0J\�O\�Y\�\���\�\�n\�\��\���*\0�q̾$�z\\�_Y\�>��\�)���\�̠�q\�4&P��\� \�\�\�^=�Rm�\�o\�\�3�\�Q\ZK���\�*HVGR��ӳ�\�X��*\rS�v\�\�w{��\��\�\�\�()����bw0��\�_�Y�S%u]�9���D\�\��W�\�bd��\��3%l�z�E�2��\�Q\'(ˍ\�W����*\�\�m3|\�{\�\�_닗G�\0p) ��sX\�\����\0�b\�\�evP\�l�p.`\�8��c}z����;֐���\�t�։Az��\0U]h|EiG�bB\�\�S	֡\\\�\�-7\r#&#삜�),%�\�K\�d*ˈA\�͐\�+�\�<�K��3۴[	���6�J�J��s,��h�\�\�L��HƷG�|*\�.QB\�\�#DJ�\�T�ͣ\�+�D���l�32�3\n�\�u\�ۋF�u���\�\�\��\�.j\�\�OO���\�*-)\�\�^`jnAM�F&z\�Ȑ�I\�~Ɏ�4\�*\�y�Y�����}e>{�;\�x�s�\�n;ږY�)fV�\����\�\�(U]�\�}\'�)K���rX8\�x�ϳO�+h\�	�w\�QII�\�0\�\�`]�r\�Uw\�d�]S��\0\�$�\'/=�}\�^��)�n�e-\��!3U�\�\�<��\�\�\�U*����]s\�Q\nP\�U�\�h�\�\rr�%P(\\Vx��d��\�\�\����\�m����ی_?�\\\�\��\034�WX�Cm��2\��af�}<\��;�h\�\�@d�<�,��\�_,\�o{>\��\�\r\��\�[≙�i+˖%\�Qݬ\�n\�7�\�c�\�n���6\�MvM\�D\�ݲ|�AB^�\�N9�\�\���iZ\�\n<�	u =\'i�;\�\�m�!�Ub\�Ӂ���L���\�JR�累�P\"=�ND\�Qї�I\�j�Hv\�ɘ\�\�l%\n�\�2�8׋����n	�]?\�\�\�G.\�\�b/Q��\�{Tqq\Z�B�\0\�=\�լ�gE\�癌\�0ı[��Z\�\�\�_��!{��\�\�6\�\"�ƿ3q�_\�!\�T4KUS�P&�>%=�\���m���n\�a\�u\�\\\�ݮ7�?�Ò�\�Wwi�\n�@S�\�`�Ja�i+vV�z#]�vxe\rq�(3\�\\f{L\�\�mZ�+���\������\�\�\'��\0b:���\Zm\�\���`��\0^�~_�YO\�������\���g\��R\�\"m���Ծ��0��\�j1\�p��\�bX�[QWh\�b\"\�~e�n\'��-f �\�j�d1��\�P+\�E�O\�(��E_�\�_�|߈�?�V�A��E\�\�\�TD\�\�\\ \r_\�\\�5J\�\ZO\�\�z��w���	6?��\�\�W�\��\0�\"�|\�!_(\��\�\�1\�ҧ/߬5\��y�\����S\�(\�̚��=\�a\�<��)M\���f�}\�\�\�&�\���\�>��\��&\�̥\���&�y�K�}���\0w�U�?���_h1\�!��-\�(t\�\�c7\�HuՍ���;�\���\�\�;�چ�D���\0����a�\�ê�Q�Y�\\m�6%@0Tt\�9\�vdsAp^\�w�E�\n�&ON�\�\"#L\�\�\"\�1.\�V\�n6bXF� L\���\'	y�K�\�qũ\�]*\�mD�\�*+\�\�b!4\�0�*̢�-\�T�^\��0L�\�\Z�.�@\��\�i\�ϗ\�!�MK\����r�q{E6�\�\�71�Ÿ�tw�8*\�\��-\�\�	̪t�\�0a\��-F%�Sȩ^�#}0���\�ɮ�.8�;B��p�M%:�S��ݱ\�TTn����H�4]�`��PE\�Z\�\�O+\�W�\��\�2cI�f/�|��\�B��\"ZR\��\\�=B\�u]̭Žޮ	5\�\�\�)\ZfJS�\Zt\�3\�\Z�\�\\O\�V\�,�5P��#\�T�.&\�ۮ_37S\�8��2����\����Ӕk�\�GKR�GE�TS\0\�\�Y,L\�2!sgp\�\r�A\�\�2���eWP�Y֖!�e\�ؾ�أ+F�R�/��\�f62�o�A�������j��-%��\�\�\�]j�\�܆��)i�\�9<ùh\��\�\�հ�\�(�zB�2d��>�\�r\�\�\�ь�\�DM�̸4v�1�\�\�\�U@�{G/�\�<)�T@��R\�Fe�\�׈�i�b1\�\Z�`�7c�B\��Ѓ�rP;0��a<Dq���SL\�؍�K\�J\��qXY�tc[��^ ��ƹ\�̹�|�j���w\�\�g��\��l�\�\�\�\�$U7c\�r�Jf��{\�\�PB\�C�[����ҬKK��\�sߢ\��\��\"͡,&�MÓ�&\�E^\�[4\�+ݗ��\�X\�$]�tP%�K&LubdJ�1>`К�W��g�\��eJDE\Z\�}\�\�B\�a\�\Zb�}\�\�\�C)̢5]�d\�$\�\��\�r����ס\�p$Jq��Y�u\����\����jk\�\Z\�R�gP\�j\�\�\�%\�\�\�X�r�R�\�cR�)�Q�������I\��\�Z��\�g\�y�l��\�m�qW(�:���H��\�Fbd�\�\�NS �\�b\\�\�	\�y!�\Z\\H\�$\��\��H�w����\�EEP��\� �X�\�W�\�a�9�h\�=\�\�I�X�Z\�ﰛ\��\����A��\�3�ñ�X���7�\�d\�	W��(��(\���5&���E�\0xA�\�\�Z\�\��\�9�b\\Q+�#E�\�\ZjT\�@�Y���5\n��\�FT\�/ݔiKԱ\�µ=��\�[/�\� L�ZL�!3\rA�)}3�1.\�\���\�U\r\�;\�\0^�U	J�TD:���E�\\Lp�\�\�\�c\�\�<\�l����]\�@%̣�sQ��g�0k꿤\�\�+sF�3�\��z�b\Z\�\�\�H�\'I�֜�cm;ʎ��]F�\Z\�Ĩ��\�:��Ct\'{F}w3f\\\�\�472Qv(e\�\�E\�\�y��\�qc\�\�L\�d\�,L!\�\�Ӄ\�)ԦB\�2/h���p\�b�Y�\rz\r��+���\��0jb�Pt王.\��\�+/A\�E�>��\0���\�[�\0ԶH�Q;�E��Q\�\�a��y�.\"�\�˲0�Ae���)X�6(i�\�7�r�3�zd���\�sJ�%�\�+=-i\Z\�=9��I�\��I�<0|\�^:7q���јZ��\rfXEL\�fw�Z��n1�Rh%�\�8�2\�Ň�A�,H\�х�\�G�\'9��fG�\�\��\�\�\�@G\�fb4�\�ŖNa8J�A�\�%Y�q���b=\�P	I�ќt�3\\zs\�ӡ�V(�E�f\�W\�o�\�\Z®��EMB\�����s�P\��+W�GR\�-r\�\�\\�\07�r�z���\�F(e\�*\'��f�e�\�\�Dў4n�y�\�yj?��\�O�Ȱ\�z��aW����u<�*�3(=����N�2�v����`>3��:\r�\�HC_?HM@\�%}\Z\�\�\�-l�d�\0��C3�8�@K\��d�\�f.\��L*8Nf.a�\�_äE�q\ni����\�Y�`��\�e0=���\�O�\���z6(0P\�(\�\�\�b\Z̩Px�\�}!j�b�uNq\�	\�eU�\�s�\�z�\�q\�\�0}	\��3sku\�l�=D#)�Ĩrb\��\��W\�r枆\�\�:�\���@���0Y�R!�$R�j���m+\0�j�\�l��!\�\�W2�D͍�-{\�\�\r\�\��(h|��/E0�\��\0�\�Q����\�C=RV%E0LZ~`jV\0\�\�ꨖY�avf�	�E�&㎕	2d�\�\�?,\Z�\�+ܔ����ߘ\n5;(���\�\�bV�}!\�㎗�*!\n���1�\r��\�@\�m5u#ԕ8M&��Ki1	P\�\�l�\� �\0\��\��\0� \��L�\�	K���s�tXP. �L�h�v��\�X\�D\�F16�k��3w\�\rs�ݢ&`�B\�\0�E���g���	�\���J�*Tz.��R��k��|P�\�d~%p�\��\�\0fffҢ�!�ɤ���ʮ�7��\��\�Q1�:(���g>��G}\�a\�R2.[��\0$\�\�\\!�)t\�\�\�\�\��\�`�\�(�\�T\�\�J�HŶ1K���r�b�>�\�<0(\�\�\Z\�Rɂ.7�1\�J�k\���\� $@��s\���\�X���!�nU\��\0�1xPB-/kI�\��\��zV\�Db\\��3\�+\�T�@\�\r\����q\�\�ý\�i5!\�\��\�M:.\�\�>q����\�X1e����ɮψIT\�	j,\�\�t\�\�%!x\\���&\��\�M�q\�\�S;A��t\Z�4ș�,N\�\\�3\0��&�\nA�]�-t\�NIF�\��Nb����f��	G\�c*Tۮf\'��\�\�N\�D\�@������!�u�\�IfX�\\\rLS)V���\�6�!F{%�r��S\�\0\�#1\��A��g�\�\�h̽\����\��w���\�0\�*Cnz@\���ȁ9�� \�zUDə�\�\�˗��Ԧ8�s*�8��\�6\0L\�WQ��=]í���.��\�\0�kO�3�\�\�3A^r�5���g�%��\�,!�\�7\�Vq\�{\�}Yl�_|\�:o�����fe�⸦\r\�1ST\"�W.\�V.e���G(�^,�C+wa�S�f�_\�yf`<��\�r*3����\�#.,\�\�\�[6\���\�Z�g\�n�]0\�,\�M\��̧�-�Q*Y�G7y��\�h第�Ј0qU\�XvT�+S=��\"$a	�\�\�\Z\"Y��z\�I\�Γ*��\�#\�O:\�.�s\�\n�\�$����\n`�0d:X\"�C`G$qs\�\���;\�\�L��\�\�Ͼ˜��\�>���e�G=\�eC�\0\�Ӓ,�\��\�Y\�����\�\n y\\\r��uVM\�\�N\�1�\Z\"<\�/\'0\�D2�~�w��*Tӡa]U�\�\�4\�E�\��(��9\r\�\�\�@\��\�?36(�KS�C��\�8Ԡ�ߋ`��Z�o�y��u]\��.\"Կ+1P	�2%\�o�\�}�4�~&����?��]&�k�\���\�Q�\Z��oq\�s�J�#2q��E\�t\�R\�X��:zK�\�\�\�̣̍\�$�x$sOo8�z\���\�\�L\�ҦnnAb\�*��/2\��\'y�b=J�q�\�S�h�̈,T5�f\�9��\\�0\�-���TR\�r�\��P�\�\�tbY[n�\�}\ZT���i�Ų�-d[\�kr��\0�v^\�\n�x�sz%e�E\�}��x�[��=:�ۮb�.\�+�\�9��+�h\�1�sQ�X͠��\�\rJ\�x��T����h�����9�]��[C��\�\\����f\n\�\�\�H�6\����$%CI\���&n\"\�\0�\�\�\�\�\�؎�&�r�/�\�1���A�ԑj;�N90\�\0�\�NK�\'�E\�X�\�\��;�`�\\\���˻J�pa3�(#=!\�\��ǅ=�ZpB#�J\�\�\�8�L\�\�ɳ�K�3D�s3膛��`\�#\�Q�˺� /�\�\�\�h�8�o\�\�\�^\�\0�UxB�E2�\�Θ\�!\�HT\�\�[;�d�ܘ�f���0C�!�i\�b\�qc\�\�\�W\�͑^�\n��\�\�\�d�Q�\�\�%\� upw���#\�\�z�\��(��]㉧\�\�Q(�L\��\n)���7yr�]\�<�iz7�\�Z�\�w\"1�gi��@_B��5\�:\�A�\�\�1C\� �wӘ�\\�\r\�L�QJ��G\�8\�v��L\�\��58�tz;\��T]i\�\�\�I�\�>�>e���\�S-�z�_\�N8\Z\"�L\�=�M�\�ʙ�.\�\��#\�\�$Fx�h\���_��\�^�\�\�\�N>Ss7�\�\�-\�\�~�v\�gʛ\"\�\�1�\Z\�+\�l��!lw\�\n\�uY}\Z�-����\�J�\�D���\�\�-\��k�S��d�\�l&\�8��F*�\�t�tf���\��?h��\�\�\�+5*�[V�*:`hn?7�\�·�\�G�B����#\�\'= ������\�=vD�C=رe�+A��Ȭ�o쟈IT�r���&U�y��2\�B9�nWC���ʆ�0ԛ����\�u�2\Z��Y��Fx\�DXe��\�ʕҺ7�1S��z�Or��\�1\�o,�.aє$b<\�\���\�\nӜ���d�,Q�\�o\�ԇ\�J$ma��\�ЍM\�ArZD�\\_�\�\�\�e셪��͝A\�\��7/��.8\��\�Vb�ap\�:n	qSñ+Q�55dR;�8��c�m�8o�����\�1WV\�Pq/�S�fWB!\�\r�\�\�e�C�peX\�{����\"�\�c6�CŖd�\�J}b\��=X�3��!G��`\�ذ]\�@\�˯�t\�a�龞�[d�_�@\�WQ�\�lO3qhc�31�jT\�+0�Y��_G\�`EjǧS�u����}\�q�L\�\�$CǨ\�2�(1�q.M\��F��o+5u��B�8�\�c�\�M!��.#��r�f�\�v�\�h\�KW�ϴ^�\��X��\�,�\�	c]������\�ç�?EEw� s38]u:?H�GB9�t\�\�\�K8�\�R*0ܦf���\�sяџS=z��ͪ.Ҡ�k�N�\���!�\n���r�@��)�����3\�\��]y.�D�\ni��\�ihf\�\�#�\�E\�=����\�e\�0�	��lb�#6%�G\�\�%�xՏ\�\���=g\��\0I\�~�g��y�m�y���\'��y���\'��y�s�=f\r?O3��<\��\�q�\�\������O3X_1\�\���鿸��\0���\�\�{o\�\�\�G\�\�=�\�\�~\����������?\�\�x���\���\�?C\�	�\�\�?W�O\���\��<\�\��\���\0��o0��W�%?n���\0���\�\0?G\�\\\�\�c��?I�\0ag\�\�~�����\����o��\� ?~e\n�g�\0H�\��\��\��\�\�\�s���\�\�?w�G�\�k�\�\�����\�\��\0y�\�s��\�cS�\�~\�����\��\�Q\�\���_\�~\���\��\0�~�����g\��\0I�\�~���\���?\�~��n�\0FS\��9��\0�\�>^����?W�Eo\�\\^f�ߧyg4�;\�oӼ\��~�\0�\0\r\'Q�\�9�\0B�T9�\�\�\�N�u\�l�\�q��\��\0�۽\�QG\�0G�r��\�~&[���e<M�J��£C���\��u�&�xR��;����\��\� \�5�\�\�/�?y��`y��\��]�k1v�����\�?\�ۧ�\�\��\�qD��\�]�LHd��\0f\�g-0��\�g賿LY\�wzZ\���\�g�*D\�u���~\�\0+|�\�hy\�S\�n��\�ͪ��8?[\�\�`)c\r\\\n�\nc�\�՝Q\�.�\�6�be\��\�\\�\�;B\��wV\�\Z6=��n\\\�X�@\�\rm�\\y�	\����;���\�\Z\�\�ӵ\�UTXP8\�r]\�J��ЀЕ\��a\��\0�\�Uד{��v��S�\�M�>\�\�#J\"z\�\�GBU�\"<�1X4�mL��\�e�d�C�\0\�\�#�\�9\�(�a��s\Z�O\�<�`\�*{�j4��%#\'\�D��IF\��\�X\��\0�\�D�\�{�m�\�Qx��V��HX\�R\�3ۭ\�J�өh�\�\�\��\0ɪl~�\�\�z�wLĠ\���a���5�G�\0��\�\0\0\0\0\0�\�<�\�<�O0\�4�\�<\�\�0�\r<\�M4\�N0�M0Ì4�\r<�\�<�4�\0I\0�H\�\��(CE�O��\0S�P�0�\�<�\�<�\�<p\�0\��\�0\�,�\��\��\�r\��\�(2\�<�\�<�\�ҍ��\�4#�8BGa\n��(r��\�<�\�<�\��\��\�<q\�3\�<r\�q\��\�<3\�,�\�,�\�<���( �<B	\"�8��\�\r�,�\�l�#�\� ��\0�\0�\0�\�\�p��\�c��Y0@H@�r?\�J9p#�\0\��\0\�m\�\�<Q�e&\��룢s\\\��\�n4$\�\�9�B3#�SCL��!#��WdV\�\�Z\�\��\�!�\0\�<R?\�o��s�<�A(0G6;/��S}�+�B\�Gr\�\�\�1�\�M\�@3\����\�x���\�a�(����*\nI��&\�\0ھ�	<�K\�.\�źu�g7c�\�\�Eh.�/�l)��\rf\�3\�m�\�9\�ژ��w��\���G\\\�Հwj\�gS\�x\"=vd9��|��g����P�s\Z*!��\�KA}�|���xi�[`$���뮅 �������\Z\���\Z)�qޑ�$�^\�%O��\0\�Ҙ3%��3s�M�\"`\0\�\�w�����\�\�\�\�y���d�M�l��7�E��@N��\0\0!�\"\0����z\��\�	��ZwKy���su�!C\�|$�|B�.q\�\�)c�.���X�\�J<�U�����ɳ$\�\�0\'�\�\0H��� �\��\�\�ڱ\��|�\�Y\Z�\�x�}dn\��\�\�8 \0\�\rR\�c;\0LW?\�\0b\�(1\� Y��O8r\� �st�`^��<�_t9�i\�\�&\�y�ѵ[]t\�B\��&c?��=��N7O4��\�N�\�@�]\�\�\�{}\"\���-6נ_=Ex�Rس&(Vè�ް�\�F\�/��I,M�i�9c~N�##�Z[�\�ܥ�B:ҷ\�b֩s,�3�\���wYl\�\�\�\�I7Bim!z��OK*3gΒ34�\ZȎ^�j\0I\��(s\�<��\'\�hB�w��\'2\�\�\�?��)\"�W��\��$h\�\�o<�\�<\�{il���1�\n\����\�\�z��\��\�<W��\�<�\�7\�-�Wܬ��J��Gs���[�(>ʃ\�\�:\�O<�\�<n�\�\�b��ѰS{Y8��\�%�b4g��A\��Y/\0�\�<�\�97�,婏5^�\�d8�:�m\�n\�\�ȿ\��Tr��\�<�\�<\�\�M�W*�d\�\�*%�eL\�G\�\�\�:H#צ�|�\�<�\�A}��G�\�b\�\�:\�\�\�݂ٔ,\�_:��u�\�/N,\n\�]<�\�<d\�e\�;\�\rN\�\�:0_u�\�IP+�[T�fcS\\\�G\�<�\�ZSk�}\�j����wú�݀�E�\�aS\�T���\�<ȓ��4Zs\�	���2�\�{\�\�\�A�M\�V|D\���\�\�\�u\�|~ܖ�\0��x�\�v޽G��\�*P֋�\�Td\�t\�\Z�pJ��{�d,\�9�͏Cvȣ����rG\���v�M�\0�\�\���\\n�\�\���ߣ\�Z\�\�cj���0\�\�ZHmdR�݇{\rH������5����\\\�R_~\�N0\�+#{bun�NQV\�J\��C\r��8	K-�ͭ|u��]}\�B1�7�=T}W[ጥ�L�C�A\��z��]��\�-�j\�\�\�p\�[�\��\�q�p<�qD�ݼ-o��\�f�8/\���F\�Z�\�\�1p�wthR0\�\�\�I&�3K\�{\�O�\�kRn4i3B=�\�89\�c d��DS5W9a_EٗH4F9Z]e5�@�LaL��\0�?��\n<R]�.����4��W��� �(\�\�&i\n<|�\"���\�\�ǈ�{�\�\�X V\��\�\�.�\�\0\��^а&bՌ\�\��;5/w\�Z1Ҁ�0@	�|G\�\�@�\�q�\�]jc����\�A�Bb�� \�\�\�0��}\����\0��x�\�\�\�C�G�\�;�\� �a��K�wB�UTk\�v��\��\0z\�\�m���xAh\'�\\R�T\Z��+X9ͅ�@�T�hU1O\��\�#\�j�]O724���T���SC�$_\�͏*�;լ�<�7\�\�\�\�\�h\��2\Z���ؑ\�\��A\�<yfJΰ�\Z�S\�֥NH�إ��$R&��/|V����\����\�p\��\�,�s\�\�\�I\�p?�7\�!J8�\�\�[�<�\�<�\�<�\�<�\�<�\�\�4�\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�<�$�pB�\���\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�-����<�\�,q\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�<�\��G<�\�\0\�\�<�\�<�\�<�\�<�\�<�\�<�\��\�\0&\0\0\0\0\0\0\0!1AQ 0aq@P��p�\��\�\0?�\0\����_\��\0��\��/���I\�\�#O���_\�ՙ\nĹo\�6\�@_\�\02\�\�?�\0\�_N\��\Zq�\�\�%\�\�\����`�e�=�9e�Ye�\�4�!��bȿR\� \��\�\�\�\�\�̞\�3�ge�e�\�\Z�#Y4��\�\'\�&\�d�����~��>H\Z{�E\��e�Ye�Ye�Ӯ\�\\\�\�4�7Gĉ\'?ȋ��\�dg�\Zy�\��\Z�%4�/\�W�iiiiiib��%���1�x\�Z�\�\��<\�\�]�;���\�8ջP��׃�M�\�\�G^\�X���X��b\�KH��}\�Q\�w��\�Ǒ\�\�\�$	:\��^μ���\�	�\�i8t\��Of4\�\�\�\�w�2\�$���\�?\\\�n��={\r\�\�\�\�\�cߋ �p0\�\�,�\�\'#$d\�m\Z\�\��`\��\��\0�q�ee�\�[m.�����\�\�m5~a\�]u�\�\�\�\�lq�\�\�$\�p\�C\�}<�j!ё\�ɧ�t޶C�De\�V\�[x\��㿫��\�#~������K���/�0N\�\�&\r�\��\����E�fxy������\"\\�}�\'�Xz�/\�\�vw\�����]�\����+�õ�ޣx\�\�ė��Z�d_^Xa֏\�\�-��\�\�	F�l>%\�l�\��\�n\�_�mx\�,�-,�ՖŐxφVd\�<]�\0#�\�\���mՓ\�\�.J�1ջe\�\�Ye�]�~Y�ޯ�\�\�K%���o\�9\�\�8\"�\��\�-6\��n\�!{y\�O_v\���\�\�:��\�cK�\�\�O\�F�\�>\�?\�\�6\� ����\�\�\�_3�3m:-A�\��|�z��N<�v\��-�\�\�,�\�mx\�\�2]��\�\�mze�\���\�\�\�\�E�;�<o\�\��\�\�>\��7�����k\�կ�_v�[_v�\�\�\��iO^r\�R>�}_\�G\�}>�}X���\��,<Yo^2\��_\�\�a�Dɞ󼈏��\�9\�r\�?_\\\�;\�s�l�	i\�:6\�\�\�\�^w�\'�o\�fF2~\��3�\�z����k��&N\�x\�m#�\�l?R\"�8O\�q�\�\�S\�	S��ˣ�|�λ����\�\�\�x\��7���\�\�S\��o\�\��\�w\0=�5�2.��\�o�����d�7��\�]�\'�b�\0V�\�Z�ſ�_V��	�\�iGV�8t�K,��\r\�8l�\�\�\�H\��\�|~�-.����i`��m�7\�;]�zB|X\�\��\�V�\�^��m�pq2xf\�\'\���\�\�\�\��e�<	3��m�ޗ�g\��_\�\�ݿ�_p���\�\�#\��]o =Y^�{-oHGN\0;۟�q�V���+m�@�1\r,���]��s\�\�]�Y\Z\�\'\�\�Χ�&�i\�\0t�\�G\�\�\�]�:\�\����\�\�6|@\�k\�+{\�Q\"rY\�~�@���љ/L�8zt��;���3C�:N]�\�w2\�\�O�I\�\��gQ\�\�k;����H	D�\�~�>f��\��C��cX�A\�C�b\��A��\��{�\�`,\�\\�\\�8\��m�w�0\�w��//gmт�2�|r�\�=^\�\ZH\�\�ˮ\�\�\�\�\�!O�g_����,աo�\�\'\�$w^K�:{��\�\�Yg)0\�~�!g�v[^\�\�>\'\�ܻ��oI�9\�#\�Ħ�u�&{\�\�\�A\�ܣ�Qդu\�奼$�B\��\�\�\��\�\�c\�\��b�bŉ⿵�\�,ybC\�~�]�66tx�\���mB@�[u�߈l�ۜ.�OkM\�a\'>FV�I��Cb\�݉�FHؓ�\�(��6\�\�6\���|q�\�\�Xe����\�\\:\"�8�~/-�%\�g�\�\��\��ugxk#\���\��!��\�%!\\��\�\���\�ԎXH��\��\�\����HY\'\��&\�z�]~�\�Ȳ \�Op�q�0�\r\�wϋ�\�\�ؼ�\�\"NH\�W�.�Y\�<��o�\�\�?�Ӌ0�Q���\���c�YX�\�\�1�1\�A/XX�z\�\�W��x\�1\��`��.\�;�	\���Vot�\�3�}�\0$|2e��nHܛ3\��m���o%�o\�{~��o�Le\�\�OVK#��\�]�ӗx_p\��!��w�Yw:a,ӹD?Sg,\�\�\��\�����9a:���,\��?�\�.�\��t\�\�\�m�\�\�`B\�:\�=�@�BL�|�\�ft@��\�\�\�U���\"|Ξ޲]\�B�`AjH8\�;�\�oyY	��\�%\��쌺��yz��\�s?�=!�O\�?e�\���a�wc��g�\�\�ł\�\�.\�\'\�I(\�j�ޠ�dQ�����\0\�!\�<�\��\�-�e��oDqN�we�,@za��:��\�,\�\��\"�g\�p\�R�>�,��\�ݏ�\�e��L\�-:#ȅ\�Vޝ�~&+�\��l��\�2\�l�!	\�\�`\�i�OWF\�\��v_K\�7�\�\'�L�Տ�;d\�\�8~W�\r\��\Z\�?4ZFx\���{��]��\�\�\�E�L��X�;\�?HK�ނ\�\�F\�\�\�R\�!\�+\�\�\�	�\�,�<����\�dt\���V\�=�\��\'W�\�xٷI!��Iռ.[�́\�wf\�@�{\�9���\'v\�]$<\�쳀\���	ý.�u\�C\�BȞ��y�\0\�Kf͋0KlYbn6,\��=\�a\0��\0@\�\��_K\��ŀ{\0��B\�O��_�X��z���\0\�\��\0\�\���O��ov�X+-��\����\�A�/�_\�COI��W\����\�\0&\0\0\0\0\0\0\0!1 AQaq0�@P��\�p�\�\0?�\0��\���\0�w�w�W�w�p�\���|�\��_\��X�d�r\���\�Ye�Ye�Ae�|3\�m��\�m\�H�\��7%�am�ۧ%op\���?-���\�\�m\�y\�x����^\�cm���v\�rg��\�\�\npt\��m�\�o\r�\�v�]7E���\�~gN\ZY�O\�\'�����V\�u>\�x�\0\r�\�m�\�m�n�\�\0}�\�K\�\�o\�K5�;�r<\�&\�8\�/|Ov���_\�o\��\�ᯀs\�#�\�\'D\�dc\�D���\�}\�9E\�V�`\�.�.��-�����w\�\�~��ڲ\�,���J� >�g���t�\�^\�Gs;f*p��,�K8\�K���vٻOVq�ud�\�󍋫��X\���q;�+P>\�8/\�6y¶X0�ٴ{�\�\��a\��\�2˾;�e�G��菞\�\�i0\��\��\����\���C/�,�:�܂�Y����\�\�m\�\�,�-\��Ȏ\���|�ˢRˤ[�=Z�I3~)�6X�\�R�\�[�\�\�\0�bȃ���\�\�w\�vu;�Y˺m�|�\�ώ-�w\�\�˲\�%\�\�-��\���\�m\�`\�m�d�\�\��\��\�8^H��Ya\�e�ն\�d�o|1<6�\�6�@K�\�͞�c\�q�\�&fK�\�.�\Z\�ρ��V�\�\�{�G\�\��\��3\�6����\�͈u�,z��_B\�\�\�Wԭ\�=��7\���������a�~E�X7����\�4\�\�\�:ՀHl�\�m\�`\�\�!��A�-xz��\�i�gVO�\�\��x\�,;��Kޭ�I��u\�\n1o\�n������#�_�O\�<�\�\�g\�`���\�\��\�G\�~���̻\�~\����\�\�\�~\��\���7\���k�k=��<�k�k�k�~\��_�\�\�\�l��~[ܝ�a\�\�`����5[����:\�Z�\�[�r�\��\�\�|�aq�w�	��+:�\�G�Ĩu\'�Cm}d�\���\����\�\�է�\�\�:�\�>>�o4 <�\�,\�@\�QݻY�n\�k/\�\�\�r�=�W\�t�;l��\0�0���!ԉ\�y�J�l��o>�՜�L8J�$-xN\�Go�N�Q��_.\�\�\�ԩ�82{�\�ճP�\���+����\�[M\�y=�pq�\�\�j\�-n\�\�G�]`��\�hwd`Zzn��M�:���M�t\�X\�ۿs�û\�B��Bv\�l�d{��\�\�1z�\r��\�x<�\0�c�G\�\�\���l6\'V\��Ǡ\�v\�e\�\�[�(aݏ�{э�wb!�:�`�8\�a�g\�G�7�M�:��\�\���X�\�[g�`�:�\�Փ���\'�\0\�\�׃8��xĂ���\�i\�I����GI먲X\�;ۥ\�x��\�O��M\r���\�/\�q�c<�\��\�u1ۻF!ǂ����\�\�?��S\�\��_Vu2l��\r\�\�\�\�+�\�۟H\��\0��\�Q럻&����\�\�!�\�\�qga#�0��D��HCC����O�M��}\�a\�\�]����e\��=����]:��0\�{3eO�LzЙ\�끗��r<[\�WgK��e}I����\�;\�\�um�\�\�\�8B\0�~�g\���\0̐억@\��~��ʿ� �!��\�\�p�д�\�t]�y��\�rQo�R\�\�pD\�\��d�Ł�o��gc:ZNO�Y\�&\�7K\�\�\���u9ug@\��f�\��.���\�\�Np�?s+	}���\�ӆz#_�gկ\�1\'=�\�\�p0lC�6{�ȟ!�m�\����\�Mړ�6~\���\�x%:�,q:�|��:Z\\l\���K\�\�g\�,�\�p��b\�q\���p�H5/e>\��Ћ\�\���vY\�O�A\��\�\�7\���>�\�baݥ����[b�\�{~\�$=.��򟩏��t�\�#x\�\�q�1�1��kł�6LHoo��0�\�^�\'��|���l��^\�\��\���=�J�kf\��{\'ԉ��H��N2̏mHW\�,\�,aIG�e�8�\�R\�{vXtޅ����Bu}�w�BYyi�\r�\0�\�a(��p�Լ��\Z��[�æ�q-2\�䯩�;�u ٳ\�w���հX�l��Zs�\�\�rǑǨ,!Ӎ\�Rt���\r�3�P7\��\�f���\'�\�>,��Y��\�ϊ\�\�`�s6I�����\�\�\�cg�䎶\���\��LY1\"\�dw&\n\��\�F]\�PY<����fl]C\��J?��D�葀6pû\�N3���p\\6U\�܀\�m�{6\�X�\�r\�\'�\���\�\�p=m�\�6\�xg\���Q����.G�C`�8]p=6xGdI\�\�\�8ɖw�\�\�a��7�Cx\�6c�\���H�s_R��ǰu\�?S\�\�\�\�!\'w8\�\�\�赁a�;{\'�Y\�]��\�\�\�\�\��-\�\�l�\�$\��\r\���z-3 \'\�>�i��C\�\'\�P��O�B\�_�;\�\�;xb���!�[33��\�K؋����\�\�^z]:C��S6\��\�\Z:a��ㄠ\�`\�L����B\�\��\"\�;��%�\�a�S��͇����o\�<�\'��\�\r:�1�;u \�p�\�:�Y�6M�/V��z\�xӲD�]��#��}�sx�g_\�a=Z%\�-lφq:���؇V\�ܾ�\�K��/\�A=\�#r	\0\� �J\�\�\�v�\�3ρ\�E���\'���$6�\�K.\�v|�SL�w1\"\�E��P���$\�~,p�/�kn3\�\�\�\�+9�z�r�\�{u�\�b\�իm�[�k��m�\�6�\�,�����V\�۵jݫV�Z�j\�}<b\�61�\0L�o\��\0�&��C���\0��o��\"؞�\����\0\��{���Y_-H>\�:7�\��\�\Z{�\0j\��/���\�\���i;���6Z��\0\��\�\0+\0\0\0!1AQaq�����\� \���0`@P�\�\0\0\0?�\0�\0Pr�Tv ;�\0������q\�	\�\�\\]i�\�~��\�\�\�|\�\�S\�t:�~�7��!\�\�V�\�\"٪2&\�Ù�\0��\�\�\��s+\�IEZo\�\����0Ɱ��c\�\�N��}-���CAD{+ǰXP:\�/\0k�G�(\�,^��\�\�l[�44\�C�l�)��26�}�$�\�\�ʚ\�\�.כ�\��Y�\�\Z\\��]�\0Z�?�\�\�ܸ\�	-U\\�\�\�e\�\�X�_\�\��Pג\n@\�\�\�@(@Qe7\��\���LmP$q-p�� ��	J�\�;�\�%�R\0�؎^\�6(ޚ\Z\��\0\��\0q\�r\n\�9\�E�����\�~\�PE`Z\Z\0\��\�0\�d�/\��Ϙ9M\�\�R���7����z#\�\��z�\�\�9a\�.��4�?�ߢC\r\�As�\0g�\�6\�\�WT6*��Ji\�\�)\�p�,1%J4\�?�\�a�0���b\�\�n\��l/��Ű�e\'�U�s\�3*\�\��a;�\�C�r���zy\�z�/\�+�\���h���|!�H�|0�E�)\�g�\���x��:�d�\r㲱N��=KH8�w�F\�Gj\�c\�C�\�*����VҺVO�S\�j\�,,aO\�\��`C\�f�\�\��\0\�\'~r{���61�\��\0�P\�\��\�^�\0�ڦ)J����%Q2<��U�z\���L\�g�2�th|a�x����ճ�\�	��5�ֵ�>�:.f�F�\�_\�K�e\�\0�r��O��ͬؗ�t\��f\�\'	]�qĿ ]�\r��x��8\\I\�=��6\�i)�3�\�\���4˟�fGVޕ��{��\\<��\��\"\�\�-�\��.\�n�a�/�\�[\'\�\�H\�*�����\�\02<��U����T�k�b��\�?�\"�	�K[Ϊ#FR�\�\�ޙ{\0)�P>n~/��@|\�\�f���\�-��\�M��lX�\�@\�B\'v[\���\�\0��߬�V\�\�y�\�0 iY�� 뚖��<\�\0\�h�n4�p��q�(.\�\�`\�\"������\\Qܶ�,��\�.\�0W\�7\����\�\��&&�Y\��<���\��V�V7\\\���\�$�\�\�\�Ox������N�0\'�\�\�\�Wi��-B%]�\�\�\�\� .龥�R\�۔�����*@{�\0����.n\�\�)�\0�ԃ]y\�O\�K�\0U��a9�\�u�F�mr�)��.�B�i���\�\����s~�/S��\0\�\rI3\�\�9\�\�/Ⴏ��:\������lN�\0^�1�\rh8�{*R\�\�YN{\Z�$�5b\�\�\�\�\0\�\�v(;ߘC^@�g\'��\\�\��n�\��\���+(P<(.\��\�]v\�^UM\roE3\�\0���\�*O,>��\��\�\r\�ӈfJ�m�h/���ja|ֽ.Q+�6.����V\�է�\Z��g�_���\�[\�1R\ZPL�\�~�\'/}{v�p\���\�\�$\�Ӗ\�\�5( \�ډ\�k�ö!h\r�����T�p(�x>s\�\�a\�xT���>\�˷8\�\��>����]w�َ�7�K*��\�X1B����.	LG\n\�Te�\�!�4זZjT\�\�t�ӈ\��\�^7y\�\�ba�\�i�KJ>�g\�\��(��:��v\�EU\�l���\�,Z\Z]�{z��\�\�#�rҍ4�kP5�S\'�\�\���\�\�x]#�\�\"ЙfG��\�\0\�P\�]\�\"\�в�|1pQ��ԏ~�k�`}\�\�߬\�ۙE�-\�\�\�xy\�\�b\�E�\��\��ߏ��UJ\�p�Q䃅-Z\�5\��|�\r��\�[/\�w(aȳ�\�\�d\�\�\�>2~��~%H2\�CcH�dR�{=.�\0\�%\�o�F\�(J�ˍ�нD��^�\�u\�\�dM5\��\�\'���\� �l6��}\�\0�kp\���e�\�8b!%g�Ƭ<t�,�B3B��P�����\\C�{\�\Z�W;\'b\�\�߻�\0w��\�9tί^�?���Y��e�@��\�nC�t|\0�\0MF\�ˀj��\�}\r��U�W\�\�\��\�M	n�\��;�P�WYPp�\��`qs[}c:\�\r��\�悏�\�\�E;٢\rX(64�#Ok�ԅ��ϥ�B�\�\�\�6\�Wj���\�\� ��\�_����N\�\�U�-�0���*��\�z\���Q�V\�T�.P��\�V*\0�\�bw��\�\�^\�{A��R\�:��Z<\0\���1�a�\�\���^�ȻW+\�Yb\0lm0z;4w��v\�-y�KR\�\�>���1�݋qU�\��]�>\�.�<�\�!~�X�\� ˴���$�\�\�]�t�\�CB\�*��\�:�V��Px*\'`�r�~\�O�B�\���]\�ͭʅ��K	X�2\�\�\���\�#�i��iZ�v�U���8� �\����\n\�ʒ\�a�2΅?�v�,\�X��(d�\n6�mRQJCa�K`�i�5g)>�1\Z�.\�����\�\n��k\�\\J�\0�\�A�ԧc�\�%\�p\�\�\�ۨ�N\�׺9|CP�\':�h\�\n\�rw ��K<3�1Y\�\�\�\�WH��j��p~:�蘤�o༣tn ��h��\���J�\�@ܸ\r���C֮�]\�<�~�+9�o��\�\��M\�f7\"�NԈ:8�(9\�m��\�#�`z�E��^��o\"�\�6�*\��Dh��MҢ�ޭ\�B�.6�K\�>�\�[F\�\�k\�#��\�GdT/��|[_9\�\��iW\��\0��l\�3tho�\�\�9kӜ6\�ߣ�\0�� ៕e_\0�]f\�\�\�(9\�X\��\0\�i�`2/!U�w�ޓe��\�\��AaV\\�=��\"AɻT\�����Ce\�^\�3�y4\�|\Zb\�k�!����gDr&��^=�oR\\T�x]\�z\�\����\��+\�ϵD�T\���\�\�ܞ8ڡ6/-�\���;�ģ�x�\�\�\�	\�.�i�껙[�E��lr���!��T\�}�\�\�qV[b�\�v~��\�ej���υ�d\�\�����*(\�nJ���Z{,]�خ�m�@F�(	l���x|�(7L\0��ѮG9=\��y�hڹ�h�*t�:E��\���T\�6Q��BHѢ�w\�<.ߑ�;zV]]\��\�\�\��C�i���k*j\�~!:@YptZW�E��Y��QB�\Z{1�&h6��\"0Cj\�\�!Q��b`\�ai\\xM���3�ȳ!�\�ar�\�[�]}*B���\�\�\�Ñ�O��\�Y�_�,5顺�J��%�.���\�b\�\�3��� �\�b�,;-�\�\�L� B\�H\�d�\�ۘn��\0�����\�_\�uT�����\�\"\�p�5`\r�x!���Ab�9\��y\�x-\"�rUf6`#\�G>\�\�\����r\Z\r즦���ǁD\�i�8\�2\��(\�\��U�R\n_\�S[�V�|B��rJG\�J��\��pX,^ڠ�\�1�\�\�V*!\���{6\�Y錧5�Y\�\')�g�kx�ge�\�25�r/�fR+N?�0��\�m0��\�\�Y��\0��\�d\���R�\r\����\0q�L�p�*n\�0w�95\�\�\�8��H��PZ5\�E�<0T-0>\�>�\�vA�\�\0\�O�aC]5�^�^\��+*��C\���\0�\�7e�,�\�\�t\�y��\�fS8���sP$SL\r��\�\�h��P�\�\�k�\�\�{��3Y\��\�zP\��a\0Oq���iy�O�	\�\��`\�\��â2\�\��>=\nr�R�[t��\�N0^#߃/%\�>F\�\�n~dڍ\��ub�T\�\�V�\��\�ʄ{\\�\0\�\�?\�t���\�VR~{l��\�]Kf�;2�7{��7�DrEi\�\�Xx2d�\�\n�\�\�B\�@�B�RS�>}Z3�A\\\�]\�19,rո/z��}\Z�\rp)�\"�[>P뿒fE]\'?\nh\�\�~F8��K\�\0\�4\�|\� �Ă�\�\�u���^�mZ��6.�\0|\�\�(���L�\�\�x�_4B֕a���R2�S\��\0�\�:f��k�\�9\Z��Ug�~%�Q�\��d��\nd\�=@0\\5)rjl�W�,�\�7W̢/X1C�dU��8G��@̣\�t\'\�\�~F8��K\�\0\�4\�|\�M����y_\����[j\�u�&\�ߠ\��=�Ƚ�<6|K\�\�U���W�C�\�Q߀\�q\�q\�\�\'�|!�+XG��*h*���|\�{�� �7\0$S��Ͼ2\�\�\nO\n]q�\0\Z�J�ZՋ�O�vt\n?3�y�G��\0PAl\��?,��E\�E+\�\�ZIp	c��˄:NS�3\�)& LbӁձ�q��X�\\�[�1KY�D�Rq�*Θ��\n;����\�6�.�k\�K\�̆˥�\�\�o��-H\"�Ϧ�p\n� \�W\�!\�낀\��.\�*ca�\�\Z�ʭ\�8��@�CIf���*D\�@��\�/��\0��\�ZPT��h_\�]F\��Ys��\�!���U\�2�A\\	�\�\�Y�,`\rO%�`v\�\�V��)��\��C\��`5���gOP\0 P�&()���\��){� \��%4|\�H,�r\�v\�-&m�\��\�\�k�W��ڬ�\�G�\�\n\�g~�\�\�A\�a\�6T�\0��SB@�0�ҩeх\�yB���T9\�4\rpni\���[\�D���\�{����^\\�V��*(��ݐ\�T�Y�h\�J6�wh�ߟ�~X�w\�Ȃ�h�\���$\�Y.\�Zh\'�?hn\�\�\�ymB-\�K/\�.M�Kh\�0ua�\�G�r300^�#��Fmb\�\�N\�Ε0�\0֑�1g>�\nf�\��\�\�2��\�>{r�\�\�P�j�U{�\\��t��E���}\�s}\�\����!��8 ��*vCMS\�e�\�X�p7k�X\�7Vk�\�_��XE)\�=\�q\��s\�*\��+�ةf��̮�+ut�&�\�JU�0��\�\�\�s�f���\�^?�w\���3\�_�~}1/\��\��.\\��.\\�2�ϟK%ϙ�\�gr\���\�_�~e��\�_�~}/\��\0��\0��\��g̷�\\ϡr\�\�}�g\�33=\�\�\�YU����,\�\�\�\r6�\�pKpp	^�E\�f4\�T�\�X��~}~�3讻\�!g��\���G����,hy\�����)i_ꏬ�~\���\0\�~fH7.,\Z��/O�_�\�Ke�LW\����pH\�\nI�;����7<%��ܿ�3�2��K�/ϥ˗/\�\\�˃._�J�\�J��!\�R�J���\0]���#v\�\��x\"�\�\r�k\�nT�\�\�d��K�\�S���BT�Y뮽��M^��\�ދ��zT�J�F\�_mJ	SR���8�<2\�a5ѵV\����zA\��*�^\'R\�e\���\���\�z�5\�p�)\�ï�1�-�+�V�U� \�K�v\�VSt���i\�44\�vf���^R�\�\��\0�k��\"A��%˗/2\��\0���_\�\�j\�\�.^�\�̹R�*T�^�*T�R�k֥\\\'��qu�\���RWEF��nh\�\n�qKP\�\'\�2�T�\�\�6r\����c�L\�5\�U���ҥ\\�WH0\�AF������F��l~��\�\�?\��ze�\0#7.\Z�Z�j�5^�~��\�/pe\�q~ \�aPT�\rʭ�SW�\�\�%$��\"V)F\�֛�Q駉\\��\�\�?6�\��-hc\�\�_�E\\#�\�t�\�%MR\�\�Ux;�R%h\��\�o$ܺ\�`\�\�\��X\�ҽ/2\�uT�J��yR�+ҽ\�\�W��	\�?�!�7W5+)�\'7�e���]B̃�y\�f���#:�v̩6Ol�R�*T�&	rc1������bQ\�[�^w6\�\�\�U=;�cP�zܹw/2�\������\�j7{\�_\�vN3\0\�I\0i/�^].\�$�Ō(e/Ϳ\�\�dS!Ld\�\�Ķ�Vʯ稢ƽ����\rª(Kj�8UA�G\�	Qe��\�	�5\�x\�0`\�ߙty��\�e\����3Լ������\�R\�k!�+���\�\"�_s\�5�������\ruk\�0\��\0+��\�ܲ��j�\�yVk�F\�?QŖ\�\�\"X5YCgg�r��&RR��lf]���C$/\�u\�uǥM�S\��,�����\r�\�\�#8\0�\"���2��\\��%�|+���=\�ܣZ)�T\�|�X�t/d�\ZV\�\� �\"\�]o>|LJQ�fV�\�f_�\�g�S\��=8�=F�jW�zT�W�J�*T�R�0F*����G,�+r��\"\�w2^\�\�Y+(�T���rz\�HU�������d\�_lq\�\n\�e്T�\�H\'��<\nѱ�^i���a�^}o\�r�	�xc\�k�Mܸ2\�\�VeI��\�\�.�^C�>�k\�Tv�ٲ\�#\�,����-?Ƙ_\�\�j�V�\'�q\�^dam_=@Y\�;\r�ik�p�\r�˗.\\�r\�\�_Կy�/�r�\0\�?¥J��u�H�&$� .s_(�ʷ�C�n\�@5XR(KsW�Ô�����\�\�_\�QJ�_�E�\�\�G��5| ��@¥F�j]_&~e�S�C�5Q\�o+�( W1�\0q�\�^�Kx�X����)\���G\�\�ܺe\�X�\�=8�sr\�y\�0`\��\�W.\rʙT5���\�[(<Aph��ĵ\0�\��#׈\�=�\�!����\"�׈��T��.���J�%\�^e\���}k\�m_��?\�zT�P��RW�\�V> �-\�d;�\�.\�G}\�Vh�^\'z%.\"\�JV�&\�\��A0`T� V�޹���\�3B\rg�\�\�&�C���\�%>1��-�quT\'o?z�\�\�z�)6��\�o5P\�\0	b���\0���]N\�\�@�\�\�@6>x�ͧu�\���3�pe˹~�%˗\�\�X�\�-y,PuG�\�v<���\�~Ae��\�t�0��s�2-������̀\r�\�7h��\�h>&�\�ݐqi�\�\�c\�nT��o�~�J-F�px\�\�e\��E�\�/��,(��>e\���^!��2�zW�J�+\�%J��Q�El�\�\���n]���\���\n��\�\�}5�\��N3/csG���.VZ��SJ����ywq�/Ԩ[�Q�\�\�싎�4ϊ;`A\r<�%Ȯ\���ED�mKVm)\�+\�}3\���+p�Yo�\�	��eWa\�K��~�.k�\�,��,_t\'�<g\��� t��X��JGv#H�\�p�΀�ǟܿ\�ej�[�����	ȫ-B\\\�L/�q��\0�Y�5.2�˔�\�\�\�Կ2\���.]@K��vJJD�J\�\��+\�\��OL�2vD\�ߴv6s\��\�n�?;`	y\�\�+��\�\�	XP1SP�s�-ʷ����$9V��T\"mm��X���3��vX\�/\�ͤ��,D\�\�U�ȳd���$��\�xaI\�MF\\\�(Ñ�n-��\\ \�_؏�\�\�,%��lf�h��_B5\�S�?ե՟�9�\0���\0J\�\�Ҕ�A\\\�����Dpd�ѹ�q\'̡\��\�Ggܩ�\�żwp��E\�\�\�qՕ�A�b\�\�\�\��\�~�\�\�0Vҹ�c�B�� ��ëJ\�ag�K��\����aa\"_ܹ~��\�\�-\�ĺ�K��m+>s>�\�\�{\�V=�I\�-1.�\�7�\�/\�\�{,Uhr�𢹮ܐ@I�e\�8\0(&\�4���r�\�\�hDP�\�3@g0�Pw!(����Zt\�K)=<\��*�ؽ�~���}$0(0o\�_�K��#�`�R\�\�r|�\r�\"m�\�\��$\�\�j\���\���-1\�LA8Y>_h*��\�\�jq�	d\�Z�W�ĳ�)�n	D��\�\�4+�\�E\��V�Ʈ�~�\�\�z�v^\�\\Q*ߐ�*Ԥw\�)m\�\�%\�\0�Dyy��oy�Au�}o�	�ջ�\0R��ꌪ�\��\0ט��\�(*ݿ\�-�\�\�\�8��\�ԙ�V\�\�@M>\�ĭ\�\�\n\�\n\�\�\�U>\�<\��2\�)\��PE�f#\0�å\�X\�9�ԭ!iQ��2��YP|Vb\�B�^\�~\�xl��d7Pe\0�/�KF��I�\0C�1�\���Z\�Q\�=7(.�x����\��\0I1i��4~!\�}ɂyChK\08\�\�JJ\�f��2\�ł:Jv}��6�nP�r\�O\���\��\�\�[��{,2Eݾ\�^\�N\�\�\�.���o�JxYN�eXM�/�)\� h8C�oCT�\�%*\���e^5\�F��j_~\�0\�W\�Q\nZ�>e�\"?�lM\�M����N\�X�\�ua*PY�\�N��)\�_!\�@qe�)�/L�\�o\�9Ǵ\�/zD#J����C,l8�\0}}\�ӂ\�J;\�B\\\"�+�n֏�� b�)\�\0�\�BV)8\\\�\�9]ԯ�a\�\�Tv�(\��A�\�F�?U+R\�k(h�J�\�b\nc\�\� Dr+��<�p��\�ӒRh-F�\�q=3*\�\�@ �1a��\�_�*f�\�\���)�?��\�\Z\0�P\�͖�Ga�\0��\0\�P�`US����h��tE\�r\�@��p���Ÿ\�k���{�\0\�Dگ �nq9uq��\�1\�Q�O�A�\n�\�톅�\��%j^�r�\�/$j\�\�\�I�[N\�n�=�Y��\�<8W\�S\�ف���eM,L�\\��\�͠\"\�_�\�\�|����d;b�E\rn�ᵓ���u/`Ӹ��.\�h\�\�NS\�R$c�(\�rM\�-E1��QZ�(<�8J~H����\�Y�h��Yj\�C�Z�x!�\�yeb�\�3p\�r\�<�%[_sW\�����<\�h\�,\�+.�Cp��\"��XUyc���\�ߨl==N%\r�\�(#���lbO6\�\�PR}\r������\�\�3Ÿ�{f+\�)G\�m\�1\�\�\�h\Z_፜@{O�6Vl\�L4�8��\Z\��\�X\"\���\0�D6\��	@خ\\�\��?\�����\0\�+-f\�S�q�.\�H�\00�G�(�\�<���}���<\�#Wt}K!b�\�^�\�?^Jߔ�E�k\�\0Zj�}L��t\�\�\0G����\�\�\�\��\�(���\�\�\\\�D�~0��L>��g>�0!����n\�\�z\�dA?3XR�a\�>�@u��^`\"�qQ��\�]Cz,�u�\�t?_\��~bSV\��`\�|F=�zk\�=\��\��|\�s���1�\�`>�X34��\�\�[\�)h���Ǖ#J�\�#�(\�6\�W�q^���?D@��\0=�\'D<\�}�\Z�a�c\�\'\�@\�͏\�\��\�+��Ɗ-� �^LW\��b\�xN\�\0�V��/\�SGV\�-�E�&`�hq)R�<E�Ѻ_�@G.��\�-��\�j��1*y��h|u\�wKe\�\�s�m\��9�B\�P��\�,H��\�^����hq.\0F�\�\�]H\��L;\�4�8�9{����\rQ�|\�g*F\0�>`]�\�n>�\�El\\/Qل-�C0M��k�\��\��M\\%Ht��Q������;W�\0t��}\�P��aF܉r\�G\�\�aG\'5ϽNcْ*�?���U�\���4J\�\��\07�-+\'�9��Fh»W\�P���\�28\�?(�����42c`)�g(�\�Tb!?���� d��xK\����Z�*���#\�KЯdr6V�;���\��\�+�,�y\�=e��\�U\�|M0��:=\�C�w\�#\��\�:qt�\0ĥ���\�\�E�so\�\�\�z\��\rm�(\��\�}@4�Ǿ�$j���p\�j�\0\Z�\0�i�\0C(�a\���vu�|S�	��|\�2�\�\0�G\�t��\�\�\��T�\�ȶ\Z\�隴;�\n�J\��\�W���W\�]4��\�]5GW̫60i�\��L�\r�=\�D6\���\�\"��Yd����3�m��Q!~U\��`�eԴo9_ӈeS˄s�S�=\�	}I�n�|x��◸\�Ge\�\�\�(\n�u�.��\��K�\Z��\�5\r��\�B�̪\��\�\��\�W�\�\0;G��!hQ\�TJڬ%晴4�	��\��\�\�Y�\�r���	\�\�\�\"�8_\�<	\�\��.\ZS���f���\�CQ�\�KDW��~#\�LVgrg�V\"<�LwW\�-w���(-~o\� �\0aNG\����\�w\0\�\�Qy,�\�;�\���lC��`�7�C\�\Z\\a�\�`��\�~Nfeb�a��\��<�� ��˄��\�=S�0\"�e�\03��NjS2�SZ&\��9f͋����L���Q\�\�.��\�b5\\�{@\�\�\�\�{TL+�I�iW��1���\0\�\0(�\�\�R��%�\\\�����\�İ,\�?1M\�:w����v\�Q�rT}�x�r��#6Z�f����4V�\�\�\��\�\�+;�¡\��q\�4p:����Q��VȊ�\�,\�\��9��LΟ���?�Z,(0~7\�v��Z�(0}��\�õ��?\\�&d`y��W\�b��W\n\�\�@�\0Q,��ӈ\�\��nEK\�o\�*I\�C�0\�f)RB)1Q\�v*(P�SG\�:<\�Z�f��\�$�o#�\�^a\�\���e�嬸g9���*\�\�\�o,��+B\�k?�r�lL�\�(6�\�0�*�SV�o\�jT8Uc6�{�\�,]\�~.081|�,rE\��q�\��\�^\�3mߛ���� ���ew\�P\�\��c9K\�\�̿\��X�q�C\��\"%tE׵\��\'Vc\�Q��\�g\�R���\�e5\�\�-\�\���{\�I�X^�\�\�\�2@\0>\r�\�\0������--I]�&rud��\�hO\�!\�<ccL\�\rw\�tb<N(�mv�!�e�ˣ�\�-�u(��2L~�@PK�\��\�\Z�\�\Zɘ�!Cl®?��W^\�)�\�{S?�E\�-\0=\�g\�X\�a\�A�\0�e�//e�.\�\�Yk\'��1{t�a\r\069O\�0�\�\�\�W��pU`\�/\�R����B�P\0Z��0@��k�\Z�z\\�]q5��1��\�\�j\�\�Āk*\�2��پ끉<\�\�$\�VL�\�^#�\�r�	\r�p\�fr��+(}�Ґ�v�Yʈ؏�,\�e�*\0fwlv�\n�\�\�\�t�9o=ޣ@g��((Pp)/\�\�\��\0\��v*R;\0�1�CE�K\"�	l�8m�\\�Jܠ�\�\������\�\�\\S\�r����\��3]\Z\��\�.\�V�u0���\n\�\�+��q�mf%F���9��}\�\n�\�sDЇ��8����\\�\�^8\��\�\�Z�~\�߃Q\"�P\�W\�2D1e�\\:%\�k\\\r8�\�7(�\�|x�\�J\�kvCe�7�p<u޿$����¥Ti|�\�֪U��l��1�c��\�	@\nL\��\�AWF�y@sW�\01�=����R�\�\���q�3_\�fJ�\0Q|Wl*�ł~#\0�t��\rEk���\npB�\�\�\0<�S��ib�o�0©@\� ܔ\�lL`j\0>\n�*$\�(�\�h\�\n�)\�NX~s�\�S�z|3.(i[d���\�V�?0Ĵ���\�` Y��\"L\�0��m�5��\�p��y�\�qy��(=�\�c�\�\�\�\�\�RVK�>F�\�\�d�Tn���V6d��\�_�uL\����ܨ\�.R\�����Ec��as\�\�ԠJ�Ц\�-�<\\�4]l��p\�F\�Gr�\�]~\�QC�̪]���Y\r\�\�\��h\�W\���b�f߶J�\�<\�9�[\����ɳx���AmAo���!L�\�_\� �\���\�c$\�T�\r`\"\�2eF\�	[�H���h�Xa�gUܱ�u.����;�<QQ{\�,:1\�yX\�YV,)��\��\�\�w�#\�\�\�Q`\�1\�\�(�dg�ϿPˇ�Z�\�ߨ�eK \�?�.�����\\5d\�\�_\�[�<�9�h��\�_\�\n�]��\����Ԥ�k-G\�_6��\�TT.\�`��\"���eSA[\�����fT\�]\�\r�g���\�u���I[�\�\��=�׀�����\�A\����\�z\�A����\�LU̫ј\�}_1�a�Y\�\�aN_Ea� �\Z��[\�\�\0R�35El�S\'}�0���G0r\���C���(\�>\n>\�R\�3\�2�A\�~B��ɱ��\�\�˩-�et\�\�\�|�!� �YX�c��\�5k\�/\��P\�\�\�bԋv-c\�J[\�\�DB\�\��L\n���_d\�%\��\�V\�{n\\�I�X=�k\0	4b�\�ɛ�>U^�R���m<ʔ\���s�\�3\�\���p\�\�t\�a�qX��C\n�^: Z\04|Jښ�V\��l?r��sKn�\��(\�,\n�	����]Ӈ��*��\��+�\�\�*�\�\�\�_���M	E�iV�į\�h\�y\�R�\�[W~P@Tof,�-9W�	c%9<E~\� �.\�3�1jp�}K��\nDlb5\�;����l���9��\�R�9\�isy5(v\����Tǐ\����\r\�)��}\�`�i*�l\n��}\�\�kif���O�jJ5ĩ\�\�\�.\'bw�:�ԼI�|��2�\�5�l?׾rk\�-\�4x��\�\�a�^\�:0i|\�)S9\��3\'-�m��&3\�?R*\�U-\r�/�*�\�W�a\"���?�\�.�1R\�hΟ7r�Eڿz��\�V\�~K�K\�\��bn\��Ĭ����MLZ�X�\�r�\�֑��#���\'��q����\��\�]D�E^`+0��`s�\\&�&7r��r@✋\\�F�\�U\�O1��v6`\�X��w�c�dV\�3˩QV˳�TK\�\��`�!X�3\�e�Y\"�%Y�\�\�\�AA�o\�\�>	�W\���y\��ަ*�6�������=�_r�\�JV���5�\�S/7\�sU̪��/[J�T�\�¢\�\�Y�\�t��v\��_G\�s�3�\0+\'�X\����S)u��\�\�6ǘ-�\�\�\�\'y[�\��1\��\��ʘmK\�B�	.�\�\�	�\��B\ZԲM̾s\r\�;���T\0�\�V�FeE������UYB����2E\�{��d�&7_�e���\�}#s,�=ņ�!l�>��֋\�\�r:>#�)h`O d�\n9fPڱ�\�r��\�\�x�0E�J�L\\�\0p�XD\�$P\0��gͳ \0�({i��0Z\�w�ATq��h�l�\�l�\�/|��{��2h\�_�\�AC����ϗQ\�\n�%�\�\�7G\rF�A_pk\nAz�\0\��/��R�\�\�\"{�\�\\�U��\��%\�\� ���j\�\�\�\�٨V	Ζ_ ��z�\��k�Nf�g�C~j�\�\�N{3�\�<�\��\�f�+�\0[�yܴ�V���\�)��A2u��\�oK\Z�y�\�\�\�kt_�LZ!�\�\�\r\�5\�k��M���\�\0�2\�\�\r\�B\�E�N%�\�\'\����k�r���LET�C1R�]��\�\\\�\�d�l��l�D�7�\0\�\�}M������W�o��p.\�Q�u�z���S22�\�\�u�l�\�^X\�P?!�}\�\�\�rƅdJ~ ^\����y�(>\��Q��Ճ���%�À�\��\�Ԯ\0��\�������)\�Z�\�9\�\�ۏ� �o敥T-�Цbl�i�1\�\0\0ۆ\'�X<�\�\�\0��_��C�ʰ\�\\���\���HUs��N\rL[2Ҫ�\n�h;b���A��\�\\b�f5`6\�\�\�%��\�\�~\�N\�1\r����\r\��3��\��\�\�\�\�I\0*�\�\�Cś��\��Q)@�\�50-Z�����*\�\r�-:\�m��b�\�Lo\�q\�!B5L!Pt���_�*	:0���\�\�xx�t�\�22\�X|��� T z\�p_��_K���=FR�\\\�ǴM�\�\Z�H��^�p<ˌ6�s�1�\n���U>Ik�9y�����\�z��)\�-|#j�\�_̩u=\�[�M|?\�^������~?��29?�~#G��4�y���R\�[��o\�\�\�\�9� \�/�����;�1�6\�ܷEx�#�TB-_ �q3W�%?��ݥ��ͅ\�\�\Z�s�\�\�Y3�\Z�ơ°�ܵ�7��u\��_�\�+\0σ���\�愰�\�U>*\'e[�G.	y�KeU\�R@\�pG�r��\"�\�\�C⦈x�ns\�\�>�H\�J\��\�B��D\�M\�0�\�\�IEL|a�\�[�\0�~�ԇ7�(.&\�Y\�Uk���\�s\\�b\�aE+\�,��<\��\�v��A\Z^\\\��wݕ4C|��\�a\�J���\�	�:\���u@a*�\0\�\�8���$!\�(�byb)\�]��ji�#4\�K�\�:C�?�Po\�}-�\�\�o��)r?It�Gӈ\"\�n-+�5\�p18�\�y�b\0`-*\�e��}L@u`:�O\�)\��HV\�\�=��E�%7)�*>�\ni}�����\�O�,kb7H+�!�\0�@���~\���75�D�k�>%T��Ӽ�(\�c�櫅*���aF�,}Nj\\}\�l\�-b\�\���B��t\\�g5/e\���-Kv�����2�^�@��8�we0\�F�.�\�\��׼J���\�?\0�\�6\��O�&9�����Ӹ{^�����NP�b%���\�3?,Z\�\�6f�uǜ��/8ct��j�Py\'�~�\�JE�\��Z����\"�\�!��,S�q\��\�\rQ�T�\�6�J�\�q��X�\�FU\�Њ�\��+�\�bc\�\n\'ɚ~%Ul�f	�\��[?s\�D�\r1\�\�TA\�\�\\ܭ\�3���BW_z���\��~�9o�\��*.�k\�0\�[n\�\�\�1=\�T�lx\�,�(\�\�?_0M��M�\�\\�r����pb{G��#��,�ʕԮ\�+\�\�r\��\�H�o\�\�\�P�\�\��Ȁ}\��`����ߜ\�hm\Z��%|\�\�\�Ed\�\�jj\�	\�%\�L�0]\"\�\"�\�\�\�0,ܶ\�;u31*/d�ʕ3X�߄�T�Z\�?\�����\�\r�Z�\�\�28�XO&�f\�\���C�0;��Jp_S\�d	9�7�\�jh�\�>YL�)��z\������\Z1�ϲ\�	�4���$\Z\�y37J\��\0�%TAW��R\�]U\�\�KIH�sH��e!�\�v\0\�\��\0\�V�\\5��\�4<G\'HSr\��Z\\�ĿE�c�0Qg2�mBtk�K��Pb\0�>|39>\�\�^�\"�`�Yr��[,�\0Z/�\�?̂׵\���>Szq��<\��Q\�V���._�X\n&B.�\n8�c�bQBw�\�c�h\�\�\�Q�\�\�\�̲�\�\�J��X~`�\n�)�-�]\�	p�\� &\�\�\�Bw��ϱoS?IK\�?16*����ҷG��k\�+\��\�`N`�tN\\\��j66�O���)p=�{\�\"�<?U�\�C)���т��8�m^q~?\�\�L�\�\Z\nrѿ���P,8���+ͱ	XOjX�{��}M\��\0r�c�Gޠ\�\�(\�A.�C,�]S�}�qB\�\�	��4N\�\�^ŰR|\�cN��fi��\�\�X�\�\�\�Z��ħ�\r\��<d��˿4\�#i�˫��]A�T�����g0\�Q)W\"#\"�Vz��\�,\�\�\0h�\\\�\"<\�\�\��,��`	\�Z\n\�\�/7+\�r��>g1\�\\\�H-VP~��[\�\�q\Z\�\�\�_\�4f���\�x�]J�.��,��W\�]���q�+i��\�F\�n�`\�˯��V/\�)]���\0R�\�	�K��������3SYg\�R� j�VV/\�b��V\�\�5Vk\�-�T�%\�{\0>\�@\�\�u\�XBYt)\�\�\�;�\���H�x��O��P*�C\�6D\�I�5�c&��\�\0,\�-q]Lt\���8\�毨~j����\�c:��\�9O�l\�\�����\0Y\\\��\�3[��\�\�)W�L�Ge��������\�z],�\�^��?�\n\0v\��e\�#D�\���2\�4(+~q\�H�lτ\�ܿ`8�J\�v�u�V�Z\�}���\�mU\\d��\�ܝN\�\�?mEPK\�v�\�ȍ��\�?3P��S\� \� �6X`�a\�x�\0โ\�㑘)n%�9ܬ{�\ZO}w�h�L\��\n\�.\�\�\�\�d,=\���\�\�Y��ÜTU^�ڕ���8*�s�\�N�\�eB�?�P�%\�����`�=��k?q\�J�7?1`\\�i�6�\�*Հ�>!,;0��\�mA\���r\�W\�G\�e�5K\�|=_\�3�\�d8?��A\�����N��\�@���ډT\�\�~���b����{33�C�j�a*\�����xf����V�D��\� \�H!w\��f�\� �\�^��Ǆ>�\�*%j�kٳڦ\�/W\Z�Y��@�_hۊye(�L\�\�k��$���>@X�|4\��a\'j�\�r�+J\0�)�.�.\�<G̋}���a�\'QQ~ -�\'�Odf\�!�Q��E\�G8ؤ��\�\�\�9�\�cF�\�Ԡ����\0ɜGd�\�x\�\� \��0���M���h�\Zv�gRf�\"x!3s�\�\�6EQ5�\�6m@F\�;\r\��?\�\\,K��\�2\�˕R1G�\0�w5L\�\�T��\�}\�kJ�\�Q4�ِ���.�n_�\�Q�B���,yK}�b��\��\�\�#\r9h�.WF\�Hk\�Z���\�${��\�\�Ga\���\�\�\���f\�b���\�\�k6&c\�\�\�ߐX�X\�\n�\�.\Zm�\0+�b\'���\�[�\�\�\�\\\��ч�w� \Z�G�(^�\�\�W\�1Bge�pJ�����0�	9�`}���\�EZ�)`�{q\�\�,v�d\�\�� y!�\'�[�\�1]�/�\�b\�\�\�nH�\�: �:\�\�_\�\�[\�2�o6>\�SpW6�\r�D^1\n�9d���\�7dz6%!���<��]0HG4\n}�6R���mx\"/6\�U\�t\�*ܨ��\�AMj|m�\"%�c\�%�\Z\�0{��Aw<I��\r��~��+cҦ7(sJ\�\���\��A��%LF,�ǂ��bCl\\C-\�\�\�p\�ː9�h�\�(\0|�/�\�le8n�;\�)�\�{j�|CXx\n\�5��}n$��\�~\��[ޓ\�Za�\"ɄS+�z��\�\�5\�*\�x��2\����\�E�����G\r��\���2��p�ܺ��{5cֽ�eu�U*��7�O3.&f\'\�tSZ\�k\�/J䌛�ƷYG6r#\�LSq�\�\�V?��b�̜�W�FlՀ,��7�ᗸE.\�1R\�\�-�>B\�9�w�So�0P�\�{/\�\��\�,\ZdUY�cz��;\�w\�)\�j\Z�\0�\�\�T�\�s/Xo�K�\�*3-\�\�\�PA��\�)q\nX\�|P׼v\nY)�/P\��_�\Z%B\�}J�&�x��b�.\�T�2\�\���O�\\ˋe\�c9,�J\�纻?�{,~c�#�fM�\�7E?g2�^W7��pjE�J_ie٤�v.�Û����\09�^����\0Tޘl�6W2�u2w\�<�̡vl�I�\�\�XP�\�\�\'\�U�&\'�6}\�\��_LQ|#\�n]�w\�Qy�\�S�[�\�\�c쁻�Qo\�+\rMxhx\�;7��5g\"rL\�Bd�8bTm\r�)\�0i1F���>I��O0\�`��\\\�\���c���E�n_�\"ˠ����S�\�q�\�5\�<�\'�3��Xծ\�G��^�_�R�\�Q\�2ƾ x=SdiI\�%\��KTV\�v\�7+����{\�\"dU��ء]�Ϋ�p][Xt\�~��\�\�)����\�΋��Y\0*<�(\�F��\0r��\0\�q\�-�2���F[���\rC͚e�e\��\�!\��]�0R\��d�\��h\�qA\0�\0lS�y��&\��B9j�5y\�U��\'\��f�@s��\�\�\��O�\0\�u^��\0�.\Z?\�\�Bj:�\0\�e�\���]�u\�\�]@��\�,���\0R\�\�u��9U\��\0)��u_\�3Ft6&\�\�-���u�1H�ˬ��m62�1�?��\0�\���?��\09~e*ף\���4�S/�Ko|X|8|(|I|HPB���\rh|1�C�Ɍw\�0Uk���f8v�������o���+��\0�\�|�1q�\���\�j[�\�I�\��Џi�`?�\�\�\�\�\�0\Z�����u\��\0\�Q�\��\��?\�\��\0�\�\n����\�6�}�u{R\�\�D��\�0[� \�-@���pŧ\�\�\�\��\�ǶG-\"Qr386��f\�!p\�X��\�E�H����`\�P\�~H\0\0Z\�B.\��\�\"\"h��\�Хy��\�g�`\�\�`�*r\Z�˳f8�r*wQ��oD[oQEڞe\�����G���\�2�8\\\�\�l��b�\�\��\�\Zg�aE�=AVk\�!m��S��\"N_\�\Z��3.`\�\�j\�6ܩ\n\�\"�\0bVו)]��V��\�Q�2�\�\�\�\Z����\�R\�n���7\�\�=\�\Z$9G�?#x\�bz��Z�\0\�%J\r��W�1s�?H����0_�ϡ	^��\��P�Ǽp\�\�XB~G���BT=j\\�9K\Z\Z�J�\�:�|At�\"�P\�\�*l\�4\�x\�c�ŵO0y�T�(\�\�-Yvs*�q� h�\��\�7\�2���\�lb���\�÷<\�*�Hŏ<\����[\\�y�2�wb\'	2���(\Zlh\'�B\�NS�\�xJ�9\\T Ƕ7,�WcI�p?\�P\�[#u\�/�i\��\0!\�\�gӊ\�6����_�\���\�+zߡ[�8<\�4u\\7\�u���8F���)\�\�\�eBl�\�\�\�}\�/�\�=j~�gq�U\�\�8z\�z\�~\�\�g�\Zb\�6�i�\�u�&\�X\�X���\�	P+��\��F�>L\\d�m����;Y1�9�al\�]\�\�\�AY\�.3t\�\�!�b(wۊ�utF�ԕ)\�\��.�T�<�%\��Z\�\�-�G9j.;\�l\�\��2\�\���1\�\�\�u����Usu�\�H-^�h/��:��\n\\�\�Ī\�\r���\�#zL�0���k�Z\�0�\�$	���&M\"\�K�\0ϣ��`�xc�킇o�C\��E-��}E^&_v8�ee2�[U�\�lE\�I~Ǜ\n��b�\�LֶR\�!2��0#��\0��M�Y�2�\�T=B��i�g�\"�~P;@ՅZ���z`$G�J�\�X\�U�\�?!�2�\Z|\�.�QE�m2̭����\� ]�Q�M\��{.�k\�\�/\�:�9��\�X�1r�\�;v\�k�qEp`?�!�a\�\�`�\�j\�(��6?Mq+6>&F;CD�ն�%\��#j�u,\�Nj \�:����Ԫa�P)^\�\�2\�N\"\Z�-�\��\�a*dP�\�1w\�	a\�;��|3Y��\�ߣ��\�1�\�;\�\�\�\�P��\\P��46��\�̭\�L\ZU\�P��\�S\�\�ap�Fj+�>�\Zqx� �8Z�<�n\�\�M�\�\�X�M�؝P�\�\�Bǻ\r =���\�ĳp\��_\�\'�&��x\�㹟34k�O�\n\�r:&��\� �����3��ķp�B̈́\��05d��o\0q$@7��<��kˈJ�\�\�:+|��8M5�����\�����\��r�\�~�5\�b�g1M\�\�%\'\�6�c\��+@K\rG7/�\�\�r�\�\�ݱ\���J\�B\�,\']F�n�1c�9D�e7v\\\�	�(�\�\��\��vJ5	�RM\�\�\�PE����}5/\��^\�~ne��\rz%A��.[��b3����Yw\�\�A�m�8$̺s+q�\�\�\�K\�e(\��ןc\'\�\�L Ҷ0Z\�S���1�\�\\\�~���� 	_�V�~&/\�`\��w-��\�1m}\�Yp��X~/\�	m\�\�d\�͞`\�\�̻@�\�#��f�U�+-��\��X\r�&�B�c�{�)\�G~�\�:˲�\�]\�C�^Sg7��{�M�\�#�W��\�w\�\� 0�~��L��R\�.�Oı\��2�\�m\r\'c\�K�����N^49�-y�]B4	\�� �-Vw\0Z\�\�%�Ut�\�Vĺ�:?�h,	~\�i\�\�k}3�M���\��1,��b���t\�:�\�w�\�*\�\�9�_�c���~\���\���\�E \�\��G]9�0I\�B�x�.O��>j	U���\\\�	l�#4�x��Q)�\��EW\����J&ǟ&`�[\�_�\�,\r�\n�\0\�\�K\�PTT�L�ٵ�\�Bإa����8�\���\�\�a�\�# 8oqU\�S=\������1��\Z�\n-\�]�8�\0�,qy�� vj�0ATQK��\0/\�\�R\��\��\0^\�\�6�S�\��\�{�\��Y�i]g����\�ڡwj\'%I���m��\�\�č\�\�O�9�Qw�ѯo�fåZs���\0\0J!,+V��.�\�%\r��@�\�T\�%����\�\�(h\�uLF��y�id�c�\�R0_�4\�\�-�Q\�l�\�\�Y�\�\�U#JSgi�x�\�_�\�Q\�`�O�6}\�\"��ʦ\�	ڇ��\��s|\�z\�U�X �\���\�a2�:�)\�\����K�\�}?\������\�\�	�\�s�� �_��\0ꕅ\�\�n�^7@\�J�\�~#�6��\�2���\0Qm�\�\\\Z\�p\�x{�\�(ܢ�<\�\n���Ƌ\�p(Ч�Lzk2��g��\�s��r\�C�G)���!\�\�\�|@�H�!hN>�S\�T��~Vlu�n\n�#pU\�\�ġ\0uE�\�. �\�^�\�)�ܿ�r\�t�L���\�\�\�9?r��\Z�EF�Io\�CHQdAvF�QPò�\�\�-��EX\Zv:�\�r\"Hm�5�8���A\r\�\�M�d\0��\�N[��\�\�^U�U\�1\�}o�8��\���{�\�!2\��\����#�\�\�\rs�(O\�W\�X\�\"\�(Tsl^��\r�u���O?�\�\n7t+Zk���h�&��oO\����\0��ZY�\�\�K���X��\�Y��2��]�i�ݝ�I��l/~#pb�P\�(ɦ���M\�dFQ\\��d�%�u\�Ĕ�]Jp\"\nJW\0�F�\�\"@!�\�\�G�\�]1���\�x!K�\�`$\'#\� {�W\�c���x^ObQ$\�\�BVQ[�\�P\Z�s=\�C!�,j��\Z�ܶ\�\0U\�h\�n)��y�\�YҪ�T\�\�j�uY��`-�\�3\��T\�\�\Z�\Z�\�\'��\�h\�\�Ǵ\�gH+8�\�TZ9�{\�\��\0\n�u\�_I\r���\�~\�z	P	U�\r\�a�>a��\�\n�B�<��\�}crø�`��Q\�-�~%p�\�\�\�\�b��yO�}E9[�\�_����;N\�ӏ�\��\0�`\�<��\�\�r\�\�US5x\�Y\��\�Y�Nǝ���\�0px�\�fa\"\n\�\�n�E�Q�\�^�^�xh�E_�p4��:\��s9@>)�\�ŏ%k\�O�ĵag��\�\'�L��#JA\�\�\" `G$\�e\�AK[\�LG�f\�Yߒ\�2��Y3\�\�.\�2\�\�\�v��\n\0�JN\�\�#F����#FvZ��b\�t\�J;:ۏ\�\���E�� ]\�T+]\�<@�݁\�\rg\�b�M�\�ɪ�.\�ƪ�#8=�Il)N�\����~!� a\�=\�_\��Pz&Xa\�^\�C\�?�u�V�\�PV\�c�<�s���^F����t��\�\�|[��\0�A�A��3����AǠ���M~f>\���\0\�I��hڭ��\�5P\"\�(�E`,o\�V \�q�\�D\�\�y�^c�Pp�\�`TW	j^ƥ\�\"�\�k���;4q[�4LЙ�A�,\�\0���V�o�9w�\�KB�vO:xaE���|�L1V�PŇ�P�XqZ�!�\�\�r���\�6h5c,�\�\�R+T0\�Z��|�͋2<�ԫzX,\�\��q\�`�\\J�˞���������O�1\�\�͚�J\�m�r6��\�kA|�\�D�+�\�9��f\�y��\rB��/���?\�L�{J�c+�q\�\\��\�\���\����F�[m�k\�-J���*\�@ۘ�\��A��Q�\�\�f\�pJM\�7�\�`�\"eȇWY)R�Üd�s��~\'\�?�z?\�H��5Bw��b�g0f�\�a��j\"ع�QP\��\�LS,\�V+qݐ\����S\nm\�s��I3Vo6�\�\�>�ˮbX����a��\�;Hʡ�e2@b�\�\�c�� 2�Yu\�\n\�e�)Z�&\�d\�E�m�*�5^Xh�#gA�J�\Z�(:S�Xl�Ĵ���1Y�J}�\�\�[_H\�\�ԙҸ�7\\33��1\�၌�\�k�j���e��\�J.<D̙\�\�EX;U\�E1}\�)�E ���\�\�w._��Pנ�\�\�\�\�g�_\�\�\�u?�\��pdA~@�Ѕ\�\�G\�Ř5\�ѯ\�\�1ʆa	ŕ.�+\�\�\n�(��\�-����Z�Nl�J�\�%\\�G��gΘ)��!t�p��^\�m�\0\�&(>e\�c܃]\�\�2>ȧ�&[�\�q{\Z^�\�\�9`(��\�!+\�\�0]�Υ7���\�\�s\�T�Jg4	��o\����K\�R��2\��e\r6��u�\�e��\�\�\�\'�TT�w+��C/��AA\�>\�9�D5�uZ �\"s\�\�\�Ŧ%�X�\�\rC\"�}@,5�:ܷ@]7)0�\0\�+e^x���\�+i�@r��f,�\�\�5e�\�-#�e\� \�\�a���F\�Oln��\�Ҹ\�Y�bU�@=)��\�f�1�!�#��\0�&I\�7z�\�C?�Q%\�\����W���N0Y�\��9���#l*�\\��t@\�\�u�,��Ɓ^\����\�������\0\�`)X�\�\�e��QB\�b;q�\"]8�\�\Z\�7W�)��\�</�\�O�q\�\�.\�\�^\�ԘK\�\�-\�0\�.�\���(\�N\�S��s/owϖ?[k�7\�8�\ZQ���$lb�\�^a\r\�,B�\�05G�b e\�\�A\�\��C��W����\��ke?w(�gȫ�\�3�3&u\0%\�VY��X*\0h��b4[Z^&:yp����\�\0�-�}\�@\�\�E\�D\�\�p\�\�3S�����\0\�U�K\�4��qˀ�S��cu\�h�7�]T7|\�\rzjD�9��zc����2\�\r?�i&�P��\�?0\�(�\�W��**\�\�v{L3ϠCe\\���Y��Ġ�y���q(�b�\0����a\��٠\�0cs]+<��\�\���p��\0\�Cy���(��0\ZP3�\�c�vqdK]���\nU&s��\�\�\�8\�s\�.\�jw\�勱\�B�@�]\�[o}Հ_�p�WJ\��\0P�@���am\�,B\�R괔�u�\0{L��b\����%\\��\�o�ά�\\��<�����C\0\�\�~���,_hy�\�b:\\D=�0m_U�t�<CH\�右϶\�[	�\���%,˛	w)\�\�\�{���,�\�%�=Px6�-�44e|��\�\���\�-��6�VeZ�!cܛƬ4L��Y̩�Gj0\�~\'�?T�0u��n,�z���z^7�ꢭ�qbR=M�\�9\�\�8�<r\�ώ\"�\�n%�m�c�ibS��>em����ʢ��P�_g�\'\��\0[dQe�d���IL&M�[\�eZ\Z\"\Z)k�Bgg-Éޭ M�9�\�\�hUr��7x\�e\�\�=\�FyS�j�f��¶\�3�aM߽0<\�:s{Cw�!\rX\�1r(0\��9�$<ZV�\�D2��Q\�8 ���\���ȗ��\�V��&c�Mn��n\�J�\�\��	PdF�bZ�Gkʇ0��X ��?pıB+�7u�\���\r\"8��\�`J��ΙG��\�vŋG\�|\��e�\������b6�{52�=\�p8fG\�5/\��\�\�㱨73��\�\�I\Z=��o0﹀��x�EQ:;?\��K�W�%��+-H��\�9L�\���Z�`z�\����\�2�J�#��\�\�rʄ\�OGg�\0Q���#��\�2^C��cWV|�.;\r���	\�i�E*D�3�=l��ʃ!]��6\�\�~%\��\�\�C��\�u� \0��w_;�=��T\�dk����2M��P��aUqQp���\")SaAjep\�\�c8-�8��\0]\�\n�Пl?,K`\�L$�\�!�f�$�����w\��DKQ\� \'�%R]״�hW=J\\+z�ͷ\�bu\�9\�\�6\\�w\�\�\�j\�7Z\�2�`\�\\MOn~�,OL����5\�3\"\�Pյ��W{*\�x����`�\�\�?��j6\�u.p�\��\0q�YԸj\�J�Eɬ�{_\�oO���پeD6�8m^`01\0\0{sڌJGh\�tJ��r\�H@�G���3��|\���\�2̐&�\�\�Q\\_x�\n\�\�Q��\�\����7k\�eY�\��7-\0g��\�˙�\�\n����U\��̶\\�c\�r+�\�\n\�Q�~���c\nK\�*�\�\��L�Vp\��\�\��\"Z�\�dV�Y\"]�bB\\{`�\�����Pʎ\�:{@u����\�\�Q,\',Tqj\�}\��A|vF�\��\�5�=�BՎ\�x�*.\nodK��\�nP*\��F\�\0\�17L\�7�e\\����L�\�~$y\�(\\n<B*��c\��\�\�\r.�\�\�|�\�\�\�\�ҨY\�?`~eHE@Q}\��@��p\��|��W�̞#�\�\�m@2l<LBrP[KSX��C�\�\�{�Fgp/\�\\\�\�\�N�\0�U1G̵,\�Y\�O�*�Ծ�0	b=�E\0pCT8�c\�_Z)�P���X\�Fd\r��qBb�!\�\'nt\�\�\\\�	˞ �Pl4�(�8\�;|�]E�\�כ��l(�sg�\�yT& ��0�1h�\�Tm$!tK�lN�&�t�ߒb{�\�\�eJ�.ǧD�da�(�\�*b3�\�\�mj\�~�\0H �7u6�����W��\�b掱̻�\�xh:Y�>�UQ�Y%�B��,)XR!m�\0\�T�\"/(^�l%�U m\"�MW_ܢ�j\�,>fjaO?\�n\��\���4z8e�Dt\�K@u���Z�\�qT4\��9e�!�b�4C\����\�?T\�\�\�F� �j\�P�f\�k�e�\�P\�\�\�h\�f^q��P\�Я�&%�~��~}�@!��$\�\�h{\���[�ށ����솧\��\�\���P*�7{T.�WQ�\�z�HHKsl�W\r2�\0n	��Xqp#d*����l�\�Pȣm�s��.\�\�T\Zjw�k��]M\0�9�|J2��ʴZ\�yZ�\�ĐЮk\�#ik�\�\�(\�CԤ�R\�ƠM%\n\��1\�E\�\r��3\�\�\"Q�y���+���?׈ZDQ|mF\�\�J�\��bB�,6\�~fV��!H��$&*텕\�\r�]J\�O\���\��\�9�-8��P�桘(dG�\�\�\��\0�iRUj���yΟ\'rق�7��`�k\��SzQSz,\�j[5z\�\�\�⼊<V1Q�&\�m\�\�	UEb���+ޚ1e\�3\�q{f!N�`P�9W��\�6�z��-h.\��\���`��4>�/)B�r�D�uqi8�P�pJP���\�Cg�2\�qV\�!W,-ł\�nT��+^��V>=�^>\�\�I�\�g�o\�i)k�.�W\�\�)�g�i\�^\�\��\"\�17���0D���\�O��\�\rj�\\AxS\��*fH2\��\�T\rS�b\���má6r\Z�����-\���\�^V{���k�\��P+Cw}\�0�L�?�d\0Sam�\���]p\��\�\�I��\��5i�\"\ZT\��\���#f\�\�-M\�}\�V)Dv�cD7_�[?�N\�E\�9��0e�\03�yS�\�}\�@�)gr\�lϠ.�i�nºk�\0\"+�4V\�\�;R\�a�j���\� 4u�q�1�r\��@\�]ܱ\'%\�r\�3ܳa�\0�9�^(�` �.;\�,\�\rЭ��T�F��}K�Z�����K��b�\�\�C�����!��IBEnH\�\�\�\���[6�\�\�1��q��ˋ4��\�\�z�}�\\\�q���2�\��D)�e�h.��\�rݬ�Z�ܫ�LD\�q襢��+.\�$)�i8�=����RY:�����1|�:\�ba\�V\�4\�\�\����G\�\�7T\�${�\�-k\"�?�����\\ʉ8YUe��Tq\��d�[ܪՎҩ\�<��n]J��\�pYp\�ǂjo�\�e�8�އ\�/�`\�T�,*��\��\��\��\�dd\�b\�\�wEO\�i[WR�W��<\�\�[!@x?\�V�\�2\�z`\�\"�1TV9`WG�\�a$���̴�	�)v\�u\�0,�)E��IR�%�\�[�0\r�Ս�\�p\\<QY\"�Q`Ә�5�t��D0\�w�\�o-/�\��\�)�\Z\"\�,z\�&TC���Ml��㽎x�x�\�\�v\rLW\�3��\�*��χ/��ɏ�\0h�\�jK�.\�\�_�e\�\���C�eq`�z�P[	�Go�\�X;�h�lV�\�vʐ�i�\�jQ\�56�P\�dyDd\� ��\�1jy\�6�\���eM\���\0\�\�(�8�b	y\'nV\":e�|P�\"�\�dd8�Au\0��y�\�JN\�`�\0Z^kٹ�)�3���-T�F\�\��d烞z*�A3[/|n2\�+Rn<\\�����ǩ\�\�C\�1���c\�\�\�\�\�4P�\��3�\�-g���\'9k\�Sm�_�*\�\�g�*`ALh\�\�\�t������Y�fCG\Z���R=F\�i\�~^m��\���\n4\�\�\�l\ZO\���6��F�\�$:H+;z\�_V�c��-W\�u)�K�c\�\�oɜ�k�\r���Z\�tn ���km\�\�,	d�\�\�w�FM�\�\�\�\�K`8��\�E66<T=��\�6ېŃ	�\�,���0�n\�t��{sq�y�\�S�\�>�[�I^�+K�и;�\�2+�\�\\�(C�\�f��n\�\�C#	q��&�����\� �\�%E\�40\�\r�\�\��RX����_�\�%�+�\�.X\r�\rg�\�\���\�	R�+9�s\r+;�_\��L�/��Q\�a���3�V��R\�\��{��,,\�\�/��,����P%jv.�ĥb7n\�\�\�\�\� \�̚���V�%�[[\��q=��0պ�c\�	�\�SQ\��i״\�\�=K ���\�R��y�j9 �\"Sx\�\�\�1c;_*P\�h��\�K\�r[%\Z\�.��,��r^\�+���\�cԭ�\����\�\�\� \�\�LpQe�\�\�UYN<c����+uU\\\�%2�R�(2�򼻧ͽ\�z.a遰\�\�J�\��	�\�\�\�Q߿�,q�\�\�ф\�\�%J�p��\'���\�M	,`�G{�Ew2ER\�.5i�٘mV+9���Hch�\�\'�\02\�]\Zۥ���6�^ԿO�^H\��q��6YEڼ��ɩ�\�\�X9ҋ|^���ouhb�{\�0#���\�5\n\0~i3\�U\�Dƥ\"��}�hc<�GvicV����\n�2��en3��D\�^P��\�\�Z��	����\�0G�QZ{~�Z߼s\r������׼�P\�2��j�[�_�3\�2\�ƣĳ��[�R��,[�B�Tc���4P�\�qe���Z\�0؀]	�C\�P��uZ��{1=$\n�\��\\�[lK�\�&X^U��\�s�\�\�\�P\�Π�\�ѻj��mbFe�\��l^6��mښ�\�_>�\�W=�]\�\�\�S��oֽ\�J�\�zrFx�d�<6{C�\�E2�^X�\�\�R\������e�\�\��2����\0;\��3(\r�݌p}\r1M\�_p�\�;	ݾW�Êp�<(\'��Kb�%4\�⺂`�n��\���\�Ѭ����\�!\�$�\Z\�\�-�\�P}/\\\�Z��.\�j���\'�`���xG@�\�\��~�</�H�����\�A|`���s�W�\�	�-w/T\�F�(S��\�f��L�b�O\�p\�ܽ\�pP��ߣ����B�@mz�\�\"4o�`r��9�vpC�u$y\�\�\�1Vߜj�A{���%Q.֬\�[�\0z&,Qo7��jV\�=¿T7�\�1@/�J\�\��\�%\"�7��^$�D\�yU%�����*�X(�k�r\�L\r\�_*}��t̤Fk��ctio;bW8\�7�.\"���̸>�\�\"\�ty\�\��ׁ\�$=\�\"���M�\�-�%�P�M\�\�\�=�\�<GOа�\�k�*\�\'P]A�ǉ\��\�\r2\�\�A4�6��/\�\�\�M\��\��(�\\Bkh\Z�\�W\�\�,�/6fRrY`~ˎ����Z�\�\�	�e�W�x<\�0<��\�\�\��hP\�\��\�\�X��Sw\�4\�\�NqWf��\�\�<߈\�yh9�r�UK`\�r\�d���\�\�U�q�W9\�\'\��(���~&s\\��T��J���X\�z1����TJ\����)��&\�\�;�;�.{2�\02���\�-�Y�\�mqg\�\�+[\�����\"\�\"J���K�\0��@\�\�i\�\���g�<\�=��hU��Կ(n\�E�Wu�x1�,7��\�su\�\�&�Rᬧr�֨�KEy��\�M{�\n\�W���Cph�Z!\�H\�6%f�h։r�\�[i�l���e�\�9s\�v\�mm\�\�x\�kl��0�K�ϣp� \�ҽ*$|�\r�h�\'L�(\r\�\�\\Ja%�\'\�(Ù��J�`hu\�\�\��+\�@���\�ը|����8u�\\�)���\�a�\�8%�\�,r/�\�?\�h�_\0��*��\��^�\���m�yY{\�o�\���N\���;穀|�Z\�\0�\�\�\�\�c�Rh\�f8O��\�6��\��Yx\�2�&�*��ī��\�\0�\�&fȄ(5\�\����H\�\�\\j\�ܪ�J\�]�{=�1! �i�\�\�\�\� �\��8�}\�,)_����x�/i�ޭŜˉ�|�!�X��2Ǝ\'<��a�q-X\�Q�\�+Q�4<ŷ\�\�ۼ�\"�\�/\�\�\�MN\��\���0�x�x \�D�5�~q\���/�d#Df�����-�y[\�<�GF�\nR�m¤<#��w\����\�j\\)\�ޥ�=�����\n�۩y\�#�\�*\�(�\�*a��Է�V�˝T���\�\\�V1��\�/E\�D>g�8\�w�\�ߛ\n��Ό`�tE\��9c��\�\�\���<G˷������Y\�$>���!\�W2B\\\"\��C�V\ZE]\���\����\"���-\�����]�O�lU\�\��\�܁���7\�_\�\�\n\��k\�\��%��ʸ�ʡg\�\�\�\�1\��\�Y�Y|`鄿_�~\�Z>\�A2Y��˹U*2\�\�<Ev]n)��\�̍WM�\�\�/�&\�\�\�g�_Ĺ�[�s�Wx��ʰ\��Y�W�5���6\�;�*�e\�kvts�p�Ҟ1�\Z(�g\nw)0f#\�W��5n�l񌚯2�	U���ѕ�\�\�(l)�CO{F\�DX��?\�0s�!\�8���fX`�+h�\�>\�i�(+�dm�b�3u���E\�nY�i�Bͅn\�\�ĺY�\�\�9C�wL\�EA�Ǽ-67o��� �$.\�\�m?1!\�(NW\�\�g\�]�(B�\�/4�	R\�&/\�� ))<��⒌��!eM�M\�lR\�	\�\�\�M\�@�����\�+�k�p{K�nᨾ㨗�\�F�!�B�_B���K�d� \�\��|�\�\�fʱ-w\n�X\�\�3�\�\�f0[[�Y^ӉMN\Z�/�\�\���C�@�u���-\��َ3����\�>�ŗ����y#\�j�\�o\�R\�`�2ZM�Y����9��\������f�d��i\��JH\Z��@��\�A\�Ѫ\�b����\�\�T6 ��o�6u��\�-���y��E(co9)�\\A\��L�6$k0%&\n��8c@�\�@\�\�v\�L̪V\�,�R���\�^�k\�\���\�#g\�z�Z\�\�\�y�$@]1�3�����ïG��\�TՄ}��!�\�w��\�&�d�i�s\�{�6]�\�z7\�� L_6\�>\�\�b\�\�!IW��1��y?.V����h\"Z�e/=\�@�\'n9�<D�\�K��\�K�\�Lyx����%�\���h\"�\rҋU�o8�l�\0 X7�_vkLF`�\�\�X���\�\�A^ �\�R����9�\Z�&�\Z��j\�wĉp� \�\�ĸ2\�\�&�GSI�z`�\�56BU��96,|0ZE\�Pi��A\�g�Q\�)�\�\�t\�\��\0w5�V�\05h��o\�XA�\�\���oO�]G�@˹u�7�R�Pt�{⵮\�\�\0��-@z\"�;\���̻8Te����[%\�F�\�\�\�±�\�l�oA�*���@�_,\0�\Z6�#_)wUN#A��w<�\��\�[擦/��)	(��\�^!����=���\��U^\�ܥPaO#\�\�-@l�k�[\�ۂ��E�L����\���@o�\�\n,8\r�d\�P�צ{�b�)z\�K%6}B\�F??x2��\0�>e\\i_0 Sq:B�8G�\����|#��q&�8�^�\�\�	\�߈\�]iKE�rY\rP��/Vq�e�$p�s�!\0\n�{W�o:�\�Aٸ\�8�lo�\�\�\�\��x0\�\�\�\��\�S�Q@�g��\�d�)X�\�us\�\Z\�\�F\�0j�\�v�\�Ŭ\Z\�q���R%\�\�qDn\�>�+d[�r�q_\�\�\��\0psGD�\0pxO0\0���˅��\�\�$�&������\n/\��������s8�\�_\�pN:o�z=\���	KYA+��h\��4��s-\"�k\�(�z(Sjk@$h\��\�p+�8���X49\n���\�\�m҅}\�4��[3\��RNS����f|?�}��1k\�V�!Ӕ_��i5��s\�\�!M�\�\�\'\��\�\0aj��Kʑz\�ާ���\0Yil���օR\�W\�\�\�Wu\n�p\�\��W��Cr� \�]b��Mk�q\r ���� �\0�Ej-�\�\�����_Ţ�\".l�n\�\"��\�3iZ\���K\�2�\�Cxʙ\"B\�/A�|�\�ip\"\r��d.�C>\�#u��h�lŸ�0���;!�\�7=�\�\��K\r�\�X��t�\�͛\"W���w,\�\�85���QZ#�\0����+\�6`_��\�8Rզ�Nt̰\���\�\�L���[\r�\�32s,G���\�\�\�\�o[�P!\�S��$3����\�c�]�AE��!\��p\�\�6���C<%\�\�9I~i���pq×�\�7J���C\�rK��q�\�/r\�B�\�\��`���o0\�\�\0\�˿\�\�)���\�P�\�u�\�\���EMK\rD�����T}q?�\�\0\�q\�^\�+~\�[�\����%UOl�U�QW#^\�b��PX�L�\�k\�S�\����KĽXm\�\��tC��6�G����\�Pw6��\\�����\���FQ8�\�g3�<\�\�Z�GP�\�a�Bǅ�\�ӳ;&r\�i�\�wS�y�y�4\�\�9�JH\���3>%%`C7*5�\�īv�H�#h+��q\�J\��U�ΣZ�\�0�㤱\0�+�U\�\��s	�6d�A�\�\�!U\�C�@\�U��`�\�R�U\�\n\�\�g8q:w�m�4\�>.p�m�F��E59D�lHf\�\\Wk$V\�!�\�N��2@\�\�\�e���s���V\�,\��cj��\��\��\�+\Z\�\�)EG\�p����T@�s�\�V�\�W\��\�yX�+j�\��\�b�ܶ@����\��_�x�2\�O��&�\�\�\��B�\0٧8���|*�f�&#�\�n\�X\�\�\�b\�\�|~�e�#\�fPT\�\�^�kQ��?�6#�\�N��s�C��<B\�AC\�,��\�g��c\"\�\�2\\@\�����\�\�4\�8��C\�\'�_�#y\��\�vD��i��� Q)B��p\�%ۈ���\�����]�c�\�*�\��\�\�b$-\�!\�\0k���uoZ[��$\���~\�I�7g��%���S�\�?���Px/�ψ8u̮���)�\�AM9�#\�]	\�\�37�\�.w. Ƕ@\���4�T{\�ʟ,\�\�*�\�/&4��B\�ʺ�<7dd[\�\Z��P\����\�S\��\��*$\�\�4!`\�خ�ڙ)W0R�G\�\�\r\�m�\�vP��u\�ꞑ�b\�\0\�3���Jf��\�8��\��**�=�\0\�Q\�\�\\����\�Ws\n3\�x2\�\�Q\�T\�\�\�\�!\�̻(�\n\rn�e>$|�#�\��zq�-\�\�\�	Sm��\�5Bؖ\�p\�\��\�\��g)&\�d�=0\�UK�&\�e�E�r��.Ý1x�^肙j\�dW��\�3_\� @ ��ye�\�\�>#Q`a�\��Du�l\���e�\�ϓ��l2y\�\�\r#\�\�	\�\�^M�\0r�o��ؿLŕ\���|J�\�k��,o\�%���T��\"�\�\��$\�}C�\�.WP-8%�RW\�ccj��!�\r����-&S\�2��!\�\�0YL\�K#\'�Q�6���N\�.\�銠\r\�\�SZ����\n\�`	Mu\�v�o�|�.:\�6�\0\�-\�P�\��\0�/\�\�\�\�$\�U��\�ߙs�\�#XV�_r\�KgOS63�\�>\�Ki\�\0��4�߼�\�\���Wm��x�\'��n[%IX�a\�(�s9A�b\\2�1#(\�\�Q:0CGq\�-H�ÎU2��\�X\�ˉ��+jf��\�\�Ϩ�*l\"��F@�O�\���̵�b/�a�j\rOb�W\���_\�,\�-~c�����X\��slY�@8!\\,�bb!\r��_�Hlc3��	Ɔ>��hS�\Z\�\�4\�X��\'�x{aOb~豎\�%%C\���ۙ�\�\�\�,�\0*c��\�\��EA�\�ĺ\�\\�y�ȝD��\�V��\0��[\�s\0\���%Ы7�3J\rP�\01��%@7\�v\�Ů���\0dwW�\�/Ԑv\�S�\r|	���p��\n��@x\�\�\\Ȋ�1\�:�s�3c\�1\�1H\�j\�.\�%P\�\�R+���1�#\��\n7\�U\�*\'X���P�[Y ��[l3�s3�(�\�\�m\�(el2��u��Q),���:����ˮz!\�M\�v%�M�i�M�\�e\Z�{!�\�3UwL\�26NN��\�u9�hRY���\�(�^\� ��CY�\�2�\�POy�ퟅ�Q��.]F6ʨ)}E����\\\Z\�i�\�2\�6|[�\r�f%�������5u).��g�T˗\�7M)�D�w�\��]\�r�\�]M\�\� @a\�\\\�J1\�%M��\�\�dBfM�A*�f9p\�\�\�e\�\�7�v\� ,�\\�\�����Fb����\�V�^fCC� �\�!-�\�\�S�T_�³\�mu\�)MV�\�2˥���ĸ�El%��*�`i&�f\�?1a�����?ܶ\�-Ss(bRH2[u�+�\�bp�V�\�eHx��\r1�`,R���\�ڎǼ\��>�P\�<��\��\�\��Ř��ؾ\��A\�\�&���%\�\�\�R�F���p	ǥ�0�mH.�\Z6��c\�p2�	��\�`e�*%N Y)�\"}��\�_7J�*be�LB�7/�Gu(\�(e�N�*p�\"X\�8\"z\�no�M\�J�f�2\��hR\���\�\"U|Us\�e��<@8�op\n!�\�z+Ũ\��\���\�F!�� �V<s\�\�\�;\'S\n\�YP�(�\�Q*\'>�\n�����\�(�\�%@F�ZF(��Tf�\�\�t��ֈ���\'$AW\�\�w+A6����\�	�\�\�z�pP�`����q�E�%R\n\\���,4GFHW�gqf������A�m�\�ϡ.�\�\\X>c�7\�R�\��.R���h){řtJYG��\�\�:�Iq�Ƕ�\�\�IT�\�b3�#s:`ڱ\���|��\\\�72��@\rq$~����|�%#�\�-�ʉ�`H\�)%�f&6�ƻ#�=z��\�~\�E�9}��\�\�*+l`�AK-g�;\�6\�%1a�\�e f(\�؜����\0�0�<\���_D�Dp\�Yi��1�\���\�/\\�����C�b\n���LY�Ǿ*<\��2\\\0�S�ةus� �3P!��j\�\��%�\0;�y{K{W*1<\�\�i��{\�?b\"�ĳ\�^���T�IUг\�b�K:�Yؽ\�L�K.J���qb�U\�\�\����\�d^�����ŗ\0W�&\n\�{Jݝ_0U�\�\�\��%�\�\�X]�\�>�\�4\�[����d�\\j4Jي踅]\�F�U��=�\�\�!�R�\���\�5�\0?\�1p�����G\�mBu�6η�\��i�>S\�ˁ�\�T�o쪁k\�J\0f�X��\�fm�� \�@�3R\�pa�>U��ŗ\�~��0\�S��T5\�)\�\�\�0`\�p;���v^&_0O)\�`B�7\�\n�ǹ�\�T�NZ\�6CW9�F\�*	Vo!�*C\�h�q�\�d6\�\�>\�N�s�~\�f�������\���R�lFl#`k.\\\�ƫ\"y-pk�\n�@t{��\�~\���\0�NE\��\0I]��ϘnS��&F��G>�A���\�Y)n6^\�,EC\�-WPl�\�\�X�	j\�s\��Dơ\\\�Wr�LO�\��%@�dFEц\�	P����#�\�=\�f�X \�|\�p�0�H���{v�%��r��\���\�\n�e���\�x_��:\�(+��D5�ŤE��T��^�\�7?dYrX@�\�\n�gb\�\"]3�L\�t\�\�`�2��\�\��a����\�+�F�\�;��H\�\r�\�/c��b�Ŵ�`�\�2J�z	Ĳ)ML�R_�\�\�c$P\�e\0\�\�kE���\0���z��H\n\�Ms.8\�\�\�d�\�\n	�\�\�&\�\�\�겵����qm�%\Zk���0��Ju��!+�P�#�\�\�o&��W)#�0�%�\�\r8S�\�v��L���\�Ѣ�s3�\�=c��q*B�\�	��`D�\�h�GtWP\r�Df�r�ص��\�\�Q9Uq�K��Qd\�\��\�^5��7SX\0;x��\rT�-\�5c�s��]��\�^\�c�\�\��a\�b_Vk��ʳ@4���+�\�*��2|&1\�*�3)x\�T�+�M.Xxf�\�c�8��]g\�M\�(��Ϣ`f���������K\�4!\�\���˸\�c#�M���\�/�ģ���c\�S\�\����-(/��\��Dtڔ���2\�\�\n��\�n[Pr2\�N\"[=�.�Ŷ��+-��4R�Lʪ0M(;�q�\"�8/d�fD���F����\'�i�z�\�\�Xх�0\�\�\�B#��\�\�\�\��\�� �ĻWDA/��?�)���D#o;�q	)�\�<a���qT��/,�M\�PĠLMs,�Ѧ0���\�\�/2\���N#�,�\�p\�R�$\�E)\�!X9Bi�\�j\�\�e�\�E�D�Ÿ>�\�1\�\�!���_\�\�<j\"\�o�&�\���\�\�w\��*Nhu�[�Ls\�`\�l`\'\�>\�\��ː���n׶zl�n\�7m|���ĩ\�d�\"kTR\"\�\�i�l��ԑ\�-N\�џ��4V���iq��g0\�� \�\�\�e\�\�`\�\�\"wr�R\�b\�U��\���Hef6���\�	�\Z1\�a ���n\���\��\�*BQ/0G\�bB�\�\�l�Al@fݰ�\�\0d�`���x�\��#z�=\�\�*\\}T3s�R�(E\�	U.)u���D=z�\�*�\�\�v�4J7/=\�$�ٸ\�a�\�epа^\n7��	\�@\�/V\�,bj7Ě� .�k\�Y�`?%�\��8�<B��������3�bj�|K��\r�`c)xIT\��:q\"\�\0���7�v)}\��\n�r9����*�w9�o�&��E��{79f|\�Y�\�H�\�\"�ш��@0Q���\Z\���v|1S��\�F0\��.#j��\Z�R�\�߄\�0��v`��c9�@��\��\�\�t��Um\�ޥ0�\�\��Jp�^:`�\�3�����e��LFڃKHSs\�ˋ�̺�>b͋�4\�(*��7G���b�\�`\0�G7�7\Z?A*5pW�)q��a\�D\�\�1���#�t~\�i��L�\�򀰺0>�r1\rE�E*<\�%\�7\�n\�ʅ�ᕨ�H+Q�� \�CR\��IT�a:\�\�,����c\���!\�\�0�q��Y]�h�\�\�\�k�ox�pKA�\��T⠍�Z\�ΰ�˰\�h�l�m\�c%@F=g7��\�4\�\�\�q�s]��M0\�j=>f�a�	k�\�a�:��\�<\\yl�,�#U�ϙ}�6�:��+�\�\�P\"\�V_X�����\�e<\�2�ߘ\���V8�\�\�\�5\\�\�<�\�@�µ2\�`��Q�e�\�׼A�f\0sr�%\�\�ޠ��%f&P\��\'��d��DB\Z\�\n\"�)�019�ۘ\�.%�\�\�eg��a���	W!���\�T`\\9B\�T\�\�+(5\�ߘv7M��\�\�\�;����\�p|$8M�q\0k\�R�\�	�/܆ G*!\\\�(Q���s\�	C��\�Fnf\�2�E\�\�0\�t��̦a�*t\�+1X#�0�י�R�\�CD(,str�B2�`���ͦ`�\�\�.�Kv%lu#S,oS25��\���+x�R��Q\�&d\�pT�\�m�[.,[�>�Rh)��\��\�2G]J\�Th�+\�\�\�3\�\�ۊ(W\��16b,��\\�{?H�n	̻Q�ڥǆ\�.\���E\�\\��\�-Y�E\�z%P�V�\�ɰŷ�\�>�\�	Q5#\�\�}\�\�aO��3j�\�.3y�\rAP椸w64).�̵���4�7\�A\�UZ˅����p4��c1\��\�Ee\�\�҈\���2n��\�E\�\�?DoI�� �UӘ��XD\�8�ȅ:��]ʀ�L3\n�\�Kb\�O,ķp.�n\�\�){\�ͱmk�\�.%X�qq�,l��	�\�I\�u=̶\\;c�\�j.b\�q��L-�m\n�9�\�ľ\�}\�\�%`��q\0%��f�\�\�K���\n\�.	\�H�֬=�1�w�\0ff?\�\�c��\�]Kup���KL?\��ɫU\�r��`\�_W*Z\�Ñ\����\�G�PW,\�I�D\�]Mn�n�G�@\r�Zis�x�v\�\0,sx�^]\��h��,���\�y�\��\�\�W\�%�5,*B+�\�/��`C\�d\r���\�2o�}6G�c7� �L\0>�\�\�Y\�\�1Ha^\"���1\�\�\0��>e`�\�r9�È`Z������h\�\�q�\�\�B�S�9�\�.�c\�,Q\�z�d�\�\0ttC�5ӝ\�G���2@A�x��e�1\�H�o2�Ԯ�����%a䕮�rXCy�(\�\�_��\�.�9�f\�\n��a:\�z���֞\�\"\�T�ma��.=�R\�\�E\�\0m�$-0\�:^�^k\'\��,�L\�\���\�`\�ŒR�#7K\�\\\�!�gbm�� [7j��u\�s\�mߔ�	z�\�![ƻyb��\�36��G1SGWS`�\06˷�P��f�d�[̽�\�Ģ`Ɣ\�\�n\Z�,f,�@|EeQ,�Nf���Ef�\�\��\�s\�&F�����7�P2^l���[��\�W� tdhG\�\��O�E(j��\�[B�\�j�����\�.\\��n���ul� ˏ�e\�\�b�W+�&�/I��y\�\"�%\�\\�\�=ғxk\0|\�J� \\և\�\�\�\�6�\�g:�\\\��\�=��I_��k\�UL��\Z\�\\]:�\�a�r͌��\�\�wC1\��ڥߒ��\��.*\�2\�|��\�\�\\\�:�jmE\0oX\�\�\�(Q.0���H\�]K�\�\\\rJ�i�v3S�L^\�Z�������\'ᇻ\"q\'̶�1�\�}�\'\�^\�l,$|̉Q�87�\�R\�W\���0\�P�eT�2\�\0�\�f\�\�N�l=\���b�3\�6�M��\rRo��\�\��ç\�̌L�a�5���?\�r�L\�K�\�\\\�$fxX��\��2\��o��\��Z�\�\��B-�є끇\�Wd�s7\�Y�\�\"c\�\��\"\�w!�\�;�8a�&;<\'	ԫY�����ag2�\Zqܬ\�\�V�J�Q؅`�Ex\�Ur�Wl\�>�pP�\�\�T�\r�\�\�a�\�\�\�x�eJW��a��\�\'��[��̭�#�\�;�	`IJ\�9���͜\�&x\�\n��\���\�\�k@\'�N����\�]̾e;DP�\"\�1���\�|$\'T���x\0;�\0�<\�X0v�,����\�\������.:��n;:�@�Q\�JԌ\�M\�q�x�N3��A�~�S�\�7��x�I�,�\�+��i\�B\�X��3�ԃ�f:[\�٣����mCX$��\�\�#L�0\�&�A\Z\�NR�̠\�\�\�<Eq�;�		ZR��>�T�9B�&	�H���]��V\�\'ԭ�x�<�bf��\�%��7��Σ\�|\"��H�\�\�$|�j.��3\��\�)\�\�*\n�ۈ>Nطr�[�\�ʵ\�0�!W\��3?��+�\�V\�s(KW9�m?1\�w\0\��4�s4\�]px�\�IH��7��t\�dDOŨ\Z�\�ާ4B\rv.\"�4\�T�K��p\�i�\Z5\\�w\n��\�\�\� -�O�$[<\�2��bg\�Z\�Z\�؇��!\�\�\0Ce����9��\�\�:�]\��,�xs9�W\rXڷ\�,��c�0\�p>}�\\�<J\�BW�A\�׉��\�\�%\�@��`\�yA�g�\�\�9o�\�\�\�8\"\�Z�\�f(�3>OR��,ض^\"�\�\�:̤\�0~ �+L<Cr\�-\�vy�Hb#��\�Qő�\����Z\"��\�-�\�6\�*��\�p4zqE�y�V\�Z\�\\K C\�-P\�\�\\9��I�5�FK2\�J��&!n\�1R\�U0��\0<8�(�}�_3\�a,/x\�$\Z�Y\�+	11��	b9�WĻ\�K\�>\�\ZՉT�ȘG	8\�Y�S�p\��x�%0�x�s]\��۹w�\�7[�\Zc�2�\��ᙟ)\�.}[0\�f�\�H�P\�q逾%�F&T,϶\�\"�2K�)\�-V]wqZ���\�^c\�\�D\�\�<�Rͬɸ\�\�,��́�O��\�|�N\�\ZL�d���\���\�$̭��Dx�[���tua!�8\�g��M`�C,Λ�\�\�1a��-˸�z�\�1\�\�qZy�>N#P9cu�\���#�E�8\�y\�OaD .АJ?�uԱ|b��\�\�\�\�\�Y#F��f�I�Y\���2\�\�w/#��}2X8C�0�0��\�W�����6O��\Zg�OEC(\�\��{G؁o\�a\� օ\\k\�\nedvU�Ê�%�Z�B�	�&(2��]G�V�B\nc:W�\�\Z\�Fॳ\�C��J�\"�\\Ppq,7����\�XŎeq\�6\�\�.�\"�Ŗ`y�Źay�VqFǑ�:�ĖV$;\�[s��A�\�DS8A\�+-)��\�<FX�\���R\'	^�\n\"\�^e\�8�\��?���P\�\���	��0��i�\���}ȝ�}�`�\ZNG�Q��d�aL�^be���\���=�]Lc!���\�3�=\��<7P��q�qK�D%�\�6�\�J���i I\��a�*\\TJ\�K*f6��Q{�k�B��ľ�ǣ\�,NzE�h\�Ã,ýsd\�E�IfgNr\�ls�\�g7����^#0ߖ�勘��-�gV\� x���u�\'$\�\�\�Ӗ_vZ�b\�=\�Zӱ�\�񆢼5��L#��D\��s;�ua��Ŧ̟\���@�\\�$�;�`Y	��?0�33���K\�\�|w`VA6����s�\�q\r\�\�#L̦A\ZC���\�<��]Dݳ��w�@[<\�\�R\�P�\Z���\���WG��4��E\�\�#	U�\"*nd\�+W�\���\���2�ce\\��pƘ��	��yu+P+a\�qS/&p\�w(�L=)1+$�e�]�b�@�-\�,\�v�^5	Y��\���{�D���\�-\Z�L	�aU`�\��B�\�W�%�\�-�1Ő��\�y�2\�\�*\�����>%/W�\�+\�E#8w\0\�ʴ\�Pb\�54q\�Ĳ\�?\�t�ܕ����D\�J��G^�7��\���-�K%x�e�oh�s��d,����3eUJ��	wm+c�z�\�\�@��ծ\��Z\�	K`�\�m�g���Q\�����-J�B����/0e\�c\��[����q\�w\�U�r싉�p���\�s�CD�9_\�2\��/Liį�1V��`\�\�f��\�r\�-�9��^fn\�M���.���\�q���L֥\�d=���N����\Z\���\�0\�\�2\�\�\�k\�)\�LS:֖�\�\\\�\�\�%zd\�x����㷼�\�\��G5�X�\�\'\Z\�(7�\�e�1��\n��\�L119 ˧\����3�z�\�F�+i���aELc�\'5\�oL^\�̲�*��D\Z\�\n��%��\n�\�ׁ6ibvD����ԙF	R&1\�\�Fi\�Ʃ7\0̹�\���͖�i\�\ZD���bX\n�\�\�`�\�~�-\�!@\�!�L�\r̖\n�\�\�k�S�I�\�\�\�\�� -\�,>Y�\�Љ����8h�7�Ls�,?\�\\V�\\x�\�\�U\�hn9!Ǒ�\�\�ԥ��o�ӎVv3�Kl����HOHQk\�p�\\\�\�0ߡ�\���\Z�rR���P��$,\�ܑJ#�覂ivZ�O�^�\���m8�3��x���\�ZZ`ZK\�\�K��&8ck��\0�o�\0\����9�\0�5\�i\�����\\���ٚ\Z\���\0�\Z�,v��y�p\�-��@Z\\f��O\����z��A����զ����pn\0?+�\��\�\�el8��Elg��\�\�>��\0Nj\�1�\��Yt�\�q\�\��\��%.DXd�˰t�\�@\�����@T\�(�^�2ђ�`\nA>hȝ1��z\�\�.��>��(\�Ħ\��d��5��\�[���-x\�;#\���\�\�2�zx��\�\�,���x��2\�\ZȖ�ֻ�͍ar]\�_�\�W^f9�x�\�8-���m�x���xr\�\��\�c�\��\�\��\�m\\odP^נ��\��h��\�Vz.�\���^�\����u��4I~?��²?\"O\�2�3���U_1А\��e\�\�kW\�\���@\n\�{�}���]\�4Y\��\0\rir�w1\��\�������tR\�W=\�3o�_�؞\n�9s \�\�\�p������?ᡩG�\�\�u&!_?2ُ\'I\�\�[\�;5�y�\��\��|y�CB��*Ӄ-.G�H�\����%�J\�_��8-mڮ4]�AZZk�(��s\�\�bѷ@�\�\�\�`�6�\���JSN\���f\�\�t�(Ѝ\�	�V�\�j��yԭ\�����\�4t�\��r��!A\Z�\�BT����\0\n\�Q<\�\�\�?���\�v�:�A>\�y}�2\�<I�aO�\r�e�0�E��\�,\��s��wӥ\�l�����_�0�]L�>!\��\���\�R�\�\�\n@\���\0\�e\�\�m���?��\�s��6�WN�c���\0\0p�äcF��#\��\0nfB�VI/��<�9az��ψ�%+`��LE�~���ĥ�\�k�ܯE#����\0�ĠY\�K%D�~o\�RA,k��\�#�\��)�\0��\0�\�'),(5,'BD_modificaciones_CI25072017_wili.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','PK\0\0\0\0\0!\07�Q�\0\0G\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��MK\�@�\��!\�U��D��?��\nV�ݝ���\��\�I\��j�m.�dg��ɐl2���&[BLڻ��\�C���^i7+\�\�\�apŲ�\�)a����!���\�\�h��2\�v�`s\�p\�y�s�\"\�>���\�G+�N\�!?\��\�pxɥwX1\�xt�X\�\�?\�rc�$�\�6�UV�DFK��ΗN�Hlr\�k\�\\�tF�\�L�V~\��=\�h�V����O\�R_����ra�3��\�ӗ��\��W����h\�\�\�\�\�m�wy\�EBo߭\�\Z��D\���:-�\�AD\r\���[\�)D�?�0Zt�Dµ�t|��\��\�Ї��ܩ��\�ko\�\��\"\�\�\n҃Ŗ��B��+P��l�VzT=�\��\"%\�N\�\���5Zt�D\0�0h���H*h��\�5\�H���gz\�?\�y�e��a�}�M$����G|G6�\�_\0\0\0��\0PK\0\0\0\0\0!\0�\Z�\�\0\0\0N\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���j\�0@\���ѽQ\���N/c\�\�\�[IL\�\�j\���<\�\�]\�aG\�\�ӓ\�zs�Fu\��]�\Z�U\r��	\��^\�[��x\0����1x\�p\��\��f�\�#I)ʃ�Y�\�\Z����\��\�*D�\�i\")\�\�c$���qU\���~3��1\�\�jH[{�=E���\�~\nf?��3-��\�޲]\�Tꓸ2�j)�,\Zl0/%��b�\n\Z�\�\�z���ŉ�,	�	�/�|f\\Z�\�\�?6\�!Y�_\�o�]A�\0\0��\0PK\0\0\0\0\0!\01��i\0\0@\0\0\0word/_rels/document.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��_O\�0\�\�M�K\�]7T\�\�EMxUL|-\�\�X\\���(|{�(41��\��\�i\��t-\�\��m�,H�f$\�U\�Ⱥ o�\�{�Xd�d��P�\rX2�\\^�_�e\�6\�e�m\�\\�-\�Q?Pj���\� \�J��`\�JSS\�����lH�\�A&G�ɬ,�����|��\�-\Zn�U�\\	���\�[\�|H�ѱ1u�hg�uf\�Ԁ�\�\�1z�����\'F\�_m�OLH-nZ��:\��\�\�\�gFZ#\�\�����\� fr%`\��:�\�D��,*�\�\�!\���\�A\�!�aT�߳\�N0����\�����9\�\�d��\�+ ��\�E\��4��*\Z�n��:\��&\�\�\�|��F1*%q\�~{iA�\��\�7\0\0\0��\0PK\0\0\0\0\0!\0��٤2?\0\0%N\0\0\0\0word/document.xml\�}\�r\�8�\���8\�\�)�\�خ\r�31\�]\�\�3{�AK,��e\�#\�容\�G\�ثs���b� eY�)�R�(gwDѦ)H~_\"3�	�\��~3|\�\��l�\��\'�f�O��\�xz�Û��\�So�e6e�\�4�\�\�\�|�\�\�\��\����ߏfû�|�ML\�\�\�x�y����\�\�\��s~�-�t3\�g�٧埆����O�\�\��\��l>zKF\�O��\�0_,�\�\��K�x�jn�{�\�F�\��ph��~\�\�\���\�6����\�[��!rDC\�	~\�=�)�6�\�IC쨆�^=i�\�R\�\�\�q-��-\�\�Z�O[Rǵ�N7O>�ͧ\�?\�\�7ٲ�u~��&��vw�]\��m�_�\'\�\�עM$�\�\�\�ߎ\�Q�u7ttp�\�\�l�O\�衕\�o\�\�\�\�W��n��\��\�ϯ.�����R\�\�\�\��I!�\�t�y|�f�ͱ���\�ȗ\��\�f��\��-nI�]\�\�U�|l�M�W�T=�E�Z��\�\��m����=�)P��\�G�fC���yh�<i@\�-!�\�F%\�b<\�\'7\�Y\�5\��Y|�y���\����\�\��\�\�\�ck\�ok\��#�\�\�,|@[+\�m2a�m���9�-T\�\����\�\�\�<��=*04(`0(\�@��x+�@�7\�\nS\�j6�\Z��\�_\���\�<{_�mB4�^�oʻ��]��Ȉ\�1Y\��\�f\�\�\�RHz\�ַ>\�\�M�$I\���\�?ew�\�ӿ|\�h�\�Ňy�,n�a1�\�\�\�2-�L\�A����\�.�/�[\�޼\r�W���\�t�^\�\�\��u|�/?\���_f7\�4|���.��2\\<�]6~U��v�o\�=�7������~�.-�\�`1�&ŵ�M\�N\n�\�b���|P��Q~�O��a>/\�\���UV\���\�l\�[V�V|�\nF��\�\�mT\�\�߂�\�\�{��:�ņ�\��\�Bl�\n\�ʑ�\��\�&6*9�		�\0��6\�z΃���\�̦.\�bc+i\�g\���&6+�0�Ilۏ�Vl���n5\�u#LN�\�F\�\�f�\�\�K>\�F\�\�լ6�\'w\�b^��\�\�p\r_�w���ۢ�\�d��,L��,8+� ��������\�f��-�eP�x�\�\�-f\�Oy\�pM\�O��ߛ|>+���\�2�S��;N1�\�5n�K��K���.fX���}\�\�~�\�8i}�r�ц؈�\�1���Ŧ\�8�\0N؝}J灚˯�E?��d�q�͗�ޜ��%u~ɯǋ\�|�ŕ]�O��Z\���\�\��AT\�J#\��|5�R!,����N@�}\�5�\�8OC1~����{��\�	\�J�2\�b+4�P6y\�1bs\�R{:\�\���F�-?�VN\�\�q)_f�n\�ya#|\�߼ˮ\nf�\�QM\Z6�ѽ��d������F�N?\�g_�\��\�A1,�&�˪��\�|�\�Ň�d�\�\�\�Φûl4\�M�\�}��{�\��o#�&��b��\�;\�\�\�?}\Z���\�⏶\�ʏY����Sx\�~�j\r\�\�ןw�9x���\�o�GL��4�/��̊6ʾ\�o�\�\�\�lrw���p�|d:��ɦa©~�{�~\�\�Zz��G\�\�\�\�Z�Q��3U�f뮢Mw1¬�\�X҆۲�˞\�\�	o���&\�\��\�\���\�\"�8�!N\�8clZ���D�Z|�>y�Z~>��\�jY�W�pD�=�ϣ,\'y6/5�\�櫉�|��⯞��\�>\�7�/o^e\�߮系騂�\�_>~.���Y�:S�e�\�^��\�>\�\�y�=�e�/gYGE*\�\�,[W>\�E\��\�܌���_�©dtUI\��\�\�+wl�\�ƽNM\�\�_P�\�G��>\\\'�\���\"\�4NS#�mR�u��\�\�}X+炸���O5�M�!\�&k\���5\�\0l5��c}\�mB*�����@��n._\�\�۰ځr�k\\hc\�\�\�fkO��8\�~\��B��\�FO\�\0\\��\�\���\�8�\�\�&S=\\f/�\�j\�5�\�\�OH\0jg�\�t>\�he�&.�1�\�\�-@\�ɑV���ٟ\���\�[F7�Z��~2�\�\\����hs\\`\�X\�ě6i��\�pv�{~ɦ\�y	�\�\��93\�>VII5�m��\0ס}\�Z\��%�4ʋ��B�Ӫ�V\�y\�\�C��O�<�C\�\�U�\��T\\wv?z6��FHG\��\�[VQv����\�}_}22�xr�qj�ښ\"m;-�d��X�N�\�B\�)iA)ӺL>\0Iw\ni!R�\�r���n\n�\�t\� �},�^I�)b�{:\�2��ǲ\�\�+A7\�\�v\n�J\�B�D\��6�;�\�D;�uA\�J�)R�[w$)u\Z��w��n�\�4紘E(%A7:\\*	\�ۋcӴC��\�Fy^ĝx�4A\�+�N\�\�;\�\�(dbI9�d�T)A]�\�\Z\�yAM\�	<R�����Ij\�\�R��4E \�=RBNX��݁G���L@҇K� ���&FC4�k��q�P\�\�{=\�p�\�\�&� �\�V&�7o;���!�\�nrÅ�\�Ԫ��\���_�\�+�\�Cx�>^z�|6�Ϯ3(\�S^Lb���ekA!�V�4�\�hj�ݫyq��7?\�t�p��*�1&M-\�\�\ns.\Z[F��v7�jj��MT�h.�\Z%\�:G\�T�9�{ǽ�{V�چ��\��b\�	�\�\"�NTk�!�v\�k�\�-�\�\�re�\�\�Z�sdXC,a��`\�<X\�B<LqaMJ�zC\�Y�\0��:{,\�\Z\n\�k5�u^ \�t�0\�\��\��\�p\�@<��]��Q	�\0��m?v\\ ^�Kq�!���Ui��(\�\�Gt8�%w\0�gwS4[�Eם\�\'��\�/O�\"��	;g��9�]\�\�^	\"6��p����\0\�N�.�J�mzG\�{��Ӭ�\�jH\�x��#�nLK��Ip;�b\�la\�%.�k�Y��#3��J(\��C�Jh\�ד\�𰜺�\Z�\�R\rp\�\�\�\�\�K�\�p�\r\�\�B|˒\�N2\�\�X\�\�i*\����gi�OͶ\���α2�}����v\n�;Kq�NS/qq�>@\�K�0K̹o�)\�KpG\'\�4�\'\�\��nIs�qz���tShv��H����];�\��\�nD[��D�\�\�\�tGS`n��%WH�V����k�n\nI\�tbL\�@�\�\��\�)hd��\�<\'\�p�$<\�Gkן\n��)\�̩]�qU)�%\����H�3i4\�9�\��c�R�4LG!�Ց$ҩ��}��s�\�Z*0߻w��0V�m��]&�D�8\�|?\���V$�j���;s��%`\�cx\��B�!c\�\��g�\��\��\�k\�?\\�v�`{j\�i�5W�6$\�\�\�?��\�����B=�\��5\��\�G�\�G��\�so\�t}\�j��8F�n8�)�}3^<)7\�\�-\��Q\�\�a�\��\��cc7\rt� \�*5o�	\"�\��\�D�\����o\�\�S*ʙ}\'U�|\�h�m�L|�\� �?oڽ�Y\\�A0j�{i��ړ\�o��j�J�9�\�\��+˃�}P�����U�n\�\�A\�\�l|\�Ua�󲳀�.\�\�\�\�\�>y1i6�}\�D\rk\\k�([\�X\�keAQw�o�S\\x�\�P\�h͍4Mq\�@�u�\�~\�κ�McC�)1�4)7G�\�Ħہ@܋#n���K\�\�z��\'Vp�\�[��&�d\'�D�=�[\�\�w\n�]p2�M���\�AM 蚠�\�ҝ�f�[�Q��9��;����F\�j\�R��Q�\�E5F��b5m<\Z�N%L�\�D\�Q>m\�9Xzi9�ډ\�\��I\�9L\r]\��L9�c�\�9�\�U\�h\�fo+�7\��X\n�4$\0Iw9#)� e����c�S�\r�j��\�\�\�\�ԫ�8I�Џc�\�Ėǜy\�S�qx�\�җf��i\��ݟ=��9i�\�08<k\�t\�~7�����o\��t9����[�\�3UΛ\"\�Ӄ\� \r\�%\�@dc\�g��\�V=k\�\rI���|qM�p\��B\�c��V�r�V��\�֛\�LR�\�\�^hO\�\�\�\���j�m%!X_\�\��\�\��S�\'�h�ܐ8*\�\'J\�}\�\�\�z�쁸\�VX���\�\0�\��\�Um\�.�z\�`=\�:۰=>��T8�[\�\�[��\rG��]�+�N:=[?\�[�uWO����W�|M\�p�Ʒ\�\�~o�\�<�X�=+\�ح�\�2y\�\�\�Yy�\�D)#��e��\�a$��)m�\�\0��	�\�\�=�c�lJ\�\����	��MR��D\�rݥ��q\�2\�&\��\n�[mN�\�N\��r7�F�\����ud�e�\n�S[�RɌ�ŧ�\\[G�J��\�}A\�,R\���D�/WВ\�Tr\��^[\'\\���L�f�\�י-W	�\�\��!��8iN�{��Olۏ_Xn&R6M����̓T�[b{nK��5l:�j�Wb��`ӱ�\�W\�\��V����\���9��\�6�d��M\�\�S�2��Mf\�\�\�\�>d�\�\�	i:�:�\�\�\�Ӧ�YS�\�js�z�\�YOoK�Zu\�\�\"E\�qߘ\�Mav1�\'\�T\�?�#T��>�\�?\�ϻ�w�zq�\Z��\\\��-�`\�\�ڜ\rh\�\0m\�倖J>.�I�8&�m^�D�\�2\0[窭�\�:\�n\�i\��\�si(\�w��J�R\�\�p\0��u�u\��`Hh$E�=\0n/��\�l\'\�J\'.�1I�}�\�@R�NJ�\�\�\�~��u\�\�\�5v��\�L\�9�H\'8�`��1\�x�U\0�\� WΧ\�d��M\\Pc\�y\�lm�&�-\�z\0jB\�\�\��6�.Us\�a\�[�ޢbL�f���\�Vt�K\�N����\�\�%[d�=/\�\�\�3\n�	%\�&@҇B�!��S\�2�B1Y_hV\�Ф냠�\��dcF��m!@\�u\�\�\�\�\�\�\�4\�hK���t��[Ic�z�\�A\�W\�o��[Є�T�XVY/�R1)��{���\�%uȊ$�e\��ߍ@�\�O3A���^��^X< \�# }��^\�8\�I\�Q\"\�P\�\�c��Qwb�\'�HTߦ݁�\�sִ9�$]��A���B#\� \�ҵ�.5e\� \�{\��pi���&q\�0\�}\�\Z#��\�\��_�B-����lR�`T��\�\�fKB�A�\�XC\�H\�v�1�Ͻ�\����c\�\�ݻl4˄�\��Tֵ���\"Q\�\�+\�P$�U�A�A�5>ܸ\�7izV6�мMx�uM�PJ55���7��B\�ZD\�\�}�\�\�0�Gr\�2Il9�\��uR\�p���\"]\�Il�qȣ��/h��HW\��p���\�vB-�Zi0�\�Pm@�\�P\�Ͷ-J�ZP밖$Lq��*\�\n��^K\�N�X�\�ǀM%�=&3ؚ�V\����R�)F��6�\�m/7\�ej0^\�\�\�JS�6�ƼK-�V2���a\�hv[e��I�f\�	AZI�ڬ��N\�f\n|5�h\�<�5�P;\r\�:;䠌�ą4�0)C\�,H[�ٟ\���\�[\�\�7B\�n�/%��+\�\�\r\�B�8.�I�0��\�ޜ�ۮ�SVN�\rj89�u_OvrJ٣�\�[\��j�\�\�\�G\�&\"9#�=[p~\�\�\�N2\�c,\�{�)�{)�@Ї�1�S\�\�q慎\�!�\�\�Q\�TR�\�9�-\�p\�n�%�	&����>6`�SЈ�\�%	̆\� ��m۵���n���~:`w�ӾM�H�>6Jv\n�J�\�\')> \�c��\��j�[��VA�K%\�y{qlb��pRق�vH	#T\n\�&!hT\�W�n\�v\"��s��R\�a\�\'u\�JA�G`Uv\�\n�U�m,˃�\�2�\Z�\� ���>\�\�T���\�\�RaRJl�\�A\��\���q��\0��k�T&H�\�l�\�!\r��*\�\�@�\\�gt/�խ\r	��4ZHk\�k�\�#\�\�ޝӫ+NЍ�]e\�e!\��u\�g\Z˻l�OG\�bG�Ӻ{�s\�R^�3|\�\�\�\�j|�Z\�\�4;��\�*NF�%ˉj��\�\r�\�x7i:O�\�\��H\�p�Ӧ�;�����7�B?\�ˇ�ѩm{]5Z~\�oEWV��M�I�>>D�IB���̞LZ\r\�B�gM!�R\�\�W�+Kn7Ғز��QFbf�}V% ��uY	\�ʽ�\"�TNoj�g.<VH�\�l]�\�͆w!g��#.�1�42ze9<�\rQ\�HJ�c\0[\'`\��D�`�\�7\�դ~hIqB\�:�[Y\�z�#�l�#�lB\�KO`\�jK\n��a}�\�!\�f/p\�\�N�\�92�))�M۬�غ\�l\�\�ؠF\r���\�م@\���\�\�\�ϓU��\�\�\�=\�\���\�V��\�\�?>m��*�#j�9\�Rjh\�\�\�j\�]���8�\�@Z�ԇ\�z���F\�~\\�?\�\�_f�\�&5�6\�>;\�|7�����\�\�pG��\0�\�}5��\�@t{�θ5�EL�1�Lƽ\0��T�oRa�6ɾZ1:[?��o\�ՓU��=j a�T\�\�R\���b){�\�\�\�\�NRal�J%�m֯|ֆu�����0��6�R 蚠=vJZzg�\�A\" \�%\��\�-he�a��\�HR�W\�〠w\n�!Խ[wXl�\��\�\�\�\�)h\�2�<$yC\�,A)�\��K���\r��݂�\n{\�AG!\�\0\�NAc)\�\�+7;�\�u\0wʹ��}\�)f\"������Z\�\\Y\�^\�\�RIx\�^�XNO쾚�N�U陠�<5ht��:\�Ye�Z\�\�6g���k�>\�Y%�J\�\nd��>\�YD(�\��3!�Tf \�݂>\�YE�)�\�\�(@�>\�YeR�]}6�V+8�/\�\�Bq\�ftM\�9�\�\Z\�h=��\�}ng9fs{V�\0\�p?\�Y\\�\'~q��\�\�\� \�p�\�5V\�\�\�Yv5	z)�\'!�(�\�\���2�J�O���4�&\0dSl	�6U\�\��ۇ\�[\�م�[�\�=TϿ\�X\�\��\�\��1\�#k%�\r�\�4��@iz|�颩͇w�d�L\\j|}J�[?�-Bg9��X�;(B\�\�\����E)+�- \�H{UE\�B f\r�e��\�_m��\�H빜\\xiz\�j�\�	\�^]��\\&�\��$\�\�<�\�4p;\�e\����\�q�B��A#r�H.��lX�q�9\��w���\�)\"�TY0�N�\�u���X�4��W�?w�x|\�V+\"\�\�R]�6<��k[ۺj\�l�<���uWOVۺM��\�R�o\�\��(\�\�&�Ӥ݁Z\�\�\�w\�X`\�\�b\�\"r;{P�p\��/�	��Ӆ��)w�+���A\�\�\�;\��eB�\�t\�\�`�Z���	��taa\�N\�gC����dz\�l\�~٭:�\r�>\\\�\�O2��#\�ӯX\����tަ\�/�\�i$R�Ǒ\�ć*8�S�v���HB\r�\�	� 蚠�x\�\�v�PEܵ%�\�V#����Oh\��\�ٵE��\�\�%\�3�\��\�\�|(��\�\"��F�_\�z\�\�r�\�W��\�\�C\�T+\\X\0����\�^s% \�\�{^_�H�(t��\�?����\�=�<��\�\�\�\�	)\�s�۸\\G\r�X��-\�\�\�lz]�T�~j\�\���\\�j6�\�&����r^*�i��\�\�3�\r�dػ\�\��\�\�b��D͇!?����\�NSt((:�@\�Ṋ%J\Z\�\n\�uy!GJ1g�,����P\Z%�&&养;\���\�¶\�\�X�{���\�y��\�\�\�@y\�ˡ-��B�\n+e},n���]\�A9P^\r\�D�:�|-\�*<aXBy\�I\�\�춾�ن�;iOH�(�\�,h\�n,�\�qAM(�g4��:ԍA\�X�2��h�dmx6e׶n\�a�\�\\�<�n�uWOV7V��\��	å\Zߺ��Q���=Ε�\�v(\�m�(l\�oC\\\'r;{XΣ�.M��x��<f+���4\�#$}XݘI�)�\�q��\�y䂤\�+P\�\�(醨�nAk)�r\��H�x���LI\��~p\�T<�R넁T�݂�J\���\�\�\n8kB\�z\�Y]\�\�l	��\�I}+=x�/n\��:�$pwn\��3C���6\�VHಊ}��1\�BS	�\�ڴ\'.IT�}��2\�d\��\�͎���\�\�9{M�pi��a��T�ml�\��\�Jp����A.�ދ6��+,�r��M�q%I�xsClۏ�b[\�\�\�\�\�+Z���\�߹�Q��`\��.)�^S�\�]D���L\'\�\"LW+4ӂn\�ګ{�/Ŷ�\�7\n�\�?/\�\�`v;�������P^#\�3+᧬f��\�\�\�x>\�\'�avs;\�\�Ax\��\�\�ٗ|��Z�}�\�A\��\�B5\nʈ�\Z\\\�$҇�ǝ\��k1���\�ސ7Ƥ�\\3�ig\�\�\�\�W�l�D*0��(�/\�\�f�\�+�wQx��O,��U\��f)ǻJ�B\�e�!\�Vw\�*\��/\�\�\�l��ݼp���/\�\�x���/����m5\�m ��2Z*\�\��kqƦ�Mw^e�m̲ƻ�߆)�:\�\\1��~ۜUUث=�W\�j\�Ƽ�|��\�\�W/�s�\��߳\�2|�|q���{>\�j(%�5\'\�\r8��yv[��EO\�\�Ӈ��tH�\�\�N8[��1\�HR��i�<�o����@:���Oz1\�^fvz��\��A\�+T��VQ�IV��o�\�;�s\��w\"��R*D�\�\�\�\�<�w��I\�l��\�zA�\",\�I��J��9(�\��\�d\�I�7����X\�;7e\�<0)�En7�\�-�\��th9u\�3m�\�1\�\�$�\�:\r\���\��y��:��ue�\0��\�=%8b\�\Z�\�$��\�A�W\�ߟ\�\�\�|z\�\�+/ 6%M43mj���@Γ��ly7\�&�?�w&hG\�2$\�w��T\"�4��`�\�>N�\���[����0�~�D.�%{�`ζ��rδ\�^\�&�����\�\'\�=f�\�����^��v\�\��A:�2�\�FG\�\�^\�\�`�!�a<>��j�\�O�\�_�`J�؋1�j��,���)͋S/7�PlQ+C�L9;S�M���\�l0\�.�hG�\��.Q\�}y�@\" љI�S�\�4�G�n�.ȥ\����; �(^}�\��&\�\�SюՔ�1NS���\Z\�M�\�\�\�����v�(\\�6ֲ\�\�MÌ\�\�\�\�\\\�\"I������`\�)Ѱ`\�J~\0�\��\�\��n|\�ڙt/�G���`\�EC�8�}� 41\� `Jߙ\���\�I���\�\rܨ�}\n!!\�/$��O�#y��@��I���\�zc��\Z\�M�S,���d|�a\��e��s;5\�N }ܤ��z���,�W����\�\��������a��\�|�ȯ\�\�\�T�SUu���\"\����@SEA�HKW�k\�J�\�w�t��Q�W�:\��L�5�&al�`\�H7�b^Ð1ϑ��&Q\�k�\�\�+ۿ�\�\�)\�0�^\�v\"Y��_\�@��s\�\�\�\�&��,3X�h2��\�\"�\�|\�=\�T\��\�`�\r~ɇ�\�p<gչ��r\�\Z�\ni�\�tx\�\�]��D*&`G�\Z�aS��?��\���)}gJǋf�R\��s��)q��1/��\��\0�\�&Q̋fTKB5��D��(�E3\�T\���\Z�\��	�\������s�X�\�\�\�\���1�Ki\n9��\�h��\�\��lP�\�\�&\�e6\r%=��߳\�$\�=�\�n>�㿏�(�><E��{\�ӁM��X\�ɝL\�8��5wN?���)\�	�\����X�ҿ`:\�{\"`{S Q\�$�9�\�(&YX�\�M���\�˔+8Gh9�N��\"��$��\�+P�U������\��b6|\���\�\�\\��P�@g�Y�o�uھ9b\Z\�z�\'�ZL\�)\0���P�n�d�i9P���3�\�sʭ\�F�=\�(0�r2��/\�.m�O!J$��DQ�ڑǩ-�\n$\�K���l\�y�p�`�[`QO<�p�\\h?:7�/� \���#��N\'�y�-f���m>]\�g��\�\�a[�\�;�d\��E6�\�&��}�\n}?��/��;c[�ƦN\��\�sd\'S�^��\�:Ur�L\�3S��@2A\�Cb30%nC8\�\�\�3n)L7@��I���$����\�6[\�\�\����@\0P�\'T	�\������ssrp3,�d\��]\��{\�_�\��\�\�1\��\�\�1	v\�FFa\�y`J\�\�Ŏ�\�Li��P\�L\�=S:�cf�R`\n0%�4\��V\� QéS\�R\�wH9�b�#�<�2��Dq�(�}\�E��\�N\Z�\��	�\������sӅIhʤ��~#�\�N�\0fG\�l��_\���\'�^<b.\�z��r&\�\��\�\�T��)\�\�\�n\�6`4S�Δ�\�\�T)\�\r�<$`J,L\�a�85�ag�\0�\�&Q\��raHjSj�D@��Iw�\\:��İ\�4\�\�.Ճk\�G\�\�\�\����\�^���#*�(��a��\�og�\�@�\�\�\�\�\�<��O��g�#�ɮ�a�\���K���̒;�\�u(].\�_\0Szϔ�S\�}�\�\�B(�S�J\�Fa�-$�\�&Qԡt&SF QH9�\��sm�ʠ�F=q}¥zp-��\�\��yc� {�J\�\�5\�̎�\�[��\��w� ����\�숹�\��9\�F0�!Yԓ�q\'S:��s錓6�\0���)]\�c.�sXB-0%��/~��IR8�H;��޺%\�Hه\��H)�⎟\�	2.|\�h\�\�\'\\�\�ڏ\�Mg��P´�����s��WN��̎�\�[��w�\����9�㸹�LK� G�ӓ)q\'S�>�S�\�0$S�Δ�\�\�\�$��\Z\���\�\�k\�#`��\�&Q\�y\�\�y�<�H7�\"\�;	��$\�h\�\�\'\\�\�ڏ\�\r\�3�R��=\����K��F��\�\�0\�\�:�\�M>]���\�\�r<�\�\�8�n�\�|�q\�\�\���\�|<\�F}Ĕ\�qX�\Z%51�\��\'3\�N�t��\�d\"��`!0�\�L\�z;��N0�S�V�\�&HK0̀Dq�(氺����5\0\�M��\�\�H�� I�@�h\\��\�\�s\�$�K�����\�ts��0r\�yh�E:\�J\��\�;S\��̇�|�\�\�٠�qe�O1�vtǜ%>Q`�٢�O#\r�cϥ\��`Jߙ\�qНcͥ�\Z�L�ڀ�9\�Ι5\Zs(�\�M���\���y3�(nE�ˎU2�F�>\'\n�c\�R�y0�.:\�N\r�\�\�L(�\��1ݞ\"9\�g�O\�<���\�\�6�L>.���\�+�\��\�|�\�&w�V\"K��U\�_�@\'�pX\��\r�\�\\��o\��L��)/LH+u��`\�S\"7rcޜ^�4\�	��Dq�(\�Mv�HRj��\�M��&\�L\n�h4��F?\�M\�\��m1\�fQ�Tm�e����\�6\�\�=#�_� \�J�`�;�����]1�QUp;�:d�\�l1�u�]e�Y�P\��0ϯ\�\�hv\�$\��n�Lje\�	\�\r�\��3+R.���\�{�th�\�s�\�]S\��\�\�Oc�\0`)\"dO�7�Htf\�hg\�D�\�$��Dq\�1K�h4�\��IGwì<)r7a¥z|-��\�\��	5\�\�Y`����V��lM\�w4��b\�\�_�\�r|]1}\�fü�َ�\";�KÈgv\ZEàH7\�!�1�8`\n0�\�L\�8�^}VV0%��/�N�R%�j$��DQ�ѩ&L$EM��\�\�\�4M(@\ZE\���\"�\�K}\��Lp4�R\Zs�;\Z~?F|�R\�\�\�\�\'��OM�H��:���S�1ub�\�V��`Jϙ\�qLB��\�\�)\�0�1u*x*�\�H7��\�#��\�&Q\�1uZ�=�����q}NS\�\n�\�=it����\�x�0(=��߰��.�\�\�Upނ�v\�l���\�X�\�u�\��G\�9�\�:\�$dŀ\��\�s}BJ�1C�`Jߙ\���3(QƁ;L�\�6�#��O0\�\�ZEN��s��\�!$EM��\�\'$�[8\�h�\�s�\�sg��lu�r�(�H�7�(�\�\�P��O.�\�\�\�y\�Y+\�\0i�\nP%\n�Dz�+\�3�g��\0S�gJ׻\�+�x1�\0S�)�0�!si��)�� Q\�$�9dN�Nl���\�M��C\�H\�<\�s�%\�ht2\Z�*d.-5zoy�d�̱c(��\�溜\�xY�\�-�\�\�j�M\�3]\�8�\�e6�\�f<?|7xo�?b\�\�:�N1�C�-\�*\ZZE��Έ�N\����)]\�CkӒ�`JL\�_x�b�p\�\\�D@�xIuF�J���\�Dq�(\���RI���\Z�\��	�\������s\����\��\�X!�\\��l`v\�~�������h\\@$�5�~nm\'�:��#鍢\�\�@��L�;�\��)�\"�$����)�gJ\��s\�(ńB��S�?\'��V\"$EM��\�\�HQ)\�� �(R\�?\�H��J�z\���K�\�Z@�ѹi}\�\�h�/,\���9G������\�\�0������M\�_�b�\�l\�>\�3��v\n\��dB\�ɔ�\�i�<UDA\��\�w�t5\�bN0%��pS/�3f�Dq�(\�9eN $a\�	H\�w��\�\�8F\�Y��h��*\�R=�\�~tn\"\���4}��Y.1��t��\��\�(��\�x:^h��\�l�a>[\�\��\�\��\�\�pc�9M0��A6 �\�\�dǱr��7\Z9`\n0�\�L\�:V��\�DS�)10��r\�\�\�4\n\�|@��Is�;�&���Dq�(\�sf)3\\��FѸ>�Ѷ݄	�\���ct3_�ji�س\�D\�1��$�O�;~\�M\�\��mLO\'�\�o�i�\�\�\��\�޹-��#a�U|�7��q��*�\0&S���Ɠ��%%Ѯ\"�(y�v\�)/��y�%%Y�3T�\�i\��E��\�\�\�\�\���T5E-=��\�]���\�`D�0Q\�+��	�����e1���	�P!e�Z�.�}瀈6D��t��TL���hCD[K\�\�yT�E��6F;�	F\���\�s\�m\�︇�%�b\�xOai�{{R�L\�Ӄ�}]U�cݾ\��\�_��-\�\�^\�p\�Wq��B���7\�\��]�\�\�\�6\���\��\�	o\���|�j�H�.��\�\r\�p\�k��lx?+\�\�U�I\�\�\�l\�;[���;fp68\�c8[=���zw�^\��\��j\�\��1ifs+4�e�\�<�W\�>\�e�h�,�͙CH;)�1q��$C\0) �t>F��IH\�6H\�\0�p\��R�\�\�\�`.��s�\�\��^^\��?\�\�C`�3IFe��by\�2�\�L{\�޸7P�wNJ�\�p\�{ZZ\�\�~$C�6���\�Fu�}�}��:�\�l\���ֹN���\�o\�\�o�\�֧\r\�p�nw{6+\��8T\�c\�Y���VMLE��[\�oϋߞu\�I:���7�:&�{v�G��h�)\��C͢����h\�\�\0) e̤\\�g\�\���Rh\'e���J���GdD�\��\�\r墽(�6\\\�h/�B��E{!L*T��0\�2�\�L{\�޸7P�w\��g}\�\�K8\�Re,�h\�\�d\�~Q�)��\�홖\�\�ܫu9�VW��Y=��\�\�\�1@�XW!\Z�,\�L#	�����M+4 �����\�q\�\�=�2��O�\���\�\"@D%\�PV\�u�OE\0/\��\n/���	���P\�2�\�L{\�޸7P�w��\n��=\��Pǭ��\�~\" �\�\�\��\�rY\�T�\�\�\�u���^��\�\�\�\�ˁ%ra�\r^�\�D�$Vv�2�Dnt�\�\�\�)c\'e`�܈�4\�\�N)TH�Dn��5X��Ȅ\��tZGn�x!\�a�<�F2\�Ah�B˰���]at��N\n)�d�#\�&C��lR\�\�e��\�F����7��yq�;pv\��v�\�yh��\��!sh��[�+Q\\�$bv�2�P\��\��_����2�Pބo]��I �\n)\�ʵ4,��	 �\r\��\�Qڭ�Ѱ��	�����ц\�\�\��\�,\����eu\�5E�H\0�hc�S\�Nwm?���l�co�~\�=T\�|HR��\�\�8gś,\��=\����|#�o;\�i\�\�R*�)-���\�N\�E�B�a���1�2�N\�\�\�^n�| �Н�Q\�׳�u[�\"\�Q\�ו\�!��@D\"\���!FŰ\�\�\�\�1�umTt\��\�1EP9\�%��D��\�Z�g\��\�|1��ӫ_\���ۛ��}u|\�\�y�s`q\�(\�|th\�Bd�)��Bpe%�\rH;)�\�R\�R,@\nH!B\��s��䌢�μ��%�뀈6D�\�u��e�cv�hCD[\\ϒ2\�%=�\�L}\��v�\�Y�����}o�~=\���aL��\�SWA{k9�\r�M;L��\�W/ޯ\�\�nW\�q��W]U�cݾ�-&���\�\�z]\�띻<QK���\�\�\\7I�Y&�\�\�\������``��\�\�ǌ�/ e\�\\�hH\�V\�\0R@\n\�d�r\�t�\�\�n��\0\����1�If!(��2�\�݃���~�\�\�9\�2�\�L{\�޸7P�wƇ\�I/�c�\�3�A��G6�.�_Mg��=\��\�5\��٫\�Xg2�= \����S�\\3�\�p�Dc�F\')\�d\�M$�R)c\'e\���q�@%�O\�(�~P�\�\��B�hCDy�+O\"\�\�^���d�\�-�����<\�\�\�\�=R\�\�\�$d\��\'�~\0ߴ\�\�\��\�Yk�r�e���\�t��\\��n\�\�DO\�\�c\�ݙbTRF4B`h\"Cѣ�ened\�k��2fR�ޝ\�fI,�)\�\�]\�\��ׅ-�k; \"n(�Ȍ\�.\�(��2�^�����}g@hy<Z�]���KR؞�q�����A-d�!����ˢq�jN���-\n\���$,v�2t��\�E\��H;)CO\� ��*��P\rϼ\�n@��L�������\�\r��ᅮ\Z.�rE�\�\�@\�H&3\�e{\�\�@�\�yx\�\�\�[/Z\rI���\0�A6�O\��_\�\�|]\�<$.\��̸���g$a�����Ɨ2*\� O����2�\��Z\�*:L�@\nRƧ���\�C\�Dd\�\r\�\��\�D�<�/dx�������h\�d��lo\��\�;���τ왾_@ox�*��/�M�\�S5|>y;S.�V\��%\�{Jf��P	�����gF\�*\�k��2fRVÍ\�T�	H�B\��\�pŸϴ\�;��L�����&\�$\��x!\�]5����\�R4\�2�\�L{\�޸7P�wz�b6�ԓO�_\r7\\)shڣG6v\Z\�B���dV\�&\���\�8\\vY\rG\�\�d\�tv�\�l9�l�Wy���#��u�%\�\�$e\�b�t\�7�@\nH9)Co\�R*��O��B75�|l,�21����J1m�C�1 �\r\�cc��,j�����\�\�\�+��m/7�\�\�:�\��Yō3S輍�n�e�.S�xT�\�o\�ԓ�v;��ιW\����Ie\�R\�y\�\�>z�\����\���fq��\�bv\�ۿ�7�rR-\'�崞\�.v#ts\�ݔ܉�2�\�U\��0�|�_\�\�\�����7F(w�}�cQ-n\�-�~��\�e�̗\�\���?���\�G<�?\��i�\�\�\�<\��\�\n+7����Z}z\�\'<.\ZʨYޮ�<t��ݰu\�.e����\�\����\�v�\�S\�p;\�4��\�[��\����l�_PgĔ\���	D\�B\�\�[�\��䟁s��\r8�.*����\�;F�\�c\�\���\�\���s\�\�e��Iڐ�����}!<~\'_\�Lxm\�I	I1���\�n\��u��о��\\\�\�\�b�\�Cj��\0u��\�B+��H%&�4\�i#��>���>_y��}�<\�i���;\�KF\�MR���MgW�\�]/\�=�n�\�\�\��{\���ɸ�&/v\����\��\�<��HQ�I\�qr��t��,k�\�9d��?d�\�u��b�c�\�1��J��۽�\�w�5)����Ūs�y?#\�\�c\�\�)>�.\n΂\�hcq\�S0R~�X���\�\�bl���Q`l\nގ���wy�w\�sY(b���<Wk��\�\��-�\\\�\�s/��\�\'�H�\��\\�;\�\�i	�[�\"}\Zc�\�>qg��<��\0\0\0��\�\�n�8�o%\���`c0\�6`�\�Ag�v�=v��H\"p�\�\�\�^\�\�\�bC�@iC٦I;\�A~>��~����b�-\�N��K��\�,(.�ū�h�\�\�og�^!?\��3Ȓ,/7x`\�\�T���b�c\�\�]\�+����\�],*~�7\�\�+�S\�l*k�og�\"[��\"�X\�D�W%\"�γ\�\�\�\\��ut1]\�lEӰ:�\�E^���\�\�$�$C�\\	�04��ru�\�\�R.ΘA?ףu�=��NZ�ov\�\�utU\�\rS\�6�\���|\�Դ~��.w���B`\Zb��[\�GV\�oWq=\�\�\�l\�rv�MpMW�-m*�<z\�\"\n�cC\�\�\�\�I� �\�\�&\�\�K�=ȳ�{�h��)��n�ry&��dV�YPzv�GE�?Dӹ>B\�\�r�x�6\�p� ���T\rxg賶�+�w�t)�a�ɦA�����^���<\�\�@1�@z\�\�JȬf \'dl�L�\�@�\�W\�@�����,�ثܺ׭p/{�u�$\n�#\��g�$\�g#\�\"�niP���\� -���\�ݗ���+�*��\�\�\�\�\�W�\�D\�\�&��x͒q���\�8���\�z�\�YW�\�*����\\\�X)��\\IT�\�9[E)���\�\�� \�3=\�.4��!}�,\�?\�j!W�-l��\�\�\�dp6�J\�1��8\�*N\�\�\�\� H#J�iCڢ\�\�\���W���;QA{�\�-\�\�=��\��X!�\�i\�[�\�ۂ�\rF\������J��?\�\�X1�@z\�/ӂ\�|��\�͢\�hr�>D��\�\��A�\���n\�mH#[��O鶵]5�D��\�l\�\� z�����\�,��0;\�!��\�G㷉\�W-B|\�@�Ud\r�����\�Gh�D\"\�H\�U�j�hD,\�\�\�ʉPYIl�\�i\�2`��q�I\�\0+\rU;\�\�\�\�?>!\n��\�\��TGᖎ�7tl���:ZĆ\�&\�r\�\�Ƚ\�P\�&�\�Y.0\�\�z\�\�m\�\�:>ϗ�\�ͅ7�@Q�:�\�\��\�ܮ�\�\�\���x\�q�ك�Ϭ	�P\��\�\Z�\�\��\�\�w�(���Օ\"u�V�(K;�T�[�\�:\�<0P&a�-k��������Y���\\��70��A\�yj\� t\�ΔD�[��\��~���~\�\�P[>k\���=���[�[��D�\�wC}��M\�Ԃn\�۽3\�\�rҾ\�Zc��Tw���MW\\A�*\��\r�t�8�l{d������\\���\�6߅�&�\�\�\�$P\�\�OrH�ɕ\�a���K\�נ~	��&�U��.M�ҲQ��P=d�7bږ.\�mM,�\�\�\���!�Z�^^1�G��˸�Wr\�\��R?\�Ҥ��\�\�\�8�\�\Z���j�&/u\�e����\��Z\�]^#��/j�:2f�y\�J/b܋(r��]�\�\�\�,�.���lD\�=�\0\0��\0PK\0\0\0\0\0!\0�%��\�\0\0\� \0\0\0\0\0word/theme/theme1.xml\�Y[�7~/�?�yw|��%\�)�\�n.�I\�:)}\�\��b\�\�H�nL	���/�BZ�\�@\��PJ-4��?&�Ц?�G\Z\�3�\�I6ʮa�\�w�>�stt<s\��	C\'DH\�ӎW�P�I\�|BӨ\�\�\rK-I�\�	f<%oI���\��߻�/��$�|*/\�+5�X.\�1cy�\�I\nsS.��+��D\�SЛ�r�Ri�LS�8�#�A�nN�tL�\�k��R%����#���d\n\�ɬ��\�R�L�\�:�4\�#r_y�a�`�\�U̟W�|��bj�lAnh�Vr+�ɬf\�Dt����ot7�\r��]ܠ9h\Z}�\�c\�i\�\�\�٬��\n[\0eM�\�~�_�Z�����菅7��\�\�\��\�0�a�5�|\�k���~ʚ�|�\�\��Mo@1�\�l]	\Z�p�\�\rd\�\�\'��\�fm\�Q\�Bte�\�k	�\�\�\0ƹX\��\�L�p!f�XPt@�o�S.a�R�+u��?�i�\�����\�\�|�:W\�\Zh�\n�gO�<}�\�Ӈ�=�쳧Z��+w�QQ\�\��_���S�\�/߽x��/��\�?~���?�M��h}���_~�\���\�\�\n|\\��hB$�AN\�m���c�j�ӢD7�$N��q�*�\�7��a�Gl;\��.\\��,\�G�X(\�\0^�x\�9\�q\�\�\�u�V\�\n�4r/.E\�m�O\\k�[^,\��ԥ2��E��㈤D!=\�g�8\�>�Բ\�!.�T��)\�a\�4Ɉ[є]�	�e\�\"��lsx�8s�\�	g3�J\�,3~�\n\'N\�8aE\�V��\�\�R�-�K��\�h0!R�dn��E�:��\�\�2��Bљy�9/\"�|\�8�;9\�4.b�\��(F��r�\��	\�}�N���.%��_~�\�@\Zr��Yב \�>�K6\�ĥ�++\�vuFGoY�}@çxB�sՅ\�s\�\�9\�k1d�+\�e�k؎U\�O�$\�7\�Ri�\���>�˭ĳ\�i�\�>\�7fv\�\�K��\�\�3+�R���\�M�X�۫�V���\�}\�ץ���_\�\�\�{\r�\�2�\���mF�Y\�3\�Pe�\�-�X\�\�E�q2b�\�\�>��\�[EOBӗV@[�O��j�0�}�؁=�z\�\r|�Jg_2ٮo�ᶫ���	}���>^��\�#\�yMs^\��\�k�}\����9�d\�+�\�[�d�\�\�<Z?\�1Z��O}���#�d\�@��G\�ٟa\�t�\�\�!\�<�\�j9	l\�Hp�U�Q�\�Lլɕ\�H�9�P8�a�n=�\�!�d�\�\���&`��C\��2Me��f�\0o�\��\"�uM@˾\n�\�b6���Ds=�fgg¢\�`\�\�\���0_+��儰~(�#7\��S&��\�{z�1\�m\�\�kk�g\�i�D!\�l�0�\��\�>c_�s�Z��)vi4[o\�\�:�l\��\�=t\ng���1�w�)�d�f2}Rg*̢�\�\�\�Я�Y\�B�>�q3S\����@�&\�E7�4\�V�5�\�Qr\�ʻg9�Ut2�N\�X\�ɻ0�)qξ!Xw�HœSt\�\�6Cͪ6\��J��愊Bp\�V\�JW��h�oɏ(f��n�b2\�ঽ�S؇a��+��\�\�q���Ʒ\�˅�D!i\�@��\�\�o\�/�\��\�*K\�۹��\�u�n�7�\n\��\�,j���Z>jS;Â��\�&4�\�g}lG�� \�u�\�\�\�\�\�� ��P�.���*�j8\\��\�2�]g��\n-\�x�T��ւ�Ti��_�+�VЭ��AP��j�߫=\0��8�\�\�C��ϖ�7�f|\�\�}�.�/�yR\�.a���Z�\�\�gu2\Z\�yQ�\�\'�ڰ]o�\Z�v�;,��^�\��R�6�\�~�\�\�:1`�[�ƠUjTð\�7*�~�]j��Z\�ov[��`ek\���{m^\�\��?\0\0\0��\0PK\0\0\0\0\0!\0�[	^\0\0�\0\0\0\0\0word/comments.xmlܖMo�0�\�+\�@\�S\�w@M��Uo�6{ٛNb0��\���HZ\�\�\�a��؞\�\�ygl_߼䙶\'\\PV\�t�\n\�\Z)�\�b3\������	��g� 3���f��\�u&,\�I!��B�U�\����eh\"ْ���&�	��W0\�`\�5M�Q1�\Z2Q�Ur�!`�{,������W`����l1�\�\�\�0φ�F`L� k\0Vh�]�}6\�3�W�3^uH\�0\��󆑬.\�F���\�0R\'��n���йf<\���c��+\'\0.��O4���\�k1�\�<�#!�ӳ	����dv\�R\�L\��\"l\�\'G{\�zx�o^�\���I̒�\�\��dV�--���A綅\�?[\�>\�\�qUi�,��mO�!�\'`���\�\���ω&ꡈB-���~\�֓��4�м	�\�siV\�%�gJ��C4a=`��#\�y�ň\��T\�U��Z��\�lW�h�k��S\�W\�>�\�d\�\�J_s\�q�K\��$�\��\�<�\� \r�Z�U4Ut��tUЪP�w�*\�;�e��$p�\�`Ւb	 �SM�?�\�\nB;��ziA%\���\�\�&q\�s|Hߝ\�\�\�\�\�Vسe\�\���=\�p\��-��k;Ǧ���.�ݞ��)�����\��\�Q�f�\�p��������9e�1�6�C�\���\�Y��c\�\�E�d�]°�爓�[�l\�i)\�+P�\�hB\�.Ucek���M��B�p�,�!?�۱�p�\�\�_^�\��BXVp��\�T��K�������\�{j!\"\�3���{|!LE�2V\�Q+\"��\��b+�^k!L/�͞�,s\�G\�{!��ã���B�OQ_�	�U\�9ˈ83\�uq�| d�q�\�7j\�\�\�NdG���\��B\�A��\n��BL\�q�Kb:�nd�\�~)�,!N\�b�\0\0��\0PK\0\0\0\0\0!\0TWZ�\0\0\\\0\0\0\0\0word/settings.xml�XYo\�F~/\�� 蹊\�=�$�\�\�$��\"r_��\"W�K,)\�J\��\�\�\�\�8p\Z\�%Y\�7\�α��\�\�\�rq�L[\��ji���Ug:/\��\��t\�.m\'\�\\��VW˳j�������\'�U]l\�Tԭ_eW\�C\�5�z\�fU\���nT\r\�N�Jv�\�\�ו4�\�*\�U#�b[�Ew^\�r��\Z}�<�ڟT��\"3�ջ���nWdj�o�0ϱ;�\�:;V�\��k�J�A\�\�h\�Y[��x��\�~\��U9�l\�\�=i��x�{�@ct�\�T���E}1̾P�\���=]qP\�5�\�{οM�B����\�p&k����Uߦ�\�j\�s�\�fEm��Ўлbk�w�k��o��6r[�;\��h1x\��\�{�\n�\�\�\�\�\�7\�dP9\�q\�Z�{\0�w�Nv�*ˡ�RI\�~��FV\�<3e�\�\�N\�\�Fn7�n�\�V\�%�\��\�\�T=��\�м3\��\� �\�:e6�\��Z�\�\�\�r\�\�����Q\r\�\�$1�\�\��\0��e\�~\�\�\�:W�\�GS<??��`ݞ�D\rix�L���>ܛ\�\\��\��TP\�o�mW�\�\�\�\�\��\����\��P 7\�F�JvG\�26d\"-�\�0F�7u��Ì��2`��Z���*�>\rq~�d_�ﴻ�_F�\�\�\���A\�nf�,\�)g��=zA,\�N��<!��T��#l��K]�#\��aB�:\"�\Z�\�D�N�}��\�O ^�z`\�\�oJ,\�\�Eq8\Z\�,�yB��$��Д0�z�\�=4,dILq�{1\�\'4&�ά4\�e�\�D\�H`��\� \Z7YT��\�\��\�\�#(�Ј\��v\"Л:�l�\�aq�\�T���H�!\�D�h�˞���l\�pm�\�Y\�}DL�9a��\�T��\�}\0��>���Ќ\ZQ\�q��g�څ\�\�K\��K��q�RB\���F��81�-\�4�\�\��4�A\"l�\�\���\�\�[\�)ų�Զ��\���F(�R\�A�*\���uB�݉\\�q\\[ x�\�hlQ\�^Ƕ��[S\�K�lN\��ı4q\"\\�Vo\�R�\�\�cv�f.			\�zKR��2��\�N-AB\�k�6\Z\�4 ����	,h]��Z�CD\�#\�B\���֟f>��ߢ\Z%\"YmM!\��6�\�9�\�cX\�3�U0ͫ�\�渝�\�j\�J�e\n��T~^�M�vù��f\�;q�\ns�\�Ϻ��_�ߍ>6#z2�G��\�f\�VP�Eݽ+��\���Y���\�t����f�\�%<\'��\�l�\�\�a\�xU�J6c��\�l��M]˦��\�޾Z�\��\�\��\�\�����\�\�vO&��\�\����t�\�\�L�\�Gg\Z�\�\�Lc\Z�i�Bsf�\�\�`\�Q���0�\�Ǟ�\�e�O*}�� �Ah�Q�KAy\�0-W\�\�\�Ww����薋�)�J\�A�,24\�\�]ʳ>vx{�gnj\�e\'\�Q���P\�|\�w���rܜ�\�e5�et�,Z\�\�\�:mf\�\����\�\�\rt�:|\��O_C�\�_wE���A\�B٪|\�fQ>��#�\�z+J�dŘ\�W^����,\�y��wj\��\�B��\0\0��\0PK\0\0\0\0\0!\0\�O�M�\r\0\0l�\0\0\0\0\0word/styles.xml\�Ks\�8\�\�[�߁�\�\�!�e���ƙ��x\�<<�39C$daMZ>b{>� H�j�b��S;;��E��\�n�!��\�\�\�$�\�,g<=�L_\�O��<b\�\�\�\�\�\�\�W� /H\Z����t�D�ɯo���_\�\�\�SL�@\0\��M�NVE�~����+���%_\�T��\�YB\n�2�\�KHv_�_�<Y��-X̊�����\�\�dC(|�d!}\�\�2�i�\��2\Z\"O�[\�5\�a\�g\�:\�!\�s\�\�$�x	ai��P\�\�|Y��\�-R(a>\�W%�p�\0�q\�\"\�X3����\�)sTc�>N�$|s}��,bAC�\�\n,�//�V8G\�\�wtIʸ\�\�\�\�&\�/�+�\�%O�<xxC�[\�AL��_��9��w(ɋ���\�7W�\�w¼0���M�\��?ś\�I|:98��\\\���\�$���\��\���\�q(}�UZ\�\�d/\�g\�pOw��\�\�\�z����L]�,*�~z�/�1�avp��~�Mʂ\�(@�o�\�#.\�AǼ�Q�.]~\�\�=�\�x\�t��%~��\�\�D�N^�k��s��+E45NLW,�\�V4��\�hs��KK�@\�\�T�=;9R^\�\��ǐ�ed�wS\"5�$\rbyv\�6W\���aS�D������\�6B5�8��\�\�nf�\�wu\�B�\�\�\�s]\�\�.t�\\:y��z�)̏�K#�X\"��\�\�X�ͱ�c�%4\�*h�%\����9?Fs,n�\�<�y�\�\�3���sw\�n\�\�S�w�\�\�ݝ�ݸ��ww:w\�\�\�\�n\�\�\�\Zϭ�Z����eK΋�4(\�\�x\ZIK\�l~xrң��Nz�T�MOģi!Q�w{�\nR����U]����ݕ�(�\�6��\�i,�\�D�\�yf�(3ˈ��tF�4�iH}:�?����L|sMh\Zy��\�%)4-\�\�\���f||\�8�>�|�XIHp^\�1�\��\�\�\�k|m�0\�K�_(\��\��\�\�\�i���\�4O�i�ƭ�O_\�i�\�M\�<�����[V\�*ś��\�𽻋�\�]�\�혳�����\�F\�7$#wY��+ݍ5���\�9���[sZC�W.r!z\�\�r���h���\�y\n��\�)�\Z\���(�\�r�v姞����3hiP\�\�I\\V\��\�F���	�K�\�\� \���?\�嬔\�G\�۴r|\�6��a����6O#=�2\�Ὗ4|����(\�\�G�.y�\Z�#΋�W�f����dPȿO\�+�3U+�ç����\�#Y�\�\�MLX\�G��/\�\��\�\n\�\��\�\���e�)\��O�1�N\�?�\�\�?�4�L�铧ޞy\�R�\�a��H<�D\�L�2/s�\��F��d�\�MF��\�\�qN�u�\��[\"/>��\�a5�x��\�}!_Au\�fl\�\�\�\�4�\�>��\�\�\�\�P��j����\�\�/Z��K�����z\�l7��-��\�^\�$ϙ�#Tg��\�\�<\��_�i�y�,cX��`\r�6�<.�4�\�c\��\�a\��\�_�.�x�\�\�_����`��P0_2(�/\r̫\0㿡c�\�Mǀ���N�0`��\�\��\�\�S\�\�\�̗�)�/?S0_~6{\�\�R,��M1җ\�HMZ\�d\�3�=yB��\��AZ\�n2����\�i�%nH�G{\\lW8_\"�oM�,�\��#J\�sO{k�	GY����\�L��ctnb\��#�Y�d����Y\�v�U3m{~`w�\"���\�~s��Ӳ.\�[f�/\�5\�\��\�Y�\�>҈�I\�P�c�\�\�pc\�\�-\�\�\�ƛ�D\��h�%�\��n\�\�*�ey2\�^�\�@K�-˾xxG��NG8\��Ƴ8\�I�5Ɲ�\�s�Ʋ\�O���*�Y\�O�:\�b\�n?,x\���(�S0\�d��+;�/��\�\�L\�오��\�|{\�}���9/y�o\���i����\�\�)\�i\�ə\r�કe\�\�88\�\���18\��2�\���\���Ɏ��\�t��3.[A{\\���.\�\nR\\�ՈU�1x9`G�\"Ё:b�`G��;*��\"Ё\n\�@�0\\�B{\\�B{�@��@�t�B:P!��T�@�\�\�\�j\����T�@*D�U�G*�\�*�w	THq	THA*D�\"Ё\n\�@�t�B*P��S�B\n:P!��\�꧆\�\n\�q�\n\�]R\\RЁ\n\�@�t�B:P!��\nT`\����T�@*D�U}X8\"P�=.P��K�B�K�B\n:P!��T�@*D�\"P�\n̝RЁ\n\�@��>�\�Qھf?\�\�zZ��?��+ݨ/\�O�M\�l8�n��5��\�\��?<��zc�-b\�\��\�cu�����\���E�/|L�ț.\�\�B�\�L�p�%\�S9\�sy\�y�}�nZ�U\�a_�5-�4xؗtU\\\�_J\�0\�K3��\�bޗ�\rs8\�}9\�0�#ܗ�\rC8�}�\�0<\ndr޶>\Z8N\�\��K�\�\r�\�\�P�:\��*��0T=;a��vJO+/��V؎r�\Z�Vj�@��RC��\�\0\�.5D9K\rQnR\�Ĉ�\Z�R�\'g;�Ij�q�\Z����(7�\�T��\Z�RCV\��\�.5D9K\rQnR\�\�VjH�J\r	X�!�Ij�q�\Z����(7�A���\Z�RCVjHp�\Z`ܥ�(g�!�Oj��Ғ\Z��a�[���	\�0\�%g\�СZ2��%�\�X-A�j\�qՒ)��0T=;a��vJO+/��V؎r�\ZW-uI\��vVj\\�d�\ZW-�J���z�\�UKv�q\�R�Ըj�Kj�\�l\'8I���z�\�UK�R\�%�Ըj�Kj\\�\�%5�Z\�z\�lŸK���z�\�UKv�q\�R�Ըj�Kj\\�\�%5�Z�J���z�\�UK�R\�%�Ըj�Kj\\�\�%5�Z\�\ZW-Y�\�UK�R㪥^�q\�\�Ga\�<\�j����\�/\�䫂��9\�\�4�9��\�(@wu\��\�*y\r��9q~!:*o[n�\�(�n۪�\�\�\�y��4�-\n�S��a\�p���;\�E!�\�\�\��ry�?�\�~DY׃\�\�\�cz@\�O\r���;U?L��*\\�n��\�V�^]�bXhD\�YF�|��?��v/-��U�۸h}�\�q#Nu^K����2$zZ-C��}�TQek\�k�&v�P�gWr�?�S�\�~�X\�\�\�Qk$޿�q��Tg��Ԙ.�\�\�龺��\���\��|V�L%r+`�ݘ\�e��Tw\�\�\�0������HW�c�\�^Ǝ�\0oh\��4,I��eU%U��ǔ��|�\�y�v K�럕���d�h_\�a\�\��̇\�6/��\���s�E4S	�� uUy[k=\0�)N�!�I�\�ycCn�\�ɶ�=\'\�\�3��Y*F�^�3�\�ͼ\n�f��\�L+��e.�MM/\�q��rz8Z\�rOKV\��\��\�\�\�]�Ģ�})|�%4>ч\�O��6\�\�-;\�	�n&���3�nr\��z�K}�U��ȫ�/2v\��^�uU\�l�(�\�9d�M=����������z\n�n��}9�\��u�Ư�\�o�g�\�e�N-�=����爬\���\��\�\��\�\"r]\���F���ճ�\�f\�f�କ����m#\���h\�\�}މX�;���\�tLi�\�\�\�T\')\����\�\�5s �c�G��7���\�c����z\�Y\���[r��>�ž ?t�@5�r\�|\�x�\�꘿�\�18\�c�N	6\�\�\"<�G�\Z;��5d�����=�,/ӂG4\�\��\rλƻsS���L%:\Z�\�Ck����Ҽ?g�tg{x�\�q\�����\���\�ܟ\�\�j\�\"z�t\�\�m��7�k\�s\'q��0\�:jN\�8\r�^(�\\95���\�ךx\�1\�3�1\�\��U\�ADu��ɠ��3#\�F>�[�_�\��\0\0��\0PK\0\0\0\0\0!\0v	�uw\0\0\�\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��QO\�0�\�M�K\�G7�\�65<Ib\"\�[m/��vM[�{��\rgx�\�\�{N�ܞ6�E\�@^\���\0y iɸ\�S��Z��\�3�HF�RB�N`\�<��I��i�\�U�\n�\�`<G�&�*E[kU���[Č�C:qSjA�ku��;��`	#�\�\Z諞�\�HF{�\�\�0��\0\�\Z�B|�Z\�\�\\=\�(���ۓ��\�N\�\�G\�{cUU�*j�n�,_ޚ��\\\�YQ@Y\�hl�- K�t�\�}�\�o\\M5[\�:BNt�w�:\���R3\�N:gc`�\�ʺ7l���s\�إ{\�\r�x\�ּ(8\r\�T�5x��I\�\�\�\�n�0υ�v\�:zz^-P6\���tFq4��\�\�lp�\��C|XQ<���\rg�1�\0\0\0��\0PK\0\0\0\0\0!\0+^\�\0\0\�\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�S�n\�0�\�?�7r�4+EŐb\�a[\�mϚL\'\�dI���\�?\�+�c�\�\�s��\�\�\�#M==R\����\�b2ޭ\�tR����q�{�>^ݰ\"�r��\���� �[���\�D ��TP�Vl���\'��V�	�e\Z[�\��Mc4\�y}h�!��\�\�����\nCC\�w\\��\�^g}\�:\�\'Em�\nA~\�\�I\�|`E\�Q\�ʴ \�\�C(6jIN\�x��N�fZ\n\�C�ޫ�4��r>�^>\"ć�\�\n\�^�\�\�\�o�x\�4��\�\�A�؂>D�\'IG�C�\�8R�\�\�=\"mQ\�\n{Xf�C(�ZYX��Q6�\�	q*\�w�LVx\�\�4�X$�&<c\�W� ;�bG�r\���>\�\r	��~�����Lǅcl\�\�\�\\vA���ʠ��\�\�\��r�c���^\�H\�X\���?��}�#���\�\�o\�1T�.oȫ��\�h�\��۠4�\�zv���\�5Mu\�@�{�B��\0�\�\�>\���\�k�\�?Z9]LJ��=:s�\�k��\0\0\0��\0PK\0\0\0\0\0!\0�\n��\�\0\0\0U\0\0\0(\0customXml/itemProps1.xml �$\0(� \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���J\�0�\�\�P\�M\�ƺ,M��*\n{ͦih2%IE\�\�O\�\�\��\�0��L}��s��}0\�\�;�v\n{\�Fo�\�C�t��\�i\�\�\�\�\�}8�2\�\�\�S\�6K\r�\��\�;^\�+H[�G\��\�ﻖ0\�\�3�������,�]:L1.J����a��vi8��2&�#\�a0J��V�]�cUk\�۳��\���n�\�!\\\�m�濖��\�G/�\�hS\�?���^\��\0\0\0��\0PK\0\0\0\0\0!\0t?9z\�\0\0\0(\0\0\0customXml/_rels/item1.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�ϱ�\�0\��\�\��ho�\�P\��K)t;J�\ZGILc\�Xji߾\�+t\�(���Q���E]1��h��jP\r>N~��j�\�\��.\���\�\�G{\�\�J	�\���D60��o�\�\�,W�0�\�H9X)c�t�\�l\'\�_u�\���ݓ���|\ZP�=\�;6��w�#w	\�E�v\n���d*���yB1\�\�ߪ��	�k�\�\�\0\0��\0PK\0\0\0\0\0!\0ZuD\�\0\0\�!\0\0\0\0\0word/numbering.xml\�\�n\�8\�\��\�Y���H�x�Ţ(\�=\�2m\�@Jv�Ǿ\�>\�>V_a��(\�Q*\�r:\�bZ����\�\�\�%\�s6�\�\�ma�e\�\�S��\��jb[2El�gxjﱴ?\�~�\�f��.�\0GL��$�ڛ4MBǑ\�S$�i	.�*��8u�jG\�\�q�t��;\���#,%pf�m��\\�Ҍ�h�\n8\���\�ِ��љTA^\�\�s�(�l\�\�QYU@A+dU!\rۑޘܨɫ�\�\�H~�4iG�l\'Z\�\�<��+.(J\�Q��\�s�\\8Ai��I�\�9�\�s�� �$Py6a\�P�\�\�_\Z\n�ڙ`aUƫ\�\�<�hL�h2�<\�G\�,\�3w&�gr\'\�	�mi`\�ȶn[J�\�.q�߽�\�s)�&\��S�g^Ot\rVD!ʈ&)��i2����\�H\\�\�\�\0�\n`\�\r��a\�j\�| �#�y���\�==�]��l��)x�h�e�\�\�\�ߩ\���b\��yY2\�6(�W�\�\�5\�-d{Ȃm`\�P��*�:t�-\�\�B�E闌Z\'O��\�p\�\�P`�hՙ_+\�V)�F\�\�EQ�T\�p�\�\��?\�?��\�v��f$��\�[L��	6>���\�\�+�	1��{7����\�B�\�Cc\�ҹg7��Ϝ�������O��4���_\��Wdz	^\�\�W��!�\����F�pX��7P\�\��1fj���[\�a�\�Z_\����.\�h朥R�.��\�=]p�C\�@Г��x�W�\�3���\�\�d4\�\�s{-��()��\�e�\�\��b)�;\�A��\�\�F\�\�D���\��|\�{��\����\�\�\� �\�:�%�6���x�D�z\�w��~g%�Lj%U\�nJ\ZtUR��NRmîJ\Z��_&m��J:\�~������;+\���\�ݔt\�UIGA\�\�I��\"�sRg��\�\"D]]\�.B\�s\��z�6Eȃ���W.M��\"�/B�\"���}\�!��}\�!}\�!}\�!-B�.>�):T\�I%bx\�\��~��Ą\�m^\�\��\0\0��\0PK\0\0\0\0\0!\0�yA\Z\0\0\�\0\0\0\0\0word/people.xml��ώ\�0\�\���\�\��F��jť��\�ubm\�\��\�w�*\�*	 ����\�\�_�*�.\�:	�@��O<�9DR�\���o��\\\�t\�R\�\�@n�\�\�O�\"؄F�I��\�\�\��I�̄�:�\�\�RIn�A�-9(\nq,��؈����~\\8�\�}e�\�ip�:�YV��>Q�0��k\�&C6�\�\rA� �pQ\�ɨ--]\r@O�@\�j@\�\�#�#�\�<\�jHz�GZI�y�A9�a��\Zc��e�h\�T1����\r\�\�LevC��m1L\���P\�\�:�Lx�\n\"�����[6�E�/�����jvL��\�x��Ϊȩ)\��K�\�:\\ͥ\�`\�B.qQi;�0�\�v�\���Z����\�\�_��󏉁?bGJD�c\�\�5[\'\n��_xVj\��<@Z�j\0\�r9��[F�M��w\'�a6-\�\�T\�\�9?V-\�-䦧\�\�h�����_x����Np����0�G�\�\�\����a\ryX^�\�\'\�W696W\�@�SB�g	\�Q\��Zqf\�/\�c�f\�z	{²��WR�\�]��\�\�\�����\0\0\0��\0PK\0\0\0\0\0!\0��I7D\0\0�	\0\0\0\0\0word/fontTable.xmlܔ[k\�0�\��B\�/q.\rMʚ%P{X[��Ȳ-fIFG���\�K\�fNF\�ha�pbI�\�sts��r��\�s\Z|J�\�&�:�ӧ\��ՔpL\�,7Z\�\�^\0�]|�pS\����a���f\�3\��	\�``\n��31V1��6��?�\�7�`Nnd.\�\�}L[���b�Dr�\��\�\��=+r$\Z\r�,\�@+/��\�ƅ5\\\0\�7��\�)&�/Lu@Jrk�$n�\�\�F\�����T�����˸c\�2<����ft��^�gJ�ݧ\�X�ɑ�j~��\�o�آ\�\rR\�4S8\�a�6&�\�\�D�];�ϩ?\�����?\���?�^5�ĝ�\���	\'L\�|�Z��n:\n\�xv�\��.�)vla\�#��h	0\�#ag\��8\�k\��8�\Z�kz����G����$\�ꝟ2b�C4\�\�St\�H�\�\�Y\�\�\�z�bd��\�tt\�1r�\'#�k\�p.7�4[+�����1A׵�\�F\�ˆ2���t$�Yė���\�\�\�;�?չg*�s���u\�*�%\�\�\�\�3)��S�j&G\�+%��\0�\�\�\�IF�w)��\ZA�\�Ϩ�k����x[ѩ�XE�C\�mϊ&)\��f\�ljT	�F�\0��\0\0\0��\0PK\0\0\0\0\0!\0�\�k\0\0�\n\0\0\0\0\0word/commentsIds.xml�\�[��0\0\��\��?0����\�fug\��\��d!*�$a�\�7��-\�6⋗	\�\�\�\�$��r`���R�\�l�m��L\�\�\�\�߿����TMxNJ�\�\���\�~���\� /+�(�Q^�U�,Mq5U6��u]E\0�lKQO�ȤPb]?\�\�X����F\�`�\��W%EF�\���	\�e��\�`�\�4:�]�m��\�\�j���)AЇ�H\��>\�\�My�ͪ�� �UO���>��7N\�}\�\'9})\'�ډ�\\T�\�����\���\�\0F\����h�\"u�V�E��M\�u)����t\�E`N~�\�&rZ:y�����<:\�O.�m\�\�)��\�EH���B�\�\�\�8s i�k!�\�\�e����\�v\���I\�Y\�]\�T\�p�Oɩ�W\�$�s�Yy\��kA�i�K�I\n߳˄\�.�\�xTin����=�}�\�g���\�#oE\�c��>\�u�7\�\�n�!Ů�j\�c\�\����i|�u\�۝�K\�\�T�H`Y�\�p!\�[�3\�=d\�6��+\�~\�U�\�Mg\��yeX\�\�\�\"�����\�`\����|wT\�1��4M�\��w\��I\�8KxK\��5��s#?����|�\�\�\��\�1\�b��\�x\�q�\Z\�Bg�\�\�`>�8N������8(6q�1C\�\\/\�	�u�w\��\0\0\0��\0PK\0\0\0\0\0!\0\�Ոf>\0\0\n\0\0\0\0\0word/commentsExtended.xml��ے�0�\�j߁ʽ&�D�ѩ\�-�w�2!\n5\�P	���q�]����\�\�Nw\�\�\�ց*��\0��r\"Ҝ\�\�\�\�z2�.1Oq!8]�\�\�u��\�Ke��Q^\�\�\�2��J�\�\�RFj�Q���\�D	-�\�\�|\�v�\n+�R\� ����jmƌ1?`\r�8r\�GK���z�dX��\�2\���p\�9#@&B\�\�\����]u@\�(�q\�!�\�H�n6�\�tI�8�\�%\�Ǒ:\�ĺ.$\�\�\�V(�Ks�v�a�����\�?�\"/O��f\r\��k�#����&���n\�P\�\����\�M_[�.�\�Q�>�_$� �z}8G-L.\�Y.o\�\�\�\�ˬ�q`E�]%\�\��\�)�����\�?+.\�m\�cFj\�M\�\�\��1\'\�Ta;�\�\�%\�4\0����gI7�K6M<Fy\�\�t\�o0�\�\�V�\�\�j��\�^���9ڦ\����`]�\��sf~gX�%��h�\�B\�\�\�825d�2�\�3PͬXuӁ\��v�\�\�;�ޘ������\�\��4=\�2��$^��$\�H\'|[\�h�\�P�w\�(ȱ\�A�!\�Obo�\�\r�U\�̓?v\�p\�u3�\�\�\0\0��\0PK\0\0\0\0\0!\0�)�]\�\0\0\�\0\0\0\0\0word/webSettings.xml\�Mo\�0�\��\�4��I��\�0�ۊ�\�]�\�D�$\Z�\����?ҤK�i=\����>\"M�\����ގ+@/H8	�\�5�B\����~��H�g\�����4ܒ\�\�\�OWuV��wwZ)\�f�-\�ƹ*�}\�6\\Q;��k\\,�(\�pj־�\�϶�`�*\�D.�p����\n��`�\�Vq\�:�o�D\"h��\�\�\��\�j0Ee�qk1%{��B�`\�\�	H	f�B\�&�\�Q�Byt��@<�\0fL\���\��c�8L�\�\�F�\'\�)�}]k04�H\�O\�av^n\�\�aK\�B\�\�0zu\�\�E���[ϡhn���\�}\�o�\�w�t{o�\��)֛7\�P�:W\���Ǫ0�\�\Z�}Mpb�\�}�QQ\���lG�u\�#\�Qd\����\�i\�q\�c��!\�\�|]�\�$�Fq�&\�r|�r�\�4\n\�i:\������i���,8\�\�գ�k*\'�x\�`Vj\�M\Z�\����Q)��������,�\0\0��\0PK\0\0\0\0\0!\0�WgC\�\0\0\02\0\0\0(\0customXml/item1.xml �$\0(� \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���j\�0�_\�\�8롌��\�\�A��vq%1\�R�Ց����\�	v����wk�\�crL\r<%($˃�����\�\��$�㙰bصu_u|��\�qJU\��,�TZ\';c0�\�)\�F��H\�y�\�\�[@�)˭\�]\�O\�,���Qu\�\�\n�\�}>�c��\�\�*�qp��^~�X�ρo�lB�3\����-���+\�~\0\0��\0PK-\0\0\0\0\0\0!\07�Q�\0\0G\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�\Z�\�\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0_rels/.relsPK-\0\0\0\0\0\0!\01��i\0\0@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0��٤2?\0\0%N\0\0\0\0\0\0\0\0\0\0\0\0\0\0�	\0\0word/document.xmlPK-\0\0\0\0\0\0!\0�%��\�\0\0\� \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0I\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0�[	^\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\0\0word/comments.xmlPK-\0\0\0\0\0\0!\0TWZ�\0\0\\\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�S\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0\�O�M�\r\0\0l�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�Y\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0v	�uw\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�g\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0+^\�\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Sj\0\0docProps/app.xmlPK-\0\0\0\0\0\0!\0�\n��\�\0\0\0U\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0qm\0\0customXml/itemProps1.xmlPK-\0\0\0\0\0\0!\0t?9z\�\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�n\0\0customXml/_rels/item1.xml.relsPK-\0\0\0\0\0\0!\0ZuD\�\0\0\�!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�p\0\0word/numbering.xmlPK-\0\0\0\0\0\0!\0�yA\Z\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�t\0\0word/people.xmlPK-\0\0\0\0\0\0!\0��I7D\0\0�	\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�v\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0�\�k\0\0�\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0gy\0\0word/commentsIds.xmlPK-\0\0\0\0\0\0!\0\�Ոf>\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0|\0\0word/commentsExtended.xmlPK-\0\0\0\0\0\0!\0�)�]\�\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0y~\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0�WgC\�\0\0\02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0customXml/item1.xmlPK\0\0\0\0\0\0\�\0\0��\0\0\0\0'),(6,'Activity 2.docx','application/vnd.openxmlformats-officedocument.wordprocessingml.document','PK\0\0\0\0\0!\0Z}q\0\0\�\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�j\�0E����Ѷ\�J�(�\�ɢ�eh��4vD�BR^\�Q����\���{\�\�\�`�\�*[�Қ��\��p+��K�3�ȟI\"3�)k�$kd4��L\�B�jJ2�ѽP\Z�4�u`�RY�Y\�W_S\��/��>�zO�[�\�<&2�A\�\�*f\�+<nH<�@�צ1e��9�$g\�ta\�^J�M(P�\�	3\�\�6z0!U�\�ղ\�\�I�&K\��\�\��R@6f>~2�u��^Pa�\\��8|`2[U�C�On\�[!\�WҪh+�I���(��\�)xT^��\�q� \\���펇Qp��s\'\��\�7��g\�	Ra\�M\\���8�y�/\�\�؜�\�α�.\�\"�g��\�4I�\��|����6�/�\�2 d\�\�Z�\0\0��\0PK\0\0\0\0\0!\0�\Z�\�\0\0\0N\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���j\�0@\���ѽQ\���N/c\�\�\�[IL\�\�j\���<\�\�]\�aG\�\�ӓ\�zs�Fu\��]�\Z�U\r��	\��^\�[��x\0����1x\�p\��\��f�\�#I)ʃ�Y�\�\Z����\��\�*D�\�i\")\�\�c$���qU\���~3��1\�\�jH[{�=E���\�~\nf?��3-��\�޲]\�Tꓸ2�j)�,\Zl0/%��b�\n\Z�\�\�z���ŉ�,	�	�/�|f\\Z�\�\�?6\�!Y�_\�o�]A�\0\0��\0PK\0\0\0\0\0!\0���\0\0�\0\0\0word/_rels/document.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�j\�0��\�{-;mC	�s)�\\[�d{�C�c�MZ�}EJ�Ӄ�3bg��\�z�;��5�$���uoZ\��\��\'ij��A#z\�\��w\�7T�\�����b���hXq\���Є�\�:-)H\��AV��E�H\�%w\�ȯ2ٮ\�v�#�b�?ٶi�\n_m�\�h\�F�H6�!S�I�\�IB�\���4*��\\}�\�\�u�.l|!8[s˘f�p��f6\������\nY�	\�ٚ�x�	�\������\'~�\��\0\0\0��\0PK\0\0\0\0\0!\0.�\'\0\06�\0\0\0\0\0word/document.xml\�]�n㸵���X\�<�w\�\�4^8��\�v�w0٢\�_-\�\'���R<\�žF�\���\�G\�\'\�9��-\�q\�L\�h3c�\�y>~\�<�~�ݗ�g�B�\��R\�Zb\"t�+\�\�y\�O?_�딘�y\�r_�\�4��]���\�w\�3W9I �М�#\�\�\�qtV�\�7\'�t�2j�8*��\�P:�2Vڭԫ�*���r�1�K\�sSJ\�9_��\�j>�\�H�Yq<�c�eF��h\"�\��Jg�P}B0\�zm�T\�ѤN+ث%B͝A��(�v��bp��Q�/Sj\�F��L���%u\n�\\E\"�ʡ\��\�R�*\�wI�G<�\�\�x4��.ûz�����h\n\�J�\\\�7܌�:/%:<Kۿ��Ǯ�\��\�?Y�\��m��h\�-|\��\n�\'����R�J/#r�i���\�7�j[�\�:x����ܦ�)�\��|3\�Zu� �i�m�0�̬\'h\�\��;�&\�\�ږ\0��/8u\�*�Ѱ܄�@\�#G���1�`f\�\�h�4m�^�$�Q�O�v3��1z\�G\�J�.o	\�i���x�8g7�Pi>�G�CԀ��o�\nC�+u!T(w��Fl|���\�T�^�O맗��\�Jy\�\�\�5sED䣦n\��:�\��y\�\�|��&!Z)U��0	\�ҿ����Ӻ7+�cY%\��D܁�B=\�Bc+�\�Kd}�9���\�\�y+KT\�\��Z���\�Ƒ �\��^\�\�\�\�\"\�Xp��\�?��B ����\�^hV6tL�kr!]i�,�\'/���G�Jge�:�o+\�ߧlhf%�\�Y�\'G�\�b\"|_�m�ωW٨\�K���>b\�C\��~w\�KyL<�L�h��j|�\�gq�\�\��	V\�\�\�V��\�\�\��a0�F\�{QꞱ9���\�ݛ�\�#\�B�\�h��Ow��F�^�\Z�)�-x$��v)=4rxpؽ�ԢKɛC�}�zyM\�\\��l]bj��Gr�*�?CCb\�\�J3�\�R\�Cw�\�\�av��爏��\�K\"�1\�頙�\n&FǊ�D\�8�B���д\0\�	~�\�%\����q\�#Os#\n\�\��j���q����6�\�\r�IS셻\�p� �`�\��d\�4\�\�#r�\�\�ɷMC\���\�\�AR\��^�4\�EpQ����Z\�PJs�,Tyo\�\�c�h\��ܘ�\�\�0ګ�\�o\n\�30C��o�Fۤ�z\�\�\�Nƈ��=[���7����c\�H��\�5\�\0\�ؿ/\�JY\�I�I�m/\�L\"\�\�\�߇�j��դ\�\�q�Hxy!��\�.�XY\�Ѐ��}1`��\�\��\'\�߰���8�\����\�I7�\�r(}����\�QL\�\�\r\�\�nz�\�\r\�?\"\�צX|�{��!%\�f\�\���g\�\�E|S��_���Y={\��U��_�\�ˈ\���O\����2�a��]��1$�rE�@6ۊ9*ĔmJ�d\�	3*,���`7��wW�G��\ZO\Z65,3�W��d�Y81\�E���ӄ�\�\�]\�<�\�\�\�\�@���۱�\�V���\�\�\�]~V�\�\�w2v<\�\���;V\�eC_)\r�G\�f\�K���0�6�c���\'&�Hh��@\�6.\�\�L\�\"�*�%\�c���˿n~�\���\0q�z\�\�gJ�\��\�\�_�����x#�Ȩ@�=��Б�P\�\�G{*��c���ry�9r\�L\0\�D\�\�3:}\�_�	b	�<�Xb�\�)\�g\�g?\�v�G�`On`஄��\�\�@S\�C`��e�2e1i\�\'���\�����n@�Df=�%�ݙ6n%@e��F&\�ȅ�O��\��	J\�G�D�{rr`5���g\r؃\��P-�%�h�(���\n\r�k9r\��)$�1\�Ӊ�F��p�1S��ݪ�1%�d{1�\�\�D�?\����O�\�]�T.Us%V�\�p��:u\�F���aOӱN���W�d\��hhg����9sE���_��%f�%\�m�l\�E�鸩���)\�-\'P|�#*	�;w�.we�\�6\�\�A��v7U���A9nw�-�-$Q\�\�\�*\���\�q��\�{iY�*\�\r�h���r\��]p\nCX»��/�k�&X�\�DZ�a_#�Ɠ0\�D\�\�\���\�e�w��\�c\����{|���\�\�8\�.\�)\�\�\r\�b�9D(`<ZZq@^\�[\�ƩY���1��C\�n\��Vk�\06\"\�iq,T�i[�BO�;V�\�\��Ps!P\�\\�\�\�X\ZO��  *��\�	ϕ\�`NL�ǹb�Q�\��\��\�N\�ENmj\�S��e�\�M��\Z�$��\�qw\n�ru3�\ZC\�fSw�]��\"-\�\�A\�\�\"	~O\�Op2C��$n���h9 \�3\0���\'\���V�V[\�-.&Z��x8����[�\�UquZCj4פw\�\������5E��Ҥ_ov�\�M,>-\�\�\�\�м)%M�-F\�&5�\�9˳/t\rV\�/w=%\�q%���^�\�\�O\�,\�~�iŅ���\�\�?�1�3\�6=�b�\�\����+T��U?�9��ϷB\�H\�<m�\"�ݗ�r<\��\�ޖ�h\�\0~�Q\�k|\�ޮ�\�\�i��&4�t��o0\�Yڷ,���9�pA���ʕTQ\�C��@� P\�xBh��<�\�f�~�\�z�\�\�\�\�hW;�M�\�}ue\����\0\�\�ݢ\�Ѫi\�(�ɩ��.�O\�\�\����V�}Q���[o�9sŽth\�ڀ>\�\����\�ܧ�mW-�_\�e\�L�(Ô��\�f�z0\0\�N�ɐ��y�;\�\r-dk\��\�=>��N\��\0h�\�\�%�\�ޜ]�\�=?��\��N�Q@�}\�\�:^����=A�f\�Sx�	3�(�7RS\�.1��\�\��o�tL-ݮc\�Cfw��\�k.�\��l��Y���S�\�O�\�.��v\�l(q�<�\��\�j\n\��n�_\���&\'�sZ?3�`֏I4�B�`�j��\�\�#�cʤ�\�\�\�\�Hl�H\�\�,O�\�E윔1��\�n\�E\���\���Ɔ������3ܮ�\�|`܂\�[-_]5N�W+�\�ʚ�\�\���8?NS��t&&V�\�)�@-C\�\�T�\�4�#���%V)�Y+\�\�-���\�\�O\�X\�zW\�\�eo��T;�Z}V�\�0���T1�9���cyH�s<;T\�re�\�6;��\�K;��~l7+\�|`�\�\�\�;V�\�᳦\�q\�\�<a6�IZDD�ѯ�%L�\�f\�I����&=�\�ڼ+��\�5\�õ	m\�l\�`\�\��\�j\�˶\�%&w��m̤}U\�U�3��y�9ۙ�!\�I�r�S8\�e\\\�ཎh�_\�g	��\��%F�Үx�ӽ��\�\�l�CfB�M/Pjj�gQ�ɨ�M`5宫�x�`��\��\�\�\n\�|[\�\�ダc�\�D��q�oa\�J\�\����V*\����\�\�Nlx\\\�\��\�l\�ɲg�0�\�=WCV�嬨<�\�\�5��d\�\�\�\�n^b�/vdk�\n�\������n��}�%1N�Y�݇\r�\';d��9�K\0�ٱx@�\��kR\�\�\�\�+T\�Ћ<���a�#~|e�?mW���o\�\�א:�E9u* �!�\��\�@!}M�����\�R\�K0`oV	���\�1x�շl �o05�\�ۃI\�UŘ�Ns-|Qׁ�z�\�!ͭ dN\�Y\�cq\�\�\�ADꦾ�\�\r\�;j��\�\�c\�\�\�\�\0c\�_\�/>T$\�\���(�\�\�\�o\rs4M?f�\�\�+4\�$`8[�|�Um�\�\�N�K\��js5v#\�\�\�\r�;kF�sG�\�\�}p��%\��Bѣ�gI\�p�\�\�{y/]{1d�\�-Lq�\n�VVw\�k\��-OX\�n�\���uSG\0�\�\"d�F#\�#a(\�\�\�\�\�=�GZ�.9w�X�\�!i\��cA��\'�\�\Z\\�\�;]y�\�\n�=�y./��\�c�=\�eR\�6��r�_f��-�M�d2\�Z��j_�؂릅�-�3��K\�tJ�ïW\�a�!\��p����\�\�]\�\��\�>ᇽӚ�\n\�\�\�\�\�st�\�wW\"\�E�Yo�W!\�e�z\�\�\�!Q�ߺlu�H�\�\�:I,wJ3\�N\�mv��UΗ\0�\�Q+\�\�\�h���6ŧ�V���\���1!w�\�\�@���\�\�#h\�\�1�^(\�~��/jի\��v\�V\�k?u�C�\�\0\�-&�fOϔ\�h\�v�b1�\�U憅�\�)\�oJ�kX��\�[:\�y\�0�BK�YToS?�L�ӡ�tB8�\�AG�sYo\�\�kB\�\���M�bz�|�~b\��ـc�\�`�m�d�\�9�V��(\�	\�\�r&������oJ=ְ\�\�yl\�R�U�53���K��\�\'-��_�\0\�MO�\�좎\�\�6|i�\r)N�\�\�%�S�\�O�\��\�����/\�09L�\�Rh\��|��W\������v0�Bƴ���\r�\�\��\�\�F<H֞��#\�׭��\�,���id��\�e�sD\�\�n��B��Q\�vy��{w\�G\�\�p:�_\�\�4�\�F�yT�]�(\�ъ���d�\�\�\�4�x�ĉި\�oD\�卢n��\�\�W*\�\�	oŒ�Qԓ9~U\�D#��\�\�\�B��F�[�N4�\��1��ޤ4B~�:͔\�\�\'�ωU嵆}�4��8V�\�\�&�gW�\�И�N\�\�C�(�1�%1]\���\�L96\�[w�󽖔\�.C�\�+\�K�SjTɸA?ʝ\�h�\�i�\��\0\0\0��\0PK\n\0\0\0\0\0\0\0!\0��\�4�\0\0�\0\0\0\0\0word/media/image1.gifGIF89a\0\0w\0\0!�MSOFFICE9.0\r\0\0\0sRGB\0�\�\�\0!�MSOFFICE9.0\0\0\0msOPMSOFFICE9.0Dn&P3\0!�MSOFFICE9.0\0\0\0cmPPJCmp0712��\�\0!�\0\0\0,\0\0\0\0\0\0���\�����\��\�\'�\�;�\�b\0\0\0RQ�xx�������\�\������\��,+���\���\��\���\��\����\�\��������������yy�\�;�\�b�\�\�����������\�\�����������qp�bb����������uv�ZZ�LL�������xw�jj�NN�A@����zz�mm�^_�\����\�\��yw�����\��\�yx�xw�RR�,*�++�����������\r\0�8>���������������4567��=�./0123<9:()*+,-B\�@	\n\"#$%&\'\�\�\�\� !\�\�\�\ZC\�?\�ˆ\�A;<\�HT(\0;PK\0\0\0\0\0!\0�UB�,\0\0�\Z\0\0\0\0\0word/theme/theme1.xml\�YM�7��\�\��\�,�{l\'mv��uRr�g\�e5#3�wׄ@IN�\ni顁\�z(��\Zz\�YHh\�QI3c�l�K��\�5������H\�z\�,&\��Ӥkծ\�@�O��]\�\�xTi[�q��\�u�bֵ��?�\n�x�b�}\��`׊8�\�U�\�͐]�3���)Mc\�E5\r�A\nO�ߘT\�ݬ\�\'H`,܎�\r�=�bY���!�\�d�O\�#\�\�6%lp\\�_l�<��H��)��ct\�-@ 㢣k\�\�Ϫ\�_�.�\�b[���\�.7�\�\�.\r\'KC\�q�fo\�_\�\�\r[\�氹��\0\��\�L3.�\�V\�srl	�\r��A��\�K���+?\Z^�������UK��\�n\�\�~�?\��+PVln\�[vo\�4�E\'\�h\�m6�b�KȔ�Fx\�uF�z_���Օ\�\'|\�Z�\�C��@%r�\0���)�΃ORp��7�	e�ٮ\�#�!�ˏ�J*�p��u\�䳍&\�0?\�3޵>^�\���W\�O^�?���\�\��\'?\�co\�݀IX�{�\�W=���\��o�}mƳ2�\�O_��\��r\�5Z߼x��\�\�o��\�\�gx/��2|�c\��-t\n\�\�XL\�0\0��\�f1� .[����Jz\�#\r}k	4\��H�\��Tȅ	x}�P#|�s�\r��Q�)%}�\Z\�tS�U�\�<	̓��2\�.�\'����,\�3�\�ɥ!�\�\"RC� d=F\�`�\0c-��\�O)�S`Ї\��1�h�iet\�\"/A�o-6��A���:ёbo@br��\�\�p\�aldcRF@�H-R_8\�\"\�!\"Ę\�\�v�\�\�\�2cN�!Y\�:2\��؄<����z\�E0�9\�$*c?a\�b�Bp�r#	�\�Yy�\�\�t\�\�HK�\�{���!��=�Դ%\��\�L!RΫk�\�\�B�_�w��ɻ\�\�\�=7k\�$\�����Rl\�M\��\r�.\�M�\�\��\0Γ;Hl�\��_���m?\�^�W��.�\�u]���\�ݧ��#� \�)egbz�H4��2Z>*\�\"Q̇\�pa\nU���yt����FY\�:d`F�8T�ѷ\� ���Yk�V<�\n\�W\�\�l)\�\�Iĳ\�fk��t�j�z\\.H\�w!Q\ZL\'\�0�h��P3\�	���E[�\�\�B}\�Y�@�ӆ\�d�\�z�2O�}�ݝgz[0�i\�\r\�\�H��ɴF��\�t�e�\0�7\�8םUJ5z2�4Z\���k)\"k\�@�NŞk�g]k*n��τ?&u�0\�Z>\��o�e�2>�,\�`�+��9J��X\�\�4�dŭVo\�9~�\�:��9�UN2�N�Ϸ����/sb\�$XV\�\\�>��S0!��.�r[5�\03��f�\�\�\�^EqM���j�ڢ�\�\"��(e1\�઼�S��b�>+��Of\�$]�Խ\�Hv�Ds\�\"OM�~��C�\�j��\Z�L�׵�ShݶS\��B�\�j0��dl��jթ\��BP\Zn�4���>\r\�W�< �{��m�����b\�\�uuN8STљxF���3%P����q0Oq\�zd�=ǫ�^\�n�Ê\�p\�J\�\�5*=\�mԆn\��\�EPx\�\�l\�x�!����j\�x\�\�+>��T݃�\�X���յw0\�=�e���̣f}\�it�\�J�\�U�A�]\�x\�~e\��Z�\��s۝\�c�(�\�kxNsخ4k�Wq���\�\�TZN�\�sZ��\�\�=\�c-f^|\�U���\0\0��\0PK\0\0\0\0\0!\0r\�F\�\0\0�\0\0\0\0\0word/settings.xml�W\�o\�6�����S�()Z�B��5E�u��7Z�m\"�(���\���%\�I\�銾$\��\���;�z�\�ԓ����j\�]�鄵��x����}_\�\�\�Di\�V�-����������W\�D1��MM@E�����\�\��\\�;\�Pu!:\����\Z>\�v\�P��\�f�h:���\�\\�\��p:�Wӽl�QŬ\�Jlt/��͆�l�g%\�K\�\"�(�\rk��8��D�v�SV[����Jߺġ�-\�\�C/�\�Q\�\�\�K\�\�:)J�$�����=�P�\��\��hT���\�\�\�\��\�/�%��OG8ꘃ\�=�}�\ZbըS\��\"U�$�t\�גʡpǸ6er�m��\�\Z܁�N D\�]����\Z�\�\�\�tL�P9\�qM\�=\0����\Z\�ձ�6-X֌��c����\�#S�\r\�\����WZt�t�p�\��;u;֚��\�\�&^�fr\�\��e�\�RԖ�\n�A�J��Q´\���\Z�\0�hi\�~\�\�w�b�\�{\�_��^�X���NC�,\�+v߇{�O5+����Ҷz�W��Fs��\�[@\\��;(��S\�\nF�\�����L5\�B޴\�\�O3\�7&�\0�Z���\�RM�\�0Z���A��es�R��^mYʣ�\�\�i���N]�G9�]\�A��N䒠�p!~�<\�i\�ω-\\H@�8�)^�n$�\��҉,IF\�n~��.�܅�>AK�oa���Ӄ0���Ӄ0äpf!\n<?v#�0p\"9N\������8�p1>ϑ�D�\�X˟!?�qKs\�eΜ�E/�^/<�_:}[x�θ-xf#\'���3D��\�\�Y��;�\�\"T�K\'��e\�w�|��\�ԙ\�%\��א �q[�\"n$&��\"�t\���\�A�Bs�\�^�&\�w���=�#e\�m֒\�\�]�\�\�{��|X�\�\�k[{���k\�f�\ZZ\�\�\\�\�\�$W]\�6\�\\\�Q�=\�9��\n��\�\']�>�\�R\�=J\�\r�²xA0J�V\��\�\�\�~��R-\�5O�}[�;H�sx���\'ߌ\�[jF�\�ej���]\�rՏvG�n�.\�w5��v��~ h��\�ǀ�Xo�a�\�3�\�o\�\�\�LÖ��Ϸ4�L,-8ӈ��3-������\�$,a0\�챧oD]�#�ޜ�/HCԎv,v4(/1ƥMM	{�\r�U\\\�o��W\r}\�Bl\Zp\�\�I\��3\�뙻\�\Z*���τM�\�K�;�\�quj\�\�\���+X:\����\�`^�T���N���GhOM:��1[���\"���g�U�\Z1+JяK/�a\"ĳ\"_f� \��l\�E\�,,���\"�b�\�ؤ�\�\��\0\0\0��\0PK\0\0\0\0\0!\0�\�~�\0\0\0!\0\0\0\0\0word/_rels/numbering.xml.rels�Ͽ\n\�0�]�\�\�6���4\�\"BW\�8�k\Zl��D�oo�E���\��~\��O;�\�d�\�T50r\�+㴀\�\�\�K�\�\�;�P��[�\�3͘K(M&$V�L9�\�INd1U>�+�\�G���Q�����w<~\Z\�}�lP\�\Z`�%\�?�G#\�\�\�ݒ\�?*�����5e��������w-�z�{\0\0��\0PK\0\0\0\0\0!\0�NH��\0\0fy\0\0\0\0\0word/styles.xml̝\�W\�:\�\����|��@�\0�\���\�\�\�\�r�}ܣ\�\n\�b[��]`���d\'�\��\�Sξ@\�d>�4�i�#�\���$~r�	���\����2\��\�\��\�\�\�\�Q�\�,�X,S~6z\�\�\���\�o�\��9\�Y�i�>	\�F\�<_�\�\�\�\�%OX�F�x�?\\H��\\�U��	S\�j/�Ɋ\�b.b�?\�&�\n��P\�b!B�I�E\�\�\�\�\�+k�L��Xek\�cڣT\�Jɐg�\�t����t�9<�D�Jfr��ѝ�ZdQ\�����J\�-\��$�1��ڲ\�\�8s�\�d\�	\ZI���>��\�cM\�C\�\�l���}\��\��_�\"\�3�Vݪ\�m�\����i��\�Y\nq����\���4#�	gY~�	\��\�Ҽh�$\��\�\�\"�}�\�\��ß,>�\�\�-Sӂƶ���\�m<ۛ~��DoJ��\�̦�枍�ڛ�\���c\��ZwW/\�\��X(\�~\�\"\�:\�\'\Z#��ɻ��o�hV\�ډ��7\�}0\�ZZ�R��S��,\�\�r��\�\�\�Ko�~}��TZ�g�wv�z\�\'\�JDOk_L�\"\�?�<���h���K��jC(�T�>:=�Qg\�\�S\�WF��Ӕ�|1��v!�;�\��a��\'\�엜���D\�\�cc�\�z\�\�,^�\�~���\�\�\��k\�\�\�v4y���֎޾֎,\�W\�H�*�w��85�9��9-�9��9%�9�@Gsq�\�8\��\�e\�\�Z�9����{��\�\����g\0?\�\�\�\�ݝ\����ӹww��\�\�N\�xn�\�\n��\�\�|�\�R\�\�y��\�4�j��\�hxf\�㊤��2�U�`Z\�\��\�bE\�?�禪\�\"X��B\�Rh\�y��Ǻ\�Xi!P�P��i\�\\�4䔁M5�`�ɜ 6W잌\�ӈx�\�D���	h]?/�HAP\',Trx\�$#\��E6|�$�X\�1\'b}�	1\�\Z^X\��\��b�W3�0���j�*\Z\�HU4��hD\�V\�\'ոU4�q�hD\�Vц�۝\�c�\�뫎\��\�4G\��c&\�S�\0ç�\�ip\��Wl�\�Q\�vl�\�\��|�\�spG1�mHT\�z\"S\�k�\��A�׆G$�\r�H`\�p�\�\�e�Y�]\�\�3�b���֒z�v\�\�\\\�WˇG\�V\0�Bed2h\�D���5\�\�|\�Voؖ5\\V/�i�*$A+c>Ф\�\�W�,{L��q,yDG�\�J��V��غ��\�/�Ւe\�\�J\rD��~}~>�a�����Hi�v��0t+����\���\\�2\�\r�\�s��1�#���\��i\�.�\�g�ޞ��� �dJ���Hz�)RA2�Z\�?��\\2\�\�n//�\�9qƒU�\� Ж΋�:���,\�_L	s\\�JTw$�\�aì����\�S\���Z\����]\�Zk:\��eB7|�`�����m\��w���\�\�4fY&��P�yT\�]��;���x2�jQ\�t���\�\ZH6�2.�4�\�\�v\���K2�GpH\����DD\���Q��¨|`a�~�N\r6�2�\Zl��:%�h	P�Q\�\��Ot����3��3��3����O_,�\"�n��!�b����hҜ\'+��z&B^\��� -i�J.̽2-/\�&@�c\�1\�b�\�Q9���5Ͱ(\�EpD�ű�D\�ֶ��l^��\�\�\�\�1�	�1�R\�W�>�mu�<+o\�x\�|ی^�=?��e̖���u\�\�`�\�`o�\�\�aۘO\�����\��Hɺ��f�\�Qc\�\r\�\�\�\�ەD\��%\�\�d�\�v�ܰ<\�i	�����\�iòK��zh\r�Ӯ�\�\�x�\�;튢�q\�n�ic\���]QԐJp�\�l�N?͸\���\�m�Q������\�[WnD����\�\�오i���z\�}��\�9�(dyܾq©�M]\�z\�f<h\��?q\�\�2\�q\�n܈\�yǍ蝀܈^�\�i�JInJ\�\�\�F�NRn:[����=.[A{�l)>\�j�*��\�p#\�B��P�\��P���P!-T�@\"\�B�0�P�=N�\�\�G��\�#THA\"\�B��P!-T�@\�sm\�4�*���\nh�BZ�v�8@�\�\'Th\�#TH�*���\nh�BZ��*D��\n(�s/�B\nZ��*D��Z\�j\�/Th�*��*��R\�B��P!-T�@\"\�B��P���P!-T�@\"\�B�\'\�\�\n\�}�\n)>B��P!-T�@\"\�B��P!%T`\�%THA\"\�B�����NQ�.�?\��t^�\��\�Uըo�[�먣��u�ܬ��\"|��!h���\�\�� biQ;N�׹��ԉϯ\�\�;|\��?�T\�aϙ�q_KpL\�+\�떠\�;\���%Xuweߺ%�����\�\���=\�4S3>t�we\�9\�]3�#ܕ�k�p���q\��$0\����I\�q�l�/��p�N݄����Z�c(��Ns�z\�M\�\�F7\�O\'\�X7\n\�a7\�\�\�PfXW�\�M��\Z�\\\r0���(oWC���abĺ\Z���O\�n���\�\�\�\�\�j��s5�ʰ����!\�\��\�\�j��v5D��\Z.���!\�jH�r5���\Z��]\rQ~�U2\�Ր�u5$`]\r	^�WC���!�\�\��(J\�\�(\�\�q���!nB�\�s\�УZ�Y{VK5�g�}��9�Z�;\�M\�\�=7��\��?��c\�(��\�(?W㪥6W�\�M��\ZW-9]���:]���:]���ܮ\�UKm�\�UKm��O\�n���q\�R��q\�R��qՒ\�ոj�\�ոj�\�ոj�\�\�\'d\'\�\�ոj�\�ոj\�\�j\\�\�\�j\\�\�\�j\\�\�\�j\\�\�t5�Z\�t5�Z\�t5�Zr�\ZW-��\ZW-��\ZW-��\ZW-9]���:]���:]���n�� �	�Y\�T\��^\�˖9�\�\�S\�3�\�Q�\�\��c\�Uf�	s���\��\��\�=FQ���\�~�:\�<[\��\�S��Ͷ\�\�9V�Ze���sp�\�t2�L\�o��\�5>�?�뭽\�\���.ǣ\�\�FS��j<\�\�lt\'�_�c�M&\��}\�Y\�\�a�h[,ʿ\�\���=鬒I\�Igk\�ԟt\�|�Y��\�\���fv��c¥�LX�<�\�1���,��J)��+�_\Z���r�\Z�m\�Ve\�oW�����{�\�*{\�hynT\�\�j�z�v\�T�\\\r|We�]-\�\�\�e�\�ש	\�\�\�heK�\'V��\�S\�7���\\��\Z�E^~zx`�\�\���\'��\�\�EN�~�1\�\�\�H):P]$\��Hc�qYˀ\�kv����u��iϭ�؈�7\�Nۻ\�qezO_MV\�6�������\�_s�R%\�\��r\�S^�������z�7,26�t�Z�\'\�{���\�\�\�i�\�[�w1�-� �hd\�\�m�4��5sz8�\�\�E3󧼭�f��S3\�\�ʤ\�wލ��\\]\"\Z�iR��׸�l\�\�\�7l��\�jr\�q\��\��^�{��e\���t�l�\��\�>\�n��N1\�x��\�f:��׌\��U�\�\0\0\0��\0PK\0\0\0\0\0!\0�ws\0\0\�\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��_O�0\�\�M��\�P�?�\�5{r��33�\��n���i�!\�\��I܃o����\�r\�t�-�\�ƊB\��b�bj7Go\�e8C�uTq�\n\��\�\�M\�t\�\n/�\�`�\0x��	\�s�wN\'[�Im\�ʋ\�\�H\�|kvXSv�;��8�\�\�\�Q\\C\�\�\�Y�\�G�7\0\�0\� A9�ID�\�\��H{u�Q~9�p���\�N\�\�\�V�Ʋ,�r\�X�����_�_\r���b����\�	�C�\�K\�+{��\�\�\��53@]a��\�sAe�wgu\��\�\�p\�\'��q�\�\���\���w\�Ժ��ԭ\0�P]>�W�\�N�~٘4��O\�\�{|*I�a�lƏO\�%\�F1�\�Y8��\�4ϒ8��W\�_����\���$\�ɐ\�\�t�/3�\0\0��\0PK\0\0\0\0\0!\0�,_\�\0\0\�@\0\0\0\0\0word/numbering.xml\�[\�n\�6��w4\�n�Ζ�\�i���]W�zY\�ms�D��O�\�\�\��X{��$%b[�;\�\05�-��?�\���\�\�7�8R��f�$]ո\�U%	q2꪿\�j�J\��$�#����@��\��\�o^ϼd��\n`$�7K��:f,�4-\�(����dd\�.kd8\�\�f������J)	P�΍�L�L\�\��qh!�g`\�m-����\nè\�h��\rd\�\0���\reU�jiܫ- �x��\�\�C\�A�U\�\�Fr\�!Y\�H\�zH[\�o8IQ�CBc��-i�O&\�+\0N}�8\�l�z���q�P\�#�Z\"\�VX�\�b�\�\n\�U\'4�r�WK{\�\'\��\�_�ܒ`��	\�\ZEĂ$\��\��\��\�\0����\�Q�n�\ZG�˾\�\�V�rx��y�\�Hz^�h\�Gd�C,-�qas\��p�q�Ь\�8�\0)\0\�-�V��,\�CF��\�\ZN���8L��W�>KGO���(��+4�4��U\�\��c�V^u띐=͙c?�#!��QB�?��#�!\�@ௐ�7�z)�\�{\\O�1e��Ү�E)\�\�멗q|�H�\�K\��\\���\�J@���	��FK\���B�,e]�/!^J\�Qy\�La%S8�\�]5����^\�#_�9b�v\Zr�CɃ���[\����-8\�3DU�O��D~&���*N\�\�DI�Eo\��\�X\�s+�2�\�ʕ�;�u��26�!��re\�rsǸ��0\�\r\�f����h\�v9.\�0n\�\�\�-\�Y`��5�Dw\�\�s\�\�\��\���\�B\�ќ\�	װ\�A\�qD�\��B�c�2�$(`���*�+H��ʔctUbX\�g)\�R�\�\�r\�eY.kt�>�����H\�\�֋6���g���ǂlq˝�n\�\�q|�#�\�W�\�w����W1\�8\�\'\�^�>�����a:F�\�vD�\ng\�\�*m�\�x��(o?`\� \�w�#y7{���|PJ�\�\���\"��h\�$\�}\�M�~}�\�nZ�[��0� G�ES}作����X�F\�\�M�g���\�0�)���V\�%|Yn&W�~��A\\\���S���\�r����\�0_���\�D�^��- \Z^J\�\�tMY���8\��9�������\�/PV�X��\���O�6yԳ\0ã\�\�\"�H�� �8\�\r}\\&P4�\�q�nà��\�\�82p!\n�\��<�\��\�\�	\"g\�vY\�\�tI\�v\�5\�A\�:]~d�\�ӕ\�Z\�k��n�]J�OW�k���s\n���\�\�\�t�s\�m���m�{b�2\�\�9躧�\�\�G���L\�=\��I躥G���L�}��S\�m٥G��>�����8J��\�\�ʂ\�qo�N\�֒��*G\�\��L�	��4\�)\��$EՈ��A��L�A�jDP#��Y�\'Ue\�:��m��%�\�\"h�P�Z\"���u�\�6{\�\�-�$��4\n\��F\�\�~l���i\�K��h=u��%�!U\�rH\�\r\�\r�P���\�֢�h4ȶV���_\�Q��+����\�퐺\��O��$[�\�\�X�\0\�\"\�l�3�r\�\�c\�\�qRܽ��;�ܾv\�\��zywH>[\�IU��:\�h|���\n��u\�!y��;N\nٗ\�q�t\�;���\�UVC�:=�K����ѱ\�\��)\�㴺�=־\�QL��T\�q��wǥ\�\��ΌF7��^\�5��^\�5��\�\��:�\�\��:\�����I_]��w��w$����g�wv\�>\�#a\�+]\��L�ߨ\�F7��Qō*�\�q�*nTq��kTq��{Q�8j8)�ʇ6�q�\�\�\�f\�~3�\�=fR\�\�4�?�\�L�)\�N�<y@��)����/��2\�ks++�bj\�\�\��͋\n3�.���\0\0��\0PK\0\0\0\0\0!\0�\Z\�|\0\0�\n\0\0\0\0\0word/fontTable.xmlܖ]o\�0�\�\'\�?D�/� @��R\�&U�X;\�\��X�Gd;���;NB\rTD\�*m��\���\�\�k\��\�3gΎ(M���A\�w\"�\�P���?�VW#\�\��\rbR��[\�\�\�>�.&�F;0^\�	\�S75&�x�\�)\�H�dF$�82�G\�W�]a\�3d\�2jJ/���\�ȨKTd�PL\�$\�9�\Z\�)\�@Q\n�\�L\�ՊK\�\n�6���h\r5sV\�qDŋL��8\�Jj��Ӭ���\�_\�q�*0\�&���n�i\rF\�h\�Mf��\�%\'Ϯ\��\�\�VH�\��\0�\�9��}��\�\Zo8\�D �K����gHHMH\����\0Z\�[f�?�ρ��\�S�4�\Zuǰ\'�SV\�Jr$\�DF\rN��R\�.�Ni��D�\�>\�4�[G��q$l�\�Gp�3:�}`N�\��D9\�\�)�\�\�\�O	�\r�>��\�\�]t�H5ӟY\�\�j�Jd�x4�m�G�zj�ˉ,d�(Q�\�\Z1WT,��\r.7D�\�g���E\��?\���\�>�SZW���r#����@��=c�Ue\�\"0G\�\���Zw\� ���C6\�W\�v\�P�`�\���y�\�~\�%Ki\\~�\�fXZ�l ߵ	\�\�\�𫂜/\n��\��R�\�\��\�*\�\�Wv�\�\�\Zo����\�{�M\�Y\�[���\�on�\�7\0\0\0��\0PK\0\0\0\0\0!\0x2�\0\0/\0\0\0\0\0word/webSettings.xml��\�N\�0�\�\�;T�g\�\�6�bC�	!āHSw�H\�(\�V\�\�\�v�z\�8���[�\��ݚd\r�4��2��SXj���ח\�\��P���L\�H\\\�N�]\�y\r\���OR\�G�US��\�\�iJj	V\�\0=8NV���\r�\�\���\n��Q\�\�Iϲl\":L��J+�A��\�b\�O&������\��\�JP�c͖g�v_�\�\�d�\nHX\�7\�UԢ\�>\�\�Ț=`\�pv�(]�cL:F\�\�A?\�x����w�X�\�/Y&�I���7\�\�OH�\�ԭI�7�_�G�\�bt>n����6����O��\���\0Uܩٗ��\�_\��\�\�cD�C\�:\�eh���8�k��h\�5��\n�X�AG���E��\��9�o��\�\��X\�}\�\�p��\�}\�V�-�y�� ��Ic�~z�\��~�\�\'\0\0\0��\0PK\0\0\0\0\0!\0\n�12\�\0\0\�\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�S��\�0�#��\�[�\�҅\��\nu��\0l�fw\�ƙ��m\�\�j\�?����8�ӛ7�\�癱�}imq���w+6���\0�}m\�n\��WoY�P�ZY\�`\�N�ح|�Jl�\�@*H¥\�#�%\�I\�UiBiG�\�\�V!�q\�}\�\rw^Zp\�ge�\���\�j��\�(\�\�\��W���󗞪S =)*h�U�s���\�[�GVT��Lr�\�c(6jI\��x��NrQ^>@�ޫ�4R\�|>[�\�}\�h�\�^�\�\�\�o�x\�=��\�y��{lA���,\�C�\�8r0#\"oQ\�\n�$o:�c$�ZYXSd�l�\�T7ލ2��#.��\�\�\"�o4\�+��]\�V쨢Q\�P6=�!a�Տ\�x�^�\�a^�cs-�}�\�\�>\�]��W��\Z��\�\�4�\�{\�fvrg\�3�P]�6(G-\�#�M���w݂�\�\�%�M�\�\�~�\�V\�\�l�\�@�[b����c	qOW��;��u;�\�5\'��z\Zެ�.&%}�\Z�9څ�1ɟ\0\0\0��\0PK-\0\0\0\0\0\0!\0Z}q\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�\Z�\�\0\0\0N\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0���\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0word/_rels/document.xml.relsPK-\0\0\0\0\0\0!\0.�\'\0\06�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0word/document.xmlPK-\0\n\0\0\0\0\0\0\0!\0��\�4�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Q\Z\0\0word/media/image1.gifPK-\0\0\0\0\0\0!\0�UB�,\0\0�\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0word/theme/theme1.xmlPK-\0\0\0\0\0\0!\0r\�F\�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0z#\0\0word/settings.xmlPK-\0\0\0\0\0\0!\0�\�~�\0\0\0!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�(\0\0word/_rels/numbering.xml.relsPK-\0\0\0\0\0\0!\0�NH��\0\0fy\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�)\0\0word/styles.xmlPK-\0\0\0\0\0\0!\0�ws\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R6\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0�,_\�\0\0\�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�8\0\0word/numbering.xmlPK-\0\0\0\0\0\0!\0�\Z\�|\0\0�\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�?\0\0word/fontTable.xmlPK-\0\0\0\0\0\0!\0x2�\0\0/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�B\0\0word/webSettings.xmlPK-\0\0\0\0\0\0!\0\n�12\�\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0mD\0\0docProps/app.xmlPK\0\0\0\0\0\0�\0\0�G\0\0\0\0');
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
INSERT INTO `documentoadendascambioproyectos` VALUES (1,'20264562_1739789179654250_7471240034847116774_n.jpg','image/jpeg','�\��\�\0JFIF\0\0\0\0\0\0�\�\0�Photoshop 3.0\08BIM\0\0\0\0\0�g\0GEOGtpuoN04_KuSTAVRD(\0bFBMD01000ac0030000bf2900002d60000019660000f56b00002a96000061e70000f9ef0000dbf900005f0401009b960100�\�ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \�\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0\�\0\0\0@gTRC\0\0\�\0\0\0@bTRC\0\0\�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�curv\0\0\0\0\0\0\0\Z\0\0\0\�\�c�k�?Q4!�)�2;�FQw]\�kpz���|�i�}\�\�\�0���\�\0C\0		\n\n	\r\r\"##!  %*5-%\'2(  .?/279<<<$-BFA:F5;<9�\�\0C\n\n\n9& &99999999999999999999999999999999999999999999999999�\�\0� \0\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�\0\0\0\0�X\01�@\�a�\�\�mNqN�ɤtdfٓ�Js{\�/@�\�\�d�Ͱh㞺j,�(k�\�t9�3�5��Ff\�k\"4r\�e\�:2�)\�\�F~aљ�M\�*��s�%�\�Z6\�%�/P\�\�+S5Lj�FfH_3$/�\��lg>te\�\0\0\0\0\0\0\0y\�~`z~Lم\�=\��g2z\�\��\�\�;�<�広3g\Z���\�d����N��\�yrۛ�cu�5�\�8{�H\�d��?�\�\�\�\�q\�a\�`�A�ys�\�:�\�o\�y�\�W�>hf6�\�\�1�װƊ�\�\�ʤ_\�\�8��\�8�\�\���3Λ�\�1K�8\�F8>��\�8\�X�̭K&g�y?�5\�9��\�\�\"�B��\�v\�JZ�?px��\�F�\��W��P�\0\0\0\0\0\0\0\�\�[\Z@f\�RkJ\�D�\Z\�u\�C>��䗤^\�gh��i��M\�0\�l��\�\�=`\�]��\�Ω�\�W�\� g\\�3�\�ӂ�\r�ϫ�\�d\n)|#�|3oH�@Q�(f;D2\�\�|�\�:Zw�K\0\�=�p\0\0\0\0\0\0\0\0\07�D��\�[\"N�4+�<�\�yW��|O\�)zO��\�\'\�qv��\�\�C�\�[\'.\�<��\�\�;�\�\�����v�Ib\�^�\�c\�c�E\�u�%�\�s\��\�ŧ+Kԉ|\�\�|\�}�\�N��\�91ȕΎWr%�\�\�=(\�:�Y�\�ͽ\'\�\�78B��N\�\�\�k�N�\�\�g�\�\�\r^\�\�:��T+��\�v�I�\�\��b�}\�朵h���z�\0\0\0\0\0\0\0\0\0\0q}�p\�]\�\�4z\�¿x8\�\�\r[A\�\�\�vON\�\'~�-7T9��G�n��sX��F�L�\��\���\0�T\��@T��Ӈ+��\�t���Ӈ�Ӂ\��A�u\�ÄN�\"�\�pW��\�\�=9��Peg��\�\�\�+�\�a\��\�A\���Hs���\��\0\0\0\0\0T\�Ǫ9U:���\�:��+�9r:��S�9�\�\�`:s��\��9\\\�{\�Ι�zA\�\������\'21̇Ls!\�\�t\�2\�\�Nfn]:\�N%+�8\�\'Ts�\�\�+\Z͒�Y+\�+���X 	\�r��&!	�Bb��& \�6ʓ���bH000000009�_�PP,r�\�U!�\�\�l�\�\�L�f\�񧳟�z�GYێ���\n\"F\�\�\�ΥM.\�\�w33q\�t�1fvX\�s嶱�o\n\"�\0� *�@E@p���\n\0�V�\�\�\�/:w�|�\�\�\��QDDDD��6)\��\"���\0@H(\0J\0���U���\����{3�*��\�+f���\�\�P\���S�TQ�,E\�\�Y\��޵ǒ]��\�Z�\�u4\�\�!�(\0�B�(��\0\0(��*\n\�PDQ9\��>9���Va,#�\'\��Ǩɑ��(�\n *\0*�\n s�\�\0(���-�)\0\0\n �\0�;�\�s\�\'�\�\�\��P�\�%�G3C\�\�y^�o��\�z\�\�nu\�Y�5\�\�\�\�\�\��\�;�\�/t\�\�^�\�\�QAY\0��\�UTEA\�n�QȨ\0\n\0��Q�ka:}�Ze\�~�N�7˘�\�\�k:�\r\��\�(���\n (������\0�\0�\0�\n\0(\�go�\�^V;\�\�&\�ϭ�O��I+Y�-�\�g�Ӝ\�\�g����^���ޙY�//Nn]��oީ�wW3tzqfu���\�yp\�r�����#C&�\'=\�U73\�\�\�h�V(\�9�\�̶\�\���\�]\�nzk�l����\�n�6�_4���(��h9\0QDA\�T\�\":�&\"	V%\"	H�R$\' d��Q\�Z+�)z8\�4���{�,k,,�wD\�\�\�/��k�d����;4�tF׃S��+x��}���N\�0�\�\�\�\��\�\�↜�\\\�1hu\�\�a�g0\�2_.��\Z\�C�UʌȖw�}?=:\�.\"�و�\��e\�\\T�*Z���h@\�\�t\�h\�m\��2ov��Ҋ��\�Z*\\ZAu*)l���d��>�WX\�md�\�\�K4\n��p��ui\�JoX��\�\'�$��\�,�5\�\�\��|ńw�\�\�3\�M#̺T��g_,�\�W�{�\�n7j\�\����\\}D\�\�G6�$薩eu�\�$o�ا:�\�G(2Dr�̈�bƎ�\"�DT�PjK�\�DU\\\��Y�}qCw7�]�ۖ�\�\�̟��\�z<z��qQяV8j� �\r0O?�\�&ui���[��m8�Q(ٸɸ\�٫\��$3\�q^��\�\��N\�^|\�\�\����G2i_i!�M`�\�7\�\�\�r�<�t\�Ku�\�Ĺ�\�\�۝8\�,��\�\�a\�\�b\�f\\\�\�t~�\nH�\�ٽ��R,HLE$�F�\�ƪ\n\�#r(�֤\��\����ǽ��Xu\\=��|\�\�N�]\�\�\\�\�\�_�}\�Ms��:�V\�.k\�k%AD+\0jy}�m\Zw76�^\�x�L�َԱ�\�\�\r;\�Z\�4�\�gZ��\�H\�QL��8ܻ:)W�2\�\�\�C���ق\�f��ڭ8z~�^k�WGí��w\�\�4\�\��\�eHܛ\�\�\�:\�\�\��IS$\n���\\=�\�Q�=\0p\�{EX�\\J��C7-�\��\�ɫ3.�S�b\���\0Zs�BU�󲛞׼\�,�j\�B%\�\��\�N	Y\�\r#�Y�c*K65p\�\��8�Yz-��	\Z��\�Pce��\n\�H\�Y�\�\�]H\�t\�1XsUF�\�,rG �b�8|�\���\���\�k��h\�*n�\�YH\��\�rא�\Z�	�\�܄�\�S��\nG\ZX\���&mѹ�l��\�\n\�\�ͶX�Jr���\�k\�$M,/�m\�z\�\�|�k�i%�φדߕ}%ԣ^z�9\Zٛ�=X\�tL=\�X�*|\�u�\�>7k* 8j�\�(\�sFշ�#����5�\�Q#�;��3\��Ң;Y�	mӟ=�=�\��V�^1\�	��B��>+Au�\r�P�Td[��F�u\Z���\�\���<�O\�\�ϛ�j\�c�dMY�,\�ěz��=\��z �agKo�ظ��\�B\�Hb\�\���e�|\�=���.k\�\�b�Nrz�\�\Z\���\�UG\�Q@#r<\0TT�ԉ,d>w\�ܕ�\��\�N|rB2X\�Eh�|GB,ݸ@�\�J\�X���R��#\Z�8�Q�ڮ���h�L�\�.�g��#u��\�*J\�S\�@��B���\'�\�Zrik�l����\�\�g�l\�qQ�8���iXclЫ`�EV�\\�\\}�\�\\�\�]{\Z\�\�I\Z�\0PTQ�E\0\0Z\r����l0�\r\�O)�\Z\���AcBj\�\�u\n\�\�\�G5�ǵ�\��\�-e�=Ь�Y�v\n�W�\�|ZJ��r��:5��:����b�{Q��\�iuԴ�\��lɪQ$�5	êIY-lGMo�ؼ\�	S��\�\���v�ݡ.\�v�jџ7Q�9:sNߋ�ߑ��c{p\�*(\0\"*C�ZDsѨ4����r��Z\�\��ܚhQN\�J�n��\� ��8\�Kf�\�X��\�(\�\�ı6kMS2ʺ9�J1\�iT��5�6\�:\�Z�JOכ;\�~\��\�%6�x\�[���\��\����[\�{R-J)v!\Z\�\�`9�vp:\�;�\�#\�\�\�d\�9�e�v\�c����#�]\�o\�.�\�T��#��uN��s\n\0@ \��\r�HFC>w\�I��\�Z�D�^��\�4Q�\\EYY�\�AT���}8ݓ>B\�Q��\�|\�KN�a\�g�1\�$\"���2D��:\�+Y\�m(��嵛yd�H\�;N�\�Z������\�<����4\�,,5�>8���X\�\�\�29�\��\�2ϟ\�z��s\�i��dyW[�Ҳ\�F�E�\\\�%����o\�P�\�\�\�a�\�TX)@�@� �Е�5�&�e\�\�\�\�\�攼�\��=�%�?N5ctv*�Ҡ|z1o��8\�s�Fٞ\�A��8#\�ibJ\�B\�;ml�\�%��#=)����\�siϿI{�\�]�N\�u��\�i��W,N�\\�;��B	c���\�%N�#X��^���c\�t���	r��\�,	.�󈔅�KRR\�[�d�U��%�����\�\�MŔ�ڴ�T�6R�\�s,gRڂ\�t$\�֥�&2\�!�V\"\�	�mi!���[�m�Y�\�*hA�Yu�(,	ad����Ԩ[*�h��P\\�\�#(\�Zȳj�hT\�\�[1�w&:k�Q��R\�k��WDL\�E`�\�j�N`�\nҔh8iDF�8�\�+Tz52r\"\�\� \�,K\�_)ȕ�����G�SK�R^�Nve\�2�\�3/K(\n\0f1�\�*\0�\�ϻO\�\�\�Qr�E�-t0�����a\�\�\�\�k�^:\�t��\�\�p �i\n悂�\0+����:B�\�-\�sQ�\�yR��+��G\�dca\�����%\�V\"T����U�^�zKB4�{Un�7\�E����5Ή\�*\�ؕb�\�B�6�����\��u����\0\"�\�v�\�V�H*.B�\�\�NV�\�\�#\�+Ysk��=\ZǛuq�2Iw�\�)Mz���\rU\0\0��E��GCUP�T\�G�\�5�\��4r=�\�ö�\n9\\�\�CFI\�弨+���׼�\�J�\�Y\�^�f9�5\�S�\�\�6D!\�ЙaIetIHں@ch�*\0 Y�=^\�\�\�#T\\�P�fiT�\n	\�\�n\��kؙy��;j�Y�5Mc�72�rY��ζ�n�suE\�8\�i \0\0\0\0\0\0s*\�\�ND�)X\�G�R��dc��H�|�(�h\�>/NZݱ\�6���ȝ���2}\Z3#�7��9!]bFUT!�-0\�+\�F�Z��\�`\n\"�\0$\�IZ9\�Y�WT\\\�\0�c��Vގ~~�V.k�U �,�����]�=\r�\�p�Uu\Z\�\0\0\0\0\0\0\�nm\�\�\�R�\�h1\�F�����U�9!�\�h۝\�\�\�g?N%�ŭG��\�hŷn��GF��\n\��<\�b��F\�:D�\"� ��\�2%uya\�]Tl@\Z���+\���\�rE$��\�mO��;0mY\��W}�\'�uc��.\��6YYy\n�%\�1��\0�P\0\0\0\0\0\�+�9��Rtԅe�THa�\�a�#hc��<�]�ի6=NκɧԴ��F��\�\"o�	`�f\�\n؍�#ԍ\\�K+�6YdB�EJ\�\��� \n�\�j�\�Q[��u-\�ڃ\�.ds�b�\��\�\�\�\�\�hs\�y��%\�\�\�-&D{5iڙ\�\�Ɩ^��\�*;<�\��*\n��\0\0\0\0\0\0(������9Z���*(9�D��\�̵b:\�oձ�\�Yu=�\��\�\��:Ż\�\�\�\��\�S7����V\�X��=�ks���nT[e��&[5�Y\�\�\"�\�G�G@���n�\�Ʈ\�r�d��Y�z�g5r\�j��65��G�n͏1��k96�y�\�b\�[\�%Tvq<�K҈�J\0\0\0\0\0\0\0rzy�\��#U͔UI^�G7;K��@�\��\�R���Kw0e-s�q�\�\�U\�\�l{�ٸ�k�N��$\�\�\��飒R��-zĤ�hZ��5�f��\�\�EGR9��DY����={[�rE6d\�*IN\�J�R\�w/IZhgJ6+ìiMJr\�m;�{w#R/�5�s\\�Mۢ*R�\0\0\0\0\0\0�\����=\�\�	H�\\�c�\�s�<jV\��}ܱ�]�-Y�E��q\�f\�Dr35��X Y�#ׯ\��\��\�1\\4ZX�AUE@\0�\'\�\'�5\�u1\�t*	��J�s\�\�\r\�j75{��bK5\�s�X\�v49�b\�)�*ZYii\�\�\�\�\�b\�C{\\t���&�m�T�@\0\0\0\0\0\0.h]˭\�\��8cښ\��R\\A&cZ�w�1fo��M�{n5�t=$5�\�\�!�옎�4�Ef�Tk���M���\�|��\r8jS�\�Z��\Z�\�\Z����ޞq���E���y�z�\nhH�!3b@4F˭g�>ڲ\�7;ӷ�l\��ZƏ!�G��\�YzmN*\�z��jY\�%�\n\0\0\0\0\0\0q.˴� WB��\�:\�ެ,o\�{U-n~�\'~us�Nu�0u�J��:g:��yE4e��\�\r\0Ep��\�Y_\��w;q�/\r�5\�W\r�\�Xǈ����\�\�ϳߋ��t�F�1Yt_��\n��� ����5Ȯ�T\�\�vd\�q�Y\�.֖�\�F��ܓC-�\'�K4u9�S��\�u9\��\0\0\0\0q�۩ǳ�^\�U�\'��c��%��h\�4^g�\�;q�3y�S/���\�e�\�!B\"�\�Yj\�#1PH\�\"���]\�u��y�z9\�\�\\�Ċ\��d9+N:h�\�W2\�}�[C�k�o�ys\ZB*(\�\0��\n\rQ��A\�2\��x�Ԓ��\�\�\���+d\�U�i�>\�MXh\0\0\0\0�\�\�O/\\�[��֝Ҳx�Y�q\����Y\�z	���mS\��{[�隱��\\Pe��\�\�X�^\�+\0QP�┲��I�I\�\�\��\�\�F�\�\�Y��\�Ml��b�	��3\nNɢ錼h`\�X5,TT�dP)D\�\n��\r$�t�z\�]lz\"�8�l�!bHX�%�\�\�0n\�uk\�\��ݥ���V�V����g����A��\��-$�ᶭH��#\�\�̩\�urz5\�ux6}�i\�>��FJ�\� ���B��\��3L\�8�S�I?Z�f��N%F�²\�EI\��6\�\�\�j�^�p�\�Eb�8c�s��\�\0��\0�(\"�\�cx\n����5�:1m7R\�H����\��NN]�G̴\�E�e��.�\�-C�I)\�~�E5��QمJ��e\�r�t�\�\�7T�oY�t#���]�Fy�	�$�\��k=q�m\��+e~�+�\��W3=Qd��H	\����\�u�%|rJ��kٚNs��\�aM-�\�Y\�Vu��fJ&�u@\�\�ђ2�\'.Z_���\\n�T\�S;\�͢1�bΚh�Ԧc��*���d�]Z֋�\�:=�\n\�uק>��~rs^|;\�5om�l\��=lTAbd\�e�\�LY\�\�u\�D�\\1\�):\�?:\�\\Z���ݜ\�f<wo:QP��\�Mys\�i2\�rځ\�婡�>z�\�\�\�3ٳ�kb��\�SB��ڣ�8\�/<dø�\�b\�☗\�ѫ�ގbN��M�Y\�Kв��n\�\�3jк��ϸ�\�\'\�ɭϧ@�ֆww:\�1ZzVzr����E�\�\�X�	��\Z\�kUU��:�֮\�7��\�➽�E�\�\�\��!�Cr�ؔ�#M<J\�N\�B[vs��E傳	�\ZN@ȳs0��\�\�7:�8X��\�v-\�h�3yj\�sfj\�\�u\�\�Ç��ǖ\�ioE1Üs\��\�5\"\�rE\�HI�\��:&r}f�-#�|C��Jj�6)f\�m6��K\n:,\�JJ�	�Ă�]\���%�U��*K#1\Z=�R\�H�־\�\�\�#c7�G\'��6jZ��\�H��U����s8J�润�>�o�Sk=9\�;,\��\"\�9ݕMs\�b\�\�r\�Y�o|A\�\\\��T%v�y�<�\�dnz\�E�\�?\ZL\�h\�E.\r\�\�Ӣ�\�ۓf:�\�5\�\�e�SIat���\�f z2�c�Ыw7�b�TV\�Mg�Cz^E��\�=:z78�\�εX�\�W��$��]eu�k\�ȭ{�u2�v�����,2���f��\�A\�A@��	\�m�\���X�]�7\�㺤� d욯\r�3b�f�U❙aS\�\�\�\�>;o�\�z!e�j��+��e�\�7Q磕x.E-H\�ǋ�\�o����K:X��\�\"I�\�Ӟ\�g\�?F�Y�\�K\�k\Z�\�\r\�0:lu�\"+md��Q͹\�\���g�X��\�\�A\rF٨��\�^q�bK�\�\�\'�����,R�\�^\�[B��\n��$rD6\��z�pk��\�\�\�~�;��F\�\�+X�j8��2�W+�g\�mbt\�Qc\�\�\�ru3QP\0p�,�\�\�tsW�\�~=\�G�\�&3���0u\�\�Dֲfã�F\�\��\�rج\�\�\�kڎ]{Z[�y��\\�\�ŝ�I��э��\��a�\�3��a�{n\rV\�Od�\�|I��H\�\'�R\�h�\�jQ|�f\�\��z�f��\�a����h`��#]+�\���\�3�N�\�\�P!��vY\�\��(k�35,$��\�0�tc\��A$PJP$\0T\�\�ǳ\ny,\�d�D�\�ckm�s��td:\�\�\�\Z\�\"����!\�q�9�:a�\�C��\�s���hcT��\�r\�u\�Z\�_u�\�J�~\�i\�;��sg�\�9��j��:\�׷����j\�&d\�m�<[\�\�\�\�k\�dp؊]yb��Xlֲ*���\�C\�a\\\�VM\�.^�Ef:\�\�ޭ\��\Z�Վs�\�,ӧj[9��\�3q�L\�ɲu�ޘ\�}ך��ʈ�(\�=̍2\��t\�[S\�٧Jxyt�����=\�Q\�+��\\�W�\���\��\�R)Y�/m\�����\�\�\�Ƒk�q\�\n\�Cw/=�\�؎g>=�0\'}��/o#|�ދ׈�\�i\Z\�kQ����\�\�\��F\��sX���\�Mϴv+Z�T~\�\��֒)f�)Q\�A+S]�c��ʵ�\�E���\�k�:\�,\�\�\�ͥ�\�\�\�\�m�{Q�\"\�\�\�z\��\�R� \\��\0	����Н�\�I\�Tl�K�r8\�\�o\�ԭExu���ɤ\�\�\�\�\�\�\�\�$rj5�IizO�u��t��\�\�V��\�q\�\�ei3\�\�}-y��-{�;�\�J\���\�1\�\�\�5���٣+:qb�J�����ە�4�;[4-\�*ւ\�V#7�\n\�9\�w�d;.�\�\'\�jX}K[�\�^\�殺\�\\�\�/��5ۍ\�ο/����\�Ȝ\�L\�M��\"#\�v\�c�8��\�X��\0�{�[��*\�J\��d�\�\�\�x��d�R\�ԛ.��|\��\�S�_\����*V�<��<\�K��ۚ�\�᤭�\�El=L\\݇ƶ�J\�\�\�\�\�S�\�\�Ƴ\\�y69\"Μ\�ԑ��嚖X�RW�\�u�\�5�ZkRLn;��&W�,i*�N��u�i�\�wK�\�t\�^�2k6��΃��\�]`\�\�\�c]U~+�\�7\�\�\�\�����:m�,\�+^\�|MI�^ܕZ�\n�R����*\�icnz^\��G\�\�Ƕ}s��y\�rE%�Iŗֳ]����\�~�2nu>�)u;\�\�\�\�\�d\�BE-,-K�=�̨�/\�3=�)KS��C�EK�\�C�5�\�Z,\�֫�\�zť-L\�R\�F��]���\�F��dm\�\�\\�\�l\r\�\�B�?�\��\�k\�\�;gV�=\�o�ȇݲ\�\�=`\�\�B�bv��do8�3\�7�S����\�9X\�Q��hX�\��j&:F\�|��Oex�fXu5��,ː5,@��1,��j\�\�b�7Kvj\�kz\�&\�zv�Z~>�Ab�T�\�TT�T���,\�aI��(ǳ�Z\�6YwI�<sZ���\�0\�GEyΌn\�<\n+\�\��R\�n\\*֒j\�i�jH�Vj[cu�8�\�\�%I\�\�Oϻn~��H�R���=m��\�j\�ve�q�0���	:�\�\��y�d\�-��4(\"\�\�\�nw�`�\�\�lV\�˱Qz��\�\�N\�~0g\�ecS�Y+#zB\"�Q�kP�dZ���2�K$\��\��\�\�G�{�w��b\�9����N�F�u\��\�L[�\�\�\�\�\�Ԃ�Yl�\�Ƭ��s�\�2j\�r\�\�\���ޫb�M�$*\�suF����\�\�R\"��\\�5\�Vx��Z��ԧ��>bG9\�\�jܼU\�1\�[�\n\"�4\�\�6\�\�q\�\�-�\Z��\�RX\�\�\�\�2S\�\�bԙ��\��\\�#�V#ڱ\�,2�z���b\�$SG\�b�ztQW��ق���I�V�l\�t�g��\�\�\�WG�%s�u\�+\��\�\ZM\r�y�M���GB\r\�Z-d\�ڕ\r�{rf+:dA�j���4F���mA+�\�^\�C�\�j����$Ic\\��K��\�k�@�Ƹ)DHs\�R\�L~t�j\�\�\�=|��:G{<qQ���_�>��VK��\0\�z+ ��\�j\�<�g�s\\�s1i\�Zl\�G#�{b8u�U�Y���cnr�\�S:^k_%�;y��\�*[�\Z,m��#�\�6\�\�2^ \�\�\�\�ڭ\�U�h\�HV��\�J�RB1\�-[:$k��\�,�h\�\"4Z��6J�he���NT!\�\�V�\�ک#\��yi\�X�\�l�(�wsu5���4A��f\�u\"�j\���[eEi�\�T.薞2K@@RK�Κ\�R�\�\�\��صLE\�e�t\�,\�h\�nt��5\��I^v\�F:OF+͏I#\�\�\�C\�\�\�i襞r��/����\�l���Vzhy���p\�I5=(<\����5���u�p�G�@y�zHy�zXy��$<\�=$<\�ސw��%hov\�G3|\�/L6�݇\�@,�\��\0���|�=�΢��|\�}(_5w�	\��\�|\�=<<\�}(<\���\'�/����\'����\�n� �=ٝys�8�=OC$�уϣ�P�\�}\�\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0aJ�0`\�\�\�_\��x�Nz�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0̮O�\�\�N�6�wՉi���\��\0�˟\�n�}�H\�\�\�+Y\�j	�˔\��ؠ_�;tL�z7�\��q\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\�yu;�x�����\�\�.|\�\�\�֓\�\�\�i\�\�\�\�\��yw{/+\���\�\�\�w.\��\\\n\�hf\\\�\�\�\�f��#Q\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0̪�=W	\�\���\'\�}\�ɔ\'\�\0\0\0�\�OO�|\�}~Ѿ\�{�\�o�@\�p\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\05\0\0\0\0!1 \"023A#4@B$5P`%6pC�\�\0\0\0�\0����\Zj�*e\�=J�J�U�\�Һ�S��ʮ�*F�j�E4r\�\�Ti�\�#�W_#ƵF���2�T��}6�MRd��1\�\� 4�1T���\ZG1�펾	*Tz�4�\n�Q��u>�K;��X��Ե��J��:FC+f���6��P��O:�T�1\�F�\�\�#}5lI��6���\ZGy\�\Z���\�+\�uL�\�EIW[N�H\r6�MP\��i5�5\�\�\�k�w�Q\�WW#|\�RWCVj5ZXK_OTeթb�Ψ\�<쩋X���L�i�\�\"�\�\�\�5ж�U\�\�F�\�A<u��	*ju*zi|\�x\�|%%\\Um����\�\�GM�Q�*\"�k�\�\�4�u-\\C\�\�?\��Q\��COM0�E�\�ŦOR���0\�лO�}\�\�M4��\�S4\�RUSG��>�/To���4�Tk2>�Pf�F\�\�v��}I����R\�C���\�xjN��\�SL* ydZ�,Zd�\�\Z�2-?I�S괂�]f^����\0�\��\0�?P�\0_\�\�U!l�ΤӤ�b\� �k���?0�F�0\r*�\�@\�J�ڄ�M�\"g�բ���\��\�G���˺�ƘV\�\��Ⱦ��4\�\�zM�0о�)�\�4�=f�Jc\�\� �PC\��jOTeԿf�X\�)��\0\�\�\��\�\�\�|]������4U��&h\�S\�G&�+f\Z�\0�~��R\�B��IԾ��\�J}\"��WBt�֜��\�U1\�\�3V�{��SZ�?Rt?OTq&�AS-X��K\�O\�M�u�����\r7�\�O&�\�RU�if�=&JqA\�\�\�������\�\�4��e�j�R~mj��\��jz܎��v��:����L����#�\�4\�uH\�t�1\�P�h�f�O$�\�\�\�?\��\0\�\��ID͂�V\r\'�Z��\0����$�R��^�j(�A\��ߦ�\0\r\r���\�b�O�?5~�\�X4G@h\�7���,o��?\r?�t(��l>7M�T��ժ�\0��ej������޶�_�\'1\�P��3N.:���ViF\n]�ihߵ�|\��\0F�	\"�F\�\�U�TG$\��\0\���N�\n\"_�j_Pӻ:}f�\�U\�\�V����SDSt�69�4�ΙCN\�\�4�j�M�SS�T\�\�R#cca\�yE\n\ZUME=K�cde=\�m2�cMCOJ�\�\�ӣїCp6�����\�i���4\�2���\�i�\��N��v\�\�4r�ʨ�a�5�E\�OM\r3j(i�_\�*���yRi4r\ZjXi���\�QSEOR|��EGQSR\�L$cde5,4���ꦊ����s)\�\�t�\'(�C�SK\rH�MG*�K��\�\�T��\�m5$���\Z�Ɔ6��\n�-<ѱ�6x*�i �X7\nz\Zzg���9砦��P����*fT\�Sԙ風�\�(T0\�H\�(\�\�zhi�����(4�Va�\0�\�f�8�z�\�j䖻R�M���\�\�0\�u����J���\�\�4:�^O�/�\�\�U\�n�Zj�h�\�*-^�Sפתd�(���CBٙL����6�;��\�?�ҫM5N�[\�Ӥ�mz��K�N\�\�u\�h(%����4:�Ԅ���u\�4\�=2j�4\�6JI\�\�u*�M>���kԮ-�U[�ӾYs6�QKY��N�\�iz_�$�\0\�P㟤\�\�\�\n�J��ڞ�&�;�����KII.���j�w-T:MZM:���=y�gA�Z��Σ�S��t\�P\�\�M�����\�5	\'�\�9�]|\�T�@O�~�W4*�*#\�jz4��3,ѥcha���Y�u+c\�*\�KWQ�\�}HHf�_\�k\��\0\�?��\�⪝έҥ��\�}$���\�9X\�5��i�\��\0\�\�P\�E}I�k�Ki�\n1GIJ��Ti5\"\n�J�\n��\�j�[�U���W\�6mF��K[U �K���Zu5���\0�\�*�6�WX&���M�\�\�UF�ߥV�Iˠ�:\��u�SQO�\�\�H����fViu�\�5 n�j�\�7Y���z\�\��>��8;O�\��\�?\�\�\�j-n�F)�\�*Dڅm`�������1+H��j���iO4����\Z�ZM[%_R4���Y-Q�J�\���A.\Z\�\�?\�\�\�j-n�H)��J�6�[X\'���O�V�Bz\ZFQï\�B7�Vk\�lտQC]F\�b��\�j�\0\�Uh�u�\�\�Z�h\�a�z\�]C��ը䬆�\r)\�\�\�\�QIY<f:}^�J\�\�P\�MEGJ\�zmWM5n�ӝY�בAH\�8*[#�Ҵ\�H\��AUMMEQ��\�\�G\rdFzZ**�Z-+N4���T\�SQTG��G�`�D�\�j�|��\�뗀�\�\�+\�4\�*�\'�F��\�\��:m�Ӧ~���鎨�`eL>OY\�4��ON���P���4��\�\�V�iu+ji�4�[E\���3K�-CK����Z�\r%,t�M�U��+\�T`�O\'�\�5TO�\����k|��\r;Le\Z\��\�\�\nAYOCKYMM�i��WR���\n\n���h���i��}m$u�yElKN\�N�^�J\�\��\�\�\��\0��\�Z\�5\nו\�&^a\"euШjk��\' �Z\�\�8����$j�0�vM���\�,r\�\��#�\�H����{\\M�����\��r�^�����j���n\�\�	j6\�\�\�\�\�\�\�:\r\�KZ\�mL������f�\0\�\�\�L�\�e\�QB\�Qh��ұ;\�Z{��\�=��p$r����|���\�a�\��]Ņ�{��\�%O;�|\Z�R8��]Dc0k\�7�!�0�F\�\�UCun|��t��w-	��t�OryNMA4&�\��	\\\�\�s}���~8�\�CY3�\�\�\��J\�e+c]\0TQ\�U�{SY�G���Ƨ����\�5�Bv�3�54&?�u\�\�t\�\��2\'��E�\�K3�}X��a\��Y�\�\�}}\�s�l�����\�\�C�T\�6f�&���֚\\,�\�2�!da㉛g�L��L\r�\��l7{�H\��\0����A0ݎ�0�HF�\�\�\"\�Ȅ�^��H�\��a�͋�\��j\�ʊBɘ\�C�~-Q�S*v�u�*����\�\�im]9�\�@&���/lZ,@Bq\�A&�\��`�8����l�@�?\�\���ѵU\�\��C�Nr�8���\�FʡQl�y�\�#$�{*�k�jl�\��E\�=�\�\�\��,F�Y8&�rwL��\�mr�uN\Z)\r˂\�h���\�GD\�e���\0H�)\�\����O��\0�i��Q\�Swfd��ص�\��;)f|Lc�g�!���5�W,\�,7���\'\���Lz��\Z�`�\\EDe\�H28\��R����\�)\��Y�Y�Y�Y�Yp�¸S�PF\�\�]]]_\�^]+CE,A��\�=V\���k�\�/�\�\�\�\�\��������B\�\�]r��euu{��*Nd�vI\�nmm�w\�ס�\�)c^i\�P\�v{X�\�xG`\�7�v\�Ã�Ӽ\�\�\�9\�\�v��\�et\r\�6Y.�I� �qYw+�r�\�4�ur�)\�\�\��T\�{<A�o�c]jyrh*\�e\�+�WYu�Yu�Yu�\�\��U��\�\�jͨ8�\n\�\�Eӯ\�O}\�=\�\�tP��\�F�f�$�\�~\�\�Ñc�\�N\"?lB\�w/���\���s�d\�T�)�p\�t\"\nͷ\�Y��\0V\r�\��\r\�\0\�J;_k���N1Q\�Es�TU;*F���[\�\�u}�Y�Y��\�\\��W6\�p�nq\nG9ʄ{�\�\�\�h�9��\�6Yb<J�$/��#c\\�\'4�2GH�a�\'f�%8EMVb\r��T/ݶ\�~U\�\�E\�{�(��P\'`�\\medZұj\�)[v)\�6g;\n4ШAh\�K8�����=]Yr�e����쮮�+2�\�K%�\�\�tBl���(��\�J�\'�6���آ��;���Ed�\�\���^\����\�\0�\"�M\�V˓�8..�\��°\�\�VYv\�\�$oat]e~6���2\�r钣�r\��M+bOqqw\���ƦU����V(]X�\�쮸V��u`�Z�Ov�2\�E�D\�H\�\��*\�\�\�\��#�\�l�})���\�Cy\�͍�*�>)I\�\�\�-4��B8\�\'\�\\\�t\�q\�Nt�(9U3tX��\�b\�8�\\��\�9\\���\�6\�r�\�C�r�Q�ʫP\�5\���x\�⥑IR9%wpWWA\�M�pP\�\�E\�\���v��$\�I*p��j\�W�o77^�lZ�51��xVؘ\�\�Ս\�lZ�J�z�ɝ����)UF�#Tp����pi��.le\�R��5\�/r�\0\'!\�I�%�۷d\n ��\�\�w\�Z\�#\�/j�X����B���OQ$\�wm�\�	.^�P\�\���\��L=7E �;��\�\�\0���1H�rt\�9\�\�[v\�\�:+.��\�ࢆ2-\��\"\������ߡt}VR@ǂ�\�\�,�Rx5Ņ�:W/\��9~�Nk�ܬV4�\�A\�+��\�(\'\0��r�\�%bP��\0\'��\'���B*j\�2(�����3�;~ӟd\Z\�.�U� %BF\n6X��Z�	\�r\�H\�\�H�zJ*���F��5d\�+��0Y���\�fd\�vkykl6ص\��I�\�:\��l\��r=�\�b%tP��ڰF WA��б*\��\n\�ܬ�\�V)\�#\�G�r\�\�G�$Gc�هl\�t�~�\r�5\�,=F\�12RW6nd��\�\�(�*\���Ee����~L\�\��}=�}\�f%F\�B\��\�1T_,f\�C\�w���f��(\�B�34�A�]��״#\�܎Wī�z���b�+�\���\r��\�C\�\r��\��S�\�\�&�av\�\�H\�\�T�8�d}J\�E\�*Vb�wT\�؅����R�9\�\�\�mʎ,\\]eb\�\�\�S~�\n�e�!�܂�\0${�4\\�W�EϿ��J���+����\�+�)A���W(X�3\�rrOq^哂\��\�\�\"6\�\0VX�@^Nh\�\�{�qX+oL��rxW����\�X8(\���E\��vq��\Z�=(o\�m�tց�3�8�P̣/��;�;�]��K�\�\�\0\�\�\r��\��\�B1\�6 \�앤]#|\ZWI�1�G�X\�{\�ʯ���!���\�L�\�3q����\�k%r�WڞB\�1�`�3ݸ��\'<\"n���\��c���&77F\���^��Ll\�\�(��z5ٻ\0�vE�M���+�Sj\0]h\���\�74	��E�X��B,����!+\ZD��D\�TK\�x\�6o\�~\�\n�+.Pk�6\�;!3P{\n\�[jg��r�z�\�C��\0\�i�\�1�.��7\�H��\�Y,���ua\��O���6(���]3f�\�+\�e�K�W@.�kKU�WL.�] �b��\"S��+�9�\�XF�+P�\�M\�6gs\�ށ�*\�r˨U\�V\r]%�»�$�\�m{��JKT<����+)�q���Bѩ�h\�\�\�\�rw2�O`s\\0�&\�t\�۞\���;гm�E\�\�՛mY�.C�㱲ɪ\�*�\�T9Ӱ_�߹da�=�\0+\'6ހ�A��p����\�\�{d\r�xT\��\�.�\�6sb2\�C��d?�(��]\�ک�T7�v\�/a�Y�\�\�b�\�\�$n؂�+}�$m�`�X\�r�d{�NMy=�I*�W\���j?q\�\�\n�w5u���D	\��&��\�.\�r\r,�?ġ3\nl�&\'l�\�=�\��8b맹=\�\�!�\�|�gl\�\�}��Z��q�NN\�6M\�\�Ǧ�X�\n �l	6ۨhV	˲(9�M#[\r\�n�Vݩ�I+ƟPO�T#�\�\��5A>�f(\�J��\�E4!���o`݃���+���ћ�P�\':).\�x	�WO>\�\�\�V�N�o\�~�z�	\�E�lBpZ\�>\�}�\r�\�v�F\�8�X��\�9{�xE\�W�\�&\�\�M;�,\�C�ʆ�\�M2:L�C@�`WH\��\�w��œ4�\����eS�>۴�^WtB\�\�\�J���\�gq��\n\�9S�\�\'��0�+�؞\�m\��3�\�	�2V6p\�v)ʷ��?a\��O>�\��X\�ZU\�.j\�9]6P��/�p(l\�\�x�\�2d��\�]]Ss3]a$�+�����=V�:�7(鮀\r\�걂*�K\"�Y#b�S]d\�p\��G\�\�]�#H�\��qt\�Y̩sZ��A��&;Ĳw\��b�q\'V\�\�������\��\0T6�NhZ�W�G��w��Qi\n\����8\"n �+\��#\�L,b��_Ǝ\�\�\�\�QW�r\�h\�M�\ns\�Z�G\"L�k5�\�%r��+\�+��(�dt4\�%k+�n_��&\��b؋��\�\��9Ydm����#n�\�O�|�\��uZzoiܩ��\\,b�S��_\r�\0)]�7;ru��rȮ��±(\���b�cUM6#f�:\'\\#\�\'�Zj$q�>��\�\�\�\�\�WH��\�]�\�Lq\��,\�\�F\�{���l��!�p�Jd*�Z-ܝ�Q~���;\���R�!ا*\�\�Q`S\�>���׽��\�`2!5b��d�]0�nG0��ҽ�\�5\�G�\�*h�6)�j}L�L�\�F�\�kkSgl�\��%5\�][)k�O�\�;\�e�X�A6~\�0z\�æS�ρ����\�\�B�<+�N�-!F���B�GD�)B��h��#.\�Xޣ�Uˬ�\�z\�H��.����\�z\�u��\�]W��\�Y\�L����2���FEG+�\�\�b\�1tcRi��;\�\�זQ�*�^UD���yU�%\�TK��sCLT�\�\Z`�t#\�ĺ1�\�D�$\nZ8D1�\�b\�F�4+\�º�\r\n�\�/\r\�D�O��ү/�^]J���yu*�\�U\���\�(׃�x:u\�\�ө\\���ye\"�\�E崋˩�R/.�^_J�0>\n�x\Ze\�iС��\Z\�,A�\�\n$���\�W�_oڲ��\�\�\�M�CSdk�y_����\�/\����G���]\\/\�}��^�\��\�\�qR\\�f\�\\O�ݙ�I�|.��^!�\���\\HOA\�;�\��\��X�a�_kz�\�\��r\"qR0��\�ʿWW���!6w�\n�\rK��M��,?�\�o�Y\�\Z���>g9f��dSd!\n��\��XS*sx{~;��Xz,�\�\�\�}\�\��G\�\Z\�ֆ��\�N\�ߏM�%]_fJ\�\�k�J\���J\�Y4�$�U\�I�r���G3$�J�b6�\�V�]_c\�\�k�^ޛ\�\��AD�\�ƧN\�\�]{W\��Av���\�\rϢ9�\�ɚ��\�}��\�v0�\�\�\�\ZJ\��V\�\��HXi*����`�\���\�VV\��\Zw\�V\��_n\�o\�v^,1�L��K�\�\n�\�f����b2�P\�w6\��V\��ut9V\��:}��zuޜ��.c�2��tڰ\�\�\"\�D\\Cpi��w�\�?�\�\�C{!\�\�_���{\�tT�\'N\�\�ed殩�E7\�?�\�\n%4H\nȅ��\�+��MW]\�\�E_\��ԟ���S���{�8�\'�:0D�\�ce\�Q\�:6ٞ�v�\nP\��\�eoP��\�YY\���:{=�\�\�Nu�6�#u�J\�@]\�]][�!\�\��k\�\�\��>(?*��z�\�0ʠo#\�\���b \�,7)�(\�\�w��^덏k�s��X*�j7]��R�\�i/�r(&�5I+$\�Sv\�\Z�M����=��2�\��jPui�da�fв�N�Eٿ��\�v\�|�u}�V�ǔD �9�����Ǻ�U�\�e�hL\nȻk��\�\r��� +!�\�p>(�\0*�\�\�\�v)\�1ˡ�\�]d��ǣ)P\�b\\��\�\��\�\�`�W\�\�4�l�@\��X��u�#nn\�)\Z\��עP\�\"jk�c�*\�\�cu\�_c�\�\��\�][\��T!������\�\�\�QW�|�FYBmA:\�ob\�\�\��\��1~�o\��r�\�.n\�\�r�V۶\�u�\�\��{+�\n\�Wr�f�s\�֏\' �\�k\"��#����獯\�*��H!~\�G\�݂j<\�\�m\�k՞�e�{K,��c\"T\�b����;|���K�\�Vj�U�k[ue�鮚\�\r�ebB镉V!H\��\�v\�\�Z\�\�_\�]]]����VYn՗��6VV���\�\�?\�weQ�7�����o�\��\�\���TjP�P<iͶ\�\���\\|WWWY,�Y:W\�\��\0t|\�6H�\�aI `l�/��V*b�t\��b�X�W�\�D\�9\�n.�J;\�P�;��\����6�_��U�ɐ�4\�\�}�?vMP8TǓ\"�\�3u\nw\�m�ٝ�~\n\�1!��8Q}\�<U70Ǜ��j��f\�\�\��Ơ�\�.��UfՔkؽ�V�V�\�b�X�E\�\�A\�\�\�~)9`�\�{)ۘ\rs%<����y\'5\��t=\�G�n\�\�8�Q\�\�U�;�U�\�{�L�kj��?\'�z��맀T�\��~�ٞ���KY���\�]fWU\��\�r\�ׅ\�A�\'2�\"���\�wj\�~ѱ\�ݝ�T~DS��Q��,&\n1*��Os\�\�\�ۻ?�\��qW�\�\�l\n��G�W3Xqu �=�\�\�\\\�[\�M���5\�{�\�\�\���\\S�c_�SW\�\�\�\�)\�\�\�E�}L@OT\����F\�L\�;n\�\�\Z��\��&�×!^밺\�+���\�$d/\�1\r�䫬�T�H\����M\�A�7\�\�\�MG�}#�\�\�M\�\�uL1\'\�T��j�\�f��%5[%BG9t�\�ڣGǥ�\�7�\�\� ��\�d��i�VB\�B�+-���\�\0\'�S��)\�D\�\�!qc��{i�\�{�wM\�SS�7s\�YY>��/3��4��OW$��u�\r�V]2�a�,j�\�p|z��\n\�fݽ�~Tk�\�d7Ckd����!\�I]3�n*\�\0��.�\�\���\�\�\'�\"�1��=�\�:ӗ,��p6�\�u�A_f�)�\�`�&\�\�DTڈR\��M\�K2���\��+��d�\�oB\��ɂ�e�Mu�5{\�^ࡨ��\0\�2�\��\�\'��\�(Ȃ\0(v��\�9|ϐ�q\'��\�~\��iF\�\�\�=�Q;�\�\�WW ]p\0\�.\�\�\�6%\�A\�j3J�\�\r�%�\�r�r�鼩��i�U<\�\\S$P\�=�\n�\��XܢI7M}Ӑy)���\"�*�w=❱�n�]h������\�B�gL�\�����u\�\�k ,y(]Z\�Z\�F\�\�#۹\�\n\�`�\�	d28�\�\�&?\"	\�TY:�G�&��p��k��d���a<=@\�\Z�Ȍe\�\�pK�\�\"J\���T�b�{�v\�W-\��ܟN����^/!�\�~���8\�][b�cv\�<X\r�nH{�gx]\\�\��j\�i�\�F\�\���\�Nw\ZC�L\ns\�v���\\��}�\��E\�KNA\�ݦ��\�mD\�s9.�ee#\ZSE���\��;*���\�\�\�\�\'\�\��\��\\.Qr�A@�w.*���\'8���`�;\��\�-\�\�{,�j��IC�\�ek�\0��0=����T\�\�}*lC\�j��%\��pM��\�HO\�eI�iH%8�2\�.{�AEˣe�\�\0l�\�\���\��Q�\�\�3`�N�\�\��\�\�vM��\���N��0\�Z\�[3�@�d:a2EuY	�Sc�O�̉�ũ\�?�\�9\�\�\�\�&\�\�#Ņ�,ݝ�\��7�\�ا;�X��GU\�֒�\0ڷ��貲7w��lrb\�#WQ�6�ڲ\n\�\�\�nO$�f=\�j�\�\��/p\�\�b�5JY�V�\�t*��T=ZȔS��\��zBw\�{�\�rn�W6 ,J9_tlU�D9d��	�c\0V\�B\Z%�\�*?\�\�=VA]]]J}��5��O+�q\�\�\\\�\�\�W\����%\�h\\\�Ȳ\�\�w.+>\\C���6bjaG,n�\�h�\0P|n\��\�\�|!~�7\\\��ll\�5\�9\����\�K\"[no1�E|\\��6\�P鿶�z�\�-�\��Iʌ\�\�p�P@l��@,�h�2FZ\��,�\�!8�\�\�90t�\�a,ph-�>\�=\�.H�����	��d�%<�aSS����Z�\�\�#JfEwX���×\�\�E\�\�\�7E\�\0�g5\�s܏����&H\n\�lV(�\�L�\�e}�<x&:\�Lޛ��\�\�L\�\"��\�\�5�\�\"\�sp|\�\r��\�n$e��hv]H�Q�J,O�i	��i�j�I\�㡓�=\�\���\�w�#���)ܖ\�\�\�Nw����%\�\�\�\��?ڷ���\�\�\�\�\�kl�N�\�\�\�\���a\�7d\���7�\�k|{H�\�)\�\�9tj��\"25u\�#hS�\�nc-D�v(�\�\�Y]d�j4\�+���5\���.^^��:�\�����\�\�\�РQЀ��H\�\�6<cf\�\�>\�\�\�0p2\�\�>6��;7��b�.�l9.�\�\�]%�\�.�\�#\0B��N�(#ᚅ+\n}6)�\�xt-im\�N���x\��4m^�\�\�d\�x�\�\�◊O�\'�k.�5��㬙�YG\\#L��\�F�\�53V\0I#�\���\�^Bs�����c\��\n1���\"hU��27qL��g�DlZB�����\0尧j�	ԗ.�L�q{��Pц��\�aj���x7^hY\rޞ0W(�9@+\�59\�Y\�\�\�\�ǘ����+�t\��,�\�\�M\�\�\�N\�W�\��\0\�tyὝ�7k+++le�ꬁVVV\�\�\�2�\n��Ժ\�V�4�f�I*\�=��/a\�\n\�M\���+$\�\�7����8)\�4�S�׵d���\�k��\�U��\�lY�5�\�(\�hO�m\�0�\�ۺd\\\\Y]0Q�� \� s�b�BFy2\'�e4�#\�\�V]Ց\�PE7��\�q�Ƶ?�{;��\��:0S�lw�fF�.n\�8cp�{Sf\r`��&�3�\�\��9.m�UO`eu\�\�db�r\�\�\�p�\�*\�\�bc�����rH9�6\�6�%#�E5�Z\���\�$J*8\�CP���\\���\�:\�V�\��\�\�\�\���d\r��\\\�!܂\�\�*\�\���\���	\�uC�s�\�D\�bVt��e`V*˲;]4�~Y1��f�A\�!\"�WVF4\�B1(\�E_k\�6�N�Oyq���\�qg0\'�u\�c�.Y+���\0\�\�\�\�\�r�	�5뇢\���v��\"�Ƶ��}�\�ߴ��u\�6��\�u\�nn\�J\rq-�B�G��	ԫ¯��\�\�>�Pq�<�\��~��\�Yb���BTҸV\���g)� �G\�Z��I;��l�)�8#%��\Z\����$\�Y{�]\'46�7 S�\�\�\�\�v�۫�\�\'a���z\�\�\�ͪ\r嵃.�X�i\�.J\�+\r��\�f5>\0��Nn\'z9Kf�t��8 ����D��[`��Bp��\�]&LB����\�\�)\�7��\"\�\�DYwQS9\�	�\r^\r�\�5IF\n4jH\�n�]{\0�\���_��C��P*D>\��[�\�6\rګ\�QŇ\r�\�\�{�\�ܢ�N;�b\�\�L?�\0�at�Mb\�\�)�\�C)q؅��#{�Q*dC��j6\�\"�ri�c\�\�\�gdB��u;�U�U4\�F\�\����qjq�ب�S�����ߙ\��^�\��fڀ�Vr]\��m�\�Q	\�V\�ap��n�\0�\�>���S\�Ga�u��\�獊\�\�}\�_�rT����_O�Sl��\r�VV�\�G.(/�yAH�_\�\�=�fmWq@�l=ԡU�z;JSͶ\�1>�yA\�M\�b�\�G��\�Ȋ��*��ĈV�\�\�������-�\�\�\��_\�v�xU�t\�C\�Jh�j<\"���~\��8Rw�~�g�\�\�\�:2��y�oQD�CS�am�Yy>\Z�k++\Z�PҞ��owz/wR�DJa\�\�U\�����g\�V�\�\�s.�i\ZM�YYY_\����\�pQ\�8�\�-;�\�\�@+�;\�F\�w����ٛ\�1r\�A	rh�\�\�8\�^\�\�tU\�\�r��1V�*H\�N���>\Z\�en.P��6�\�6��~\�\�*U\�Y4\�\�\�M\�\�OB���\0EM]\��YYu\Z�\�M��ˡ \"Z�\�S�\�\�+�AU�\�(�_&C\Z�:4P\�7%uuO\�r��\�=�\�\�m�wfn@!��\0\�CZ�=�]K�2p���\'<$�L\�x#�o���`�}�����\�Z�8�>\�2��M	�\�w(�_9�Iq��ª}�\��5l��\�ډDQ\�4Ѳ�\�t�js\0\\\�\��\�{\�\�ȶ\�\0�nv\�\�\��\nfn\�O7g\�d�T�T\n�*��R�q�ҹ\�\�\�S��A�ds1�\�W;�{�=eU�9\�r��	ϼh��\�#�6VVX���h�%Bm[��\�\�r�BqpO!�F۸UG�t\�\r�Ը(�z�~Q\�~\�l��f��\�\�\�ȹ\�ݛ�9=7v*b\�F	�9\�<���Ɇ<�Tu4�5�F\"\�\�Z\�!\�\�Y̔g��eN\�\�ͱ ,vE���\'����l/\�>P�j��\�T\Z�1Lh�n\�#rC�\�ύ��\�Yq\�~r\�\�oM��wWM���\�~ۢ\�I)�A�\�{�5YOMݝ�[h\Z�w)\�\��Y9T(ߋ\�\"\�\�N\�7�H�jQ�K.�\�t�\��7�Eu��\�Ŭ}��/��Z�\�\�S����A�h�\�U��\')Dj� 6r\�)[4h\�Uқ\�Y��mv6\��knU�+�p�\�\�\���S�\�?�>\"b\n\�\�W\�R��S�N���Ĺ<�\nL�j�i#�ਖ\�\\�\��Y\0�ۖ?$\��\�aU6\�x\�\r,�{\nW�_AOZ-F(8e�\�\�H�+�\�hk%c��\0�8H,E���n}\ryr�l�!9\�juKB5.(��\�\�\�\�s�%�7\�\n��� �/\�PWR���UK uLQ�\�v\�\�gu\�sE7VT�Fy��\�\��L۽����ʺk\�k�$���&��S?�	@�\�y\�ܧ���\�*B�vocx-\\��\�\�\�;��\�� 7D(��W\"{ЧX1��!�&6Q�\"\�#>삺�}�������\�\'ܿ���Ծ͍�z�\�\�\�#n���\�!Q�\�<\�^\�P#�D\���\0Oqɶ��E\\mH֗;b���ʹT�:7�ٴQ��E]���\�7���A�a{�\�Y\�\�u�\�y`�vR�\�m��\nɡ	L\nW\�\�W�I\�\�mVVM��{N\�+m��Kcu�eGTIn\�W}�g�CA�bt\�j�jS%Bo4\�\��(S\�\�~$B\�X�*\�4��w�\0�֠ШB��K�D��B&0��H\�}\�EJT�D\r�5TѸ\�S�\�ר�+\'�~\�w\n\��~{Мl\���Q?\�\�&+�d�9:;,,�WP��m�m�\�\�0���,�\�SԽ\�R\�S�g\�)�\�P�Pӈ[PT\�p\�\�\��du��@bZ,��\�0��v\n\�X8.�\�-�EM8��ֹI���\0M6WTg\�J��E\�n\�+c�\�B\�15��{�L��\��<m[i>\�W��G\�\�J\�X��Vj\�\����(�\�U}\�k��\�̖ D�2\�DҢ�\�<T���\��\�C7 \�z\�Nji�s�-�\��F\\�*(]*��SĀE\�\�\�\�\�$\\��PAG!��\�ٙ�E�\���9\�LOu�Dޘ��\�ܦP+$Jh\�}\�Qv��\�K�t��J�ܒ�Pɋ�Ｏ�hf\�\���{.��=�Nu�\�I%\�Pᯓ�\�Q\'��\��\�\��1Y,�tIYr����t�kCR\�\\l}\'`�P\�\�㕲5\�\�8]�\�r\�j��\�\�M�Ճ�}1�����V!�߹\�>\�K&(�\�\�\�1\�\�u\�k�2j\�un�n�¢���ǐ8\"\��aN�)�60��R\�\�rs�.!G&(;/E�*g#}�WL�\�\�h�\n��\�=�:\��;\�QA7\�\��\�ٛtU캈Ⱥ���\'\�\�\�K�U\�=0�B�r\�.\�\�\�7�)��\�{��J���aB�%_f��A3�t6V �\�S�qSL���&\�\�Ƞ���\�*�@M��\r�*H\�#91��\���\�\�>\�\rÔ�9Y\�!�L{�u5P��\"S�va{\�!�W��\�\�G\�B\�$��ƛ�\�s\�\�G�&�:�t6oi]dM�lD�ַ\�\�\�sé�N��l�A\�ȝ\"t�MP��\�\�NvHz\�!jd鯺s�M�X�du\�\\��y\�\'����!\�\�\�}g`�w(��Ѻ92nnFTj\�5*\�\�`�p�[zsie}�h���EO`M\�rˉO\r\�\�齧M�\�5��[\�w��y\����7$�\�>)S\��:2ݜ�\"IA�\�Y]0���A�9k7	�\�)�\�v>��z\n)�to��\�[`�m�O�\�h$s�5\�(\�h�S\�\�;���\�x�˄�\�\�σ!\r\�.��D�#���\�S\�btdL\�\�\���\'\�8�IurV(\0>znA\�7Q�R\�&�w\'�\��>ؾ\�\�!;v�AVN6=�TQF�ZַrSܪ����\�d\�? V \�\���\�F\'\�\�\�g�ɧh\�S\�mx����\�8PAP���M*~c\�\���\�`D|�\�ܢ�\�\�Rϳ�{�����\0q\�v]\�>\�/\�e�H*�����G�ދ\�r�ͻ�\����\�!�cyJr*\'(M�r>��\�\�\�)A�p�\0E�ACR\�uӊ�\�R?7B\�m�\�\�>�w���\�\�\�\�ʱj���\�\��e1��]�\�\�7�o��Hv+����?�;��Ϣ\����q�T�ѓ��\�\�\�FUG��ymB:]J�ʤt�\�\�k\�*זU�,�^WX���y]b�\�\�.�yeZ�ʵ\�k\�*זU�,�^WV��V4�м��yUbn�V���\r.�y]b�\�\�u�ʫ�V/*�^UX���.�\�J�^WV���y]b�\�\�u�ʫ�\�/,�^WX���y]b\Ze]��X�\�J*���Ք4ʵ\�h\�u�\�u����\�˪W�U/.�^]T���yuR�\�\�K\�j\�\�\��\�/+�^WX���6�\�ʫ�V/*�CK�^WX���y]b�ʵ\�k\�jזկ,�^[V���ymZn�Vhj���\�:=*�-�^YV���7L��uQM\�*\�\�j�\�u�#WQ\�d:��\�\��\0`�\�6M)�E\�k�\�\r�2�\0����58bR\��9:��˯*mT\�Q\�\rO/���>4&��B6�Q\ZoU��F\�׸1�Y����I\'OgNK�\�f͒�O4�����*��\�ښ\�g�QA�B\\E=L,��E\�R\�ڏt�Uw��\�L\�\�Q�\�\��Z�3�E\��\0Es�U�b\��H�	PQ�c�L����\Z�m<Q\�\�e\�Y3�\�<�\�U\�ol�R�\�N�\�1��h��\�H\��r�iqM\�S�>Y�\Z\�\�GR|Q�\�\�	���\�#\�#\�%EC\�\rhcw�L*4�#T�-cj\��B\�߃�\�zN\���!���\�\�r:}/Y\��p��)c1>��\�\\ԝڵŔب\�\�L\��Դ:*\�â\�?�O�\�\0*\0\0\0\0\0 !01@AQ\"2Paq3p�\�\0?�\0����O��O��O��O��O�Z�[��\��?\��)�(�/��_,�\�,�Ye�Ye�Ye�⭉	Y�1��R\�,?��_SOؠER\�H\�\�\��?��O\�\��\\?�ȴ\�\��y\�\�dtl��\�F�m\�j�Q�\�\Z�����dD����-Ĵ��_-/X�jA��\�{63c4�61;\���g�H��=Ɯ�\�!��*x�\�\���f��.�5�T^,�M�\�iF\�1�\�\�mƢ�i�QTk\��iN\�k�R�vE\��\�їC��\���o��QD\��;6����xcg\�řJ����\�r$��/\�\'*$\��\�*b�\�9׬QEq\�:D�\�a:�\�\�N_�7H����\��Fm\Z�\�\�FD��>��HU\�:#+\';\�/�\�Eb��5öF4L�ċ\�6�᧲��\Z͖Yx�\r(�J���?\�\�\�K�ɉWy�\�]�\Z\�tX��QQ��W�\�\\\�U�xLxc���\�������>\�\rW)c�7��\�ͯ\�g\�|d�^e�{\�e\Z�\�xX����\�º΢\�X�X��\�CԿBe������VQE�s7�{7�{7�{,�\�,�\�,\�n-��\�E�)QE\"�\�e�4R+\�\\\�\�n/�:B�>1\�1��&_��׆�~ʌD42Q����D�\�(\�\�\�K؊�62��\0�\�JȪ\�/�	Q\�e>�\����W\�\"�a��i�\�m6�JeP�\�h�bF���Q_CE�\0b^�Ĭ��M�\�9�9�M/X�\�\�H\�m6\r�\�3\�/\�/��2\��|h��(�_�O\�f\�\"C�3��\��\0�\�|�l�\�\�W��4\�\�4�7\�=��Ϳ��\0\�],>JN>�I\�\�\"QE��Fe�>�\��~\Z+�\'f\�Н�5a��\�k^{6��3{�e�ȥc��\��\�k�\ryW\�<\Z�Хd��K�\�1*ʹ\"�\�cx�%f��\�O�zy���DdJ6K߂1�\���\����_�q�ѽ�m�-D~|�#z-\�nE�\�ܨ�\�,�\�h�^l\�\��\�\�ʣ~���B\�_\ZĊF\�����Y�\�\�m\�V(\�m(OFt|�sD�~��DK�\�,R/����\�\\��q��\�lC�\�\�d�\�\�/����ٱ�\�Ʋ�h��\�\�5$�\�\��\�,�\�\��k�&�2�\�\�1�E�%\���_x]�%e1�eO�%�--̜hڙ�*+�Ӳ_\�N5\����:6\�\��Q\�FѢ?\�MS�JN]�2΃隵�\\\'e\�\�i�\�K��\�\"%�d=��\�^�D�V+�QXk)^k�\�Hܛ�\"G�>lzCC\��\�c7���?�����;X�:7�ȱ��]1j�jOs\�hކ,6,QC�\�,o�\�\�/��\�M��1E�a���W�6��!m慘J��cd\�\�~:f��Jѻ�ex�1�I�㉌���w��~G�V+ĝ	\�E��\\�#,�\��\�2�\�r\�f\�=6\��6�\'��\�N�;%!�\�N�\�]\�\�a��2O�!�$X��u蔯�B\�\nV�<6E�\�lFҊ6�M�Ҋ(�QF\�i�\�.�Q_^Z\��4�7�\0�J\���56\�ҏ�Ȥ�_\�⬄�\"r��K�KRL�n�\��4�w@��[X\�\�u��\0V���\r:^\�#�\0�)�2�_k�\�\0*\0\0\0\0\0\0\0 !01A@Q2P\"apqr�\�\0?�\0\�_�����\�_e/٪�������Y]�e��\0R�7�\�\"wèǅ\���:���\�t�_	<%��\�S��â\�4��#\�\�s�����X������\�<�\���\�R\�\�/\�\�EQE�Ѻ\'\r�\�=/\�O��4��K	���l颹\�|�\�nn|��cb�ȟw����:����\���k��\��\�\�\�E�7�$}P���N�ܢ�\�E����W�J\�\�a~$��F�l]1*\�\�BBU��G\�\�dc\\�\�У\�LYr\�\�\�\\���>�,�,D�*]�;�\�y�V_	vD$߿BI���O�ʬW;,�B\���\�po;!΍ٹ���W��1,l�E���sr.�\��!\�\�!.\��lLly^�/0\�~&�j\�Mh��\�\��\�#Tj�QH�P�+�Φ��\"�\�ٳ6b�f̶l͙l�\�/6Ye�\�e�\�/�\�p\�Y�آ�\�Ɗ(��\�Ef�5a�\�\Z,\�RG���V�EqC\�y��lY\���\�F�a3kொ2�\'�+�(���6�rf�\�\��jz\�qx��\Z-W�e\�\�%xE�K��\�$QC�&4_\'�>1�h�D\�&\�\�\�\�v;�lj�1͍�e�E����$?��,�6�\�~\��8\�F�\�r�f\�\�����u�.+(|ȏ�x�Ye�\�_bx�n\�\�$���\�\�\�\�R\�\�\�C\��I}���\�\����*$sX�UR(�w6e��BY��5���\�qqv�\��m^\�>\��t\�n�\�{\�\��u�\�\�J\Z(�\�xr��K5\�p�hN\�kѵ����\�c�}_CBe\�\�\�\�F�KȞZ�D\'�\�gK\�#\�OOYY�\�\���˦�W	ƻ�3LN�:h~	��e~��\0x\�2\�\�U�K\�\�Ye�>θ��{D&�\�\�z.���\�\�1J��y\��k��qj\�Z\�\�9wDzs�>�-\��[}�MMJe3CV(J�W�e�\"\�eHR_e�dl�S�6QX\��L}ݛ�\"\�(��y;6f\�\�\�2\�l\��X՚\Z�\�\�Po�c#�E�F��O2-1\�2\�I.\����x\�͍��.\�P�b�\�\"��^ �e\�\�\�̳�l����f\�6!.�hk,N\�(^�����~CDyG��|R\�W~\��Ye]�\��\�R�6/w\�.U���ݖYx�\�\�%���1f�&Y\�м	WfB\�X��e�\��7���y}�M̽�\�;\�r\�\�{,�-�l\"\��2]\�TH�\�G�\�\�R,\\�\��y��>5ɺ7�{Ǧl2����/\�n:�F!�!\�\�\�U,1eap�]\�\"ư\��rea	U\�K)f+�\�\�č8<�Y�\�b\�.\�:hL��QŖ%|V,���<^R\�\�c��\Z\�\�Ŗ�U\�ͅ+,\�G�\�\�Exu$��$_\�5E�}\�d\nd}q\\��eV��j\�\"+,���e\�\�,�ߗ\�fś�Ye�llll>��\�\�v%\Z�\03�\�Qu�G�ԗy�J+\�븺��\�O�\�H\��\0#�\��\0�gC��J߱ȼK�}	\��zd�\�7J\�\�G\�\�Hn��cj\�\�\�o&��W�\�\0C\0\0\0\0!1 \"023AQa@q����#Br�PRb���\�\�`4S�ps����\�\0\0\0?�\0�\�G/ȍ��v #1P\�q�.\�h\�\�\��;�+�\�X�\�\�w�]e���\�*���\�_�Pm�tH��\�p��f\�\��E�qs�CB\�f�\�\�d�\�\�֍\�B/<�VO	��&\'�A\�1i�G�����p��k�8�\r����?�\�J�8����f�\�\�j��ca �h\�WQ~�u��2Ժ$FAU�\0\�u�q\�N\�8�\�/���\�\�wY(�\�Rb\�U�\0\�>݄\�dc$[f\�NaKC�:\�0o��\0���\��[jL]�-g�\��\�\�I|G\�U񹮵��*���\"sk���+�,6o\��&I\�n.\�\�%W�\0-,ㄮ�\�\�ˬ\�\�\�4ؒ\��\�;\�M�s�\0�ifbҿc\�w\\޶9ԀZ\��+�Ú�GiwX	ົB\�\\���\0��TOW܋��*�֓�H--#��Ik;��VO�\�\07�\0\\\�`/������A����d\��c\�Ģ\�rL�pV��ٗ��L��0x�Vn���hIdK�.�ߗS�\0\"\�I5�L\�\�Ug�\'�\�J�\�H4\�\�Y9�\0خ��;8\rN	��BĬ&\��D\�\0\��j��Q\�}\"B2�\�>��\0t��\�M\�V],J.�e����=.̽��Be���\����\�X�\��k���\��\�gm\�\�\ru\'B�5�\�1�VJ[>�YƝX���\�\�\�ön\�\n\�3X��8t�\"\�\��O�\�\�j[>�X�(E�\�*\��a71\�\�7�3\�t`�lla�V\�R�\���3�\��.�MpMp6UV\�傴�P��\�X\�g8�H\�c�&u���ΑV��	�\�(��d]��n�\�\Z��[[/�\�\�5V\�s1a�&y�gd0�nV�]\Z\���\�mV\�;iYZ@�sC\�o\�\��_\��\r͙ƭ@\���է\��\0\�=LحOG\'�3<\�e��G�\�֌1k�V_X�f�\�E\��]W�����#\�hα�\�c\�I\�Q�pߦ�}��-\"�\�hy��\�)�\�x~\�uE�ُ��\�\�ݜ?�s:E�h�^Bo\�\\\��n�������!`Nm����?񚰕�k\�-7k+?�F�wʋ�Ç_�\�\�`;�\�\�Y�\�9�\�	�M\�m���0�9Ů�0A��`�j��W_f>#k\�&�2b��-���\�ꋁ�.%iѝ�8t\�>�e�$Bo\��\��T\�-�>��˩��66��C\�,�\�ƙc\�m���M��qk�ʨZ�8�xg\Zuc\�W�\0�?cf\�Нj�5b\�}U��\0���&\�s<�\��\n\�\�B5��n:)�l�p\�Ú\�O��\�8�m\�\�[}JѝfN�A��6�RP\n\�\�M�k�\�\�|�\�\��{9�k\�`昍{�~�λi\�j�Aюc3�\"�\�l�;���\�s�����o����?\�>9��]oG8��7\�T\�\�x]\�tw7j\�&Ü��qF!Н\����m��|\�_\r��\Z\�\�\��C�n.\��\0\�<ؘ\�\�0�f�\0\�`x#ci�e���Vvoq\�\�H C`�\�\�Β\�C	\�\\\�\�\�Lm�N\Z�E�c\�(9�3#8����M\�{l\�i\�%b����,L�\�\�gp\�\�&�\�5�퇸�E�\�\�(:\�\��E�i�Dسk�V\'Y@�\�(\�Y�\�w�״9�qQ�G,K\r�G$\r��\")3w\\\�8Zq�\�\�g�+���\�\�\�1�J\�id1qX�g�Ęߋ�\�i��\�x\�X@\�\�\�\�*L\rX\��:�[qX,����\�갟\�`�b�\�\�~ \��X\�1(k<DRel=\�>Ɍ��\"��fk4\�<E�(�a�E�L\�\�Y����\�E&Qc�ZD ��Y��\�I���\�l=\�\�-��\nMl=\�;�fU�\�l�l�l�\�x�\�C\"�Գ*\����\�e�A�@&�\�ņ�L�}�Z\�Y�&��kD\����\�77�f,4��\�B��Mb��l\�hbc�\�[<N��\�{��>��bV&\�mj���\�G8!gj\�M�V\�\�V&�JD��\�d�\�\�]gfm�\0�Ұ\�\�\�\���tk7>\�\����\�\�~\�\�\�\��l-2�gWm�\�2?\��GӒ\�ma�cvĺτwrVNi�w�_��?A?eb\"u�u�̏G�u&\�Q-\'�l��?�\�~˩��,\�\�+9\�r�Vl�8z\�Ą\�{v�\�FG��wb�\�p�iδ�\'�kH\�R<U�\�V{�\�\�Htk7sy\n\�\'\�Bͧ:\�\�\�\�#�H�V�\0AN{m��\�i�ָ�pFSV;���Bx��j-���u������\��\Z&B\�\�\��\�~&\�1n�6�1�fl8�z]�&y�\��d\�@�\��M�Ҍ3J\�\�\�.t\�>�L1�\��}\�u�m�\�#\"S\�jqP�\0\�ZK�H�A����h�}�\�;\�-\�\"��#�����mYm5\�\�-6��V�M�Þ\��\0���\�1�d\�\�ZZ\�bA�g�߼�n�`�,fսgW\�:LL��\�f�\�r�h\�`p�Ȕ�Z�E�+\09֒�F\�\�?o\�,��p�Qs�S@(6\�Ć��rB\�\�h\��\�m-`\�<\�5\�t�M��\�\���hs۪x��cn\��YZ�\��\�M|ZwF �_�\�L{���\�\�\�\�tV��\0�+�c���\�֏\�\��|\���G\�CY��Gh\�K����l��O��gX\�sR���l8pMm��滚6\�V�kjZ`Q\�5\�a7u�c�a�B&͘ k�ZZ6����-��9Q[��A<9���O�cp\�f\�qt�6un߽ZZ6���s����\�G\�*\�\�	�\�\�ign\ZӺ%Zu���BV�\��\��sy��\���\�1\\A�+�旁\�SX��@\\�Y\�K\�;K2\Z8�af\'�\��V04C�ڬ\��\0l}\�\�\�\�`\�V<Aε�G�gfpÊoH�gV\�\r\��V�\�u�ݮn\���\�[�\�\����d\���Z<j��{;7\�v7O\�1Ǥ�M\�.\�	\n\�\�\�%ux�8F��0TEz�\�G�Y\��\���\�ے��\0\��x���\��D\�Yٜ0\�\�,\�ոCze���P\�\Zl���\��\�\��6��\�����\�sF޺0\�c\�,%�\�\�n<U��.p\�fۣ\��\�\�8�\0t\�\�̒���n\�Qn0�\�Z��Hp{�\�(�\�2\�C���\�Z `�md\� �\�\Z\�\�ٖ�\'\�VVn�X\���-c��:;f0�&�L��$	�i���\�	�>�\�\��J\�\�H_f�i��<S\�d@y��\\{�pN�C�ҭz+\�\�Lp@�2д�\�\�K&�M[YY��\�1�O6��p\��fC�jۢ�\�gp@�2ݍ\�yA�*\�;�qV]Y`\�e�g�(�g=�к1���zC\Z8��\�\�=�aD�iѭ\�y�4-:]�8n�cx\�A\���Fw�+0b�#;�d�E��p�\�B\�mi�	��sZ\�3�,��\�y�KvF_fE=\�\�\�R	�@\0M5i\�m\�0�����f�qj6���\�\�mf�6\�&+\�t��\�\�w�*\�\�\�\�͸�H\�1_�C�\0�ɠ\�\�;A�OG�\�\�P����\��J8m��nޯ\�0X\�\�kǂe��ִ\�(\�6�j\�\���Ù�Ou�9\�O�\0hy�n�_gj�O��-�\�y8��\�D�\0�\��\"�\��l�\��\�!kj\�v���e�u�l����ڱ\�\�\��\��\0Z&Vnr\�RhZ�g]-$�\"Uf��-`�A\�\�8?W�����V\\�\�t�ަ\"�a�\�jû��\�`\�w\"ߘ,6��\�z� {�s(ø)-�K9H�MN�\�\�M\�\��\�#7J\�҃Na<T&�̨�$�/��j�7�:(��{l�\���`A+��\��\�����Ϻ\�e��,\�H�ܵU`Txv\�h\0<\�Q\�+��J�\�\�܀\';�V\�\�\"��\��%�QH)Wx\�͗r�\��\�\�\n0�	$8M��Q�5P�MӢ��P*�\�P\r*�T-oE�\�\Z��\�5Dv2\�\�WFO4/�j�al\�ŧ�����g�)&�:�G\n\n{��Ne؍oqw˹\�v;\�����\�#�Z�\��V�Pk�й��\'Y�\�5R[\�1@q�9�\�\�!Z�\���JzG<��w\�119�\n.Q�5gح~��ߢ\'�\n@�\�I�c�\�\0xE5«>\�\��l�k\�\�\�+�\��(;���;ʛ`��\�.t�E\r�\�z�}�|E���\�j@�?�\�T*�P�UUUB�������?�\�g\�\�bh�[�\�\�\�\"\�@\��H�M�uV�EE\�,F�I��E��\�QuTp\�j��\�浔C��\�P7\'4�14Xp�\���FTA��\�o�ޫv�Z�BT�r\�>H�>j�@\�2TZ��P]e\�V\���9�\��5�Q\0\�\�)��\�\���QQQQQQQQQS*��\�E<�\�\�T�\�i\�\�3��&\"N\�q��SQ�rɉ1X�7�Vgu-9\�A�j���Z�P\�ջ#y��q[\�#ިB�_\�MUoQ07P�\n�T�\�sJ�`ģ��JD��\�\��UU]<w_h���\��	\�\�ud� \"�z8):�Gsx.Y.w%�\�5W��P\�>���}�T[��\0J�T�D�\�\�uT\��T\�ZH<\�x{�9\�\�[���\�rÞ;[�ܥ?�_/[�\�n\\2d2#�\'7q\�t�V�\��.ja^7\�Bh�\��UE�*y=[h\�\�V�T�uۖ\�*\�U���]K��~\�\��J��ׂ�T�\�\��պ*l\nq6��X\�E�K���}Tq*��\�D|\�,�B��Р\�\�\�\�ej\��3%�hxY\�0\�/\�0U�SSޠ|\"�/\�5ϥп��>jN_)_\�\�oE[���\�U[��n�\�u����\��͠�QY\�J4qXl\�x��;�Nt޸��X]���`+Yo+P��IS\�n�El�z�\�h\"\�|�\�ɢ\�iOҠ2��>!F\�\�p���e���-h�nQ5\�q�\�ֺ\\.�B�P)�\�n�U��S��\�\n�Ty-\�\\*�eUSv\�g�\�g�\\.k��\���\�A��A\�U\�h�Uy�D\�\��E\�\�Z�UnQt �\�k��\�E-	$O�\�+����X�t2(�B\�\nn[\���A���q���U\neT�\�\�Un��r��\0ʆj��r�/;�$\��d9��\�uQ�0\�\�\�@\�\��\�/��*��\�A�\\�b���\n�P�\�j�T.[�4<\�/���w�pɕ\�#pZ\�UM\�w���\��Z�\�UZފ�jP[\�R�L�z�\Z�\\<��Ny\�\�Qh\'�\�pJ\nD��-X�*9Q�\�\�\�ZWqTR�\Z,b�\�\�t�Mt�P(\�*�����\�w�\�\�):\��\��JJ�L5o\n��#8\�C[\��Sȩ����Z�_2�!�f��\� �\�C����w�_�\�Ȉ�\�\Z\�\�:\�xn�t\�\�\�Xj3\�)���Z!\���!f�7z�q\�_\0�-�D?\�k\�1u;\�A�(,\�0��\'BrA#r�\�\"Mʙ\�[ԋ���\�#�o96(�\�\0�y��ȫG\r\�\�KJx��D\�|\�nr����U*d)AT���|��\�-\�P;�SkVk�.�P\Z\�$��[S����:\ndV\0Ȫ��9L��\�r\\21�Ta\\��EJ\rᣆ���{�\�1�\�o��\�qZʍ�Q�R>�nT�[\�b�B\�r�ޥ%15���H�c$^|4�RT��O5\"��\�z-gy��(1�2�\�X��d����\"=��\�AV\�?\�(\����/�b��*���\�Y\�[�\���\�>Jo+X�T�T\�\�\�jꄷ�F2%�K��\�6ǹCq���Sp��X��\�wd�q�5t�gnAH�8h�\')�*�*z,\�*5\�W\n\�Z\�_\�n�Z��`\�5T�F\n:\Z��\�OpZ�/\�U�T��Ҿ\�gCdT�\��*B�\"\�\�\�@\�H�W���A�p\�\�&\�~\���\�T-e�T�\�Ry�\0�#굗��6\�-f��-Tc!\�E\��F\�]��\�$r�\�0��R�\�%EY�����\�\�t �\�m>hö�CC�y�h�9P��\�*�]/EP|Td�n���S>an�U�N��\�\�\"ͅ\�C{ܥ�\�\�F�\��l]೬�<\0�\�\�F\�)�-R�B\�7M4�qQ\�5\��P \�rb~s\�\�\�Q�GE5�R*�T}NE\"��\�c\�DTǑZ\���+��A�uѾ2`涖j6�\�\�)�\�8���F��H\�g6|D�u�\�\�P�tn��\�t��et�k]2.����Q�����\r\��\��\�KXd=�{DG�PL�+�5! �栣�K#xR#\�L����C!�ɪ�� �e3ʋ\�\�Ц \�h�B���SRS��Mj�\�z�TJoz�RS$#f57\�\�jp+UoU>K\��X�N\�\�c$�Rz-\�N\�ky�8-\�\�\n�UN�qZ�p\\r7\'\�w��%5�\���\���w\��\�����OR|.�\�8\�� \�ٗ7\�\�\���\�&r�\�PV.\�\�d�\�CC�(DB�U��U�P���h�\�\�ەU\�\�o/�D�b)\�\��\�v\�;o ��\�\�\�\����XY����D�(FI����y�\�\�b�^`�2T�������@\�ߒ�tLb4a}��|�A\�|U\��\nmY����\�·)�V�</ޤT\��X,\�(5jz�Dt\�\�*�����j̄�\��HC6*X;��REL-��X�����\�~�l}\�N\�\�V\�����*LeI��@6�S\�C�h\�O�I�UA�\n��YUUW\�W\�UUUUUUUULE	)\"Ƕ �Y���TTTZ�/��\�+c\�+c\�+c\�+c\�+c\�+c\�+c\�+c\�(�������\��Z�Uj��U��}V\�\�J\�j�U��\��Z��S\�jz�OU��Y�^�l�J\�{�\�{�\�{�\�{�\�+c\�+Sԭ��\��*vQ���>\�>\�^\�^\�^\�^\�^\�^\�\�z���+g\�V\�ԭ��Z��c��j���JH)?,�\�<<�T���g,�܎�eUUUI\�G�S�\�-ýOM).+Vj�L)3Q\�Cz�n��7VD~Y�\�Pn��\�Ȟ��\\d%P���\�X�Ќ{��z��ܷ���k4��\Z\�e�\�(o\��~��<�~IT\Z\�ǙY\�St\�|��\�#t\rr%\�\�q\�<�&��u2�2Ge��Wsࡋ䥑�0�{�ҨQ�\�ɦI�\n\ZG\�r�9i�\�{}r`�^\\N��H�6ݪJ�r�Ú�F���i\�u\�,�\�FZ�7�C��\�W8�\\\Z\0��Ԗ��Z�\�H��ӹǞ�}�w]\�\�+E;��_r\�w\�ôOK\�C�\�(/�\��<�]5\\��\�2\�ݓ��3q��\�]\�u.��*��\��U�\�\�\r�U���.SB2O=;\�nP\�Vq�)uk\n\�+8h\�`���wK$]EP{\�1y�c�яGlG5 \�!\�\�\�.\�\���~SG$FL\�|֪��Rq��\�{-/�ֺ���<Aw�D	��ʘȥ\�*+vU4�9Ve<\�\n��\�\�˪��:Q�,&dS�\�t�(�\�\�԰껁Z��_K�\�KLPG+�\�g)\\\�\Zd?�G�\"�\�\'��e\�\�a�\nG\�\�\�7��b0Rt�j�����e��T[�w-ʃF\�\�r�Pp�ʕ\�\�NC�\�Ǭ��e}A[���M\�\�k�qQ�\��w�X�P4m+\�AU[�y-P�.�Q����&�\0�����p\�a�J�g\�w%�q��S&*}n\�\��fB\�ǎ�\�\�\�\�ET\�7��Ȃ8�qE�\�\�\�a\�\0QF2R��S\\�ǒ�\��~n��\�sx\�0�2�Q�l\�ڹ\�\�Z�+\\�\�_\���wBY8���@\\\�\��\�QQ@���E\�\�).*J.BEҺ�x�<�D\'\�Ld=�7\�=���&�|Z\�\�f\���.�<�\�+6���\�E\�w\�\�5U\�D]\�N=\�\�7Igͣ�B�\\\�%\�%L�ʡ�QEM�Oz �R\"B\�w<�]��h1�(1�%EΎ�\"��#Y7\��\�Ĭ\�5ÑRt;�\�\�pÑE\�E5�y,\r���\��|\�r\��\0\rpܹ*]��\�sUޠ!���&\�f;Κ!s\�\�ɿ\�k�\'(;M\�b��E�\nQUD(*�\��*FAI@m�6�\�w��U\�[?U��B2v�\�\�5JQB0ₗ�\r\"%@qRPDQo��QX��\"\��oEۂ�T#�r\�ȉqX���;\�.���\��\�PP��$]�P\\� \\�|��A\Z;9	#()�� �\�O�\�x�I��H,\��~�T\�(\0f\��Dq\�Cv�X�#�pUS��y\�R�\�܂\�⣉MK~\�/q�\�o�\�ѷ�n���\�\�\'�G���\�VH��je�wN*k�0\�\�P�gdY���Ȇ���\�� ;�\�3*N!\nΪ{���J��q\�\�u��j�FIѲ$\�\0�l���­\�\�\"%�[\�#.\\Q\�a\��h�J�~�؃�x�\�LI\\Ǝ�gW�%�\noX�D[�\�\�G+\0��NR�T\�\�;\�(�\�S��\�\�^�[�Ar��i�f\�J\�\�Q0��V\�Jp*G9ʆ�G3Q\�\�&\�\�a�9_fV(BP���o���U\n�2�\�\�0\�E�K9�֜.>*eqC2\\� \�P��|\�(@	�;4\�N�vpPu77Y�q^7�/\r(�p�\�C\�7�(nSB@��I�\�U�D��\�@T!�}+U/5\�����#[�F\�\�0\�\��\n ��P-@�\�T+\�Ur�Y��Bp�[\"��X\�H\�U��Tp�2T��T\� ����Gώ\�G}<�k�\�sT/�\�^\��T$�\�o��%g4\"W\�r�\0*1N��\nL9�2Ġx�jY�*\�+����\��#ħ;�\�,�W!e��Ur&\�X�x*1��a\�PX�.a:C��\0h�\�\�Nb&ޣ��T�ᇒ\Z�DqT�\\\0఻\�S�\�\n\"�\�mP\�)��g74 Mw�˹D\�\�|��\�9!\�,\�\�n�� ��uI��AE\�\'�\�*\�R\�\n�\�*;\�/ Af6\��\�R�k~�)\�C\�j�\'w�I�^ 3��B$�\�$aQ\�ĸ�\\Y�HGw�#>c\�\�\�\�\��\�yn�&�!b\��M�D{�\�\Z�N\0\0��4��$Qq+�\�Va!C\\e�J��S\�\�*�E�\nÌ޷F\�c?�24�уD[�b���\�,!D\�\�\�X��\�]�F�5��F),\�O��p?tq\0\Zx��Jq�P\n=g�Ŋ\'��1\�\�\'.j�7\��\�%\�*�_\�k�-��m}�i\�[_j\��Zދ_\�m=�k\�[_j\�z-��5\�\�m1\�P�Tq*\�ƨ\�t{��\Z7tc��kS�3�P�\�+#j[�,E	�-e�V\�l�\�z�Z\�[\�G�\�Z\�_\�m=\�ڵ\�ඇ��b>J=w���\�Q\�#TRy�[OE�����\�z-x�*�\�5\��\n\��Z��S\�b�%���}T0z���\����hA�P\��\��y�C��\�\�C���~i+��%t�t���Ӿ�ȭ\�F\�\�\�`\�\��\�`����*�\�kpS���Vu�<Ua�*���QEVj*WMU@(���\�UUf59_�˱MD�\�%N�w�9rS0�6�\�&\�GE.\�2b�ʝ.�Q�����\�\"7p\��(���(\�AEJ\�\�SE\�5�\r$���D��J�o��\�\�+r�G=w)v \�j\�\�t�B:99������\�E����Β#Dcwz����U\�<8\�\�1\�<�T2&r$��\�ˇirTTQ\�\rɮD�<���\�SЕ�\�&��; <B�c\�ò��NP^GDH��jHvC\�\"�T�`\0(h�\�O<�^`���*h�<{۹��\�\��R����G��<2�q7R\�h��\\)�	쭴���:�YO#5L�\�Is:j�\�8�r�y䅌�\�q+�Â���Z��Z��m#�wr]]\"5� \�ږ\�\�+wD(9�p\�T(x\�s9\'О\�E�C&y5���\��L2J9,`��R%f\�\�\�&�\�a�_%��\0\�.�q\�b$p�h\�\�\\�m���\�Ū!\�\�	2\�\�\�\�iqR�Ԇs�\�HwF\��\�6$��\�~��hJ\�yZ\�S�Pw`sa2rFK�,��Z94B�*\���\�qS5\�vhA0\0I�ٕ\"�\�\�%t�1<�\�9\�&�sW;\�j/�C�\�\�\��\�C�ʲ<�z\�k�P~�\�Ni�Sp\��t�H�~\�]+C\�;+��\�6��\�\�\�!�.\�\�T�\�$#�6�\�D0\�X1P�\�\'���\�怆i����\�2#\�ZSq\�\�@ha�\�MUbi��Puo�\�6��@q\�EMH�s\\>j�*M	�Y�!u4R\�@!\�k8\� �fK$Dh�\\FL\�\��e�\�:7\�pS�r\Z_\�2��\�(\�\r\�(5@]\�\�H\�h�T�\0\�@��?�-�;\�4r�@\�4\�pP���\�IE+�N�d7��J%In�V\�\�9ʖUK�\�S )�P� 54��\�#H�\�DV�4Z\�ќ[T\�G	<Be �q;�h\�r�:\�\�U4�8F\��e���TH�U�RiR��\\{V��֪��X0\�<T�Т�r�\Z�*\n	Ê�-`\�t&��\�(4dv8\��K&�\�\�]\�FHa�Saq�\'r�c����\�҇6�bn�r��G�L2ƞ�&�ʚ�C{�/�ƽ�pX[NÈSx⃚drc�*��ó\�IQW ��\\�\�\Z��|M�\Z:dE\�$i�6�\�\�Ӡ�E\�\�(�\��4�*�\0�\� �\�%���aWK:\����\�\�*/�����Q7K$ǂ.\�$.\�\�\'%-$E\rBi�ʖ��j�wF�\���@\�\�ba�����*_%<�K\�#(\�412R\�\�P\�(�\�\'AI\�M�O�OG\�\�a\�ک;a~\��ag=��\�\�@���ٹ#&����\�T�\�IO�G&J\"\�\�At�Lx�/����ɉ����\�T\�y�4p�\nZW۰�\�*9N7R\�\�+�۰�8�8i0�l>�9b�q��RC�Ӡk�\�\�P;��,]��e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�c\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�e\�\nv~\�^\�=T��B\�{�\�{�\�{�\����S\�F\�P[?p[/p[/p[/p[/p[/p[/p[/p[/p[p[p[p[/p[p[p[p[p[p[p[p[p[p[/p[/p[/p[/p[/p[/p[/p[/p[/p[/pQ\�}�D\�{�\����������������������\�x��\�\�K�@�\�\���C��.Wሏ��#��0��\�?�����R������ҳ���X�7��.4h�N��<K�|\�&�\0\�8�Xf��A\�9�2Q\�\�7\�31�\�Y\�o\�\"\�\�\�Tv&\�7քD�j/0\�7�\rVp]c�)v~�/k3N���퉫`\�\�q�\�ȕ`ê]\�}��\�Op�iL�D���\n\�\�o��ae�5w>\�#_�?�\\�T�\Z\"�!� �dը\�$\\\�6\�r\�tG�\� �X Z\�ꤢٷ{Psiw[e7Q\�?2�\�����9��6��7rP��B\���\�ɂ�{0\r\�3VP|M\�pK/�\�0j� \�\�I=\�S\�ѫ\�vakM!\�9�1�w�E\�1%N�9���4@dA\�*6y\��Q�y�Pp�\�T鸨������\0�\�Q��\�\�F�\�`Qc�ҋJº����KB+K�A��\�SX��F)��\��\�\0,\0\0\0\0\0!1AQaq�� ���0�\�@\��P`p�\�\0\0\0?!�\0�[�^����)`\�\��\��I�O=.\�\�m!\�\�]�d�i*\�\�ZQ1I�!�\�T^\�\�,*{L\�?\�\�SC\�\�5\Z\�sԁ6d���\�\�\08^\�,h\�O=.\�\�\�!g��ˢ��A\�Hsq��\�f�#d\�v �M\r3�\�����:RƮ�\��酰���K^�i��u��d\�NA�\���\�\n,��\Z�PiN�\\b\�tv`@��\"\ZGʠ�b\�\"��:(\�ҍ�\����(]SَZ\\\�(\�ҏRD,�%�����\��#hK��\�_,\�Zd��\�g=�W�4G\n\�%\�\0/h\��^ޔ\nx��Z�e����B\�G\�R�W�A\Z�ͥQ\�\�Р��A><w��f\�o�?��|\��\��C\�\�O\�����\��O�\��/x�?\�O�~ .퐍os0s?�=�ߴu��\���~Y� �2�/3!���B�;�!�	�Ә\�#�\�\�Ʋ�E�ܝ�\0x�|�\�@\��W�\�jy����5\�Z~\�\�\�}\�\�\�u�<>e���oG�\�\�\�v8�\�2N嚷\�쫳0%&�m}a\�=P\�3\�N}`Ġz��.\�\�a9\�.Gn�\0=}��;Hf8e�\0yls\�v�8�ϩ,�\�zd�?�}���R՘4\�l\r\� �x<�Y�\�\rz\�U�}o\�W\�cN\�\�v�\�\�a�r\�t\'q�\�\�\n�\��d���}\�9�h^0z\�l�U\�IY2\�]\�Ɵ/\�^��ӿ�\�~\�ĳ d\�1\��\�=Bᚈ\�\Z��I\��ҿ��\"�\�\�\�(s�Z\"+\�\��K=~:~�\�Yc�\\:V\\��&#����\���u�Kk�ߕP3_1Kf�\�C�;�ιU~\�pp��+\Z��w~ɞ\�\�l��^��⡬Ͼ~!8��O{�z����\0PqT��Ox\�\�~��,\�\�\�\�*�;i�;z\�g)�\�p���S��~LD\�Qw�\����\�\�\�W��Yt\r^p̥��\��_\�8h*�ĨE8/\�2\�yg\�IF\�I�_-N\\�\"��\��\\o��x�II^MK��XջN5UF\\g\����C���C���iU�e��]�ϛ\�\��\���\�\�\�Fc)�?�l��7\r��|	�\�\�\��\�v}c\���#=J�&�\�\�z��=\�+@+ 	�}��=5�v�,}Z~}%��\��f(0T��\0�\�\��\�\�>񿴩�QH7\�j�7�\"�\0X w\�Eä\�Uu\�@\�Q\�)	��\��跢\�\�\�\��O\�\�y;�3-�R�3\�\�\����\�yb�g��\�UE6NW�\�A�(�*`\�h\�A\�\n?�R���\�]\�\�?\�iA�v˽�\�\��\�\�%�m��n\�\�\�t�\�c�0��@t\�\���c�\0|���V=�*KI\�\�5�,vژav\�q@�wb�\�{۔<���z#++E\��u\�kke\�ވl*�\��u\�6\�~7\r\�uxtK\�`�o\�i\rX\��\� D�1S4\�\�\�8:\�\��\�*\Z�\�����\�\�\�,\�\�\0\"X����rCk\�2�v5��C\�X_�~���;��\��ǖş\�\�\�\�,ylY�\�]�W_\�҇�����\�	+\"�YqT��\0�~���\0h�<�,~\'\��\0x��C+,h\'ڟ�Q�K��\��;ku��̔ͥ_��bwl*�%r��B��;_Э�k�|vүz��\�v�\�1\�\�\�$\�;\�\�\�\�WG៣�\�(\���\�\�\�\�\�,\�\�\�\�\�i~�K\��?\�xm\�90)�t�E\']�W\��v�V�=\�K@�\��\0\�Ţ\�\�>Gp�\0\��ʒ ����\�MT�]W\�\���U;��o0�E\��DvZ;Y�\0��C�\r祀k\�V+�rB����\�H\��3%Y\�\��\�M��\��{G�g%Ec\�0�G�\�a\�v\�Ǟ�P?\r�\0Qq��\�\�4Q��!�\�\�gl������>	�G�p7�G|R\��\0_�\�F�\�\�\�۴e�Q�2\�\�\�?Q\�%\"�\�%��=�4\\?U��<r�m\�x+��s��2�2�\�{0w\�\��:*_֌&b���\�\�\�L\�J\�lxhw��$��f*\�j\��\0E��\�/�\�;��p��o\�	�\�\�;3�_��a`�ۣ\�&9�a9\�B\�zs)��S�x\�\"�V��)\\m\�\n\��\�TL�ߡ\�9p�\�`\�X�\�Trͅ��\��+\�KnH=\0\�U�\�\�=�&�>�/�\�?��p\��KY\�\�Y\�/�aE\�\�z�\�,pϻ�tU�N\�ihe����O�Ԕ݂��m���\0c�a|�@u??\�K:\�\�CA��uG\�a�ߒ�$@\�����O�~\"_C\'!�\�\�(�|яi�wWv�E\�G�.\�\'6<���\�2�bЫ\�#\�e�:9��t?\�Q\����n>\'&\�\�K��d\��\���y��?9�*��X\��6�\�\�\�\�Fs��\�\�\�>�X4�\�~��F�#4���\�\�_Xm^C�DM��÷B.�#\�~�ڇ��\�҄QZ�i,�/\�̶ԥyE��z\���*��n\��+J9\�b\����ƐA\�\�b��̚`Q\�\�]� \�Vn\���{�ؼ�uxK�Յ�$}ҏ���;)˴ �F��4�t�L~a\�\�\'\�c�\��Y{V���dI�\'\���\�\�\�;V�s�\�-���\�\��\�\�1U�fM3~\�ܝ\�s\�\�@�\�hˀ\r��r~��t���!��\�\�x��оĵh\"�;\�\�[���>�\�5Gku�Q�܈\�\���9�יb,�zD똁�\�34͡���U�~	s��	d��&\�*>$�\n\�5ZZ\�(�\�q�\�j�W$\�6{\�_�@\�fٴ�U��\�u+p�\�\���$��㼡L�^=#\�Gp��VEv���l\�/\�5\�%\�\� \�h�\�)�+\�،y\r��b��׈\���R\�u*��g\�.ATg{�ѣy�ٸ\���^�m�v�\�I\�dp�\�����\�f>�Ѕ�@�o1�YO�_XV3^\�\�$\�c`\�uk��^�\�\�d\��\�ዸ>���p\�|�%\�<�\�\�ޥ\�V\�ḵ�\�(�	�\���\0���0Y7�\�6�e�\�N\�\�{G\0|*n�V8�G\0K½�\�\�e>!=aX\�{k�ei�@� �\�\\\'k��z8�����?��\np|L\�\�-�x�}H����d��&\�+ �xqLH��q\��\0�Y�&+\�2\�Yz�\Z�%��\�\�\"\�\�m\�\���!�b9�\�`�+*f����Z ?\�\�۱�\0�r�\�{yϺ~Si��\�\"�}\�q-k\�\�5?\�\�ZԹvEZe�S�\r�*��\0�&\�젙>�¨\�,�f\Z+�4�\�J\��_�]\�L\�\�\�ȋ��s\�`?�	\�@Q�\�\��\0\�=��%�����TJ�\��\'�C.U*�Ի�_�\�K=\�\�\�Q߈l�\���G��E�1�tk��\�Q(\�.��\�\�+�\�X\�y�&n\�\�\�q\0c��2\�`\\��5�B@�WB�`J\�<���C��oC\�1\r]a�7�\�=J�\�i��\n\�X\�\��*R�A�6qQ�52\�����s\�\�Y\n9�O���.�t�3E�Mv�\�3\�\�6\�\���:\�\��۲�\"�\�\�c�)\�`A\�\rG�IO\�5q\�J�1�[���s\�,;oh�[*\�\��j�\���M�\0�m�ҩ�F2�� D\r7��;tM�ox\�6��\�pE�)\�Q�q�J䗬G��UG\�\�\�f+\�#R�ts\�)uZ\�\\ܦ\�.\"iR�}\�i;��_\�\�\�7�\�b>�Z,9z�W{�\�\�09�\�K\�N�vG�\�9SR��\���\\v����4^m�\�G�\�۷K���O�0\�	�7(�1S)*�\�D=�z\�L���\'��ЈM5\�f:�d.�/C.\�e\�ˋ�\�A��\Z�#\�^L�\�u-��\�\�4H<@�U\�pl�4L@e\�V\�\�9M�\��(>����(�\�\�;\�\�/�ٗBx�.\\��g)�K�\�`\n�\"[�/\rr\�&\n�X��EH���D�`\�O\�_�\��gQ(\�Q\�\�\�,Je��\�:\"\�\�4M�x�R�Pk�df�*~�mw^�6�mb?pܪ\�\rVL��_7g�\�йr\�˗.\\�r\����8D\�t\�Mˋ��\�\�qQ@��N@f邛\�Ka^\r��\�\�;#!\�(�]\����;\�}.\\�r\�˖K%˗/�o=�����\�B�#/4w(]�\Z\�\�|BU\�\�³�Hl\�܈1�f�`g\�\�h�\�&�\�1�d!�	P\���oi\�,S\���%M\�w���\0֞\��g��?�\'��</�\�|\�\�x�3\���[֍o�\�\�f4\�Jw\�R\\��,)��`6�Z���`08&\rKf�i��\�ǌVb*�jx�\�_K\�U�`\\�~e\���w�x\���a\��\�\�`�\�\�1�K���f\����\�\���q���8M\�\�A\�fk\��Aq\�`;\��	H��*\�Kުb/3j*C�	�%u\'\'I�\�\Z�ڙ}��\�\�\�\�d��e���%^�L\�l�\��\0\�Ây7*\�\�\\p\�K��\�z�H�\�ga�\'��?�\'�\�V!G��H\�\�Vg�&�����_5T\������g�X\�\�ص\�S#�әu@\�4�%�!\����\��\0\�S�\0sȞd�3\�\�=i\�Oi��\'0nGM�\�/�\�V�/r���Lf��\�p�Xv\�U\�Q��[\�W|��b\�\�+�J+\�i��$5�\�\�(��\�d^��w,zs,�P\���3�\�\�i�\�	{�\�\n\�၁\�\n7V����\Z�O���<\�u��1\�\�19\�Ő��\�K\�\�%O\�_\�\�߼䞓�|�;K�Ś��/\�/�K�����\�\�,\�ү�\�G�l�U�e��\�)i%)\�\�c\���O\'\�\0\�=\�5v\��e�\��\�\�\�e3�\�7\�+�\�_d�\�C	iP�\�\0�z�v\�-ܗs[����\�:��)�\�eC���J}\��\�Y�:\��d�y`���إ�\".�I\�&1�\�P\�A\r��)\�A\�\��gf}\�ξ�\�U\�f�}\0-\���%\�X2e\�5Ŧ4�aWT<��h�*\�Xy\�\�௜Z\�3+�P��#B\�\�\Z\�Eu^nZƋ<\�(�o\�mK�Y�@֟�\'\"^2�\�d\rV��%\�l\�U	L\��\0�T�Z>.:�W�h���(]�v�2\�f\�i�kRч7��\rm+��w̤\�O?iN\�TQ͞ڍ\�����\���\0ȷ��yO,ŨGA�q�qQ��O�#fq\�X\�[��d(*hX\�cӅ\�\rܨ\�B��\Z��!\�R�\�A\��A�;ʘ%���撧{�2���\n�\�$앉O�\�\�̚\�m\n\r!Xw���p���2\�zJ\�{	\�(�e^��Ĭ�\���OGq)\�\�yA�\�1�2[\�Z_|\�v	�7��Z+\�[Zx�\�q¦�\��`\�rg�~~%/N<G�1�Gn�R\�e}\�5���r\�/4	\�\�\'��^jHX-�\�JP�\�~P��(UY�\�G̽0�\�.��\�*|��Q)\� ۖv��R�L2�&[��r��\�,\r����^^��j�j����\Z��5�\��\����\�)?�\�Y\�{�\��	ѦS\�;\�Z�1!\�2\�T�p�\���\�B؆Q�fnmm�\� =.-.��+x� ,͈V�~\�;�Ćf\�(\�|��l�\�!��\��\�c���\�Q\\�o\�\�Y\\�S\�yT�\��%\�ތ+��c�#\�&7}J�#ݬ&0_�]��C\�#\��D��}-� �\�\���L\�.cM��C\�i\�\�\�Z��u�5\r�\n�Q\�n�w\�b\�s�`@��_.D�sL�X;K����W�}>�ق̭h\�ʸN\�\�:/�!�-x&B��@\�9�y\�\�3���K\�\\�\�\�\0J�<A�\�\���c3\�\�:�>L4´?�5\0C��TH�\�zZys\�$p�	���x�0i\�\�A\�,�e)\�\�S\�\�s���ӡ�1.L/�QͲ\�r\�J�\�`/\�oYx�\�@��i\r���\"\���8�<��P<�ać�Ǌ�)�Bp�;\��\�\�#m|5(��e\�yB�n>��N&\�\�ݢ��\��EIQu\��\�ˣt\�m�@��v!\�P�u)T3�i\���\�F��{�>jlC\�\0�>\�\���+��7و?�7Kh�3 	��TrU]���\��\�º��l|ŝ\Z.nXvy��*\'0�K�\�\�\�M)<w��\\ÚfQ)�����wCJ<bY\�%7\\H\� \n�W?��~(F�\�c\�ظ�OVqL1;B\�\�6\n��c��R�\�y\�;=�y�H\Z�b�\�O\�\�\����\�Ӵ���yzFV\���ƙS�\���\��a#\�G\�>Rͪóњls�w��\�\Z�E\�\�=�\��9=�㹖Ƞ\�Kxe-��Y�\���\0s\�{\n��n\���m�\�8�\�{���lJG�X\�rW�.�7g��y �x�\0ڟ�Q_84%w¾� 0}g�\�M\�R\�8{D�}atC�\�50\��NGM\Z�n\�*.gP\�\�+\�^�{NHm\�fs\�nr$�f\�\n�Wgj������	\�z+\n �~��a\n��5\�62��v�����n�0y�\�\\�\"\�F�7�\�ۣЊ��\�ń\�e�\�. ��r��>��\�c�CQv�1�0���C���)\��##�o�QjB\'\�b�~lH�${L��\�Tz�=fQ]�\�%\�\np�\��j\�2\�s\�54 h\�\�_&\�?K2\�Ltf\0\��\�:��n�Z6��;;��\�\�\"�\��Di�?=#~�\�hM%\r0��\�vJy~&��\�m�o��L6E5aޢ�w3��[�\0�erz�\�\�0�\�˯�vNKa�>\�\�\�\�d�\�Ö,a�\�9=a\�g3%�bfT;#�� \�w�\�y�D\�\�d(\�u.8�\07\�a��\��!���)�k\�e�3v*`\�\��\�\\�B��PiH�\0Uk����:t�\0/buć�\�#�ŏ\��]\�%�OH��G\"\r���\�\n#\�\���\'\�v\�;\�\rB9�F��j勠	�G\�\�(\��(\��7\�m\�R�\"�\0@��x\�A�\0D�i�\�k��W\�C��ɲ>\�p�;��\�=	e]ܥWx�)�\� K�\�\�6-\�E�F��\0�%�q�Ļ\�.\�R�qr�Z�/t����ٕQ/�+sP\�0�� d�>#^�Ԫ���8��;\�\�!�S*�[\�N)\�scK�\�M�nn)dYG{�2\�\�\�q�x\��w��E\�\�r��D�\�:�\�4{�z0\�y�\�\�n!v3\0N3�\�W�g5SA\\\�\n�\�n\�\�\'����\��dU�>���:�˯LJ\rV��M�;�\�	r�\��\� ��n%�/�uR|B.Vj�\0F�)+\�\np��@?�[��\�r\�^fI�J\�\�ͅ\�P\�\��/j�z�S\�Yɖ�\��`Sp\�:\r.�;M\�!Hjn@\ra�P�퍛��w�%q��g\n0F^*\�\�VѢ>�\nM\�\n�F\�\0!�¡�%\��N�s)�=*Tc+��(�!�Mkq\�\�[b\�B9l;�\�xpJ�����y��J�S{OY�LkurI�\�ڞmj>\'r�H=`��#��Fh\"ve.p2��\���\�fe	mn,�S\��%�h\�7�#�\��\�\�\�҅���;|\�\��\�y�u+Y&kDG2\�0*X�=��$\����Jn�Z\�0�~O\�;eN\�k�v�\n[A\�ɸ�\�?\�k�xG\r\���M�\�B�8Ļ�\�\Z\�#\�a\�6�\ZG@<�5�h�)`AF�̧,zj-1B\�^e�g^H�2�\�3������4_�\�^L\�\�3\�s.}���\�\�\�XA��G\��=!V�ñ����\�9<JL/��;�۴\��\n9n^C�[��\�\�\ZK����UcPm�(\�o,e8�e|2�C��\��rXh�˪G\�~O@\�DW�$O��Zvv�K\�\�+5��\�?��1\�z\�q�7ħ���}n_���\�i��k�\���alč&\�(�g�\�0��K�\\b\��nk\�J��d��C�h�w�QDx����\�ۮ\�2�#��0F�b���݋�\�;%r�f�\������pe+|Ex1ᘫ�\�\�ǘ\�\�,\'o��L��\nh{�ʂ\"�YLE�:�\�}�\�b/�B0\�^J�F\�\�X�\��3t=\�;Ey�\�BUBmi��Epa;��C�\�S�@\�֦��!i��*\�R���ާl\�tcP\�]�+,۠-��� ���r|���\�/z\�\���\�_t³a��26�\�\���B��J�똅��\�l:�\��X4�\�\�\�y\�-\�|�\�e��4\�Ƃ\'�\�hT���\�\"�\�6�f��m�R�W�Whb\�\n���\�%6������=\rY\�8�BV׼\�%\0v{\�\�\���\0%cG���\�v�|�R/\�iP���K1��b��$9�K<ʽtP~�A���\�;�\�\���|!Sdu��\�o6\�}V�E\�\�\�͙\�\�K���[�,�!++1\Za؋�k�\�`UG���ϲ��d���\�OF!�2��\"Z��-\�\Z�B>\�\�ܶ�;�o/IJ�~b�&oPc�)�/8�K�\�J`9���c\�\�7܏c ���?��i��N[���\�5\��\�0D��~!�TB6T\��B٢J\�\�OR(�f-.#�}@��L\�F\0I�I�nD�\�\"ԦEJ\�}�\��@�O՗P\�\�=fnV\�\�~\�-\nez\"X\�O�V���̬\�^��\��\�h?0i�\�1�t٦{\r����O:�c��nd|C\�\�\�Ɂ{�\����\�u\�b{��\Z\�{0E�\�\��Sp��\�)[.!w�\��0v�yҮ\�\��\0\�X\"`��J��;\��\����c��\��\"�ts��%\"\�s\�R7GsR\�|\�R_)p̷ZCP��1��\�(	\�\�nIS\�\rGm(!\�t�����u\�(�Kɜ&�=\��衴�LE�\�F��L3��\�}�ߟ�+@>�Q��&�\�\�\�H\�\�Qm˼c!|ʘ}`\n\�҈�2\�����<\�[ن��\ZI\��<\0���\�򃙉��	�f�\�Xn\n�JS�1M�C��|#\�t\�C\� T`�r�M\�^QN-�2�Hwn..\�GA��ys.���h>!��P�H+pq1\�Й�\�\0�\�)\�T�n=b\�k\�@2-{&�\0�\��\�Y#m6e\�E\����\�\�f+ݕ���� �Lv#��u\�׫s�\�\n*����5s��\���iXQ\��Y\�j,\"n;�\�l�,��\�e���D�_r��	\�;�5�:Ts8t��pD\�r��H��A���\�\�ecu^IH\�\Z��=���K>���UXM��O�\��\�^pz���K/��k\�ɨ\�\"�s2�GW*\"��Q˚W\�.�a��\�۱�\�E�\�C��\";�dL�1\�_\��q9�%\�NѢ�&0�B\�\�De\�SOL~�\�\n]<B�!�\�cW	�R\��I\��0͇b&�|Ě}���\�flW\�0�N\�\�\�_yy�Kl\�ir\�~�6D<�mX��S\��l2��\�u1-.��\�C���\�2���K�^&\��O8�-T�����\�K��Y��y}f\\��rz\\S�`�F��v\\1\���q�\"�\�\\�\�\'gd��\�e�\��/K\�\�\�t!\�~����YZb\�&��ݸ�v�s,U\"��XT�m\�̴40� \�be\��qq-\"y�\�O�7�\ZŇ1w��C\�q\r��\�Mp|�9]�\0\�_�|b\�O��q�beO����\r�k�ga{ �\�sOhJ�T���V�\��\�\��\rB���\�?M�Xf`\���C\�(@������qQ�\�f�<�nU\�	\0˰��G�\�_ۘ\��\0\�\��\��\�\���9�mU�n\Z�0~\�_��ү\�p��\��\�Oڥ\��&��Ҋ��g1|��\r5O\�@\�;?d�_i?hO\�\'wD?�/��\�0\�\�E\��\"_����dq��[p[~g*Z�\�\��\�\�g\�g\�b\���\�п��z�>�~�y�\�~�\0����\�\��\0y�\�~���\�Z�[���KN\�6�\�~XZ���%�i��3��bY\�\�4�K0\�\�1=\�~\�\�<�-������\�\�|�\�S\��C��eKv-�\�\�)\���<\�\���\0O3\��<\���qUя\�?�\Z��\0\�x�)�\�n�W�\�\���>?G��?\�?O�C��\���\�?o�@��=e,\��\�r�?n`\\o3\n�ۙ#�zŁR�)H�{�cXxˎz\\�A\�;�\�\\k3e3z�-���Oy\�QIn�E]˚*P��\�*\�\�{��TpbZ�K\�0\�h�(�*�B��W��-e�\r>��f\��Za��S�\��\'4E�tf�\n]F��g\�0F؞e	\��y\�{�����\�^\"4t\\�l�50\�{M\"��m\�n_\nϠ\�\�\�i�\�\�n_\��Q\��A~��p\�I�[_X�S�&�}%��lcԗ\��\0��q\�4��8;J	�ȅ\�vŅ��-5�����q��L\�<ĕR�/\�Z�tV\�y\�.�<Lcg�,Q�H�j,\�\�F{�bVY,%�s\�\�\�\n�x�S�@�7�\� �\0+���3���(W�\�a\n;��(�L\\\�r\�Pt\�[o�i[\�?�n �j�e<\�s3\�)\�S5�\�\�\�7.^��5\\N7-.�,2K��A\��)q^q\�f��/�9i�\�)x��(X\�Xw&\�\�\��g.������jb�\�-f\��h�\�K+Q\�]\��\�`��?ɤ\�q�\�~\�#n\'@\�=\�_�7�\�F_���H^�7\�e<K	虖\�\�G\�\�з�TVZB��f[(�,�TM\�5R\�uQ���c���mϊ.\�E�Wl��\��\�\�\��\�+\�\�\�Э�s\\�/1f^�-\�J7\�ߥ�\r\�u*��j(9%ޥ\�3�\"\�EJ�N\����8j8^�Q%\�-]7.��m\"F���\��0u!\�VP\���+�ʞ�唕�VJj}\�w���$D�X\�V54\�\�,��#:�\�fp��!)F\�y�\�M���@4c��o��h�я�\�haG�XV=��]\�99�r���39�U�xy&EM�\�\�oĬ\�ˡ��\�\�\�L\��k)l�?\�\���\0�\���BU\�@\Z1N\"a&�M�31*w*\�)\�	R�a*:\������ƻ\�JT\�D~�\�7�3ti\�z��	w\�K<td�����\���\0��n_0\\\�?O3�\\;���׫䂌��TA��\�`��<Qs	4\�)b��)�X\�]\�Lr�opm�٩c5*���]\�\Z�\��\0��~�ݧĮ���M:\�`\�5\\̃\��\�*ȷU\nO\�^�Gdƾ_\�\r]�&��Vk1R`�!\�\�g�3�\�\�f!)l\�/��(8\�{�\0\����G,L#�v8\"k\�U�\�\��&\�\�/�1\�/�WW*��a��\�!l\�!�\�X/\�!�߂0/�Y��80��527(4\�V��?\�F\�\�\�=�\0ţ\�\�pW\�l��\�\�rn=q4�*WF���!l֟��}|C!\�C]8N^���\�E\��\��\�\�{M<M\'lCY�Y��MM\�Y\�Q�1@r$�p�#�\�7\�U{\Z�-q\�`Q\�\�\'l&\���\nC\�\�ELׇ�cY�C�=�E�\�^�\�j�_0=�ݸBǹ�����K�us&\�\�Զ��B\�{B\�\�*\��|\�9�}cq\�PM\�`\�X\�@\�Fԑ�#\�X�t9%y�\�\�ќ���\�ј\�\Z�3\�n\\[\��\��0+�\�:��\�GPf-X��1Ikqeo`7���6km�\��H�\�b-x���\�OH�k,�\�ؿ\�-\0h\�\r��|Lw(��\��\�\rG\�Ki�F�\�|\�.ە\�\�(u��W�N`\�\�\�BD�\�b�M��2ب,g0LVe*��\�f�\�r�{ \Z\n�M}m�Z� �!M\�Mo\���Fџ��-\�ȍ�UQ ��Ƌ \�VD����awz�s���)�\�:�\�A\�\�\�Z�G7\�Y�T,\Z{Ɲ�\�RZs\�\�cso\���Ѫ-u��%ATnܫ\�\r\�U<G�P�Rf�����g�YAϻ�*$\�#�\�\�\�P�l�\�^*\�\�i��,\�|�d�X\�l\�YL�\�\�+_K�C�g/�\�7�Y�1%*]�!�U*Cd1\�-\�1����\�\��C�\�,9�m8Lw�%@\�+\�16\�i���?2\���qm��\�vS��M\�J(��5�P\�6���\�i\�p\�P�qPM\�~`xT_��\� Wx��\�\�\�1y\�\�@���\0MLt�iR\�\���f\�RV\�$AOcP4Q�p�\��\�d5�N\�\Z![Cߘ��pgb\�Kz�\�\�OGS�\�y~BS�[�\�\����L S�*ܠ�\�z�IWx�W+he��ngc\�dVpFk9�?�[*#���1K\�Qu\�.o�mp(\�} �n�\0P�\�\�\�^�\�*5��0E\r$�r_�:�S�%�\�JT�\�\�+��3�\�\�\�z���\�\�4A�\�F��/U��\0\��)4�ja��#�X�\�\�\���w�C\���[���3\�<\�|\�����Ǣz\'ng�{��z�\�yB\�\�F[/ܗ毷�s@�\�\�\�\�\�\�t\\�\��\�\��i\��/n&\��=[~���\�+�{Ls�ͯh����ī�\��\�W�<S\"�~I��g\\��`��\�j4\�\�k_uFa\�_Od�I�x��0\�+�@�\�t�\��v\�\�6 a/!�3�iJP\��\�e�ʟ\���\�y�[�����)\�U�\�=\�\�ԁ\����&jff7\�`���\�{����쐈T�ų2\�̯Q\�%89w�`9�\��f�\����\�1�MM�ņ){�w�\�C�}����;����һ\�_y~���\��\�;e����>\�\��\����}\Z\�O��m�\�Z�AOįh��\�\�\�\�Ys\���Q�	V�,\�\�<�̷�wp����%\0���\�c��\'b ]^\�\�l���X>0�\�7ؿX\�0\�\�[�;��iW*\�\�X��\�\�R���\�S�Ϝ.M��Fj��$�\'܀���wЈؤ*7��M�2\�Iea\�h\'ygyJ\�>)\�S\�~\�Ҋ-`�\�-\�a�\�\�-\�\"n�5&��tt�\��u3^�b=\r=]7z\�m\�E\�R��AT[c��D\��P\ZX\��UD�5�����gr�کf~Dp ��}\�\\�w��(=��-��IG��rL.-���D�\�j\"JT^v��\�sS&�ު>\�Qf^?��#ۦ����&{G���c��=\�zZL\�wM�c:\�8��\�F�Y\�:�3~�զ�k\�I�AL����\\\Z99�\\*\�\�\�˂��jg����\��\0.�|A|\�\�x�U6\�\�/!�[0\�\�m��\�=\�\�\�a��\�x�J����|Jj\�\�_\�|�Ue\�ɗ=����aM:\�2\��釄ǯJ\��Qp*\�\�a�bbs5*Ӊ��\0>�Juҡ\��n��W1�R5\�S�?X\��Bv~\�%+��~�\�2��A\��b�\�5,\�j�8�%\r\�\�\\���(\�#��۫��\�db\�}\�f��\�vJ\�a5\�Q^c\\\��X�Z\�\�N\��L͕\�\�4m\�^�\�.;	�5�\�,�\�{C\�W�51G	G|\�5�\�+Z\�\�M\�qJ\�<�a�E��\�k�\�c#�r�X�\�y�Sー��\�>��\0\�ƺ7\�\�f�gJ˨�..�m�\�\�w��Aϰ#d�摪��bM�\�\�\�c�Xn\�x���[�]Ȗ\�GGg�Ӕ/�3�>-J��������ښA�T\Zhx�\�>e*8␺P�Y�cWGyf����ˆN#kΓ:�\�V�Z<ʎ\�\0\��C�\�\�\�$ \�>e\�\��Q#�-ķ��3\��\��\�}Ҙ\�=Z�:g\�`P>\�r��FU���!T\�(��\�E�K�\�YX��\��\�쉼\�\�vv��&��tt/if�aT*\�Z�\0l����D��t{K����,��\�\�9�_<�)T+(����LjF_h\Zd�����u�ER�!\��򣤗\�&��\�����\�@K<\�pЕ\�\�_�2�<\��ũU�TYx\�\�hh��\�\�0߰8�W�\0\'���L\�2\�xO1��\�y\����\�j<>��\�e�\�\�\�}�W����\�\�P\�rbY]���\0A���\�16�x�\r�F\0-=\�k����\�7�>G�\�4�v\�\0�\'�؏���q��aL<E��U�zM����lv��p�N�\r�\�s\����\0\�ݡA��R\�\�!q�ܠ�(#�{\�\r\��\�cO��6�� N=�ဗW�W-S\�[\��\�\n��b;��[y匕mw3\�uI~l���N�ޠ]\�Xp\"�`b\��\0C��\rK;\�0m�p��*)��9�f\�X�	0�C-��\�h�\�\nVؠ\�Ԡ�J7mj\��\�y��o\Z>�[|Ɓ��T)���\�]Y�G/�K�.\�7�\�\��\�\�#R\�\�U��J[A�`GP\�0\�Q�(�q_�h{\�bt;&ERE/�j�p�\08b.\�^k��)\�p)�\�Y&D�\�\0�\��\���T�]L<�K����V\�FV�T��\�h_�\n<̐Y\�/C41�\0��\�\�\�P�W\�sy�m������\n�ܳ\�\�^�y�aE{bj�dj�P���s-K�\Z�p#�Z;���q^�\�Q]\�`\0�\0�?\����\�fCcS�D\�\�x9�\�\��EMN\� @��\�w��IP37N?�\�pnTلA\�0�Z�x��\�Z�\�\�\���_��!\�\�\�wl9֞e\ZS\�\�7�� ��\�;c�\�Wf\�2\�Vi��\�\\\�3/R*ի�p~�A����ǙW��\��\�Bն�\��\'ena\n�Oh9U\�Kѹn9�7C���g8�n�\�����l�+���r\�$��\\i\�\�Q\��j_7Co�\0R\�\��\0�i�A\�qf0!Na�\�z\��\0&��Ip�<\�u\�\�\�\�K��b��\�]	_�C�\�5���L�S����\�^��Jc�(�U�dF1���\�\r�ؾ\�R\�h~\�ִ\�.c\�\��\�с\�L\'t\�4/\�\"է\��\�ݠ\n\�\�\�)n�{�t���\�EMKf�H7\�\�Rp�\�E\�D\r	ذ\�$,��\r%n����=O��\�^H\�\�t`��Ѽ8IX���W\�T1\�\��T\�؜\nT�\��g^��=~!�/�Am\�$1m�J\�1\�FK\'2dzce\��&\�\�0�t����\0R���\�0�\��\�&*\��B��\�8�Ii7}F��\�t͆eP�\�㴡&l�Z�L7��;4b(U8�� 4��\�\"��(�\�\"�s�ʠbax�\��\��}ѿ\�L�}�u,���\��A\��\�?ɮ�\"�����w8�B�1_D\�\Z�x��E\��\�x��\0J\�O\�Y\�\���\�\�n\�\��\���*\0�q̾$�z\\�_Y\�>��\�)���\�̠�q\�4&P��\� \�\�\�^=�Rm�\�o\�\�3�\�Q\ZK���\�*HVGR��ӳ�\�X��*\rS�v\�\�w{��\��\�\�\�()����bw0��\�_�Y�S%u]�9���D\�\��W�\�bd��\��3%l�z�E�2��\�Q\'(ˍ\�W����*\�\�m3|\�{\�\�_닗G�\0p) ��sX\�\����\0�b\�\�evP\�l�p.`\�8��c}z����;֐���\�t�։Az��\0U]h|EiG�bB\�\�S	֡\\\�\�-7\r#&#삜�),%�\�K\�d*ˈA\�͐\�+�\�<�K��3۴[	���6�J�J��s,��h�\�\�L��HƷG�|*\�.QB\�\�#DJ�\�T�ͣ\�+�D���l�32�3\n�\�u\�ۋF�u���\�\�\��\�.j\�\�OO���\�*-)\�\�^`jnAM�F&z\�Ȑ�I\�~Ɏ�4\�*\�y�Y�����}e>{�;\�x�s�\�n;ږY�)fV�\����\�\�(U]�\�}\'�)K���rX8\�x�ϳO�+h\�	�w\�QII�\�0\�\�`]�r\�Uw\�d�]S��\0\�$�\'/=�}\�^��)�n�e-\��!3U�\�\�<��\�\�\�U*����]s\�Q\nP\�U�\�h�\�\rr�%P(\\Vx��d��\�\�\����\�m����ی_?�\\\�\��\034�WX�Cm��2\��af�}<\��;�h\�\�@d�<�,��\�_,\�o{>\��\�\r\��\�[≙�i+˖%\�Qݬ\�n\�7�\�c�\�n���6\�MvM\�D\�ݲ|�AB^�\�N9�\�\���iZ\�\n<�	u =\'i�;\�\�m�!�Ub\�Ӂ���L���\�JR�累�P\"=�ND\�Qї�I\�j�Hv\�ɘ\�\�l%\n�\�2�8׋����n	�]?\�\�\�G.\�\�b/Q��\�{Tqq\Z�B�\0\�=\�լ�gE\�癌\�0ı[��Z\�\�\�_��!{��\�\�6\�\"�ƿ3q�_\�!\�T4KUS�P&�>%=�\���m���n\�a\�u\�\\\�ݮ7�?�Ò�\�Wwi�\n�@S�\�`�Ja�i+vV�z#]�vxe\rq�(3\�\\f{L\�\�mZ�+���\������\�\�\'��\0b:���\Zm\�\���`��\0^�~_�YO\�������\���g\��R\�\"m���Ծ��0��\�j1\�p��\�bX�[QWh\�b\"\�~e�n\'��-f �\�j�d1��\�P+\�E�O\�(��E_�\�_�|߈�?�V�A��E\�\�\�TD\�\�\\ \r_\�\\�5J\�\ZO\�\�z��w���	6?��\�\�W�\��\0�\"�|\�!_(\��\�\�1\�ҧ/߬5\��y�\����S\�(\�̚��=\�a\�<��)M\���f�}\�\�\�&�\���\�>��\��&\�̥\���&�y�K�}���\0w�U�?���_h1\�!��-\�(t\�\�c7\�HuՍ���;�\���\�\�;�چ�D���\0����a�\�ê�Q�Y�\\m�6%@0Tt\�9\�vdsAp^\�w�E�\n�&ON�\�\"#L\�\�\"\�1.\�V\�n6bXF� L\���\'	y�K�\�qũ\�]*\�mD�\�*+\�\�b!4\�0�*̢�-\�T�^\��0L�\�\Z�.�@\��\�i\�ϗ\�!�MK\����r�q{E6�\�\�71�Ÿ�tw�8*\�\��-\�\�	̪t�\�0a\��-F%�Sȩ^�#}0���\�ɮ�.8�;B��p�M%:�S��ݱ\�TTn����H�4]�`��PE\�Z\�\�O+\�W�\��\�2cI�f/�|��\�B��\"ZR\��\\�=B\�u]̭Žޮ	5\�\�\�)\ZfJS�\Zt\�3\�\Z�\�\\O\�V\�,�5P��#\�T�.&\�ۮ_37S\�8��2����\����Ӕk�\�GKR�GE�TS\0\�\�Y,L\�2!sgp\�\r�A\�\�2���eWP�Y֖!�e\�ؾ�أ+F�R�/��\�f62�o�A�������j��-%��\�\�\�]j�\�܆��)i�\�9<ùh\��\�\�հ�\�(�zB�2d��>�\�r\�\�\�ь�\�DM�̸4v�1�\�\�\�U@�{G/�\�<)�T@��R\�Fe�\�׈�i�b1\�\Z�`�7c�B\��Ѓ�rP;0��a<Dq���SL\�؍�K\�J\��qXY�tc[��^ ��ƹ\�̹�|�j���w\�\�g��\��l�\�\�\�\�$U7c\�r�Jf��{\�\�PB\�C�[����ҬKK��\�sߢ\��\��\"͡,&�MÓ�&\�E^\�[4\�+ݗ��\�X\�$]�tP%�K&LubdJ�1>`К�W��g�\��eJDE\Z\�}\�\�B\�a\�\Zb�}\�\�\�C)̢5]�d\�$\�\��\�r����ס\�p$Jq��Y�u\����\����jk\�\Z\�R�gP\�j\�\�\�%\�\�\�X�r�R�\�cR�)�Q�������I\��\�Z��\�g\�y�l��\�m�qW(�:���H��\�Fbd�\�\�NS �\�b\\�\�	\�y!�\Z\\H\�$\��\��H�w����\�EEP��\� �X�\�W�\�a�9�h\�=\�\�I�X�Z\�ﰛ\��\����A��\�3�ñ�X���7�\�d\�	W��(��(\���5&���E�\0xA�\�\�Z\�\��\�9�b\\Q+�#E�\�\ZjT\�@�Y���5\n��\�FT\�/ݔiKԱ\�µ=��\�[/�\� L�ZL�!3\rA�)}3�1.\�\���\�U\r\�;\�\0^�U	J�TD:���E�\\Lp�\�\�\�c\�\�<\�l����]\�@%̣�sQ��g�0k꿤\�\�+sF�3�\��z�b\Z\�\�\�H�\'I�֜�cm;ʎ��]F�\Z\�Ĩ��\�:��Ct\'{F}w3f\\\�\�472Qv(e\�\�E\�\�y��\�qc\�\�L\�d\�,L!\�\�Ӄ\�)ԦB\�2/h���p\�b�Y�\rz\r��+���\��0jb�Pt王.\��\�+/A\�E�>��\0���\�[�\0ԶH�Q;�E��Q\�\�a��y�.\"�\�˲0�Ae���)X�6(i�\�7�r�3�zd���\�sJ�%�\�+=-i\Z\�=9��I�\��I�<0|\�^:7q���јZ��\rfXEL\�fw�Z��n1�Rh%�\�8�2\�Ň�A�,H\�х�\�G�\'9��fG�\�\��\�\�\�@G\�fb4�\�ŖNa8J�A�\�%Y�q���b=\�P	I�ќt�3\\zs\�ӡ�V(�E�f\�W\�o�\�\Z®��EMB\�����s�P\��+W�GR\�-r\�\�\\�\07�r�z���\�F(e\�*\'��f�e�\�\�Dў4n�y�\�yj?��\�O�Ȱ\�z��aW����u<�*�3(=����N�2�v����`>3��:\r�\�HC_?HM@\�%}\Z\�\�\�-l�d�\0��C3�8�@K\��d�\�f.\��L*8Nf.a�\�_äE�q\ni����\�Y�`��\�e0=���\�O�\���z6(0P\�(\�\�\�b\Z̩Px�\�}!j�b�uNq\�	\�eU�\�s�\�z�\�q\�\�0}	\��3sku\�l�=D#)�Ĩrb\��\��W\�r枆\�\�:�\���@���0Y�R!�$R�j���m+\0�j�\�l��!\�\�W2�D͍�-{\�\�\r\�\��(h|��/E0�\��\0�\�Q����\�C=RV%E0LZ~`jV\0\�\�ꨖY�avf�	�E�&㎕	2d�\�\�?,\Z�\�+ܔ����ߘ\n5;(���\�\�bV�}!\�㎗�*!\n���1�\r��\�@\�m5u#ԕ8M&��Ki1	P\�\�l�\� �\0\��\��\0� \��L�\�	K���s�tXP. �L�h�v��\�X\�D\�F16�k��3w\�\rs�ݢ&`�B\�\0�E���g���	�\���J�*Tz.��R��k��|P�\�d~%p�\��\�\0fffҢ�!�ɤ���ʮ�7��\��\�Q1�:(���g>��G}\�a\�R2.[��\0$\�\�\\!�)t\�\�\�\�\��\�`�\�(�\�T\�\�J�HŶ1K���r�b�>�\�<0(\�\�\Z\�Rɂ.7�1\�J�k\���\� $@��s\���\�X���!�nU\��\0�1xPB-/kI�\��\��zV\�Db\\��3\�+\�T�@\�\r\����q\�\�ý\�i5!\�\��\�M:.\�\�>q����\�X1e����ɮψIT\�	j,\�\�t\�\�%!x\\���&\��\�M�q\�\�S;A��t\Z�4ș�,N\�\\�3\0��&�\nA�]�-t\�NIF�\��Nb����f��	G\�c*Tۮf\'��\�\�N\�D\�@������!�u�\�IfX�\\\rLS)V���\�6�!F{%�r��S\�\0\�#1\��A��g�\�\�h̽\����\��w���\�0\�*Cnz@\���ȁ9�� \�zUDə�\�\�˗��Ԧ8�s*�8��\�6\0L\�WQ��=]í���.��\�\0�kO�3�\�\�3A^r�5���g�%��\�,!�\�7\�Vq\�{\�}Yl�_|\�:o�����fe�⸦\r\�1ST\"�W.\�V.e���G(�^,�C+wa�S�f�_\�yf`<��\�r*3����\�#.,\�\�\�[6\���\�Z�g\�n�]0\�,\�M\��̧�-�Q*Y�G7y��\�h第�Ј0qU\�XvT�+S=��\"$a	�\�\�\Z\"Y��z\�I\�Γ*��\�#\�O:\�.�s\�\n�\�$����\n`�0d:X\"�C`G$qs\�\���;\�\�L��\�\�Ͼ˜��\�>���e�G=\�eC�\0\�Ӓ,�\��\�Y\�����\�\n y\\\r��uVM\�\�N\�1�\Z\"<\�/\'0\�D2�~�w��*Tӡa]U�\�\�4\�E�\��(��9\r\�\�\�@\��\�?36(�KS�C��\�8Ԡ�ߋ`��Z�o�y��u]\��.\"Կ+1P	�2%\�o�\�}�4�~&����?��]&�k�\���\�Q�\Z��oq\�s�J�#2q��E\�t\�R\�X��:zK�\�\�\�̣̍\�$�x$sOo8�z\���\�\�L\�ҦnnAb\�*��/2\��\'y�b=J�q�\�S�h�̈,T5�f\�9��\\�0\�-���TR\�r�\��P�\�\�tbY[n�\�}\ZT���i�Ų�-d[\�kr��\0�v^\�\n�x�sz%e�E\�}��x�[��=:�ۮb�.\�+�\�9��+�h\�1�sQ�X͠��\�\rJ\�x��T����h�����9�]��[C��\�\\����f\n\�\�\�H�6\����$%CI\���&n\"\�\0�\�\�\�\�\�؎�&�r�/�\�1���A�ԑj;�N90\�\0�\�NK�\'�E\�X�\�\��;�`�\\\���˻J�pa3�(#=!\�\��ǅ=�ZpB#�J\�\�\�8�L\�\�ɳ�K�3D�s3膛��`\�#\�Q�˺� /�\�\�\�h�8�o\�\�\�^\�\0�UxB�E2�\�Θ\�!\�HT\�\�[;�d�ܘ�f���0C�!�i\�b\�qc\�\�\�W\�͑^�\n��\�\�\�d�Q�\�\�%\� upw���#\�\�z�\��(��]㉧\�\�Q(�L\��\n)���7yr�]\�<�iz7�\�Z�\�w\"1�gi��@_B��5\�:\�A�\�\�1C\� �wӘ�\\�\r\�L�QJ��G\�8\�v��L\�\��58�tz;\��T]i\�\�\�I�\�>�>e���\�S-�z�_\�N8\Z\"�L\�=�M�\�ʙ�.\�\��#\�\�$Fx�h\���_��\�^�\�\�\�N>Ss7�\�\�-\�\�~�v\�gʛ\"\�\�1�\Z\�+\�l��!lw\�\n\�uY}\Z�-����\�J�\�D���\�\�-\��k�S��d�\�l&\�8��F*�\�t�tf���\��?h��\�\�\�+5*�[V�*:`hn?7�\�·�\�G�B����#\�\'= ������\�=vD�C=رe�+A��Ȭ�o쟈IT�r���&U�y��2\�B9�nWC���ʆ�0ԛ����\�u�2\Z��Y��Fx\�DXe��\�ʕҺ7�1S��z�Or��\�1\�o,�.aє$b<\�\���\�\nӜ���d�,Q�\�o\�ԇ\�J$ma��\�ЍM\�ArZD�\\_�\�\�\�e셪��͝A\�\��7/��.8\��\�Vb�ap\�:n	qSñ+Q�55dR;�8��c�m�8o�����\�1WV\�Pq/�S�fWB!\�\r�\�\�e�C�peX\�{����\"�\�c6�CŖd�\�J}b\��=X�3��!G��`\�ذ]\�@\�˯�t\�a�龞�[d�_�@\�WQ�\�lO3qhc�31�jT\�+0�Y��_G\�`EjǧS�u����}\�q�L\�\�$CǨ\�2�(1�q.M\��F��o+5u��B�8�\�c�\�M!��.#��r�f�\�v�\�h\�KW�ϴ^�\��X��\�,�\�	c]������\�ç�?EEw� s38]u:?H�GB9�t\�\�\�K8�\�R*0ܦf���\�sяџS=z��ͪ.Ҡ�k�N�\���!�\n���r�@��)�����3\�\��]y.�D�\ni��\�ihf\�\�#�\�E\�=����\�e\�0�	��lb�#6%�G\�\�%�xՏ\�\���=g\��\0I\�~�g��y�m�y���\'��y���\'��y�s�=f\r?O3��<\��\�q�\�\������O3X_1\�\���鿸��\0���\�\�{o\�\�\�G\�\�=�\�\�~\����������?\�\�x���\���\�?C\�	�\�\�?W�O\���\��<\�\��\���\0��o0��W�%?n���\0���\�\0?G\�\\\�\�c��?I�\0ag\�\�~�����\����o��\� ?~e\n�g�\0H�\��\��\��\�\�\�s���\�\�?w�G�\�k�\�\�����\�\��\0y�\�s��\�cS�\�~\�����\��\�Q\�\���_\�~\���\��\0�~�����g\��\0I�\�~���\���?\�~��n�\0FS\��9��\0�\�>^����?W�Eo\�\\^f�ߧyg4�;\�oӼ\��~�\0�\0\r\'Q�\�9�\0B�T9�\�\�\�N�u\�l�\�q��\��\0�۽\�QG\�0G�r��\�~&[���e<M�J��£C���\��u�&�xR��;����\��\� \�5�\�\�/�?y��`y��\��]�k1v�����\�?\�ۧ�\�\��\�qD��\�]�LHd��\0f\�g-0��\�g賿LY\�wzZ\���\�g�*D\�u���~\�\0+|�\�hy\�S\�n��\�ͪ��8?[\�\�`)c\r\\\n�\nc�\�՝Q\�.�\�6�be\��\�\\�\�;B\��wV\�\Z6=��n\\\�X�@\�\rm�\\y�	\����;���\�\Z\�\�ӵ\�UTXP8\�r]\�J��ЀЕ\��a\��\0�\�Uד{��v��S�\�M�>\�\�#J\"z\�\�GBU�\"<�1X4�mL��\�e�d�C�\0\�\�#�\�9\�(�a��s\Z�O\�<�`\�*{�j4��%#\'\�D��IF\��\�X\��\0�\�D�\�{�m�\�Qx��V��HX\�R\�3ۭ\�J�өh�\�\�\��\0ɪl~�\�\�z�wLĠ\���a���5�G�\0��\�\0\0\0\0\0�\�<�\�<�O0\�4�\�<\�\�0�\r<\�M4\�N0�M0Ì4�\r<�\�<�4�\0I\0�H\�\��(CE�O��\0S�P�0�\�<�\�<�\�<p\�0\��\�0\�,�\��\��\�r\��\�(2\�<�\�<�\�ҍ��\�4#�8BGa\n��(r��\�<�\�<�\��\��\�<q\�3\�<r\�q\��\�<3\�,�\�,�\�<���( �<B	\"�8��\�\r�,�\�l�#�\� ��\0�\0�\0�\�\�p��\�c��Y0@H@�r?\�J9p#�\0\��\0\�m\�\�<Q�e&\��룢s\\\��\�n4$\�\�9�B3#�SCL��!#��WdV\�\�Z\�\��\�!�\0\�<R?\�o��s�<�A(0G6;/��S}�+�B\�Gr\�\�\�1�\�M\�@3\����\�x���\�a�(����*\nI��&\�\0ھ�	<�K\�.\�źu�g7c�\�\�Eh.�/�l)��\rf\�3\�m�\�9\�ژ��w��\���G\\\�Հwj\�gS\�x\"=vd9��|��g����P�s\Z*!��\�KA}�|���xi�[`$���뮅 �������\Z\���\Z)�qޑ�$�^\�%O��\0\�Ҙ3%��3s�M�\"`\0\�\�w�����\�\�\�\�y���d�M�l��7�E��@N��\0\0!�\"\0����z\��\�	��ZwKy���su�!C\�|$�|B�.q\�\�)c�.���X�\�J<�U�����ɳ$\�\�0\'�\�\0H��� �\��\�\�ڱ\��|�\�Y\Z�\�x�}dn\��\�\�8 \0\�\rR\�c;\0LW?\�\0b\�(1\� Y��O8r\� �st�`^��<�_t9�i\�\�&\�y�ѵ[]t\�B\��&c?��=��N7O4��\�N�\�@�]\�\�\�{}\"\���-6נ_=Ex�Rس&(Vè�ް�\�F\�/��I,M�i�9c~N�##�Z[�\�ܥ�B:ҷ\�b֩s,�3�\���wYl\�\�\�\�I7Bim!z��OK*3gΒ34�\ZȎ^�j\0I\��(s\�<��\'\�hB�w��\'2\�\�\�?��)\"�W��\��$h\�\�o<�\�<\�{il���1�\n\����\�\�z��\��\�<W��\�<�\�7\�-�Wܬ��J��Gs���[�(>ʃ\�\�:\�O<�\�<n�\�\�b��ѰS{Y8��\�%�b4g��A\��Y/\0�\�<�\�97�,婏5^�\�d8�:�m\�n\�\�ȿ\��Tr��\�<�\�<\�\�M�W*�d\�\�*%�eL\�G\�\�\�:H#צ�|�\�<�\�A}��G�\�b\�\�:\�\�\�݂ٔ,\�_:��u�\�/N,\n\�]<�\�<d\�e\�;\�\rN\�\�:0_u�\�IP+�[T�fcS\\\�G\�<�\�ZSk�}\�j����wú�݀�E�\�aS\�T���\�<ȓ��4Zs\�	���2�\�{\�\�\�A�M\�V|D\���\�\�\�u\�|~ܖ�\0��x�\�v޽G��\�*P֋�\�Td\�t\�\Z�pJ��{�d,\�9�͏Cvȣ����rG\���v�M�\0�\�\���\\n�\�\���ߣ\�Z\�\�cj���0\�\�ZHmdR�݇{\rH������5����\\\�R_~\�N0\�+#{bun�NQV\�J\��C\r��8	K-�ͭ|u��]}\�B1�7�=T}W[ጥ�L�C�A\��z��]��\�-�j\�\�\�p\�[�\��\�q�p<�qD�ݼ-o��\�f�8/\���F\�Z�\�\�1p�wthR0\�\�\�I&�3K\�{\�O�\�kRn4i3B=�\�89\�c d��DS5W9a_EٗH4F9Z]e5�@�LaL��\0�?��\n<R]�.����4��W��� �(\�\�&i\n<|�\"���\�\�ǈ�{�\�\�X V\��\�\�.�\�\0\��^а&bՌ\�\��;5/w\�Z1Ҁ�0@	�|G\�\�@�\�q�\�]jc����\�A�Bb�� \�\�\�0��}\����\0��x�\�\�\�C�G�\�;�\� �a��K�wB�UTk\�v��\��\0z\�\�m���xAh\'�\\R�T\Z��+X9ͅ�@�T�hU1O\��\�#\�j�]O724���T���SC�$_\�͏*�;լ�<�7\�\�\�\�\�h\��2\Z���ؑ\�\��A\�<yfJΰ�\Z�S\�֥NH�إ��$R&��/|V����\����\�p\��\�,�s\�\�\�I\�p?�7\�!J8�\�\�[�<�\�<�\�<�\�<�\�<�\�\�4�\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�<�$�pB�\���\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�-����<�\�,q\�<�\�<�\�<�\�<�\�<�\�<�\�<�\�<�\��G<�\�\0\�\�<�\�<�\�<�\�<�\�<�\�<�\��\�\0&\0\0\0\0\0\0\0!1AQ 0aq@P��p�\��\�\0?�\0\����_\��\0��\��/���I\�\�#O���_\�ՙ\nĹo\�6\�@_\�\02\�\�?�\0\�_N\��\Zq�\�\�%\�\�\����`�e�=�9e�Ye�\�4�!��bȿR\� \��\�\�\�\�\�̞\�3�ge�e�\�\Z�#Y4��\�\'\�&\�d�����~��>H\Z{�E\��e�Ye�Ye�Ӯ\�\\\�\�4�7Gĉ\'?ȋ��\�dg�\Zy�\��\Z�%4�/\�W�iiiiiib��%���1�x\�Z�\�\��<\�\�]�;���\�8ջP��׃�M�\�\�G^\�X���X��b\�KH��}\�Q\�w��\�Ǒ\�\�\�$	:\��^μ���\�	�\�i8t\��Of4\�\�\�\�w�2\�$���\�?\\\�n��={\r\�\�\�\�\�cߋ �p0\�\�,�\�\'#$d\�m\Z\�\��`\��\��\0�q�ee�\�[m.�����\�\�m5~a\�]u�\�\�\�\�lq�\�\�$\�p\�C\�}<�j!ё\�ɧ�t޶C�De\�V\�[x\��㿫��\�#~������K���/�0N\�\�&\r�\��\����E�fxy������\"\\�}�\'�Xz�/\�\�vw\�����]�\����+�õ�ޣx\�\�ė��Z�d_^Xa֏\�\�-��\�\�	F�l>%\�l�\��\�n\�_�mx\�,�-,�ՖŐxφVd\�<]�\0#�\�\���mՓ\�\�.J�1ջe\�\�Ye�]�~Y�ޯ�\�\�K%���o\�9\�\�8\"�\��\�-6\��n\�!{y\�O_v\���\�\�:��\�cK�\�\�O\�F�\�>\�?\�\�6\� ����\�\�\�_3�3m:-A�\��|�z��N<�v\��-�\�\�,�\�mx\�\�2]��\�\�mze�\���\�\�\�\�E�;�<o\�\��\�\�>\��7�����k\�կ�_v�[_v�\�\�\��iO^r\�R>�}_\�G\�}>�}X���\��,<Yo^2\��_\�\�a�Dɞ󼈏��\�9\�r\�?_\\\�;\�s�l�	i\�:6\�\�\�\�^w�\'�o\�fF2~\��3�\�z����k��&N\�x\�m#�\�l?R\"�8O\�q�\�\�S\�	S��ˣ�|�λ����\�\�\�x\��7���\�\�S\��o\�\��\�w\0=�5�2.��\�o�����d�7��\�]�\'�b�\0V�\�Z�ſ�_V��	�\�iGV�8t�K,��\r\�8l�\�\�\�H\��\�|~�-.����i`��m�7\�;]�zB|X\�\��\�V�\�^��m�pq2xf\�\'\���\�\�\�\��e�<	3��m�ޗ�g\��_\�\�ݿ�_p���\�\�#\��]o =Y^�{-oHGN\0;۟�q�V���+m�@�1\r,���]��s\�\�]�Y\Z\�\'\�\�Χ�&�i\�\0t�\�G\�\�\�]�:\�\����\�\�6|@\�k\�+{\�Q\"rY\�~�@���љ/L�8zt��;���3C�:N]�\�w2\�\�O�I\�\��gQ\�\�k;����H	D�\�~�>f��\��C��cX�A\�C�b\��A��\��{�\�`,\�\\�\\�8\��m�w�0\�w��//gmт�2�|r�\�=^\�\ZH\�\�ˮ\�\�\�\�\�!O�g_����,աo�\�\'\�$w^K�:{��\�\�Yg)0\�~�!g�v[^\�\�>\'\�ܻ��oI�9\�#\�Ħ�u�&{\�\�\�A\�ܣ�Qդu\�奼$�B\��\�\�\��\�\�c\�\��b�bŉ⿵�\�,ybC\�~�]�66tx�\���mB@�[u�߈l�ۜ.�OkM\�a\'>FV�I��Cb\�݉�FHؓ�\�(��6\�\�6\���|q�\�\�Xe����\�\\:\"�8�~/-�%\�g�\�\��\��ugxk#\���\��!��\�%!\\��\�\���\�ԎXH��\��\�\����HY\'\��&\�z�]~�\�Ȳ \�Op�q�0�\r\�wϋ�\�\�ؼ�\�\"NH\�W�.�Y\�<��o�\�\�?�Ӌ0�Q���\���c�YX�\�\�1�1\�A/XX�z\�\�W��x\�1\��`��.\�;�	\���Vot�\�3�}�\0$|2e��nHܛ3\��m���o%�o\�{~��o�Le\�\�OVK#��\�]�ӗx_p\��!��w�Yw:a,ӹD?Sg,\�\�\��\�����9a:���,\��?�\�.�\��t\�\�\�m�\�\�`B\�:\�=�@�BL�|�\�ft@��\�\�\�U���\"|Ξ޲]\�B�`AjH8\�;�\�oyY	��\�%\��쌺��yz��\�s?�=!�O\�?e�\���a�wc��g�\�\�ł\�\�.\�\'\�I(\�j�ޠ�dQ�����\0\�!\�<�\��\�-�e��oDqN�we�,@za��:��\�,\�\��\"�g\�p\�R�>�,��\�ݏ�\�e��L\�-:#ȅ\�Vޝ�~&+�\��l��\�2\�l�!	\�\�`\�i�OWF\�\��v_K\�7�\�\'�L�Տ�;d\�\�8~W�\r\��\Z\�?4ZFx\���{��]��\�\�\�E�L��X�;\�?HK�ނ\�\�F\�\�\�R\�!\�+\�\�\�	�\�,�<����\�dt\���V\�=�\��\'W�\�xٷI!��Iռ.[�́\�wf\�@�{\�9���\'v\�]$<\�쳀\���	ý.�u\�C\�BȞ��y�\0\�Kf͋0KlYbn6,\��=\�a\0��\0@\�\��_K\��ŀ{\0��B\�O��_�X��z���\0\�\��\0\�\���O��ov�X+-��\����\�A�/�_\�COI��W\����\�\0&\0\0\0\0\0\0\0!1 AQaq0�@P��\�p�\�\0?�\0��\���\0�w�w�W�w�p�\���|�\��_\��X�d�r\���\�Ye�Ye�Ae�|3\�m��\�m\�H�\��7%�am�ۧ%op\���?-���\�\�m\�y\�x����^\�cm���v\�rg��\�\�\npt\��m�\�o\r�\�v�]7E���\�~gN\ZY�O\�\'�����V\�u>\�x�\0\r�\�m�\�m�n�\�\0}�\�K\�\�o\�K5�;�r<\�&\�8\�/|Ov���_\�o\��\�ᯀs\�#�\�\'D\�dc\�D���\�}\�9E\�V�`\�.�.��-�����w\�\�~��ڲ\�,���J� >�g���t�\�^\�Gs;f*p��,�K8\�K���vٻOVq�ud�\�󍋫��X\���q;�+P>\�8/\�6y¶X0�ٴ{�\�\��a\��\�2˾;�e�G��菞\�\�i0\��\��\����\���C/�,�:�܂�Y����\�\�m\�\�,�-\��Ȏ\���|�ˢRˤ[�=Z�I3~)�6X�\�R�\�[�\�\�\0�bȃ���\�\�w\�vu;�Y˺m�|�\�ώ-�w\�\�˲\�%\�\�-��\���\�m\�`\�m�d�\�\��\��\�8^H��Ya\�e�ն\�d�o|1<6�\�6�@K�\�͞�c\�q�\�&fK�\�.�\Z\�ρ��V�\�\�{�G\�\��\��3\�6����\�͈u�,z��_B\�\�\�Wԭ\�=��7\���������a�~E�X7����\�4\�\�\�:ՀHl�\�m\�`\�\�!��A�-xz��\�i�gVO�\�\��x\�,;��Kޭ�I��u\�\n1o\�n������#�_�O\�<�\�\�g\�`���\�\��\�G\�~���̻\�~\����\�\�\�~\��\���7\���k�k=��<�k�k�k�~\��_�\�\�\�l��~[ܝ�a\�\�`����5[����:\�Z�\�[�r�\��\�\�|�aq�w�	��+:�\�G�Ĩu\'�Cm}d�\���\����\�\�է�\�\�:�\�>>�o4 <�\�,\�@\�QݻY�n\�k/\�\�\�r�=�W\�t�;l��\0�0���!ԉ\�y�J�l��o>�՜�L8J�$-xN\�Go�N�Q��_.\�\�\�ԩ�82{�\�ճP�\���+����\�[M\�y=�pq�\�\�j\�-n\�\�G�]`��\�hwd`Zzn��M�:���M�t\�X\�ۿs�û\�B��Bv\�l�d{��\�\�1z�\r��\�x<�\0�c�G\�\�\���l6\'V\��Ǡ\�v\�e\�\�[�(aݏ�{э�wb!�:�`�8\�a�g\�G�7�M�:��\�\���X�\�[g�`�:�\�Փ���\'�\0\�\�׃8��xĂ���\�i\�I����GI먲X\�;ۥ\�x��\�O��M\r���\�/\�q�c<�\��\�u1ۻF!ǂ����\�\�?��S\�\��_Vu2l��\r\�\�\�\�+�\�۟H\��\0��\�Q럻&����\�\�!�\�\�qga#�0��D��HCC����O�M��}\�a\�\�]����e\��=����]:��0\�{3eO�LzЙ\�끗��r<[\�WgK��e}I����\�;\�\�um�\�\�\�8B\0�~�g\���\0̐억@\��~��ʿ� �!��\�\�p�д�\�t]�y��\�rQo�R\�\�pD\�\��d�Ł�o��gc:ZNO�Y\�&\�7K\�\�\���u9ug@\��f�\��.���\�\�Np�?s+	}���\�ӆz#_�gկ\�1\'=�\�\�p0lC�6{�ȟ!�m�\����\�Mړ�6~\���\�x%:�,q:�|��:Z\\l\���K\�\�g\�,�\�p��b\�q\���p�H5/e>\��Ћ\�\���vY\�O�A\��\�\�7\���>�\�baݥ����[b�\�{~\�$=.��򟩏��t�\�#x\�\�q�1�1��kł�6LHoo��0�\�^�\'��|���l��^\�\��\���=�J�kf\��{\'ԉ��H��N2̏mHW\�,\�,aIG�e�8�\�R\�{vXtޅ����Bu}�w�BYyi�\r�\0�\�a(��p�Լ��\Z��[�æ�q-2\�䯩�;�u ٳ\�w���հX�l��Zs�\�\�rǑǨ,!Ӎ\�Rt���\r�3�P7\��\�f���\'�\�>,��Y��\�ϊ\�\�`�s6I�����\�\�\�cg�䎶\���\��LY1\"\�dw&\n\��\�F]\�PY<����fl]C\��J?��D�葀6pû\�N3���p\\6U\�܀\�m�{6\�X�\�r\�\'�\���\�\�p=m�\�6\�xg\���Q����.G�C`�8]p=6xGdI\�\�\�8ɖw�\�\�a��7�Cx\�6c�\���H�s_R��ǰu\�?S\�\�\�\�!\'w8\�\�\�赁a�;{\'�Y\�]��\�\�\�\�\��-\�\�l�\�$\��\r\���z-3 \'\�>�i��C\�\'\�P��O�B\�_�;\�\�;xb���!�[33��\�K؋����\�\�^z]:C��S6\��\�\Z:a��ㄠ\�`\�L����B\�\��\"\�;��%�\�a�S��͇����o\�<�\'��\�\r:�1�;u \�p�\�:�Y�6M�/V��z\�xӲD�]��#��}�sx�g_\�a=Z%\�-lφq:���؇V\�ܾ�\�K��/\�A=\�#r	\0\� �J\�\�\�v�\�3ρ\�E���\'���$6�\�K.\�v|�SL�w1\"\�E��P���$\�~,p�/�kn3\�\�\�\�+9�z�r�\�{u�\�b\�իm�[�k��m�\�6�\�,�����V\�۵jݫV�Z�j\�}<b\�61�\0L�o\��\0�&��C���\0��o��\"؞�\����\0\��{���Y_-H>\�:7�\��\�\Z{�\0j\��/���\�\���i;���6Z��\0\��\�\0+\0\0\0!1AQaq�����\� \���0`@P�\�\0\0\0?�\0�\0Pr�Tv ;�\0������q\�	\�\�\\]i�\�~��\�\�\�|\�\�S\�t:�~�7��!\�\�V�\�\"٪2&\�Ù�\0��\�\�\��s+\�IEZo\�\����0Ɱ��c\�\�N��}-���CAD{+ǰXP:\�/\0k�G�(\�,^��\�\�l[�44\�C�l�)��26�}�$�\�\�ʚ\�\�.כ�\��Y�\�\Z\\��]�\0Z�?�\�\�ܸ\�	-U\\�\�\�e\�\�X�_\�\��Pג\n@\�\�\�@(@Qe7\��\���LmP$q-p�� ��	J�\�;�\�%�R\0�؎^\�6(ޚ\Z\��\0\��\0q\�r\n\�9\�E�����\�~\�PE`Z\Z\0\��\�0\�d�/\��Ϙ9M\�\�R���7����z#\�\��z�\�\�9a\�.��4�?�ߢC\r\�As�\0g�\�6\�\�WT6*��Ji\�\�)\�p�,1%J4\�?�\�a�0���b\�\�n\��l/��Ű�e\'�U�s\�3*\�\��a;�\�C�r���zy\�z�/\�+�\���h���|!�H�|0�E�)\�g�\���x��:�d�\r㲱N��=KH8�w�F\�Gj\�c\�C�\�*����VҺVO�S\�j\�,,aO\�\��`C\�f�\�\��\0\�\'~r{���61�\��\0�P\�\��\�^�\0�ڦ)J����%Q2<��U�z\���L\�g�2�th|a�x����ճ�\�	��5�ֵ�>�:.f�F�\�_\�K�e\�\0�r��O��ͬؗ�t\��f\�\'	]�qĿ ]�\r��x��8\\I\�=��6\�i)�3�\�\���4˟�fGVޕ��{��\\<��\��\"\�\�-�\��.\�n�a�/�\�[\'\�\�H\�*�����\�\02<��U����T�k�b��\�?�\"�	�K[Ϊ#FR�\�\�ޙ{\0)�P>n~/��@|\�\�f���\�-��\�M��lX�\�@\�B\'v[\���\�\0��߬�V\�\�y�\�0 iY�� 뚖��<\�\0\�h�n4�p��q�(.\�\�`\�\"������\\Qܶ�,��\�.\�0W\�7\����\�\��&&�Y\��<���\��V�V7\\\���\�$�\�\�\�Ox������N�0\'�\�\�\�Wi��-B%]�\�\�\�\� .龥�R\�۔�����*@{�\0����.n\�\�)�\0�ԃ]y\�O\�K�\0U��a9�\�u�F�mr�)��.�B�i���\�\����s~�/S��\0\�\rI3\�\�9\�\�/Ⴏ��:\������lN�\0^�1�\rh8�{*R\�\�YN{\Z�$�5b\�\�\�\�\0\�\�v(;ߘC^@�g\'��\\�\��n�\��\���+(P<(.\��\�]v\�^UM\roE3\�\0���\�*O,>��\��\�\r\�ӈfJ�m�h/���ja|ֽ.Q+�6.����V\�է�\Z��g�_���\�[\�1R\ZPL�\�~�\'/}{v�p\���\�\�$\�Ӗ\�\�5( \�ډ\�k�ö!h\r�����T�p(�x>s\�\�a\�xT���>\�˷8\�\��>����]w�َ�7�K*��\�X1B����.	LG\n\�Te�\�!�4זZjT\�\�t�ӈ\��\�^7y\�\�ba�\�i�KJ>�g\�\��(��:��v\�EU\�l���\�,Z\Z]�{z��\�\�#�rҍ4�kP5�S\'�\�\���\�\�x]#�\�\"ЙfG��\�\0\�P\�]\�\"\�в�|1pQ��ԏ~�k�`}\�\�߬\�ۙE�-\�\�\�xy\�\�b\�E�\��\��ߏ��UJ\�p�Q䃅-Z\�5\��|�\r��\�[/\�w(aȳ�\�\�d\�\�\�>2~��~%H2\�CcH�dR�{=.�\0\�%\�o�F\�(J�ˍ�нD��^�\�u\�\�dM5\��\�\'���\� �l6��}\�\0�kp\���e�\�8b!%g�Ƭ<t�,�B3B��P�����\\C�{\�\Z�W;\'b\�\�߻�\0w��\�9tί^�?���Y��e�@��\�nC�t|\0�\0MF\�ˀj��\�}\r��U�W\�\�\��\�M	n�\��;�P�WYPp�\��`qs[}c:\�\r��\�悏�\�\�E;٢\rX(64�#Ok�ԅ��ϥ�B�\�\�\�6\�Wj���\�\� ��\�_����N\�\�U�-�0���*��\�z\���Q�V\�T�.P��\�V*\0�\�bw��\�\�^\�{A��R\�:��Z<\0\���1�a�\�\���^�ȻW+\�Yb\0lm0z;4w��v\�-y�KR\�\�>���1�݋qU�\��]�>\�.�<�\�!~�X�\� ˴���$�\�\�]�t�\�CB\�*��\�:�V��Px*\'`�r�~\�O�B�\���]\�ͭʅ��K	X�2\�\�\���\�#�i��iZ�v�U���8� �\����\n\�ʒ\�a�2΅?�v�,\�X��(d�\n6�mRQJCa�K`�i�5g)>�1\Z�.\�����\�\n��k\�\\J�\0�\�A�ԧc�\�%\�p\�\�\�ۨ�N\�׺9|CP�\':�h\�\n\�rw ��K<3�1Y\�\�\�\�WH��j��p~:�蘤�o༣tn ��h��\���J�\�@ܸ\r���C֮�]\�<�~�+9�o��\�\��M\�f7\"�NԈ:8�(9\�m��\�#�`z�E��^��o\"�\�6�*\��Dh��MҢ�ޭ\�B�.6�K\�>�\�[F\�\�k\�#��\�GdT/��|[_9\�\��iW\��\0��l\�3tho�\�\�9kӜ6\�ߣ�\0�� ៕e_\0�]f\�\�\�(9\�X\��\0\�i�`2/!U�w�ޓe��\�\��AaV\\�=��\"AɻT\�����Ce\�^\�3�y4\�|\Zb\�k�!����gDr&��^=�oR\\T�x]\�z\�\����\��+\�ϵD�T\���\�\�ܞ8ڡ6/-�\���;�ģ�x�\�\�\�	\�.�i�껙[�E��lr���!��T\�}�\�\�qV[b�\�v~��\�ej���υ�d\�\�����*(\�nJ���Z{,]�خ�m�@F�(	l���x|�(7L\0��ѮG9=\��y�hڹ�h�*t�:E��\���T\�6Q��BHѢ�w\�<.ߑ�;zV]]\��\�\�\��C�i���k*j\�~!:@YptZW�E��Y��QB�\Z{1�&h6��\"0Cj\�\�!Q��b`\�ai\\xM���3�ȳ!�\�ar�\�[�]}*B���\�\�\�Ñ�O��\�Y�_�,5顺�J��%�.���\�b\�\�3��� �\�b�,;-�\�\�L� B\�H\�d�\�ۘn��\0�����\�_\�uT�����\�\"\�p�5`\r�x!���Ab�9\��y\�x-\"�rUf6`#\�G>\�\�\����r\Z\r즦���ǁD\�i�8\�2\��(\�\��U�R\n_\�S[�V�|B��rJG\�J��\��pX,^ڠ�\�1�\�\�V*!\���{6\�Y錧5�Y\�\')�g�kx�ge�\�25�r/�fR+N?�0��\�m0��\�\�Y��\0��\�d\���R�\r\����\0q�L�p�*n\�0w�95\�\�\�8��H��PZ5\�E�<0T-0>\�>�\�vA�\�\0\�O�aC]5�^�^\��+*��C\���\0�\�7e�,�\�\�t\�y��\�fS8���sP$SL\r��\�\�h��P�\�\�k�\�\�{��3Y\��\�zP\��a\0Oq���iy�O�	\�\��`\�\��â2\�\��>=\nr�R�[t��\�N0^#߃/%\�>F\�\�n~dڍ\��ub�T\�\�V�\��\�ʄ{\\�\0\�\�?\�t���\�VR~{l��\�]Kf�;2�7{��7�DrEi\�\�Xx2d�\�\n�\�\�B\�@�B�RS�>}Z3�A\\\�]\�19,rո/z��}\Z�\rp)�\"�[>P뿒fE]\'?\nh\�\�~F8��K\�\0\�4\�|\� �Ă�\�\�u���^�mZ��6.�\0|\�\�(���L�\�\�x�_4B֕a���R2�S\��\0�\�:f��k�\�9\Z��Ug�~%�Q�\��d��\nd\�=@0\\5)rjl�W�,�\�7W̢/X1C�dU��8G��@̣\�t\'\�\�~F8��K\�\0\�4\�|\�M����y_\����[j\�u�&\�ߠ\��=�Ƚ�<6|K\�\�U���W�C�\�Q߀\�q\�q\�\�\'�|!�+XG��*h*���|\�{�� �7\0$S��Ͼ2\�\�\nO\n]q�\0\Z�J�ZՋ�O�vt\n?3�y�G��\0PAl\��?,��E\�E+\�\�ZIp	c��˄:NS�3\�)& LbӁձ�q��X�\\�[�1KY�D�Rq�*Θ��\n;����\�6�.�k\�K\�̆˥�\�\�o��-H\"�Ϧ�p\n� \�W\�!\�낀\��.\�*ca�\�\Z�ʭ\�8��@�CIf���*D\�@��\�/��\0��\�ZPT��h_\�]F\��Ys��\�!���U\�2�A\\	�\�\�Y�,`\rO%�`v\�\�V��)��\��C\��`5���gOP\0 P�&()���\��){� \��%4|\�H,�r\�v\�-&m�\��\�\�k�W��ڬ�\�G�\�\n\�g~�\�\�A\�a\�6T�\0��SB@�0�ҩeх\�yB���T9\�4\rpni\���[\�D���\�{����^\\�V��*(��ݐ\�T�Y�h\�J6�wh�ߟ�~X�w\�Ȃ�h�\���$\�Y.\�Zh\'�?hn\�\�\�ymB-\�K/\�.M�Kh\�0ua�\�G�r300^�#��Fmb\�\�N\�Ε0�\0֑�1g>�\nf�\��\�\�2��\�>{r�\�\�P�j�U{�\\��t��E���}\�s}\�\����!��8 ��*vCMS\�e�\�X�p7k�X\�7Vk�\�_��XE)\�=\�q\��s\�*\��+�ةf��̮�+ut�&�\�JU�0��\�\�\�s�f���\�^?�w\���3\�_�~}1/\��\��.\\��.\\�2�ϟK%ϙ�\�gr\���\�_�~e��\�_�~}/\��\0��\0��\��g̷�\\ϡr\�\�}�g\�33=\�\�\�YU����,\�\�\�\r6�\�pKpp	^�E\�f4\�T�\�X��~}~�3讻\�!g��\���G����,hy\�����)i_ꏬ�~\���\0\�~fH7.,\Z��/O�_�\�Ke�LW\����pH\�\nI�;����7<%��ܿ�3�2��K�/ϥ˗/\�\\�˃._�J�\�J��!\�R�J���\0]���#v\�\��x\"�\�\r�k\�nT�\�\�d��K�\�S���BT�Y뮽��M^��\�ދ��zT�J�F\�_mJ	SR���8�<2\�a5ѵV\����zA\��*�^\'R\�e\���\���\�z�5\�p�)\�ï�1�-�+�V�U� \�K�v\�VSt���i\�44\�vf���^R�\�\��\0�k��\"A��%˗/2\��\0���_\�\�j\�\�.^�\�̹R�*T�^�*T�R�k֥\\\'��qu�\���RWEF��nh\�\n�qKP\�\'\�2�T�\�\�6r\����c�L\�5\�U���ҥ\\�WH0\�AF������F��l~��\�\�?\��ze�\0#7.\Z�Z�j�5^�~��\�/pe\�q~ \�aPT�\rʭ�SW�\�\�%$��\"V)F\�֛�Q駉\\��\�\�?6�\��-hc\�\�_�E\\#�\�t�\�%MR\�\�Ux;�R%h\��\�o$ܺ\�`\�\�\��X\�ҽ/2\�uT�J��yR�+ҽ\�\�W��	\�?�!�7W5+)�\'7�e���]B̃�y\�f���#:�v̩6Ol�R�*T�&	rc1������bQ\�[�^w6\�\�\�U=;�cP�zܹw/2�\������\�j7{\�_\�vN3\0\�I\0i/�^].\�$�Ō(e/Ϳ\�\�dS!Ld\�\�Ķ�Vʯ稢ƽ����\rª(Kj�8UA�G\�	Qe��\�	�5\�x\�0`\�ߙty��\�e\����3Լ������\�R\�k!�+���\�\"�_s\�5�������\ruk\�0\��\0+��\�ܲ��j�\�yVk�F\�?QŖ\�\�\"X5YCgg�r��&RR��lf]���C$/\�u\�uǥM�S\��,�����\r�\�\�#8\0�\"���2��\\��%�|+���=\�ܣZ)�T\�|�X�t/d�\ZV\�\� �\"\�]o>|LJQ�fV�\�f_�\�g�S\��=8�=F�jW�zT�W�J�*T�R�0F*����G,�+r��\"\�w2^\�\�Y+(�T���rz\�HU�������d\�_lq\�\n\�e്T�\�H\'��<\nѱ�^i���a�^}o\�r�	�xc\�k�Mܸ2\�\�VeI��\�\�.�^C�>�k\�Tv�ٲ\�#\�,����-?Ƙ_\�\�j�V�\'�q\�^dam_=@Y\�;\r�ik�p�\r�˗.\\�r\�\�_Կy�/�r�\0\�?¥J��u�H�&$� .s_(�ʷ�C�n\�@5XR(KsW�Ô�����\�\�_\�QJ�_�E�\�\�G��5| ��@¥F�j]_&~e�S�C�5Q\�o+�( W1�\0q�\�^�Kx�X����)\���G\�\�ܺe\�X�\�=8�sr\�y\�0`\��\�W.\rʙT5���\�[(<Aph��ĵ\0�\��#׈\�=�\�!����\"�׈��T��.���J�%\�^e\���}k\�m_��?\�zT�P��RW�\�V> �-\�d;�\�.\�G}\�Vh�^\'z%.\"\�JV�&\�\��A0`T� V�޹���\�3B\rg�\�\�&�C���\�%>1��-�quT\'o?z�\�\�z�)6��\�o5P\�\0	b���\0���]N\�\�@�\�\�@6>x�ͧu�\���3�pe˹~�%˗\�\�X�\�-y,PuG�\�v<���\�~Ae��\�t�0��s�2-������̀\r�\�7h��\�h>&�\�ݐqi�\�\�c\�nT��o�~�J-F�px\�\�e\��E�\�/��,(��>e\���^!��2�zW�J�+\�%J��Q�El�\�\���n]���\���\n��\�\�}5�\��N3/csG���.VZ��SJ����ywq�/Ԩ[�Q�\�\�싎�4ϊ;`A\r<�%Ȯ\���ED�mKVm)\�+\�}3\���+p�Yo�\�	��eWa\�K��~�.k�\�,��,_t\'�<g\��� t��X��JGv#H�\�p�΀�ǟܿ\�ej�[�����	ȫ-B\\\�L/�q��\0�Y�5.2�˔�\�\�\�Կ2\���.]@K��vJJD�J\�\��+\�\��OL�2vD\�ߴv6s\��\�n�?;`	y\�\�+��\�\�	XP1SP�s�-ʷ����$9V��T\"mm��X���3��vX\�/\�ͤ��,D\�\�U�ȳd���$��\�xaI\�MF\\\�(Ñ�n-��\\ \�_؏�\�\�,%��lf�h��_B5\�S�?ե՟�9�\0���\0J\�\�Ҕ�A\\\�����Dpd�ѹ�q\'̡\��\�Ggܩ�\�żwp��E\�\�\�qՕ�A�b\�\�\�\��\�~�\�\�0Vҹ�c�B�� ��ëJ\�ag�K��\����aa\"_ܹ~��\�\�-\�ĺ�K��m+>s>�\�\�{\�V=�I\�-1.�\�7�\�/\�\�{,Uhr�𢹮ܐ@I�e\�8\0(&\�4���r�\�\�hDP�\�3@g0�Pw!(����Zt\�K)=<\��*�ؽ�~���}$0(0o\�_�K��#�`�R\�\�r|�\r�\"m�\�\��$\�\�j\���\���-1\�LA8Y>_h*��\�\�jq�	d\�Z�W�ĳ�)�n	D��\�\�4+�\�E\��V�Ʈ�~�\�\�z�v^\�\\Q*ߐ�*Ԥw\�)m\�\�%\�\0�Dyy��oy�Au�}o�	�ջ�\0R��ꌪ�\��\0ט��\�(*ݿ\�-�\�\�\�8��\�ԙ�V\�\�@M>\�ĭ\�\�\n\�\n\�\�\�U>\�<\��2\�)\��PE�f#\0�å\�X\�9�ԭ!iQ��2��YP|Vb\�B�^\�~\�xl��d7Pe\0�/�KF��I�\0C�1�\���Z\�Q\�=7(.�x����\��\0I1i��4~!\�}ɂyChK\08\�\�JJ\�f��2\�ł:Jv}��6�nP�r\�O\���\��\�\�[��{,2Eݾ\�^\�N\�\�\�.���o�JxYN�eXM�/�)\� h8C�oCT�\�%*\���e^5\�F��j_~\�0\�W\�Q\nZ�>e�\"?�lM\�M����N\�X�\�ua*PY�\�N��)\�_!\�@qe�)�/L�\�o\�9Ǵ\�/zD#J����C,l8�\0}}\�ӂ\�J;\�B\\\"�+�n֏�� b�)\�\0�\�BV)8\\\�\�9]ԯ�a\�\�Tv�(\��A�\�F�?U+R\�k(h�J�\�b\nc\�\� Dr+��<�p��\�ӒRh-F�\�q=3*\�\�@ �1a��\�_�*f�\�\���)�?��\�\Z\0�P\�͖�Ga�\0��\0\�P�`US����h��tE\�r\�@��p���Ÿ\�k���{�\0\�Dگ �nq9uq��\�1\�Q�O�A�\n�\�톅�\��%j^�r�\�/$j\�\�\�I�[N\�n�=�Y��\�<8W\�S\�ف���eM,L�\\��\�͠\"\�_�\�\�|����d;b�E\rn�ᵓ���u/`Ӹ��.\�h\�\�NS\�R$c�(\�rM\�-E1��QZ�(<�8J~H����\�Y�h��Yj\�C�Z�x!�\�yeb�\�3p\�r\�<�%[_sW\�����<\�h\�,\�+.�Cp��\"��XUyc���\�ߨl==N%\r�\�(#���lbO6\�\�PR}\r������\�\�3Ÿ�{f+\�)G\�m\�1\�\�\�h\Z_፜@{O�6Vl\�L4�8��\Z\��\�X\"\���\0�D6\��	@خ\\�\��?\�����\0\�+-f\�S�q�.\�H�\00�G�(�\�<���}���<\�#Wt}K!b�\�^�\�?^Jߔ�E�k\�\0Zj�}L��t\�\�\0G����\�\�\�\��\�(���\�\�\\\�D�~0��L>��g>�0!����n\�\�z\�dA?3XR�a\�>�@u��^`\"�qQ��\�]Cz,�u�\�t?_\��~bSV\��`\�|F=�zk\�=\��\��|\�s���1�\�`>�X34��\�\�[\�)h���Ǖ#J�\�#�(\�6\�W�q^���?D@��\0=�\'D<\�}�\Z�a�c\�\'\�@\�͏\�\��\�+��Ɗ-� �^LW\��b\�xN\�\0�V��/\�SGV\�-�E�&`�hq)R�<E�Ѻ_�@G.��\�-��\�j��1*y��h|u\�wKe\�\�s�m\��9�B\�P��\�,H��\�^����hq.\0F�\�\�]H\��L;\�4�8�9{����\rQ�|\�g*F\0�>`]�\�n>�\�El\\/Qل-�C0M��k�\��\��M\\%Ht��Q������;W�\0t��}\�P��aF܉r\�G\�\�aG\'5ϽNcْ*�?���U�\���4J\�\��\07�-+\'�9��Fh»W\�P���\�28\�?(�����42c`)�g(�\�Tb!?���� d��xK\����Z�*���#\�KЯdr6V�;���\��\�+�,�y\�=e��\�U\�|M0��:=\�C�w\�#\��\�:qt�\0ĥ���\�\�E�so\�\�\�z\��\rm�(\��\�}@4�Ǿ�$j���p\�j�\0\Z�\0�i�\0C(�a\���vu�|S�	��|\�2�\�\0�G\�t��\�\�\��T�\�ȶ\Z\�隴;�\n�J\��\�W���W\�]4��\�]5GW̫60i�\��L�\r�=\�D6\���\�\"��Yd����3�m��Q!~U\��`�eԴo9_ӈeS˄s�S�=\�	}I�n�|x��◸\�Ge\�\�\�(\n�u�.��\��K�\Z��\�5\r��\�B�̪\��\�\��\�W�\�\0;G��!hQ\�TJڬ%晴4�	��\��\�\�Y�\�r���	\�\�\�\"�8_\�<	\�\��.\ZS���f���\�CQ�\�KDW��~#\�LVgrg�V\"<�LwW\�-w���(-~o\� �\0aNG\����\�w\0\�\�Qy,�\�;�\���lC��`�7�C\�\Z\\a�\�`��\�~Nfeb�a��\��<�� ��˄��\�=S�0\"�e�\03��NjS2�SZ&\��9f͋����L���Q\�\�.��\�b5\\�{@\�\�\�\�{TL+�I�iW��1���\0\�\0(�\�\�R��%�\\\�����\�İ,\�?1M\�:w����v\�Q�rT}�x�r��#6Z�f����4V�\�\�\��\�\�+;�¡\��q\�4p:����Q��VȊ�\�,\�\��9��LΟ���?�Z,(0~7\�v��Z�(0}��\�õ��?\\�&d`y��W\�b��W\n\�\�@�\0Q,��ӈ\�\��nEK\�o\�*I\�C�0\�f)RB)1Q\�v*(P�SG\�:<\�Z�f��\�$�o#�\�^a\�\���e�嬸g9���*\�\�\�o,��+B\�k?�r�lL�\�(6�\�0�*�SV�o\�jT8Uc6�{�\�,]\�~.081|�,rE\��q�\��\�^\�3mߛ���� ���ew\�P\�\��c9K\�\�̿\��X�q�C\��\"%tE׵\��\'Vc\�Q��\�g\�R���\�e5\�\�-\�\���{\�I�X^�\�\�\�2@\0>\r�\�\0������--I]�&rud��\�hO\�!\�<ccL\�\rw\�tb<N(�mv�!�e�ˣ�\�-�u(��2L~�@PK�\��\�\Z�\�\Zɘ�!Cl®?��W^\�)�\�{S?�E\�-\0=\�g\�X\�a\�A�\0�e�//e�.\�\�Yk\'��1{t�a\r\069O\�0�\�\�\�W��pU`\�/\�R����B�P\0Z��0@��k�\Z�z\\�]q5��1��\�\�j\�\�Āk*\�2��پ끉<\�\�$\�VL�\�^#�\�r�	\r�p\�fr��+(}�Ґ�v�Yʈ؏�,\�e�*\0fwlv�\n�\�\�\�t�9o=ޣ@g��((Pp)/\�\�\��\0\��v*R;\0�1�CE�K\"�	l�8m�\\�Jܠ�\�\������\�\�\\S\�r����\��3]\Z\��\�.\�V�u0���\n\�\�+��q�mf%F���9��}\�\n�\�sDЇ��8����\\�\�^8\��\�\�Z�~\�߃Q\"�P\�W\�2D1e�\\:%\�k\\\r8�\�7(�\�|x�\�J\�kvCe�7�p<u޿$����¥Ti|�\�֪U��l��1�c��\�	@\nL\��\�AWF�y@sW�\01�=����R�\�\���q�3_\�fJ�\0Q|Wl*�ł~#\0�t��\rEk���\npB�\�\�\0<�S��ib�o�0©@\� ܔ\�lL`j\0>\n�*$\�(�\�h\�\n�)\�NX~s�\�S�z|3.(i[d���\�V�?0Ĵ���\�` Y��\"L\�0��m�5��\�p��y�\�qy��(=�\�c�\�\�\�\�\�RVK�>F�\�\�d�Tn���V6d��\�_�uL\����ܨ\�.R\�����Ec��as\�\�ԠJ�Ц\�-�<\\�4]l��p\�F\�Gr�\�]~\�QC�̪]���Y\r\�\�\��h\�W\���b�f߶J�\�<\�9�[\����ɳx���AmAo���!L�\�_\� �\���\�c$\�T�\r`\"\�2eF\�	[�H���h�Xa�gUܱ�u.����;�<QQ{\�,:1\�yX\�YV,)��\��\�\�w�#\�\�\�Q`\�1\�\�(�dg�ϿPˇ�Z�\�ߨ�eK \�?�.�����\\5d\�\�_\�[�<�9�h��\�_\�\n�]��\����Ԥ�k-G\�_6��\�TT.\�`��\"���eSA[\�����fT\�]\�\r�g���\�u���I[�\�\��=�׀�����\�A\����\�z\�A����\�LU̫ј\�}_1�a�Y\�\�aN_Ea� �\Z��[\�\�\0R�35El�S\'}�0���G0r\���C���(\�>\n>\�R\�3\�2�A\�~B��ɱ��\�\�˩-�et\�\�\�|�!� �YX�c��\�5k\�/\��P\�\�\�bԋv-c\�J[\�\�DB\�\��L\n���_d\�%\��\�V\�{n\\�I�X=�k\0	4b�\�ɛ�>U^�R���m<ʔ\���s�\�3\�\���p\�\�t\�a�qX��C\n�^: Z\04|Jښ�V\��l?r��sKn�\��(\�,\n�	����]Ӈ��*��\��+�\�\�*�\�\�\�_���M	E�iV�į\�h\�y\�R�\�[W~P@Tof,�-9W�	c%9<E~\� �.\�3�1jp�}K��\nDlb5\�;����l���9��\�R�9\�isy5(v\����Tǐ\����\r\�)��}\�`�i*�l\n��}\�\�kif���O�jJ5ĩ\�\�\�.\'bw�:�ԼI�|��2�\�5�l?׾rk\�-\�4x��\�\�a�^\�:0i|\�)S9\��3\'-�m��&3\�?R*\�U-\r�/�*�\�W�a\"���?�\�.�1R\�hΟ7r�Eڿz��\�V\�~K�K\�\��bn\��Ĭ����MLZ�X�\�r�\�֑��#���\'��q����\��\�]D�E^`+0��`s�\\&�&7r��r@✋\\�F�\�U\�O1��v6`\�X��w�c�dV\�3˩QV˳�TK\�\��`�!X�3\�e�Y\"�%Y�\�\�\�AA�o\�\�>	�W\���y\��ަ*�6�������=�_r�\�JV���5�\�S/7\�sU̪��/[J�T�\�¢\�\�Y�\�t��v\��_G\�s�3�\0+\'�X\����S)u��\�\�6ǘ-�\�\�\�\'y[�\��1\��\��ʘmK\�B�	.�\�\�	�\��B\ZԲM̾s\r\�;���T\0�\�V�FeE������UYB����2E\�{��d�&7_�e���\�}#s,�=ņ�!l�>��֋\�\�r:>#�)h`O d�\n9fPڱ�\�r��\�\�x�0E�J�L\\�\0p�XD\�$P\0��gͳ \0�({i��0Z\�w�ATq��h�l�\�l�\�/|��{��2h\�_�\�AC����ϗQ\�\n�%�\�\�7G\rF�A_pk\nAz�\0\��/��R�\�\�\"{�\�\\�U��\��%\�\� ���j\�\�\�\�٨V	Ζ_ ��z�\��k�Nf�g�C~j�\�\�N{3�\�<�\��\�f�+�\0[�yܴ�V���\�)��A2u��\�oK\Z�y�\�\�\�kt_�LZ!�\�\�\r\�5\�k��M���\�\0�2\�\�\r\�B\�E�N%�\�\'\����k�r���LET�C1R�]��\�\\\�\�d�l��l�D�7�\0\�\�}M������W�o��p.\�Q�u�z���S22�\�\�u�l�\�^X\�P?!�}\�\�\�rƅdJ~ ^\����y�(>\��Q��Ճ���%�À�\��\�Ԯ\0��\�������)\�Z�\�9\�\�ۏ� �o敥T-�Цbl�i�1\�\0\0ۆ\'�X<�\�\�\0��_��C�ʰ\�\\���\���HUs��N\rL[2Ҫ�\n�h;b���A��\�\\b�f5`6\�\�\�%��\�\�~\�N\�1\r����\r\��3��\��\�\�\�\�I\0*�\�\�Cś��\��Q)@�\�50-Z�����*\�\r�-:\�m��b�\�Lo\�q\�!B5L!Pt���_�*	:0���\�\�xx�t�\�22\�X|��� T z\�p_��_K���=FR�\\\�ǴM�\�\Z�H��^�p<ˌ6�s�1�\n���U>Ik�9y�����\�z��)\�-|#j�\�_̩u=\�[�M|?\�^������~?��29?�~#G��4�y���R\�[��o\�\�\�\�9� \�/�����;�1�6\�ܷEx�#�TB-_ �q3W�%?��ݥ��ͅ\�\�\Z�s�\�\�Y3�\Z�ơ°�ܵ�7��u\��_�\�+\0σ���\�愰�\�U>*\'e[�G.	y�KeU\�R@\�pG�r��\"�\�\�C⦈x�ns\�\�>�H\�J\��\�B��D\�M\�0�\�\�IEL|a�\�[�\0�~�ԇ7�(.&\�Y\�Uk���\�s\\�b\�aE+\�,��<\��\�v��A\Z^\\\��wݕ4C|��\�a\�J���\�	�:\���u@a*�\0\�\�8���$!\�(�byb)\�]��ji�#4\�K�\�:C�?�Po\�}-�\�\�o��)r?It�Gӈ\"\�n-+�5\�p18�\�y�b\0`-*\�e��}L@u`:�O\�)\��HV\�\�=��E�%7)�*>�\ni}�����\�O�,kb7H+�!�\0�@���~\���75�D�k�>%T��Ӽ�(\�c�櫅*���aF�,}Nj\\}\�l\�-b\�\���B��t\\�g5/e\���-Kv�����2�^�@��8�we0\�F�.�\�\��׼J���\�?\0�\�6\��O�&9�����Ӹ{^�����NP�b%���\�3?,Z\�\�6f�uǜ��/8ct��j�Py\'�~�\�JE�\��Z����\"�\�!��,S�q\��\�\rQ�T�\�6�J�\�q��X�\�FU\�Њ�\��+�\�bc\�\n\'ɚ~%Ul�f	�\��[?s\�D�\r1\�\�TA\�\�\\ܭ\�3���BW_z���\��~�9o�\��*.�k\�0\�[n\�\�\�1=\�T�lx\�,�(\�\�?_0M��M�\�\\�r����pb{G��#��,�ʕԮ\�+\�\�r\��\�H�o\�\�\�P�\�\��Ȁ}\��`����ߜ\�hm\Z��%|\�\�\�Ed\�\�jj\�	\�%\�L�0]\"\�\"�\�\�\�0,ܶ\�;u31*/d�ʕ3X�߄�T�Z\�?\�����\�\r�Z�\�\�28�XO&�f\�\���C�0;��Jp_S\�d	9�7�\�jh�\�>YL�)��z\������\Z1�ϲ\�	�4���$\Z\�y37J\��\0�%TAW��R\�]U\�\�KIH�sH��e!�\�v\0\�\��\0\�V�\\5��\�4<G\'HSr\��Z\\�ĿE�c�0Qg2�mBtk�K��Pb\0�>|39>\�\�^�\"�`�Yr��[,�\0Z/�\�?̂׵\���>Szq��<\��Q\�V���._�X\n&B.�\n8�c�bQBw�\�c�h\�\�\�Q�\�\�\�̲�\�\�J��X~`�\n�)�-�]\�	p�\� &\�\�\�Bw��ϱoS?IK\�?16*����ҷG��k\�+\��\�`N`�tN\\\��j66�O���)p=�{\�\"�<?U�\�C)���т��8�m^q~?\�\�L�\�\Z\nrѿ���P,8���+ͱ	XOjX�{��}M\��\0r�c�Gޠ\�\�(\�A.�C,�]S�}�qB\�\�	��4N\�\�^ŰR|\�cN��fi��\�\�X�\�\�\�Z��ħ�\r\��<d��˿4\�#i�˫��]A�T�����g0\�Q)W\"#\"�Vz��\�,\�\�\0h�\\\�\"<\�\�\��,��`	\�Z\n\�\�/7+\�r��>g1\�\\\�H-VP~��[\�\�q\Z\�\�\�_\�4f���\�x�]J�.��,��W\�]���q�+i��\�F\�n�`\�˯��V/\�)]���\0R�\�	�K��������3SYg\�R� j�VV/\�b��V\�\�5Vk\�-�T�%\�{\0>\�@\�\�u\�XBYt)\�\�\�;�\���H�x��O��P*�C\�6D\�I�5�c&��\�\0,\�-q]Lt\���8\�毨~j����\�c:��\�9O�l\�\�����\0Y\\\��\�3[��\�\�)W�L�Ge��������\�z],�\�^��?�\n\0v\��e\�#D�\���2\�4(+~q\�H�lτ\�ܿ`8�J\�v�u�V�Z\�}���\�mU\\d��\�ܝN\�\�?mEPK\�v�\�ȍ��\�?3P��S\� \� �6X`�a\�x�\0โ\�㑘)n%�9ܬ{�\ZO}w�h�L\��\n\�.\�\�\�\�d,=\���\�\�Y��ÜTU^�ڕ���8*�s�\�N�\�eB�?�P�%\�����`�=��k?q\�J�7?1`\\�i�6�\�*Հ�>!,;0��\�mA\���r\�W\�G\�e�5K\�|=_\�3�\�d8?��A\�����N��\�@���ډT\�\�~���b����{33�C�j�a*\�����xf����V�D��\� \�H!w\��f�\� �\�^��Ǆ>�\�*%j�kٳڦ\�/W\Z�Y��@�_hۊye(�L\�\�k��$���>@X�|4\��a\'j�\�r�+J\0�)�.�.\�<G̋}���a�\'QQ~ -�\'�Odf\�!�Q��E\�G8ؤ��\�\�\�9�\�cF�\�Ԡ����\0ɜGd�\�x\�\� \��0���M���h�\Zv�gRf�\"x!3s�\�\�6EQ5�\�6m@F\�;\r\��?\�\\,K��\�2\�˕R1G�\0�w5L\�\�T��\�}\�kJ�\�Q4�ِ���.�n_�\�Q�B���,yK}�b��\��\�\�#\r9h�.WF\�Hk\�Z���\�${��\�\�Ga\���\�\�\���f\�b���\�\�k6&c\�\�\�ߐX�X\�\n�\�.\Zm�\0+�b\'���\�[�\�\�\�\\\��ч�w� \Z�G�(^�\�\�W\�1Bge�pJ�����0�	9�`}���\�EZ�)`�{q\�\�,v�d\�\�� y!�\'�[�\�1]�/�\�b\�\�\�nH�\�: �:\�\�_\�\�[\�2�o6>\�SpW6�\r�D^1\n�9d���\�7dz6%!���<��]0HG4\n}�6R���mx\"/6\�U\�t\�*ܨ��\�AMj|m�\"%�c\�%�\Z\�0{��Aw<I��\r��~��+cҦ7(sJ\�\���\��A��%LF,�ǂ��bCl\\C-\�\�\�p\�ː9�h�\�(\0|�/�\�le8n�;\�)�\�{j�|CXx\n\�5��}n$��\�~\��[ޓ\�Za�\"ɄS+�z��\�\�5\�*\�x��2\����\�E�����G\r��\���2��p�ܺ��{5cֽ�eu�U*��7�O3.&f\'\�tSZ\�k\�/J䌛�ƷYG6r#\�LSq�\�\�V?��b�̜�W�FlՀ,��7�ᗸE.\�1R\�\�-�>B\�9�w�So�0P�\�{/\�\��\�,\ZdUY�cz��;\�w\�)\�j\Z�\0�\�\�T�\�s/Xo�K�\�*3-\�\�\�PA��\�)q\nX\�|P׼v\nY)�/P\��_�\Z%B\�}J�&�x��b�.\�T�2\�\���O�\\ˋe\�c9,�J\�纻?�{,~c�#�fM�\�7E?g2�^W7��pjE�J_ie٤�v.�Û����\09�^����\0Tޘl�6W2�u2w\�<�̡vl�I�\�\�XP�\�\�\'\�U�&\'�6}\�\��_LQ|#\�n]�w\�Qy�\�S�[�\�\�c쁻�Qo\�+\rMxhx\�;7��5g\"rL\�Bd�8bTm\r�)\�0i1F���>I��O0\�`��\\\�\���c���E�n_�\"ˠ����S�\�q�\�5\�<�\'�3��Xծ\�G��^�_�R�\�Q\�2ƾ x=SdiI\�%\��KTV\�v\�7+����{\�\"dU��ء]�Ϋ�p][Xt\�~��\�\�)����\�΋��Y\0*<�(\�F��\0r��\0\�q\�-�2���F[���\rC͚e�e\��\�!\��]�0R\��d�\��h\�qA\0�\0lS�y��&\��B9j�5y\�U��\'\��f�@s��\�\�\��O�\0\�u^��\0�.\Z?\�\�Bj:�\0\�e�\���]�u\�\�]@��\�,���\0R\�\�u��9U\��\0)��u_\�3Ft6&\�\�-���u�1H�ˬ��m62�1�?��\0�\���?��\09~e*ף\���4�S/�Ko|X|8|(|I|HPB���\rh|1�C�Ɍw\�0Uk���f8v�������o���+��\0�\�|�1q�\���\�j[�\�I�\��Џi�`?�\�\�\�\�\�0\Z�����u\��\0\�Q�\��\��?\�\��\0�\�\n����\�6�}�u{R\�\�D��\�0[� \�-@���pŧ\�\�\�\��\�ǶG-\"Qr386��f\�!p\�X��\�E�H����`\�P\�~H\0\0Z\�B.\��\�\"\"h��\�Хy��\�g�`\�\�`�*r\Z�˳f8�r*wQ��oD[oQEڞe\�����G���\�2�8\\\�\�l��b�\�\��\�\Zg�aE�=AVk\�!m��S��\"N_\�\Z��3.`\�\�j\�6ܩ\n\�\"�\0bVו)]��V��\�Q�2�\�\�\�\Z����\�R\�n���7\�\�=\�\Z$9G�?#x\�bz��Z�\0\�%J\r��W�1s�?H����0_�ϡ	^��\��P�Ǽp\�\�XB~G���BT=j\\�9K\Z\Z�J�\�:�|At�\"�P\�\�*l\�4\�x\�c�ŵO0y�T�(\�\�-Yvs*�q� h�\��\�7\�2���\�lb���\�÷<\�*�Hŏ<\����[\\�y�2�wb\'	2���(\Zlh\'�B\�NS�\�xJ�9\\T Ƕ7,�WcI�p?\�P\�[#u\�/�i\��\0!\�\�gӊ\�6����_�\���\�+zߡ[�8<\�4u\\7\�u���8F���)\�\�\�eBl�\�\�\�}\�/�\�=j~�gq�U\�\�8z\�z\�~\�\�g�\Zb\�6�i�\�u�&\�X\�X���\�	P+��\��F�>L\\d�m����;Y1�9�al\�]\�\�\�AY\�.3t\�\�!�b(wۊ�utF�ԕ)\�\��.�T�<�%\��Z\�\�-�G9j.;\�l\�\��2\�\���1\�\�\�u����Usu�\�H-^�h/��:��\n\\�\�Ī\�\r���\�#zL�0���k�Z\�0�\�$	���&M\"\�K�\0ϣ��`�xc�킇o�C\��E-��}E^&_v8�ee2�[U�\�lE\�I~Ǜ\n��b�\�LֶR\�!2��0#��\0��M�Y�2�\�T=B��i�g�\"�~P;@ՅZ���z`$G�J�\�X\�U�\�?!�2�\Z|\�.�QE�m2̭����\� ]�Q�M\��{.�k\�\�/\�:�9��\�X�1r�\�;v\�k�qEp`?�!�a\�\�`�\�j\�(��6?Mq+6>&F;CD�ն�%\��#j�u,\�Nj \�:����Ԫa�P)^\�\�2\�N\"\Z�-�\��\�a*dP�\�1w\�	a\�;��|3Y��\�ߣ��\�1�\�;\�\�\�\�P��\\P��46��\�̭\�L\ZU\�P��\�S\�\�ap�Fj+�>�\Zqx� �8Z�<�n\�\�M�\�\�X�M�؝P�\�\�Bǻ\r =���\�ĳp\��_\�\'�&��x\�㹟34k�O�\n\�r:&��\� �����3��ķp�B̈́\��05d��o\0q$@7��<��kˈJ�\�\�:+|��8M5�����\�����\��r�\�~�5\�b�g1M\�\�%\'\�6�c\��+@K\rG7/�\�\�r�\�\�ݱ\���J\�B\�,\']F�n�1c�9D�e7v\\\�	�(�\�\��\��vJ5	�RM\�\�\�PE����}5/\��^\�~ne��\rz%A��.[��b3����Yw\�\�A�m�8$̺s+q�\�\�\�K\�e(\��ןc\'\�\�L Ҷ0Z\�S���1�\�\\\�~���� 	_�V�~&/\�`\��w-��\�1m}\�Yp��X~/\�	m\�\�d\�͞`\�\�̻@�\�#��f�U�+-��\��X\r�&�B�c�{�)\�G~�\�:˲�\�]\�C�^Sg7��{�M�\�#�W��\�w\�\� 0�~��L��R\�.�Oı\��2�\�m\r\'c\�K�����N^49�-y�]B4	\�� �-Vw\0Z\�\�%�Ut�\�Vĺ�:?�h,	~\�i\�\�k}3�M���\��1,��b���t\�:�\�w�\�*\�\�9�_�c���~\���\���\�E \�\��G]9�0I\�B�x�.O��>j	U���\\\�	l�#4�x��Q)�\��EW\����J&ǟ&`�[\�_�\�,\r�\n�\0\�\�K\�PTT�L�ٵ�\�Bإa����8�\���\�\�a�\�# 8oqU\�S=\������1��\Z�\n-\�]�8�\0�,qy�� vj�0ATQK��\0/\�\�R\��\��\0^\�\�6�S�\��\�{�\��Y�i]g����\�ڡwj\'%I���m��\�\�č\�\�O�9�Qw�ѯo�fåZs���\0\0J!,+V��.�\�%\r��@�\�T\�%����\�\�(h\�uLF��y�id�c�\�R0_�4\�\�-�Q\�l�\�\�Y�\�\�U#JSgi�x�\�_�\�Q\�`�O�6}\�\"��ʦ\�	ڇ��\��s|\�z\�U�X �\���\�a2�:�)\�\����K�\�}?\������\�\�	�\�s�� �_��\0ꕅ\�\�n�^7@\�J�\�~#�6��\�2���\0Qm�\�\\\Z\�p\�x{�\�(ܢ�<\�\n���Ƌ\�p(Ч�Lzk2��g��\�s��r\�C�G)���!\�\�\�|@�H�!hN>�S\�T��~Vlu�n\n�#pU\�\�ġ\0uE�\�. �\�^�\�)�ܿ�r\�t�L���\�\�\�9?r��\Z�EF�Io\�CHQdAvF�QPò�\�\�-��EX\Zv:�\�r\"Hm�5�8���A\r\�\�M�d\0��\�N[��\�\�^U�U\�1\�}o�8��\���{�\�!2\��\����#�\�\�\rs�(O\�W\�X\�\"\�(Tsl^��\r�u���O?�\�\n7t+Zk���h�&��oO\����\0��ZY�\�\�K���X��\�Y��2��]�i�ݝ�I��l/~#pb�P\�(ɦ���M\�dFQ\\��d�%�u\�Ĕ�]Jp\"\nJW\0�F�\�\"@!�\�\�G�\�]1���\�x!K�\�`$\'#\� {�W\�c���x^ObQ$\�\�BVQ[�\�P\Z�s=\�C!�,j��\Z�ܶ\�\0U\�h\�n)��y�\�YҪ�T\�\�j�uY��`-�\�3\��T\�\�\Z�\Z�\�\'��\�h\�\�Ǵ\�gH+8�\�TZ9�{\�\��\0\n�u\�_I\r���\�~\�z	P	U�\r\�a�>a��\�\n�B�<��\�}crø�`��Q\�-�~%p�\�\�\�\�b��yO�}E9[�\�_����;N\�ӏ�\��\0�`\�<��\�\�r\�\�US5x\�Y\��\�Y�Nǝ���\�0px�\�fa\"\n\�\�n�E�Q�\�^�^�xh�E_�p4��:\��s9@>)�\�ŏ%k\�O�ĵag��\�\'�L��#JA\�\�\" `G$\�e\�AK[\�LG�f\�Yߒ\�2��Y3\�\�.\�2\�\�\�v��\n\0�JN\�\�#F����#FvZ��b\�t\�J;:ۏ\�\���E�� ]\�T+]\�<@�݁\�\rg\�b�M�\�ɪ�.\�ƪ�#8=�Il)N�\����~!� a\�=\�_\��Pz&Xa\�^\�C\�?�u�V�\�PV\�c�<�s���^F����t��\�\�|[��\0�A�A��3����AǠ���M~f>\���\0\�I��hڭ��\�5P\"\�(�E`,o\�V \�q�\�D\�\�y�^c�Pp�\�`TW	j^ƥ\�\"�\�k���;4q[�4LЙ�A�,\�\0���V�o�9w�\�KB�vO:xaE���|�L1V�PŇ�P�XqZ�!�\�\�r���\�6h5c,�\�\�R+T0\�Z��|�͋2<�ԫzX,\�\��q\�`�\\J�˞���������O�1\�\�͚�J\�m�r6��\�kA|�\�D�+�\�9��f\�y��\rB��/���?\�L�{J�c+�q\�\\��\�\���\����F�[m�k\�-J���*\�@ۘ�\��A��Q�\�\�f\�pJM\�7�\�`�\"eȇWY)R�Üd�s��~\'\�?�z?\�H��5Bw��b�g0f�\�a��j\"ع�QP\��\�LS,\�V+qݐ\����S\nm\�s��I3Vo6�\�\�>�ˮbX����a��\�;Hʡ�e2@b�\�\�c�� 2�Yu\�\n\�e�)Z�&\�d\�E�m�*�5^Xh�#gA�J�\Z�(:S�Xl�Ĵ���1Y�J}�\�\�[_H\�\�ԙҸ�7\\33��1\�၌�\�k�j���e��\�J.<D̙\�\�EX;U\�E1}\�)�E ���\�\�w._��Pנ�\�\�\�\�g�_\�\�\�u?�\��pdA~@�Ѕ\�\�G\�Ř5\�ѯ\�\�1ʆa	ŕ.�+\�\�\n�(��\�-����Z�Nl�J�\�%\\�G��gΘ)��!t�p��^\�m�\0\�&(>e\�c܃]\�\�2>ȧ�&[�\�q{\Z^�\�\�9`(��\�!+\�\�0]�Υ7���\�\�s\�T�Jg4	��o\����K\�R��2\��e\r6��u�\�e��\�\�\�\'�TT�w+��C/��AA\�>\�9�D5�uZ �\"s\�\�\�Ŧ%�X�\�\rC\"�}@,5�:ܷ@]7)0�\0\�+e^x���\�+i�@r��f,�\�\�5e�\�-#�e\� \�\�a���F\�Oln��\�Ҹ\�Y�bU�@=)��\�f�1�!�#��\0�&I\�7z�\�C?�Q%\�\����W���N0Y�\��9���#l*�\\��t@\�\�u�,��Ɓ^\����\�������\0\�`)X�\�\�e��QB\�b;q�\"]8�\�\Z\�7W�)��\�</�\�O�q\�\�.\�\�^\�ԘK\�\�-\�0\�.�\���(\�N\�S��s/owϖ?[k�7\�8�\ZQ���$lb�\�^a\r\�,B�\�05G�b e\�\�A\�\��C��W����\��ke?w(�gȫ�\�3�3&u\0%\�VY��X*\0h��b4[Z^&:yp����\�\0�-�}\�@\�\�E\�D\�\�p\�\�3S�����\0\�U�K\�4��qˀ�S��cu\�h�7�]T7|\�\rzjD�9��zc����2\�\r?�i&�P��\�?0\�(�\�W��**\�\�v{L3ϠCe\\���Y��Ġ�y���q(�b�\0����a\��٠\�0cs]+<��\�\���p��\0\�Cy���(��0\ZP3�\�c�vqdK]���\nU&s��\�\�\�8\�s\�.\�jw\�勱\�B�@�]\�[o}Հ_�p�WJ\��\0P�@���am\�,B\�R괔�u�\0{L��b\����%\\��\�o�ά�\\��<�����C\0\�\�~���,_hy�\�b:\\D=�0m_U�t�<CH\�右϶\�[	�\���%,˛	w)\�\�\�{���,�\�%�=Px6�-�44e|��\�\���\�-��6�VeZ�!cܛƬ4L��Y̩�Gj0\�~\'�?T�0u��n,�z���z^7�ꢭ�qbR=M�\�9\�\�8�<r\�ώ\"�\�n%�m�c�ibS��>em����ʢ��P�_g�\'\��\0[dQe�d���IL&M�[\�eZ\Z\"\Z)k�Bgg-Éޭ M�9�\�\�hUr��7x\�e\�\�=\�FyS�j�f��¶\�3�aM߽0<\�:s{Cw�!\rX\�1r(0\��9�$<ZV�\�D2��Q\�8 ���\���ȗ��\�V��&c�Mn��n\�J�\�\��	PdF�bZ�Gkʇ0��X ��?pıB+�7u�\���\r\"8��\�`J��ΙG��\�vŋG\�|\��e�\������b6�{52�=\�p8fG\�5/\��\�\�㱨73��\�\�I\Z=��o0﹀��x�EQ:;?\��K�W�%��+-H��\�9L�\���Z�`z�\����\�2�J�#��\�\�rʄ\�OGg�\0Q���#��\�2^C��cWV|�.;\r���	\�i�E*D�3�=l��ʃ!]��6\�\�~%\��\�\�C��\�u� \0��w_;�=��T\�dk����2M��P��aUqQp���\")SaAjep\�\�c8-�8��\0]\�\n�Пl?,K`\�L$�\�!�f�$�����w\��DKQ\� \'�%R]״�hW=J\\+z�ͷ\�bu\�9\�\�6\\�w\�\�\�j\�7Z\�2�`\�\\MOn~�,OL����5\�3\"\�Pյ��W{*\�x����`�\�\�?��j6\�u.p�\��\0q�YԸj\�J�Eɬ�{_\�oO���پeD6�8m^`01\0\0{sڌJGh\�tJ��r\�H@�G���3��|\���\�2̐&�\�\�Q\\_x�\n\�\�Q��\�\����7k\�eY�\��7-\0g��\�˙�\�\n����U\��̶\\�c\�r+�\�\n\�Q�~���c\nK\�*�\�\��L�Vp\��\�\��\"Z�\�dV�Y\"]�bB\\{`�\�����Pʎ\�:{@u����\�\�Q,\',Tqj\�}\��A|vF�\��\�5�=�BՎ\�x�*.\nodK��\�nP*\��F\�\0\�17L\�7�e\\����L�\�~$y\�(\\n<B*��c\��\�\�\r.�\�\�|�\�\�\�\�ҨY\�?`~eHE@Q}\��@��p\��|��W�̞#�\�\�m@2l<LBrP[KSX��C�\�\�{�Fgp/\�\\\�\�\�N�\0�U1G̵,\�Y\�O�*�Ծ�0	b=�E\0pCT8�c\�_Z)�P���X\�Fd\r��qBb�!\�\'nt\�\�\\\�	˞ �Pl4�(�8\�;|�]E�\�כ��l(�sg�\�yT& ��0�1h�\�Tm$!tK�lN�&�t�ߒb{�\�\�eJ�.ǧD�da�(�\�*b3�\�\�mj\�~�\0H �7u6�����W��\�b掱̻�\�xh:Y�>�UQ�Y%�B��,)XR!m�\0\�T�\"/(^�l%�U m\"�MW_ܢ�j\�,>fjaO?\�n\��\���4z8e�Dt\�K@u���Z�\�qT4\��9e�!�b�4C\����\�?T\�\�\�F� �j\�P�f\�k�e�\�P\�\�\�h\�f^q��P\�Я�&%�~��~}�@!��$\�\�h{\���[�ށ����솧\��\�\���P*�7{T.�WQ�\�z�HHKsl�W\r2�\0n	��Xqp#d*����l�\�Pȣm�s��.\�\�T\Zjw�k��]M\0�9�|J2��ʴZ\�yZ�\�ĐЮk\�#ik�\�\�(\�CԤ�R\�ƠM%\n\��1\�E\�\r��3\�\�\"Q�y���+���?׈ZDQ|mF\�\�J�\��bB�,6\�~fV��!H��$&*텕\�\r�]J\�O\���\��\�9�-8��P�桘(dG�\�\�\��\0�iRUj���yΟ\'rق�7��`�k\��SzQSz,\�j[5z\�\�\�⼊<V1Q�&\�m\�\�	UEb���+ޚ1e\�3\�q{f!N�`P�9W��\�6�z��-h.\��\���`��4>�/)B�r�D�uqi8�P�pJP���\�Cg�2\�qV\�!W,-ł\�nT��+^��V>=�^>\�\�I�\�g�o\�i)k�.�W\�\�)�g�i\�^\�\��\"\�17���0D���\�O��\�\rj�\\AxS\��*fH2\��\�T\rS�b\���má6r\Z�����-\���\�^V{���k�\��P+Cw}\�0�L�?�d\0Sam�\���]p\��\�\�I��\��5i�\"\ZT\��\���#f\�\�-M\�}\�V)Dv�cD7_�[?�N\�E\�9��0e�\03�yS�\�}\�@�)gr\�lϠ.�i�nºk�\0\"+�4V\�\�;R\�a�j���\� 4u�q�1�r\��@\�]ܱ\'%\�r\�3ܳa�\0�9�^(�` �.;\�,\�\rЭ��T�F��}K�Z�����K��b�\�\�C�����!��IBEnH\�\�\�\���[6�\�\�1��q��ˋ4��\�\�z�}�\\\�q���2�\��D)�e�h.��\�rݬ�Z�ܫ�LD\�q襢��+.\�$)�i8�=����RY:�����1|�:\�ba\�V\�4\�\�\����G\�\�7T\�${�\�-k\"�?�����\\ʉ8YUe��Tq\��d�[ܪՎҩ\�<��n]J��\�pYp\�ǂjo�\�e�8�އ\�/�`\�T�,*��\��\��\��\�dd\�b\�\�wEO\�i[WR�W��<\�\�[!@x?\�V�\�2\�z`\�\"�1TV9`WG�\�a$���̴�	�)v\�u\�0,�)E��IR�%�\�[�0\r�Ս�\�p\\<QY\"�Q`Ә�5�t��D0\�w�\�o-/�\��\�)�\Z\"\�,z\�&TC���Ml��㽎x�x�\�\�v\rLW\�3��\�*��χ/��ɏ�\0h�\�jK�.\�\�_�e\�\���C�eq`�z�P[	�Go�\�X;�h�lV�\�vʐ�i�\�jQ\�56�P\�dyDd\� ��\�1jy\�6�\���eM\���\0\�\�(�8�b	y\'nV\":e�|P�\"�\�dd8�Au\0��y�\�JN\�`�\0Z^kٹ�)�3���-T�F\�\��d烞z*�A3[/|n2\�+Rn<\\�����ǩ\�\�C\�1���c\�\�\�\�\�4P�\��3�\�-g���\'9k\�Sm�_�*\�\�g�*`ALh\�\�\�t������Y�fCG\Z���R=F\�i\�~^m��\���\n4\�\�\�l\ZO\���6��F�\�$:H+;z\�_V�c��-W\�u)�K�c\�\�oɜ�k�\r���Z\�tn ���km\�\�,	d�\�\�w�FM�\�\�\�\�K`8��\�E66<T=��\�6ېŃ	�\�,���0�n\�t��{sq�y�\�S�\�>�[�I^�+K�и;�\�2+�\�\\�(C�\�f��n\�\�C#	q��&�����\� �\�%E\�40\�\r�\�\��RX����_�\�%�+�\�.X\r�\rg�\�\���\�	R�+9�s\r+;�_\��L�/��Q\�a���3�V��R\�\��{��,,\�\�/��,����P%jv.�ĥb7n\�\�\�\�\� \�̚���V�%�[[\��q=��0պ�c\�	�\�SQ\��i״\�\�=K ���\�R��y�j9 �\"Sx\�\�\�1c;_*P\�h��\�K\�r[%\Z\�.��,��r^\�+���\�cԭ�\����\�\�\� \�\�LpQe�\�\�UYN<c����+uU\\\�%2�R�(2�򼻧ͽ\�z.a遰\�\�J�\��	�\�\�\�Q߿�,q�\�\�ф\�\�%J�p��\'���\�M	,`�G{�Ew2ER\�.5i�٘mV+9���Hch�\�\'�\02\�]\Zۥ���6�^ԿO�^H\��q��6YEڼ��ɩ�\�\�X9ҋ|^���ouhb�{\�0#���\�5\n\0~i3\�U\�Dƥ\"��}�hc<�GvicV����\n�2��en3��D\�^P��\�\�Z��	����\�0G�QZ{~�Z߼s\r������׼�P\�2��j�[�_�3\�2\�ƣĳ��[�R��,[�B�Tc���4P�\�qe���Z\�0؀]	�C\�P��uZ��{1=$\n�\��\\�[lK�\�&X^U��\�s�\�\�\�P\�Π�\�ѻj��mbFe�\��l^6��mښ�\�_>�\�W=�]\�\�\�S��oֽ\�J�\�zrFx�d�<6{C�\�E2�^X�\�\�R\������e�\�\��2����\0;\��3(\r�݌p}\r1M\�_p�\�;	ݾW�Êp�<(\'��Kb�%4\�⺂`�n��\���\�Ѭ����\�!\�$�\Z\�\�-�\�P}/\\\�Z��.\�j���\'�`���xG@�\�\��~�</�H�����\�A|`���s�W�\�	�-w/T\�F�(S��\�f��L�b�O\�p\�ܽ\�pP��ߣ����B�@mz�\�\"4o�`r��9�vpC�u$y\�\�\�1Vߜj�A{���%Q.֬\�[�\0z&,Qo7��jV\�=¿T7�\�1@/�J\�\��\�%\"�7��^$�D\�yU%�����*�X(�k�r\�L\r\�_*}��t̤Fk��ctio;bW8\�7�.\"���̸>�\�\"\�ty\�\��ׁ\�$=\�\"���M�\�-�%�P�M\�\�\�=�\�<GOа�\�k�*\�\'P]A�ǉ\��\�\r2\�\�A4�6��/\�\�\�M\��\��(�\\Bkh\Z�\�W\�\�,�/6fRrY`~ˎ����Z�\�\�	�e�W�x<\�0<��\�\�\��hP\�\��\�\�X��Sw\�4\�\�NqWf��\�\�<߈\�yh9�r�UK`\�r\�d���\�\�U�q�W9\�\'\��(���~&s\\��T��J���X\�z1����TJ\����)��&\�\�;�;�.{2�\02���\�-�Y�\�mqg\�\�+[\�����\"\�\"J���K�\0��@\�\�i\�\���g�<\�=��hU��Կ(n\�E�Wu�x1�,7��\�su\�\�&�Rᬧr�֨�KEy��\�M{�\n\�W���Cph�Z!\�H\�6%f�h։r�\�[i�l���e�\�9s\�v\�mm\�\�x\�kl��0�K�ϣp� \�ҽ*$|�\r�h�\'L�(\r\�\�\\Ja%�\'\�(Ù��J�`hu\�\�\��+\�@���\�ը|����8u�\\�)���\�a�\�8%�\�,r/�\�?\�h�_\0��*��\��^�\���m�yY{\�o�\���N\���;穀|�Z\�\0�\�\�\�\�c�Rh\�f8O��\�6��\��Yx\�2�&�*��ī��\�\0�\�&fȄ(5\�\����H\�\�\\j\�ܪ�J\�]�{=�1! �i�\�\�\�\� �\��8�}\�,)_����x�/i�ޭŜˉ�|�!�X��2Ǝ\'<��a�q-X\�Q�\�+Q�4<ŷ\�\�ۼ�\"�\�/\�\�\�MN\��\���0�x�x \�D�5�~q\���/�d#Df�����-�y[\�<�GF�\nR�m¤<#��w\����\�j\\)\�ޥ�=�����\n�۩y\�#�\�*\�(�\�*a��Է�V�˝T���\�\\�V1��\�/E\�D>g�8\�w�\�ߛ\n��Ό`�tE\��9c��\�\�\���<G˷������Y\�$>���!\�W2B\\\"\��C�V\ZE]\���\����\"���-\�����]�O�lU\�\��\�܁���7\�_\�\�\n\��k\�\��%��ʸ�ʡg\�\�\�\�1\��\�Y�Y|`鄿_�~\�Z>\�A2Y��˹U*2\�\�<Ev]n)��\�̍WM�\�\�/�&\�\�\�g�_Ĺ�[�s�Wx��ʰ\��Y�W�5���6\�;�*�e\�kvts�p�Ҟ1�\Z(�g\nw)0f#\�W��5n�l񌚯2�	U���ѕ�\�\�(l)�CO{F\�DX��?\�0s�!\�8���fX`�+h�\�>\�i�(+�dm�b�3u���E\�nY�i�Bͅn\�\�ĺY�\�\�9C�wL\�EA�Ǽ-67o��� �$.\�\�m?1!\�(NW\�\�g\�]�(B�\�/4�	R\�&/\�� ))<��⒌��!eM�M\�lR\�	\�\�\�M\�@�����\�+�k�p{K�nᨾ㨗�\�F�!�B�_B���K�d� \�\��|�\�\�fʱ-w\n�X\�\�3�\�\�f0[[�Y^ӉMN\Z�/�\�\���C�@�u���-\��َ3����\�>�ŗ����y#\�j�\�o\�R\�`�2ZM�Y����9��\������f�d��i\��JH\Z��@��\�A\�Ѫ\�b����\�\�T6 ��o�6u��\�-���y��E(co9)�\\A\��L�6$k0%&\n��8c@�\�@\�\�v\�L̪V\�,�R���\�^�k\�\���\�#g\�z�Z\�\�\�y�$@]1�3�����ïG��\�TՄ}��!�\�w��\�&�d�i�s\�{�6]�\�z7\�� L_6\�>\�\�b\�\�!IW��1��y?.V����h\"Z�e/=\�@�\'n9�<D�\�K��\�K�\�Lyx����%�\���h\"�\rҋU�o8�l�\0 X7�_vkLF`�\�\�X���\�\�A^ �\�R����9�\Z�&�\Z��j\�wĉp� \�\�ĸ2\�\�&�GSI�z`�\�56BU��96,|0ZE\�Pi��A\�g�Q\�)�\�\�t\�\��\0w5�V�\05h��o\�XA�\�\���oO�]G�@˹u�7�R�Pt�{⵮\�\�\0��-@z\"�;\���̻8Te����[%\�F�\�\�\�±�\�l�oA�*���@�_,\0�\Z6�#_)wUN#A��w<�\��\�[擦/��)	(��\�^!����=���\��U^\�ܥPaO#\�\�-@l�k�[\�ۂ��E�L����\���@o�\�\n,8\r�d\�P�צ{�b�)z\�K%6}B\�F??x2��\0�>e\\i_0 Sq:B�8G�\����|#��q&�8�^�\�\�	\�߈\�]iKE�rY\rP��/Vq�e�$p�s�!\0\n�{W�o:�\�Aٸ\�8�lo�\�\�\�\��x0\�\�\�\��\�S�Q@�g��\�d�)X�\�us\�\Z\�\�F\�0j�\�v�\�Ŭ\Z\�q���R%\�\�qDn\�>�+d[�r�q_\�\�\��\0psGD�\0pxO0\0���˅��\�\�$�&������\n/\��������s8�\�_\�pN:o�z=\���	KYA+��h\��4��s-\"�k\�(�z(Sjk@$h\��\�p+�8���X49\n���\�\�m҅}\�4��[3\��RNS����f|?�}��1k\�V�!Ӕ_��i5��s\�\�!M�\�\�\'\��\�\0aj��Kʑz\�ާ���\0Yil���օR\�W\�\�\�Wu\n�p\�\��W��Cr� \�]b��Mk�q\r ���� �\0�Ej-�\�\�����_Ţ�\".l�n\�\"��\�3iZ\���K\�2�\�Cxʙ\"B\�/A�|�\�ip\"\r��d.�C>\�#u��h�lŸ�0���;!�\�7=�\�\��K\r�\�X��t�\�͛\"W���w,\�\�85���QZ#�\0����+\�6`_��\�8Rզ�Nt̰\���\�\�L���[\r�\�32s,G���\�\�\�\�o[�P!\�S��$3����\�c�]�AE��!\��p\�\�6���C<%\�\�9I~i���pq×�\�7J���C\�rK��q�\�/r\�B�\�\��`���o0\�\�\0\�˿\�\�)���\�P�\�u�\�\���EMK\rD�����T}q?�\�\0\�q\�^\�+~\�[�\����%UOl�U�QW#^\�b��PX�L�\�k\�S�\����KĽXm\�\��tC��6�G����\�Pw6��\\�����\���FQ8�\�g3�<\�\�Z�GP�\�a�Bǅ�\�ӳ;&r\�i�\�wS�y�y�4\�\�9�JH\���3>%%`C7*5�\�īv�H�#h+��q\�J\��U�ΣZ�\�0�㤱\0�+�U\�\��s	�6d�A�\�\�!U\�C�@\�U��`�\�R�U\�\n\�\�g8q:w�m�4\�>.p�m�F��E59D�lHf\�\\Wk$V\�!�\�N��2@\�\�\�e���s���V\�,\��cj��\��\��\�+\Z\�\�)EG\�p����T@�s�\�V�\�W\��\�yX�+j�\��\�b�ܶ@����\��_�x�2\�O��&�\�\�\��B�\0٧8���|*�f�&#�\�n\�X\�\�\�b\�\�|~�e�#\�fPT\�\�^�kQ��?�6#�\�N��s�C��<B\�AC\�,��\�g��c\"\�\�2\\@\�����\�\�4\�8��C\�\'�_�#y\��\�vD��i��� Q)B��p\�%ۈ���\�����]�c�\�*�\��\�\�b$-\�!\�\0k���uoZ[��$\���~\�I�7g��%���S�\�?���Px/�ψ8u̮���)�\�AM9�#\�]	\�\�37�\�.w. Ƕ@\���4�T{\�ʟ,\�\�*�\�/&4��B\�ʺ�<7dd[\�\Z��P\����\�S\��\��*$\�\�4!`\�خ�ڙ)W0R�G\�\�\r\�m�\�vP��u\�ꞑ�b\�\0\�3���Jf��\�8��\��**�=�\0\�Q\�\�\\����\�Ws\n3\�x2\�\�Q\�T\�\�\�\�!\�̻(�\n\rn�e>$|�#�\��zq�-\�\�\�	Sm��\�5Bؖ\�p\�\��\�\��g)&\�d�=0\�UK�&\�e�E�r��.Ý1x�^肙j\�dW��\�3_\� @ ��ye�\�\�>#Q`a�\��Du�l\���e�\�ϓ��l2y\�\�\r#\�\�	\�\�^M�\0r�o��ؿLŕ\���|J�\�k��,o\�%���T��\"�\�\��$\�}C�\�.WP-8%�RW\�ccj��!�\r����-&S\�2��!\�\�0YL\�K#\'�Q�6���N\�.\�銠\r\�\�SZ����\n\�`	Mu\�v�o�|�.:\�6�\0\�-\�P�\��\0�/\�\�\�\�$\�U��\�ߙs�\�#XV�_r\�KgOS63�\�>\�Ki\�\0��4�߼�\�\���Wm��x�\'��n[%IX�a\�(�s9A�b\\2�1#(\�\�Q:0CGq\�-H�ÎU2��\�X\�ˉ��+jf��\�\�Ϩ�*l\"��F@�O�\���̵�b/�a�j\rOb�W\���_\�,\�-~c�����X\��slY�@8!\\,�bb!\r��_�Hlc3��	Ɔ>��hS�\Z\�\�4\�X��\'�x{aOb~豎\�%%C\���ۙ�\�\�\�,�\0*c��\�\��EA�\�ĺ\�\\�y�ȝD��\�V��\0��[\�s\0\���%Ы7�3J\rP�\01��%@7\�v\�Ů���\0dwW�\�/Ԑv\�S�\r|	���p��\n��@x\�\�\\Ȋ�1\�:�s�3c\�1\�1H\�j\�.\�%P\�\�R+���1�#\��\n7\�U\�*\'X���P�[Y ��[l3�s3�(�\�\�m\�(el2��u��Q),���:����ˮz!\�M\�v%�M�i�M�\�e\Z�{!�\�3UwL\�26NN��\�u9�hRY���\�(�^\� ��CY�\�2�\�POy�ퟅ�Q��.]F6ʨ)}E����\\\Z\�i�\�2\�6|[�\r�f%�������5u).��g�T˗\�7M)�D�w�\��]\�r�\�]M\�\� @a\�\\\�J1\�%M��\�\�dBfM�A*�f9p\�\�\�e\�\�7�v\� ,�\\�\�����Fb����\�V�^fCC� �\�!-�\�\�S�T_�³\�mu\�)MV�\�2˥���ĸ�El%��*�`i&�f\�?1a�����?ܶ\�-Ss(bRH2[u�+�\�bp�V�\�eHx��\r1�`,R���\�ڎǼ\��>�P\�<��\��\�\��Ř��ؾ\��A\�\�&���%\�\�\�R�F���p	ǥ�0�mH.�\Z6��c\�p2�	��\�`e�*%N Y)�\"}��\�_7J�*be�LB�7/�Gu(\�(e�N�*p�\"X\�8\"z\�no�M\�J�f�2\��hR\���\�\"U|Us\�e��<@8�op\n!�\�z+Ũ\��\���\�F!�� �V<s\�\�\�;\'S\n\�YP�(�\�Q*\'>�\n�����\�(�\�%@F�ZF(��Tf�\�\�t��ֈ���\'$AW\�\�w+A6����\�	�\�\�z�pP�`����q�E�%R\n\\���,4GFHW�gqf������A�m�\�ϡ.�\�\\X>c�7\�R�\��.R���h){řtJYG��\�\�:�Iq�Ƕ�\�\�IT�\�b3�#s:`ڱ\���|��\\\�72��@\rq$~����|�%#�\�-�ʉ�`H\�)%�f&6�ƻ#�=z��\�~\�E�9}��\�\�*+l`�AK-g�;\�6\�%1a�\�e f(\�؜����\0�0�<\���_D�Dp\�Yi��1�\���\�/\\�����C�b\n���LY�Ǿ*<\��2\\\0�S�ةus� �3P!��j\�\��%�\0;�y{K{W*1<\�\�i��{\�?b\"�ĳ\�^���T�IUг\�b�K:�Yؽ\�L�K.J���qb�U\�\�\����\�d^�����ŗ\0W�&\n\�{Jݝ_0U�\�\�\��%�\�\�X]�\�>�\�4\�[����d�\\j4Jي踅]\�F�U��=�\�\�!�R�\���\�5�\0?\�1p�����G\�mBu�6η�\��i�>S\�ˁ�\�T�o쪁k\�J\0f�X��\�fm�� \�@�3R\�pa�>U��ŗ\�~��0\�S��T5\�)\�\�\�0`\�p;���v^&_0O)\�`B�7\�\n�ǹ�\�T�NZ\�6CW9�F\�*	Vo!�*C\�h�q�\�d6\�\�>\�N�s�~\�f�������\���R�lFl#`k.\\\�ƫ\"y-pk�\n�@t{��\�~\���\0�NE\��\0I]��ϘnS��&F��G>�A���\�Y)n6^\�,EC\�-WPl�\�\�X�	j\�s\��Dơ\\\�Wr�LO�\��%@�dFEц\�	P����#�\�=\�f�X \�|\�p�0�H���{v�%��r��\���\�\n�e���\�x_��:\�(+��D5�ŤE��T��^�\�7?dYrX@�\�\n�gb\�\"]3�L\�t\�\�`�2��\�\��a����\�+�F�\�;��H\�\r�\�/c��b�Ŵ�`�\�2J�z	Ĳ)ML�R_�\�\�c$P\�e\0\�\�kE���\0���z��H\n\�Ms.8\�\�\�d�\�\n	�\�\�&\�\�\�겵����qm�%\Zk���0��Ju��!+�P�#�\�\�o&��W)#�0�%�\�\r8S�\�v��L���\�Ѣ�s3�\�=c��q*B�\�	��`D�\�h�GtWP\r�Df�r�ص��\�\�Q9Uq�K��Qd\�\��\�^5��7SX\0;x��\rT�-\�5c�s��]��\�^\�c�\�\��a\�b_Vk��ʳ@4���+�\�*��2|&1\�*�3)x\�T�+�M.Xxf�\�c�8��]g\�M\�(��Ϣ`f���������K\�4!\�\���˸\�c#�M���\�/�ģ���c\�S\�\����-(/��\��Dtڔ���2\�\�\n��\�n[Pr2\�N\"[=�.�Ŷ��+-��4R�Lʪ0M(;�q�\"�8/d�fD���F����\'�i�z�\�\�Xх�0\�\�\�B#��\�\�\�\��\�� �ĻWDA/��?�)���D#o;�q	)�\�<a���qT��/,�M\�PĠLMs,�Ѧ0���\�\�/2\���N#�,�\�p\�R�$\�E)\�!X9Bi�\�j\�\�e�\�E�D�Ÿ>�\�1\�\�!���_\�\�<j\"\�o�&�\���\�\�w\��*Nhu�[�Ls\�`\�l`\'\�>\�\��ː���n׶zl�n\�7m|���ĩ\�d�\"kTR\"\�\�i�l��ԑ\�-N\�џ��4V���iq��g0\�� \�\�\�e\�\�`\�\�\"wr�R\�b\�U��\���Hef6���\�	�\Z1\�a ���n\���\��\�*BQ/0G\�bB�\�\�l�Al@fݰ�\�\0d�`���x�\��#z�=\�\�*\\}T3s�R�(E\�	U.)u���D=z�\�*�\�\�v�4J7/=\�$�ٸ\�a�\�epа^\n7��	\�@\�/V\�,bj7Ě� .�k\�Y�`?%�\��8�<B��������3�bj�|K��\r�`c)xIT\��:q\"\�\0���7�v)}\��\n�r9����*�w9�o�&��E��{79f|\�Y�\�H�\�\"�ш��@0Q���\Z\���v|1S��\�F0\��.#j��\Z�R�\�߄\�0��v`��c9�@��\��\�\�t��Um\�ޥ0�\�\��Jp�^:`�\�3�����e��LFڃKHSs\�ˋ�̺�>b͋�4\�(*��7G���b�\�`\0�G7�7\Z?A*5pW�)q��a\�D\�\�1���#�t~\�i��L�\�򀰺0>�r1\rE�E*<\�%\�7\�n\�ʅ�ᕨ�H+Q�� \�CR\��IT�a:\�\�,����c\���!\�\�0�q��Y]�h�\�\�\�k�ox�pKA�\��T⠍�Z\�ΰ�˰\�h�l�m\�c%@F=g7��\�4\�\�\�q�s]��M0\�j=>f�a�	k�\�a�:��\�<\\yl�,�#U�ϙ}�6�:��+�\�\�P\"\�V_X�����\�e<\�2�ߘ\���V8�\�\�\�5\\�\�<�\�@�µ2\�`��Q�e�\�׼A�f\0sr�%\�\�ޠ��%f&P\��\'��d��DB\Z\�\n\"�)�019�ۘ\�.%�\�\�eg��a���	W!���\�T`\\9B\�T\�\�+(5\�ߘv7M��\�\�\�;����\�p|$8M�q\0k\�R�\�	�/܆ G*!\\\�(Q���s\�	C��\�Fnf\�2�E\�\�0\�t��̦a�*t\�+1X#�0�י�R�\�CD(,str�B2�`���ͦ`�\�\�.�Kv%lu#S,oS25��\���+x�R��Q\�&d\�pT�\�m�[.,[�>�Rh)��\��\�2G]J\�Th�+\�\�\�3\�\�ۊ(W\��16b,��\\�{?H�n	̻Q�ڥǆ\�.\���E\�\\��\�-Y�E\�z%P�V�\�ɰŷ�\�>�\�	Q5#\�\�}\�\�aO��3j�\�.3y�\rAP椸w64).�̵���4�7\�A\�UZ˅����p4��c1\��\�Ee\�\�҈\���2n��\�E\�\�?DoI�� �UӘ��XD\�8�ȅ:��]ʀ�L3\n�\�Kb\�O,ķp.�n\�\�){\�ͱmk�\�.%X�qq�,l��	�\�I\�u=̶\\;c�\�j.b\�q��L-�m\n�9�\�ľ\�}\�\�%`��q\0%��f�\�\�K���\n\�.	\�H�֬=�1�w�\0ff?\�\�c��\�]Kup���KL?\��ɫU\�r��`\�_W*Z\�Ñ\����\�G�PW,\�I�D\�]Mn�n�G�@\r�Zis�x�v\�\0,sx�^]\��h��,���\�y�\��\�\�W\�%�5,*B+�\�/��`C\�d\r���\�2o�}6G�c7� �L\0>�\�\�Y\�\�1Ha^\"���1\�\�\0��>e`�\�r9�È`Z������h\�\�q�\�\�B�S�9�\�.�c\�,Q\�z�d�\�\0ttC�5ӝ\�G���2@A�x��e�1\�H�o2�Ԯ�����%a䕮�rXCy�(\�\�_��\�.�9�f\�\n��a:\�z���֞\�\"\�T�ma��.=�R\�\�E\�\0m�$-0\�:^�^k\'\��,�L\�\���\�`\�ŒR�#7K\�\\\�!�gbm�� [7j��u\�s\�mߔ�	z�\�![ƻyb��\�36��G1SGWS`�\06˷�P��f�d�[̽�\�Ģ`Ɣ\�\�n\Z�,f,�@|EeQ,�Nf���Ef�\�\��\�s\�&F�����7�P2^l���[��\�W� tdhG\�\��O�E(j��\�[B�\�j�����\�.\\��n���ul� ˏ�e\�\�b�W+�&�/I��y\�\"�%\�\\�\�=ғxk\0|\�J� \\և\�\�\�\�6�\�g:�\\\��\�=��I_��k\�UL��\Z\�\\]:�\�a�r͌��\�\�wC1\��ڥߒ��\��.*\�2\�|��\�\�\\\�:�jmE\0oX\�\�\�(Q.0���H\�]K�\�\\\rJ�i�v3S�L^\�Z�������\'ᇻ\"q\'̶�1�\�}�\'\�^\�l,$|̉Q�87�\�R\�W\���0\�P�eT�2\�\0�\�f\�\�N�l=\���b�3\�6�M��\rRo��\�\��ç\�̌L�a�5���?\�r�L\�K�\�\\\�$fxX��\��2\��o��\��Z�\�\��B-�є끇\�Wd�s7\�Y�\�\"c\�\��\"\�w!�\�;�8a�&;<\'	ԫY�����ag2�\Zqܬ\�\�V�J�Q؅`�Ex\�Ur�Wl\�>�pP�\�\�T�\r�\�\�a�\�\�\�x�eJW��a��\�\'��[��̭�#�\�;�	`IJ\�9���͜\�&x\�\n��\���\�\�k@\'�N����\�]̾e;DP�\"\�1���\�|$\'T���x\0;�\0�<\�X0v�,����\�\������.:��n;:�@�Q\�JԌ\�M\�q�x�N3��A�~�S�\�7��x�I�,�\�+��i\�B\�X��3�ԃ�f:[\�٣����mCX$��\�\�#L�0\�&�A\Z\�NR�̠\�\�\�<Eq�;�		ZR��>�T�9B�&	�H���]��V\�\'ԭ�x�<�bf��\�%��7��Σ\�|\"��H�\�\�$|�j.��3\��\�)\�\�*\n�ۈ>Nطr�[�\�ʵ\�0�!W\��3?��+�\�V\�s(KW9�m?1\�w\0\��4�s4\�]px�\�IH��7��t\�dDOŨ\Z�\�ާ4B\rv.\"�4\�T�K��p\�i�\Z5\\�w\n��\�\�\� -�O�$[<\�2��bg\�Z\�Z\�؇��!\�\�\0Ce����9��\�\�:�]\��,�xs9�W\rXڷ\�,��c�0\�p>}�\\�<J\�BW�A\�׉��\�\�%\�@��`\�yA�g�\�\�9o�\�\�\�8\"\�Z�\�f(�3>OR��,ض^\"�\�\�:̤\�0~ �+L<Cr\�-\�vy�Hb#��\�Qő�\����Z\"��\�-�\�6\�*��\�p4zqE�y�V\�Z\�\\K C\�-P\�\�\\9��I�5�FK2\�J��&!n\�1R\�U0��\0<8�(�}�_3\�a,/x\�$\Z�Y\�+	11��	b9�WĻ\�K\�>\�\ZՉT�ȘG	8\�Y�S�p\��x�%0�x�s]\��۹w�\�7[�\Zc�2�\��ᙟ)\�.}[0\�f�\�H�P\�q逾%�F&T,϶\�\"�2K�)\�-V]wqZ���\�^c\�\�D\�\�<�Rͬɸ\�\�,��́�O��\�|�N\�\ZL�d���\���\�$̭��Dx�[���tua!�8\�g��M`�C,Λ�\�\�1a��-˸�z�\�1\�\�qZy�>N#P9cu�\���#�E�8\�y\�OaD .АJ?�uԱ|b��\�\�\�\�\�Y#F��f�I�Y\���2\�\�w/#��}2X8C�0�0��\�W�����6O��\Zg�OEC(\�\��{G؁o\�a\� օ\\k\�\nedvU�Ê�%�Z�B�	�&(2��]G�V�B\nc:W�\�\Z\�Fॳ\�C��J�\"�\\Ppq,7����\�XŎeq\�6\�\�.�\"�Ŗ`y�Źay�VqFǑ�:�ĖV$;\�[s��A�\�DS8A\�+-)��\�<FX�\���R\'	^�\n\"\�^e\�8�\��?���P\�\���	��0��i�\���}ȝ�}�`�\ZNG�Q��d�aL�^be���\���=�]Lc!���\�3�=\��<7P��q�qK�D%�\�6�\�J���i I\��a�*\\TJ\�K*f6��Q{�k�B��ľ�ǣ\�,NzE�h\�Ã,ýsd\�E�IfgNr\�ls�\�g7����^#0ߖ�勘��-�gV\� x���u�\'$\�\�\�Ӗ_vZ�b\�=\�Zӱ�\�񆢼5��L#��D\��s;�ua��Ŧ̟\���@�\\�$�;�`Y	��?0�33���K\�\�|w`VA6����s�\�q\r\�\�#L̦A\ZC���\�<��]Dݳ��w�@[<\�\�R\�P�\Z���\���WG��4��E\�\�#	U�\"*nd\�+W�\���\���2�ce\\��pƘ��	��yu+P+a\�qS/&p\�w(�L=)1+$�e�]�b�@�-\�,\�v�^5	Y��\���{�D���\�-\Z�L	�aU`�\��B�\�W�%�\�-�1Ő��\�y�2\�\�*\�����>%/W�\�+\�E#8w\0\�ʴ\�Pb\�54q\�Ĳ\�?\�t�ܕ����D\�J��G^�7��\���-�K%x�e�oh�s��d,����3eUJ��	wm+c�z�\�\�@��ծ\��Z\�	K`�\�m�g���Q\�����-J�B����/0e\�c\��[����q\�w\�U�r싉�p���\�s�CD�9_\�2\��/Liį�1V��`\�\�f��\�r\�-�9��^fn\�M���.���\�q���L֥\�d=���N����\Z\���\�0\�\�2\�\�\�k\�)\�LS:֖�\�\\\�\�\�%zd\�x����㷼�\�\��G5�X�\�\'\Z\�(7�\�e�1��\n��\�L119 ˧\����3�z�\�F�+i���aELc�\'5\�oL^\�̲�*��D\Z\�\n��%��\n�\�ׁ6ibvD����ԙF	R&1\�\�Fi\�Ʃ7\0̹�\���͖�i\�\ZD���bX\n�\�\�`�\�~�-\�!@\�!�L�\r̖\n�\�\�k�S�I�\�\�\�\�� -\�,>Y�\�Љ����8h�7�Ls�,?\�\\V�\\x�\�\�U\�hn9!Ǒ�\�\�ԥ��o�ӎVv3�Kl����HOHQk\�p�\\\�\�0ߡ�\���\Z�rR���P��$,\�ܑJ#�覂ivZ�O�^�\���m8�3��x���\�ZZ`ZK\�\�K��&8ck��\0�o�\0\����9�\0�5\�i\�����\\���ٚ\Z\���\0�\Z�,v��y�p\�-��@Z\\f��O\����z��A����զ����pn\0?+�\��\�\�el8��Elg��\�\�>��\0Nj\�1�\��Yt�\�q\�\��\��%.DXd�˰t�\�@\�����@T\�(�^�2ђ�`\nA>hȝ1��z\�\�.��>��(\�Ħ\��d��5��\�[���-x\�;#\���\�\�2�zx��\�\�,���x��2\�\ZȖ�ֻ�͍ar]\�_�\�W^f9�x�\�8-���m�x���xr\�\��\�c�\��\�\��\�m\\odP^נ��\��h��\�Vz.�\���^�\����u��4I~?��²?\"O\�2�3���U_1А\��e\�\�kW\�\���@\n\�{�}���]\�4Y\��\0\rir�w1\��\�������tR\�W=\�3o�_�؞\n�9s \�\�\�p������?ᡩG�\�\�u&!_?2ُ\'I\�\�[\�;5�y�\��\��|y�CB��*Ӄ-.G�H�\����%�J\�_��8-mڮ4]�AZZk�(��s\�\�bѷ@�\�\�\�`�6�\���JSN\���f\�\�t�(Ѝ\�	�V�\�j��yԭ\�����\�4t�\��r��!A\Z�\�BT����\0\n\�Q<\�\�\�?���\�v�:�A>\�y}�2\�<I�aO�\r�e�0�E��\�,\��s��wӥ\�l�����_�0�]L�>!\��\���\�R�\�\�\n@\���\0\�e\�\�m���?��\�s��6�WN�c���\0\0p�äcF��#\��\0nfB�VI/��<�9az��ψ�%+`��LE�~���ĥ�\�k�ܯE#����\0�ĠY\�K%D�~o\�RA,k��\�#�\��)�\0��\0�\�');
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
INSERT INTO `documentoadendasretiroproyectos` VALUES (2,'24072017 CA2.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','PK\0\0\0\0\0!\0b\�h^\0\0�\0\0\0[Content_Types].xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�N\�0E�H�C\�-Jܲ@5\�\�*Q>�ēƪc[�ii����B�j7�\�\�{2�\�h�nm���ƻR��\��U^7/\�\�\�%��rZY\�@1__�f�\0�q�\�R4D\�AJ�\Zh>�\�\�\�V\�ƹ�Z�9\�\��\�NV\�8ʩ\�\�\�\�ji){^�\�-I�\"{\�v^�P!XS)bR�r��K�s(�3\�`c\�0���\�\�\���7M4\Z�����ZƐk+�|\\|z�(���P��6h_-[�@�!�\�\�\0Pk���2n\�}\�?�L\��\� \��%\�\�\�d����dN\"m,\�ǞDO97*�~�\�ɸ8�O\�c|n�\�\�E���\���B\��!$}�\�\�\�\�;{\�\�\�[�\��\�2�\0\0��\0PK\0\0\0\0\0!\0�U0#�\0\0\0L\0\0\0_rels/.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��MO\�0�\�H��\��\�ݐBKwAH�!T~�I\����$ݿ\'T\Z�G�~�\�\�\�<�\�\�!�\�4��;#�w����qu*&r�Fq�\�\�v\��\���GJy(v��*����K\�\�#F\��D�\�.W\Z	��=��Z\�MY\�b��\�BS���7�\�ϛז�\�\r?�9L\�ҙ\�sbgٮ|\�l!��\ZUSh9i�b�r:\"y_dl��D���|-N�\�R\"4�2\�G\�%��Z�4�˝y\�7	ë\��ɂ��\�\0\0��\0PK\0\0\0\0\0!\0�>���\0\0\0�\0\0\Z\0xl/_rels/workbook.xml.rels �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�RMK\�0���0w�v\�t/\"\�U\�ɴ)\�&!3~�\�*�]X\�K/o�y\�\�\�v�5\���+��zl\�;o\��\�b\��G\�\�\�\��s�>�\�,�8\��(%���\"D��҆4j\�0u2js\�\�MY\�˴\���S쭂��� �)f\���C\����y\��	I<\ry\0\�\�\�!+��E���fMy\�k���\��K�5=|�t �\�G)�s墙�U\�\�tB�\�)�\��,\��\�f\�\�\�\�\�\0\0\0��\0PK\0\0\0\0\0!\0a0?i\0\0\�\0\0\0\0\0xl/workbook.xml��]o\�0�\�\'\�?d�����FI*\nTE���\�\�\rRe�\�\�\�6�j\�\�qRV6n:m7���<~\�{��^\����6LɌ���x U2�\�\��\�UD<c�,)W2��\\\�\�ߥ[�\�K�\��\�Hmm���)j\�Tw*��\�o\Z\r�45�܏�\�\��I\����*V�T\�v\r�Z�oj֘=Mo�	�כ�_(\� b\�8�\�-�x�H\�+�4]rL{\�{2N�ЂZU\���N\�Q�a\��a�r�V�\�Cg�G�\�\�N<N���\�B��3\�^N��7\�\�q\�\rGQtN��W)n4�{\�-hI-L��hӋ��jI˞\�\n\�\�\�\�\rӀuw\�\�)~i�Х����6�gd�,\�\rf�xd�3*S��\\a,��\�u�3i\���1\�NW7�3�<u���`k^\�r��{d�Tی`\�?̷\��#+m��h4\np�[���-�\rO\���v\�\�xF;z��\��BC�C�\�\�jX\�D\�˰\��*�bJ\�\n\�8�^HO;.\�\�銹�N��Kj�uHA�\�=�֬,�]f���\�{aқ\�{a\�`ѬߏDNq�=7�J\�([����\�S��,#\�\�a0>·�`v����?\Z�D�\�p\Z\�\�\�tv���7[,\�?:NeM��ӴX\�Su\�%�\�rv��:�o�\�\����\0\0��\0PK\0\0\0\0\0!\0��e\�	\0\0\'\0\0\0\0\0xl/sharedStrings.xml�X\�s�8\�L��\�\�\�v\�Ws�\��T=@>�3m\�V\�`\�\����[p�	ߓm\�\�o�%\�^|��\�ȓ*Jm�ˑ3>��f��\�\�h_<��J�E��\\]��U\�\�\��\�\�EYVd��r�XU\�ϓI�>�UR�\�Z\�@y0\�*�\�g���\�B%��Q�j�M�\�&�D\�#��M^�\�gD6���Q\��\���hzQ\�\�E5u݋I5��Կ�\'\����\����Dί$�8��EL�>\rc.��s\�\'\�c�\�\���_9=$�����G��.�1f��H\�r\�\0#LƵ�#!�?��\�!��Gl&\�\�\�\�q���ܰ�E\�+^�<���\�gn\�o2A�Y\�E\�c\n}�+B9�cJ\���E!\n\�\�*\0^{[�y؈\�j��ܲ��\�W����`\�C�X��G�{L�!����_��/�NR��J�c�6|_��N\�\�\�V\�p�R\�\�\�fu_(\�\�Џ�t�VY�Ǝ�\�aǸV\�c>�jW�U�T�\�\�Xe\��\�\�3�*\�dIa\�\�\�B�u|#Ujx�+�k\�UQm�D&\�f1�VʰL�Uar�ڍ�\�:)�d5�\0\�T�5�)\�fS�]�\��A=-\��\�h!\�[�/�b+�4`O\�T�c�\�o�\�U�-��n�(\�d\�\n\�1(_�\�\�\�WU�\"\�g�\�ێKPe����&S�R��\�j\�6۳dY羏��t��ݤX\ZASȃ^$ڜFj�\�\�&�m��x�܋�%\�\�\�\�6xI}���\����\��]l][Q\���HU<AM�r,\n�T9�\�;\��5o]//�\�y�d�y-��g�6E�ܽL�\�[�\�V�\�\n\�\�k�o�r�*���\�\�� \�\�?�Cj�E�\rG�\�\�27�!5\� �z���*\�B7-�7t��\�Q����쵷\��=Ν\�x�Z\�\�\�\��L\"\�.�I�zD2w��U=\�!Bo��\�~\�_\�C�j^�\�\�\"t�\�R-\�\r:�X�\�;�\�!B�x�lx�\��\�B-޹\r:xX�\��ӆ�<,\�\�9h,h+\ZQ�)\�b;H{�v	\�AZ�\�jL\�t��U��^�\���[���p�-�)\�4�c\�\nL\�B�cmL\�B��c\�\rL\�Bt�cmL\�B4ȑ�A0�{G\�\�\�Ϻ3\ZG0ѢXH��\�\�Lo\�@ǰM8>%\�gWyY/S>�0\��%%��R�)�\�\���\�7!���bA\�e�b@�w\�ǣ�\'|��JB���0`�\\�0V�	��hXO\�?``l0	�!�@?�P�tip\�\�\�c�İ\�9>�\�,_ӺDw�\�\��\�Q�� �T\�\n%\�\�q؇� �\�\��^CJ̢� d\�|�m	\�ϻ~G=\nܰ��\�.\�\"H\�^{NwK�e\�*pNQvo���YL��]�4\nw@XtM�\0\0��\0PK\0\0\0\0\0!\0�� \0\0�\Z\0\0\0\0\0xl/theme/theme1.xml\�YO�7��\�\���\�K��\�\�6�I\�:)9jm٣�fdf\�ݘ(ɱP(MK/�\�z(m	��~�mS\����{��\�M\�\r�%kXf4����\�\�\�\�\�\�Kw#��H�R��ꅊ�H<\�c\ZO\�\�\�\�\�tP*p<ƌǤ\�,H\�\\\�~���xK�$\"\�\�t��P�\�V�������\��mxM�\�q��Ao\�ʵJ\�/G�\��qj� �\�]�L\�8\�K�}}\�\"�\r#�\�K\�$�Ѱ\�êD��4`	:¬\�@Oc~<$w��N|h;�男/��V.\�\�YMn��r�\\`|XS}&ӃU��\�~g�_�X\��}�\��)\0�`��-�N�\�\������G�\�^�W�\ZxM}\�\�\'^�2�\�\Z~0��^�2�g�I��^�2���oT:=�a\�(d4>\\CW<�,G��L8۱\�[�;h\�r\�\n�a�]��	�Ŧ\\���\0 �\Z#���	A�у��]:\r!�f8\�)4Wj�A��\�\�UO\�#x�`MZ\���kM\���:m\�C\�\�h��Ͼ�\�	z�\��Ƀ�\'~:y��\����.Cp\�S]�ŷ����\�\�\'߼x��\��_�䗟?�a����������\�\�\�=��;	>\�\�C\Z�]%\�\��`l\��\�\� �g\�SC��ۢ�/Bxu��\r\�%��n%@06\�\��\�\��0�j\��J�=\�Y�\'V\\�}i\�㩽�d�\�n`|d\�;��\��|\�Jm*��f^g8xJb\"��\�	��\�6��_�\�(\�)�t��.�V�遑H�\�� .��j\�7{�P�3ۨ{\�\�D�\�b��0Í��\\\�Ȧr�#�;|�\�f\��\"\�~* \�S\�8\�I�\�d�%0^-\�W�\\\�a\�c�\�D&�\�t\�b\�ud�!�fV�i\�\�\�CHQ��sa�\�qs�\�w��7��%F�\�&�����IE�\�/�\�\�˄��q�&�(�\�7\�<��\�~�Խw��U�Ӥ\�I�uj휢�M�� ���<�N`ά�w������=o�\�\�\�\�Q��u�v�6.\�\'��}�`d7U��\�\�x\0�j[�����\�,�\�|�`\�	V2(\�\�#*\��\�`�_U�\�i����h\�SX��f�)&�t��\�<\�\�\�l\�Z�\�\�iF)E{\�[�\�nCdh�Q\�\�V\�վv�v\�K�\�?1B\�\�4�n1��l�(��jd\�bE\�bES�_�jŕ+��UT`��`\�\�v<7;	�Mfd,\�\n,�+�s��\�\�L�g\0,&�PD�%m\�8<9�,\�^!҆Z��Fhib8�Q\�)y3/�g�[EH\r�+���0�\�|��$r�X�3�\�q\��\�����\�L`\��\�r\'�\�^̦p�6I6\�_�YfI*z8\r3�+\�\�\� ��$�Ѩ\�\�᯲�ŊC�m\�\Z\�[k\\h\�m3�n�L&d$��k-\�\�\�+0|6�_��냥$�C��\��1:`�\���\ZU\��1M\�\0��ysL\�DsEdE��*L9\�\�G�*��v\�f!\�+�N\�\\�\�\��������\��,���\�]��\�4\�,j��*�j\�\��\�yͪ��\ZVeԭ�\ri�u�%\�A�Z�\�U�\n�fZљa��x��%g筦i\� \�<\�o�۪FX=�\�Ng�,\�u�J|u��\�N��;@=8�3��P\�\�C�aї�$g�S\�\�׈��\�	m;�*^\�\rj^P�4�~ɭ��R\�\�\�KϫW�^�\�\�\�\�CaaT�����G�E~��\�׮`�\�ۅ�\�\\]���\�\�\n�Z3�`�\�4�7,�@:��ڠUou�R�\��\�^�Yj~�\��Fo\��fkp\�AG\n\�v\�\���%�\Z%ׯH�Rí\�:n�\�컝��2F�\�G\�p��k�/\0\0\0��\0PK\0\0\0\0\0!\0	b+\�\�\0\0\�\0\0\r\0\0\0xl/styles.xml\�XKo\�8�\�� �\�˵\rIEmG@��(�\�+-Q6Q>�\�\�]\�l%i\'q\�\�!\�\�Ù\���\�\rg\�5Q5�\"A���\"rYP�N\���̝ �\�X�IA�#5����.����\�\r!\��N\�F\�j\�yu�!\�g�\"�)�\�X�\�^])��\�\�\�}\�qLj%\�x~��Տm\�\�WX\�eT\�,\��|�i-�\�+�6�\�N�U\�k�[w�p�+Y\�R��PO�%\�\�][�\�\�\��A�}�� ����x\Z�R\�\�\�\�V\�E \�=�!\�?\"3_ALP˕\��O\�\Z3\�	��ƹdR9\Z�\rw�;s\�r,0�+E\r[�9e�v;46>�\�-�\�;\�\���#��^�W	\�2\��;N�l\�\�Wf��\Zq�\�!>��}��&1`#��4Q\"\�\�\�W�\n\�B@Ͷ\�|�p�\�a48\�Y�i����\�\�I\�v+�)5N\��\�|jY���\�\ZJ)��\�R`fR�?\�-\�:9a\�\����\���\�[�q��Ht$���.\�-[y-a\�����b\�`�\�\�:M�Wp\�\�\0��U�\��*�3mJ��\�́�\�\�Zp\�2�1\�oK:�\�O8h\n\��\Z�n�in\��I[�My������\r<��\����\�.�oK\�P�]�؂|F��N�,\��\�8Ef|\��Q�.�z}i�v\����}��y��Ʈ�3]u\'�\�q}00	�\��q�S߶�vV�Dh�\��\�b6�ܝ\�24\�ODa�>=�\�\'����\�\Z`��{\'�.\0Ux\�\Z\�\�\ZǠ\�}5����\�Ag��LS�$2�怭b�\��70�t |<�nCK�u\�::$�e���{d�@\�0a�zV\�[\�3Z\�\�\�̀[\�}	�/H��L_\�L\�a��t\�!/:�o�Zj+\"A��gt\�(\�\�\�5LM�\�lMп��\�\�E�>qG\�$r�\�|\�F�\�|�̦~\�/��/E\�\�0(\�j�\�.\�y\�KЀhͷ1���Oñ�1\n|7;�w4\�w2>�\�,\n\�\�x4���h`{�\�\�\����~� �i\�	���U�\�.	\�.\�����J��\0\0\0��\0PK\0\0\0\0\0!\0�~|��\0\08\0\0\0\0\0xl/worksheets/sheet1.xml��ks�:�����<�^as\�$\�hz��m\���8a���ۿ?+�}妝\�-+\�\�}�?\������r{23k:ɶi�ʷ\�\'\�o_Ϟ�\�I\�$\�UR�\�\�d��\�\�\���s|_V�\�,k&\�a[�Lo�fw4�\�\�M�I\�Y�˶Բ.�M\�\�\�\�z^\�,Y�m��mY\�|�\�\�i\�\��\�z��Y\\���l\�tN��H\Z\Z}�\�\�\�\�&�w���u�{�����ʋ�yl�N\'��\��������\�� �I\��n\�7yZ�u�nf\�n\�\rԜs0\�\�\��x�\��\�*[�LCq����\�\�V��<��Gד&���Y\�d+�\�tҔ�wٺ�YQ�L?\�\r������|M6�Q�O�>��\�\�2mmSL�\�z��~�\�m��\�\�\��u?��6���\�URg�,�\�\�B��\�\�\�mќ���������)�;Z=\�Y�R�h<3\�Q\�K˂�\�\�\�&���H\�\�����i�3\�w�\�=\�ޣ�_А���9˕�\�$���r\�B�\�\�!��\n1[ڎ狱\�%{Hͣ��\�sf�g-੧���ɨ��:�s�k;WC\���?=_����\�%<0t���.2m\Z\�I��W\�����\'\�]�GB,~[\n��Ur�LkJ��S\�\�\�(�R\��F�7J\��\�x\�h[��k��5ڼ�\\�_à\��y\�,y\�k\�`9��\�p�7�l\\n�u��c� \�{\����a�\�d�\�\ZA�O�d�\�\ZA�s\�z}a� \�W\�\n}c��\�k���FP\�Ǹq	\n]�FP\�\'k�BŁ\�,fJ��\��(2>� ]\�\0Y�v!#d	\�\n�!���^\�\�p@�P\�1<\�~�\�bߊ2\"T�!\�d�	�bP8��\�A�jŸpP+��Z12\\Ԋ�\�V�\r�bp���\�E�.j\��pQ+�ZE\�E\�V{Sx�U\�^h1<\�*b,x�U\�X�@���\��Vc��\"Ƃ�/FƂ�Z1<Ԋ�\�V��b,��c�G�>j\�X�Q+Ƃ�Z1|Ԋ�\�V��b,�c!@�j\�XP+\�B\0ZI\�B\0ZI\�B\0ZI\�B\0ZI\�B�;.\�B\0ZIƂ�@,\�`�%\r\��$\�AX��d<c@cD%cH5cLEcPU\�T�h�\n!��a!jʸ5e`\�V�׌!PS���)cCԔ�!p\�/B��!p�ϋ\n\��Ǽ��A��6�3D\��cƈ�A��C�[��Cb�j1�\�\�g✊��S;��h;\��UpW��eZW|ϼ\�\�\�}��v��J\rWBm��\"ܝ�\�YZ\�\�\�\�\�\�}�gC`\�ۂ\�\�@t_��R\�\�\r\�����\���Y}u�	Tsڅӹ7X�h\�0��-\\\�\r\�\�\��B\�3m�\�}o����\����@�Ѵ���\�Yt*9�EK��|\\�?����?��EK5\�\�s���*\�`�\�̧��\���\�Ų\r�oY�\�\�l�~t6]\�Z�|�\\�3U��\��&�y(ظ	�`E;��\�\�;-��\"-ݧ�G��a��q\�A�_l4\\�;=J\�w�\�F�3�����6<����b7��\\`E2�ѧ}8�0Zj�~:��?Á�����\�2Z\�x��X�wk8\�0x\�\�\�</��\�\0\�b�\�\�\� \�7Ž\�+1\�7L\�0��N�ѝ!ه�\�\�߉t.�V�eca\�\\����P�1S\�!�s���\�e\�\��C#4z_`�a$yd$y4$�0�~�ЈtN\�ш��t�lt��\�\�\�\�\�\�T\�1/\Z�\�a\�\�2;\�\�9��{4,���ΖQ_F�D:[F6:[�w�Ζ}_�_\�\re��\�\�\��1.i,\\҈�4b*uLG���J#�R\�t��Si\�T꘎�2b*��J\�\�SFL�S9�0�J#�҈�\�1�e\�T\Z1���\��؈il\�46b\Z1���\�FLc#�\�\�\�\�\�ܻ�sw�\�d�\�v��#¤\�v\�\r�o�g`���K*0}\�s\'T�\�Nk}~[d�\�qG\'O�\�]��I�]$\�-~NVku�F�.wU^Vt`����ۃ�����:���C:�\�w\�F\�w\�\�\�}R]\�\�zR\��:{��B\�ε\�tz\�ޥB\�l\�(��uC\'�m4���˲\��	g���\0\0��\0PK\0\0\0\0\0!\00b)�G\0\0]\0\0\0docProps/core.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���N\�0D\�H�C\�{\�\r-XI*\�JHq�\�mk;�mH��8IR���wf\�ή�/����:Y\��$Eh^�wz]/\�[9ϴ`U��@GphQ^_\�\�P^[x��\�%�(���\�h｡;�\�\\:�\�\�*\�\�\�\�a��\�\0O\�t�x&�g�\�f �R�i>m\�\�P�\�&	�?^V�?:e\�T\�M\�\�w\����\��\�4M\�L�!?�o���n\�X\��VP�N�\�k[2��\��\�^�bί¡�\���\�Ȫ�L\���X]�\"\nah��l��\�%*\')�\�\�<�dk2�dJ\�콝|\�߆\�\�4��\�;�e�܌�g@\�\��\�7\0\0\0��\0PK\0\0\0\0\0!\0\'쥑\0\0\0\0\0docProps/app.xml �(�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���n\�0�\���n(�@VQ�rذ\0I{\�d:\�&K�\�\�\�fϲm���\�\�ɟ�����?��\�0e|%\�R\�M��\�U\�i�\�\�(2�����8a��\��N!b\"��`�+�\'�)�\�cyƲg�	�\�4\�dh\Zk�1�C��\�mY\�I<�\Z\�x6�㢣ך\���|�y{��\�C�\�\Z ~��bM\n94T|<\ZtJNE\�t4�d\�K%��\�p�dc݀˨䥠V�\�\�`S֪�E��B*��\�c�\�7\�\�\�T��d�c�mc2\�.fJz�C.j,\�\�_\�\\P��Fm�G��}�\�C׍��\�\�\�5\�֒\���YC���ϧ\�È}A��\�\r\���^�6�?�p�>[�#?\�mx�^\�f	k���\�\��\�y&כ,�\�wX���+�+�<\�\�\�w%�\�e��\0\0\0��\0PK-\0\0\0\0\0\0!\0b\�h^\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0[Content_Types].xmlPK-\0\0\0\0\0\0!\0�U0#�\0\0\0L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0_rels/.relsPK-\0\0\0\0\0\0!\0�>���\0\0\0�\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/_rels/workbook.xml.relsPK-\0\0\0\0\0\0!\0a0?i\0\0\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0xl/workbook.xmlPK-\0\0\0\0\0\0!\0��e\�	\0\0\'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/sharedStrings.xmlPK-\0\0\0\0\0\0!\0�� \0\0�\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/theme/theme1.xmlPK-\0\0\0\0\0\0!\0	b+\�\�\0\0\�\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/styles.xmlPK-\0\0\0\0\0\0!\0�~|��\0\08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0xl/worksheets/sheet1.xmlPK-\0\0\0\0\0\0!\00b)�G\0\0]\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0f#\0\0docProps/core.xmlPK-\0\0\0\0\0\0!\0\'쥑\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�%\0\0docProps/app.xmlPK\0\0\0\0\n\0\n\0�\0\0�(\0\0\0\0');
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
INSERT INTO `documentoplazosproyectos` VALUES (1,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\�\�\�\�\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nx����n\�0\�w>ō\�P��)ulд\�Ц��EF���\�6���;\�J:�\�1m��aK0	�\��x<\�/��FL�\�}�\�WD\�2�K\0�O�U�z@�C=Ggo\�8�y\n�f@�(a��\"\\��!�b�\��&�*\���v\0x3%�qvm����ZW\��1\�\�-\�\�yh]L�C�JD?~�g�Q�bd/\�AaUP�\�\�\����^�\�Đ`A��HU�\\=�:�\�or1~̸\�\�\��_\����\�a\�\�\�\Z\�>\�\�(\�J$�\�{��O�^*��T�\\\�HY��衵��\"�$�	�3�f�\\Eq{�\"	ԕ�FO��\�\��\\\�\�1O;wa�[\rv��\���CrRTq�L�Q�P􀲹uo׺�\�$yHRۖ]ł$�}��\�\�\Z\�u�\�Y`��˃\�a�-\"<AxT3_�\�=�W+1Z>\�\�\��ɵ2\\تL\�^��\�\�vg~���^\�\��\Zڀ�ُVMA/\�\�\0\��\�uz1�`!��z�vٰ؉�X\�n\���͕\�\�s�|�\nc�2��\rDo:\�\�%�L�Rny\�LrKFT R\�.�\����6�\"_ED�\�G����`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n'),(2,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\�\�\�\�\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nx����n\�0\�w>ō\�P��)ulд\�Ц��EF���\�6���;\�J:�\�1m��aK0	�\��x<\�/��FL�\�}�\�WD\�2�K\0�O�U�z@�C=Ggo\�8�y\n�f@�(a��\"\\��!�b�\��&�*\���v\0x3%�qvm����ZW\��1\�\�-\�\�yh]L�C�JD?~�g�Q�bd/\�AaUP�\�\�\����^�\�Đ`A��HU�\\=�:�\�or1~̸\�\�\��_\����\�a\�\�\�\Z\�>\�\�(\�J$�\�{��O�^*��T�\\\�HY��衵��\"�$�	�3�f�\\Eq{�\"	ԕ�FO��\�\��\\\�\�1O;wa�[\rv��\���CrRTq�L�Q�P􀲹uo׺�\�$yHRۖ]ł$�}��\�\�\Z\�u�\�Y`��˃\�a�-\"<AxT3_�\�=�W+1Z>\�\�\��ɵ2\\تL\�^��\�\�vg~���^\�\��\Zڀ�ُVMA/\�\�\0\��\�uz1�`!��z�vٰ؉�X\�n\���͕\�\�s�|�\nc�2��\rDo:\�\�%�L�Rny\�LrKFT R\�.�\����6�\"_ED�\�G����`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n');
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
INSERT INTO `documentoprorrogasproyectos` VALUES (1,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\�\�\�\�\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nx����n\�0\�w>ō\�P��)ulд\�Ц��EF���\�6���;\�J:�\�1m��aK0	�\��x<\�/��FL�\�}�\�WD\�2�K\0�O�U�z@�C=Ggo\�8�y\n�f@�(a��\"\\��!�b�\��&�*\���v\0x3%�qvm����ZW\��1\�\�-\�\�yh]L�C�JD?~�g�Q�bd/\�AaUP�\�\�\����^�\�Đ`A��HU�\\=�:�\�or1~̸\�\�\��_\����\�a\�\�\�\Z\�>\�\�(\�J$�\�{��O�^*��T�\\\�HY��衵��\"�$�	�3�f�\\Eq{�\"	ԕ�FO��\�\��\\\�\�1O;wa�[\rv��\���CrRTq�L�Q�P􀲹uo׺�\�$yHRۖ]ł$�}��\�\�\Z\�u�\�Y`��˃\�a�-\"<AxT3_�\�=�W+1Z>\�\�\��ɵ2\\تL\�^��\�\�vg~���^\�\��\Zڀ�ُVMA/\�\�\0\��\�uz1�`!��z�vٰ؉�X\�n\���͕\�\�s�|�\nc�2��\rDo:\�\�%�L�Rny\�LrKFT R\�.�\����6�\"_ED�\�G����`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n'),(2,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\�\�\�\�\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nx����n\�0\�w>ō\�P��)ulд\�Ц��EF���\�6���;\�J:�\�1m��aK0	�\��x<\�/��FL�\�}�\�WD\�2�K\0�O�U�z@�C=Ggo\�8�y\n�f@�(a��\"\\��!�b�\��&�*\���v\0x3%�qvm����ZW\��1\�\�-\�\�yh]L�C�JD?~�g�Q�bd/\�AaUP�\�\�\����^�\�Đ`A��HU�\\=�:�\�or1~̸\�\�\��_\����\�a\�\�\�\Z\�>\�\�(\�J$�\�{��O�^*��T�\\\�HY��衵��\"�$�	�3�f�\\Eq{�\"	ԕ�FO��\�\��\\\�\�1O;wa�[\rv��\���CrRTq�L�Q�P􀲹uo׺�\�$yHRۖ]ł$�}��\�\�\Z\�u�\�Y`��˃\�a�-\"<AxT3_�\�=�W+1Z>\�\�\��ɵ2\\تL\�^��\�\�vg~���^\�\��\Zڀ�ُVMA/\�\�\0\��\�uz1�`!��z�vٰ؉�X\�n\���͕\�\�s�|�\nc�2��\rDo:\�\�%�L�Rny\�LrKFT R\�.�\����6�\"_ED�\�G����`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n'),(3,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\�\�\�\�\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nx����n\�0\�w>ō\�P��)ulд\�Ц��EF���\�6���;\�J:�\�1m��aK0	�\��x<\�/��FL�\�}�\�WD\�2�K\0�O�U�z@�C=Ggo\�8�y\n�f@�(a��\"\\��!�b�\��&�*\���v\0x3%�qvm����ZW\��1\�\�-\�\�yh]L�C�JD?~�g�Q�bd/\�AaUP�\�\�\����^�\�Đ`A��HU�\\=�:�\�or1~̸\�\�\��_\����\�a\�\�\�\Z\�>\�\�(\�J$�\�{��O�^*��T�\\\�HY��衵��\"�$�	�3�f�\\Eq{�\"	ԕ�FO��\�\��\\\�\�1O;wa�[\rv��\���CrRTq�L�Q�P􀲹uo׺�\�$yHRۖ]ł$�}��\�\�\Z\�u�\�Y`��˃\�a�-\"<AxT3_�\�=�W+1Z>\�\�\��ɵ2\\تL\�^��\�\�vg~���^\�\��\Zڀ�ُVMA/\�\�\0\��\�uz1�`!��z�vٰ؉�X\�n\���͕\�\�s�|�\nc�2��\rDo:\�\�%�L�Rny\�LrKFT R\�.�\����6�\"_ED�\�G����`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n'),(4,'InformeSeguimiento.pdf','application/pdf','%PDF-1.4\n%\�\�\�\�\n4 0 obj\n<</Filter/FlateDecode/Length 557>>stream\nx����n\�0\�w>ō\�P��)ulд\�Ц��EF���\�6���;\�J:�\�1m��aK0	�\��x<\�/��FL�\�}�\�WD\�2�K\0�O�U�z@�C=Ggo\�8�y\n�f@�(a��\"\\��!�b�\��&�*\���v\0x3%�qvm����ZW\��1\�\�-\�\�yh]L�C�JD?~�g�Q�bd/\�AaUP�\�\�\����^�\�Đ`A��HU�\\=�:�\�or1~̸\�\�\��_\����\�a\�\�\�\Z\�>\�\�(\�J$�\�{��O�^*��T�\\\�HY��衵��\"�$�	�3�f�\\Eq{�\"	ԕ�FO��\�\��\\\�\�1O;wa�[\rv��\���CrRTq�L�Q�P􀲹uo׺�\�$yHRۖ]ł$�}��\�\�\Z\�u�\�Y`��˃\�a�-\"<AxT3_�\�=�W+1Z>\�\�\��ɵ2\\تL\�^��\�\�vg~���^\�\��\Zڀ�ُVMA/\�\�\0\��\�uz1�`!��z�vٰ؉�X\�n\���͕\�\�s�|�\nc�2��\rDo:\�\�%�L�Rny\�LrKFT R\�.�\����6�\"_ED�\�G����`\nendstream\nendobj\n1 0 obj\n<</Tabs/S/Group<</S/Transparency/Type/Group/CS/DeviceRGB>>/Contents 4 0 R/Type/Page/Resources<</ColorSpace<</CS/DeviceRGB>>/ProcSet [/PDF /Text /ImageB /ImageC /ImageI]/Font<</F1 2 0 R/F2 3 0 R>>>>/Parent 5 0 R/MediaBox[0 0 612 792]>>\nendobj\n6 0 obj\n[1 0 R/XYZ 0 802 0]\nendobj\n2 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica/Encoding/WinAnsiEncoding>>\nendobj\n3 0 obj\n<</Subtype/Type1/Type/Font/BaseFont/Helvetica-Bold/Encoding/WinAnsiEncoding>>\nendobj\n5 0 obj\n<</Kids[1 0 R]/Type/Pages/Count 1/ITXT(2.1.7)>>\nendobj\n7 0 obj\n<</Names[(JR_PAGE_ANCHOR_0_1) 6 0 R]>>\nendobj\n8 0 obj\n<</Dests 7 0 R>>\nendobj\n9 0 obj\n<</Names 8 0 R/Type/Catalog/Pages 5 0 R/ViewerPreferences<</PrintScaling/AppDefault>>>>\nendobj\n10 0 obj\n<</ModDate(D:20170827185534-05\'00\')/Creator(JasperReports Library version 6.4.1)/CreationDate(D:20170827185534-05\'00\')/Producer(iText 2.1.7 by 1T3XT)>>\nendobj\nxref\n0 11\n0000000000 65535 f \n0000000639 00000 n \n0000000924 00000 n \n0000001012 00000 n \n0000000015 00000 n \n0000001105 00000 n \n0000000889 00000 n \n0000001168 00000 n \n0000001222 00000 n \n0000001254 00000 n \n0000001357 00000 n \ntrailer\n<</Info 10 0 R/ID [<c9d24cb397c8a0fa22e4fc76e108db88><c244adf8c513c3b084e12f6f4d2770f3>]/Root 9 0 R/Size 11>>\nstartxref\n1525\n%%EOF\n');
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
INSERT INTO `estadosproyecto` VALUES (1,'Ejecución'),(2,'Finalizado'),(3,'Atrasado'),(4,'Cancelado'),(5,'Trasladado');
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
INSERT INTO `facultades` VALUES (1,'Facultad de Artes'),(2,'Facultad de Ciencias Agrarias'),(3,'Facultad de Ciencias Económicas'),(4,'Facultad de Ciencias Exactas y Naturales'),(5,'Facultad de Ciencias Sociales y Humanas'),(6,'Facultad de Comunicaciones'),(7,'Facultad de Derecho y Ciencias Políticas'),(8,'Facultad de Educación'),(9,'Facultad de Enfermería'),(10,'Facultad de Ingeniería'),(11,'Facultad de Medicina'),(12,'Facultad Nacional de Salud Pública'),(13,'Facultad de Odontología'),(14,'Ciencias Farmacéuticas y Alimentarias'),(15,'Escuela de  Idiomas'),(16,'Escuela de  Interamericana de Bibliotecología'),(17,'Escuela de MicroBiología'),(18,'Escuela de  Nutrición y Dietética'),(19,'Instituto de Filosofía'),(20,'Insituto Universitario de Educación Fisica'),(21,'Instituto de Estudios Politicos'),(22,'Instituto de Estudios Regionales'),(23,'Corporación Ambiental'),(24,'Corporación de Ciencias Basicas Biomédicas'),(25,'Corporación de Patologías Tropicales');
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
INSERT INTO `fuentesfinanciacion` VALUES (1,'Alcaldia de Envigado',NULL,NULL,1,2,1,4),(2,'Alcaldia de Itagui',NULL,NULL,1,2,1,4),(3,'Alcaldía de Medellín - Metroseguridad',NULL,NULL,1,2,1,4),(4,'Alta Consejeria para la Reconciliación - Presidenc',NULL,NULL,1,2,NULL,NULL),(5,'Área Metropolitana del Valle de Aburrá',NULL,NULL,1,2,NULL,4),(6,'Asociación Colombiana de Aviadores \"ACDAC\"',NULL,NULL,1,2,NULL,NULL),(7,'Centro Internacional para el Desarrollo de Investi',NULL,NULL,1,2,NULL,NULL),(8,'CODI',NULL,NULL,1,2,NULL,NULL),(9,'COLCIENCIAS',NULL,NULL,1,2,NULL,6),(10,'Corporación Fondo de Prevención Vial',NULL,NULL,1,2,NULL,NULL),(11,'Corporación Parque Explora',NULL,NULL,1,2,NULL,NULL),(12,'Corporación Surgir',NULL,NULL,1,2,NULL,NULL),(13,'Departamento de Antioquia- Gerencia de Seguridad A',NULL,NULL,1,2,NULL,NULL),(14,'Departamento de Antioquia-Secretaria Seccional de',NULL,NULL,1,2,NULL,NULL),(15,'ESE Metrosalud',NULL,NULL,1,2,NULL,4),(16,'Fondo de Apoyo a los Trabajos de Pregrado',NULL,NULL,1,2,NULL,1),(17,'Fondo Investigación Docente',NULL,NULL,1,2,NULL,1),(18,'Fondo Investigación Docente y Extensión',NULL,NULL,1,2,NULL,1),(19,'Gobernacion de Antioquia',NULL,NULL,1,2,NULL,NULL),(20,'INDER',NULL,NULL,1,2,NULL,NULL),(21,'Instituto Colombiano de Bienestar Familiar - ICBF',NULL,NULL,1,2,NULL,NULL),(22,'Instituto de Medicina Legal',NULL,NULL,1,2,NULL,NULL),(23,'IPS Universitaria',NULL,NULL,1,2,NULL,NULL),(24,'Ministerio de la Protección Social',NULL,NULL,1,2,NULL,7),(25,'Municipio de El Carmen de Viboral',NULL,NULL,1,2,NULL,4),(26,'National Association of Chronic Disease Directors',NULL,NULL,1,2,2,NULL),(27,'National Center for Rural Health Professions (NCRH',NULL,NULL,1,2,2,NULL),(28,'Organización de Estados Americanos OEA',NULL,NULL,1,2,2,NULL),(29,'Organización Panamericana de la Salud - OPS',NULL,NULL,1,2,2,NULL),(30,'Secretaría de Gobierno del Municipio de Medellín',NULL,NULL,1,2,NULL,4),(31,'Secretaria de Salud de Medellín',NULL,NULL,1,2,NULL,4),(32,'Sostenibilidad Interna grupos',NULL,NULL,1,2,NULL,1),(33,'UBS Optimus Foundation',NULL,NULL,1,2,2,NULL),(34,'UdeA Especie',NULL,NULL,1,2,NULL,1),(35,'Universidad de Dalhouise',NULL,NULL,1,2,2,NULL),(36,'Universidad de Illinois',NULL,NULL,1,2,2,NULL),(37,'Universidad de Manitoba',NULL,NULL,1,2,2,NULL),(38,'Universidad de Michigan',NULL,NULL,1,2,2,NULL),(39,'Vicerectoría de Docencia',NULL,NULL,1,2,NULL,1);
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
INSERT INTO `gruposinvestigacion` VALUES (1,'Aplicaciones Estadísticas y Salud Pública'),(2,'Demografía y salud'),(3,'Didactica'),(4,'Epidemiología'),(5,'Gestión y políticas de salud'),(6,'Grupo de investigación en género, subjetividad y sociedad- Instituto de Estudios regionales INER- UdeA.'),(7,'Grupo Investigador de Problemas en Enfermedades Infecciosas - GRIPE'),(8,'Historía de la salud'),(9,'Microbiología Básica y Aplicada MICROBA'),(10,'Promoción de la Salud- Enfermeria'),(11,'Salud mental'),(12,'Salud ocupacional'),(13,'Salud y sociedad'),(14,'Seguridad  y salud en el trabajo'),(15,'Sistemas de informacion en salud'),(16,'Salud y Ambiente'),(17,'Antropologia Medica Critica');
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
INSERT INTO `naturalezasfuente` VALUES (1,'Pública'),(2,'Privada');
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
INSERT INTO `objetivosespecificos` VALUES (1,8,'Apoyar el diseño de los menu'),(2,8,'Crear una medología'),(8,15,'Objetivo 1'),(9,16,'Pruebas'),(14,17,'Pruebas'),(15,17,'Guí­a de la información'),(19,25,'DESARROLLAR PLATAFORMA CON TECNOLOGÍAS DE PUNTA');
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
INSERT INTO `opcionesmenu` VALUES (2,'Proyectos',1,NULL,2,'fa fa-ticket fa-fw',NULL,1),(3,'Novedades',1,NULL,3,'fa fa-ticket fa-fw',NULL,1),(4,'Registrar',2,2,1,NULL,'/proyectos/crear',1),(5,'Consultar',2,2,2,NULL,'/proyectos/proyectos',1),(6,'Proyectos',2,3,1,NULL,'/novedades/proyectos',1),(7,'Reportes',1,NULL,4,'glyphicon glyphicon-list-alt',NULL,1),(8,'Integrantes por proyectos',2,7,1,NULL,'/reportes/integrantesProyectos',1),(10,'Proyectos por grupo de investigación',2,7,3,NULL,'/reportes/proyectosPorGrupoInvestigacion',1),(11,'Fuente de financiación por proyecto',2,7,4,NULL,'/reportes/fuentesFinanciacionProyectos',1),(12,'Proyectos en ejecución y atrasados por docente',2,7,5,NULL,'/reportes/proyectosEjecucionAtrasadosProfesor',1),(13,'Proyectos por docente',2,7,6,NULL,'/reportes/proyectosProfesor',1),(14,'Seguimiento de proyectos por docente',2,7,7,NULL,'/reportes/seguimientoProyectosProfesor',1),(15,'Inscripción de proyectos',2,7,9,NULL,'/reportes/proyectosInscritos',1),(16,'Administrar',1,NULL,6,'fa fa-dashboard fa-fw',NULL,1),(17,'Crear usuario',2,16,1,NULL,'/usuarios/crear',1),(18,'Usuarios',2,16,2,NULL,'/usuarios/usuarios',1),(19,'Privilegios',2,16,4,NULL,'/privilegios/privilegios',1),(20,'Crear privilegio',2,16,3,NULL,'/privilegios/crear',1),(21,'Editar Proyecto',2,2,3,'','/proyectos/editar',0),(22,'Editar Novedades',2,3,3,'','/novedades/editar',0),(23,'Editar Privilegios Usuario',2,16,4,'','/usuarios/privilegios',0),(24,'Editar Privilegio',2,16,5,'','/privilegios/editar',0),(25,'Certificados',2,27,1,'','/reportes/certificados',1),(26,'Seguimiento de Proyecto',2,7,8,'','/reportes/seguimientoProyecto',1),(27,'Constancias',1,NULL,5,'glyphicon glyphicon-check',NULL,1);
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
INSERT INTO `privilegios` VALUES (1,'Gestor de Información','GESTOR_INFORMACION'),(2,'Usuarios CI','USUARIOS_CI'),(3,'Administrador del Sitio','ADMINISTRADOR'),(4,'Super Admin','SUPER_ADMIN');
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
INSERT INTO `profesores` VALUES (1,1,'William','Ortiz',71984823,'waortiz@hotmail.com','En la facultad'),(2,1,'Juan David','Ortiz Perea',43567890,'juan@hotmail.com','Casa de la mamá'),(3,1,'FABIO','PALACIO',71985678,'waortiz@hotmail.com','ANA FARINA');
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
INSERT INTO `programas` VALUES (1,'Salud Pública'),(2,'Admistración en salud:  Gestión Sanitaria y Ambiental'),(3,'Salud Mental'),(4,'Epidemiología'),(7,'Ciencias Sociales'),(8,'Administración en Salud: Gestión de Servicios de Salud'),(10,'Ingeniería Ambiental'),(11,'Doctorado en Paz, conlictos y democracia'),(12,'psicologia'),(13,'Salud comunitaria'),(15,'Gerencia en Sistemas de Información en Salud'),(17,'Salud Ocupacional'),(18,'Desarrollo humano a nivel local y regional.'),(19,'Tecnología en Regencia de Farmacia'),(20,'Doctorado en antropología y trabajo social');
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
INSERT INTO `prorrogasproyectos` VALUES (1,5,'Nueva entrega','2017-08-27 19:08:09',3,5000000,'2017-08-27 00:00:00','34556','2017-08-27 00:00:00','56654'),(2,5,'Otra prórroga','2017-08-27 19:08:47',5,45000000,'2017-08-27 00:00:00','345','2017-08-27 00:00:00','456'),(3,8,'Prueba','2017-08-27 19:10:48',4,5,'2017-08-27 00:00:00','6','2017-08-27 00:00:00','7'),(4,8,'Nueva entrega','2017-08-27 19:11:12',2,444444,'2017-08-27 00:00:00','3','2017-08-27 00:00:00','3');
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
INSERT INTO `proyectos` VALUES (1,'Gestión de Niños','Gestión','2017-05-09 00:00:00','2017-05-25 00:00:00',2,'SE4','1',1,1,3,1,1,2,'DESARROLLAR','2016-05-28 14:31:03',1),(2,'Programa especial de la niñez','Programa especial de la niñez','2017-05-02 00:00:00','2017-05-28 00:00:00',2,'86786','464',1,1,3,1,1,2,'Crear conciencia del cuidado de los niños','2017-05-28 16:02:36',1),(3,'Creación de Niños U de A','Creación de Niños','2017-05-02 00:00:00','2017-05-28 00:00:00',2,'86786','789',1,1,3,1,1,2,'Ninguno en especiÃ¡l','2017-05-28 16:09:32',1),(4,'Proyecto de Integración Colectiva','Proyecto de Integración Colectiva','2017-05-03 00:00:00','2017-05-28 00:00:00',2,'dasdas','56789',0,1,3,1,1,2,'Desarrollar la plataforma de tecnología de la colectividad','2017-05-28 16:10:08',1),(5,'Gestión de Niños','Gestión de Niños','2017-05-09 00:00:00','2017-05-19 00:00:00',2,'54','31312',0,1,3,1,1,2,'Crear árboles','2014-05-28 16:21:25',1),(8,'Nutrición Callejera en Medellín','Nutrición Callejera','2017-05-16 00:00:00','2017-05-29 00:00:00',2,'88','4234',1,1,3,1,1,2,'Crear un sistema','2017-05-29 08:50:45',1),(9,'Social Completo','Social','2017-05-09 00:00:00','2017-05-24 00:00:00',2,'76','646',0,1,3,1,1,2,'Trabajo social','2017-05-29 12:10:28',1),(15,'Pruebas 1','Pruebas 1','2017-07-01 00:00:00','2017-07-30 00:00:00',2,'6','34',0,1,3,1,1,2,'Desarrollo','2015-07-01 14:33:53',1),(16,'Pruebas 1','Pruebas 1','2017-07-01 00:00:00','2017-07-30 00:00:00',2,'6','890',0,1,3,1,1,2,'Desarrollo','2017-07-01 14:35:00',1),(17,'Proyecto 1','Proyecto 1','2017-07-01 00:00:00','2017-07-31 00:00:00',2,'89','786',0,1,3,1,1,2,'Pruebas de guía de información','2017-07-01 17:29:49',1),(18,'Perea','William Alexis','2017-07-02 00:00:00','2017-07-31 00:00:00',4,'5','57',1,1,3,1,1,7,'Ninguno','2017-07-02 20:00:16',1),(20,'Prueba 1','Prueba 1','2017-07-02 00:00:00','2017-07-31 00:00:00',2,'5','4368',0,1,3,1,1,2,'Desarrollo','2017-07-02 20:04:39',1),(21,'Prueba 1','Prueba 1','2017-07-02 00:00:00','2017-07-31 00:00:00',2,'5','21345',0,1,3,1,1,2,'Desarrollo','2017-07-02 20:16:37',1),(25,'DESARROLLO DE TELEASISTENCIA PARA LA TERCERA EDAD','TELELLAMADA','2017-08-11 00:00:00','2017-10-08 00:00:00',5,'5685ASD','6543',1,2,3,1,2,7,'DESARROLLAR PLATAFORMA DE FACILITACIÓN','2017-08-11 12:43:17',1),(26,'Desarrollo integral de planes de acción','Desarrollo de Planes','2017-08-28 00:00:00','2017-10-01 00:00:00',1,'3467','2',0,2,2,1,1,5,'Desarrollar el plan','2017-08-28 18:31:55',1);
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
INSERT INTO `riesgoseticos` VALUES (1,'Sin Riesgo'),(2,'Riesgo Mínimo'),(3,'Mayor al Mínimo'),(4,'SD');
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
INSERT INTO `roles` VALUES (1,'Investigador Principal'),(2,'Co_Investigador'),(3,'Joven Investigador CODI'),(4,'Joven Investigador COLCIENCIAS'),(5,'Asesor Nacional'),(6,'Asesor Internacional'),(7,'Auxiliar de Investigación'),(8,'Estudiante en Formación'),(9,'Director de Trabajo de Grado'),(10,'Co_Director de Trabajo de Grado');
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
INSERT INTO `tiposacta` VALUES (1,'Registro y Propiedad Intelectual'),(2,'Finalización'),(3,'Cierre'),(4,'Consejo de Facultad'),(5,'Inicio');
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
INSERT INTO `tiposcompromiso` VALUES (1,'Publicación de un articulo'),(2,'Ponencias a profesores estudiantes y estamento no docente'),(3,'Documentos con los resultados de la investigación'),(4,'Artículo publicado en revista indexada tipo A o B'),(5,'Divulgación de los resultados para las asociaciones A las que pertenezcan el grupo de venteros participantes en el estudio y para las autoridades de salud del municipio si es necesario.'),(6,'Presentación de los resultados en un evento académico.'),(7,'Entrega del informe final en medio magnético para la biblioteca'),(8,'Sustentación oral ante jurados'),(9,'Artículo publicables'),(10,'Publicación de artículo'),(11,'Entrega de documento final de la tesis'),(12,'Discusion de los resultados, elabroacion y entrega del informe final'),(13,'Divulgacion del estudio, diseño, elaboracion y entrega del articulo para publicacion.'),(14,'Presentación en congresos'),(15,'Publicación en memoria de evento internacional'),(16,'Artículo de revista sobre un producto del proyecto'),(17,'Documentos con recomendaciones para el seguimiento de la dinámica de la enfermedad por vigilancia epidemiologia'),(18,'Acta de finalización con Colciencias, fondo de apoyo y secretaria de salud. Ok'),(19,'Articulo  presentado para publicación'),(20,'Divulgación'),(21,'Formación de estudiantes'),(22,'Entrega informe final en CD'),(23,'Presentación en evento'),(24,'Formación estudiante '),(25,'Artículo'),(26,'Publicación de Artículo'),(27,'Divulgación'),(28,'Formación de estudiantes'),(29,'Entrega informe final en CD'),(30,'Publicacion de Articulo'),(31,'Formación de estudiante 1 pregrado y 1 de posgrado'),(32,'Ponencia'),(33,'Taller'),(34,'Divulgación en foros y conversatorios en medios academicos y comunitarios, entidades gubernamentales y establecimientos educativos'),(35,'Publicación de Artículo'),(36,'Formación estudiantes'),(37,'Presentación pública en el auditorio de la FNSP'),(38,'Artículo listo para ser publicado en la revista de la FNSP'),(39,'Un artìculo aceptado para publicación en una revista nacional o Internacional '),(40,'Una Ponencia en evento científico nacional o internacional'),(41,'Publicación de un artículo en revista indexada, grado Ao B, con los resultados de la investigación.'),(42,'Presentación de los resultados en un evento académico de orden nacional internacional. '),(43,'Un estudiante de pregrado en formación'),(44,'Formación de estudiante  de doctorado'),(45,'Articulo en revista Nacional o internacional reconocida por Colciencias'),(46,'Articulo en revista Nacional o internacional reconocida por Colciencias'),(47,'Presentación en jornada de investigación y congreso.'),(48,'Articulo'),(49,'Formacion de 2 est. pos'),(50,'Ponencia nal o intern.'),(51,'Presentación en el CINDE y entidades participantes'),(52,'Presentación de los resultados en congreso nacional ó internacional.'),(53,'Publicación de dos artículos '),(54,'Articulo científico para publicación en revista nacional o internacional'),(55,'Realización de foros regionales en las ciudades seleccionadas para el estudio'),(56,'Serie de artúculo de prensa en un diario de circulación nacional y otro específico de la región.'),(57,'Contribución en la formación en investigación de estudiantes de la Maestría em Salud Pública'),(58,'Articulo publicado  en una revista indexada en las categorias A1, A2 o B.'),(59,'Presentacion de los resultados en congresos y eventos academicos'),(60,'Compartir los resultados con otras instituciones que ejecutan el programa de crecimiento y desarrollo como estrategia para impulsar cambios en el programa.'),(61,'Un (1) artículo aceptado para publicación en una revista nacional ó internacional reconocida por Colciencias.'),(62,'Formación en investigación de un (1) estudiante de pre o posgrado.'),(63,'Presentación de los resultados de investigación en un evento nacional o internacional'),(64,'Publicación  de articulo en revista nacional indexada       '),(65,'Socialización de resultados en talleres realizados en las 4 veredas.'),(66,'Acta de acuerdo, según estatuto de propiedad intelectual.'),(67,'Publicación en revista indexada categoria B o A.'),(68,'Presentacion de los resultados en un evento academico nacional o internacional'),(69,'Articulo en revista Nacional o internacional reconocida por Colciencias'),(70,'Formación de 2 estudiantes pregrado'),(71,'Ponencia evento nacional o internacional.'),(72,'Articulo divulgando los resultados del proyecto'),(73,'Participación en eventos nacionales e internacionales relacionadas con la tuberculosis'),(74,'asantía de estudiante de doctorado en Los Angeles California para asesoría de expertos en análisis y procesamiento de información.'),(75,'Formación de una estudiante de doctorado en Epidemiología'),(76,'Presentar informe final en CD '),(77,'Divulgación de los resultados : Ponencia en el Congreso Internacional de Riesgos Psicosociales en Bogotá'),(78,'Publicación de un artículo en revista A 1 o A2'),(79,'Formación estudiante de doctorado Germán Fernando Vieco (Doctorado en'),(80,'Articulo cientifico revista indexada'),(81,'Formacion investigacion 3 estudiantes de posgrado'),(82,'Evento difusion y validacion '),(83,'Micromundo procesos de educacion vial'),(84,'Articulo en revista especializada'),(85,'informe final en la página web de la FNSP '),(86,'presentación en congreso y/o foros especializado'),(87,'Socialización permanente del proceso de investigaciòn y de sus resultados con el grupo de investigación  G y P.'),(88,'Utilización de los resultados en los procesos de docencia pertinentes al tema de la investigación '),(89,'Acta de finalizacion por entidad externa'),(90,'Comunicación de resultados en la pagina web de la FNSP '),(91,'Articulo en revista especializada'),(92,'Congreso y/o Foro especializado'),(93,'Artículo publicado'),(94,'Formación de estudiantes 2 de pre y 1 de posgrado'),(95,'Entregar 2 trabajos de grado de estudiantes de Aministración en salud'),(96,'un ( 1 ) artículo aceptado para publicación en una revista nacional ó internacional'),(97,'Formación en investigación de un ( 1 ) estudiante de pre o posgrado.'),(98,'Una  ( 1) ponencias en eventos científico nacional ó internacional.'),(99,'Informe Final '),(100,'Presentacion de resultados '),(101,' Articulo'),(102,'Estudiante en formación del programa Doctorado en Salud Pública'),(103,'Publicación de un artículo en revista indexada por Colciencias A1 o A2'),(104,'Divulgación de resultados en evento científico a nivel nacional o internacional'),(105,'Resumen ejecutivo  para involucrados.'),(106,'Presentación de los resultados en evento académico e intituciones involucradas  con la población desplazada,  en eventos o congresos Nal o Intern.y ante el mpio con publicos diferentes en los que se encuentre representación de la población desplazada, fun'),(107,'Articulo para publicación en revista indexada u homologada por colciencias.'),(108,'Informe participación del estudiante con copia a la hoja de vida'),(109,'Articulo de revista A1 o A2'),(110,'Conferencia sobre los resultados de la investigación a la comunidad universitaria'),(111,'Socialización de los resultados en una reunión de la mesa por el derecho a la salud de la niñez en situación de calle y/o participación en un evento de ciudad relacionado con el tema'),(112,'Participación en eventos académicos de nivel nacional'),(113,'Se firmará acta de acuerdo de propiedad intelectual.'),(114,'Se publicará un artículo en una revista indexada '),(115,'Se presentará al menos, una conferencia a la comunidad universitaria interna sobre los resultados de la investigación'),(116,'Se presentará informe sobre el desempeño de los estudiantes que participaron en el proyecto.'),(117,'Se firmará acta de finalización del proyecto, firmada por el Jefe del Centro de Investigaciones de la Facultad Nacional de Salud Pública.'),(118,'Se firmará acta de liquidación del proyecto'),(119,'Se desarrollará un taller de educación médica y nutricional continuada con el fin de divulgar nuestros  hallazgos entre el personal médico, paramédico y nutricionistas.  '),(120,' Publicación en una revista nacional indexada A1, A2, o B'),(121,' Informe desempeño estudiante de maestría con copia para su hoja de vida.'),(122,' Presentación de resultados en evento académico'),(123,'Taller con la comunidad académica, las instituciones, los jóvenes y las autoridades locales '),(124,'Localización y concertación de jóvenes de la línea de base,'),(125,'evaluación de impacto con casos y controles'),(126,'evaluación de impacto con investigación cualititativa grupos focales'),(127,'entrega y sustentación de resultados.'),(128,'entrevistas, integración de informe cuantitativo y cualitativo'),(129,'Documentos metodológicos'),(130,'Documentos básicos de análisis'),(131,'Documentos de análisis de problemas específicos de salud'),(132,'Documentos de síntesis del ASIS'),(133,'Bases de datos e informes de ejecución'),(134,'Presentación del informe final en medio magnético, '),(135,'Articulo publicado en revista indexada'),(136,'Presentación de los resultados en evento académico.'),(137,'Presentar los resultados ante el grupo de investigacion Gestión y Políticas y el INPEC '),(138,' Publicar artículo en revista indexada'),(139,'Presentación en eventos académicos relacionados con el tema'),(140,'Informe final CD '),(141,'Presentar el proyecto como propuesta de investigación en el encuentro regional de semillero de investigación organizado por la Red Colombiana de Semilleros de Investigación (REDCOLSI) nodo Antioquia.'),(142,'Presentar los resultados parciales y/o totales de la investigación en el Encuentro Nacional de Semilleros de Investigación organizado por la Red Colombiana de Semilleros de Investigación (REDCOLSI).'),(143,'Presentar los resultados del estudio a estudiantes y profesores de la FNSP y a la comunidad universitaria donde sea posible la presentación'),(144,'Organizar una memoria para la biblioteca de la FNSP con las publicaciones de los estudiantes en la revista de la FNSP, resúmenes de ponencias donde participaron estudiantes de pregrado.'),(145,'Presentar informe final (técnico y financiero) del proyecto al centro de investigaciones de la FNSP'),(146,'Publicar los resultados en la Revista de la FNSP u otra'),(147,'Presentar los resultados en diferentes eventos realizados por la red colombiana de semilleros de investigación.'),(148,'Divulgación de resultados en evento programado con los egresados y empleadores y demás públicos de la facultad.'),(149,'Publicación de artículo con resultados en revista de la FNSP'),(150,' Divulgar los resultados en eventos académicos relacionados con el proyecto'),(151,' Articulo  para publicar los resultados de investigación en una revista indexada en las categorías A1, A2 o B        '),(152,'Presentación en evento académico'),(153,' Compartir los resultados con los participantes de la investigación'),(154,'Realizar un diagnostico de la situación, necesidades de capacitación y asistencia  a los Municipios en temas de prevención de la violencia  en el marco de los derechos humanos con énfasis   en los temas de violencia intrafamiliar , consumo de psicoactivos'),(155,'Diseñar los manuales de capacitación  y asistencia  requeridos y los protocolos  de intervención   grupal  para el desarrollo de las actividades y el cumplimiento de los objetivos del proyecto.'),(156,'Conformación de las unidades móviles  en cada subregión  incluyendo el equipo interdisciplinario'),(157,'Diseñar e implementar  un plan de comunicación  y difusión  de las actividades y el desarrollo del proyecto con énfasis en la puesta en marcha de las 5 Unidades Móviles'),(158,'Presentar dos informes de avance a la Gobernación, sobre el estado  de desarrollo del proyecto'),(159,'Presentacion pública en la FNSP'),(160,'Publicacion en la revista de la FNSP'),(161,'Entrega de Informe final y presentación a los implicados en la investigación'),(162,'Hacer entrega de los resultados del proyecto en medio magnético'),(163,'Articulo para revista indexada'),(164,'Socializar los resultados en un evento con ponencia, charla magistral o conversatorio'),(165,'Diseñar un folleto que resuma los principales hallazgos de la investigación'),(166,'Los resultados de la investigación serán comunicados en primer lugar a los agentes involucrados de manera directa en el estudio a través de medio magnético.'),(167,'Dar a conocer al público en general a través de seminarios, congresos, simposios y otros eventos académicos los resultados del estudio.'),(168,'El resultado final de la investigación será publicado en la Revista indexada en categoría Al.'),(169,'Elaboracion y entrega del informe final a la Universidad  y a la Empresa de Servicios Publicos.'),(170,'Socializacion de los resultados del proyecto a la comunidad de usuarios del acueducto del municipio La Pintada y Administracion Municipal y Empresa de Servicios Publicos.'),(171,'Socializacion de los resultados del proyecto a la comunidad universitaria en general.'),(172,'Articulo sometido para publicación en la revista de la FNSP.'),(173,'Trabajo de grado dirigido a la universidad'),(174,'Publicacion en la pagina web de la Red Colombiana de Investigacion en Politicas y sistemas de salud'),(175,'Presentacion en el auditorio de la FNSP'),(176,'Articulo para publicar en una revista indexada'),(177,'Elaborar el documento inicial de sustentacion de proyecto'),(178,'el diseño muestral'),(179,'el protocolo'),(180,'el estudio de costos para el cuarto Estudio Nacional de Salud Buca'),(181,'Informe final de actividades, conclusiones y recomendaciones'),(182,'Movilizar las administraciones municipales'),(183,'Coordinar recoleccion de la informacion y organizar y procesar una encuesta'),(184,'Aplicar el sistema de informacion diseñado por la Gobernacion'),(185,'Entregar un documento con el plan de seguridad ciudadana y justicia de cada municipio'),(186,'apoyar el diseño del modulo de planes de seguridad y justicia'),(187,'ndicarle a las administraciones locales y los ciudadanos las pautas para seguir el plan formulado'),(188,'Suministrar equipo humano y materiales'),(189,'Promocionar la imagen institucional de la Gobernacion y de asesoria de pa'),(190,'Entregar a la asesoria de paz todos los documentos evidenciales'),(191,'Acreditar ante el interventor el cumplimiento con las obligaciones de la seguridad social.'),(192,'Elaboración de un informe que se presentará al Comité de programa de la maestría en Epidemiología de la Facultad Nacional de Salud Pública de la Universidad de Antioquia, y se dejará una copia en la Biblioteca de esta misma Facultad'),(193,'Presentación pública de los resultados en una reunión académica programada por el comité de programa de la Maestría en Epidemiología de la Facultad Nacional de Salud Pública de la Universidad de Antioquia.'),(194,' Envío para publicación de un artículo con los resultados de la investigación en una revista nacional indexada'),(195,'Socialización de los resultados de la investigación en un evento académico nacional.'),(196,'Formación de un estudiante de Maestría en Epidemiología o de la Maestría en Salud Pública'),(197,'Informe Final'),(198,'Publicación de artículo con los resultados del estudioOK'),(199,'Formación de un estudiante de Doctorado de Epidemiología U de AFormación de un estudiante de Maestría en Epidemiología y/o residencia clínica UIS'),(200,'Formación de estudiantes de pregrado de Medicina, Microbiología y Bioanálisis'),(201,'Presentación de los resultados en el Encuentro Nacional de Investigación en Enfermedades Infecciosas y en un Congreso Internacional'),(202,'Publicación científica en una revista nacional y una internacional (A1 o A2) Informe de los resultados del estudio presentados al Ministerio de la Protección Social'),(203,'Propuesta de un sistema de vigilancia en salud pública de la TB en centros penitenciarios'),(204,'Formación de un estudiante de Maestría de la FNSP.'),(205,'Publicación de resultados en revista indexada.'),(206,'Informe Final a entidades financiadoras'),(207,'Publicación de artículo en revista indexada en categoría A, A1 o B nacional o internacional'),(208,'Seminario de divulgación de los resultados de la investigación en la ciudad de Medellín'),(209,'Formación de un estudiante de postgrado'),(210,'Formación de investigadores indígenas de la comunidad de Cristianía'),(211,'Formación de estudiante de Maestría en Epidemiología'),(212,'Libro Narración de la historia del proyecto, experiencia y resultados'),(213,'Artículo en ingles en revista internacional comunicando principales hallazgos'),(214,'Programa educativo en salud sexual para pueblos indígenas, se compone de 12 sesiones con talleres, cine foros y otras dinámicas participativas'),(215,'Plan de acción 2011 - 2013 para prevención de VIH e ITS en Cristianía.'),(216,'Acta de liquidacion'),(217,'Presentacion publica en el auditorio de la FNSP'),(218,'Articulo publicado sobre el estado del articulo de las luchas en Colombia en (Revista B)'),(219,'Realizar el acta de inicio de actividades'),(220,'Realizar una publicación en una revista nacional indexada'),(221,'Elaborar un informe sobre el desempeño del estudiante de maestría durante el desarrollo del estudio con copia a su respectiva hoja de vida.'),(222,'Elaborar un acta de finalización y liquidación del proyecto firmada por el Jefe del Centro de Investigaciones y por los investigadores.'),(223,'Realizar una presentación a la comunidad académica, las instituciones, los jóvenes y las autoridades locales para la presentación de los resultados finales.         '),(224,'Garantizar la confidencialidad de la base de datos generados, de los instructivos, manuales y el instrumento de recolección de la información  y evitar la utilización de este material para otros fines diferentes a los propuestos por la investigación.'),(225,'Documento final de la investigacion'),(226,'Implementación de un inventario de las instituciones/programas sociales que existen en las comunas 1-3,8'),(227,'Implementación de un inventario de los programas asociados con Metrosocial en las comunas 1-2'),(228,'Recolección de datos secundarios sobre los barrios en el estudio de Planeación, Policía, Fiscalía'),(229,'Seguimiento de personas encuestadas en PREVIVA 2003-4 en las comunas 1-3,8'),(230,'Levantamiento de una segunda encuesta a las personas seguidas de PREVIVA 2003-4 en las comunas 1-3, 8'),(231,'Observación del entorno de los barrios donde viven las personas encuestadas'),(232,'Creación y mantenimiento de una base de datos para compilar los datos levantados en la encuesta y en la observación de entorno'),(233,'El proyecto se llevará a cabo con El concurso de tres estudiantes en formación del programa Administración en Salud con Énfasis en Gestión Sanitaria y Ambiental .'),(234,'Divulgación de los resultados a la comunidad del municipio Marinilla, donde se invitará a las autoridades municipales y la comunidad en general con Énfasis en los socios del acueducto rural la Primavera-El Socorro-la Asunción y parte del Alto del Mercado '),(235,'Ponencia en jornadas de investigación de la FNSP'),(236,'Publicación de un artículo de revista A1 o A2'),(237,'Entrega del informe final en la Biblioteca de la Facultad Nacional de Salud Publica OK.'),(238,'Presentar  los resultados a las directivas y a la fnsp   '),(239,'Publicar Articulo'),(240,'Publicación articulo de revista'),(241,'Ponencia en evento nacional o internacional, seguramente en el marco del Congreso  Colombiano de Calidad de aire. '),(243,'Formación en investigación de un estudiante de pregrado, contribuyendo a la formación de futuros investigadores.'),(244,' Escribir un artículo relacionado con el tema de investigación.'),(245,'Poner a disposición de quienes necesiten, los resultados de la investigación y la experiencia lograda en el mejoramiento de la docencia.'),(246,'Articulo enviado para publicacion'),(247,'Presentación a grupos académicos y a los participantes e instituciones comprometidas con el tema'),(248,'Formación de estudiante de pregrado'),(249,'Articulo'),(250,'Formacion estudiante de pregrado  '),(251,'Conferencia de socializacion  a personal directivo y a estudiantes'),(252,'Articulo publicado en revista B, A2 o A1 '),(253,'Taller de divulgacion con docentes y personal de las organizaciones comunitarias'),(254,'Se formaran 2 estudiantes de pregrado'),(255,'Se entregara al Centro de investigacion informe sobre el desempeño de los estudiantes de pregrado'),(256,' Diseñar un modelo de intervencion con perspectiva de genero, en el marco de familias con integrantes desmovilizados de grupos armados ilegales, que incluya protocolos de actuacion, para la prevencion de la violencia intrafamiliar.'),(257,'Modulos con la base conceptual, metodologica e instrumental para aplicar a un programa de intervencion, orientado a la prevencion del desarrollo de violencia en familias con personas desmovilizadas.'),(258,'Validacion del programa de intervencion en dos municipios.'),(259,'Publiacion del material guia para la implementacion del programa de intervencion (Modulos)'),(260,'Asesoria para la extension del programa de intervencion a otras zonas que se establezcan entre las partes del convenio.'),(261,'Las obligaciones que desde el convenio fueron contraidas con la entidad externa.'),(262,'Informe de los resultados de la aplicación de la encuesta '),(263,'Informe final de ejecución del proyecto  '),(264,'Articulo'),(265,'Formacion de estudiantes'),(266,'Ponencia en evento cientifico nacional o internacional'),(267,'Documento con revisión de literatura y manuales nacionales internacionales sobre la oferta de servicios de asesoría para la prueba voluntaria de VIH en servicios de atención a personas con TB'),(268,'Documento con propuesta técnica validada para la incorporación de los servicios de asesoría para la prueba de VIH en los servicios que prestan atención a la población con TB en el SGSSS Colombiano en versión lista para impresión (incluye redacción, diagr'),(269,'Material pedagógico diseñado y validado para pacientes y prestadores que sirven de apoyo a la incorporación de los servicios mencionados (incluye redacción, diagramación y copia en medio magnético).'),(270,'Participar y coordinar con CISALVA-univalle el diseño, implementacion y evaluacion del modulo de conflictos, violencia y DH para cohorte del programa lideres en salud internaciona'),(271,'Disponer de 2 tutores'),(272,'Dar tutoria en los temas relacionados con conflictos y derechos humano'),(273,'Traducir al ingles las principales guias y contenidos basicos del curso.'),(274,'Escrito sobre factores de riesgo y protección asociados a ser agresor de la pareja'),(275,'Recomendaciones de cómo implementar y fortalecer programas y proyectos de prevención de la violencia'),(276,'Escrito sobre el cambio de la violencia conyugal y el maltrato a los hijos entre 2004 y 2007 en el valle de aburra'),(277,'Informe sobre el avance del análisis sobre factores de riesgo y protección asociados al maltrato infantil de la familia.'),(278,'Recomendaciones de cómo implementar y fortalecer programas y proyectos de prevención de la violencia'),(279,'Entrega del informe final.          '),(280,'Presentación del trabajo final ante la comunidad académica en al Facultad Nacional de Salud Pública'),(281,'Certificado por parte del Comité editorial de una revista académica de haber recibido un artículo.'),(282,'Presentación del informe escrito en CD.     '),(283,'Divulgación de los resultados ante la comunidad académica de la Facultad Nacional de Salud Pública.'),(284,'Certificado por parte del Comité editorial de una revista académica de haber recibido un artículo.'),(285,'Presentación del informe final del trabajo de grado en CD  '),(286,'Divulgación de los resultados de la investigación a la comunidad del corregimiento de San Cristobal.  '),(287,'Divulgación de los resultados de la investigación a la comunidad académica '),(288,'Certificado por parte del comité editorial de una revista académica de haber recibido un artículo.'),(289,'Elaboración y entrega del informe final de trabajo de grado a la Universidad y al municipio de Itaguí.  '),(290,'Socialización de los resultados del proyecto a la comunidad académica universitaria en general, por medio de la exposición del trabajo en el auditorio de la FNSP.  '),(291,'Certificación del Comité editorial de una revista académica de haber recibido un artículo.'),(292,'Presentación del informe escrito del trabajo de grado '),(293,'Divulgación de los resultados de la investigación a la comunidad académica '),(294,'Certificado por parte del comité editorial de una revista académica de haber recibido un artículo.'),(295,'Publicación del artículo en revista indexada'),(296,'Participación de al menos un estudiante de pregrado o posgrado de los programas académicos de la FNSP en la implementación del proyecto'),(297,'Presentación a manera de charla, conferencia o taller de los resultados obtenidos del proyecto con autoría de la FNSP (Grupo Salud Mental), U de A y una presentación a la comunidad indígena.'),(298,'Recolección de información por país'),(299,'Procesamiento y análisis con prueba de base de datos, control de calidad, resultados de prueba'),(300,' Informe de la reunión de expertos'),(301,'Coordinación técnica del proceso de recolección de datos por país.'),(302,'Estudiante en formación de Maestría en Salud Pública'),(303,'Protocolo del estudio para establecer la prevalencia e intensidad de infecciones por geohelmintos (Ascaris lumbricoides, Trichuris trichiura y uncinarias) en niños en edad escolar en Antioquia.'),(304,' El protocolo debe ser concertado con las autoridades de salud y de educación de Antioquia, la representación de OPS/OMS en Colombia y el MPS - INS y avalado por ellas.'),(305,'Acta de reunión presentación de la propuesta a las autoridades departamentales de salud.'),(306,'Archivos electrónicos de los productos de punto 1 y 2, en formato de MS  Word o MS Excel (no solamente en formato PDF).'),(307,' Diseño, validación, edición, de la intervención para la prevención secundaria de la violencia de pareja y publicación de los manuales para implementar esta intervención.'),(308,'Estudio sobre factores de riesgo y protección asociados al maltrato infantil en la familia, por sexo de la víctima del agresor.'),(309,'Diseño, validación, edición para la intevención de prevención de la agresión en niños y niñas desde el nacimiento hasta los tres años y publicación de los manuales para implementar esta intervención.'),(310,'Análisis descriptivo sobre las características de las personas que han acudido en el último año a los Centros Zonales de la Ciudad de Medellín del ICBF (base de datos proporcionada por el ICBF al Programa PREVIVA) y comparación con las características de '),(311,'Socializar los resultados de la investigación ante las directivas del Colegio Conquistadores, Fundación Hábitat, Teritorio y Medio Ambiente, estudiantes y docentes del colegio, en el Grupo de Salud y Ambiente y ante la corporación Ambiental del Área Metro'),(312,'Realizar una publicación con los resultados del estudio'),(313,'Presentar los resultados del estudio en un evento nacional donde sea aprobada la presentación.'),(314,'Formación de dos estudiantes de doctorado de la Universidad de Antioquia OK'),(315,'Difusión de resultados ante la comunidad agicultura del municipio de Marinilla del Oriente Antioqueño y ante entidades ambientales y ONG\'s relacionadas con la problemática de los plaguicidas.'),(316,'Publicación de artículo en revista A1, A2 o B.'),(317,'Presentación de resultados al menos en una conferencia o seminario a la comunidad universitaria.'),(318,' Informe sobre el desempeño del estudiante que paricipó en el proyecto, con copia a su hoja de vida académica.'),(319,'Taller sobre educación ambiental comunidad agricultora del municipio de Marinilla.'),(320,'Formación de un estudiante de doctorado en epidemiología en la FNSP U de A'),(321,'Participación de estudiantes de pregrado de la U de A'),(322,'Pasantía internacional'),(323,'Divulgación de los resultados en congreso nacional y/o internacional.'),(324,'Seminario de epidemiología social, enfoques conceptuales y resultados de investigación relacionados con el impacto del contexto social en la salud tendiente a ampliar la panorámica de la cadena causal que cree que están asociadas con los patrones de ECNT'),(325,'Una publicación científica en revista ISI (Web of science) o Scopus nacional y/o internacional A1-A2 y/o B(Revista Biomédica del Instituto Nacional de Salud Colombia, Revista OPS, Social Science and Medicine)'),(326,'Seminario de Epidemiología social dirigido a la comunidad académica.'),(327,'Entrega de cronograma.'),(328,'Informe de prueba piloto'),(329,'Informe de avances cada 6 meses'),(330,'Informe final con el resultado de la investigación'),(331,'Informe final administrativo y financiero de la ejecucuión de los recursos asignados por la ESE Metrosalud para el desarrollo del proyecto.'),(332,'Divulgación de los resultados en la ESE Metrosalud con los responsables de los programas de hipertensión y diabetes, de salud familiar y a los que a bien considere la empresay el equipo directivo de la institución. PENDIENTE'),(333,'Formación de un Estudiante de Maestría'),(334,'Someter un artículo a publicación en una revista internacional'),(335,'Someter un artículo para publicación en revista nacional indexada'),(336,'Presentación de los resultados en evento académico'),(337,'Se realizará una publicación en revista nacional o internacional indexada A1, A2 ó B.'),(338,'Se presentarán y socializarán los resultados con la comunidad académica y con generadores de programas de reinserción'),(339,'Formación de estudiante de pregrado de Gerencia de Sistemas de Información en Salud.OK'),(340,'Publicación de un artículo en Revista Indexada, categoría A o B. '),(341,'La formación de tres estudiantes de pregrado: Dos estudiantes de prácticas académicas en investigación del Departamento de Psicología de la Facultad de Ciencias Sociales y Humanas de la Universidad de Antioquia, y la tercera de la misma facultad. quien de'),(342,'Así mismo las estudiantes participarán en la edición de materiales. en la socialización de resultados y en la presentación final de la investigación en evento académico en la FNSP. Ok'),(343,'Una publicación científica en revista ISI (Web of science) o Scopus nacional y/o internacional A1-A2 y/o B(Revista Biomédica del Instituto Nacional de Salud Colombia, Revista OPS, Social Science and Medicine)'),(344,'Publicación en una revista revista indexada en categoría A,A1 o B de carácter nacional o internacional.  '),(345,'Divulgación de resultados a la comunidad académica y tomadores de decisiones'),(346,'Formación de un estudiante de la FNSP. '),(347,'Los resultados de la investigación se darán a conocer a las instituciones que participaron brindando información requerida para el estudio, mediante comunicación con el resumen de los resultados obtenidos.'),(348,'Presentación de los resultados a la comunidad académica'),(349,'Presentación de los resultados de la investigación en un Congreso Nacional o internacional.'),(350,'Comunicación   científica  para  someter a evaluación para   Publicación en revista  Nacional o  Internacional categoría  A1 o A2'),(351,'Entrega de informe final del proyecto '),(352,'Publicación en una revista indexada, categoría A'),(353,'Presentación del trabajo en un evento científico nacional. '),(354,'Formación  de un estudiante de posgrado del Doctorado en Salud pública'),(355,'Contribución a la formación de un (1) estudiante de doctorado en salud pública.'),(356,'Contribución a la formación de un (1) estudiante de Maestría en salud pública  Nal. de Bogotá.Pendiente respuesta Colciencias, Vanesa Giraldo participación escritura de artículo'),(357,'Publicación de artículo en revista internacional indexada'),(358,'Publicación de artículo en revista nacional indexada.'),(359,'aller sobre  Construcción de un modelo teórico / metodológico para el análisis de las luchas por la salud.'),(360,'Presentación de resultados a la comunidad educativa a través de una ponencia de orden nacional o internaciona'),(361,'Realización de un foro con los actores e instituciones interesados en el tema donde se socializan y discuten los hallazgos.'),(362,'Entrega de Base de datos sobre lucha por la salud en Colombia entre 1994-2010 que incluye: actores convocantes, participantes, adversarios, tipo de lucha, cobertura, motivo de la protesta. '),(363,'Artículo publicado en revista  A1 o A2'),(364,'Divulgación de resultados a la comunidad académica '),(365,'Vincular estudiante de pregrado de la FNSP '),(366,'Presentación informe final de la investigación por escrito'),(367,'Sustentación pública del informe final de la investigación'),(368,'Socialización de los resultados de la investigación a la Secretaría de Salud, y las instituciones que participaron en el desarrollo.'),(369,'Un manuscrito (publicación científica) en medio físico y magnético (CD archivo'),(370,'Documento final en medio físico y magnético (CD en formato PDF), con los'),(371,'Documento final en medio físico y magnético (CD en formato PDF), con los resultados de la investigación, siguiendo las normas de presentación de resultados de investigación científica  y teniendo en cuenta la metodología utilizada. Del informe final aprob'),(372,'Manuscrito (publicación científica) en medio físico y magnético para la revista Salud Pública de Medellín, la cual deberá presentarse siguiendo las normas para autores de esta revista. '),(373,'Socialización de los resultados de la investigación a la Secretaría de salud de Medellín, al sector académico y especialistas en el área, en un evento académico programado por las partes del convenio.'),(374,'Informe prueba piloto '),(375,'Informe parcial del proyecto'),(376,'Informe final del proyecto'),(377,'Artículo publicado en revista nacional clasificada en publindex en categoría A1, A o B, o en revista extranjera en SCOPUS'),(378,'Elaboración y entrega del informe final a la Universidad.'),(379,'Socialización de los resultados del proyecto en el Grupo de Investigación Demografía y Salud.'),(380,'Certificado del Comité Editorial de una revista académica de haber recibido el artículo para su publicación.'),(381,'Elaboración de 200 folletos con los principales resultados obtenidos en la investigación para ser entregado a las entidades gubernamentales.'),(382,'Entregar informe final en la biblioteca de la Facultad Nacional de Salud Pública'),(383,'Un artículo con los resultados de la investigación para ser sometido a publicación en una revista categoría A.'),(384,'Entregar documento con los resultados de la investigación a Metrosalud.'),(385,'Divulgación de los resultados a la comunidad académica.'),(386,'Realizar al menos 1 charla sobre tuberculosis infantil al personal de salud de las instituciones participantes en el proyecto.'),(387,'Entrega de informe final a la Biblioteca de la Facultad Nacional de Salud Pública'),(388,'Presentación sobre los resultados de la investigación, dirigida a académicos de psicología y salud mental, con invitación especial a las personas que participaron en el estudio.'),(389,'Entrega del informe final a la biblioteca de la Facultad Nacional de Salud Publica'),(390,'Realización del diagnóstico: base consolidada con los documentos de consulta al respecto.'),(391,'Micro site: Foro virtual'),(392,'Un foro presencial'),(393,'Tres (3) mesas de trabajo bajo metodología inspirada en conferencias de Consenso ciudadano CCC'),(394,'Un informe que contenga: descripción metodológica; Análisis, resultados y logros de la experiencia participativa en sus diferentes fases; Documento de la agenda priorizada de ciencia, tecnología e innovación en salud de la zona centro-occidente, 2010 - 2'),(395,'Tesis de investigación con los resultados en la biblioteca de la FNSP'),(396,'Artículo publicado en revista nacional clasificada en publindex en categoría A1, A o B, o en revista extranjera en SCOPUS'),(397,'Participación como ponente en la “Fiesta del libro”: presentación de avances en la contextualización del proyecto y gestión con las organizaciones comunitarias '),(398,'Participación en la Feria de la CT+I: presentación de avances Metodológicos.'),(399,'Participación como ponente en evento propio de la Red de Jóvenes Investigadores de Metrojuventud, Alcaldía de Medellín, Parque Explora.'),(400,'Entrega de Informe escrito con los resultados del proyecto'),(401,'Escritura de un artículo publicable en una revista nacional indexada'),(402,'Taller de socialización de resultados con la comunidad participante de la investigación, la sociedad civil, la red de organizaciones comunitarias y la Mesa Interbarrial de Desconectados.'),(403,'Cumplir con los términos de referencia que se proponen en la convocatoria.'),(404,'Participación en el mes de septiembre en la fiesta del libro: con avances generales del proyecto '),(405,'Participar en el mes de octubre en la Feria de la CT+I con los avances Metodológicos'),(406,'Entrega  parcial del articulo publicable, el  8 de noviembre de 2011'),(407,'Entrega del artículo publicable: noviembre 15 de 2011'),(408,'Participar en el mes de diciembre en el evento propio de la Red de Jóvenes investigadores y entrega del informe final de investigación'),(409,'Presentación de los resultados y el informe final ante el grupo de  Investigación de Salud mental (GISAME) de la Facultad Nacional de Salud Pública.'),(410,'Entrega del informe final en la biblioteca de la Facultad Nacional de Salud Pública.'),(411,'Redacción informe final'),(412,'Un artículo A1 o A2'),(413,'Presentación de los resultados como ponencia a nivel nacional y/o internacional.'),(414,'Recolección de información por país.'),(415,'Procesamiento y análisis con prueba de base de datos, control de calidad, resultados de prueba'),(416,'Informe de la reunión de expertos'),(417,'Coordinación técnica del proceso de recolección de datos por país.'),(418,'Estudiante en formación de Maestría en Salud Pública'),(419,'Una presentación privada a los directivos de la Institución (Metrosalud)'),(420,'Una presentación pública en el auditorio de la Facultad Nacional de Salud Pública'),(421,'Un informe técnico dirigido a la institución'),(422,'Un artículo listo para publicar en una revista indexada nacional'),(423,'Presentación de los resultados ante la comunidad indígena del municipio de Medellín y ante entidades gubernamentales y no gubernamentales relacionadas con la problemática de los pueblos indígenas.'),(424,'Artículo en revista nacional clasificada en publindex en categoría A1, A o B, o en revista extranjera en SCOPUS. '),(425,'Difusión de los resultados del estudio en un evento de carácter nacional relacionado con el tema.'),(426,'Un producto de divulgación sobre los resultados de la investigación (artículo en revista de divulgación). Se homologó por diseño de video que fue publicado en la plataforma de You tube. '),(427,'Formación de estudiante de pregrado. '),(428,'Informe final de investigación a la Maestría en Salud Mental'),(429,'Entrega de Informe  a la Dirección del Sistema de Bibliotecas de la UdeA'),(430,'Entrega de informe final a la Biblioteca de la Facultad'),(431,'Entrega del Informe final en la biblioteca de la Facultad Nacional de Salud Pública'),(432,'Publicación nacional de un artículo científico '),(433,'Artículo en revista nacional clasificada en publindex en categoría A 1, A o B, o en revista extranjera en SCOPUS.Compromiso eliminado por medio de Adenda al acta 205.'),(434,'Difusión de los resultados del estudio en un evento de carácter nacional relacionado con el tema.relacionado con el tema.'),(435,'Publicación de artículo en revista indexada A1.'),(436,'Participación en el rol de autoría o coautoría con el estudiante de Maestría, en la publicación de un artículo en una revista.'),(437,'Dirección de un trabajo de investigación para optar el título de Magister.'),(438,'Presentación de una conferencia o seminario a la comunidad universitaria sobre los resultados de la investigación. '),(439,'Participación con ponencia en un evento académico nacional o internacional.'),(440,'Informe sobre el desempeño del estudiante que participó en el proyecto, con copia a su hoja de vida académica. '),(441,'Elaborar un artículo de divulgación.'),(442,'Retroalimentar con la información a las instituciones participantes en el  proceso   de investigación.'),(443,'Presentación de los resultados en un evento académico.'),(444,'Artículo publicado en revista nacional clasificada en publindex en categoría A1, A o B, o en revista extranjera en SCOPUS'),(445,'Informe técnico donde se describe la metodología, resultados, conclusiones'),(446,'Plegable con un resumen ejecutivo de los principales hallazgos y recomendaciones'),(447,'Presentación en POWER POINT con la metodología, resultado, conclusiones'),(448,'Presentación de los Resultados a la Junta Directiva y a los pilotos de ACDAC (los costos de desplazamiento de dos de las personas que participarán en este convenio será asumido por la ACDAC)'),(449,'Entrega de CD con versiones electrónicas de todos los documentos que fueron revisados y analizados. Esta información será entregada a la Junta Directiva de ACDAC en un máximo de diez (10) días después de cumplido el plazo para concluir la investigación d'),(450,'Informe escrito con los resultados del proyecto en la Biblioteca de la FNSP.'),(451,'Publicación de un artículo en una revista Nacional indexada  A2. (CT 202 del 24/01/2017, aprobó cambio de categoría para la publicación en revista (A1 a A2) '),(452,'Presentación de resultados en jornadas de investigación FNSP.'),(453,'Divulgación de resultados en Coloquio Nacional de Investigación.'),(454,'El CTI 202 del 24/01/2017recomienda considerar una vez vencido el 6 plazo, sino se ha logrado la publicación, cerrar el proyecto en consideración de la categoría de la revista (incluso A 2) pues estas revistas no se interesan por estos temas y menos cuand'),(455,'Informe técnico que será entregado a las autoridades del INPEC y la Cárcel de Máxima Seguridad de Itaguí. Pendiente solicitarle soportes del acuerdo con el instituto para valer este compromiso con las ponencias.'),(456,'Ponencia que será presentada en eventos académicos tipo congreso, seminario o foro. Ok'),(457,'Un producto de divulgación sobre los resultados de la investigación (artículo en revista de divulgación)'),(458,'Informe técnico con resumen ejecutivo que contenga los resultados más relevantes del estudio.'),(459,'Presentación en power point con la metodología, resultados conclusiones y recomendaciones'),(460,'Presentación de los resultados a la Junta directiva y a un grupo significativo de los trabajadores de Copa Airlines Colombia'),(461,'Entrega de Cd con la totalidad de los materiales, docmentos, bases de datos y demás que dieron soporte al estudio'),(462,'Publicación de artículo de difusión científica, en revista A1 o A2, que dé cuenta del estimativo de los tamaños de la población.'),(463,'Entrega de informe resumen del estudio para entregar al Instituto Colombiano de Bienestar Familiar, la Alcaldía Municipal, entidades de control y organismos del Sistema Nacional de Bienestar Familiar y del Sistema General de Seguridad Social en Salud'),(464,'Elaboración de póster que representa los resultados en mapas de las comunas de estudio'),(465,'Socialización de los resultados en evento académico.'),(466,'Socialización de los resultados en espacios de gestión de política pública en la ciudad (Comité Técnico de Política Pública de Infancia y Adolescencia, COMPOS, COPACO, Concejo de Medellín, otros).'),(467,'Formación de estudiante de pregrado. Ok'),(468,'Informe final en formato de artículo publicable'),(469,'Elaboración de un informe que se presentará al Comité de programa de la maestría en Epidemiología de la Facultad Nacional de Salud Pública de la Universidad de Antioquía, del cual se tendrá una copia en la Biblioteca.'),(470,'Presentación pública de los resultados en una reunión académica programada por la línea de Análisis de Situación de Salud — ASIS — de la Maestría en Epidemiología de la Facultad Nacional de Salud Pública de la Universidad de Antioquia.'),(471,'Socialización de los resultados en instituciones públicas y privadas (organizaciones sociales, ONGs, autoridades de salud) que estén interesadas en formular intervenciones que favorezcan la inclusión social y el mejoramiento del estado de salud y de la ca'),(472,'Envío para publicación de un artículo con los resultados de la investigación en una revista nacional indexada'),(473,'Formación de dos estudiantes de pregrado de programas de ciencias sociales y de la salud de la Universidad de la Guajira.'),(474,'Formación de un estudiante de doctorado inscrito a un programa de ciencias sociales y de la salud.'),(475,'Formación de un estudiante de doctorado inscrito a un programa de ciencias sociales y de la salud.'),(476,'Creación de un semillero de investigación en salud pública, con 5 estudiantes en formación de la Universidad de la Guajira.'),(477,'Vinculación de 5 estudiantes de investigación en salud pública del semillero de epidemiología UdeA'),(478,'Curso interuniversitario de promoción y prevención de VIH y otras ITS que incluye 12 estudiantes de la Universidad de la Guajira,'),(479,'Un libro sobre la experiencia del trabajo con los wayüu en relación con los hallazgos de la investigación con indígenas en Cristianía (Soroeste Antioqueño)'),(480,'Un artículo en revista acerca de las percepciones del uso y aceptación del condón en la comunidad Wayuu.'),(481,'Un artículo en revista acerca de la efectividad del proceso de formación de los líderes.'),(482,'Un artículo en revista sobre la caracterización de la situación de VIH desde los determinantes en las comunidades Wayuu.'),(483,'Una cartilla donde se presentan las guías de intervención en salud sexual y reproductiva contextualizadas al medio.'),(484,'Un libro (material educativo) acerca de la prevención del VIH y otras ITS. Segunda edición'),(485,'Una ponencia, exposición de resultados en un congreso internacional'),(486,'Dos ponencias, exposición de resultados en congresos regionales'),(487,'Creación del Sistema de información geográfica (SIG) de la comunidad Wayuu de Maicao.'),(488,'Ocho programas de radio sobre educación en prevención de VIH en lengua Wayuunaiki y en español'),(489,'Video sobre las experiencias del proceso con la comunidad Wayuu.'),(490,'Formación de un estudiante de maestría o doctorado, salud pública, ciencias políticas '),(491,'Artículo de prensa que presente los hallazgos más relevantes'),(492,'Dos artículos de resumen con los hallazgos relevantes para revista indexada nacional o internacional '),(493,'Un libro que presente los principales resultados (500 ejemplares impresos) '),(494,'Una ponencia, presentación de resultados en un congreso nacional o internacional en temáticas con la salud. '),(495,'Apoyar en la formación de estudiante de maestría para adquirir capacidades para trabajo de campo.'),(496,'Artículo en revista: magnitud de las conductas de riesgo para la salud'),(497,'Artículo en revista: Efectos de la política pública de prevención de la violencia y promoción de la convivencia del valle de aburra'),(498,'Artículo en revista: Evaluación de la implementación de la política pública'),(499,'Informe técnico: Conocimiento sobre los factores asociados a las de violencia interpersonal, agresor de la pareja y del menor de 5 años y del consumo de licor hasta la embriaguez.'),(500,'Informe técnico efectos de la política: Conocimiento a cerca de los efectos de la política pública de prevención de la violencia y promoción de la convivencia Medellín y el área metropolitana.'),(501,'Informe técnico: Conocimiento acerca del grado de avance en el logro de las metas de la política pública de prevención de la violencia y promoción de la convivencia.'),(502,'Informe técnico: Conocimiento acerca del grado de avance en el logro de las metas de la política pública de prevención de la violencia y promoción de la convivencia'),(503,'Informe técnico: Evaluación de la implementación de la política pública de prevención de la violencia y promoción de la convivencia Medellín y el área metropolitana.'),(504,'Informe técnico: Conocimiento acerca de la variación en los factores de riesgo y protección asociados a la agresión y a las conductas de riesgo para la salud.'),(505,'Informe técnico: Conocimiento acerca del grado de satisfacción de los actores involucrados con respecto a la implementación o no de la política pública de prevención de la violencia.'),(506,'Informe técnico: Conocimiento acerca del grado de avance en el logro de las metas de la política pública de prevención de la violencia y promoción de la convivencia Medellín y el área metropolitana.'),(507,'Informe técnico: Conocimiento acerca del grado de satisfacción de los actores involucrados con respecto a la implementación o no de la política pública'),(508,'Informe técnico: Triangulación de avance, continuidad y sostenibilidad de la política pública de prevención de la violencia y promoción de la convivencia Medellín y el área metropolitana.'),(509,'Se realizara una publicación en ISI (Web of Science) o Scopus o en revista Al o A2'),(510,'Artículo de revista, libro o capitulo de libro en el que se encuentren los resultado de investigación con participación del estudiante en formación'),(511,'Un artículo en revista de divulgación'),(512,'Se dirigirá un trabajo de investigación para optar al titulo de Magister. Se presentará un informe sobre el desempeño del estudiante durante el desarrollo del estudio con copia a su respectiva hoja de vida'),(513,'Se realizará el acta de inicio en la que estará consignado el acuerdo de propiedad intelectual.'),(514,'Se realizará un acta de finalización de proyecto firmada por el Jefe del Centro de Investigaciones y por los investigadores.'),(515,'Se realizará un acta de liquidación del proyecto.'),(516,'Presentación de resultados en evento académico internacional.'),(517,'Se realizará un taller con la comunidad académica para la presentación de los resultados.'),(518,'Artículo en revista ISI (WEB of Science) o Scopus en revista A1 o A2.      '),(519,'Artículo de revista de autoría o en coautoría del estudiante.'),(520,'Artículo en revista de divulgación.'),(521,'Dirección de trabajo de investigación para optar al título de Magister.'),(522,'Presentación de resultados en un congreso a nivel nacional'),(523,'Presentación de los resultado de la investigación a los actores (empresas Promotoras de Servicios – EPS), participantes en el proyecto. '),(524,'Informe final sobre los resultados de la investigación'),(525,'Informe sobre el desempeño del estudiante que participó en el proyecto, con copia a su hoja de vida académica.'),(526,'Artículo en revista ISI (WEB of Science) o Scopus en revista A1 o A2. (Objetivo 5 Adenda)'),(527,'Certificado de entrega del informe final a la biblioteca de la FNSP'),(528,'Certificado de divulgación de los resultados de la investigación'),(529,'Un artículo publicado en revistas ISI (Web of Science) o Scopus o en revistas ; Al o A2'),(530,'Dirección de un trabajo de investigación para optar al título de Magíster'),(531,'Participación en un congreso nacional o internacional con ponencias o poster'),(532,'Presentación de una conferencia o un seminario a la comunidad universitaria sobre los resultados de la investigación'),(533,'Presentación de los resultados al ICBF'),(534,'Certificado de entrega del informe final en la biblioteca de la FNSP'),(535,'Resumen de los resultados de investigación a la IPS universitaria y Clínica Sagrado Corazón'),(536,'Entrega del informe final a la biblioteca de la FNSP'),(537,'Presentación de los resultados preliminares en el día Mundial de la TB 2012 y/o a los funcionarios encargados del PCT de Medellín.'),(538,'Entrega de informe final a la biblioteca FNSP'),(539,'Dos evaluaciones de dos expertos diferentes '),(540,'Dos evaluaciones emitidas por dos expertos con amplia experiencia en bioestadistica y en la estimación de modelos aplicables a estudios epidemiologicos'),(541,'Un resumen ejecutivo de los hallazgos de la evaluaciones '),(542,'Un informe de evaluación que incluya la metodología utilizada y los anexos que se requieran para su sustenctación'),(543,'Una presentación ante ASOCAÑA, la asociación neumologica colombiana y la Universidad de la salle sobre los resultados de la evaluación'),(544,'Un archivo en power point con los puntos mas importantes de los hallazgos.'),(545,'Informe Parcial'),(546,'Informe final'),(547,'Resumen ejecutivo: de maximo dos páginas en el que se resalte de forma suscinta y clara: temas de foco, metodología, conclusiones/recomendaciones de acuerdo al anexo 1.'),(548,'Presentación del informe escrito del trabajo de grado. '),(549,'Divulgación de los resultados de la investigación a la comunidad académica.'),(550,'Certificado por parte del comité editorial de una revista academica  de haber recibido el articulo.'),(551,'Documento final de la investigacion'),(552,'Artículo para publicar en la revista de Salud Púbica de Medellín'),(553,'Actividad de Socialización ante el sector academico y la secretaria de salud de los resultados más relevantes'),(554,'Documento con la construcción de planes institucionales de control de la tuberculosis, con base en los resultados encontrados.'),(555,'Entregar informe de avance e informe final así:informe parcial- septiembre 2012,informe final- Diciembre 2012'),(556,'Formación de un estudiante de Doctorado en Epidemiología '),(557,'Dos envios de artículos de revistas nacional o internacional '),(558,'Una presentación pública de los resultados '),(559,'Documento que consolide la metodología sobre planes locales de control de la tuberculosis en las unidades hospitalarias'),(560,'Guía nacional de prevención de la transmisión institucional de la tuberculosis de acuerdo con las orientaciones de la OMS y las mejores tecnologías disponibles OK'),(561,'YOMI VIDA: realizar cuatro grpos focales con niños y niñas de cuarto grado y uno con un grupo de docentes, ambos pertenecientes  a las 42 instituciones educativas que han estado en el proceso 2009-2011.'),(562,'RETOMEMOS: realizar cuatro grupos focales con jovenes que han participado en el programa 2010-2011 y un grupo de docentes de dichas instituciones.'),(563,'Elaborar y presentar informe parcial e informe final'),(564,'Informe parcial de avance'),(565,'Informe final contentivo de los productos y actividades pactadas, el cual deberá ser entregado en medio físico y copia magnética'),(566,'Documento con el ajuste del protocolo y marco muestral utilizados en la prueba piloto realizada por la Universidad durante los años 2011-2012, en cuanto a su diseño metodológico, de tal manera que se adapte para la Encuesta Nacional de Parasitismo Intesti'),(567,'Documento con los resultados de la encuesta realizada que comprende: la toma de muestra de material fecal y hemoglobina, pesar y tallar a los participantes; la aplicación de una encuesta escrita de factores de riesgo y desempeño escolar, y el analisis de'),(568,'Elaborar Acta de propiedad intelectual'),(569,'Entrega de informe final que de cuenta  del proceso de validación del instrumento ISO-30 en el centro de investigación en físico y en CD (octubre 2013).'),(570,'Formación de un estudiante de Maestría'),(571,'Artículo publicado en revista A1, A2 o B reconocido por Colciencias (Octubre 2013). Compromiso homologado por:  Artículo impreso, “Validation of the Spanish Version of the Inventory of Suicide Orientation - ISO 30 in Adolescent Students of Educational Ins'),(572,'Presentación oral o en poster de los resultados de la validación del instrumento en evento academico (junio 2013): Compromiso homologado por: Certificación de un taller realizado con docentes en la institución educativa Presbítero Antonio José Bernal Lon'),(573,'Socialización de los resultados con los desempleados participantes  en el estudio y demás actores involucrados.'),(574,'Artículo publicado en revista indexada nacional A1 SCOPUS o ISI'),(575,'Divulgación de los resultados en evento académico nacional o internacional. '),(576,'Entrega de informe final al Centro de Investigación y a la Biblioteca FNSP. '),(577,'Un informe final tecnico y financiero en el mes de enero de 2013.'),(578,'Exponer los avances en investigación en el campo de los fenomenos de consumo de SPA y su asociación con la salud mental con la Salud Mental en la región.'),(579,'Presentar los avances, en los diseñios, ejecución y evaluación de los programas e intervenciones clínicas, comunitarias y de apoyo psicosocial para el abordaje del fenomeno de los consumos de SPA en la región.'),(580,'Realizar un evento del 01 al 02 de noviembre 2012'),(581,'Garantizar la participación de minimo un conferencista nacional'),(582,'Garantizar la participación de minimo dos conferencistas internacionales'),(583,'Entrega de informe final a la Biblioteca de la Facultad'),(584,'Divulgar los resultados de la investigación, al menos en una institución que trabaje con niños en situación de calle. '),(585,'Publicar un artículo en una Revista indexada A1, A2 o B del Publindex.'),(586,'Presentar los resultados de la investigación en las Facultades de Salud Pública  y Enfermería '),(587,'Participar como ponente en un evento nacional, con el fin de divulgar los resultados de la investigación'),(588,'Presentar un informe acerca de los avances logrados por el estudiante de pregrado en el desarrollo de la investigación '),(589,'Presentar a una convocatoria interna un proyecto de investigación, que permita avanzar en el abordaje  de la temática de niñez en situación de calle desde una perspectiva que involucre la opinión de los niños. '),(590,'Componente de capacitación '),(591,'proceso de capacitación a mediadores y a profesionales: Diseño de capacitaciones, guías metodológicas y kit de materiales; Capacitación a mediadores; Capacitación a profesionales de salud y personal de la salud.'),(592,'Diseño de seminarios de juventudes'),(593,'Componente fortalecimiento de la participación juvenil en salud'),(594,'Levantamiento de linea de base de la participación juvenil, con enfasis en temas de salud en la ciudad de Medellín: diagnistico situacional de la participación juvenil en Medellín; Diagnostico rapido participativo con lideres significativos juveniles'),(595,'procesos de capacitación para el fortalecimiento en ciudadania juvenil: diseño y producción de la estrategía para capacitación en participación en salud y ciudadania juvenil; capacitación a jóvenes'),(596,'procesos de capacitación para el fortalecimiento en ciudadania juvenil: diseño y producción de la estrategía para capacitación en participación en salud y ciudadania juvenil; capacitación a jóvenes'),(597,'procesos de acompañamiento a los jóvenes para su inserción en espacios de participación en salud'),(598,'desarrollo de propuestas comunicacionales y artisticas relacionadas con tema  de salud de jóvenes para jóvenes: propuestas que han sido desarrolladas y que tengan algún grado de implementación; Ideas de propuestas que requieran 100% de desarrollo e imple'),(599,'Componente sistema de monitoreo y evaluación'),(600,'Hacer delimitación de indicadores '),(601,'Diseñar un instrumento para recojer la información de manera sencilla y sistematica (herramienta tecnologica) que permita recoger la información significativa de los distintos componentes del programa.'),(602,'proceso de seguimiento y evaluación de la estrategia de servicios amigables para adolescentes y jovenes: Evaluación de la implementación del programa servicios amigables para jóvenes; Evaluación del impacto de la efectividad de la estrategía.'),(603,'Componente de sistematización de la experiencia.'),(604,'Antecedentes del programa jóvenes por la vida'),(605,'Implementación del prograna jóvenes por la vida'),(606,'delimitación de un modelo'),(607,'Presentación del informe escrito del trabajo de grado'),(608,'Divulgación de la investigación a la comunidad academica.'),(609,'Certificado de aceptación de resumen en un evento academico'),(610,'Entrega de informe de la investigación a la comunidad de esfuerzos de paz II'),(611,'Artículo publicado en revista nacional o internacional indexada A1, A2 o B'),(612,'Socializar los resultados en la comunidad academica y con generadores de procesos y programas'),(613,'Formación de un estudiante'),(614,'Formación de un estudiante de doctorado en epidemiología'),(615,'Formación de tres estudiantes de pregrado'),(616,'Formación de tres profesionales del área de la salud del proyecto (médico y enfermeras) y una profesional en gerencia en sistemas de información en salud'),(617,'Formación de cien personas privadas de la libertad, personal de guardia del INPEC, personal de sanidad de las tres cárceles'),(618,'Dos artículos sometidos a dos revistas, una nacional y una internacional,clasificada como Al del sistema Publindex'),(619,'Memorias de la presentación de los resultados del proyecto en dos eventos'),(620,'Un folleto sobre síntomas respiratorios y tuberculosis'),(621,'Una cartilla sobre tuberculosis, tratamiento y seguimiento'),(622,'Cien certificados de entrenamiento en el sistema de vigilancia implementado en'),(623,'Un protocolo de sistema de vigilancia'),(624,'Se trabajará en conjunto con Manitoba HIV Program para asesoría permanente'),(625,'Difusión de los resultados cuatro Comité de Vigilancia Epidemiológica en eventos académicos y en la reunión del del Departamento de Antioquia'),(626,'Presentación de los resultados del proyecto en dos eventos científicos, uno nacional y otro internacional'),(627,'Quince presentaciones de socialización de los resultados a las personas privadas de la libertad, al personal de salud y de guardia del INPEC'),(628,'Diez talleres de entrenamiento sobre TB y síntomas respiratorios, así como del funcionamiento del programa de TB que se están implementando realizado a las personas privadas de la libertad, al personal de salud y de guardia del INPEC y a las autoridades d'),(629,'Un video sobre la TB y síntomas respiratorios en centros penitenciarios, el cual'),(630,'Una pasantía internacional del estudiante de doctorado.'),(631,'Formación de un estudiante de maestría'),(632,'Realización de un evento para presentar los resultados y sus implicaciones en las politicas publicas'),(633,'Publicación de artículo en revista indexada acerca de los efectos del programa en las conductas de los niños'),(634,'Realización  de un taller con 300 docentes de 16 escuelas sobre el conocimiento de los efectos del programa y como mejorar su implementación.'),(635,'Promover programas de prevención temprana de las conductas de riesgo en escolares y preescolares del área meropolitana del valle de Aburrá y otros municipios'),(636,'Una pasantía en universidad extranjera para profundizar analisis de la información.'),(637,'Dos ponencias sobre los resultados en eventos nacionales o internacionales'),(638,'Conocer el efecto atribuible al programa y como se cambian las trayectorias hacia las conductas de riesgo.'),(639,'Públicación de un artículo científico en la revista indexada en septiembre 2013.'),(640,'Presentación de resultados en Congreso Internacional de Salud Pública Noviembre 2013.'),(641,'Formación de un estudiante de doctorado en Salud Comunitaria.'),(642,'Socialización de los resultados a nivel comunitario y/o institucional'),(643,'Entrega de informe final a la bibloteca FNSP'),(644,'Informe final de evaluación externa que contengan los productos de la Fase I, Fase II,  Fase III relacionados en el contrato.'),(645,'Cronograma y prueba piloto '),(646,'Informe de avance '),(647,'Informe final'),(648,'Artículo presentado a publicar en revista internacional indexada'),(649,'Presentación de los resultados en conferencia nacional '),(650,'Presentación de los resultados a la comunidad general'),(651,'Presentación de los resultados a la comunidad academica'),(652,'Análisis de la revisión bibliográfica de sistemas de indicadores de atención médica prehospitalaria para accidentes de tránsito. '),(653,'Análisis del marco legal colombiano vigente en materia de atención médica prehospitalaria para accidentes de tránsito'),(654,'Propuesta inicial del sistema de indicadores a ser adoptados en el contexto nacional el cual se someterá a aprobación de la CFPV'),(655,'Listado de actores, entidades y sistemas de información clave para acceder a información relacionada con atención médica prehospitalaria para accidentes de transito en el país.'),(656,'Análisis preliminar de los factores críticos que afectan la disponibilidad y viabilidad de consulta de información y, por ende, la estimación del sistema de indicadores.Este producto deberá ser entregado seis (6) semanas después de la firma del acta de in'),(657,'Documento con las fichas técnicas de cada uno de los indicadores del sistema,construidas acogiendo la normatividad técnica vigente sobre indicadores de salud.'),(658,'Presentación de la propuesta metodológica para estimar el sistema de indicadores de atención médica prehospitalaria para accidentes de tránsito.'),(659,'Listado de contactos identificados para revisar/consultar fuentes de información y realizar entrevistas a las que haya lugar, en la concesión vial y las ciudades del grupo objetivo, junto con cronograma tentativo de citas. '),(660,'Este producto deberá ser entregado nueve (9) semanas después de la firma del acta de inicio.'),(661,'Presentación que incluya la exposición de los resultados del pilotaje en una ciudad pequeña y una intermedia.'),(662,'Presentación del sistema de indicadores '),(663,'Informe final (este producto deberá ser entregado 22 semanas despues de la firma del acta de inicio). '),(664,'Presentación de las principales conclusiones      '),(665,'Asistencia a reuniones periódicas de seguimiento.                                                      '),(666,'Publicado en revista nacional o internacional indexada'),(667,'Socializar los resultados en la comunidad academica '),(668,'Socializar los resultados con los diferentes actores generadores de procesos y programas en salud mental'),(669,'Formación de un estudiante de pregrado'),(670,'Entrega del informe final a la biblioteca de la FNSP'),(671,'Informe ejecutivo con los resultados de la investigación para el INS y el Ministerio de Salud y protección social (dirección de salud pública y subdirecciones de salud ambiental, epidemiologica y demografica).'),(672,'Presentación pública de la investigación (proceso y/o resultado) en un evento (talleres o seminarios o club de revista) organizado directamente por la dependencia academica o investigativa a cargo del proyecto.'),(673,'Artículo con  los resultado de la investigación para la publicación en una revista indexada nacional o internacional categoría A o B.'),(674,'Presentación de resultados en la conferencia científica del Instituto Nacional de Salud.'),(675,'Realizar un estudio exploratorio que permita conocer las necesidades de formación que tienen las diversas organizaciones que trabajan  en el ámbito de atención psicosocial en desastres y emergencias en Colombia.   '),(676,'Realizar un estudio exploratorio sobre las creencias y realidades en materia de atención psicosocial en desastres que tienen los diferentes actores sociales.                                                                                                  ');
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
INSERT INTO `tiposentidad` VALUES (1,'Educación'),(2,'Empresa'),(3,'ONG'),(4,'Municipal'),(5,'Departamental'),(6,'Departamento Administrativo'),(7,'Ministerio'),(8,'Instituto de Investigación'),(9,'Instituto Descentralizado');
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
INSERT INTO `tiposestudiantes` VALUES (1,'Pregrado'),(2,'Maestría'),(3,'Doctorado'),(4,'Egresado'),(5,'Especialización Medico Quirurgica');
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
INSERT INTO `tiposidentificacion` VALUES (1,'Cédula de Ciudadanía'),(2,'Pasaporte'),(3,'Cédula de Extranjería');
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
INSERT INTO `tiposproyecto` VALUES (1,'Investigación'),(2,'Inscrito');
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
INSERT INTO `tiposvinculacion` VALUES (1,'Docente Vinculado Tiempo Completo'),(2,'Docente Ocasional Tiempo Completo'),(3,'Docente Ocasional Medio Tiempo'),(4,'Cátedra'),(5,'Asociado'),(6,'Asistente'),(7,'Auxiliar'),(8,'Contratista'),(9,'Visitante Tiempo Completo'),(10,'Docente Vinculado Medio Tiempo'),(11,'Jubilado'),(12,'Asesor'),(13,'Egresado');
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
INSERT INTO `usuarios` VALUES (1,'William','Ortiz Álvarez','william','123','waortiz@gmail.com'),(2,'Juan David','Ortiz Perea','juan','123','juan@hotmail.com'),(3,'javier','mejía','javier','123','javier@hotmail.com'),(4,'pepe','ramirez','pepipo','123','pepe@pepe.com'),(5,'petra','petra','petra','123','petra@hotmail.com'),(6,'Ana','Ortiz','Ana','123','ana@hotmail.com'),(7,'Sofía','Pelaez','Sofia','123','sofia@hotmail.com'),(8,'Yesika','Lopera','yessy','123','yesika@gmail.com'),(9,'Sandra','Gomez','sandra','123','sandra@hotmail.com'),(10,'Fabián Andrés','Mejía','fabian','123','fabian@hotmail.com'),(14,'William Alexis','Perea','william1','1','waortiz@hotmail.com'),(15,'William Alexis','Perea','william3','1','waortiz@hotmail.com');
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
