<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>GPCI: Gestión de Proyectos</title>
        <link rel="icon" href='<c:url value="/resources/imagenes/favicon.ico" />' type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.min.css"/>'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/estilos.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap-datepicker3.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap-select.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/paging.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/menu.css" />'>
    </head>
    <body>
        <header id="header">
            <tiles:insertAttribute name="header" />
        </header>
        <section id="site-content">
            <div class="col-xs-2">
                <tiles:insertAttribute name="menu" />
            </div>
            <div class="col-xs-10">
                <tiles:insertAttribute name="body" />
            </div>
        </section>

        <footer id="footer">
            <tiles:insertAttribute name="footer" />
        </footer>
    </body>
    <script src='<c:url value="/resources/js/menu.js" />'></script>
    <script type="text/javascript">
       var contextPath = '${pageContext.request.contextPath}';
       <tiles:insertAttribute name="javascriptMenu" />
    </script>    
</html>