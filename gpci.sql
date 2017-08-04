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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adendascambioproyectos`
--

DROP TABLE IF EXISTS `adendascambioproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adendascambioproyectos` (
  `idAdenda` bigint(20) NOT NULL AUTO_INCREMENT,
  `idproyecto` bigint(20) DEFAULT NULL,
  `idTipoPersona` int(11) NOT NULL,
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
  KEY `adendascambioproyectos_proyectos_idproyecto_idx` (`idproyecto`),
  CONSTRAINT `adendascambioproyectos_proyectos_idproyecto` FOREIGN KEY (`idproyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adendascambioproyectos_roles_idrol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `adendascambioproyectos_tipospersona_idtipopersona` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipospersona` (`idTipoPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adendasingresoproyectos`
--

DROP TABLE IF EXISTS `adendasingresoproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adendasingresoproyectos` (
  `idAdenda` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTipoPersona` int(11) NOT NULL,
  `idPersona` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `fechaIngreso` datetime NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idAdenda`),
  KEY `adendasingresoproyectos_tipospersona_idtipopersona_idx` (`idTipoPersona`),
  CONSTRAINT `adendasingresoproyectos_tipospersona_idtipopersona` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipospersona` (`idTipoPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `adendasretiroproyectos`
--

DROP TABLE IF EXISTS `adendasretiroproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adendasretiroproyectos` (
  `idAdenda` bigint(20) NOT NULL AUTO_INCREMENT,
  `idTipoPersona` int(11) NOT NULL,
  `idPersona` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `fechaRetiro` datetime NOT NULL,
  `fechaActa` datetime NOT NULL,
  `numeroActa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `motivo` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idAdenda`),
  KEY `adendasretiroproyectos_tipospersona_idtipopersona_idx` (`idTipoPersona`),
  CONSTRAINT `adendasretiroproyectos_tipospersona_idtipopersona` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipospersona` (`idTipoPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `compromisoshomologadosproyectos`
--

DROP TABLE IF EXISTS `compromisoshomologadosproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compromisoshomologadosproyectos` (
  `idcompromisoHomologadoProyecto` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCompromisoProyecto` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `fechaActa` datetime NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `numeroActa` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `observaciones` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcompromisoHomologadoProyecto`),
  KEY `compromisoshomologados_compromisosproyectos_idcompromiso_idx` (`idCompromisoProyecto`),
  CONSTRAINT `compromisoshomologados_compromisosproyectos_idcompromiso` FOREIGN KEY (`idCompromisoProyecto`) REFERENCES `compromisosproyectos` (`idCompromisoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`idCompromisoProyecto`),
  KEY `compromisosproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `compromisosproyectos_tiposcompromiso_idtipocompromiso_idx` (`idTipoCompromiso`),
  CONSTRAINT `compromisosproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `compromisosproyectos_tiposcompromiso_idtipocompromiso` FOREIGN KEY (`idTipoCompromiso`) REFERENCES `tiposcompromiso` (`idTipoCompromiso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `gruposinvestigacionproyectos`
--

DROP TABLE IF EXISTS `gruposinvestigacionproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gruposinvestigacionproyectos` (
  `idGrupoInvestigacion` int(11) NOT NULL,
  `idProyecto` bigint(20) NOT NULL,
  PRIMARY KEY (`idGrupoInvestigacion`,`idProyecto`),
  KEY `gruposinvestigacionproyectos_proyectos_idproyecto` (`idProyecto`),
  CONSTRAINT `gruposinvestigacionproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`idopcionmenu`),
  KEY `opcionesmenu_opcionesmenu_idpadre_idx` (`idpadre`),
  CONSTRAINT `opcionesmenu_opcionesmenu_idpadre` FOREIGN KEY (`idpadre`) REFERENCES `opcionesmenu` (`idopcionmenu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `numeroIdentificacion_UNIQUE` (`numeroIdentificacion`,`idTipoIdentificacion`),
  KEY `personalexterno_tiposidentificacion_idtipoidentificacion_idx` (`idTipoIdentificacion`),
  CONSTRAINT `personalexterno_tiposidentificacion_idtipoidentificacion` FOREIGN KEY (`idTipoIdentificacion`) REFERENCES `tiposidentificacion` (`idTipoIdentificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `idTipoViculacion` int(11) NOT NULL,
  PRIMARY KEY (`idProfesor`,`idProyecto`),
  KEY `profesoresproyectos_proyectos_idproyecto_idx` (`idProyecto`),
  KEY `profesoresproyectos_roles_idrol_idx` (`idRol`),
  KEY `profesoresproyectos_facultades_idfacultad_idx` (`idFacultad`),
  KEY `profesoresproyectos_tiposvinculacion_idtipovinculacion_idx` (`idTipoViculacion`),
  CONSTRAINT `profesoresproyectos_facultades_idfacultad` FOREIGN KEY (`idFacultad`) REFERENCES `facultades` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_profesores_idprofesor` FOREIGN KEY (`idProfesor`) REFERENCES `profesores` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_proyectos_idproyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`idProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_roles_idrol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profesoresproyectos_tiposvinculacion_idtipovinculacion` FOREIGN KEY (`idTipoViculacion`) REFERENCES `tiposvinculacion` (`idTipoVinculacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `idRiesgoEtico` int(11) NOT NULL,
  `idTipoContrato` int(11) NOT NULL,
  `idEnfoqueMetodologico` int(11) NOT NULL,
  `idConvocatoria` int(11) DEFAULT NULL,
  `objetivoGeneral` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `idEstado` int(11) NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `idUsuarioCreacion` bigint(20) NOT NULL,
  PRIMARY KEY (`idProyecto`),
  KEY `proyectos_areastematicas_idareatematica_idx` (`idAreaTematica`),
  KEY `proyectos_riegoseticos_idriesgoetico_idx` (`idRiesgoEtico`),
  KEY `proyectos_enfoquesmetodologicos_idenfoquemetodologico_idx` (`idEnfoqueMetodologico`),
  KEY `proyectos_estadosproyectos_idestado_idx` (`idEstado`),
  KEY `proyectos_tiposcontrato_idtipocontrato_idx` (`idTipoContrato`),
  KEY `proyectos_convocatorias_idconvocatoria_idx` (`idConvocatoria`),
  KEY `proyectos_tiposproyecto_idx` (`idTipoProyecto`),
  KEY `proyectos_idusuariocreacion_usuarios_idx` (`idUsuarioCreacion`),
  CONSTRAINT `proyectos_areastematicas_idareatematica` FOREIGN KEY (`idAreaTematica`) REFERENCES `areastematicas` (`idAreaTematica`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_convocatorias_idconvocatoria` FOREIGN KEY (`idConvocatoria`) REFERENCES `convocatorias` (`idConvocatoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_enfoquesmetodologicos_idenfoquemetodologico` FOREIGN KEY (`idEnfoqueMetodologico`) REFERENCES `enfoquesmetodologicos` (`idEnfoqueMetodologico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_estadosproyectos_idestado` FOREIGN KEY (`idEstado`) REFERENCES `estadosproyecto` (`idEstadoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_idusuariocreacion_usuarios` FOREIGN KEY (`idUsuarioCreacion`) REFERENCES `usuarios` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_riegoseticos_idriesgoetico` FOREIGN KEY (`idRiesgoEtico`) REFERENCES `riesgoseticos` (`idRiesgoEtico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_tiposcontrato_idtipocontrato` FOREIGN KEY (`idTipoContrato`) REFERENCES `tiposcontrato` (`idTipoContrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proyectos_tiposproyecto_idtipoproyecto` FOREIGN KEY (`idTipoProyecto`) REFERENCES `tiposproyecto` (`idTipoProyecto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Dumping routines for database 'gpci'
--
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
    idCompromisoProyecto = varIdCompromisoProyecto
WHERE idcumplimientocompromisoproyecto = varidcumplimientocompromisoproyecto;

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
 varIdTipoCompromiso int
)
BEGIN

UPDATE Compromisosproyectos
SET descripcion = varDescripcion,
    IdTipoCompromiso = varIdTipoCompromiso
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

DELETE FROM documentoadendaingresosproyectos
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

DELETE FROM documentoadendaretirosproyectos
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
 varFechaActa datetime,
 varNumeroActa varchar(50),
 vardescripcion varchar(200),
 varObservaciones varchar(200)
)
BEGIN

INSERT INTO compromisoshomologadosproyectos
(idCompromisoProyecto,
 fecha,
 fechaActa,
 descripcion,
 numeroActaAprobacion,
 observaciones)
VALUES
(varidCompromisoProyecto,
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
 varIdTipoCompromiso int
)
BEGIN

INSERT INTO CompromisosProyectos
(
 idProyecto,
 descripcion,
 fecha,
 idTipoCompromiso)
VALUES
(varIdProyecto,
 varDescripcion,
 now(),
 varidTipoCompromiso);

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
/*!50003 DROP PROCEDURE IF EXISTS `IngresarDocumentoAdendaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarDocumentoAdendaProyecto`(
 varIdAdenda bigint(20), 
 varNombre varchar(200),
 varTipoContenido varchar(200),
 varContenido longblob
)
BEGIN

INSERT INTO DocumentoAdendasproyectos
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
/*!50003 DROP PROCEDURE IF EXISTS `IngresarFuentefinanciacionProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `IngresarFuentefinanciacionProyecto`(
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
 varidProyecto bigint(20)
)
BEGIN

INSERT INTO gruposinvestigacionproyectos
(idGrupoInvestigacion,
 idProyecto)
VALUES
(varidGrupoInvestigacion,
 varidProyecto);

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
	 WHERE idPersonalExterno = varPersonalExterno;
  
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
   varIdRiesgoEtico int(11),
   varIdTipoContrato int(11),
   varIdEnfoqueMetodologico int(11),
   varIdConvocatoria int(11),
   varObjetivoGeneral varchar(100),
   varIdEstado int(11),
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
`ingresadoSIGEP`,
`ingresadoSIIU`,
`ingresadoSIU`,
`codigoSIIU`,
`codigoCOLCIENCIAS`,
`codigoSIU`,
`codigo`,
`participacionInternacional`,
`idTipoProyecto`,
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
       ti.idTipoIdentificacion,
       ti.nombre nombreTipoIdentificacion,
       pro.nombres,
       pro.apellidos,
       pro.numeroIdentificacion
FROM adendascambioproyectos ad
 inner join roles r on ad.idrol = r.idrol
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN profesores pro on ad.idpersona = pro.idprofesor
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = pro.idTipoIdentificacion
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
       ti.idTipoIdentificacion,
       ti.nombre nombreTipoIdentificacion,
       est.nombres,
       est.apellidos,
       est.numeroIdentificacion
FROM adendascambioproyectos ad
 inner join roles r on ad.idrol = r.idrol
 inner join tipospersona tp on tp.idtipopersona = ad.idtipopersona
 INNER JOIN Estudiantes est on ad.idPersona = est.idEstudiante
 INNER JOIN tiposIdentificacion ti on ti.idTipoIdentificacion = est.idTipoIdentificacion
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
       ti.idTipoIdentificacion,
       ti.nombre nombreTipoIdentificacion,
       pe.nombres,
       pe.apellidos,
       pe.numeroIdentificacion
FROM adendascambioproyectos ad
 inner join roles r on ad.idrol = r.idrol
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
       ti.idTipoIdentificacion,
       ti.nombre nombreTipoIdentificacion,
       pro.nombres,
       pro.apellidos,
       pro.numeroIdentificacion
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
       ti.idTipoIdentificacion,
       ti.nombre nombreTipoIdentificacion,
       est.nombres,
       est.apellidos,
       est.numeroIdentificacion
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
       ti.idTipoIdentificacion,
       ti.nombre nombreTipoIdentificacion,
       pe.nombres,
       pe.apellidos,
       pe.numeroIdentificacion
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
       ti.idTipoIdentificacion,
       ti.nombre nombreTipoIdentificacion,
       pro.nombres,
       pro.apellidos,
       pro.numeroIdentificacion
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
       ti.idTipoIdentificacion,
       ti.nombre nombreTipoIdentificacion,
       est.nombres,
       est.apellidos,
       est.numeroIdentificacion
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
       ti.idTipoIdentificacion,
       ti.nombre nombreTipoIdentificacion,
       pe.nombres,
       pe.apellidos,
       pe.numeroIdentificacion
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
       ch.fechaActa, 
       ch.numeroacta,
       ch.descripcion,
       ch.observaciones
FROM compromisoshomologadosproyectos ch 
 inner join compromisosproyectos co on co.idCompromisoproyecto = ch.idCompromisoProyecto
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
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCumplimientosAlertasAvalProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCumplimientosAlertasAvalProyecto`(
 varIdProyecto bigint(20)
)
BEGIN


SELECT caa.idcumplimientoalertaavalproyecto,
       aa.descripcion descripcionalertaaval, 
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
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCumplimientosCompromisosProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCumplimientosCompromisosProyecto`(
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
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoAdendaProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoAdendaProyecto`(
 varIdAdenda bigint(20),
 out varNombre varchar(200),
 out varTipoContenido varchar(200),
 out varContenido longblob
)
BEGIN

SELECT nombre, tipocontenido, contenido
INTO varnombre, vartipocontenido, varcontenido
FROM documentoadendasproyectos
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
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDocumentoCumplimientoProyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDocumentoCumplimientoProyecto`(
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
       gi.nombre
FROM GruposInvestigacion gi
 inner join GruposInvestigacionProyecto gip on gip.idGrupoInvestigacion = gp.idGrupoInvestigacion
WHERE gip.idProyecto = varIdProyecto
ORDER BY gi.nombre;

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
           om.url 
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
   varFechaInicio datetime,
   varFechaFinal datetime
)
BEGIN
SELECT 
   pro.idProyecto, 
   pro.nombreCompletoProyecto,
   pro.nombreCortoProyecto,
   pro.fechaCreacion,
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
where pro.fechaCreacion between varFechaInicio and varFechaFinal
ORDER BY pro.fechaCreacion;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-03 20:56:48
