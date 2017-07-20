<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>GPCI: Gestión de Proyectos</title>
        <link rel="icon" href='<c:url value="/resources/imagenes/udeaIco.png" />' type="image/png" />
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.min.css"/>'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/estilos.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap-datepicker3.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap-select.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/paging.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/sb-admin-2.css" />'>
    </head>
    <body>
        <header id="header">
            <tiles:insertAttribute name="header" />
        </header>
        <section id="site-content">
             <tiles:insertAttribute name="body" />
        </section>
        <footer id="footer">
            <tiles:insertAttribute name="footer" />
        </footer>
    </body>
</html>