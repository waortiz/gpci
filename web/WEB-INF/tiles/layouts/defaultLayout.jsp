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
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/menu.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/metisMenu.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/font-awesome.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/jquery.dataTables.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/buttons.dataTables.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/morris.css" /> '>        
                
        <script src='<c:url value="/resources/js/jquery-3.2.1.js" />'></script>
        <script src='<c:url value="/resources/js/jquery-ui.js" />'></script>
        <script src='<c:url value="/resources/js/jquery.form-validator.min.js" />'></script>
        <script src='<c:url value="/resources/js/bootstrap.js" />'></script>  
        <script src='<c:url value="/resources/js/bootstrap-datepicker.min.js" />'></script>  
        <script src='<c:url value="/resources/js/bootstrap-datepicker.es.min.js" />' charset="UTF-8"></script>
        <script src='<c:url value="/resources/js/paging.js" />'></script> 
        <script src='<c:url value="/resources/js/bootstrap-select.js" />'></script>
        <script src='<c:url value="/resources/js/knockout-3.4.2.js" />'></script>
        <script src='<c:url value="/resources/js/sb-admin-2.js" />'></script>
        <script src='<c:url value="/resources/js/menu.js" />'></script>
        <script src='<c:url value="/resources/js/metisMenu.min.js" />'></script>
        <script src='<c:url value="/resources/js/jquery.formatCurrency-1.4.0.min.js" />'></script>
        <script src='<c:url value="/resources/js/jquery.dataTables.min.js" />'></script>
        <script src='<c:url value="/resources/js/dataTables.fixedColumns.min.js" />'></script>
        <script src='<c:url value="/resources/js/dataTables.buttons.min.js" />'></script>
        <script src='<c:url value="/resources/js/buttons.html5.min.js" />'></script>
        <script src='<c:url value="/resources/js/buttons.print.min.js" />'></script>
        <script src='<c:url value="/resources/js/jszip.min.js" />'></script>
        <script src='<c:url value="/resources/js/raphael-min.js" />'></script>
        <script src='<c:url value="/resources/js/morris.js" />'></script>
        <script src='<c:url value="/resources/js/chart.loader.js" />'></script>
    </head>
    <body>
        <header id="header">
            <div id="contenedorPpal">

                <div id="contenedorA">
                    <!-- inicio Menu Navegación-->
                    <div id='cssmenu'>
                        <ul>
                            <li>
                                <span class="imagenMenu">
                                    <img src='<c:url value="/resources/imagenes/logoUdeaMenu.png" />'>
                                </span> 
                            </li>
                            <li><a href='#' onclick="abrirOpcion('/index'); return false;"><i class="fa fa-user fa-fw"></i>Home</a></li>
                            <tiles:insertAttribute name="menu" />
                        </ul>
                    </div>
                    <!-- Fin Menu Navegación-->
                </div>
                <div id="contenedorB">

                    <div id="contenedorC">
                        <!-- notificaciones-->
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                            </a>
                            <!-- perfil-->
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="${pageContext.request.contextPath}/login/cambiarClave"><i class="fa fa-key fa-fw"></i> Cambio de clave</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/usuarios/editar"><i class="fa fa-gear fa-fw"></i> Actualización de datos</a>
                                </li>
                            </ul>
                            <!-- /.dropdown-user -->
                        </li>
                    </div>
                    <div id="contenedorC">
                        <a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out fa-fw"></i> Salir</a>
                    </div>
                </div>
            </div>
        </header>
        <section id="site-content">
            <br>
            <br>
            <br>                
            <tiles:insertAttribute name="body" />
        </section>
        <footer id="footer">
            <tiles:insertAttribute name="footer" />
        </footer>
        <script type="text/javascript">
            function abrirOpcion(opcion) {
                window.location.href = '${pageContext.request.contextPath}' + opcion;
            }
        </script>    
    </body>
</html>