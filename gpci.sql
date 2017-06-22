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
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fechaActa` datetime NOT NULL,
  `observacionesActa` varchar(3000) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idActa`),
  KEY `actasproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `actasproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actasproyectos`
--

LOCK TABLES `actasproyectos` WRITE;
/*!40000 ALTER TABLE `actasproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `actasproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adendas`
--

DROP TABLE IF EXISTS `adendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adendas` (
  `idAdenda` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `modificacion` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `consecutivo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAdenda`),
  KEY `adendas_protectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `adendas_protectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adendas`
--

LOCK TABLES `adendas` WRITE;
/*!40000 ALTER TABLE `adendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `adendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adiciones`
--

DROP TABLE IF EXISTS `adiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adiciones` (
  `idAdicion` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `idFuenteFinanciacion` int(11) NOT NULL,
  `monto` decimal(18,0) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`idAdicion`),
  KEY `adiciones_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `adiciones_fuentesfinanciacion_idfuentefinanciacion_idx` (`idFuenteFinanciacion`),
  CONSTRAINT `adiciones_fuentesfinanciacion_idfuentefinanciacion` FOREIGN KEY (`idFuenteFinanciacion`) REFERENCES `fuentesfinanciacion` (`idFuenteFinanciacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adiciones_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adiciones`
--

LOCK TABLES `adiciones` WRITE;
/*!40000 ALTER TABLE `adiciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `adiciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alertasaval`
--

DROP TABLE IF EXISTS `alertasaval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alertasaval` (
  `idAlertaAval` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `numeroActaComiteInv` int(11) DEFAULT NULL,
  `fechaAprobacion` datetime DEFAULT NULL,
  `tipoAval` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idAlertaAval`),
  KEY `alertasaval_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `alertasaval_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertasaval`
--

LOCK TABLES `alertasaval` WRITE;
/*!40000 ALTER TABLE `alertasaval` DISABLE KEYS */;
/*!40000 ALTER TABLE `alertasaval` ENABLE KEYS */;
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
INSERT INTO `areastematicas` VALUES (1,'Salud'),(2,'Energía'),(3,'Tecnología');
/*!40000 ALTER TABLE `areastematicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compromisosproyectos`
--

DROP TABLE IF EXISTS `compromisosproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compromisosproyectos` (
  `idCompromisoProyecto` int(11) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `fechaCompromiso` datetime NOT NULL,
  `homologado` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCompromisoProyecto`),
  KEY `compromisosproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `compromisosproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compromisosproyectos`
--

LOCK TABLES `compromisosproyectos` WRITE;
/*!40000 ALTER TABLE `compromisosproyectos` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convocatorias`
--

LOCK TABLES `convocatorias` WRITE;
/*!40000 ALTER TABLE `convocatorias` DISABLE KEYS */;
INSERT INTO `convocatorias` VALUES (1,'Ruta N','2017-05-27 00:00:00'),(2,'Municipio de Medellín','2017-05-27 00:00:00');
/*!40000 ALTER TABLE `convocatorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentosactasproyectos`
--

DROP TABLE IF EXISTS `documentosactasproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentosactasproyectos` (
  `idDocumento` bigint(20) NOT NULL AUTO_INCREMENT,
  `idActa` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idDocumento`),
  KEY `documentosactasproyectos_actasproyectos_idactaproyecto_idx` (`idActa`),
  CONSTRAINT `documentosactasproyectos_actasproyectos_idactaproyecto` FOREIGN KEY (`idActa`) REFERENCES `actasproyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentosactasproyectos`
--

LOCK TABLES `documentosactasproyectos` WRITE;
/*!40000 ALTER TABLE `documentosactasproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentosactasproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentosadendas`
--

DROP TABLE IF EXISTS `documentosadendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentosadendas` (
  `idDocumento` bigint(20) NOT NULL AUTO_INCREMENT,
  `idAdenda` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idDocumento`),
  KEY `documentosadendas_adendas_idadenda_idx` (`idAdenda`),
  CONSTRAINT `documentosadendas_adendas_idadenda` FOREIGN KEY (`idAdenda`) REFERENCES `adendas` (`idAdenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentosadendas`
--

LOCK TABLES `documentosadendas` WRITE;
/*!40000 ALTER TABLE `documentosadendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentosadendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentosadiciones`
--

DROP TABLE IF EXISTS `documentosadiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentosadiciones` (
  `idDocumento` bigint(20) NOT NULL AUTO_INCREMENT,
  `idAdicion` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idDocumento`),
  KEY `documentosadiciones_adiciones_idadicion_idx` (`idAdicion`),
  CONSTRAINT `documentosadiciones_adiciones_idadicion` FOREIGN KEY (`idAdicion`) REFERENCES `adiciones` (`idAdicion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentosadiciones`
--

LOCK TABLES `documentosadiciones` WRITE;
/*!40000 ALTER TABLE `documentosadiciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentosadiciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentosprorrogas`
--

DROP TABLE IF EXISTS `documentosprorrogas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documentosprorrogas` (
  `idDocumento` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProrroga` bigint(20) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tipoContenido` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `contenido` longblob NOT NULL,
  PRIMARY KEY (`idDocumento`),
  KEY `documentosprorrogas_prorrogas_idprorroga_idx` (`idProrroga`),
  CONSTRAINT `documentosprorrogas_prorrogas_idprorroga` FOREIGN KEY (`idProrroga`) REFERENCES `prorrogas` (`idProrroga`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentosprorrogas`
--

LOCK TABLES `documentosprorrogas` WRITE;
/*!40000 ALTER TABLE `documentosprorrogas` DISABLE KEYS */;
/*!40000 ALTER TABLE `documentosprorrogas` ENABLE KEYS */;
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
INSERT INTO `enfoquesmetodologicos` VALUES (1,'Investigación profunda'),(2,'Servicio Social');
/*!40000 ALTER TABLE `enfoquesmetodologicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidadesinternacionalesproyecto`
--

DROP TABLE IF EXISTS `entidadesinternacionalesproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidadesinternacionalesproyecto` (
  `idEntidadInternacionalProyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idEntidadInternacionalProyecto`),
  KEY `entidadesinternacionalesproyecto_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `entidadesinternacionalesproyecto_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidadesinternacionalesproyecto`
--

LOCK TABLES `entidadesinternacionalesproyecto` WRITE;
/*!40000 ALTER TABLE `entidadesinternacionalesproyecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `entidadesinternacionalesproyecto` ENABLE KEYS */;
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
INSERT INTO `estadosproyecto` VALUES (1,'Creado'),(2,'Ejecución'),(3,'Cancelado'),(4,'Terminado');
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
  KEY `estudiantes_tiposestudiantes_idtipoidentificacion_idx` (`idTipoIdentificacion`),
  KEY `estudiantes_tiposestudiantes_idtipoestudiante_idx` (`idTipoEstudiante`),
  CONSTRAINT `estudiantes_tiposestudiantes_idtipoestudiante` FOREIGN KEY (`idTipoEstudiante`) REFERENCES `tiposestudiantes` (`idTipoEstudiante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estudiantes_tiposidentificacion_idtipoidentificacion` FOREIGN KEY (`idTipoIdentificacion`) REFERENCES `tiposidentificacion` (`idTipoIdentificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
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
INSERT INTO `facultades` VALUES (1,'Medicina');
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
  PRIMARY KEY (`idFuenteFinanciacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuentesfinanciacion`
--

LOCK TABLES `fuentesfinanciacion` WRITE;
/*!40000 ALTER TABLE `fuentesfinanciacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuentesfinanciacion` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gruposinvestigacion`
--

LOCK TABLES `gruposinvestigacion` WRITE;
/*!40000 ALTER TABLE `gruposinvestigacion` DISABLE KEYS */;
INSERT INTO `gruposinvestigacion` VALUES (1,'CIS'),(2,'LivingLab'),(3,'Previva');
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
  `entidad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `categoria` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`idGrupoInvestigacion`,`idProyecto`),
  KEY `gruposinvestigacionproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `gruposinvestigacionproyectos_grupinvestig_idgrupoinvestigacion` FOREIGN KEY (`idGrupoInvestigacion`) REFERENCES `gruposinvestigacion` (`idGrupoInvestigacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `gruposinvestigacionproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gruposinvestigacionproyectos`
--

LOCK TABLES `gruposinvestigacionproyectos` WRITE;
/*!40000 ALTER TABLE `gruposinvestigacionproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `gruposinvestigacionproyectos` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetivosespecificos`
--

LOCK TABLES `objetivosespecificos` WRITE;
/*!40000 ALTER TABLE `objetivosespecificos` DISABLE KEYS */;
INSERT INTO `objetivosespecificos` VALUES (1,8,'Apoyar el diseño de los menu'),(2,8,'Crear una medología');
/*!40000 ALTER TABLE `objetivosespecificos` ENABLE KEYS */;
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
  `correoElectronico` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `entidad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idPersonalExterno`),
  KEY `personalexterno_tiposidentificacion_idtipoidentificacion_idx` (`idTipoIdentificacion`),
  CONSTRAINT `personalexterno_tiposidentificacion_idtipoidentificacion` FOREIGN KEY (`idTipoIdentificacion`) REFERENCES `tiposidentificacion` (`idTipoIdentificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalexterno`
--

LOCK TABLES `personalexterno` WRITE;
/*!40000 ALTER TABLE `personalexterno` DISABLE KEYS */;
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
  `porcentajePropiedadIntelectual` decimal(18,2) DEFAULT NULL,
  `horasSemana` int(11) DEFAULT NULL,
  `mesesDedicados` int(11) DEFAULT NULL,
  `cartaCesionDerechosPatrimonio` tinyint(1) DEFAULT NULL,
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
/*!40000 ALTER TABLE `personalexternoproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plazos`
--

DROP TABLE IF EXISTS `plazos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plazos` (
  `idPlazo` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fechaAprobacion` datetime NOT NULL,
  `mesesAprobados` int(11) NOT NULL,
  PRIMARY KEY (`idPlazo`),
  KEY `plazos_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `plazos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plazos`
--

LOCK TABLES `plazos` WRITE;
/*!40000 ALTER TABLE `plazos` DISABLE KEYS */;
/*!40000 ALTER TABLE `plazos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuestos`
--

DROP TABLE IF EXISTS `presupuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presupuestos` (
  `idPresupuesto` bigint(20) NOT NULL AUTO_INCREMENT,
  `idProyecto` bigint(20) NOT NULL,
  `idFuenteFinanciacion` int(11) NOT NULL,
  `idTipoFuentePresupuesto` int(11) NOT NULL,
  `recursosEspecie` decimal(18,0) NOT NULL,
  `recursosFrescos` decimal(18,0) NOT NULL,
  PRIMARY KEY (`idPresupuesto`),
  KEY `presupuestos_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `presupuestos_tiposfuentepresupuesto_idx` (`idTipoFuentePresupuesto`),
  KEY `presupuestos_fuentesfinanciaron_idfuentefinanciacion_idx` (`idFuenteFinanciacion`),
  CONSTRAINT `presupuestos_fuentesfinanciaron_idfuentefinanciacion` FOREIGN KEY (`idFuenteFinanciacion`) REFERENCES `fuentesfinanciacion` (`idFuenteFinanciacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `presupuestos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `presupuestos_tiposfuentepresupuesto` FOREIGN KEY (`idTipoFuentePresupuesto`) REFERENCES `tiposfuentepresupuesto` (`idTipoFuentePresupuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuestos`
--

LOCK TABLES `presupuestos` WRITE;
/*!40000 ALTER TABLE `presupuestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `presupuestos` ENABLE KEYS */;
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
  KEY `profesores_tiposestudiantes_idtipoidentificacion_idx` (`idTipoIdentificacion`),
  CONSTRAINT `profesores_tiposidentificacion_idtipoidentificacion` FOREIGN KEY (`idTipoIdentificacion`) REFERENCES `tiposidentificacion` (`idTipoIdentificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
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
  `codigoVinculacionUDEA` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `cartaCesionDerechosPatrimonio` tinyint(1) NOT NULL,
  `porcentajePI` decimal(18,2) NOT NULL,
  `horasSemana` int(11) NOT NULL,
  `mesesDedicados` int(11) NOT NULL,
  `horasSemanaFueraPlan` int(11) DEFAULT NULL,
  `mesesFueraPlan` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProfesor`,`idProyecto`),
  KEY `profesoresproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `profesoresproyectos_roles_idrol_idx` (`idRol`),
  KEY `profesoresproyectos_facultades_idfacultad_idx` (`idFacultad`),
  CONSTRAINT `profesoresproyectos_facultades_idfacultad` FOREIGN KEY (`idFacultad`) REFERENCES `facultades` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_profesores_idprofesor` FOREIGN KEY (`idProfesor`) REFERENCES `profesores` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_roles_idrol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesoresproyectos`
--

LOCK TABLES `profesoresproyectos` WRITE;
/*!40000 ALTER TABLE `profesoresproyectos` DISABLE KEYS */;
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
INSERT INTO `programas` VALUES (1,'Medellín Primero');
/*!40000 ALTER TABLE `programas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prorrogas`
--

DROP TABLE IF EXISTS `prorrogas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prorrogas` (
  `idProrroga` bigint(20) NOT NULL,
  `idProyecto` bigint(20) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fechaAprobacion` datetime NOT NULL,
  `mesesAprobados` int(11) NOT NULL,
  PRIMARY KEY (`idProrroga`),
  KEY `prorrogas_proyectos_idproyecto_idx` (`idProyecto`),
  CONSTRAINT `prorrogas_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prorrogas`
--

LOCK TABLES `prorrogas` WRITE;
/*!40000 ALTER TABLE `prorrogas` DISABLE KEYS */;
/*!40000 ALTER TABLE `prorrogas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos` (
  `idProyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombreCompletoProyecto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `nombreCortoProyecto` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFinalizacion` datetime NOT NULL,
  `idAreaTematica` int(11) NOT NULL,
  `ingresadoSIGEP` tinyint(1) NOT NULL,
  `ingresadoSIIU` tinyint(1) NOT NULL,
  `ingresadoSIU` tinyint(1) NOT NULL,
  `codigoSIIU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigoCOLCIENCIAS` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigoSIU` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `participacionInternacional` tinyint(1) NOT NULL,
  `idTipoProyecto` int(11) NOT NULL,
  `idGrupoInvestigacion` int(11) NOT NULL,
  `idRiesgoEtico` int(11) NOT NULL,
  `idTipoContrato` int(11) NOT NULL,
  `idEnfoqueMetodologico` int(11) NOT NULL,
  `idConvocatoria` int(11) DEFAULT NULL,
  `objetivoGeneral` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `idEstado` int(11) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `idUsuarioCreacion` int(11) NOT NULL,
  PRIMARY KEY (`idProyecto`),
  KEY `proyectos_areastematicas_idareatematica_idx` (`idAreaTematica`),
  KEY `proyectos_riegoseticos_idriesgoetico_idx` (`idRiesgoEtico`),
  KEY `proyectos_enfoquesmetodologicos_idenfoquemetodologico_idx` (`idEnfoqueMetodologico`),
  KEY `proyectos_estadosproyectos_idestado_idx` (`idEstado`),
  KEY `proyectos_tiposcontrato_idtipocontrato_idx` (`idTipoContrato`),
  KEY `proyectos_convocatorias_idconvocatoria_idx` (`idConvocatoria`),
  KEY `proyectos_idusuariocreacion_usuarios_idx` (`idUsuarioCreacion`),
  KEY `proyectos_tiposproyecto_idx` (`idTipoProyecto`),
  CONSTRAINT `proyectos_areastematicas_idareatematica` FOREIGN KEY (`idAreaTematica`) REFERENCES `areastematicas` (`idAreaTematica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_convocatorias_idconvocatoria` FOREIGN KEY (`idConvocatoria`) REFERENCES `convocatorias` (`idConvocatoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_enfoquesmetodologicos_idenfoquemetodologico` FOREIGN KEY (`idEnfoqueMetodologico`) REFERENCES `enfoquesmetodologicos` (`idEnfoqueMetodologico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_estadosproyectos_idestado` FOREIGN KEY (`idEstado`) REFERENCES `estadosproyecto` (`idEstadoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_idusuariocreacion_usuarios` FOREIGN KEY (`idUsuarioCreacion`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_riegoseticos_idriesgoetico` FOREIGN KEY (`idRiesgoEtico`) REFERENCES `riesgoseticos` (`idRiesgoEtico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_tiposcontrato_idtipocontrato` FOREIGN KEY (`idTipoContrato`) REFERENCES `tiposcontrato` (`idTipoContrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_tiposproyecto` FOREIGN KEY (`idTipoProyecto`) REFERENCES `tiposproyecto` (`idTipoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'Gestión de Niños','Gestión','2017-05-09 00:00:00','2017-05-25 00:00:00',2,1,0,1,'45','SE4','456','1',1,1,1,3,1,1,2,'DESARROLLAR',3,'2017-05-28 14:31:03',1),(2,'CreaciÃÂ³n de NiÃÂ±os U de A','CreaciÃÂ³n de NiÃÂ±os','2017-05-02 00:00:00','2017-05-28 00:00:00',2,1,0,1,'646','86786','7575','464',1,1,1,3,1,1,2,'Ninguno en especiÃÂ¡l',3,'2017-05-28 16:02:36',1),(3,'Creación de Niños U de A','Creación de Niños','2017-05-02 00:00:00','2017-05-28 00:00:00',2,1,0,1,'646','86786','78','464',1,1,1,3,1,1,2,'Ninguno en especiÃ¡l',3,'2017-05-28 16:09:32',1),(4,'dasdas','asdasda','2017-05-03 00:00:00','2017-05-28 00:00:00',2,0,0,0,'eqewqw','dasdas',NULL,'NiÃ±os',0,1,1,3,1,1,2,'eqweqw',1,'2017-05-28 16:10:08',1),(5,'Gestión de Niños','Gestión de Niños','2017-05-09 00:00:00','2017-05-19 00:00:00',2,0,0,0,'2423','54','89','31312',0,1,1,3,1,1,2,'Crear árboles',1,'2017-05-28 16:21:25',1),(8,'Nutrición Callejera en Medellín','Nutrición Callejera','2017-05-16 00:00:00','2017-05-29 00:00:00',2,1,0,1,'765','88','867','4234',1,1,1,3,1,1,2,'Crear un sistema',1,'2017-05-29 08:50:45',1),(9,'Social Completo','Social','2017-05-09 00:00:00','2017-05-24 00:00:00',2,0,0,0,'54','76','87','646',0,1,2,3,1,1,2,'Trabajo social',3,'2017-05-29 12:10:28',1);
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
INSERT INTO `riesgoseticos` VALUES (1,'Bajo'),(2,'Medio'),(3,'Alto');
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
INSERT INTO `roles` VALUES (1,'Director'),(2,'Colaborador');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
INSERT INTO `tiposcontrato` VALUES (1,'Prestación de Servicios'),(2,'Vinculación');
/*!40000 ALTER TABLE `tiposcontrato` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `tiposestudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposfuentepresupuesto`
--

DROP TABLE IF EXISTS `tiposfuentepresupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposfuentepresupuesto` (
  `idTipoFuentePresupuesto` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoFuentePresupuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposfuentepresupuesto`
--

LOCK TABLES `tiposfuentepresupuesto` WRITE;
/*!40000 ALTER TABLE `tiposfuentepresupuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiposfuentepresupuesto` ENABLE KEYS */;
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
INSERT INTO `tiposidentificacion` VALUES (1,'Cédula de Ciudadanía'),(2,'Cédula de Extranjería'),(3,'Tarjeta de identidad');
/*!40000 ALTER TABLE `tiposidentificacion` ENABLE KEYS */;
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
INSERT INTO `tiposproyecto` VALUES (1,'Innovación'),(2,'Producto'),(3,'Inversión');
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
INSERT INTO `tiposvinculacion` VALUES (1,'Medio Tiempo'),(2,'Tiemop Completo');
/*!40000 ALTER TABLE `tiposvinculacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(250) COLLATE utf8_spanish_ci NOT NULL,
  `nombreUsuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'William Alexis','Ortiz Perea','william','123');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gpci'
--
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
   varNombreCompletoProyecto varchar(100),
   varNombreCortoProyecto varchar(100),
   varFechaInicio datetime,
   varFechaFinalizacion datetime,
   varIdAreaTematica int(11),
   varIngresadoSIGEP tinyint(1),
   varIngresadoSIIU tinyint(1),
   varIngresadoSIU tinyint(1),
   varCodigoSIIU varchar(50),
   varCodigoCOLCIENCIAS varchar(50),
   varCodigoSIU varchar(50),
   varCodigo varchar(15),
   varParticipacionInternacional tinyint(1),
   varIdTipoProyecto int(11),
   varIdGrupoInvestigacion int(11),
   varIdRiesgoEtico int(11),
   varIdTipoContrato int(11),
   varIdEnfoqueMetodologico int(11),
   varIdConvocatoria int(11),
   varObjetivoGeneral varchar(100),
   varIdEstado int(11)
)
BEGIN
UPDATE proyectos
SET
`nombreCompletoProyecto` = varNombreCompletoProyecto,
`nombreCortoProyecto` = varNombreCortoProyecto,
`fechaInicio` = varFechaInicio,
`fechaFinalizacion` = varFechaFinalizacion,
`idAreaTematica` = varIdAreaTematica,
`ingresadoSIGEP` = varIngresadoSIGEP,
`ingresadoSIIU` = varIngresadoSIIU,
`ingresadoSIU` = varIngresadoSIU,
`codigoSIIU` = varCodigoSIIU,
`codigoCOLCIENCIAS` = varCodigoCOLCIENCIAS,
`codigoSIU` = varCodigoSIU,
`codigo` = varCodigo,
`participacionInternacional` = varParticipacionInternacional,
`idTipoProyecto` = varIdTipoProyecto,
`idGrupoInvestigacion` = varIdGrupoInvestigacion,
`idRiesgoEtico`  = varIdRiesgoEtico,
`idTipoContrato` = varIdTipoContrato,
`idEnfoqueMetodologico` = varIdEnfoqueMetodologico,
`idConvocatoria` = varIdConvocatoria,
`objetivoGeneral` = varObjetivoGeneral,
`idEstado` = varIdEstado
WHERE idProyecto = varIdProyecto;

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
   varNombreCompletoProyecto varchar(100),
   varNombreCortoProyecto varchar(100),
   varFechaInicio datetime,
   varFechaFinalizacion datetime,
   varIdAreaTematica int(11),
   varIngresadoSIGEP tinyint(1),
   varIngresadoSIIU tinyint(1),
   varIngresadoSIU tinyint(1),
   varCodigoSIIU varchar(50),
   varCodigoCOLCIENCIAS varchar(50),
   varCodigoSIU varchar(50),
   varCodigo varchar(15),
   varParticipacionInternacional tinyint(1),
   varIdTipoProyecto int(11),
   varIdGrupoInvestigacion int(11),
   varIdRiesgoEtico int(11),
   varIdTipoContrato int(11),
   varIdEnfoqueMetodologico int(11),
   varIdConvocatoria int(11),
   varObjetivoGeneral varchar(100),
   varIdEstado int(11),
   varIdUsuarioCreacion int(11),
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
`ingresadoSIGEP`,
`ingresadoSIIU`,
`ingresadoSIU`,
`codigoSIIU`,
`codigoCOLCIENCIAS`,
`codigoSIU`,
`codigo`,
`participacionInternacional`,
`idTipoProyecto`,
`idGrupoInvestigacion`,
`idRiesgoEtico`,
`idTipoContrato`,
`idEnfoqueMetodologico`,
`idConvocatoria`,
`objetivoGeneral`,
`idEstado`,
`fechaCreacion`,
`idUsuarioCreacion`)
VALUES
(
varNombreCompletoProyecto,
varNombreCortoProyecto,
varfechaInicio,
varfechaFinalizacion,
varidAreaTematica,
varingresadoSIGEP,
varingresadoSIIU,
varingresadoSIU,
varcodigoSIIU,
varcodigoCOLCIENCIAS,
varcodigoSIU,
varcodigo,
varparticipacionInternacional,
varidTipoProyecto,
varidGrupoInvestigacion,
varidRiesgoEtico,
varidTipoContrato,
varidEnfoqueMetodologico,
varidConvocatoria,
varobjetivoGeneral,
varidEstado,
now(),
varidUsuarioCreacion);

SET varIdProyecto = LAST_INSERT_ID();

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
	out varIdGrupoInvestigacion int(11),
    out varGrupoInvestigacion varchar(300),
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
    out varEstado varchar(50)
)
BEGIN
SELECT 
   pro.nombreCompletoProyecto,
   pro.nombreCortoProyecto,
   pro.fechaInicio,
   pro.fechaFinalizacion,
   pro.idAreaTematica,
   atem.nombre areaTematica,
   pro.ingresadoSIGEP,
   pro.ingresadoSIIU,
   pro.ingresadoSIU,
   pro.codigoSIIU,
   pro.codigoCOLCIENCIAS,
   pro.codigoSIU,
   pro.codigo,
   pro.participacionInternacional,
   pro.idTipoProyecto,
   tipProy.nombre tipoProyecto,
   pro.idGrupoInvestigacion,
   gi.nombre grupoInvestigacion,
   pro.idRiesgoEtico,
   re.nombre riesgoEtico,
   pro.idTipoContrato,
   tc.nombre tipoContrato,
   pro.idEnfoqueMetodologico,
   em.nombre enfoqueMetodologico,
   pro.idConvocatoria,
   con.nombre convocatoria,
   pro.objetivoGeneral,
   pro.idEstado,
   est.nombre estado
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
	varIdGrupoInvestigacion,
    varGrupoInvestigacion,
	varIdRiesgoEtico,
    varRiesgoEtico,
	varIdTipoContrato,
    varTipoContrato,
	varIdEnfoqueMetodologico,
    varEnfoqueMetodologico,
	varIdConvocatoria,
    varConvocatoria,
	varObjetivoGeneral,
	varIdEstado,
    varEstado
FROM proyectos pro
  inner join areasTematicas atem on pro.idAreatematica = atem.idAreatematica
  inner join tiposProyecto tipProy on pro.idTipoProyecto = tipProy.idTipoProyecto
  inner join gruposInvestigacion gi on pro.idGrupoInvestigacion = gi.idGrupoInvestigacion
  inner join tiposContrato tc on pro.idTipoContrato = tc.idTipoContrato
  inner join enfoquesMetodologicos em on pro.idEnfoqueMetodologico = em.idEnfoqueMetodologico
  inner join convocatorias con on pro.idConvocatoria = con.idConvocatoria
  inner join riesgoseticos re on re.idRiesgoEtico = pro.idRiesgoEtico
  inner join estadosProyecto est on pro.idEstado = est.idEstadoProyecto
WHERE idProyecto = varIdProyecto;

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

)
BEGIN
SELECT 
   pro.idProyecto, 
   pro.nombreCompletoProyecto,
   pro.nombreCortoProyecto,
   pro.fechaInicio,
   pro.fechaFinalizacion,
   pro.idAreaTematica,
   atem.nombre areaTematica,
   pro.idTipoProyecto,
   tipProy.nombre tipoProyecto,
   pro.idGrupoInvestigacion,
   gi.nombre grupoInvestigacion,
   pro.idTipoContrato,
   tc.nombre tipoContrato,
   pro.idEnfoqueMetodologico,
   em.nombre enfoqueMetodologico,
   pro.idConvocatoria,
   con.nombre convocatoria,
   pro.idEstado,
   est.nombre estadoProyecto
FROM proyectos pro
  inner join areasTematicas atem on pro.idAreatematica = atem.idAreatematica
  inner join tiposProyecto tipProy on pro.idTipoProyecto = tipProy.idTipoProyecto
  inner join gruposInvestigacion gi on pro.idGrupoInvestigacion = gi.idGrupoInvestigacion
  inner join tiposContrato tc on pro.idTipoContrato = tc.idTipoContrato
  inner join enfoquesMetodologicos em on pro.idEnfoqueMetodologico = em.idEnfoqueMetodologico
  inner join convocatorias con on pro.idConvocatoria = con.idConvocatoria
  inner join estadosProyecto est on pro.idEstado = est.idEstadoProyecto
ORDER BY pro.nombreCompletoProyecto;

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
	out varClave varchar(50)
)
BEGIN
SELECT 
    nombres,
    apellidos,
    idusuario,
    clave
INTO
	varNombres,
	varApellidos,
	varidusuario,
	varClave
FROM usuarios
WHERE nombreUsuario = varNombreUsuario;

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

-- Dump completed on 2017-06-22 18:43:00
