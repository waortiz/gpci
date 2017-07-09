<%-- 
    Document   : error
    Created on : 08-jul-2017, 22:38:40
    Author     : William
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
    <head>
        <title>GPCI: Gesti�n de Proyectos</title>
        <link rel="icon" href='<c:url value="/resources/imagenes/favicon.ico" />' type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/estilos.css" />'>
    </head>
    <body>
        <nav class="navbar barraPrincipal">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#inverseNavbar1" aria-expanded="false">
                        <span class="sr-only"></span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a class="barraPrincipal-text" href="#">GPCI <small> FNSP</small></a>
                </div>
                <div class="collapse navbar-collapse" id="inverseNavbar1">

                    <ul class="nav navbar-nav navbar-right">

                    </ul>

                </div>
            </div>
        </nav>
        <div class="container">
            <div class="container-fluid"> 
                <p align="center" style="margin-top:20px;"><img src='<c:url value="/resources/imagenes/logo-udea.png"/>' width="371" height="103" alt="U de A"></p>
            </div>
            <br />
            <table class='table table-hover' style='font-size:12px;'> 
                <tr>
                    <td><strong>${errorMsg}</strong></td>
                </tr>
            </table>
            <script src='<c:url value="/resources/js/jquery-3.2.1.js" />'></script>
            <script src='<c:url value="/resources/js/jquery-ui.js" />'></script>
            <script src='<c:url value="/resources/js/bootstrap.js" />'></script>  
</html>