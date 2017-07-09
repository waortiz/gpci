<%-- 
    Document   : proyectos
    Created on : 14-may-2017, 19:26:44
    Author     : William
--%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<html><!-- InstanceBegin template="/Templates/tema1.dwt.php" codeOutsideHTMLIsLocked="false" -->
    <head>
        <title>GPCI: Gestión de Proyectos</title>
        <link rel="icon" href='<c:url value="/resources/imagenes/favicon.ico" />' type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/estilos.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/bootstrap-datepicker3.min.css" />'>
        <link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/paging.css" />'>
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
            <c:if test = "${not empty mensaje}">
                <div class="alert alert-success">
                    ${mensaje}
                </div>
            </c:if>            
            <div class = "panel panel-success">
                <div class = "panel-heading ">PROYECTOS</div>   
                <div class = "panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1success">
                            <form:form method="POST" action="${pageContext.request.contextPath}/novedades/buscarProyectos" modelAttribute="busquedaProyectos">
                                <table class='table table-hover' style='font-size:12px;'> 
                                    <tr  class='text-success'>
                                        <td style="vertical-align: middle">Fecha inicial:</td>
                                        <td>
                                            <div class="input-group date">
                                                <form:input path="fechaInicio" class="form-control datepicker" data-validation="required" data-validation-error-msg="Debe ingresar la fecha de inicio" readonly="true" />
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                            </div>
                                        </td>
                                        <td style="vertical-align: middle">Fecha final:</td>
                                        <td>
                                            <div class="input-group date">
                                                <form:input path="fechaFinal" class="form-control datepicker" data-date-format="dd/mm/yyyy" data-validation="required" data-validation-error-msg="Debe ingresar fecha de fin" readonly="true"/>
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                            </div>
                                        </td>
                                        <td>
                                            <input type="submit" value="Buscar" class="btn-sm btn-success" />
                                        </td>
                                    </tr>
                                </table>
                                <table class='table table-hover' style='font-size:12px;' id="proyectos"> 
                                     <thead>
                                        <tr  class='text-success'>
                                            <th width='20%'>Nombre corto</th>
                                            <th width='15%'>Fecha de creación</th> 
                                            <th width='15%'>Fecha de inicio</th> 
                                            <th width='15%'>Fecha finalizaci&oacute;n</th> 
                                            <th width='15%'>Tipo de proyecto</th> 
                                            <th width='10%'>Estado</th> 
                                            <th width='10%'>Modificar</th> 
                                        </tr> 
                                    </thead>
                                    <c:if test = "${proyectos.size() > 0}">
                                       <tbody>
                                        <c:forEach var="proyecto" items="${proyectos}">   
                                            <tr>
                                                <td>
                                                    ${proyecto.getNombreCortoProyecto()}
                                                </td>
                                                <td>
                                                    ${proyecto.getFechaCreacionFormato()}
                                                </td>
                                                <td>
                                                    ${proyecto.getFechaInicioFormato()}
                                                </td>
                                                <td>
                                                    ${proyecto.getFechaFinalizacionFormato()}
                                                </td>
                                                <td>
                                                    ${proyecto.getTipoProyecto()}
                                                </td>   
                                                <td>
                                                    ${proyecto.getEstadoProyecto()}
                                                </td>  
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/novedades/editar/${proyecto.getIdProyecto()}" class="btn-sm btn-warning">Editar</a>
                                                </td>  
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </c:if>
                                    <c:if test = "${proyectos.size() == 0}">
                                        <tfoot> 
                                            <tr>
                                                <td colspan="7">No se encontraron proyectos</td>
                                            </tr>
                                        </tfoot> 
                                    </c:if>
                                    </table> 
                            </form:form>
                        </div>
                    </div>
                </div>
                <table class='table table-hover' style='font-size:12px;'> 
                    <tr>
                        <td align="right">
                            <a href='crear'  title='Registrar Proyecto' >
                                <input type='button' class='btn-sm btn-success' value='Registrar Proyecto' />
                            </a> 
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <script src='<c:url value="/resources/js/jquery-3.2.1.js" />'></script>
        <script src='<c:url value="/resources/js/jquery-ui.js" />'></script>
        <script src='<c:url value="/resources/js/jquery.form-validator.min.js" />'></script>
        <script src='<c:url value="/resources/js/bootstrap.js" />'></script>  
        <script src='<c:url value="/resources/js/bootstrap-datepicker.min.js" />'></script>  
        <script src='<c:url value="/resources/js/bootstrap-datepicker.es.min.js" />' charset="UTF-8"></script>
        <script type="text/javascript" src='<c:url value="/resources/js/paging.js" />'></script> 
        <script type="text/javascript">
            $(document).ready(function () {
                $('#proyectos').paging({limit: 5});
            });

            $.validate({
                validateOnBlur: false, // disable validation when input looses focus
                errorMessagePosition: 'top', // Instead of 'inline' which is default
                scrollToTopOnError: false // Set this property to true on longer forms
            });

            $('.input-group.date').datepicker({
                language: "es",
                autoclose: true,
                format: "dd/mm/yyyy",
                todayHighlight: true
            });
        </script>
    </body>
</html>
