<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>GPCI: Gesti�n de Proyectos</title>
        <link rel="icon" href='<c:url value="/resources/imagenes/favicon.ico" />' type="image/x-icon" />
        <link rel="stylesheet" href='<c:url value="/resources/css/reset.min.css"/>'>
        <link rel='stylesheet prefetch' href='<c:url value="/resources/css/font-awesome.min.css"/>'>
        <link rel="stylesheet" href='<c:url value="/resources/css/login.css" />'>
    </head>
    <body>
        <section id="site-content">
            <tiles:insertAttribute name="body" />
        </section>
    </body>
</html>